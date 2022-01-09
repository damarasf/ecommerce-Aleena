-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2022 at 04:22 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aleena_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Alessandra Series', 'alessandra-series', '/storage/photos/1/Banner/Template Banner Damara2.png', '<h6><span style=\"color: rgb(99, 99, 99);\">Lembut dan sangat nyaman untuk formal dan casual</span></h6>', 'active', '2021-11-29 14:01:10', '2021-11-29 14:03:13'),
(6, 'Anggrya Series', 'anggrya-series', '/storage/photos/1/Banner/Template Banner Damara3.png', '<h4><b style=\"\"><span style=\"color: rgb(99, 99, 99); font-family: Verdana;\">DISCOUNT UP TO&nbsp;</span><span style=\"font-family: Verdana; background-color: rgb(255, 156, 0); color: rgb(255, 255, 255);\">70%</span></b></h4>', 'active', '2021-11-29 14:05:24', '2021-11-29 14:12:25');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08'),
(6, 'Brand', 'brand', 'active', '2020-08-17 20:50:31', '2020-08-17 20:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `size` varchar(5) CHARACTER SET utf8mb4 NOT NULL,
  `price` double(20,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `size`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(61, 17, 10, 1, 'L', 165000.00, 'new', 1, 165000.00, '2021-12-08 16:21:46', '2021-12-22 09:08:31'),
(62, 16, 10, 1, 'M', 125000.00, 'new', 1, 125000.00, '2021-12-11 03:55:46', '2021-12-22 09:08:31'),
(63, 11, 10, 1, 'M', 164500.00, 'new', 1, 164500.00, '2021-12-11 03:58:40', '2021-12-22 09:08:31'),
(65, 16, 13, 1, 'M', 125000.00, 'new', 1, 125000.00, '2021-12-22 09:37:19', '2022-01-09 14:44:49'),
(66, 11, 13, 1, 'M', 164500.00, 'new', 1, 164500.00, '2021-12-22 09:37:50', '2022-01-09 14:44:49'),
(67, 13, 12, 2, 'M', 206800.00, 'new', 1, 206800.00, '2022-01-04 04:05:48', '2022-01-04 04:19:09'),
(68, 13, 12, 2, 'XL', 206800.00, 'new', 1, 206800.00, '2022-01-04 04:05:53', '2022-01-04 04:19:09'),
(69, 16, 12, 2, 'M', 125000.00, 'new', 1, 125000.00, '2022-01-04 04:06:23', '2022-01-04 04:19:09'),
(70, 16, 14, 1, 'M', 125000.00, 'new', 1, 125000.00, '2022-01-09 14:45:30', '2022-01-09 14:46:45'),
(71, 15, 14, 1, 'M', 100000.00, 'new', 1, 100000.00, '2022-01-09 14:45:38', '2022-01-09 14:46:45'),
(72, 13, 14, 1, 'L', 206800.00, 'new', 1, 206800.00, '2022-01-09 14:46:02', '2022-01-09 14:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Alessandra Collection', 'alessandra-collection', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Alessandra Series\r\nLembut dan sangat nyaman untuk formal dan casual</span><br></p>', '/storage/photos/1/Category/Alessandra Series.png', 1, NULL, NULL, 'active', '2021-11-29 14:16:32', '2021-11-29 14:16:32'),
(13, 'Anggrya Collection', 'anggrya-collection', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Anggrya Series\r\nLembut dan sangat nyaman untuk formal dan casual </span><br></p>', '/storage/photos/1/Category/Anggrya Collection.png', 1, NULL, NULL, 'active', '2021-11-29 14:17:17', '2021-11-29 14:17:17'),
(14, 'Annata Collection', 'annata-collection', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Annata Series\r\nLembut dan sangat nyaman untuk formal dan casual</span><br></p>', '/storage/photos/1/Category/Annata Collection.png', 1, NULL, NULL, 'active', '2021-11-29 14:17:55', '2021-11-29 14:17:55'),
(16, 'Farikha Collection', 'farikha-collection', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Farikha Series\r\nLembut dan sangat nyaman untuk formal dan casual </span><br></p>', '/storage/photos/1/Category/farikha collection.png', 1, NULL, NULL, 'active', '2021-11-29 14:19:31', '2021-11-29 14:19:31'),
(17, 'Pria', 'pria', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Alessandra Series\r\nLembut dan sangat nyaman untuk formal dan casual</span><br></p>', '/storage/photos/1/Product/2a6df016eab503576155487596bb45ac.JPEG', 0, 12, NULL, 'active', '2021-11-29 14:21:23', '2021-11-29 14:21:23'),
(18, 'Wanita', 'wanita', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Alessandra Series\r\nLembut dan sangat nyaman untuk formal dan casual</span><br></p>', '/storage/photos/1/Product/2a6df016eab503576155487596bb45ac.JPEG', 0, 12, NULL, 'active', '2021-11-29 14:21:49', '2021-11-29 14:22:01');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,0) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(6, 'damaraccd', 'percent', '50', 'inactive', '2021-11-29 16:00:36', '2021-12-08 14:34:56'),
(7, 'flash', 'fixed', '20000', 'inactive', '2021-11-29 16:58:30', '2021-12-08 14:35:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(5, 'damara', 'Tidak Bisa Mengakses Web', 'damaraccd12@gmail.com', NULL, '081319916659', '51515161156156115656', '2021-12-08 10:33:41', '2021-12-08 10:33:20', '2021-12-08 10:33:41'),
(6, 'damara', 'Susah', 'user@gmail.com', NULL, '081319916659', 'asfagasdfagasdasdasasdas', '2021-12-08 10:41:58', '2021-12-08 10:41:52', '2021-12-08 10:41:58');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('04e3776a-e9fd-42a7-bf48-543ceebe4e60', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', '2021-11-29 15:26:44', '2021-11-29 15:17:24', '2021-11-29 15:26:44'),
('1fa0eaf0-c780-479e-8dd5-e8fff763d47f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', '2021-12-08 10:26:22', '2021-11-29 16:36:31', '2021-12-08 10:26:22'),
('33a886a0-9472-4b41-a056-465ab0cf3c61', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/farikha-green\",\"fas\":\"fa-star\"}', '2021-11-29 15:26:47', '2021-11-29 15:05:55', '2021-11-29 15:26:47'),
('381f5bdb-6dbf-428b-acd0-5050bf4cd3b2', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}', NULL, '2022-01-09 14:46:45', '2022-01-09 14:46:45'),
('6a6224cb-9a18-4679-afad-1854ab746266', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/farikha-yellow\",\"fas\":\"fa-star\"}', NULL, '2021-11-29 15:04:32', '2021-11-29 15:04:32'),
('89e25494-9aac-4bca-b618-55be775af975', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/farikha-blue\",\"fas\":\"fa-star\"}', '2021-12-08 11:19:12', '2021-11-29 15:05:08', '2021-12-08 11:19:12'),
('8b48af49-98e6-44cf-ba08-ef489cb2a9a6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', NULL, '2022-01-04 04:19:09', '2022-01-04 04:19:09'),
('a140b56f-5aa6-41e6-a57e-014b55847221', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}', NULL, '2022-01-09 14:44:49', '2022-01-09 14:44:49'),
('aa1c96bb-c0f1-4517-98e0-dce0873c6a91', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2022-01-04 04:09:30', '2022-01-04 04:09:30'),
('b26abbd5-bcb7-4177-9d92-0f5f5a3f180c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', '2021-12-22 09:08:38', '2021-12-22 09:08:31', '2021-12-22 09:08:38'),
('b6186a3b-d480-4929-b299-50bdc3dd88e0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/httpscfshopeecoidfileb8f9739784b5b2c77679e57019544a1e\",\"fas\":\"fas fa-comment\"}', '2021-12-07 10:23:41', '2021-11-30 01:44:03', '2021-12-07 10:23:41'),
('ec6cfcc3-cc22-4984-b0e9-198c6362704d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', '2021-12-07 13:36:50', '2021-11-30 01:41:31', '2021-12-07 13:36:50'),
('f148082f-2424-485d-8867-d83da8b6b89e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/farikha-yellow\",\"fas\":\"fa-star\"}', NULL, '2021-11-29 15:04:06', '2021-11-29 15:04:06'),
('f6c8d679-c302-4dba-a884-19dde062983a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/farikha-yellow\",\"fas\":\"fa-star\"}', NULL, '2021-11-29 15:04:22', '2021-11-29 15:04:22'),
('fbe1ea34-70f1-4137-9fef-ca69966af943', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', '2021-12-22 09:08:42', '2021-12-08 14:35:49', '2021-12-22 09:08:42');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(20,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(10,2) DEFAULT NULL,
  `total_amount` double(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','transfer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(7, 'ORD-SCRAIZVPK7', 1, 100000.00, 7, 50000.00, 58000.00, 1, 'cod', 'unpaid', 'delivered', 'Damara', 'Syaidil', 'damaraccd12@gmail.com', '081319916659', 'ID', '14105', 'Griya Persada Elok Blok B no 27', 'gpe', '2021-11-29 16:36:31', '2021-12-07 13:53:50'),
(8, 'ORD-R2SHQG6CTC', 1, 125000.00, 7, 20000.00, 113000.00, 1, 'cod', 'unpaid', 'delivered', 'Damara', 'Syaidil', 'damaraccd12@gmail.com', '2332', 'ID', '14105', 'Griya Persada Elok Blok B no 27', 'gpe', '2021-11-30 01:41:31', '2021-12-07 13:53:55'),
(10, 'ORD-7Q1H5W3IYY', 1, 454500.00, 6, NULL, 457500.00, 3, 'cod', 'unpaid', 'delivered', 'Damara', 'Syaidil', 'damaraccd12@gmail.com', '081319916659', 'ID', '14105', 'Griya Persada Elok Blok B no 27', 'gpe', '2021-12-22 09:08:30', '2021-12-22 09:09:00'),
(12, 'ORD-PU47XDA4ZG', 2, 538600.00, 6, NULL, 541600.00, 3, 'cod', 'unpaid', 'new', 'Damara', 'Syaidil', 'damaraccd12@gmail.com', '081319916659', 'ID', '14105', 'Griya Persada Elok Blok B no 27', 'gpe', '2022-01-04 04:19:09', '2022-01-04 04:19:09'),
(13, 'ORD-QMF3N0QVUW', 1, 289500.00, NULL, NULL, 289500.00, 2, 'transfer', 'unpaid', 'new', 'Damara', 'Syaidil', 'damaraccd12@gmail.com', '081319916659', 'ID', '14105', 'Griya Persada Elok Blok B no 27', 'gpe', '2022-01-09 14:44:48', '2022-01-09 14:44:48'),
(14, 'ORD-DMZLH6YQZ4', 1, 431800.00, 6, NULL, 434800.00, 3, 'transfer', 'unpaid', 'new', 'Damara', 'Syaidil', 'damaraccd12@gmail.com', '081319916659', 'ID', '14105', 'Griya Persada Elok Blok B no 27', 'gpe', '2022-01-09 14:46:45', '2022-01-09 14:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(5) NOT NULL,
  `price` double(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Aleena Byand #Kinasih - Mint', 'aleena-byand-kinasih-mint', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Kinasih Series\r\nHijab instant yang lembut dan sangat nyaman untuk gaya formal dan casual </span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Kinasih Series\r\nHijab instant yang lembut dan sangat nyaman untuk gaya formal dan casual \r\n\r\nBahan: Diamond Crepe\r\nWarna: Mint\r\nUkuran: \r\nPanjang depan 65cm \r\nPanjang belakang 95cm \r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabInstant #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungBergo #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '<p>New Items!!!</p>', '/storage/photos/1/Blog/e7876c4714f2daf22f201d85269b1cba.JPEG', 'New!!', 6, NULL, 1, 'active', '2021-11-29 14:56:42', '2021-11-29 15:00:51'),
(8, 'Aleena Byand #Kinasih - Toska', 'httpscfshopeecoidfileb8f9739784b5b2c77679e57019544a1e', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Kinasih Series\r\nHijab instant yang lembut dan sangat nyaman untuk gaya formal dan casual </span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Kinasih Series\r\nHijab instant yang lembut dan sangat nyaman untuk gaya formal dan casual \r\n\r\nBahan: Diamond Crepe\r\nWarna: Toska\r\nUkuran: \r\nPanjang depan 65cm \r\nPanjang belakang 95cm \r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabInstant #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungBergo #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '<p>New Items!!!</p>', '/storage/photos/1/Blog/b8f9739784b5b2c77679e57019544a1e.JPEG', 'New!!', 6, NULL, 1, 'active', '2021-11-29 14:58:49', '2021-11-29 15:00:39');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Kinasih Collection', 'kinasih-collection', 'active', '2021-11-29 14:54:17', '2021-11-29 14:54:17'),
(7, 'Lorem Ipsum', 'lorem-ipsum', 'active', '2021-11-29 14:54:24', '2021-11-29 14:54:24'),
(8, 'Lorem Ipsum 1', 'lorem-ipsum-1', 'active', '2021-11-29 14:54:28', '2021-11-29 14:54:28');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(8, 1, 8, 'good', 'active', NULL, NULL, '2021-11-30 01:44:03', '2021-11-30 01:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'New!!', 'new', 'active', '2021-11-29 14:54:38', '2021-11-29 14:54:38');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(20,2) NOT NULL,
  `discount` double(20,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, 'Farikha - Blue', 'farikha-blue', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Alessandra Series\r\nLembut dan sangat nyaman untuk formal dan casual</span></p><p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Bahan: Voal Ultrasatin\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Blue</span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Farikha Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrasatin\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Blue\r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabSegiEmpat #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungSegiEmpat #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '/storage/photos/1/Product/04c6835c9ecd8c22f22b1773582b3b56.JPEG', 9, 'S,M,L,XL', 'new', 'active', 235000.00, 30.00, 1, 16, NULL, NULL, '2021-11-29 14:24:46', '2021-12-22 09:09:00'),
(12, 'Farikha - Grey', 'farikha-grey', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Farikha Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrasatin\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Grey</span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Farikha Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrasatin\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Grey\r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabSegiEmpat #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungSegiEmpat #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '/storage/photos/1/Product/1e9630dcd1e38c48bd0c1c01e393592f.JPEG', 0, 'M,L', 'default', 'active', 235000.00, 0.00, 0, 16, NULL, NULL, '2021-11-29 14:38:23', '2021-11-29 15:17:40'),
(13, 'Farikha - Green', 'farikha-green', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Farikha Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrasatin\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Green</span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Farikha Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrasatin\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Green\r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabSegiEmpat #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungSegiEmpat #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '/storage/photos/1/Product/cde8600005ea2e1bf649a3e4f2a6c64e.JPEG', 7, 'M,L,XL', 'default', 'active', 235000.00, 12.00, 0, 16, NULL, NULL, '2021-11-29 14:40:25', '2021-11-29 14:40:25'),
(14, 'Farikha - Yellow', 'farikha-yellow', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Farikha Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrasatin\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Yellow</span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Farikha Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrasatin\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Yellow\r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabSegiEmpat #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungSegiEmpat #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '/storage/photos/1/Product/38632a7d8cee22601699b4b7ceb73364.JPEG', 15, 'L', 'hot', 'active', 235000.00, 25.00, 0, 16, NULL, NULL, '2021-11-29 14:44:31', '2021-11-29 14:44:31'),
(15, 'Alessandra - Mustard', 'alessandra-mustard', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Alessandra Series\r\nHijab Insant yang lembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Diamond Crepe\r\nWarna: Mustard\r\nUkuran: \r\nPanjang depan 65cm \r\nPanjang belakang 95cm </span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Alessandra Series\r\nHijab Insant yang lembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Diamond Crepe\r\nWarna: Mustard\r\nUkuran: \r\nPanjang depan 65cm \r\nPanjang belakang 95cm \r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabInstant #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungBergo #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '/storage/photos/1/Product/9b5227b8735aefd49ece2a94885d8eea.JPEG', 39, 'S,M', 'default', 'active', 125000.00, 20.00, 1, 12, 18, NULL, '2021-11-29 14:46:56', '2021-12-07 13:53:50'),
(16, 'Alessandra - Purple', 'alessandra-purple', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Alessandra Series\r\nHijab instant yang lembut dan sangat nyaman untuk gaya formal dan casual \r\n\r\nBahan: Diamond Crepe\r\nWarna: Purple\r\nUkuran: \r\nPanjang depan 65cm \r\nPanjang belakang 95cm </span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Alessandra Series\r\nHijab instant yang lembut dan sangat nyaman untuk gaya formal dan casual \r\n\r\nBahan: Diamond Crepe\r\nWarna: Purple\r\nUkuran: \r\nPanjang depan 65cm \r\nPanjang belakang 95cm \r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabInstant #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungBergo #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '/storage/photos/1/Product/0cad0686dc6df0e2cd4fd256ebcac47c.JPEG', 13, 'M', 'new', 'active', 125000.00, 0.00, 0, 12, 17, NULL, '2021-11-29 14:48:34', '2021-12-22 09:09:00'),
(17, 'Anggrya - Navy', 'anggrya-navy', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Anggrya Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrafine\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Navy</span><br></p>', '<p><span style=\"color: rgba(0, 0, 0, 0.8); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, 文泉驛正黑, &quot;WenQuanYi Zen Hei&quot;, &quot;Hiragino Sans GB&quot;, &quot;儷黑 Pro&quot;, &quot;LiHei Pro&quot;, &quot;Heiti TC&quot;, 微軟正黑體, &quot;Microsoft JhengHei UI&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 14px; white-space: pre-wrap;\">Aleena by Andriana - Anggrya Series\r\nLembut dan sangat nyaman untuk formal dan casual \r\n\r\nBahan: Voal Ultrafine\r\nUkuran: 140 x 140 cm\r\nFinshing: Laser cut\r\nWarna: Navy\r\n\r\nCatatan: Terdapat perbedaan warna tergantung dengan resolusi/setting layar Anda. Secara general, warna asli lebih gelap daripada foto.\r\nSilahkan Chat penjual sebelum membeli.\r\n\r\n#HijabSegiEmpat #Aleena #AleenaByand #HijabMurah #HijabTrendi #KerudungSegiEmpat #HijabGaya #HijabCantik #Casual #Formal #Hijab #Kerudung #Scarf #Lebaran #MuslimWear#HijabPastel #WarnaPastel #JilbabPastel #JilbabCasual #JilbabFormal</span><br></p>', '/storage/photos/1/Product/98b3861371f06f2c5c39ea456de5e7f8.JPEG', 15, 'S,M,L', 'hot', 'active', 275000.00, 40.00, 0, 13, NULL, NULL, '2021-11-29 14:50:32', '2021-12-22 09:09:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, 14, 5, 'good', 'active', '2021-11-29 15:04:06', '2021-11-29 15:04:06'),
(4, 1, 14, 4, 'nice', 'active', '2021-11-29 15:04:22', '2021-11-29 15:04:22'),
(5, 1, 14, 2, 'noob', 'active', '2021-11-29 15:04:32', '2021-11-29 15:04:32'),
(6, 1, 11, 5, 'GG', 'active', '2021-11-29 15:05:08', '2021-11-29 15:05:08'),
(7, 1, 13, 2, 'Ga suka ewh', 'active', '2021-11-29 15:05:55', '2021-11-29 15:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Aleena by Adriana', 'Aleena by Adriana', '/storage/photos/1/logo fix.png', '/storage/photos/1/95389420_109035787460733_8612397842188730368_n.jpg', 'Griya Persada Elok Blok B no. 27', '+62 813-8725-0084', 'aleenabyand@gmail.com', NULL, '2021-11-29 13:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,0) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'SiCepat', '6000', 'active', '2021-11-29 15:18:10', '2021-11-29 15:18:10'),
(6, 'JNE', '3000', 'active', '2021-11-29 15:24:35', '2021-11-29 15:24:35'),
(7, 'AnterAja', '8000', 'active', '2021-11-29 15:24:41', '2021-11-29 15:24:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Damaraccd', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/95389420_109035787460733_8612397842188730368_n.jpg', 'admin', NULL, NULL, 'active', 'JT89zCovnwDpwhLaiRQVX3tZY4Rs8g6X25CNmR4og0t1BWPT5ULS8gno4pqE', NULL, '2021-11-30 01:22:54'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', NULL, 'user', NULL, NULL, 'active', NULL, NULL, '2021-12-07 15:34:01'),
(30, 'Damara Syaidil F', 'damaraccd11@gmail.com', NULL, '$2y$10$hHS6.q8AuZf6Zp8ZIUGTgugNjyN7KPZLk7mcgvVChmOIwrTAN5YUi', NULL, 'user', NULL, NULL, 'active', 'phdKAr0PkFR2mkF16koEwd2Yjid9f4Mv25dXjEAcsOwvt1M9LA90iugsIeU1', '2021-11-29 15:25:56', '2021-11-30 01:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(20,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(7, 15, NULL, 1, 100000.00, 1, 100000.00, '2021-12-08 16:22:43', '2021-12-08 16:22:43'),
(8, 11, NULL, 1, 164500.00, 1, 164500.00, '2021-12-11 03:58:47', '2021-12-11 03:58:47'),
(9, 16, NULL, 2, 125000.00, 1, 125000.00, '2022-01-04 04:02:00', '2022-01-04 04:02:00'),
(10, 17, NULL, 2, 165000.00, 1, 165000.00, '2022-01-04 04:02:10', '2022-01-04 04:02:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderit_product_id_foreign` (`product_id`) USING BTREE,
  ADD UNIQUE KEY `orderit_order_number_unique` (`order_number`) USING BTREE,
  ADD UNIQUE KEY `ordeit_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `carts` (`product_id`),
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`order_number`) REFERENCES `orders` (`order_number`),
  ADD CONSTRAINT `order_items_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `orders` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
