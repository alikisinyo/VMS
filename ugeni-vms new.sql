-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2024 at 05:28 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ugeni-vms`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `checkin_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkout_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `backend_menus`
--

CREATE TABLE `backend_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `backend_menus`
--

INSERT INTO `backend_menus` (`id`, `name`, `link`, `icon`, `status`, `parent_id`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', 'fas fa-laptop', 1, 0, 9000, NULL, NULL),
(2, 'Profile', 'profile', 'far fa-user', 1, 0, 8900, NULL, NULL),
(3, 'Departments', 'departments', 'fas fa-building', 1, 0, 8800, NULL, NULL),
(4, 'Designations', 'designations', 'fas fa-layer-group', 1, 0, 8700, NULL, NULL),
(5, 'Personnel', 'employees', 'fas fa-user-secret', 1, 0, 8600, NULL, NULL),
(6, 'Visitors', 'visitors', 'fas fa-walking', 1, 0, 8600, NULL, NULL),
(7, 'Pre-registers', 'pre-registers', 'fas fa-user-friends', 1, 0, 8600, NULL, NULL),
(8, 'Administrators', 'adminusers', 'fas fa-users', 1, 0, 8500, NULL, NULL),
(9, 'Role', 'role', 'fa fa-star', 1, 0, 2400, NULL, NULL),
(10, 'Settings', 'setting', 'fas fa-cogs', 1, 0, 2400, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `is_pre_register` tinyint(1) NOT NULL,
  `is_group_enabled` tinyint(3) UNSIGNED NOT NULL,
  `invitation_people_count` int(11) NOT NULL DEFAULT 0,
  `accept_invitation_count` int(11) NOT NULL DEFAULT 0,
  `attendee_count` int(11) NOT NULL DEFAULT 0,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(5, 'iMoran', 5, NULL, NULL),
(6, 'IT', 5, NULL, NULL),
(7, 'CSOC', 5, NULL, NULL),
(8, 'Forensics', 5, NULL, NULL),
(9, 'DC', 5, NULL, NULL),
(10, 'Generator', 5, NULL, NULL),
(11, 'Gardener', 5, NULL, NULL),
(12, 'GIS', 5, NULL, NULL),
(13, 'Catering', 5, NULL, NULL),
(14, 'CCTV', 5, NULL, NULL),
(15, 'Targeting', 5, NULL, NULL),
(16, 'MT', 5, NULL, NULL),
(17, 'Store', 5, NULL, NULL),
(18, 'Procurement', 5, NULL, NULL),
(19, 'INT', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(5, 'CO', 5, NULL, NULL),
(6, 'Admin Officer', 5, NULL, NULL),
(7, 'Staff', 5, NULL, NULL),
(8, 'Service Member', 5, NULL, NULL),
(9, 'Officer', 5, NULL, NULL),
(10, 'OC', 5, NULL, NULL),
(11, 'SOI', 5, NULL, NULL),
(12, 'SOII', 5, NULL, NULL),
(13, 'Director', 5, NULL, NULL),
(14, 'Col IT', 5, NULL, NULL),
(15, 'Col Cyber', 5, NULL, NULL),
(16, 'Military Police', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(3) UNSIGNED NOT NULL,
  `official_identification_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_joining` date NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `about` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `phone`, `nickname`, `display_name`, `gender`, `official_identification_number`, `date_of_joining`, `status`, `user_id`, `department_id`, `designation_id`, `about`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(2, 'Japhet', 'Mwasi', '0724871579', NULL, NULL, 5, NULL, '2023-12-01', 5, 4, 5, 8, NULL, 'App\\User', 1, 'App\\User', 1, '2023-12-18 12:21:44', '2023-12-18 12:21:44'),
(3, 'Alex', 'Kiprono', '+254740489464', NULL, NULL, 5, NULL, '2023-12-01', 5, 5, 5, 8, NULL, 'App\\User', 1, 'App\\User', 1, '2023-12-18 12:22:47', '2023-12-18 12:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `checkin_at` datetime DEFAULT NULL,
  `checkout_at` datetime DEFAULT NULL,
  `iuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `collection_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_properties` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsive_images` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `model_type`, `model_id`, `collection_name`, `name`, `file_name`, `mime_type`, `disk`, `size`, `manipulations`, `custom_properties`, `responsive_images`, `order_column`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 1, 'user', '-oYndZ5G', '-oYndZ5G.jpg', 'image/jpeg', 'public', 56060, '[]', '[]', '[]', 1, '2023-12-18 12:14:34', '2023-12-18 12:14:34'),
(2, 'App\\User', 4, 'user', '-oYndZ5G', '-oYndZ5G.jpg', 'image/jpeg', 'public', 56060, '[]', '[]', '[]', 2, '2023-12-18 12:21:44', '2023-12-18 12:21:44');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_25_043002_create_pre_registers_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_04_06_130203_create_designations_table', 1),
(6, '2020_04_06_130245_create_departments_table', 1),
(7, '2020_04_06_130356_create_employees_table', 1),
(8, '2020_04_06_130500_create_attendances_table', 1),
(9, '2020_04_06_130652_create_visitors_table', 1),
(10, '2020_04_06_130653_create_bookings_table', 1),
(11, '2020_04_06_130653_create_visiting_details_table', 1),
(12, '2020_04_06_130654_create_invitations_table', 1),
(13, '2020_04_16_063722_create_settings_table', 1),
(14, '2020_04_16_064701_create_media_table', 1),
(15, '2020_04_16_113855_create_jobs_table', 1),
(16, '2020_05_07_111209_create_notifications_table', 1),
(17, '2020_09_09_043116_create_permission_tables', 1),
(18, '2020_09_10_080029_create_backend_menus_table', 1),
(19, '2020_09_28_181710_alter_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 1),
(3, 'App\\User', 1),
(4, 'App\\User', 1),
(5, 'App\\User', 1),
(6, 'App\\User', 1),
(7, 'App\\User', 1),
(8, 'App\\User', 1),
(9, 'App\\User', 1),
(10, 'App\\User', 1),
(11, 'App\\User', 1),
(12, 'App\\User', 1),
(13, 'App\\User', 1),
(14, 'App\\User', 1),
(15, 'App\\User', 1),
(16, 'App\\User', 1),
(17, 'App\\User', 1),
(18, 'App\\User', 1),
(19, 'App\\User', 1),
(20, 'App\\User', 1),
(21, 'App\\User', 1),
(22, 'App\\User', 1),
(23, 'App\\User', 1),
(24, 'App\\User', 1),
(25, 'App\\User', 1),
(26, 'App\\User', 1),
(27, 'App\\User', 1),
(28, 'App\\User', 1),
(29, 'App\\User', 1),
(30, 'App\\User', 1),
(31, 'App\\User', 1),
(32, 'App\\User', 1),
(33, 'App\\User', 1),
(34, 'App\\User', 1),
(35, 'App\\User', 1),
(36, 'App\\User', 1),
(37, 'App\\User', 1),
(38, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(2, 'App\\User', 3),
(2, 'App\\User', 4),
(2, 'App\\User', 5),
(3, 'App\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', NULL, NULL),
(2, 'profile', 'web', NULL, NULL),
(3, 'designations', 'web', NULL, NULL),
(4, 'designations_create', 'web', NULL, NULL),
(5, 'designations_edit', 'web', NULL, NULL),
(6, 'designations_delete', 'web', NULL, NULL),
(7, 'designations_show', 'web', NULL, NULL),
(8, 'departments', 'web', NULL, NULL),
(9, 'departments_create', 'web', NULL, NULL),
(10, 'departments_edit', 'web', NULL, NULL),
(11, 'departments_delete', 'web', NULL, NULL),
(12, 'departments_show', 'web', NULL, NULL),
(13, 'employees', 'web', NULL, NULL),
(14, 'employees_create', 'web', NULL, NULL),
(15, 'employees_edit', 'web', NULL, NULL),
(16, 'employees_delete', 'web', NULL, NULL),
(17, 'employees_show', 'web', NULL, NULL),
(18, 'visitors', 'web', NULL, NULL),
(19, 'visitors_create', 'web', NULL, NULL),
(20, 'visitors_edit', 'web', NULL, NULL),
(21, 'visitors_delete', 'web', NULL, NULL),
(22, 'visitors_show', 'web', NULL, NULL),
(23, 'pre-registers', 'web', NULL, NULL),
(24, 'pre-registers_create', 'web', NULL, NULL),
(25, 'pre-registers_edit', 'web', NULL, NULL),
(26, 'pre-registers_delete', 'web', NULL, NULL),
(27, 'pre-registers_show', 'web', NULL, NULL),
(28, 'adminusers', 'web', NULL, NULL),
(29, 'adminusers_create', 'web', NULL, NULL),
(30, 'adminusers_edit', 'web', NULL, NULL),
(31, 'adminusers_delete', 'web', NULL, NULL),
(32, 'adminusers_show', 'web', NULL, NULL),
(33, 'role', 'web', NULL, NULL),
(34, 'role_create', 'web', NULL, NULL),
(35, 'role_edit', 'web', NULL, NULL),
(36, 'role_delete', 'web', NULL, NULL),
(37, 'role_show', 'web', NULL, NULL),
(38, 'setting', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pre_registers`
--

