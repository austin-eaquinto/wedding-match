# Wedding Planner Mobile Application - Product Requirements Document

## 1. Document Control
- **Version:** 2.0
- **Last Updated:** May 28, 2025
- **Status:** Draft
- **Product Owner:** Boards and Bites Event Center, LLC
- **CTO:** Peter Nestler
- **Development Team:** BYU-I Student Mobile Team Members

## 2. Executive Summary
The Wedding Planner mobile application aims to revolutionize the wedding planning experience by providing an all-in-one digital solution that guides couples from engagement through their wedding day. The application combines traditional wedding planning tools with modern matchmaking technology to create a unique and user-friendly experience.

## 3. Product Vision
To become the leading digital wedding planning solution that simplifies the wedding planning process while connecting couples with their perfect vendors through an innovative matchmaking system.

## 4. Target Audience
### Primary Users:
- Engaged couples planning their wedding
- Wedding vendors seeking to connect with potential clients
### Secondary Users:
- Wedding party members
- Family members involved in planning
- Wedding guests

## 5. Problem Statement
Wedding planning is often overwhelming, disorganized, and stressful for couples. They struggle with:
- Knowing what steps to take and when
- Finding vendors that match their style and budget
- Coordinating with multiple stakeholders
- Managing tasks and communications effectively

## 6. MVP Feature Set & Detailed View Specifications

### 6.1 Mobile App (iOS & Android) - Detailed Screen Specifications

#### 6.1.1 Authentication & Onboarding Flow

##### Welcome/Splash Screen
**Layout Requirements:**
- Full-screen branded background with app logo
- Tagline: "Find Your Perfect Wedding Match"
- Progress indicator for app loading
- Smooth transition animation to next screen (2-3 seconds)

**Technical Requirements:**
- Check for existing authentication token
- Initialize app services and data connections
- Preload essential assets

##### Sign Up/Login Screen
**Layout Requirements:**
- Header: App logo and "Welcome Back" or "Get Started"
- Input fields:
  - Email address (with validation)
  - Password (with show/hide toggle)
  - "Remember Me" checkbox
- Primary CTA: "Sign In" / "Create Account"
- Secondary options:
  - "Sign in with Google" button
  - "Sign in with Apple" button (iOS only)
  - "Forgot Password?" link
- Footer: Terms of Service and Privacy Policy links

**Functionality:**
- Real-time email validation
- Password strength indicator for registration
- Error handling with clear error messages
- Social authentication (Google, Apple)
- Biometric authentication with secure token storage

##### Role Selection Screen
**Layout Requirements:**
- Header: "Who are you?"
- Two large card options:
  - **Couple Card:**
    - Icon: Two interlocked rings
    - Title: "We're Planning Our Wedding"
    - Description: "Find and connect with perfect vendors"
    - Bullet points: "Discover vendors", "Get matched", "Plan together"
  - **Vendor Card:**
    - Icon: Business/storefront icon
    - Title: "I'm a Wedding Vendor"
    - Description: "Connect with couples who need your services"
    - Bullet points: "Showcase work", "Get discovered", "Grow business"
- Footer: "Can't decide? You can change this later"

**Functionality:**
- Single selection with visual feedback
- Auto-progress to appropriate onboarding flow
- Analytics tracking for user type selection

#### 6.1.2 Couple Onboarding Flow (5-7 screens)

##### Basic Information Screen
**Layout Requirements:**
- Progress bar (1/6)
- Header: "Tell us about your wedding"
- Form fields:
  - Partner 1 name (text input)
  - Partner 2 name (text input)
  - Wedding date (date picker with calendar view)
  - Estimated guest count (slider: 25-500+)
- Navigation: "Back" button, "Next" button (disabled until required fields complete)

**Functionality:**
- Auto-save progress to backend
- Data validation and error handling
- Location autocomplete using mapping services
- Preference data stored with flexibility for future updates

