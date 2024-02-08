<?php

namespace App\Http\Controllers\Admin;

use App\Enums\UserStatus;
use App\Http\Controllers\BackendController;
use App\Http\Requests\AdminUserRequest;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use Yajra\Datatables\Datatables;
use Illuminate\Support\Facades\DB;


class AdminUserController extends BackendController
{
    public function __construct()
    {
        $this->data['sitetitle'] = 'Administrator';

        $this->middleware(['permission:adminusers'])->only('index');
        $this->middleware(['permission:adminusers_create'])->only('create', 'store');
        $this->middleware(['permission:adminusers_edit'])->only('edit', 'update');
        $this->middleware(['permission:adminusers_delete'])->only('destroy');
        $this->middleware(['permission:adminusers_show'])->only('show');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sitetitle = 'Administrator';
    
        $createdUsers = DB::table('users')
            ->orderBy('created_at', 'desc')
            ->take(5) // Adjust the number of recently created users you want to display
            ->get();
    
        return view('admin.adminuser.index', compact('sitetitle', 'createdUsers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.adminuser.create', $this->data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(AdminUserRequest $request)
    {
        // Validate the request data
        $validatedData = $request->validate([
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|email|unique:admin_users,email',
            'password' => 'required|string|min:6',
            'phone' => 'nullable|string',
            'address' => 'nullable|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
    
         // Insert data into the 'admin_users' table using the Query Builder
        DB::table('admin_users')->insert([
            'first_name' => $validatedData['first_name'],
            'last_name' => $validatedData['last_name'],
            'email' => $validatedData['email'],
            'username' => $validatedData['username'] ?? $this->generateUsername($validatedData['email']),
            'password' => Hash::make($validatedData['password']),
            'phone' => $validatedData['phone'],
            'address' => $validatedData['address'],
            'status' => 99, // Adjust the status based on your requirements
            // Add other fields as needed
        ]);

    
        // Add user image if provided
        if ($request->hasFile('image')) {
            $user->addMedia($request->file('image'))->toMediaCollection('user');
        }
    
        // Assign a default role (adjust the role ID as needed)
        $role = Role::find(3);
        $user->assignRole($role->name);
    
        // Fetch the created user with eager-loaded relationships
        $createdUser = AdminUser::with('roles')->find($user->id);
    
        // Redirect with success message and the new user details
        return redirect(route('admin.adminusers.index'))
            ->withSuccess('The data was inserted successfully.')
            ->with('newUser', $createdUser);
    }
    

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $this->data['user'] = User::find($id);

        return $this->data['user']
            ? view('admin.adminuser.show', $this->data)
            : redirect()->route('admin.adminuser.index');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit($id)
    {
        $user = User::find($id);
        $this->data['user'] = $user;
        return view('admin.adminuser.edit', $this->data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

     public function update(AdminUserRequest $request, $id)
     {
         $user = User::find($id);
 
         $user->update([
             'first_name' => $request->first_name,
             'last_name' => $request->last_name,
             'email' => $request->email,
             'username' => $request->username ?? $this->generateUsername($request->email),
             'password' => $request->password ? Hash::make($request->password) : $user->password,
             'phone' => $request->phone,
             'address' => $request->address,
             'status' => $user->id != 1 ? 5 : UserStatus::ACTIVE,
         ]);
 
         if ($request->file('image')) {
             $user->media()->delete();
             $user->addMedia($request->file('image'))->toMediaCollection('user');
         }
 
         return redirect(route('admin.adminusers.index'))->withSuccess('The Data Updated Successfully');
     }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function destroy($id)
    {
        $user = User::find($id);
        
        if ($user && $user->id != 1 && auth()->id() == 1) {
            $user->delete();
            return redirect(route('admin.adminusers.index'))->withSuccess('The Data Deleted Successfully');
        }
        
        // Handle unauthorized deletion or other conditions
        return redirect(route('admin.adminusers.index'))->with('error', 'Unable to delete the user.');
    }

    public function getAdminUsers()
    {
        $role           = Role::find(1);
        $roleTwo        = Role::find(3);
        $users     = User::role([$role->name,$roleTwo->name])->latest()->get();
        $userArray = [];

        $i = 1;
        if (!blank($users)) {
            foreach ($users as $user) {
                $userArray[$i]          = $user;
                $userArray[$i]['setID'] = $i;
                $i++;
            }
        }
        return Datatables::of($userArray)
            ->addColumn('action', function ($user) {
                $retAction = '';
                if (($user->id == auth()->id()) && (auth()->id() == 1)) {
                    if (auth()->user()->can('adminusers_show')) {
                        $retAction .= '<a href="' . route('admin.adminusers.show', $user) . '" class="btn btn-sm btn-icon float-left btn-info" data-toggle="tooltip" data-placement="top" title="View"><i class="far fa-eye"></i></a>';
                    }

                    if (auth()->user()->can('adminusers_edit')) {
                        $retAction .= '<a href="' . route('admin.adminusers.edit', $user) . '" class="btn btn-sm btn-icon float-left btn-primary ml-2" data-toggle="tooltip" data-placement="top" title="Edit"><i class="far fa-edit"></i></a>';
                    }
                } else if (auth()->id() == 1) {
                    if (auth()->user()->can('adminusers_show')) {
                        $retAction .= '<a href="' . route('admin.adminusers.show', $user) . '" class="btn btn-sm btn-icon float-left btn-info" data-toggle="tooltip" data-placement="top" title="View"><i class="far fa-eye"></i></a>';
                    }

                    if (auth()->user()->can('adminusers_edit')) {
                        $retAction .= '<a href="' . route('admin.adminusers.edit', $user) . '" class="btn btn-sm btn-icon float-left btn-primary ml-2" data-toggle="tooltip" data-placement="top" title="Edit"><i class="far fa-edit"></i></a>';
                    }

                    if (auth()->user()->can('adminusers_delete')) {
                        $retAction .= '<form class="float-left pl-2" action="' . route('admin.adminusers.destroy', $user) . '" method="POST">' . method_field('DELETE') . csrf_field() . '<button class="btn btn-sm btn-icon btn-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></button></form>';
                    }
                } else {
                    if ($user->id == 1) {
                        if (auth()->user()->can('adminusers_show')) {
                            $retAction .= '<a href="' . route('admin.adminusers.show', $user) . '" class="btn btn-sm btn-icon float-left btn-info" data-toggle="tooltip" data-placement="top" title="View"><i class="far fa-eye"></i></a>';
                        }
                    } else {
                        if (auth()->user()->can('adminusers_show')) {
                            $retAction .= '<a href="' . route('admin.adminusers.show', $user) . '" class="btn btn-sm btn-icon float-left btn-info" data-toggle="tooltip" data-placement="top" title="View"><i class="far fa-eye"></i></a>';
                        }

                        if (auth()->user()->can('adminusers_edit')) {
                            $retAction .= '<a href="' . route('admin.adminusers.edit', $user) . '" class="btn btn-sm btn-icon float-left btn-primary ml-2"><i class="far fa-edit"></i></a>';
                        }
                    }
                }

                return $retAction;
            })
            ->addColumn('image', function ($user) {
                return '<figure class="avatar mr-2"><img src="' . $user->images . '" alt=""></figure>';
            })
            ->addColumn('name', function ($user) {
                return $user->name;
            })
            ->editColumn('id', function ($user) {
                return $user->setID;
            })
            ->escapeColumns([])
            ->make(true);
    }

    private function generateUsername($email)
    {
        $emails = explode('@', $email);
        return $emails[0] . mt_rand();
    }
}
