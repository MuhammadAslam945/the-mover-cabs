-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 13, 2022 at 01:16 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delvrifood`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) NOT NULL,
  `current_balance` decimal(24,2) NOT NULL,
  `amount` decimal(24,2) NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_ons`
--

CREATE TABLE `add_ons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `add_ons`
--

INSERT INTO `add_ons` (`id`, `name`, `price`, `created_at`, `updated_at`, `store_id`, `status`) VALUES
(1, 'Mushroom', '0.90', '2022-08-29 09:34:26', '2022-08-29 09:34:26', 10, 1),
(2, 'Broccoli', '0.60', '2022-08-29 09:34:47', '2022-08-29 09:34:47', 10, 1),
(3, 'Fresh Coriander', '0.60', '2022-08-29 09:35:23', '2022-08-29 09:35:23', 10, 1),
(4, 'Asparagus', '0.90', '2022-08-29 09:35:41', '2022-08-29 09:35:41', 10, 1),
(5, 'Baby Corn', '0.60', '2022-08-29 09:35:56', '2022-08-29 09:35:56', 10, 1),
(6, 'Fried Garlic', '0.60', '2022-08-29 09:36:15', '2022-08-29 09:36:15', 10, 1),
(7, 'Crushed Peanuts', '0.50', '2022-08-29 09:36:45', '2022-08-29 09:36:45', 10, 1),
(8, 'Fried Onions', '0.50', '2022-08-29 09:37:06', '2022-08-29 09:37:06', 10, 1),
(9, 'Shredded Duck', '2.75', '2022-08-29 09:37:26', '2022-08-29 09:37:26', 10, 1),
(10, 'Tiger Prawns', '2.75', '2022-08-29 09:37:53', '2022-08-29 09:37:53', 10, 1),
(11, 'Salmon Chunks', '3.00', '2022-08-29 09:38:13', '2022-08-29 09:38:13', 10, 1),
(12, 'Extra Jasmin Rice', '2.00', '2022-08-29 09:38:31', '2022-08-29 09:38:31', 10, 1),
(13, 'Extra Chicken', '2.00', '2022-08-29 09:38:47', '2022-08-29 09:38:47', 10, 1),
(14, 'Extra Beef', '2.00', '2022-08-29 09:39:05', '2022-08-29 09:39:05', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `zone_id`) VALUES
(1, 'Adeel', 'Ashraf', '03137388266', 'info@delvri.com', NULL, '$2y$10$cjkeZ8uyHFzWAf5LEQ8LCOhmtmxo5w2iV0SqSQ0Kc41uPw/kII.la', 'tz8kVLvBqu0pShWMX3w2gwRnlv2VQeqVIJqoXUzpDzs9hyvWKCwN2T0vSmWn', '2022-08-24 09:09:19', '2022-08-24 09:09:19', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `modules`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master admin', NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `total_commission_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `digital_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `manual_received` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `type`, `image`, `status`, `data`, `created_at`, `updated_at`, `zone_id`, `module_id`, `featured`) VALUES
(5, 'food', 'store_wise', '2022-08-24-63063982cd0f2.png', 1, '9', '2022-08-24 09:45:22', '2022-08-24 09:45:22', 1, 1, 0),
(7, 'Flames-Food', 'store_wise', '2022-08-24-63063f285adea.png', 1, '10', '2022-08-24 10:09:28', '2022-08-24 10:09:28', 1, 1, 0),
(9, 'Flames-Food', 'store_wise', '2022-08-24-63067252772dd.png', 1, '10', '2022-08-24 13:47:46', '2022-08-24 13:47:46', 1, 1, 0),
(10, 'Flames-Food', 'store_wise', '2022-08-24-63067269e331c.png', 1, '10', '2022-08-24 13:48:09', '2022-08-24 13:48:09', 1, 1, 0),
(11, 'KFC', 'store_wise', '2022-08-24-630673cdc96c7.png', 1, '9', '2022-08-24 13:54:05', '2022-08-24 13:54:05', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PKR',
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pakistan',
  `language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_zone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_schedule` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_confirmation` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `dm_status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `store_cancel_order` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deliveryman_cancel_order` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `earning_status_deliverman_app` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `admin_order_notification` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `customer_verfication` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_delivery_cerification` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `veg` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `store_registration` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deliveryman_registration` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_slot_duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '30',
  `digit_after_decimal_point` int(11) NOT NULL DEFAULT 0,
  `admin_commission` int(11) NOT NULL DEFAULT 10,
  `free_delivery_over` decimal(8,2) NOT NULL DEFAULT 100.00,
  `minimum_delivery_charges` decimal(8,2) NOT NULL DEFAULT 10.00,
  `per_km_charges` decimal(8,2) NOT NULL DEFAULT 1.00,
  `maximam_orders_deliveryman` int(11) NOT NULL DEFAULT 2,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+92',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_api_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_us` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `privacy_policy` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digital_payment` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cash_on_delivery` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `stripe` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `stripe_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_api_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mail_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_host` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_driver` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_port` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_username` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_encryption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_project_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `push_notification_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terms_and_conditions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_pending_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_pending_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_confirmation_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_confirmation_msg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_processing_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_processing_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `out_for_delivery_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `out_for_delivery_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_delivered_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_delivered_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_boy_assign_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `delivery_boy_assign_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_boy_start_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `delivery_boy_start_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_boy_delivered_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `delivery_boy_delivered_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssl_commerz_payment_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ssl_commerz_payment_store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ssl_commerz_payment_store_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razor_pay_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `razor_pay_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razor_pay_secret_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `paypal_client_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paypal_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `paystack_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_secret_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paystack_email` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senang_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `senang_secret_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senang_public_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_handover_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_handover_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_cancled_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `order_cancled_message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_type` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `twilo_sid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilo_messaging_service_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilo_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilo_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twilo_otp_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maintenance_mode` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `app_minimum_version_ios` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_minimum_version_android` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_url_ios` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_url_android` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `popular_food` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `popular_restaurant` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `new_restaurant` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mercadopago_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `most_reviewed_foods` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `mercadopago_public_key` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mercadopago_access_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_charge` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wallet_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `loyalty_point_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ref_earning_status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `wallet_add_refund` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `loyalty_point_exchange_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ref_earning_exchange_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `loyalty_point_item_purchase_point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `loyalty_point_minimum_point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `created_at`, `updated_at`, `name`, `currency`, `currency_symbol`, `country`, `language`, `time_zone`, `time_format`, `order_schedule`, `order_confirmation`, `dm_status`, `store_cancel_order`, `deliveryman_cancel_order`, `earning_status_deliverman_app`, `admin_order_notification`, `customer_verfication`, `order_delivery_cerification`, `veg`, `store_registration`, `deliveryman_registration`, `order_slot_duration`, `digit_after_decimal_point`, `admin_commission`, `free_delivery_over`, `minimum_delivery_charges`, `per_km_charges`, `maximam_orders_deliveryman`, `phone`, `email`, `address`, `latitude`, `longitude`, `footer`, `logo`, `icon`, `map_api_key`, `about_us`, `privacy_policy`, `digital_payment`, `cash_on_delivery`, `stripe`, `stripe_key`, `stripe_api_key`, `mail_config`, `mail_from`, `mail_host`, `mail_driver`, `mail_port`, `mail_username`, `mail_id`, `mail_encryption`, `mail_password`, `fcm_project_id`, `push_notification_key`, `terms_and_conditions`, `order_pending_status`, `order_pending_message`, `order_confirmation_status`, `order_confirmation_msg`, `order_processing_status`, `order_processing_message`, `out_for_delivery_status`, `out_for_delivery_message`, `order_delivered_status`, `order_delivered_message`, `delivery_boy_assign_status`, `delivery_boy_assign_message`, `delivery_boy_start_status`, `delivery_boy_start_message`, `delivery_boy_delivered_status`, `delivery_boy_delivered_message`, `ssl_commerz_payment_status`, `ssl_commerz_payment_store_id`, `ssl_commerz_payment_store_password`, `razor_pay_status`, `razor_pay_key`, `razor_pay_secret_key`, `paypal_status`, `paypal_client_id`, `paypal_secret`, `paystack_status`, `paystack_key`, `paystack_secret_key`, `paystack_url`, `paystack_email`, `senang_status`, `senang_secret_key`, `senang_public_key`, `order_handover_status`, `order_handover_message`, `order_cancled_status`, `order_cancled_message`, `app_url`, `sms_type`, `twilo_sid`, `twilo_messaging_service_id`, `twilo_token`, `twilo_from`, `twilo_otp_template`, `maintenance_mode`, `app_minimum_version_ios`, `app_minimum_version_android`, `app_url_ios`, `app_url_android`, `popular_food`, `popular_restaurant`, `new_restaurant`, `mercadopago_status`, `most_reviewed_foods`, `mercadopago_public_key`, `mercadopago_access_token`, `service_charge`, `wallet_status`, `loyalty_point_status`, `ref_earning_status`, `wallet_add_refund`, `loyalty_point_exchange_rate`, `ref_earning_exchange_rate`, `loyalty_point_item_purchase_point`, `loyalty_point_minimum_point`) VALUES