##### Budget Range Screen
**Layout Requirements:**
- Progress bar (2/6)
- Header: "What's your wedding budget?"
- Subtitle: "This helps us show vendors in your price range"
- Budget slider with predefined ranges:
  - Under $10,000
  - $10,000 - $25,000
  - $25,000 - $50,000
  - $50,000 - $100,000
  - $100,000+
- Visual budget breakdown pie chart showing typical allocation
- "Skip for now" option

**Functionality:**
- Dynamic budget breakdown visualization
- Optional detailed budget categories
- Privacy note about budget information

##### Location Preferences Screen
**Layout Requirements:**
- Progress bar (3/6)
- Header: "Where are you getting married?"
- Primary location input with autocomplete
- "Add another location" option for destination weddings
- Map preview showing selected area
- Radius selector (10, 25, 50, 100+ miles)

**Functionality:**
- Location services integration
- Geolocation services
- Multiple venue location support

##### Style Quiz Screen
**Layout Requirements:**
- Progress bar (4/6)
- Header: "What's your wedding style?"
- Grid of style cards (2x3 layout):
  - Classic/Traditional
  - Modern/Contemporary
  - Rustic/Country
  - Bohemian/Boho
  - Glamorous/Luxury
  - Beach/Destination
- Each card shows representative image and title
- Multiple selection allowed
- "Not sure? We'll help you discover your style" option

**Functionality:**
- Multi-select with visual feedback
- Style affects matching algorithm weights
- Optional style quiz for uncertain couples

##### Vendor Priorities Screen
**Layout Requirements:**
- Progress bar (5/6)
- Header: "Which vendors are most important?"
- Drag-and-drop list of vendor categories:
  - Photographer
  - Venue
  - Catering
  - Florist
  - DJ/Band
  - Videographer
  - Wedding Planner
  - Transportation
- Instructions: "Drag to reorder by importance"

**Functionality:**
- Intuitive drag-and-drop interface
- Priority affects matching algorithm
- Default reasonable ordering provided

##### Preferences & Must-Haves Screen
**Layout Requirements:**
- Progress bar (6/6)
- Header: "Any specific preferences?"
- Expandable sections:
  - **Dietary Requirements:** Checkboxes for common dietary needs
  - **Accessibility Needs:** Options for venue/vendor accessibility
  - **Cultural/Religious Considerations:** Text input for specific needs
  - **Deal Breakers:** What you absolutely don't want
- All sections optional
- Large "Complete Setup" button

**Functionality:**
- Expandable/collapsible sections
- Free-form text inputs with character limits
- Preferences stored for detailed matching

#### 6.1.3 Main Navigation & Home Screen

##### Bottom Navigation Bar
**Layout Requirements:**
- 5 tabs with modern navigation design
- Icons and labels:
  - **Discover** (favorite icon) - Main matching interface
  - **Saved** (bookmark icon) - Saved vendors
  - **Messages** (chat icon) - Coming in Phase 2
  - **Planning** (checklist icon) - Future feature
  - **Profile** (person icon) - User settings

**Technical Requirements:**
- Custom styling with active state indicators
- Badge notifications for new matches/messages
- Smooth page transitions

##### Home/Discover Screen
**Layout Requirements:**
- Header section:
  - Welcome message: "Hi [Name], let's find your perfect [vendor type]!"
  - Wedding countdown: "X days until your big day!"
  - Progress indicator: "X% of vendors discovered"
- Filter bar:
  - Vendor category dropdown (All, Photographers, Venues, etc.)
  - Location filter chip
  - Budget filter chip
  - Date availability toggle
- Main card stack area (75% of screen)
- Action buttons at bottom:
  - "Pass" button (X icon, red)
  - "More Info" button (i icon, blue)
  - "Save" button (heart icon, green)

**Functionality:**
- Card stack with swipe gestures
- Real-time vendor loading
- Matching algorithm integration
- Swipe actions stored for algorithm improvement
- Haptic feedback and smooth animations
- Offline viewing of previously loaded vendors

#### 6.1.4 Vendor Discovery & Matching