CREATE TABLE `pre_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `expected_date` date NOT NULL,
  `expected_time` time NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `visitor_id` int(10) UNSIGNED NOT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2021-02-03 23:34:58', '2021-02-03 23:34:58'),
(2, 'Personnel', 'web', '2021-02-03 23:34:58', '2023-12-18 12:12:47'),
(3, 'Officer', 'web', '2021-02-03 23:34:58', '2023-12-18 12:12:55'),
(4, 'Constabularies', 'web', '2023-12-18 12:13:02', '2023-12-18 12:13:02'),
(5, 'Civilian Staff', 'web', '2023-12-18 12:13:14', '2023-12-18 12:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(13, 3),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(17, 3),
(18, 1),
(18, 2),
(18, 3),
(18, 5),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(20, 2),
(20, 3),
(21, 1),
(22, 1),
(22, 2),
(22, 3),
(22, 5),
(23, 1),
(23, 2),
(23, 3),
(23, 5),
(24, 1),
(24, 3),
(25, 1),
(25, 3),
(26, 1),
(27, 1),
(27, 2),
(27, 3),
(27, 5),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`) VALUES
(1, 'site_name', 'Moran Ugeni'),
(2, 'site_email', 'moran@mod.go.ke'),
(3, 'site_phone_number', '2712054'),
(4, 'site_logo', '-oYndZ5G.jpg'),
(5, 'site_footer', 'Moran Center'),
(6, 'site_address', 'Karen, Nairobi'),
(7, 'site_description', 'Ugeni Visitor Management System'),
(8, 'notify_templates', '<p>Hello Employee Someone wants meet you, his/her name is</p>'),
(9, 'notifications_email', '1'),
(10, 'invite_templates', 'Hello'),
(11, 'notifications_sms', '1'),
(12, 'sms_gateway', '1'),
(13, 'front_end_enable_disable', '1'),
(14, 'terms_condition', 'Terms condition'),
(15, 'welcome_screen', '<p>Please tap on button to check-in</p>'),
(16, 'timezone', 'Africa/Nairobi'),
(17, 'twilio_auth_token', ''),
(18, 'twilio_account_sid', ''),
(19, 'twilio_from', ''),
(20, 'twilio_disabled', '1'),
(21, 'mail_host', ''),
(22, 'mail_port', ''),
(23, 'mail_username', ''),
(24, 'mail_password', ''),
(25, 'mail_from_name', ''),
(26, 'mail_from_address', ''),
(27, 'mail_disabled', '1'),
(28, 'purchase_code', ''),
(29, 'purchase_username', ''),
(30, 'visitor_agreement', '0');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `username`, `email_verified_at`, `password`, `phone`, `address`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Moran', 'Admin', 'adminmoran@mod.go.ke', 'admin', NULL, '$2y$10$zTNizUNjbGXM2nJCux0MDeEVXI9y/onw/dvb7pxqV/1xcQLf3j/zm', '2712054', 'Karen, Nairobi', NULL, 'Bqy6HKHSSxi7lln1Q0zPNUhVCN2e46xD79RM61fR4nW57MEZLmLeBBKR4giJ', '2021-02-03 23:35:00', '2023-12-18 12:15:12'),
(2, 'Reception', 'Demo', 'reception@example.com', 'reception', NULL, '$2y$10$L8py.Sy4ZvSnt8aULe9Kz.ZwMseCiCXUkliNFl5/c0y/IfWaIQ2cy', '+15005550008', 'Dhaka, Bangladesh', NULL, 'RZ4gTGuSct', '2021-02-03 23:35:00', '2021-02-03 23:35:00'),
(3, 'Alexandra', 'Doe', 'employee@example.com', 'employee', NULL, '$2y$10$v9RnY7ZCZo6qv8fZoI.6/Ok1OrFP9s55.xUgZR4zrNFWtF90IfSoG', '+15005550007', 'Dhaka, Bangladesh', NULL, 'aX6vn6LmPr', '2021-02-03 23:35:00', '2021-02-03 23:35:00'),
(4, 'Japhet', 'Mwasi', 'mwasij@mod.go.ke', 'mwasi', NULL, '$2y$10$Pqz9Fmt7EKWh5KjlOu9Yo.QhaheKgY6jiOw.BvN0I09Y03ILbrsgu', '0724871579', NULL, NULL, NULL, '2023-12-18 12:21:44', '2023-12-18 12:53:31'),
(5, 'Alex', 'Kiprono', 'lexiekiprono@gmail.com', 'lexiekiprono32650847', NULL, '$2y$10$8nL/./xDp.gIfehV0wMQD.BK6gy8VExNRE6sLQcehoUKGjmHUCFTi', '+254740489464', NULL, NULL, NULL, '2023-12-18 12:22:47', '2023-12-18 12:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `visiting_details`
--

CREATE TABLE `visiting_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reg_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_employee_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkin_at` datetime DEFAULT NULL,
  `checkout_at` datetime DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `visitor_id` bigint(20) UNSIGNED NOT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visiting_details`
--

INSERT INTO `visiting_details` (`id`, `reg_no`, `purpose`, `company_name`, `company_employee_id`, `checkin_at`, `checkout_at`, `status`, `user_id`, `employee_id`, `visitor_id`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, '18122301', 'Contract', 'ALEX SOLUTIONS', NULL, '2023-12-18 15:29:00', NULL, 5, 2, 2, 1, 'App\\User', 4, 'App\\User', 4, '2023-12-18 12:29:08', '2023-12-18 12:29:08'),
(2, '20122302', 'supply', 'alexa', NULL, '2023-12-20 20:46:00', NULL, 5, 3, 3, 2, 'App\\User', 1, 'App\\User', 1, '2023-12-20 17:46:42', '2023-12-20 17:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` tinyint(3) UNSIGNED NOT NULL,
  `address` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_identification_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pre_register` tinyint(1) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint(20) UNSIGNED NOT NULL,
  `editor_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `editor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `first_name`, `last_name`, `email`, `phone`, `gender`, `address`, `national_identification_no`, `is_pre_register`, `status`, `creator_type`, `creator_id`, `editor_type`, `editor_id`, `created_at`, `updated_at`) VALUES
(1, 'Moses', 'Kuria', 'moses@gmail.com', '+254785124698', 5, NULL, '6587465', 0, 5, 'App\\User', 4, 'App\\User', 4, '2023-12-18 12:29:08', '2023-12-18 12:29:08'),
(2, 'Alex', 'Kiprono', 'lexiekiprono@gmail.com', '+254740489464', 5, NULL, '35965998', 0, 5, 'App\\User', 1, 'App\\User', 1, '2023-12-20 17:46:42', '2024-02-07 16:03:25'),
(3, 'Ali', 'Abdalla', 'abdala@gmail.com', '+2547765443', 5, NULL, '1234567890', 0, 5, 'App\\User', 1, 'App\\User', 1, '2024-02-07 11:08:25', '2024-02-07 11:08:25'),
(4, 'Evans', 'Kiprono', 'pevansrono@gmail.com', '+254720460123', 5, '90 evansa', '3840165', 0, 5, 'App\\User', 1, 'App\\User', 1, '2024-02-07 12:30:08', '2024-02-07 13:52:28'),
(5, 'John', 'Doe', 'johndoe@gmail.vom', '+2541032657', 5, NULL, '1254976', 0, 5, 'App\\User', 1, 'App\\User', 1, '2024-02-07 13:01:55', '2024-02-07 13:41:42'),
(6, 'Elon', 'MUSk', 'elonmusk@gmail.vom', '+1325469854', 5, NULL, '1021346', 0, 5, 'App\\User', 1, 'App\\User', 1, '2024-02-07 14:49:28', '2024-02-07 14:49:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `backend_menus`
--
ALTER TABLE `backend_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookings_reg_no_unique` (`reg_no`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `employees_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pre_registers`
--
ALTER TABLE `pre_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pre_registers_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `pre_registers_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `visiting_details`
--
ALTER TABLE `visiting_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visiting_details_reg_no_unique` (`reg_no`),
  ADD KEY `visiting_details_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `visiting_details_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitors_email_unique` (`email`),
  ADD UNIQUE KEY `visitors_phone_unique` (`phone`),
  ADD KEY `visitors_creator_type_creator_id_index` (`creator_type`,`creator_id`),
  ADD KEY `visitors_editor_type_editor_id_index` (`editor_type`,`editor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `backend_menus`
--
ALTER TABLE `backend_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invitations`
--
ALTER TABLE `invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `pre_registers`
--
ALTER TABLE `pre_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `visiting_details`
--
ALTER TABLE `visiting_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