(1, '2022-08-31 03:53:45', '2022-09-13 04:47:55', 'delvri', 'PKR', NULL, 'PK', 'en-GB', 'Asia/Karachi', '1', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '35', 2, 12, '400.00', '15.00', '1.00', 5, '+923106473564', 'muhaffan945@gmail.com', 'Hussnain town street 4', '31.578433596123507', '74.35003468399842', 'copyright', '1662362860.jpg', '1662362860.svg', 'AIzaSyBSbNX2uAKZC7P0DJCCBzaDlu9HWsvlg7A', NULL, NULL, '0', '0', '0', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, '0', NULL, NULL, '0', NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', NULL, NULL, '0', NULL, '0', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', '0', '0', '0', '0', NULL, NULL, NULL, '0', '0', '0', '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaign_store`
--

CREATE TABLE `campaign_store` (
  `campaign_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `parent_id`, `position`, `status`, `created_at`, `updated_at`, `priority`, `module_id`) VALUES
(1, 'Fast Food', '2022-08-24-63063ad07b042.png', 0, 0, 1, '2022-08-24 09:50:56', '2022-08-24 09:50:56', 0, 1),
(2, 'Malta Food', '2022-08-24-63063b1b75164.png', 0, 0, 1, '2022-08-24 09:52:11', '2022-08-24 09:52:11', 0, 1),
(3, 'Pasta', 'def.png', 1, 1, 1, '2022-08-24 09:53:26', '2022-08-24 09:53:26', 0, 1),
(4, 'Pizza', 'def.png', 1, 1, 1, '2022-08-24 09:53:32', '2022-08-24 09:53:32', 0, 1),
(5, 'Salads', 'def.png', 1, 1, 1, '2022-08-24 09:53:39', '2022-08-24 09:53:39', 0, 1),
(6, 'Platters', 'def.png', 1, 1, 1, '2022-08-24 09:53:47', '2022-08-24 09:53:47', 0, 1),
(7, 'Sides', 'def.png', 1, 1, 1, '2022-08-24 09:53:53', '2022-08-24 09:53:53', 0, 1),
(8, 'italian Food', '2022-08-24-63063b9290300.png', 0, 0, 1, '2022-08-24 09:54:10', '2022-08-24 09:54:10', 0, 1),
(9, 'Deserts', 'def.png', 1, 1, 1, '2022-08-24 09:54:11', '2022-08-24 09:54:11', 0, 1),
(10, 'Beverages', 'def.png', 1, 1, 1, '2022-08-24 09:54:29', '2022-08-24 09:54:29', 0, 1),
(11, 'Pakistani Food', '2022-08-24-63063bc35329e.png', 0, 0, 1, '2022-08-24 09:54:59', '2022-08-24 09:54:59', 0, 1),
(12, 'Breakfast', 'def.png', 1, 1, 1, '2022-08-24 09:55:05', '2022-08-24 09:55:05', 0, 1),
(13, 'Sandwiches', 'def.png', 1, 1, 1, '2022-08-24 09:55:14', '2022-08-24 09:55:14', 0, 1),
(14, 'Chinese Food', '2022-08-24-63063c003ba47.png', 0, 0, 1, '2022-08-24 09:56:00', '2022-08-24 09:56:00', 0, 1),
(15, 'French Food', '2022-08-24-63063da35650a.png', 0, 0, 1, '2022-08-24 10:02:59', '2022-08-24 10:02:59', 0, 1),
(16, 'Box Meals', 'def.png', 1, 1, 1, '2022-08-24 13:57:44', '2022-08-24 13:57:44', 0, 1),
(17, 'Food', '2022-08-25-63077e6c0e387.png', 0, 0, 1, '2022-08-25 18:51:40', '2022-08-25 18:51:40', 0, 1),
(18, 'Beverages', '2022-08-25-63077f148ed28.png', 0, 0, 1, '2022-08-25 18:54:28', '2022-08-25 18:54:28', 0, 1),
(19, 'Deserts', '2022-08-25-63077f94c02f7.png', 0, 0, 1, '2022-08-25 18:56:36', '2022-08-25 18:56:36', 0, 1),
(20, 'Cakes', 'def.png', 1, 1, 1, '2022-08-25 18:57:32', '2022-08-25 18:57:32', 0, 1),
(21, 'Fresh Lemonades', 'def.png', 18, 1, 1, '2022-08-25 19:02:39', '2022-08-25 19:02:39', 0, 1),
(22, 'smoothies', 'def.png', 18, 1, 1, '2022-08-25 19:03:13', '2022-08-25 19:03:13', 0, 1),
(23, 'Juices', 'def.png', 18, 1, 1, '2022-08-25 19:03:26', '2022-08-25 19:03:26', 0, 1),
(24, 'Ice Cream Shakes', 'def.png', 18, 1, 1, '2022-08-25 19:03:39', '2022-08-26 14:43:58', 0, 1),
(25, 'Hot Beverages', 'def.png', 18, 1, 1, '2022-08-25 19:04:00', '2022-08-25 19:04:00', 0, 1),
(26, 'Tea', 'def.png', 18, 1, 1, '2022-08-25 19:04:11', '2022-08-25 19:04:11', 0, 1),
(27, 'Cold Beverages', 'def.png', 18, 1, 1, '2022-08-25 19:04:33', '2022-08-25 19:04:33', 0, 1),
(28, 'Breakfast', 'def.png', 17, 1, 1, '2022-08-26 15:13:00', '2022-08-26 15:13:00', 0, 1),
(29, 'Turkish', '2022-08-26-6308ac718c676.png', 0, 0, 1, '2022-08-26 16:20:17', '2022-08-26 16:20:17', 0, 1),
(30, 'Breakfast', 'def.png', 29, 1, 1, '2022-08-26 16:20:35', '2022-08-26 16:20:35', 0, 1),
(32, 'Doner Kebabs, Wraps & Pitas', 'def.png', 1, 1, 1, '2022-08-27 13:34:27', '2022-08-27 13:50:58', 0, 1),
(33, 'Burgers', 'def.png', 1, 1, 1, '2022-08-27 14:26:21', '2022-08-27 14:26:21', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `coupon_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `limit` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_uses` bigint(20) DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_rate` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency_code`, `currency_symbol`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'US Dollar', 'USD', '$', '1.00', NULL, NULL),
(2, 'Canadian Dollar', 'CAD', 'CA$', '1.00', NULL, NULL),
(3, 'Euro', 'EUR', '€', '1.00', NULL, NULL),
(4, 'United Arab Emirates Dirham', 'AED', 'د.إ.‏', '1.00', NULL, NULL),
(5, 'Afghan Afghani', 'AFN', '؋', '1.00', NULL, NULL),
(6, 'Albanian Lek', 'ALL', 'L', '1.00', NULL, NULL),
(7, 'Armenian Dram', 'AMD', '֏', '1.00', NULL, NULL),
(8, 'Argentine Peso', 'ARS', '$', '1.00', NULL, NULL),
(9, 'Australian Dollar', 'AUD', '$', '1.00', NULL, NULL),
(10, 'Azerbaijani Manat', 'AZN', '₼', '1.00', NULL, NULL),
(11, 'Bosnia-Herzegovina Convertible Mark', 'BAM', 'KM', '1.00', NULL, NULL),
(12, 'Bangladeshi Taka', 'BDT', '৳', '1.00', NULL, NULL),
(13, 'Bulgarian Lev', 'BGN', 'лв.', '1.00', NULL, NULL),
(14, 'Bahraini Dinar', 'BHD', 'د.ب.‏', '1.00', NULL, NULL),
(15, 'Burundian Franc', 'BIF', 'FBu', '1.00', NULL, NULL),
(16, 'Brunei Dollar', 'BND', 'B$', '1.00', NULL, NULL),
(17, 'Bolivian Boliviano', 'BOB', 'Bs', '1.00', NULL, NULL),
(18, 'Brazilian Real', 'BRL', 'R$', '1.00', NULL, NULL),
(19, 'Botswanan Pula', 'BWP', 'P', '1.00', NULL, NULL),
(20, 'Belarusian Ruble', 'BYN', 'Br', '1.00', NULL, NULL),
(21, 'Belize Dollar', 'BZD', '$', '1.00', NULL, NULL),
(22, 'Congolese Franc', 'CDF', 'FC', '1.00', NULL, NULL),
(23, 'Swiss Franc', 'CHF', 'CHf', '1.00', NULL, NULL),
(24, 'Chilean Peso', 'CLP', '$', '1.00', NULL, NULL),
(25, 'Chinese Yuan', 'CNY', '¥', '1.00', NULL, NULL),
(26, 'Colombian Peso', 'COP', '$', '1.00', NULL, NULL),
(27, 'Costa Rican Colón', 'CRC', '₡', '1.00', NULL, NULL),
(28, 'Cape Verdean Escudo', 'CVE', '$', '1.00', NULL, NULL),
(29, 'Czech Republic Koruna', 'CZK', 'Kč', '1.00', NULL, NULL),
(30, 'Djiboutian Franc', 'DJF', 'Fdj', '1.00', NULL, NULL),
(31, 'Danish Krone', 'DKK', 'Kr.', '1.00', NULL, NULL),
(32, 'Dominican Peso', 'DOP', 'RD$', '1.00', NULL, NULL),
(33, 'Algerian Dinar', 'DZD', 'د.ج.‏', '1.00', NULL, NULL),
(34, 'Estonian Kroon', 'EEK', 'kr', '1.00', NULL, NULL),
(35, 'Egyptian Pound', 'EGP', 'E£‏', '1.00', NULL, NULL),
(36, 'Eritrean Nakfa', 'ERN', 'Nfk', '1.00', NULL, NULL),
(37, 'Ethiopian Birr', 'ETB', 'Br', '1.00', NULL, NULL),
(38, 'British Pound Sterling', 'GBP', '£', '1.00', NULL, NULL),
(39, 'Georgian Lari', 'GEL', 'GEL', '1.00', NULL, NULL),
(40, 'Ghanaian Cedi', 'GHS', 'GH¢', '1.00', NULL, NULL),
(41, 'Guinean Franc', 'GNF', 'FG', '1.00', NULL, NULL),
(42, 'Guatemalan Quetzal', 'GTQ', 'Q', '1.00', NULL, NULL),
(43, 'Hong Kong Dollar', 'HKD', 'HK$', '1.00', NULL, NULL),
(44, 'Honduran Lempira', 'HNL', 'L', '1.00', NULL, NULL),
(45, 'Croatian Kuna', 'HRK', 'kn', '1.00', NULL, NULL),
(46, 'Hungarian Forint', 'HUF', 'Ft', '1.00', NULL, NULL),
(47, 'Indonesian Rupiah', 'IDR', 'Rp', '1.00', NULL, NULL),
(48, 'Israeli New Sheqel', 'ILS', '₪', '1.00', NULL, NULL),
(49, 'Indian Rupee', 'INR', '₹', '1.00', NULL, NULL),
(50, 'Iraqi Dinar', 'IQD', 'ع.د', '1.00', NULL, NULL),
(51, 'Iranian Rial', 'IRR', '﷼', '1.00', NULL, NULL),
(52, 'Icelandic Króna', 'ISK', 'kr', '1.00', NULL, NULL),
(53, 'Jamaican Dollar', 'JMD', '$', '1.00', NULL, NULL),
(54, 'Jordanian Dinar', 'JOD', 'د.ا‏', '1.00', NULL, NULL),
(55, 'Japanese Yen', 'JPY', '¥', '1.00', NULL, NULL),
(56, 'Kenyan Shilling', 'KES', 'Ksh', '1.00', NULL, NULL),
(57, 'Cambodian Riel', 'KHR', '៛', '1.00', NULL, NULL),
(58, 'Comorian Franc', 'KMF', 'FC', '1.00', NULL, NULL),
(59, 'South Korean Won', 'KRW', 'CF', '1.00', NULL, NULL),
(60, 'Kuwaiti Dinar', 'KWD', 'د.ك.‏', '1.00', NULL, NULL),
(61, 'Kazakhstani Tenge', 'KZT', '₸.', '1.00', NULL, NULL),
(62, 'Lebanese Pound', 'LBP', 'ل.ل.‏', '1.00', NULL, NULL),
(63, 'Sri Lankan Rupee', 'LKR', 'Rs', '1.00', NULL, NULL),
(64, 'Lithuanian Litas', 'LTL', 'Lt', '1.00', NULL, NULL),
(65, 'Latvian Lats', 'LVL', 'Ls', '1.00', NULL, NULL),
(66, 'Libyan Dinar', 'LYD', 'د.ل.‏', '1.00', NULL, NULL),
(67, 'Moroccan Dirham', 'MAD', 'د.م.‏', '1.00', NULL, NULL),
(68, 'Moldovan Leu', 'MDL', 'L', '1.00', NULL, NULL),
(69, 'Malagasy Ariary', 'MGA', 'Ar', '1.00', NULL, NULL),
(70, 'Macedonian Denar', 'MKD', 'Ден', '1.00', NULL, NULL),
(71, 'Myanma Kyat', 'MMK', 'K', '1.00', NULL, NULL),
(72, 'Macanese Pataca', 'MOP', 'MOP$', '1.00', NULL, NULL),
(73, 'Mauritian Rupee', 'MUR', 'Rs', '1.00', NULL, NULL),
(74, 'Mexican Peso', 'MXN', '$', '1.00', NULL, NULL),
(75, 'Malaysian Ringgit', 'MYR', 'RM', '1.00', NULL, NULL),
(76, 'Mozambican Metical', 'MZN', 'MT', '1.00', NULL, NULL),
(77, 'Namibian Dollar', 'NAD', 'N$', '1.00', NULL, NULL),
(78, 'Nigerian Naira', 'NGN', '₦', '1.00', NULL, NULL),
(79, 'Nicaraguan Córdoba', 'NIO', 'C$', '1.00', NULL, NULL),
(80, 'Norwegian Krone', 'NOK', 'kr', '1.00', NULL, NULL),
(81, 'Nepalese Rupee', 'NPR', 'Re.', '1.00', NULL, NULL),
(82, 'New Zealand Dollar', 'NZD', '$', '1.00', NULL, NULL),
(83, 'Omani Rial', 'OMR', 'ر.ع.‏', '1.00', NULL, NULL),
(84, 'Panamanian Balboa', 'PAB', 'B/.', '1.00', NULL, NULL),
(85, 'Peruvian Nuevo Sol', 'PEN', 'S/', '1.00', NULL, NULL),
(86, 'Philippine Peso', 'PHP', '₱', '1.00', NULL, NULL),
(87, 'Pakistani Rupee', 'PKR', 'Rs', '1.00', NULL, NULL),
(88, 'Polish Zloty', 'PLN', 'zł', '1.00', NULL, NULL),
(89, 'Paraguayan Guarani', 'PYG', '₲', '1.00', NULL, NULL),
(90, 'Qatari Rial', 'QAR', 'ر.ق.‏', '1.00', NULL, NULL),
(91, 'Romanian Leu', 'RON', 'lei', '1.00', NULL, NULL),
(92, 'Serbian Dinar', 'RSD', 'din.', '1.00', NULL, NULL),
(93, 'Russian Ruble', 'RUB', '₽.', '1.00', NULL, NULL),
(94, 'Rwandan Franc', 'RWF', 'FRw', '1.00', NULL, NULL),
(95, 'Saudi Riyal', 'SAR', 'ر.س.‏', '1.00', NULL, NULL),
(96, 'Sudanese Pound', 'SDG', 'ج.س.', '1.00', NULL, NULL),
(97, 'Swedish Krona', 'SEK', 'kr', '1.00', NULL, NULL),
(98, 'Singapore Dollar', 'SGD', '$', '1.00', NULL, NULL),
(99, 'Somali Shilling', 'SOS', 'Sh.so.', '1.00', NULL, NULL),
(100, 'Syrian Pound', 'SYP', 'LS‏', '1.00', NULL, NULL),
(101, 'Thai Baht', 'THB', '฿', '1.00', NULL, NULL),
(102, 'Tunisian Dinar', 'TND', 'د.ت‏', '1.00', NULL, NULL),
(103, 'Tongan Paʻanga', 'TOP', 'T$', '1.00', NULL, NULL),
(104, 'Turkish Lira', 'TRY', '₺', '1.00', NULL, NULL),
(105, 'Trinidad and Tobago Dollar', 'TTD', '$', '1.00', NULL, NULL),
(106, 'New Taiwan Dollar', 'TWD', 'NT$', '1.00', NULL, NULL),
(107, 'Tanzanian Shilling', 'TZS', 'TSh', '1.00', NULL, NULL),
(108, 'Ukrainian Hryvnia', 'UAH', '₴', '1.00', NULL, NULL),
(109, 'Ugandan Shilling', 'UGX', 'USh', '1.00', NULL, NULL),
(110, 'Uruguayan Peso', 'UYU', '$', '1.00', NULL, NULL),
(111, 'Uzbekistan Som', 'UZS', 'so\'m', '1.00', NULL, NULL),
(112, 'Venezuelan Bolívar', 'VEF', 'Bs.F.', '1.00', NULL, NULL),
(113, 'Vietnamese Dong', 'VND', '₫', '1.00', NULL, NULL),
(114, 'CFA Franc BEAC', 'XAF', 'FCFA', '1.00', NULL, NULL),
(115, 'CFA Franc BCEAO', 'XOF', 'CFA', '1.00', NULL, NULL),
(116, 'Yemeni Rial', 'YER', '﷼‏', '1.00', NULL, NULL),
(117, 'South African Rand', 'ZAR', 'R', '1.00', NULL, NULL),
(118, 'Zambian Kwacha', 'ZMK', 'ZK', '1.00', NULL, NULL),
(119, 'Zimbabwean Dollar', 'ZWL', 'Z$', '1.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `address_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `floor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_wallets`
--

CREATE TABLE `delivery_man_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `earning` tinyint(1) NOT NULL DEFAULT 1,
  `current_orders` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'zone_wise',
  `store_id` bigint(20) DEFAULT NULL,
  `application_status` enum('approved','denied','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `assigned_order_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `min_purchase` decimal(24,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `d_m_reviews`
--

CREATE TABLE `d_m_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_verifications`
--

CREATE TABLE `email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `scategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `available_time_starts` time DEFAULT NULL,
  `available_time_ends` time DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `avg_rating` double(16,14) NOT NULL DEFAULT 0.00000000000000,
  `rating_count` int(11) NOT NULL DEFAULT 0,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `description`, `image`, `category_id`, `scategory_id`, `variations`, `add_ons`, `attributes`, `choice_options`, `price`, `tax`, `tax_type`, `discount`, `discount_type`, `available_time_starts`, `available_time_ends`, `veg`, `status`, `store_id`, `created_at`, `updated_at`, `order_count`, `avg_rating`, `rating_count`, `rating`, `module_id`, `stock`, `unit_id`, `images`) VALUES
(1, 'Spaghetti Bolognese', '<p><strong>Slow cooked minced beef rag&ugrave; in tomato sauce, fresh basil</strong></p>', '1661795123f.jpg', 1, '3', '[]', '1,3,4', '[]', '[]', '12.00', '12.00', 'percent', '2.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 10:06:30', '2022-08-29 13:03:22', 0, 0.00000000000000, 0, NULL, 1, 12, 2, ',16617962020.jpg,16617962021.png,16617962022.png,16617962023.png,16617962024.png'),
(3, 'Penne Chicken', '<p style=\"text-align: justify; padding-left: 80px;\"><strong>Chicken, mushrooms, cream and fresh parsley</strong></p>', '2022-08-24-63063fc00b462.png', 1, '16', '[]', '1,5,8', '[]', '[]', '12.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-24 10:12:00', '2022-08-29 13:15:47', 0, 0.00000000000000, 0, NULL, 1, 0, 1, ',16617969470.png,16617969471.png,16617969472.png,16617969473.png'),
(4, 'Flames Penne Arrabbiata', '<p>Chili sauce, garlic, olive oil, chilli, black olives, tomato sauce, fresh basil</p>', '2022-08-24-6306401ac1fd9.png', 1, NULL, '[]', '1,2,3', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-24 10:13:30', '2022-08-29 13:18:35', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '16617971154.jpg,'),
(5, 'Spaghetti Algio Oglio e Pepperoncino', '<p>Olive oil, garlic, chilli, fresh herbs</p>', '2022-08-24-63064072cf9fd.png', 1, NULL, '[]', '5,8,12', '[]', '[]', '8.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 10:14:58', '2022-08-29 13:20:12', 0, 0.00000000000000, 0, NULL, 1, 0, 2, '16617972120.jpg,16617972121.jpg,16617972122.jpg,'),
(6, 'Penne Flames Galore', 'Tomato sauce, Beef sausage, onions, garlic, sundried tomatoes, cream, topped with parmesan shavings', '2022-08-24-630640e4de1de.png', 1, NULL, '[]', '1,7,13', '[]', '[]', '10.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-24 10:16:52', '2022-08-29 13:24:27', 0, 0.00000000000000, 0, NULL, 1, 0, 3, '16617974670.png,16617974671.png,16617974672.png,16617974673.png'),
(7, 'Spaghetti Salmone', '<p>Smoke Salmon, Onion, tomatoes, cream and caviar</p>', '2022-08-24-6306412249faa.png', 1, NULL, '[]', '1,2,3', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-24 10:17:54', '2022-08-29 13:27:08', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, ' , 16617976280.png , 16617976281.png , 16617976282.png'),
(8, 'Margherita', 'Tomato sauce, mozzarella, oregano', '2022-08-24-630662ba50924.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '7.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 12:41:14', '2022-08-24 12:41:14', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(9, 'Funghi', 'Tomato sauce, mozzarella, mushrooms, oregano', '2022-08-24-630663193fc07.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 12:42:49', '2022-08-24 12:42:49', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(10, 'Flames Tear-and-share pizza rolls', 'Tomato sauce, cheesy mozzarella crust and olives, Oregano', '2022-08-24-630665a0bd0b7.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '10.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 12:53:36', '2022-08-24 12:53:36', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(11, 'Napolitana', 'Tomato sauce, mozzarella, anchovies, olives, capers and oregano', '2022-08-24-630665b0dde6e.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '10.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 12:53:52', '2022-08-24 12:53:52', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(12, 'Veggie', 'Tomato sauce, mozzarella, marrows, cherry tomatoes, mushrooms, green peppers, olives, oregano', '2022-08-24-6306662764f39.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 12:55:51', '2022-08-24 12:55:51', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(13, 'Capriciosa', 'Tomato sauce, mozzarella, mushrooms, thin roast beef, eggs, olives, oregano', '2022-08-24-6306667d67062.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '10.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 12:57:17', '2022-08-24 12:57:17', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(14, 'Quattro Formaggi', 'Tomato sauce, mozzarella, brie, feta and parmesan', '2022-08-24-630667205c8ad.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:00:00', '2022-08-24 13:00:00', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(15, 'Peperoni', 'Tomato sauce, mozzarella, Turkish Salami, chilli, jalapenos, bell peppers, oregano', '2022-08-24-630667a2e06ad.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:02:10', '2022-08-24 13:02:10', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(16, 'Maltese', 'Tomato sauce, mozzarella, aubergines, egg, onions, chilli, bell peppers, pepper goat cheese, sun dried tomatoes,  oregano', '2022-08-24-63066814c9f6f.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-24 13:04:04', '2022-08-24 13:04:04', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(17, 'Calzone', 'Mozzarella, Turkish Salami, eggs, mushrooms, oregano.  Topped with tomato sauce', '2022-08-24-630668645de61.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:05:24', '2022-08-24 13:05:24', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(18, 'Flames Deluxe', 'Tomato sauce, mozzarella, mix of doner meats (Lamb and Chicken), tomatoes, onions Mushrooms, green pepper', '2022-08-24-630668c66221d.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:07:02', '2022-08-24 13:07:02', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(19, 'Doner Pizza', 'Mozzarella, mix of doner meats (Lamb and Chicken), tomatoes, onions, mushrooms, green pepper', '2022-08-24-630669ecb9a40.png', 4, '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:11:56', '2022-08-24 13:11:56', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(20, 'Chicken Caesar Salad', 'Mixed salad leaves, tomatoes, spicy sautéed chicken, anchovies, parmesan shavings, Caesar dressing and black olives and bread croutons', '2022-08-24-63066aa9532d7.png', 5, '[{\"id\":\"1\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:15:05', '2022-08-24 13:15:05', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(21, 'Al Tonno', 'Mixed salad leaves, tuna, capers, red onion, cherry tomatoes, sweet corn and garlic crouton', '2022-08-24-63066b0484828.png', 5, '[{\"id\":\"1\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[]', '[]', '[]', '10.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:16:36', '2022-08-24 13:16:36', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(22, 'Greek Salad', 'Mixed salad leaves, tomatoes, red onion, green olives, feta cheese, sundried tomatoes and dressing', '2022-08-24-63066b4df39ea.png', 5, '[{\"id\":\"1\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[]', '[]', '[]', '10.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:17:50', '2022-08-24 13:17:50', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(23, 'Flames Gym Salad Mixed', 'Mixed salad leaves, tomatoes, cucumber, red onion, sweet corn, kidney beans, green olives, olive oil, vinegar dressing and a lemon wedge', '2022-08-24-63066b950dc4b.png', 5, '[{\"id\":\"1\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[]', '[]', '[]', '10.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:19:01', '2022-08-24 13:19:01', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(24, 'Beef and Egg Salad', 'Mixed salad leaves, beef, boiled egg, , tomatoes, sweet corn and potato salad', '2022-08-24-63066be49defe.png', 5, '[{\"id\":\"1\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:20:20', '2022-08-24 13:20:20', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(25, 'Brie and Smoked Salmon', 'Mixed salad leaves, olives, cherry tomatoes, onions, smoked salmon, brie cheese and caper berries, drizzled with horseradish dressing', '2022-08-24-63066c4e2cd1b.png', 5, '[{\"id\":\"1\",\"position\":1},{\"id\":\"5\",\"position\":2}]', '[]', '[]', '[]', '[]', '12.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:22:06', '2022-08-24 13:22:06', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(26, 'Flames Special Mix', 'Chicken Shish, Beef Shish, 4 Beef Koftas, Mix Doner Meat (Chicken and Lamb)  choices of 4 salads, French fries, Pita Bread, Choice of one Sauce', '2022-08-24-63066fbc0bde0.png', 6, '[{\"id\":\"1\",\"position\":1},{\"id\":\"6\",\"position\":2}]', '[]', '[]', '[]', '[]', '35.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:36:44', '2022-08-24 13:36:44', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(27, 'Greek Mix', 'Tomato rice, tzatziki, 4 chicken souvlaki skewers, 4 beef koftas, 4 lamb chops, red onion, lemon, French fries, parsley and garnish', '2022-08-24-6306703ecb520.png', 6, '[{\"id\":\"1\",\"position\":1},{\"id\":\"6\",\"position\":2}]', '[]', '[]', '[]', '[]', '35.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-24 13:38:54', '2022-08-24 13:38:54', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(28, 'Arabic Mixed Grill', 'Lamb patties, 4 lamb skewers, 4 chicken breast skewers, 125 grams lamb chops, tomatoes, onions', '2022-08-24-6306709ce5dc1.png', 6, '[{\"id\":\"1\",\"position\":1},{\"id\":\"6\",\"position\":2}]', '[]', '[]', '[]', '[]', '32.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-24 13:40:28', '2022-08-24 13:40:28', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(29, 'Flames Gold Chef Grill', '4 Lamb chops, 4 chicken tikka skewers, spicy wings, grilled vegetables skewers, rice, tomato and onion salad', '2022-08-24-630670eedbaad.png', 6, '[{\"id\":\"1\",\"position\":1},{\"id\":\"6\",\"position\":2}]', '[]', '[]', '[]', '[]', '35.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-24 13:41:50', '2022-08-24 13:41:50', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(30, 'CLASSIC BOX', 'Fillet Sandwich, 1 Original Recipe Piece, Portion Small Coleslaw, 50cl Soft Drink, Large Fries', '2022-08-24-630674ccf3fac.png', 16, '[{\"id\":\"1\",\"position\":1},{\"id\":\"16\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 9, '2022-08-24 13:58:21', '2022-08-24 13:59:30', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(31, 'WICKED ZINGER BOX', 'Zinger® Sandwich, 3 Hot Wings, Portion Small Coleslaw, 50cl Soft Drink, Large Fries', '2022-08-24-6306755bd765d.png', 16, '[{\"id\":\"1\",\"position\":1},{\"id\":\"16\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 9, '2022-08-24 14:00:43', '2022-08-24 14:00:43', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(32, 'STEAKHOUSE Rich with a smoky twist', 'A 100% flame-grilled beef patty topped with bacon, cheddar cheese, crispy onion, Western BBQ sauce, lettuce, creamy mayonnaise and tomato. Served in a corn-dusted bun', '2022-08-24-6306776c2fb20.png', 16, '[{\"id\":\"1\",\"position\":1},{\"id\":\"16\",\"position\":2}]', '[]', '[]', '[]', '[]', '11.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 11, '2022-08-24 14:09:32', '2022-08-24 14:09:32', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(33, 'WHOPPER® JR. Big in fire-grilled flavour.', 'Our WHOPPER JR.® Sandwich features one savoury flame-grilled beef patty topped with juicy tomato, fresh cut lettuce, creamy mayonnaise, crunchy pickles, and sliced white onions on a soft sesame seed bun.', '2022-08-24-630677bc1c864.png', 16, '[{\"id\":\"1\",\"position\":1},{\"id\":\"16\",\"position\":2}]', '[]', '[]', '[]', '[]', '12.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 11, '2022-08-24 14:10:52', '2022-08-24 14:10:52', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(34, 'Bowl of Chips', NULL, '2022-08-25-630735ffa2853.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 03:42:40', '2022-08-25 03:42:40', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(35, 'Couscous', NULL, '2022-08-25-6307365db4705.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 03:44:13', '2022-08-25 03:44:13', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(36, 'Coleslaw', NULL, '2022-08-25-630736d05b205.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 03:46:08', '2022-08-25 03:46:08', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(37, 'Portion of Rice', NULL, '2022-08-25-630738006085a.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 03:51:12', '2022-08-25 03:51:12', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(38, 'Potato Salad', NULL, '2022-08-25-6307387a3da4b.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '3.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 03:53:14', '2022-08-25 03:53:14', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(39, 'Side Salad', NULL, '2022-08-25-6307394abe4f2.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '3.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 03:56:42', '2022-08-25 03:56:42', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(40, 'Mixed Salad', NULL, '2022-08-25-6307399896a8d.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 03:58:00', '2022-08-25 03:58:00', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(41, 'Sweet Corn', NULL, '2022-08-25-630739d4a8639.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 03:59:00', '2022-08-25 03:59:00', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(42, 'Red Cabbage', NULL, '2022-08-25-63073a297c06a.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 04:00:25', '2022-08-25 04:00:25', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(43, 'Jalapeños', NULL, '2022-08-25-63073a6bae214.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 04:01:31', '2022-08-25 04:01:31', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(44, 'Kidney beans', NULL, '2022-08-25-63073dc1e7652.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 04:15:45', '2022-08-25 04:15:45', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(45, 'Mixed grilled vegetables', NULL, '2022-08-25-63073e41334f9.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '3.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 04:17:53', '2022-08-25 04:17:53', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(46, 'Cold pasta salad', NULL, '2022-08-25-63073f5315262.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 04:22:27', '2022-08-25 04:22:27', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(47, 'Onions', NULL, '2022-08-25-63073fdc17b29.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 04:24:44', '2022-08-25 04:24:44', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(48, 'Aubergine', NULL, '2022-08-25-63074036d011d.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 04:26:14', '2022-08-25 04:26:14', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(49, 'Large Salad', NULL, '2022-08-25-630740a82496b.png', 7, '[{\"id\":\"1\",\"position\":1},{\"id\":\"7\",\"position\":2}]', '[]', '[]', '[]', '[]', '6.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-25 04:28:08', '2022-08-25 04:28:08', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(50, 'Honey Cake MARLENKA With Walnuts', NULL, '2022-08-25-63077b23c64d5.png', 20, '[{\"id\":\"19\",\"position\":1},{\"id\":\"20\",\"position\":2}]', '[]', '[]', '[]', '[]', '4.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 08:37:40', '2022-08-25 19:00:59', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(51, 'Honey Cake MARLENKA With Cocoa', NULL, '2022-08-25-63077b6f7dc83.png', 20, '[{\"id\":\"19\",\"position\":1},{\"id\":\"20\",\"position\":2}]', '[]', '[]', '[]', '[]', '4.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 08:38:55', '2022-08-25 19:01:23', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(52, 'Lemon Honey Cake MARLENKA', NULL, '2022-08-25-63077badc12d9.png', 20, '[{\"id\":\"19\",\"position\":1},{\"id\":\"20\",\"position\":2}]', '[]', '[]', '[]', '[]', '4.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 08:39:57', '2022-08-25 19:01:39', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(53, 'Gluten Free Honey Cake MARLENKA With Walnuts', NULL, '2022-08-25-63077c03c5648.png', 20, '[{\"id\":\"19\",\"position\":1},{\"id\":\"20\",\"position\":2}]', '[]', '[]', '[]', '[]', '4.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-25 08:41:23', '2022-08-25 19:02:04', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(54, 'Fresh Lemonade', NULL, '2022-08-26-630893798dc57.png', 21, '[{\"id\":\"18\",\"position\":1},{\"id\":\"21\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.75', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:33:45', '2022-08-26 14:33:45', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(55, 'Fresh Mint Lemonade', NULL, '2022-08-26-630893aa687d4.png', 21, '[{\"id\":\"18\",\"position\":1},{\"id\":\"21\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.75', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:34:34', '2022-08-26 14:34:34', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(56, 'Fresh Strawberry Lemonade', NULL, '2022-08-26-630893ea28f4f.png', 21, '[{\"id\":\"18\",\"position\":1},{\"id\":\"21\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.75', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:35:38', '2022-08-26 14:35:38', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(57, 'Mango Lemonade', NULL, '2022-08-26-630894379cfd2.png', 21, '[{\"id\":\"18\",\"position\":1},{\"id\":\"21\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.75', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:36:55', '2022-08-26 14:36:55', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(58, 'Fresh Raspberry Lemonade', NULL, '2022-08-26-630894796d39a.png', 21, '[{\"id\":\"18\",\"position\":1},{\"id\":\"21\",\"position\":2}]', '[]', '[]', '[]', '[]', '2.75', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:38:01', '2022-08-26 14:38:01', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(59, 'Flames Fresh Orange Juice', NULL, '2022-08-26-6308951d54ad8.png', 23, '[{\"id\":\"18\",\"position\":1},{\"id\":\"23\",\"position\":2}]', '[]', '[]', '[]', '[]', '3.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:40:45', '2022-08-26 14:40:45', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(60, 'Vanilla', NULL, '2022-08-26-6308960420490.png', 24, '[{\"id\":\"18\",\"position\":1},{\"id\":\"24\",\"position\":2}]', '[]', '[]', '[]', '[]', '3.30', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:44:36', '2022-08-26 14:44:36', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(61, 'Strawberry', NULL, '2022-08-26-6308963c16755.png', 24, '[{\"id\":\"18\",\"position\":1},{\"id\":\"24\",\"position\":2}]', '[]', '[]', '[]', '[]', '3.30', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:45:32', '2022-08-26 14:45:32', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(62, 'Chocolate', NULL, '2022-08-26-630896665e6d1.png', 24, '[{\"id\":\"18\",\"position\":1},{\"id\":\"24\",\"position\":2}]', '[]', '[]', '[]', '[]', '3.30', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:46:14', '2022-08-26 14:46:14', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(63, 'Yogurt', NULL, '2022-08-26-6308969cf3b54.png', 24, '[{\"id\":\"18\",\"position\":1},{\"id\":\"24\",\"position\":2}]', '[]', '[]', '[]', '[]', '3.30', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-26 14:47:09', '2022-08-26 14:47:09', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(64, 'Cheese Omelette with Toast', 'Served with side salad', '2022-08-26-63089af19d3d9.png', 12, '[{\"id\":\"17\",\"position\":1},{\"id\":\"12\",\"position\":2}]', '[]', '[]', '[]', '[]', '7.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-26 15:05:37', '2022-08-26 15:05:37', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(65, 'Pan-fried egg coated toast', 'Served with topping of your choice:\r\n\r\nSweet – served with honey or raspberry jam and fresh seasonal fruit\r\nSavoury – served with feta cheese, tomatoes, cucumber and olives', '2022-08-26-63089cdb05d52.png', 28, '[{\"id\":\"17\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[]', '[]', '[]', '7.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-26 15:13:47', '2022-08-26 15:13:47', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(66, 'Cheese Veggie Omelette with Toast', 'Served with side salad', '2022-08-26-6308aaa2ed045.png', 28, '[{\"id\":\"17\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[]', '[]', '[]', '7.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-26 16:12:34', '2022-08-26 16:12:34', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(67, 'Turkish Breakfast', 'Fried Eggs (scrambled, fried or boiled) and Sujuk (Turkish Sausage), served with side salad and yogurt.', '2022-08-26-6308ad086915e.png', 30, '[{\"id\":\"29\",\"position\":1},{\"id\":\"30\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-26 16:22:48', '2022-08-26 16:22:48', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(68, 'Cheese Sandwich', 'Cheese, lettuce, tomatoes and French fries', '2022-08-26-6308ae9d1ed2b.png', 13, '[{\"id\":\"1\",\"position\":1},{\"id\":\"13\",\"position\":2}]', '[]', '[]', '[]', '[]', '66.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 1, 1, 10, '2022-08-26 16:29:33', '2022-08-26 16:29:33', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(69, 'Greek Sandwich', 'Feta, tomatoes and french fries', '2022-08-27-6309d21dc8beb.png', 28, '[{\"id\":\"17\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[]', '[]', '[]', '7.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:13:17', '2022-08-27 13:13:17', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(70, 'Tuna and Salad Sandwich', 'Tuna, tomatoes and french fries', '2022-08-27-6309d3e3d9e46.png', 28, '[{\"id\":\"17\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[]', '[]', '[]', '8.00', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:20:51', '2022-08-27 13:20:51', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(71, 'Flames Club Sandwich', 'Chicken, sliced boiled egg, beef, tomatoes, lettuce and  a side of French fries.', '2022-08-27-6309d42a13fb1.png', 12, '[{\"id\":\"1\",\"position\":1},{\"id\":\"12\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:22:02', '2022-08-27 13:22:02', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(72, 'Chicken Breast Sandwich', 'Chicken strips, tomatoes, mayo and french fries', '2022-08-27-6309d47a2cedd.png', 28, '[{\"id\":\"17\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[]', '[]', '[]', '8.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:23:22', '2022-08-27 13:23:22', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(73, 'Beef Sandwich', 'Roast Beef, tomatoes, lettuce,  mayo and fresnch fries', '2022-08-27-6309d4ca36dc4.png', 28, '[{\"id\":\"17\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[]', '[]', '[]', '8.50', '0.00', 'percent', '0.00', 'percent', '08:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:24:42', '2022-08-27 13:24:42', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(74, 'Salmon Sandwich', 'Salmon, brie cheese and nachos', '2022-08-27-6309d583485eb.png', 28, '[{\"id\":\"17\",\"position\":1},{\"id\":\"28\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '22:00:00', 0, 1, 10, '2022-08-27 13:27:47', '2022-08-27 13:27:47', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(75, 'Veggie (Wrap/Pita)', 'Choice of 4 salads and a choice of one sauce: Yogurt/Spicy/Hummus', '2022-08-27-6309d7ffaf11e.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '6.00', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:38:23', '2022-08-27 13:41:08', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(76, 'Falafel (Wrap/Pita)', 'Falafel, choice of 3 salad and a choice of one sauce:  Yogurt/Spicy/hummus', '2022-08-27-6309d89266c31.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '7.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:40:50', '2022-08-27 13:40:50', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(77, 'Chicken Doner (Wrap/Pita)', 'Served with a choice of 3 salads and a choice of one sauce:  yogurt/spicy/hummus', '2022-08-27-6309d933db4f5.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '6.95', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:43:31', '2022-08-27 13:43:31', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(78, 'Lamb Doner (Wrap /Pita', 'Served with a choice of 3 salads and a choice of one sauce:  yogurt/spicy/hummus', '2022-08-27-6309d99465692.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '6.95', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:45:08', '2022-08-27 13:45:08', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(79, 'Mix Doner (Wrap/Pita)', 'Served with a choice of 3 salads and a choice of one sauce:  yogurt/spicy/hummus', '2022-08-27-6309d9fb6a820.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '7.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:46:51', '2022-08-27 13:46:51', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(80, 'Chicken Shish Kebab Wrap', 'Served with a choice of 3 salads and a choice of one sauce:  yogurt/spicy/hummus', '2022-08-27-6309dbbda0592.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '8.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:54:21', '2022-08-27 13:54:21', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(81, 'Beef Shish Kebab Wrap', 'Served with a choice of 3 salads and a choice of one sauce:  yogurt/spicy/hummus', '2022-08-27-6309dc2cd1124.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '8.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:56:13', '2022-08-27 13:56:13', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(82, 'Mixed Shish Kebab Wrap', 'Served with a choice of 3 salads and a choice of one of these sauces:  yogurt/spicy/hummus', '2022-08-27-6309dc7d836a9.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '8.95', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:57:33', '2022-08-27 13:57:33', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(83, 'Tantuni', 'spicy wrap consisting of chicken, chopped onions, tomatoes and parsley, served with salad', '2022-08-27-6309dcd627e5a.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.00', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 13:59:02', '2022-08-27 13:59:02', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(84, 'Avo Wrap', 'Avocado, cucumber, lime juice, chilli flakes, yogurt', '2022-08-27-6309dd214ec01.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 14:00:17', '2022-08-27 14:00:17', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(85, 'Oriental Wrap', 'Smoked tofu, cucumber, spring onions, watercress, hoisin sauce', '2022-08-27-6309ddfd1b2df.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '7.00', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 14:03:57', '2022-08-27 14:03:57', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(86, 'Genovese Wrap', 'Avocado, mozzarella, pesto and basil', '2022-08-27-6309dfe0d7284.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 14:12:00', '2022-08-27 14:12:00', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(87, 'Flames Chicken Breast Wrap', 'Served with a choice of 3 salads and a choice of one sauce:\r\nYogurt/Spicy/hummus', '2022-08-27-6309e0eac4a4d.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.00', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 14:16:26', '2022-08-27 14:16:26', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(89, 'Prawn and Chive Cocktail Wrap', 'Cooked Prawns, avocado, chives, mayonnaise, tomato ketchup, Worcestershire sauce, Tabasco and lettuce', '2022-08-27-6309e1bc7502f.png', 32, '[{\"id\":\"1\",\"position\":1},{\"id\":\"32\",\"position\":2}]', '[]', '[]', '[]', '[]', '9.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 14:19:56', '2022-08-27 14:19:56', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(90, 'Plain Burger', 'Chicken or Beef or Lamb or Veggie, served with lettuce and sliced tomato', '2022-08-27-6309e3aa9cd45.png', 33, '[{\"id\":\"1\",\"position\":1},{\"id\":\"33\",\"position\":2}]', '[]', '[]', '[]', '[]', '5.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 14:28:10', '2022-08-27 14:28:10', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(91, 'Cheese Burger & French Fries', 'Chicken or Beef or lamb, lettuce and tomatoes, melted cheese with French fries', '2022-08-27-6309f7f97c92c.png', 33, '[{\"id\":\"1\",\"position\":1},{\"id\":\"33\",\"position\":2}]', '[]', '[]', '[]', '[]', '8.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 15:54:49', '2022-08-27 15:54:49', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(92, 'Doner Burger', 'Chicken or lamb or mix of meats, lettuce, tomatoes, jalapeños, onions and mayo, served with French Fries', '2022-08-27-6309f87193c36.png', 33, '[{\"id\":\"1\",\"position\":1},{\"id\":\"33\",\"position\":2}]', '[]', '[]', '[]', '[]', '8.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 15:56:49', '2022-08-27 15:56:49', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(93, 'Cheese Burger & French Fries', 'Chicken or Beef or lamb, lettuce, sliced tomatoes and served with choices of 3 salads.', '2022-08-27-6309f8f2b75f8.png', 33, '[{\"id\":\"1\",\"position\":1},{\"id\":\"33\",\"position\":2}]', '[]', '[]', '[]', '[]', '10.50', '0.00', 'percent', '0.00', 'percent', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 15:58:58', '2022-08-27 15:58:58', 0, 0.00000000000000, 0, NULL, 1, 0, NULL, '[]'),
(94, 'The original Flames Krunch Burger', '<p style=\"padding-left: 40px;\"><strong>Crispy lamb or chicken or beef, Brie cheese, crispy onion flakes and Flames secret sauce. Served with French fries</strong></p>', '2022-08-27-6309f960ed80f.png', 1, '33', '[]', '1,3,4', '[]', '[]', '10.00', '0.00', 'percent', '2.00', 'fixed', '10:00:00', '23:50:00', 0, 1, 10, '2022-08-27 16:00:48', '2022-08-29 13:35:48', 0, 0.00000000000000, 0, NULL, 1, 0, 2, ',16617981480.png,16617981481.png'),
(95, 'Home Made Mango Jam', '<p style=\"text-align: justify; padding-left: 40px;\"><strong>add;a dlad;a</strong></p>\r\n<p style=\"text-align: justify; padding-left: 40px;\"><strong>ajhdah akdahd</strong></p>\r\n<p style=\"text-align: justify; padding-left: 40px;\"><strong>dhadadhlkaldaja</strong></p>', '1661842085f.jpg', 18, '12', NULL, '8,11', NULL, NULL, '12.00', '1.00', 'percent', '1.00', 'fixed', NULL, NULL, 0, 1, 10, '2022-08-30 01:48:05', '2022-08-30 01:48:05', 0, 0.00000000000000, 0, NULL, NULL, 12, 4, ',16618420850.jpg,16618420851.jpg,16618420852.jpg'),
(96, 'Home Made Mango Jam', '<p style=\"text-align: justify; padding-left: 40px;\"><strong>add;a dlad;a</strong></p>\r\n<p style=\"text-align: justify; padding-left: 40px;\"><strong>ajhdah akdahd</strong></p>\r\n<p style=\"text-align: justify; padding-left: 40px;\"><strong>dhadadhlkaldaja</strong></p>', '1661842136f.jpg', 18, '12', NULL, '8,11', NULL, NULL, '12.00', '1.00', 'percent', '1.00', 'fixed', NULL, NULL, 0, 1, 10, '2022-08-30 01:48:56', '2022-08-30 01:48:56', 0, 0.00000000000000, 0, NULL, NULL, 12, 4, ',16618421360.jpg,16618421361.jpg,16618421362.jpg'),
(97, 'Banana', '<p><strong>Banana</strong></p>\r\n<p><strong>Chitri Banana</strong></p>', '1661850024f.jpg', 11, '12', NULL, '7,10', NULL, NULL, '2.00', '0.00', 'fixed', '0.00', 'fixed', NULL, NULL, 0, 1, 10, '2022-08-30 04:00:24', '2022-08-30 04:00:24', 0, 0.00000000000000, 0, NULL, NULL, 12, 3, ',16618500240.jpg,16618500241.jpg'),
(98, 'Apple', '<p>Apple</p>\r\n<p>Kala kolo</p>', '1661850245f.png', 2, '10', NULL, '2,5', NULL, NULL, '10.00', '1.00', 'fixed', '1.00', 'fixed', NULL, NULL, 0, 1, 11, '2022-08-30 04:04:05', '2022-08-30 04:04:05', 0, 0.00000000000000, 0, NULL, NULL, 10, 1, ',16618502450.png,16618502451.png'),
(99, 'Sauce', '<p>Sauce</p>\n<p>Sauce</p>\n<p>adf a fsw fad wa&nbsp;</p>', '1662949387f.jpg', 14, '4', NULL, '2,5', NULL, NULL, '20.00', '1.00', 'percent', '1.00', 'percent', '08:00:00', '23:50:59', 1, 1, 10, '2022-08-30 04:08:39', '2022-09-11 21:47:30', 0, 0.00000000000000, 0, NULL, NULL, 50, 1, ',16618505190.jpg,16618505191.jpg'),
(100, 'Malta', NULL, '1662954653f.jpg', 1, '6', NULL, NULL, NULL, NULL, '500.00', '1.00', 'fixed', '20.00', 'fixed', '08:00:00', '23:50:59', 0, 1, 10, '2022-09-11 22:50:53', '2022-09-11 22:50:53', 0, 0.00000000000000, 0, NULL, NULL, 12, 1, ',16629546530.jpg,16629546531.jpg,16629546532.jpg'),
(101, 'Arhaan', '<p>wdwad aw</p>\n<p>d adawd aw</p>\n<p>adhahdkand</p>\n<p>dladajdlam.a</p>\n<p>&nbsp;</p>', '1662956203f.jpg', 11, '6', NULL, '1,12,11', NULL, NULL, '500.00', '1.00', 'percent', '100.00', 'percent', '08:00:00', '23:50:59', 0, 1, 10, '2022-09-11 23:16:43', '2022-09-13 04:41:12', 0, 0.00000000000000, 0, NULL, NULL, 24, 1, ',16629562030.jpg,16629562031.jpg,16629562032.jpg,16629562033.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `item_campaigns`
--

CREATE TABLE `item_campaigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `discount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percent',
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `veg` tinyint(1) NOT NULL DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `stock` int(11) DEFAULT 0,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2016_06_01_000001_create_oauth_auth_codes_table', 30),
(2, '2016_06_01_000002_create_oauth_access_tokens_table', 30),
(3, '2016_06_01_000003_create_oauth_refresh_tokens_table', 30),
(4, '2016_06_01_000004_create_oauth_clients_table', 30),
(5, '2016_06_01_000005_create_oauth_personal_access_clients_table', 30),
(8, '2021_06_17_054551_create_soft_credentials_table', 31),
(9, '2022_04_10_030533_create_newsletters_table', 32),
(10, '2022_04_12_015827_create_social_media_table', 32),
(11, '2022_04_12_215009_create_jobs_table', 32),
(12, '2022_04_21_145207_add_column_to_modules_table', 32),
(13, '2022_05_12_170027_add_column_to_customer_addresses_table', 33),
(14, '2022_05_14_155444_add_all_zones_column_to_modules_table', 33),
(15, '2022_05_26_120821_change_data_column_to_user_notifiations_table', 33),
(16, '2022_03_31_103418_create_wallet_transactions_table', 34),
(17, '2022_03_31_103827_create_loyalty_point_transactions_table', 34),
(18, '2022_04_09_161150_add_wallet_point_columns_to_users_table', 34),
(19, '2022_05_14_122133_add_dm_tips_column_to_orders_table', 34),
(20, '2022_05_14_122603_add_dm_tips_column_to_order_transactions_table', 34),
(21, '2022_05_17_153333_add_ref_code_to_users_table', 34),
(22, '2019_12_14_000001_create_personal_access_tokens_table', 35),
(23, '2022_08_28_123511_add_new_column_to_users_table', 35),
(24, '2014_10_12_200000_add_two_factor_columns_to_users_table', 36),
(25, '2022_08_29_043846_create_sessions_table', 37),
(26, '2022_08_31_071839_add_new_columns_to_business_setting_table', 38),
(27, '2022_09_05_172801_add_new_columns_to_tables', 39),
(28, '2022_09_05_174550_add_new_columns_to_tables', 40);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `stores_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_id` int(11) NOT NULL DEFAULT 1,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `all_zone_service` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_type`, `thumbnail`, `status`, `stores_count`, `created_at`, `updated_at`, `icon`, `theme_id`, `description`, `all_zone_service`) VALUES
(1, 'Food', 'food', '2022-08-24-6306355b4f4a4.png', 1, 3, '2022-08-24 09:27:39', '2022-08-24 10:00:37', '2022-08-24-6306355b4a474.png', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `module_types`
--

CREATE TABLE `module_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Subscribers email',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tergat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('11ff121c6d42e4175d1a0728d10cd1e9f4e6c2b9e9e43ea89a94e0c4d348fa5f7a77cb9135a423cf', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-25 06:00:25', '2022-08-25 06:00:25', '2023-08-25 06:00:25'),
('1d0ca4ef0d7b4633859abd8f42978cbf07ec6fc0aa4d6e62e242e015111ba1e15b8cd2974b72bf8e', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-25 05:55:36', '2022-08-25 05:55:36', '2023-08-25 05:55:36'),
('331469f1ce78ffd05bc3b3f1d0daa717401843c6d4e758dfbadba3c40534232f16d8dc36ffd450d0', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-25 05:56:32', '2022-08-25 05:56:32', '2023-08-25 05:56:32'),
('514f5c6c0cb437ce9ac055ffe68ee03a752d9bdeb7d1f5553e19531dd66416bb638bd7e852ef6485', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-25 06:00:55', '2022-08-25 06:00:55', '2023-08-25 06:00:55'),
('5e3eb29faaed113f6a1f911ef6270a572b7d47bee4643a2f52647bbcd218e2ae7140ac7c9d6292ae', 3, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-27 02:40:20', '2022-08-27 02:40:20', '2023-08-27 02:40:20'),
('7d7509dc6810a6348696500afc03364d7848ab99cdca0373a24713d73db4051552fbf5da541a782e', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-25 06:00:00', '2022-08-25 06:00:00', '2023-08-25 06:00:00'),
('9adad068456d8175f90fe5d4cd470a1b4a19c068fdeae6355f31c1ad8e3baf70e4abdf053ad01053', 1, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-24 10:45:15', '2022-08-24 10:45:15', '2023-08-24 10:45:15'),
('f5bee128d8750865b01142555db467ba8d4f726bbd2395aad24a7c620f24ebcb24849cbbcd6735fd', 4, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-27 23:58:02', '2022-08-27 23:58:02', '2023-08-27 23:58:02'),
('fc6b27df767b3ab76a3e30f5612eb49e8b6d88791b84e7ab7d41f760d2d562b60d907ec5b43f0bd8', 2, 3, 'RestaurantCustomerAuth', '[]', 0, '2022-08-25 06:00:29', '2022-08-25 06:00:29', '2023-08-25 06:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'qBN0j6SW6nIf47748tgxaKxnqKqCacTxa6gii8yc', NULL, 'http://localhost', 1, 0, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, NULL, 'Laravel Password Grant Client', 'oqQ90HOU0egjgQ01LRzHo9rADUavq16jzWm1TrjT', 'users', 'http://localhost', 0, 1, 0, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(3, NULL, 'stackfood Personal Access Client', 'iRxXixYp4CDo7TWbWNCMelAUwgtScaEMGudnbHQk', NULL, 'http://localhost', 1, 0, 0, '2022-01-05 10:22:36', '2022-01-05 10:22:36'),
(4, NULL, 'stackfood Password Grant Client', 'FzGJ1vSlbfGP2mWqF6V575QgVCEfbBHVNA41ApeC', 'users', 'http://localhost', 0, 1, 0, '2022-01-05 10:22:36', '2022-01-05 10:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-19 20:44:50', '2021-08-19 20:44:50'),
(2, 3, '2022-01-05 10:22:36', '2022-01-05 10:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `coupon_discount_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total_tax_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'delivery',
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `schedule_at` timestamp NULL DEFAULT NULL,
  `callback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pending` timestamp NULL DEFAULT NULL,
  `accepted` timestamp NULL DEFAULT NULL,
  `confirmed` timestamp NULL DEFAULT NULL,
  `processing` timestamp NULL DEFAULT NULL,
  `handover` timestamp NULL DEFAULT NULL,
  `picked_up` timestamp NULL DEFAULT NULL,
  `delivered` timestamp NULL DEFAULT NULL,
  `canceled` timestamp NULL DEFAULT NULL,
  `refund_requested` timestamp NULL DEFAULT NULL,
  `refunded` timestamp NULL DEFAULT NULL,
  `delivery_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled` tinyint(1) NOT NULL DEFAULT 0,
  `store_discount_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `failed` timestamp NULL DEFAULT NULL,
  `adjusment` decimal(24,2) NOT NULL DEFAULT 0.00,
  `edited` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `order_attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parcel_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `receiver_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`receiver_details`)),
  `charge_payer` enum('sender','receiver') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance` double(16,3) NOT NULL DEFAULT 0.000,
  `dm_tips` double(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_histories`
--

CREATE TABLE `order_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(24,2) NOT NULL DEFAULT 0.00,
  `item_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `add_ons` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_on_item` decimal(24,2) DEFAULT NULL,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `quantity` int(11) NOT NULL DEFAULT 1,
  `tax_amount` decimal(24,2) NOT NULL DEFAULT 1.00,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_add_on_price` decimal(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `order_amount` decimal(24,2) NOT NULL,
  `store_amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(24,2) NOT NULL,
  `received_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `original_delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `parcel_catgory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `dm_tips` double(24,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parcel_categories`
--

CREATE TABLE `parcel_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `orders_count` int(11) NOT NULL DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('jpscicluna@gmail.com', '9357', '2022-08-24 10:46:04'),
('jpscicluna@gmail.com', '7084', '2022-08-24 10:46:09');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_verifications`
--

CREATE TABLE `phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_verifications`
--

INSERT INTO `phone_verifications` (`id`, `phone`, `token`, `created_at`, `updated_at`) VALUES
(1, '+923137388266', '5150', '2022-08-25 05:56:32', '2022-08-25 05:56:32');

-- --------------------------------------------------------

--
-- Table structure for table `provide_d_m_earnings`
--

CREATE TABLE `provide_d_m_earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(24,2) NOT NULL DEFAULT 0.00,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `item_campaign_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `module_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('y2uuxGfQNHQFX8Ov0hR0aMx6hNqYp0nAK4joJnYm', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQms1VThHcUlpMldsS1I0WHF2YlJJUTVhandGMjh3QXdRZnN0MFhJUiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2FkZC96b25lIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zb2NpYWxfbWVkaWFfc2V0dGluZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czo1OiJ1dHlwZSI7czozOiJBRE0iO30=', 1663064195);

-- --------------------------------------------------------

--
-- Table structure for table `social_media`
--

CREATE TABLE `social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media`
--

INSERT INTO `social_media` (`id`, `name`, `link`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Twitter', 'www.twitter.com', 1, '2022-09-06 05:26:03', '2022-09-13 05:06:44'),
(4, 'Instagram', 'www.instagram.com', 1, '2022-09-06 05:35:40', '2022-09-06 05:45:34'),
(5, 'Youtube', 'www.youtube.com', 1, '2022-09-13 04:58:26', '2022-09-13 04:58:26'),
(6, 'facebook', 'www.facebook.com', 1, '2022-09-13 05:04:31', '2022-09-13 05:04:31'),
(7, 'LinkedIn', 'www.linkedin.com', 1, '2022-09-13 05:04:54', '2022-09-13 05:04:54'),
(8, 'Pinterest', 'www.pintreset.com', 1, '2022-09-13 05:05:17', '2022-09-13 05:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `minimum_order` decimal(24,2) NOT NULL DEFAULT 0.00,
  `comission` decimal(24,2) DEFAULT NULL,
  `schedule_order` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `free_delivery` tinyint(1) NOT NULL DEFAULT 0,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` tinyint(1) NOT NULL DEFAULT 1,
  `take_away` tinyint(1) NOT NULL DEFAULT 1,
  `item_section` tinyint(1) NOT NULL DEFAULT 1,
  `tax` decimal(24,2) NOT NULL DEFAULT 0.00,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews_section` tinyint(1) NOT NULL DEFAULT 1,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `off_day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `self_delivery_system` tinyint(1) NOT NULL DEFAULT 0,
  `pos_system` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_charge` decimal(24,2) NOT NULL DEFAULT 0.00,
  `delivery_time` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '30-40',
  `veg` tinyint(1) NOT NULL DEFAULT 1,
  `non_veg` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `order_place_to_schedule_interval` int(11) DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `phone`, `email`, `logo`, `latitude`, `longitude`, `address`, `footer_text`, `minimum_order`, `comission`, `schedule_order`, `status`, `vendor_id`, `created_at`, `updated_at`, `free_delivery`, `rating`, `cover_photo`, `delivery`, `take_away`, `item_section`, `tax`, `zone_id`, `reviews_section`, `active`, `off_day`, `gst`, `self_delivery_system`, `pos_system`, `delivery_charge`, `delivery_time`, `veg`, `non_veg`, `order_count`, `total_order`, `module_id`, `order_place_to_schedule_interval`, `featured`) VALUES
(9, 'KFC', '03137388266', 'kfc@gmail.com', '2022-08-24-630638adda72e.png', '35.91555201352069', '14.421879622215416', 'Malta', NULL, '0.00', NULL, 0, 1, 1, '2022-08-24 09:41:50', '2022-08-25 03:58:26', 0, NULL, '2022-08-24-63063c5c35af8.png', 1, 1, 1, '0.90', 1, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40 min', 1, 1, 0, 0, 1, NULL, 0),
(10, 'Flames Food', '+356 2766 2450', 'sales@flames-food.com', '2022-08-24-63063d024b644.png', '35.91221533027985', '14.405400130027916', 'University of Malta Gate (Rear),\r\nTriq L-Imhallef Paolo Debono L-Imsida,\r\nMalta MSD 2030,\r\nMalta', NULL, '0.00', NULL, 1, 1, 2, '2022-08-24 10:00:18', '2022-08-25 04:03:46', 0, NULL, '2022-08-24-630671de1f1c3.png', 1, 1, 1, '0.00', 1, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40 min', 1, 1, 0, 0, 1, NULL, 0),
(11, 'Crispy Food', '+35679210273', 'crispy@gmail.com', '2022-08-24-63063d1507227.png', '35.92778531462675', '14.45071873354354', 'No 11 the office center Triq', NULL, '0.00', NULL, 0, 1, 3, '2022-08-24 10:00:37', '2022-08-25 05:21:34', 0, NULL, '2022-08-24-63063d1507898.png', 1, 1, 1, '0.90', 1, 1, 1, ' ', NULL, 0, 0, '0.00', '30-40 min', 1, 1, 0, 0, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `store_schedule`
--

CREATE TABLE `store_schedule` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `day` int(11) NOT NULL,
  `opening_time` time DEFAULT NULL,
  `closing_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_schedule`
--

INSERT INTO `store_schedule` (`id`, `store_id`, `day`, `opening_time`, `closing_time`, `created_at`, `updated_at`) VALUES
(1, 10, 1, '08:00:00', '23:50:59', '2022-08-25 03:55:31', '2022-08-25 03:55:31'),
(2, 10, 2, '08:00:00', '23:50:59', '2022-08-25 03:55:34', '2022-08-25 03:55:34'),
(3, 10, 3, '08:00:00', '23:50:59', '2022-08-25 03:55:36', '2022-08-25 03:55:36'),
(4, 10, 4, '08:00:00', '23:50:59', '2022-08-25 03:55:39', '2022-08-25 03:55:39'),
(5, 10, 5, '08:00:00', '23:50:59', '2022-08-25 03:55:42', '2022-08-25 03:55:42'),
(6, 10, 6, '08:00:00', '23:50:59', '2022-08-25 03:55:45', '2022-08-25 03:55:45'),
(7, 10, 0, '08:00:00', '23:50:59', '2022-08-25 03:55:49', '2022-08-25 03:55:49'),
(8, 11, 1, '08:00:00', '23:50:59', '2022-08-25 03:56:48', '2022-08-25 03:56:48'),
(9, 11, 2, '08:00:00', '23:50:59', '2022-08-25 03:56:51', '2022-08-25 03:56:51'),
(10, 11, 3, '08:00:00', '23:50:59', '2022-08-25 03:56:54', '2022-08-25 03:56:54'),
(11, 11, 4, '08:00:00', '23:50:59', '2022-08-25 03:56:57', '2022-08-25 03:56:57'),
(12, 11, 5, '08:00:00', '23:50:59', '2022-08-25 03:57:00', '2022-08-25 03:57:00'),
(13, 11, 6, '08:00:00', '23:50:59', '2022-08-25 03:57:02', '2022-08-25 03:57:02'),
(14, 11, 0, '08:00:00', '23:50:59', '2022-08-25 03:57:05', '2022-08-25 03:57:05'),
(15, 9, 1, '08:00:00', '23:50:59', '2022-08-25 03:57:52', '2022-08-25 03:57:52'),
(16, 9, 2, '08:00:00', '23:50:59', '2022-08-25 03:57:55', '2022-08-25 03:57:55'),
(17, 9, 3, '08:00:00', '23:50:59', '2022-08-25 03:57:57', '2022-08-25 03:57:57'),
(18, 9, 4, '08:00:00', '23:50:59', '2022-08-25 03:58:08', '2022-08-25 03:58:08'),
(19, 9, 5, '08:00:00', '23:50:59', '2022-08-25 03:58:12', '2022-08-25 03:58:12'),
(20, 9, 6, '08:00:00', '23:50:59', '2022-08-25 03:58:16', '2022-08-25 03:58:16'),
(21, 9, 0, '08:00:00', '23:50:59', '2022-08-25 03:58:19', '2022-08-25 03:58:19');

-- --------------------------------------------------------

--
-- Table structure for table `store_wallets`
--

CREATE TABLE `store_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `total_earning` decimal(24,2) NOT NULL DEFAULT 0.00,
  `total_withdrawn` decimal(24,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(24,2) NOT NULL DEFAULT 0.00,
  `collected_cash` decimal(24,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `store_wallets`
--

INSERT INTO `store_wallets` (`id`, `vendor_id`, `total_earning`, `total_withdrawn`, `pending_withdraw`, `collected_cash`, `created_at`, `updated_at`) VALUES
(1, 2, '0.00', '0.00', '0.00', '0.00', '2022-08-25 03:55:02', '2022-08-25 03:55:02'),
(2, 3, '0.00', '0.00', '0.00', '0.00', '2022-08-25 03:56:24', '2022-08-25 03:56:24'),
(3, 1, '0.00', '0.00', '0.00', '0.00', '2022-08-25 03:57:13', '2022-08-25 03:57:14');

-- --------------------------------------------------------

--
-- Table structure for table `track_deliverymen`
--

CREATE TABLE `track_deliverymen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `longitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `translationable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `interest` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `login_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `wallet_balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `loyalty_point` decimal(24,3) NOT NULL DEFAULT 0.000,
  `ref_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utype` enum('ADM','VEND','USR') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `phone`, `email`, `image`, `is_phone_verified`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`, `interest`, `cm_firebase_token`, `status`, `order_count`, `login_medium`, `social_id`, `zone_id`, `wallet_balance`, `loyalty_point`, `ref_code`, `utype`) VALUES
(1, 'JP', 'Scicluna', '+35679791979', 'jpscicluna@gmail.com', NULL, 0, NULL, '$2y$10$l3cX1TvSC2NOB9Wxe4wBh.6bo4774glq4/b.d/rEXIqaciggBNB3e', NULL, NULL, NULL, NULL, '2022-08-24 10:45:14', '2022-08-24 10:45:14', NULL, NULL, 1, 0, NULL, NULL, NULL, '0.000', '0.000', 'jpsciclun1', 'ADM'),
(2, 'Adeel', 'Ashraf', '+923137388266', 'adeel@gmail.com', NULL, 0, NULL, '$2y$10$cjkeZ8uyHFzWAf5LEQ8LCOhmtmxo5w2iV0SqSQ0Kc41uPw/kII.la', NULL, NULL, NULL, 'OJmCGSVE9ZcDpIYKrwcbyNnMNNumnzqjofgixuwhCIVFkfuP0cSKOetwaomI', '2022-08-25 05:55:36', '2022-08-25 06:00:59', NULL, 'ftKlXVXQy0GKtWev4RXw1W:APA91bGldJnn5oOA9lwGiyi5MR5wSWSThbN-xJfWkdfbD0NprY9t8tevd3zvAQnIRTSsm3GpU7PmGWDlqL0wv9ZOvh2rn9HeTdWnldBVGFxEfkeTBMFleoGFAjqP2L1yYcTHxtrKVZSo', 1, 0, NULL, NULL, 0, '0.000', '0.000', 'adeel20000', 'ADM'),
(3, 'adil', 'mustafa', '+35699321509', 'adilmr86@gmail.com', NULL, 0, NULL, '$2y$10$HMAkSgCR3KQl1BEj6yf5jOeCyBxYxBU/4bACxKpd29EqigdflfwcW', NULL, NULL, NULL, NULL, '2022-08-27 02:40:20', '2022-08-27 02:40:20', NULL, NULL, 1, 0, NULL, NULL, NULL, '0.000', '0.000', 'adilmr8630', 'USR'),
(4, 'Ricardo', 'bravo', '+35699358436', 'ricardb7@hotmail.com', NULL, 0, NULL, '$2y$10$cbpNMvElYzRTcRJ7k6qJ1.fmdaeA63Vo1JmoUIDfqeNUe6j4mLRFa', NULL, NULL, NULL, NULL, '2022-08-27 23:58:01', '2022-08-27 23:58:01', NULL, NULL, 1, 0, NULL, NULL, NULL, '0.000', '0.000', 'ricardb740', 'USR');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vendor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_man_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `f_name`, `l_name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `holder_name`, `account_no`, `image`, `status`, `firebase_token`, `auth_token`) VALUES
(1, 'kfc', 'kfc', '03137388266', 'kfc@gmail.com', NULL, '$2y$10$.Pcm5YoS2TT2vb9dRW7xLerfrIlrLhXyKBFXUz/i99R3fWvLBYw9u', NULL, '2022-08-24 09:41:49', '2022-08-24 09:41:49', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, 'Flames', 'Food', '+356 2766 2450', 'sales@flames-food.com', NULL, '$2y$10$PczSuJBC.HW45.UjMRdtqe8HnZBjgt.qeyfra07O3jeY7UIRM9VFO', NULL, '2022-08-24 10:00:18', '2022-08-24 13:45:50', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(3, 'Crispy', 'Food', '+35679210273', 'crispy@gmail.com', NULL, '$2y$10$f1tx/BMCRAPL1gJ0fKx8bOA0Sf0WxD7DTnvAEVo1n2IB5OgaBsxU6', NULL, '2022-08-24 10:00:37', '2022-08-24 10:00:37', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_employees`
--

CREATE TABLE `vendor_employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_role_id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deliveryman_wise_topic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`, `store_wise_topic`, `customer_wise_topic`, `deliveryman_wise_topic`) VALUES
(1, 'Malta', 0x000000000103000000010000000d0000007d4e3917576d2c4003a3ac19ac0a4240d74c3917cfa92c403852882343074240d74c39174fed2c40ee849b7a53f94140f14d3917bf222d40ebaba5feedef4140f14d39171f1d2d40c4a57d3185e84140d74c3917cf032d40a2ca173eaae74140f14d39175fce2c4070aa61ef15eb4140644d391767a82c40d4b55cd87ff041407d4e391797a52c4037421c504ffd4140644d391727702c40e591f5bab60242407d4e391717622c40f1e42bda68064240f14d39177f632c4031263ce3d10942407d4e3917576d2c4003a3ac19ac0a4240, 1, '2022-09-13 04:30:47', '2022-09-13 04:30:47', NULL, NULL, NULL),
(5, 'Pakistan', 0x00000000010300000001000000190000007f9ff19b8d744e405c9e525e74dc3d40c0cff8cda69c50405c9e525e74dc3d40c0cff8cd069750408965e2f374ff3e40c0cff8cd66eb5040b198b7dd6aac3f40c0cff8cde68851406b5fc8fbecf14040c0cff8cde6e2514068e4cd38c62a4240c0cff8cda65e5240cdadef31a5c34240c0cff8cd26cf5240cf31f315fd844240c0cff8cd066753404a4a2a356ebd4140c0cff8cd66bb53409884e562d0294140c0cff8cd46cc534051cd2494676e4040c0cff8cda61253403a00bde3b78a4040c0cff8cdc6a75240744bcc0cb35f3f40c0cff8cd261b524088f934840c673c40c0cff8cd26c1514065a9658a41c83b40c0cff8cda650514015ef5b5a2fb03a40c0cff8cd46dd5140ba555f8ee9a03840c0cff8cda6505140dad26add7b3a3840c0cff8cd260d51406c65fbf14ee837407f9ff19b4dc34e408f10191fc32f39407f9ff19bcdd94e40cb8829a9a95f3a407f9ff19b8daf4f40928315ee47c43a407f9ff19b8d554f4036ee911e798c3b407f9ff19b0d6c4f404ea978d26f3f3c407f9ff19b8d744e405c9e525e74dc3d40, 1, '2022-09-13 04:33:01', '2022-09-13 04:33:01', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_ons`
--
ALTER TABLE `add_ons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banners_module_id_foreign` (`module_id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_module_id_foreign` (`module_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_module_id_foreign` (`module_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_module_id_foreign` (`module_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_verifications`
--
ALTER TABLE `email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `items_module_id_foreign` (`module_id`);

--
-- Indexes for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_campaigns_module_id_foreign` (`module_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_types`
--
ALTER TABLE `module_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zone_id` (`zone_id`),
  ADD KEY `orders_module_id_foreign` (`module_id`);

--
-- Indexes for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_zone_id_index` (`zone_id`),
  ADD KEY `order_transactions_module_id_foreign` (`module_id`);

--
-- Indexes for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `parcel_categories_name_unique` (`name`),
  ADD KEY `parcel_categories_module_id_foreign` (`module_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone_verifications_phone_unique` (`phone`);

--
-- Indexes for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_module_id_foreign` (`module_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `social_media`
--
ALTER TABLE `social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `restaurants_phone_unique` (`phone`),
  ADD KEY `stores_module_id_foreign` (`module_id`);

--
-- Indexes for table `store_schedule`
--
ALTER TABLE `store_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_wallets`
--
ALTER TABLE `store_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_ref_code_unique` (`ref_code`),
  ADD KEY `users_zone_id_index` (`zone_id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_phone_unique` (`phone`),
  ADD UNIQUE KEY `vendors_email_unique` (`email`);

--
-- Indexes for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_employees_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `add_ons`
--
ALTER TABLE `add_ons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_wallets`
--
ALTER TABLE `delivery_man_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `d_m_reviews`
--
ALTER TABLE `d_m_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_verifications`
--
ALTER TABLE `email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `module_types`
--
ALTER TABLE `module_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_delivery_histories`
--
ALTER TABLE `order_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_verifications`
--
ALTER TABLE `phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `provide_d_m_earnings`
--
ALTER TABLE `provide_d_m_earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_media`
--
ALTER TABLE `social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `store_schedule`
--
ALTER TABLE `store_schedule`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `store_wallets`
--
ALTER TABLE `store_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `track_deliverymen`
--
ALTER TABLE `track_deliverymen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor_employees`
--
ALTER TABLE `vendor_employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD CONSTRAINT `campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `item_campaigns`
--
ALTER TABLE `item_campaigns`
  ADD CONSTRAINT `item_campaigns_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `parcel_categories`
--
ALTER TABLE `parcel_categories`
  ADD CONSTRAINT `parcel_categories_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