##### Vendor Card Design (Stack View)
**Layout Requirements:**
- Card dimensions: ~90% screen width, 70% screen height
- **Top section (60% of card):**
  - Hero image carousel (3-5 images max)
  - Image indicators (dots) at bottom
  - Vendor category badge (top-left overlay)
  - Price range indicator (top-right overlay: $, $$, $$$, $$$$)
- **Bottom section (40% of card):**
  - Business name (large, bold font)
  - Location and distance
  - Star rating with review count
  - Brief tagline/specialty (2 lines max)
  - 3 key service highlights (icons + text)
  - Availability indicator for wedding date

**Interaction Requirements:**
- Horizontal swipe on images to browse portfolio
- Vertical swipe or tap for more details
- Smooth animations for all interactions

##### Vendor Detail View (Full Profile)
**Layout Requirements:**
- **Header Section:**
  - Full-width hero image with overlay
  - Back button (top-left)
  - Save/unsave heart button (top-right)
  - Vendor name and rating overlay at bottom
- **Scrollable Content:**
  - **Quick Info Bar:** Price range, location, availability status
  - **About Section:** Full business description (expandable)
  - **Portfolio Gallery:** Grid view with lightbox capability
  - **Services & Packages:** Expandable list with pricing tiers
  - **Reviews Section:** Star breakdown + recent reviews
  - **Contact Information:** Phone, email, website, social media
  - **Availability Calendar:** Interactive calendar showing available dates
- **Fixed Bottom Bar:**
  - "Pass" button
  - "Save to Favorites" button
  - "Contact Vendor" button (primary CTA)

**Functionality:**
- Photo gallery with zoom capabilities
- Contact actions with inquiry tracking
- Save state management through real-time database
- Vendor availability integration
- Progressive image loading with optimization
- Smooth scrolling experience

##### Filtering & Search Interface
**Layout Requirements:**
- **Filter Modal** (slides up from bottom):
  - **Vendor Category:** Multi-select chips
  - **Price Range:** Dual-handle slider
  - **Distance:** Single slider with mile indicators
  - **Date Availability:** Toggle for wedding date
  - **Rating:** Minimum star requirement slider
  - **Special Features:** Checkboxes (eco-friendly, LGBTQ+ friendly, etc.)
  - "Apply Filters" and "Clear All" buttons
- **Search Bar:**
  - Appears at top when scroll up gesture detected
  - Autocomplete suggestions for vendor names and services
  - Voice search capability (microphone icon)

**Functionality:**
- Real-time filter updates with result counts
- Search history and suggestions
- Filter persistence across app sessions

#### 6.1.5 Saved Vendors Management

##### Saved Vendors List View
**Layout Requirements:**
- **Header:**
  - Title: "Your Saved Vendors"
  - Vendor count indicator
  - Filter/sort dropdown (Recently Saved, Price, Rating, Category)
- **List Items:** (Card-based layout)
  - Vendor thumbnail image (left)
  - Business name and category
  - Price range and rating
  - Location and distance
  - "Last contacted" timestamp
  - Action menu (3-dot icon): Remove, Contact, Share
- **Empty State:**
  - Illustration of heart/bookmark
  - "No saved vendors yet"
  - "Discover amazing vendors" CTA button

**Functionality:**
- Swipe-to-remove gesture
- Bulk selection and actions
- Sort and filter options
- Share vendor lists with partners/family

##### Vendor Comparison View
**Layout Requirements:**
- **Header:** "Compare Vendors" with back button
- **Comparison Table:** (Horizontal scroll)
  - Vendor images and names across top
  - Comparison categories as rows:
    - Price range
    - Rating and reviews
    - Services included
    - Availability
    - Response time
    - Special features
- **Action Bar:**
  - "Remove from comparison"
  - "Contact selected vendors"
  - "Add more vendors" (max 4 comparison)

**Functionality:**
- Add/remove vendors from comparison
- Side-by-side scrolling for detailed comparison
- Quick contact options for multiple vendors

#### 6.1.6 User Profile & Settings

