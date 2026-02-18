# RHTAS Console UI - Features

## Overview
Web-based frontend for Red Hat Trusted Artifact Signer (TAS) providing workflows for verifying signed software artifacts, viewing trust metadata, and interacting with Sigstore services (Rekor, Fulcio, TUF).

---

## Core Features

### 1. Artifact Verification
- **Container Image Search** - Search and verify container images by URI (e.g., `docker.io/library/nginx:latest`)
- **OCI Registry Integration** - Fetch image metadata from OCI registries
- **Sigstore Verification** - Verify signatures and attestations using Sigstore
- **Subject Alternative Name (SAN) Verification** - Verify with expected SAN
- **Verification Status** - Display overall status (verified/failed/unsigned)

#### Artifact Summary Display
- Digest (SHA256) with copy-to-clipboard
- Media type, size, and creation date
- Labels and metadata
- Deduplicated identity list (signers)
- Signature, attestation, and Rekor entry counts
- Time coherence (min/max integrated time)

#### Signature Management
- List of signatures with verification status
- Per-signature details (identity, digest, timestamp, status)
- Verification status breakdown (Signature/Chain/Rekor)
- Leaf certificate details (subject, issuer, SANs, validity dates, serial number, CA flag)
- Certificate PEM viewer with copy functionality
- Certificate chain visualization (intermediate + root)
- Expandable accordion for chain exploration
- Rekor entry integration (entry type, log index, integrated time, log ID, tree size, proof depth)
- Signed Entry Timestamp (SET) display
- Direct link to Rekor Search
- Download verification bundle (JSON)

#### Attestation Management
- List of attestations with type and status
- Attestation details (type, predicate type, payload type)
- Signing certificate display
- Certificate chain viewing
- Rekor entry integration
- Timestamp tracking
- Verification status
- Raw statement JSON viewer

---

### 2. Trust Root Management
- **TUF Repository Integration** - Fetch and display TUF metadata
- **Certificate Health Dashboard** - Visual health status of all certificates
- **Certificate Lifecycle Management** - Track active, expiring, and expired certificates

#### Overview Tab
- Certificate health donut chart (by status: active/expiring/expired)
- Expiring certificates list (sorted by expiration date)
- TUF repository URL display and linking
- Certificate count summary

#### Certificates Tab
- Certificate table with filtering and sorting
- Filter by subject (search) and status (multiselect)
- Sort by expiration date
- Pagination support
- Expandable rows with full PEM display
- Actions: Copy PEM, Download PEM
- Certificate details (issuer, subject, target, type, status, expiration)
- Visual status indicators (active/expiring/expired)

#### Root Details Tab
- TUF root metadata display
- Latest version tracking
- Expiration date monitoring
- Status validation (valid/expired)
- Repository URL
- Version history

#### Error Handling
- Repository not initialized detection
- Certificate does not exist handling
- Error retrieving certificate messages
- Metadata not available states

---

### 3. Rekor Transparency Log Search
- **Multi-Attribute Search** - Search by email, hash, commit SHA, UUID, or log index
- **Entry Viewing** - View detailed Rekor entry information
- **Pagination** - Browse results (20 entries per page)
- **URL Persistence** - Search parameters saved in URL

#### Search Capabilities
- Email (signer email address)
- Hash (SHA1/SHA256)
- Commit SHA (for gitsign entries)
- Entry UUID
- Log Index
- Form validation per attribute type
- URL parameter persistence for deep linking

#### Entry Display
- UUID (clickable link)
- Log Index (clickable link)
- Integrated time (relative and absolute)
- Entry type (hashedrekord/intoto/dsse)
- Type-specific viewers:
  - HashedRekord
  - Intoto v0.0.1
  - Intoto v0.0.2
  - DSSE (Dead Simple Signing Envelope)
- Expandable sections:
  - Raw Body (YAML format)
  - Attestation (if present)
  - Verification (inclusion proof, SET)

#### Settings
- Configurable Rekor endpoint URL
- Override default public endpoint
- URL validation
- Persistent settings across sessions

---

### 4. Certificate Management
- **X.509 Certificate Parsing** - Parse and display certificate details
- **Certificate Chain Visualization** - Visual representation of certificate chains
- **Role Identification** - Identify leaf/intermediate/root certificates
- **PEM Export** - Copy and download certificates in PEM format
- **Certificate Health Tracking** - Monitor certificate expiration and status

---

### 5. API Integration
- **REST API Client** - Auto-generated from OpenAPI specification
- **Mock Data Support** - Development mode with mock data (`MOCK=on`)
- **React Query Integration** - Efficient data fetching and caching
- **Health Checks** - Server health monitoring

#### Artifact APIs
- Retrieve container image metadata
- Verify artifact signatures and attestations
- Get policies and attestations for artifacts

#### Trust APIs
- Get Fulcio and Rekor metadata from TUF
- Get TUF root metadata versions
- Get TUF targets list
- Get specific TUF target file content
- Get certificate information from TUF targets

#### Rekor APIs
- Retrieve entry by UUID
- Get Rekor public key
- Direct Rekor client integration

---

### 6. UI/UX Features
- **PatternFly v6 Design System** - Modern, accessible UI components
- **Responsive Design** - Mobile-friendly layouts
- **Loading States** - Visual feedback during data fetching
- **Error Boundaries** - Graceful error handling per route
- **Empty States** - Helpful messages when no data available
- **Status Indicators** - Visual status badges and icons
- **Copy-to-Clipboard** - Quick copy functionality for hashes, PEMs, etc.
- **Expandable Sections** - Collapsible content areas
- **Deep Linking** - URL-based navigation with parameters
- **Lazy Loading** - Route-based code splitting for performance

---

### 7. Data Display & Formatting
- **Time Display** - Relative timestamps and formatted dates
- **Certificate Formatting** - Human-readable certificate details
- **JSON Viewers** - Syntax-highlighted JSON display
- **YAML Viewers** - Formatted YAML display
- **Hash Display** - Shortened hashes with full copy
- **File Size Formatting** - Human-readable size units

---

### 8. Navigation
- **Three Main Routes** - Trust Root (default), Artifacts, Rekor Search
- **Breadcrumb Navigation** - Contextual navigation trail
- **Direct Linking** - Shareable URLs with search parameters
- **Page Metadata** - Dynamic page titles and descriptions

---

## Development Features
- Unit testing (Vitest)
- E2E testing (Playwright)
- Code coverage instrumentation
- ESLint + Prettier code formatting
- TypeScript type safety
- OpenAPI client generation
- Mock data for offline development
- Hot module replacement (HMR)

---

## Architecture
- **Monorepo Structure** - Four npm workspaces (common, client, server, e2e)
- **React SPA** - Single-page application with React 18
- **Vite Build System** - Fast development and production builds
- **Express Server** - Production server with API proxying
- **OpenAPI-First** - API client auto-generated from spec
