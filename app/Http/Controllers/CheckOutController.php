<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;


use App\Models\Visitor;

class CheckOutController extends Controller
{
    public function index()
    {
        return view('frontend.check-out.index');
    }

    public function fetchSearchResults(Request $request)
    {
        $request->validate([
            'search' => 'required',
        ]);

        $searchTerm = $request->input('search');

        // Adjust the model and column names based on your actual setup
        $results = Visitor::where('email', $searchTerm)
            ->orWhere(function ($query) use ($searchTerm) {
                $query->where('first_name', 'like', "%$searchTerm%")
                    ->orWhere('last_name', 'like', "%$searchTerm%");
            })
            ->get();

        return view('frontend.check-out.search', compact('results'));
    }
}
