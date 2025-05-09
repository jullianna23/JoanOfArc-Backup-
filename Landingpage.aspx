﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landingpage.aspx.cs" Inherits="JOArc_System.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Joan Arc Youth Organization</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- AOS CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />
    <!-- Font Awesome for social icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        /* Navigation Styles */
        .navbar {
            background-color: rgba(220, 220, 220, 0.8); /* Changed from solid to semi-transparent */
            backdrop-filter: blur(10px); /* Added blur effect */
            -webkit-backdrop-filter: blur(10px); /* For Safari */
            padding: 20px 20px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: auto;
        }

        .nav-logo {
            font-weight: bold;
            font-size: 20px;
            color:#ba8c00;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        .nav-links li a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s ease;
            padding: 8px 12px;
            border-radius: 4px;
            position: relative;
        }

        .nav-links li a:hover {
            color: #ba8c00;
        }

        /* Active menu item style */
        .nav-links li a.active {
            color: #ba8c00;
            font-weight: bold;
        }

        .nav-links li a.active::after {
            content: '';
            position: absolute;
            bottom: -3px;
            left: 0;
            width: 100%;
            height: 3px;
            background-color: #ffc30f;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% {
                opacity: 0.6;
                transform: scaleX(0.92);
            }
            50% {
                opacity: 1;
                transform: scaleX(1);
            }
            100% {
                opacity: 0.6;
                transform: scaleX(0.92);
            }
        }

        /* Mobile menu button */
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #333;
        }

        .header {
            background-image: url('IMAGES/orgimg.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            color: white;
            padding: 100px 20px;
            text-align: center;
            min-height: 400px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .header h1 {
            font-size: 60px;
            font-weight: bold;
            font-family: 'Arial Black';
        }

        .header p {
            font-size: 24px;
            margin-top: 10px;
            font-family: Arial;
        }

       .know-more-btn {
            margin-top: 35px;
            padding-right: 30px;
            padding: 15px 20px;
            padding-left: 40px;
            background-color: #ffc30f;
            font-size: 15px;
            font-family: 'Arial Black';
            font-weight: bold;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            text-transform: uppercase;
            color: #333;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            overflow: hidden;
            position: relative;
        }

        .know-more-btn .arrow{
            display: inline-block;
            font-size: 20px;
            font-weight: bold;
            transform: translateX(90px);
            opacity: 0;
            transition: all 0.3s ease;
        }

        .know-more-btn:hover {
            background-color: #ba8c00;
            transform: scale(1.05);
            color: white;
            padding-right: 30px; /* makes space for the arrow */
        }

        .know-more-btn:hover .arrow {
            transform: translateX(0);
            opacity: 1;
        }

.section {
    display: flex;
    justify-content: space-between; /* Space between info and donation */
    padding: 40px 20px;
    background-color: #ffffff; /* Ensure a clean background */
    border-radius: 10px; /* Rounded corners for a softer look */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
}

.info, .donation {
    flex: 1; /* Allow both sections to take equal space */
    max-width: 48%; /* Ensure they fit side by side */
    margin: 0 10px; /* Add horizontal margin for spacing */
    padding: 20px; /* Internal padding for content */
    border: 1px solid #ddd; /* Light border to separate sections */
    border-radius: 10px; /* Consistent rounding */
}

.info h3, .donation h3 {
    font-size: 24px; /* Consistent heading size */
    color: #333; /* Darker color for contrast */
}

.info p, .donation p {
    font-size: 16px; /* Consistent paragraph size */
    color: #555; /* Softer text color */
}

.payment-methods {
    display: flex; /* Align items horizontally */
    justify-content: space-between; /* Space out options */
    color: red;
    margin: 10px 0; /* Spacing above and below */
}

.payment-option {
    position: relative; /* Position for overlay effect */
    flex: 1; /* Equal space for each option */
    margin: 0 10px; /* Horizontal spacing */
    border-radius: 10px; /* Rounded corners */
    overflow: hidden; /* Ensure content stays within bounds */
    transition: opacity 0.3s ease, transform 0.3s ease; /* Smooth transition */
}

.payment-option input {
    display: none; /* Hide the radio button */
}

 .popup-modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.6);
            align-content:center;
        }

        .popup-content {
            background-color: #fff;
            margin: 10% auto;
            padding: 20px;
            border-radius: 10px;
            width: 80%;
            max-width: 400px;
            text-align: center;
            position: relative;
        }

        .popup-content img {
            max-width: 100%;
            height: auto;
        }

        .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 20px;
            cursor: pointer;
            color: #333;
        }

