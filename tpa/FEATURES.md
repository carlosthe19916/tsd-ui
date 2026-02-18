# Trustify UI Features

## Overview
Trustify UI is a React-based web application for software supply chain security, providing comprehensive management and analysis of SBOMs (Software Bill of Materials), security advisories, vulnerabilities, packages, and licenses.

## Core Features

### Dashboard & Monitoring
- **Home Dashboard** - Centralized monitoring overview
- **Watched SBOMs** - Monitor up to 4 SBOMs with vulnerability tracking
- **SBOM Vulnerability Visualization** - Donut charts showing vulnerability status
- **User Preferences** - Persistent dashboard configuration

### SBOM Management
- **SBOM List** - Browse and search all SBOMs with advanced filtering
- **SBOM Details** - View comprehensive SBOM information including:
  - Overview and metadata
  - Package dependencies
  - Associated vulnerabilities
- **SBOM Upload** - Upload new SBOMs to the system
- **SBOM Scan** - Analyze SBOM files for vulnerabilities without persisting them
- **Label Management** - Tag and organize SBOMs with custom labels
- **Export Capabilities** - Export SBOM data

### Advisory Management
- **Advisory List** - Browse security advisories with filtering and sorting
- **Advisory Details** - View detailed advisory information including:
  - Overview and metadata
  - Associated vulnerabilities
  - CVSS scores and severity ratings
- **Advisory Upload** - Upload new security advisories
- **Label Management** - Organize advisories with custom labels

### Vulnerability Management
- **Vulnerability List** - Comprehensive vulnerability tracking
- **Vulnerability Details** - Detailed vulnerability information including:
  - Overview and metadata
  - Related advisories
  - Affected SBOMs
  - CVSS scoring
- **Cross-referencing** - Link vulnerabilities to advisories and SBOMs
- **Severity Filtering** - Filter by vulnerability severity levels

### Package Management
- **Package List** - Browse all software packages with filtering
- **Package Details** - View detailed package information including:
  - Package metadata
  - Associated SBOMs
  - Known vulnerabilities
  - License information
- **Vulnerability Tracking** - View vulnerabilities per package
- **License Information** - Display package licensing details

### License Management
- **License List** - Browse and search software licenses
- **License Filtering** - Advanced filtering and sorting capabilities

### Data Import Management
- **Importer List** - Manage automated data importers
- **Importer Configuration** - Create and configure importers
- **Import Progress Tracking** - Monitor importer status and progress
- **Status Indicators** - Visual feedback on importer health

### Search & Discovery
- **Global Search** - Search across all entity types (advisories, vulnerabilities, SBOMs, packages)
- **Tabbed Search Results** - Organized search results by entity type
- **Advanced Filtering** - Complex filtering across all list views

## Technical Features

### User Experience
- **Persistent Table State** - Save filters, sorting, and pagination in URL parameters
- **Shareable URLs** - Share filtered/sorted views with colleagues
- **Responsive Design** - PatternFly 6-based modern UI
- **Loading States** - Clear feedback during data fetching
- **Error Handling** - Comprehensive error boundaries and user feedback

### Authentication & Security
- **OIDC Authentication** - OpenID Connect integration with Keycloak
- **Optional Authentication** - Can be disabled for development/testing
- **Session Management** - Automatic token refresh
- **Bearer Token Authorization** - Secure API communication

### Data Management
- **Real-time Updates** - TanStack Query for efficient data fetching
- **Client-side Caching** - Optimized data retrieval
- **Automatic Cache Invalidation** - Keep data synchronized
- **Pagination** - Efficient handling of large datasets

### Developer Experience
- **TypeScript** - Full type safety throughout the application
- **OpenAPI Integration** - Auto-generated API client from OpenAPI spec
- **Code Splitting** - Lazy-loaded routes for optimal performance
- **Comprehensive E2E Tests** - Playwright-based testing with BDD support
- **Biome Linting** - Consistent code quality and formatting

## Deployment Features

### Containerization
- **Docker Support** - Containerized deployment
- **Multi-architecture Builds** - Support for multiple platforms
- **Production Server** - Express.js server with API proxying
- **Environment Injection** - Runtime environment configuration

### Configuration
- **Environment Variables** - Flexible configuration via env vars
- **Proxy Configuration** - API and auth proxying
- **Custom Branding** - Configurable branding assets and strings