##### Profile Management Screen
**Layout Requirements:**
- **Profile Header:**
  - Couple photo placeholder with camera icon to add/change
  - Names and wedding date
  - Days until wedding countdown
  - Profile completion percentage
- **Settings Sections:**
  - **Wedding Details:** Edit basic wedding information
  - **Preferences:** Update style, budget, priorities
  - **Notifications:** Push notification settings
  - **Privacy:** Visibility and data sharing settings
  - **Account:** Email, password, connected accounts
  - **Support:** Help center, contact support, FAQ
- **Footer:** App version, logout button

**Functionality:**
- Photo upload with cropping capability
- Image management and storage
- Form validation
- Settings persistence
- Modern UI theming and components

### 6.2 Web App (Admin Portal & Vendor Dashboard) - Detailed Specifications

#### 6.2.1 Vendor Dashboard

##### Vendor Registration & Onboarding
**Layout Requirements:**
- **Multi-step registration form:**
  - **Step 1 - Business Basics:**
    - Business name, category, contact information
    - Business license verification upload
    - Tax ID (optional for payment processing setup)
  - **Step 2 - Services & Pricing:**
    - Service categories (checkboxes)
    - Pricing tiers (starting at, package pricing)
    - Service area (geographic coverage)
  - **Step 3 - Portfolio Upload:**
    - Drag-and-drop image uploader
    - Video upload capability
    - Portfolio categorization
  - **Step 4 - Business Profile:**
    - About us description
    - Years in business
    - Team size
    - Certifications and awards

**Functionality:**
- Progress saving at each step
- Image optimization and thumbnail generation
- Required field validation
- Admin approval workflow trigger

##### Vendor Profile Management
**Layout Requirements:**
- **Dashboard Overview:**
  - Profile views this month (graph)
  - Match rate percentage
  - Number of inquiries
  - Profile completion status
- **Profile Editor:**
  - Side-by-side preview of mobile app appearance
  - Live editing capabilities
  - Portfolio management (upload, delete, reorder)
  - Availability calendar management
- **Analytics Section:**
  - Detailed view metrics
  - Popular search terms leading to profile
  - Geographic breakdown of viewers
  - Conversion rates (views to contacts)

##### Inquiry Management System
**Layout Requirements:**
- **Inbox Interface:**
  - List of inquiries with couple names, dates, status
  - Priority indicators (wedding date proximity)
  - Response time tracking
  - Quick action buttons (respond, archive, mark as spam)
- **Inquiry Detail View:**
  - Couple's wedding details and requirements
  - Contact information and preferred communication method
  - Inquiry timestamp and source
  - Response template options
  - Status tracking (new, responded, in progress, booked, declined)

#### 6.2.2 Admin Dashboard

##### User Management Interface
**Layout Requirements:**
- **User Overview:**
  - Total users (couples vs vendors)
  - New registrations this week/month
  - User engagement metrics
  - Geographic distribution map
- **User Detail Views:**
  - Individual user profiles
  - Activity logs
  - Support ticket history
  - Account status controls (active, suspended, banned)

##### Vendor Approval System
**Layout Requirements:**
- **Pending Approvals Queue:**
  - Vendor applications awaiting review
  - Priority sorting (application date, completeness)
  - Bulk approval tools
- **Vendor Review Interface:**
  - Complete vendor profile preview
  - Business verification checklist
  - Portfolio quality assessment
  - Approval/rejection workflow with notes

##### Platform Analytics Dashboard
**Layout Requirements:**
- **Key Metrics Overview:**
  - Daily/monthly active users
  - Match success rates
  - Vendor discovery rates
  - Platform growth metrics
- **Detailed Analytics:**
  - User behavior flow diagrams
  - Popular vendor categories
  - Geographic activity heat maps
  - Revenue tracking (future monetization)

## 7. Technical Architecture