.payment-option label {
    display: block; /* Make label block-level */
    text-align: center; /* Center text */
    padding: 20px; /* Padding inside the box */
    background-size: cover; /* Cover the entire box */
    background-position: center; /* Center the image */
    color: black; /* Text color */
    border-radius: 10px; /* Rounded corners */
    transition: opacity 0.3s ease, background-color 0.3s ease; /* Smooth transition */
}

.payment-option:hover {
    opacity: 0.8; /* Change opacity on hover */
    transform: scale(1.05); /* Slightly enlarge on hover */
}

.payment-option:hover label {
    background-color: rgba(0, 0, 0, 0.5); /* Darken the background for contrast */
}

.donate-button {
    background-color: #ffc30f; /* Button color */
    color: #333; /* Text color */
    padding: 10px 20px; /* Button padding */
    border: none; /* Remove border */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Pointer on hover */
    transition: background-color 0.3s; /* Smooth transition */
}

.donate-button:hover {
    background-color: #ba8c00; /* Darker shade on hover */
    color: white; /* White text on hover */
}

/* Additional styling for the donation section can go here */

        .join-now-btn {
            margin-top: 35px;
   
            padding: 15px 20px;
            background-color: #ffc30f;
            font-size: 15px;
            font-family: 'Arial Black';
            font-weight: bold;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            text-transform: uppercase;
            color: #333;
            align-items: center;
            gap: 10px;
            transition: all 0.3s ease;
            overflow: hidden;
            position: relative;
            text-align: center;
            width: 100%;
            max-width: 300px;
        }
        

        .join-now-btn:hover {
            background-color: #ba8c00;
            transform: scale(1.05);
            color: white;
            padding-right: 30px; /* makes space for the arrow */
        }

        .join-now-btn:hover {
            transform: translateX(0);
            opacity: 1;
        }

        .map {
            width: 100%;
            max-width: 50%;
        }

        .map img {
            width: 100%;
            height: auto;
        }

        .info {
            width: 100%;
            max-width: 50%;
            padding: 0 20px;
            display: flex;
            flex-direction: column;
        }

        .info h3 {
            font-size: 20px;
            font-family: 'Arial Black';
        }

        .info p {
            font-size: 18px;
            margin-top: 10px;
            font-family: Calibri;
        }

        .activities {
            padding: 40px 0;
            text-align: center;
        }

        .activities h3 {
            font-weight: bold;
            font-size: 30px;
            font-family: 'Arial Black';
            margin-bottom: 50px;
            position: relative;
        }

        .activities h3::after {
            content: "";
            display: block;
            width: 80px;
            height: 4px;
            background-color: #ffc30f;
            margin: 10px auto 0;
            border-radius: 2px;
        }

        .gallery {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            margin: 0 auto;
            max-width: 1200px;
            margin-bottom: 50px;
        }

        .gallery img {
            width: 100%;
            max-width: 500px;
            height: 300px;
            border-radius: 10px;
        }

        .activity-card {
            width: 350px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            position: relative;
        }

        .activity-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
        }

        .activity-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            display: block;
            border-radius: 10px 10px 0 0;
            transition: transform 0.5s ease;
        }

        .activity-card:hover img {
            transform: scale(1.1);
        }

        .caption {
            padding: 20px;
            font-weight: 600;
            background-color: #f5f5f5;
            margin: 0;
            transition: background-color 0.3s ease;
        }

        .activity-card:hover .caption {
            background-color: #ffc30f;
            color: #333;
        }

        .activity-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 250px;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: opacity 0.4s ease;
            border-radius: 10px 10px 0 0;
        }

        .activity-card:hover .activity-overlay {
            opacity: 1;
        }

        .view-more {
            padding: 10px 20px;
            background-color: #ffc30f;
            color: #333;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .view-more:hover {
            background-color: #ba8c00;
            color: white;
        }

        /* Footer Styles */
        .footer {
            background-color: gainsboro;
            padding: 40px 0 0 0;
            border-top: 1px solid #e0e0e0;
            font-family: Arial, sans-serif;
            margin: 0;
        }
        
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 0 20px 30px;
        }
        
        .footer-logo-section {
            flex: 1;
            min-width: 250px;
            padding-right: 20px;
        }
        
        .footer-logo {
            font-weight: bold;
            font-size: 24px;
            color: #ba8c00;
            margin-bottom: 15px;
        }
        
        .footer-tagline {
            font-size: 16px;
            font-weight: 600;
            color: #333;
            margin-bottom: 15px;
        }
        
        .footer-about-text {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
            line-height: 1.5;
        }
        
        .footer-column {
            flex: 1;
            min-width: 180px;
            padding: 0 15px;
        }
        
        .footer-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
            position: relative;
        }
        
        .footer-links {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .footer-links li {
            margin-bottom: 12px;
        }
        
        .footer-links li a {
            color: #555;
            text-decoration: none;
            transition: color 0.3s ease;
            font-size: 14px;
        }
        
        .footer-links li a:hover {
            color: #ba8c00;
        }
        
        .footer-location {
            font-size: 14px;
            color: #555;
            margin-bottom: 15px;
            line-height: 1.6;
        }
        
        .subscribe-form {
            margin-top: 15px;
        }
        
        .subscribe-input {
            padding: 10px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
        }
        
        .subscribe-btn {
            background-color: #ffc30f;
            color: #333;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        
        .subscribe-btn:hover {
            background-color: #ba8c00;
            color: white;
        }
        
        .social-icons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
            flex-wrap: wrap;
        }
        
        .social-icons a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #eee;
            color: #555;
            transition: all 0.3s ease;
        }
        
        .social-icons a:hover {
            background-color: #ffc30f;
            color: #333;
            transform: translateY(-3px);
        }
        
        .copyright {
            background-color: #222;
            color: #fff;
            text-align: center;
            padding: 25px 0;
            font-size: 14px;
            margin: 0;
        }

        @media (max-width: 992px) {
            .footer-container {
                flex-wrap: wrap;
            }
            
            .footer-logo-section {
                flex: 0 0 100%;
                margin-bottom: 30px;
            }
            
            .footer-column {
                flex: 0 0 calc(50% - 30px);
                margin-bottom: 30px;
            }
        }

        @media (max-width: 768px) {
            .menu-toggle {
                display: block;
            }
            
            .nav-container {
                position: relative;
            }
            
            .nav-links {
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background-color: rgba(220, 220, 220, 0.95);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                flex-direction: column;
                align-items: center;
                padding: 20px 0;
                gap: 15px;
                box-shadow: 0 4px 6px rgba(0,0,0,0.1);
                display: none;
                z-index: 1000;
            }
            
            .nav-links.active {
                display: flex;
            }
            
            .section {
                flex-direction: column;
            }

            .map, .info {
                max-width: 100%;
                padding: 0;
                margin-bottom: 20px;
            }

            .info h3 {
                font-size: 18px;
            }

            .info p {
                font-size: 16px;
            }

            .header h1 {
                font-size: 40px;
            }

            .header p {
                font-size: 18px;
            }

            .activity-card {
                width: 100%;
                max-width: 450px;
            }
            
            .footer-column {
                flex: 0 0 100%;
            }
        }

        @media (max-width: 576px) {
            .gallery {
                gap: 15px;
            }
            
            .activity-card {
                width: 100%;
                max-width: 100%;
            }
            
            .know-more-btn, .join-now-btn {
                padding: 12px 25px;
                font-size: 16px;
            }
            
            .header {
                padding: 60px 15px;
                min-height: 300px;
            }
            
            .header h1 {
                font-size: 30px;
            }
            
            .header p {
                font-size: 16px;
            }
            
            .activities h3 {
                font-size: 22px;
                margin-bottom: 30px;
            }
            
            .footer-logo-section, .footer-column {
                padding: 0 10px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Navigation Bar -->
        <nav class="navbar" data-aos-duration="800">
            <div class="nav-container">
                <div class="nav-logo">JAOYO</div>
                <button class="menu-toggle" id="menuToggle">
                    <i class="fas fa-bars"></i>
                </button>
                <ul class="nav-links" id="navLinks">
                    <li><a href="#" class="active">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="#">Programs</a></li>
                    <li><a href="#">Activities</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
        </nav>

        <!-- Hero Banner -->
        <div class="header" data-aos-duration="1500">
            <h1>Joan Arc Youth Organization:</h1>
            <p>Empowering the Youth,
                Igniting Purpose, and<br />
                Leading with Courage!</p>

            <button class="know-more-btn">
                KNOW MORE <span class="arrow">➡</span>
            </button>
        </div>

<!-- Info Section -->
<!-- Info Section -->
<div class="section">
    <div class="info" data-aos="fade-left" data-aos-duration="1000">
        <h3>ARE YOU A YOUNG LEADER READY TO MAKE A DIFFERENCE IN YOUR COMMUNITY?</h3>
        <p>You're in the right place! Our organization empowers youth with leadership opportunities, skill-building programs, and community initiatives to help you grow and make a real impact.</p>
        <button class="join-now-btn">JOIN NOW</button>
    </div>



 <div class="donation" data-aos="fade-left" data-aos-duration="1000">
    <h3>Support Our Cause</h3>
    <p>Your generous donation helps us empower young leaders and make a positive impact in our community.</p>

    <h4>Select Payment Method:</h4>
   <div class="payment-methods">
    <div class="payment-option" data-payment="gcash">
        <input type="button" name="payment" id="gcash" value="gcash">
        <label for="gcash">
            <img src="IMAGES/gcash.jpg" alt="GCash" style="width: 50px; vertical-align: middle;">
            GCash
        </label>
    </div>
    <div class="payment-option" data-payment="paymaya">
        <input type="button" name="payment" id="paymaya" value="paymaya">
        <label for="paymaya">
            <img src="IMAGES/paymaya.jpg" alt="Paymaya" style="width: 50px; vertical-align: middle;">
            Paymaya
        </label>
    </div>
    </div>
    </div>

            <!-- Popup Modal -->
            <div id="popupModal" class="popup-modal">
                 <div class="popup-content">
                     <span class="close-btn" onclick="closePopup()">&times;</span>
                         <img id="popupImage" src="gcash.jpg" alt="GCash">
                  </div>
            </div>


    <div class="donation-message" id="donationMessage" style="display:none;">
        Thank you for your generous donation!
    </div>
</div>





        <!-- Activities Section -->
        <div class="activities" data-aos="zoom-in-up" data-aos-duration="1200">
            <h3>RECENTS ACTIVITIES</h3>
            <div class="gallery">
                <div class="activity-card">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/bingo.jpg" alt="Bingo Project" />
                    <p class="caption">Bingo Project</p>
                </div>
                <div class="activity-card">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/party.jpg" alt="Christmas Party" />
                    <p class="caption">Christmas Party</p>
                </div>
                <div class="activity-card">
                    <div class="activity-overlay">
                        <button class="view-more">View Details</button>
                    </div>
                    <img src="IMAGES/clean.jpg" alt="Clean Up Drive" />
                    <p class="caption">Clean-Up Drive</p>
                </div>
            </div>
        </div>

        <!-- Footer Section -->
        <footer class="footer">
            <div class="footer-container">
                <!-- Logo and About Section -->
                <div class="footer-logo-section">
                    <div class="footer-logo">Joan of Arc Youth</div>
                    <p class="footer-tagline">Empowering the Youth, Igniting Purpose</p>
                    <p class="footer-about-text">We're a youth organization dedicated to building leadership skills, community service, and personal growth through meaningful activities and programs.</p>
                    <div class="social-icons">
                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" aria-label="GitHub"><i class="fab fa-github"></i></a>
                        <a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a>
                        <a href="#" aria-label="Phone"><i class="fas fa-phone"></i></a>
                        <a href="#" aria-label="Email"><i class="fas fa-envelope"></i></a>
                    </div>
                </div>
                
                <!-- Information Links -->
                <div class="footer-column">
                    <h3 class="footer-title">Information</h3>
                    <ul class="footer-links">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Programs</a></li>
                        <li><a href="#">Activities</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                
                <!-- Useful Links -->
                <div class="footer-column">
                    <h3 class="footer-title">Useful Links</h3>
                    <ul class="footer-links">
                        <li><a href="#">Know More</a></li>
                        <li><a href="#">Volunteer</a></li>
                        <li><a href="#">Donate</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>
                
                <!-- Location and Subscribe -->
                <div class="footer-column">
                    <h3 class="footer-title">Location</h3>
                    <p class="footer-location">673 Quirino Hwy, Novaliches<br/>Quezon City, Metro Manila</p>
                    <p class="footer-location">Email: info@joanarcyouth.org<br/>Phone: +63 123 456 7890</p>
                    
                    <h3 class="footer-title">Subscribe on us:</h3>
                    <div class="subscribe-form">
                        <input type="email" class="subscribe-input" placeholder="Email" />
                        <button type="button" class="subscribe-btn">Submit</button>
                    </div>
                </div>
            </div>
            
            <!-- Copyright Section -->
            <div class="copyright">
                © 2025 - 2026 Joan Arc Youth Organization. All rights reserved.
            </div>
        </footer>

    </form>

    <!-- AOS JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <script>
        AOS.init();

        // Mobile menu toggle
        document.getElementById('menuToggle').addEventListener('click', function () {
            document.getElementById('navLinks').classList.toggle('active');
        });

        // Close menu when clicking outside
        document.addEventListener('click', function (event) {
            const isClickInsideMenu = document.getElementById('navLinks').contains(event.target);
            const isClickOnToggle = document.getElementById('menuToggle').contains(event.target);

            if (!isClickInsideMenu && !isClickOnToggle && document.getElementById('navLinks').classList.contains('active')) {
                document.getElementById('navLinks').classList.remove('active');
            }
        });

        // Activity card view details
        document.querySelectorAll('.view-more').forEach(button => {
            button.addEventListener('click', function () {
                alert('Viewing details for this activity...');
                // Add navigation logic here
            });
        });

        // Subscribe button alert
        document.querySelector('.subscribe-btn').addEventListener('click', function () {
            var email = document.querySelector('.subscribe-input').value;
            if (email) {
                alert('Thank you for subscribing with: ' + email);
                document.querySelector('.subscribe-input').value = '';
            } else {
                alert('Please enter a valid email address.');
            }
        });

        // Join now button alert
        document.querySelector('.join-now-btn').addEventListener('click', function () {
            alert('Thank you for your interest! We\'ll direct you to our registration form.');
            // Add navigation/form display logic here
        });

        // Add active class to current menu item
        document.querySelectorAll('.nav-links li a').forEach(item => {
            item.addEventListener('click', function () {
                // Remove active class from all items
                document.querySelectorAll('.nav-links li a').forEach(link => {
                    link.classList.remove('active');
                });
                // Add active class to clicked item
                this.classList.add('active');
            });
        });

        // Reference buttons
        const gcashBtn= document.getElementById('gcash');
        const paymayaBtn = document.getElementById('paymayaBtn');
        const popup = document.getElementById('popupModal');
        const popupImage = document.getElementById('popupImage');

        // Event listeners
        gcash.addEventListener('click', () => {
            popupImage.src = 'IMAGES/gcash.jpg';
            popup.style.display = 'block';
        });

        paymaya.addEventListener('click', () => {
            popupImage.src = 'IMAGES/paymaya.jpg';
            popup.style.display = 'block';
        });

        // Close function
        function closePopup() {
            popup.style.display = 'none';
        }

        // Optional: Close modal when clicking outside the popup
        window.onclick = function (event) {
            if (event.target === popup) {
                popup.style.display = "none";
            }
        };
    </script>
</body>
</html>