### 7.1 Mobile App Technical Stack
- **Frontend Framework:** Flutter
- **State Management:** Bloc/Cubit or Provider
- **Navigation:** Modern navigation system
- **Authentication:** Social providers (Google, Apple)
- **Real-time Updates:** Live data synchronization
- **File Upload:** Progress tracking and optimization
- **Local Storage:** Offline capability support
- **Image Handling:** Cached loading with transformations
- **Push Notifications:** Cross-platform messaging
- **Analytics:** User behavior tracking
- **UI Components:** Modern design system with custom theming

### 7.2 Backend Architecture
- **Backend-as-a-Service:** Supabase (PostgreSQL with real-time capabilities)
- **Authentication:** Social login integration
- **File Storage:** Image, video, and document management
- **API Layer:** Auto-generated REST and GraphQL APIs
- **Real-time Features:** Live data subscriptions
- **Edge Functions:** Custom business logic processing
- **Image Processing:** Automatic transformations and optimization
- **Search:** Full-text search capabilities

### 7.3 Matching Algorithm Concept
The matching algorithm will use a weighted scoring system based on:
- **Location compatibility (40% weight):** Distance and service area coverage
- **Budget alignment (30% weight):** Price range matching
- **Style preferences (20% weight):** Aesthetic and service style matching
- **Quality metrics (10% weight):** Ratings and review scores

The algorithm will learn from user interactions (swipes, saves, inquiries) to improve future recommendations and avoid showing previously rejected vendors.

## 8. User Experience Requirements

### 8.1 Performance Standards
- App launch time: < 3 seconds
- Image loading: < 2 seconds for high-quality images
- Search results: < 1 second for filtered results
- Offline functionality: Basic browsing of previously loaded content
- Battery optimization: Minimal background processing

### 8.2 Accessibility Requirements
- WCAG 2.1 AA compliance
- Screen reader compatibility
- High contrast mode support
- Text scaling support (up to 200%)
- Voice control compatibility
- Color-blind friendly design

### 8.3 Design System
- **Color Palette:**
  - Primary: Soft rose gold (#E8B4A0)
  - Secondary: Sage green (#A4B494)
  - Accent: Blush pink (#F4D7DA)
  - Neutral: Warm gray (#8B8680)
- **Typography:**
  - Headers: Playfair Display or similar serif
  - Body: Inter or similar clean sans-serif
  - Minimum 16px for body text
- **Iconography:** Consistent icon family (Feather, Material, or custom)

## 9. Data Models & Core Entities

### 9.1 User Data Structure
**User Profile (Couples):**
- Basic Information: Names, email, wedding date, guest count
- Budget Information: Range and detailed allocation preferences
- Location Data: Primary location, coordinates, search radius
- Style Preferences: Wedding style categories and priorities
- Vendor Priorities: Ordered list of important vendor types
- Special Requirements: Dietary, accessibility, cultural considerations
- Profile Status: Completion percentage and onboarding progress

**Vendor Profile:**
- Business Information: Name, category, contact details, location
- Service Details: Pricing ranges, service areas, specialties
- Portfolio: Images, videos, descriptions, and categorization
- Availability: Calendar integration and booking status
- Verification: Business license, approval status, quality metrics
- Performance: Ratings, reviews, response times, and analytics

### 9.2 Core Relationships
- **User-Vendor Interactions:** Save actions, inquiries, swipe history
- **Vendor-Image Associations:** Portfolio management and display ordering
- **Inquiry Management:** Communication tracking between couples and vendors
- **Matching History:** Algorithm performance and preference learning

## 10. Testing Strategy

### 10.1 Mobile App Testing
- **Unit Tests:** Component logic, utility functions, data transformations
- **Integration Tests:** API connections, data flow, navigation
- **UI Tests:** User interaction flows, visual regression testing
- **Device Testing:** iOS/Android compatibility across device sizes
- **Performance Testing:** Loading times, memory usage, battery impact

### 10.2 Web Dashboard Testing
- **Functional Tests:** All CRUD operations, workflow processes
- **Browser Compatibility:** Chrome, Firefox, Safari, Edge
- **Responsive Testing:** Desktop, tablet, mobile breakpoints
- **Load Testing:** Multiple concurrent admin users

### 10.3 User Acceptance Testing
- **Alpha Testing:** Internal team testing with real wedding scenarios
- **Beta Testing:** Limited group of engaged couples and vendors
- **Usability Testing:** Task completion rates, user satisfaction scores

## 11. Success Metrics & KPIs

### 11.1 User Acquisition
- Monthly active users (couples and vendors)
- User registration conversion rate
- Organic vs. paid user acquisition cost

### 11.2 Engagement Metrics
- Daily app opens per user
- Time spent in app per session
- Vendor profile views per couple
- Swipe-to-view ratio
- Profile completion rates

### 11.3 Matching Success
- Vendor inquiry rate
- Vendor response rate to inquiries
- Successful bookings (tracked via follow-up)
- User retention through wedding planning process

### 11.4 Vendor Success
- Vendor profile visibility metrics
- Inquiry-to-booking conversion rates
- Vendor satisfaction scores
- Vendor retention and renewal rates

## 12. Risk Assessment & Mitigation

| Risk Category | Specific Risk | Impact | Probability | Mitigation Strategy |
|---------------|---------------|---------|-------------|-------------------|
| **Market** | Low vendor adoption | High | Medium | Vendor incentive program, direct outreach, partnership with local wedding associations |
| **Technical** | App performance issues | High | Low | Comprehensive testing, performance monitoring, staged rollout |
| **User Experience** | Poor matching algorithm | Medium | Medium | A/B testing, user feedback integration, algorithm iteration |
| **Business** | Slow user growth | High | Medium | Marketing campaigns, referral programs, influencer partnerships |
| **Competition** | Major competitor launch | Medium | Medium | Unique feature development, strong brand positioning |
| **Legal** | Data privacy concerns | High | Low | GDPR/CCPA compliance, transparent privacy policies, security audits |

## 13. Launch Strategy

### 13.1 Soft Launch (Phase 1)
- **Target:** BYU-I local market and surrounding areas
- **Duration:** 3 months
- **Goals:** Validate product-market fit, gather user feedback, refine features
- **Success Criteria:** 500+ couple registrations, 100+ vendor profiles, 70%+ user satisfaction

### 13.2 Regional Expansion (Phase 2)
- **Target:** Idaho, Utah, surrounding mountain west
- **Duration:** 6 months
- **Goals:** Scale user base, prove business model, optimize operations
- **Success Criteria:** 5,000+ couples, 1,000+ vendors, positive unit economics

### 13.3 National Rollout (Phase 3)
- **Target:** Major metropolitan areas across US
- **Duration:** 12+ months
- **Goals:** Establish market leadership, achieve profitability
- **Success Criteria:** 50,000+ couples, 10,000+ vendors, sustainable growth

## 14. Future Product Roadmap

### Phase 2 Features (3-6 months post-launch)
- In-app messaging system between couples and vendors
- Basic task management and wedding planning tools
- Vendor inquiry tracking and management
- Review and rating system

### Phase 3 Features (6-12 months post-launch)
- AI-powered planning recommendations
- Budget tracking and expense management
- Guest list management integration
- Wedding registry connections

### Phase 4 Features (12+ months post-launch)
- Virtual venue tours and 3D experiences
- Wedding planning collaboration tools for families
- International market expansion
- White-label solutions for wedding planners

## 15. Appendices

### Appendix A: Competitive Analysis
- The Knot, WeddingWire feature comparison
- Pricing model analysis
- User review analysis of existing solutions

### Appendix B: User Research Findings
- Interview summaries with engaged couples
- Vendor pain point analysis
- Market size and opportunity assessment

### Appendix C: Technical Architecture Diagrams
- System architecture overview
- Database schema design
- API flow diagrams
- Security and data flow documentation

---

**Document Status:** This PRD serves as the foundation for MVP development and will be updated iteratively based on user feedback and market validation.

**Next Steps:**
1. Development team technical review and estimation
2. UI/UX design mockup creation
3. Development sprint planning and timeline establishment
4. Vendor partnership and beta user recruitment initiation
