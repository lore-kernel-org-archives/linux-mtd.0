Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7E3C5B549
	for <linux-mtd@archiver.kernel.org>; Wed, 28 May 2025 06:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePvrJqAopzxoT8anleCVpf5K7yXsFOQOGxmaqpv55vs=; b=IKMBxTlCnriIyU
	V+XX7re+B0hcblZYMOHwdeU/aUANaMFp6RhJ6rync7EDH/0LNgTJeMaG8uKUM7tsy4jYRtpVy5/+1
	AXfYaXhjUjIAF7cGJuLfZPeDdU8MDBclSEpJjVvHngD/QlCuQ+brmd+14YvPYl/sBCn2gK242N7Nl
	fIc2U3ZiRlk3kI4EmS1pkiPfnboFEdU6+w31Mo4b7rEt7+uk0rbF+25tsKt5CwkoDkj7dcqH718gu
	a7mhCjMnkiazSKyjVvMd/AwGBO9+V036L6/G2F3zbBD26TRGUkFe4DoQtVRkh3176PJE+p6VitGHR
	rj0UnJ0XTZRk1qczA5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKALg-0000000CIka-3M6j;
	Wed, 28 May 2025 06:33:12 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAJ5-0000000CIVv-2yQK
	for linux-mtd@lists.infradead.org;
	Wed, 28 May 2025 06:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748413832; x=1779949832;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qh+5qQGUmyneG+YSval5fXafrkuvaEbUjgSKC+6cbw8=;
  b=jotKGVtJG+MI9Ip4vyrOcEImnqtnmfe+NHhTSWICTuWttn0hJwYF2yxy
   +8epUz+3tfYYNgayRrNM7/itwM3yVDhCaovCxnBzGAcgfuUlDKhnienvI
   As74ki9ELohCA2Zd/he8RyrvjD1fA7JWjtps/UdIHehFIb82UhmfAMVrG
   hdkGCgR0tKYMUl0vFiR04mA9TBmhs7C4NnUj/RMLFuxYiBmpUC4nDu++B
   Fqb+QLCrh/c7K69ESwkDUUF1DYLpTUrFoAnbpuVLG4ANOqoEX16mj84ku
   mnKK6Ca98prRWr9EbIf6XDgFvCDjqEi9J8iCgiJvwG0aPS9rRbWP5IxIA
   A==;
X-CSE-ConnectionGUID: OH7+Jx2VTeuvA69wAZvaWQ==
X-CSE-MsgGUID: 2BoIaZEqRwayAczhcfRbAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="61479515"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="61479515"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 23:30:30 -0700
X-CSE-ConnectionGUID: JTq1tkPDSEerGcSAkAAYoQ==
X-CSE-MsgGUID: aQ/GtKGLQQKhl6dNz9qovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; 
   d="scan'208";a="143060980"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 23:30:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 23:30:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 23:30:28 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.85)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 23:30:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEGBZaGqSGuVFkkvZGp/HJIsbHHvxERdmNUYk0DfwZFLXmOfPIiuDp3443UHhhPkL19TiM1vUFmpc1oLPMCU5YRGwy6FwRFB2u/AeoqQ2MU0rJ0NFIRMIBRHA+mgkHnGBiZrvi7Zbb9L5ykz2PpIY7X+ukem8m+EmxjKrCkeoei5FGg5PuP3ozhU0SwwE4pbyfkUfbwIqSNfXC69uAV6b6wI1h0qWCIp+43i6O7vzcCHdFc4YLokSOSnjK6wcfVhc3/MsRcV/qIsgZiqXNpgKwwlvnIqZXjP3RZM8HUMCrJWsMDCk6yMoK6ciXDjIE1uQ5UA6icrBLQak+FoGbQZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qh+5qQGUmyneG+YSval5fXafrkuvaEbUjgSKC+6cbw8=;
 b=A4nw1NnAmPmPW/wmz7H+yxKsU9E1XOc0I9j38Vt2R2Q4NqIsz+mLeDvd4HqaVv6pXdghcs73SPR+qxP2Q1wg/zmsd9icXIMQfru1AO+FsDhqjxf8W9LQaFkHl7u8Q6EBk9/8NETM+hzK203bXM0wpi4hjtCAYuBCx4q5j1vf55DGTvID5JRn1hjc1hHvnc5mZb4CmqBV/geacyWwCDSG4zXS//+gjgchRdgYkI/hmxaXDLxzn3FfBQzggxHADvpv0IV14dmLBB8y+geqswhaOON5lk4sEb+bWLGaU1RMM1Ak5omYX0nxScrv+VMaYiz211inrelihsb9GbxUZGFxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH3PPF10E309DEE.namprd11.prod.outlook.com (2603:10b6:518:1::d08) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 06:30:12 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 06:30:12 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
	<thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
	"Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev, Reuven"
	<reuven.abliyev@intel.com>, "Weil, Oren jer" <oren.jer.weil@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Topic: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Index: AQHbxaAaBNngr+ItyEmq2P6oEpoBdrPhoi0AgARsrvCAANKXgIAAxyUg
Date: Wed, 28 May 2025 06:30:11 +0000
Message-ID: <CY5PR11MB6366553CD5F8AFF3AC928F75ED67A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
 <aDGfgubuFfa3e0K_@black.fi.intel.com>
 <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <aDYGUzSWLdeyzpQ_@black.fi.intel.com>
In-Reply-To: <aDYGUzSWLdeyzpQ_@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH3PPF10E309DEE:EE_
x-ms-office365-filtering-correlation-id: aa55e935-2190-4e7a-3a8a-08dd9db1198d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SjNmREJuckc4YXljVGsxRFhqMUpnY3ZCTkZZK2JaejVCNGtFd21uMHVRcGFG?=
 =?utf-8?B?MkpjUW9GalhGWC9tVkdFUkQ1VEt1Z2xQZ1FvS0NFUGYvRjVKYzZ1NGNCNGFq?=
 =?utf-8?B?bXpsWVlEWGJCRytrRjN5MlFuZ2xHVUFsN0orbnlmRjAxU1NJN0FnWDhQUkNP?=
 =?utf-8?B?cXJMdXBMdjROVkhKYjliYTY1QlBQcVpYaXRDdEx0R202TkVJTnBOTnFqaCto?=
 =?utf-8?B?STNhNnhvV0lvenpiWFhMREZteDJ0TGRObzUwU2NKRzZzckVBakoyZ0VmYXVV?=
 =?utf-8?B?aXc5d2h6ekdRU2VYYTZadUltV2FWcGxYeHh1T1FmZ3QyWlA1ZTBXaHovdGdk?=
 =?utf-8?B?VDUzQ2FZVGU3ekZDbFdveks5eHBjcGFMby9zR3pQeTFKYW4xOEJBbDJoRXBP?=
 =?utf-8?B?M2VsWEZEaXFLUVFxRWNDQXVXanNnaVhJbzVmWUd4Tkkxd2ZaOUVMUzQ0bW9P?=
 =?utf-8?B?alZ4ZWxQZVR4UEc5VjFmVkZ4Mk1yQU50UmdHWGlSN3lFcE5rY1ZzNERkZjZK?=
 =?utf-8?B?V3U0b2xyeDhJZkFPcTZWR3hvUG1xb0hPMHJETTR5djgySEV4MEQ3QXNSL3A4?=
 =?utf-8?B?NEdtRmVLeEw3aVo1SURZVG8zeS83QXRBOU82QVpUVjlIZWlpMXdZL2VPV0lh?=
 =?utf-8?B?UFFCc3dOZVRTSWFXR0hvaFdJMEdTcng4WnBYOGZOTXZjWDhXMDM5dW9rTDZT?=
 =?utf-8?B?cTNmZ29ZSE56c3lQdU16cUt1ZXdOOVRqeGdvR3ZGcU9uUFcvYmgyQ2pBYUpU?=
 =?utf-8?B?bFI0VXo1MDEvOFliV3pYSEhTdGtZZUdrTTBXYVh1REs0OE94UUNqaVdkdTlk?=
 =?utf-8?B?cnRQT3k5bitrWmw3MW81OFNOQmVLbXNNZzVNNklta01OZDZwSHE5SW5BUkJl?=
 =?utf-8?B?NjFYV0o0WlVwZGJZSUhqV3BMZXJqRXJTR3dHWWQwT1YrNGtmS012Vnh5M2lq?=
 =?utf-8?B?UXdGRmpVZHByaVN0Slpac3h1NS83WTdIcm1OU3FycjVQMXdtbC8zUkY2ZEJZ?=
 =?utf-8?B?RHFZN25pZlRPODlNanVMYTh4aW8wMmZreHlRdGVzK3B4OERQMW5yUkZGTGxX?=
 =?utf-8?B?WUFNVjBLR3BuWnFFc0g2Z3BRRWtreS9jQkFaNUV4VytaaU11dUlWck93SHhL?=
 =?utf-8?B?MDJiQzVheEhRbEdBM2NZaktQdVBLYXhPOTIzVHRWQUNhL250L2duWFh0TTlN?=
 =?utf-8?B?dHNZdXNEUng0TTFJU2NzT3RQR2V6ZUNldFBjZXdOemhLOXpURWVkV3FRcVJ4?=
 =?utf-8?B?L0tvdWxESW9QWmlWNnU3MnpkRTdQbFVNUmd0Y3pTMEpHbTRqRStvdHNDUVFp?=
 =?utf-8?B?YjArcFVLQUhtTHdMZ3BQd1JJTzlSOWh5VGVkVmlreWtLbWhsOC9tOGFuaVpE?=
 =?utf-8?B?V0dXU2ZjVlRJMjNQWXFhSGhqUDcyM2JGdG9hZjEvbEF5eGZtM2V5RGxBWmxx?=
 =?utf-8?B?L3BFbjBmNVUvR0FLSjE1ZUpNUWI4TVArZXg5RXZheDBwajd5TGlhdWI0OU9C?=
 =?utf-8?B?UTdkYm0wSlJZaU9wdG9FWXJmT1J1YzIvbERCV281dG5Cb3pIc0doRUdMR0pY?=
 =?utf-8?B?RGtBb0J1TUhuekVWRjJheGl0ZTJKS0NUNCs5WDU0U0VCWXhEYkptcUEyaUFh?=
 =?utf-8?B?OUR2Z2R3NkJBcGVkSmloelZXUVplbklYQmFrdXpNcU1laGNrRCsrR0RDZjRE?=
 =?utf-8?B?eWRoY2lTSm9STnY3bGZsTEpqbU9Hc2gxQ2VNbk1raXMxaU9VK3pSVFgrVElh?=
 =?utf-8?B?ZDRmb05LUm5MV0Z0NHFyS3N3MEN2RzJTNTFkN1l0VzB3VDluLzlmZmdKRGFV?=
 =?utf-8?B?Sis1bmlITGFLZ1RFc3FhL01VbFBDSndtY0dycUFtVU8vQ0gyZ3AvaDRIVVl4?=
 =?utf-8?B?a0VLWW5EUkZqcmFUZWQxS09JOERLQ2MranczWitwdkp6ZlhpYkxFR3FZOUJT?=
 =?utf-8?B?NTM2bUMycXIzejlMTFNDcEpxZUNRNHhZc045eTcvcEJ5Qm5mMDlsbEYrNVhI?=
 =?utf-8?Q?bj78l7JNwRXDIscEhk88k4wGPd2u4E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmVtUjJXZVNTKytkTy9zeHoySHh2OE5BQ1JkRWVwUTVKTTJhUk5oaG01YWh0?=
 =?utf-8?B?Vmw5WENCMkRlVjhLNDUwQkNHTGJaVldWbmwxajFuWUNZaEZVWTFJb0NpSEhv?=
 =?utf-8?B?V0NKOUdkLytyVEwvOXBFQnBVQzZrL29sSURzbU1JTVJlVkxlQ3RjaWlFUk5H?=
 =?utf-8?B?bnRJaG5hOXA3Q3o1bE4rdi9kQXoyandhRlRNbmZoWXJ4akt4TWduaGc3R0dm?=
 =?utf-8?B?bUM4VU1YdWpCOVp2Skdaaml0dEoxVUQ3SHlieTAyQ2Q3NjkvbStVS1p2bU54?=
 =?utf-8?B?dXBaVFd3Z2U5aE1DZ3h6NXVNR0dlQWk1dTVKS3VTUFdCUmF0aXJCaVdvYlpD?=
 =?utf-8?B?M3hyNkdiS2RJSlh0eUNOZlBGVzNYbWZhOUNRUzM1NTJMRkZNOG1wTVE3eElF?=
 =?utf-8?B?TUh1UTcyd0RMZHJRdmN3Rk51WkNwQ2pqY0Jvd2pySkZGYnhCdzFmMGVFSVZV?=
 =?utf-8?B?S1BqL2hwaFppa01kZncrYTVOd0xpZWp6cVlVaEY2dUNkRldFUFZBaDF4OG0z?=
 =?utf-8?B?ZUZ0WlNrVDRXSStQdkNFbCtrb0pKMHpFclhDdEdSU2lSRWlpdTBXd3FqOFdK?=
 =?utf-8?B?Ly8vRXozZllqa0I2aXJlaWxwczNaV29ES2hzc0RoNGIzUzJ4bUovMnh3SElm?=
 =?utf-8?B?ejlNbjEvOVNHUEhMcFJFbVd2Z2x1UnhmSDlKNHRzSW5MbkZaWCtTY2FvRys0?=
 =?utf-8?B?bmZnSS9NQ3VCUExLRWNMWTJSdk9VdXRWSFNpL3M2ZUl0OFlDQ0tBeEk5bTJC?=
 =?utf-8?B?cW8xd1pqNmRwQ0ZNekN2QS9BRmtjTWt6Z3Jtc0FraEUyczZWRnR1bzh2TW1S?=
 =?utf-8?B?c1kzUmxzYUp6T3pqMDNsUjE2a2VRdm5kUm5yZlFBSThQeVl4M2Q4c2t0M0ty?=
 =?utf-8?B?dFk4WmFWZG5mc0FJajNRUDNhZDNUeTRvME1BVHhTQXpkZ3R4NForeExRNW9U?=
 =?utf-8?B?WmQxTzFkcmZiUGpnOFJmb1hrQkFZRGU2S0RKaUl5aUl3a2huWTdUSVpKS2NS?=
 =?utf-8?B?WTkxQUVWS1MvdHJac2Z2ajdDbDV0WU9oSFZYNGlDU0hRbjFvYzdvWjZyWXNN?=
 =?utf-8?B?dG5IRUVFaFlaZkt6VE04bisyZnlBcDhqOWpoTW8rMFhMVmxWdGgzYkg5U05W?=
 =?utf-8?B?NXNWc1dmVHBzNDZObmVGemJuc1ZWOWZhbUQ1eHdLY2JhWGp6RUFXcjV1RmVJ?=
 =?utf-8?B?TG01NHlRVjgreVRjUHNTRmNkYmZNSzEzbkZWdDFnNEVIYVFjcEtGaEx2UnZV?=
 =?utf-8?B?VkVySWNXRUlJUjN1OUxQU2NVbW14cmJPQkZ1NlA1VTZSYTlZZFF2a3ZaUjZZ?=
 =?utf-8?B?TFk3SGZ2S0FxZVF2ck5WcFFXMlM4RGcxME5ianVJZkJtOVFoWkp4dDdFd0Uw?=
 =?utf-8?B?OEI2VFVLRTBFNVhYWitVeUhKUTZTUFRjdDNkUnlaaW5vNW5vM09HMHBvZFhv?=
 =?utf-8?B?eGpPQXZyNEZEdmp6Y1cyNkN6OU9ndUFPaWNpRCs0b0hWVW5lUytFTjNkVUN2?=
 =?utf-8?B?S3B2VU1WSll5VmVEU25QSDhiUVc5TlZSYVBmQ2tmTmkyMWxzRzhqQ1I5aUxk?=
 =?utf-8?B?MWVDMlNrSzNRVS91c0FHK1J2ZGVoRk9OMHdUb0tWNmZGVjNWM3VXUzJFSkJP?=
 =?utf-8?B?cVdMdVp2cE1BKzAxQWtkVnMvM0xxaGVrZW9IN1JXM1oxM1RLbk9yd1pkTmFj?=
 =?utf-8?B?UEVRcUJtRXdyY2t6MDR4dVlCYUlGZCs0OXlHaG5HT1YrYXdQOEIvU2k5N3R0?=
 =?utf-8?B?S2FDNFBLUGhmbkFMYld2cnZRNDZ2RTVIWnFuRW4xVHM3TmtkZm1rS2VjMEpY?=
 =?utf-8?B?cHpNRXRleE1KK0paMnhhQ2lFUDBoeHFsWCtha09jS3ZJWDNFWkZlYWoya0xX?=
 =?utf-8?B?Q2VZVVFOYnRibkYvTkxFUVhFS2t6dVpFNnNZN2ZNdElEdnV3V2YxVHRvSGNM?=
 =?utf-8?B?eURQbUhoVW5zQUZ1ZUdGUVdzUWdCL01WNU9LY1lMV3NZeE8rY1crSk1iNmxh?=
 =?utf-8?B?OHM4V3dvcGpLSzlTYkFTdGZadU40RS9lMkJxZDhzRzhzVld3UmFwYk5GeVhn?=
 =?utf-8?B?NUpYRFRtaVROSWNHL3hYbFppbC9sVXhxV0txd2hBMjlTM2EyRXBrdzlXcnZa?=
 =?utf-8?Q?JJLOyVCNMop03k5A1nmRPhhjb?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa55e935-2190-4e7a-3a8a-08dd9db1198d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 06:30:11.9640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tLZYDG38b0eUEDEAEGrka7Lx3Zw4Iizal921ZSFmg1z2gNLhTYf68DiLL4kewQDMmJtO4BjmzsDQfBtOWB2v7RGOGnG4SXdFTZBcycKaHb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF10E309DEE
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_233031_825814_46B18A97 
X-CRM114-Status: GOOD (  13.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile
> memory device
> 
> On Tue, May 27, 2025 at 11:55:13AM +0530, Usyskin, Alexander wrote:
> > > Subject: Re: [PATCH v10 08/10] drm/xe/nvm: add on-die non-volatile
> > > memory device
> > >
> > > On Thu, May 15, 2025 at 04:33:43PM +0300, Alexander Usyskin wrote:
> > > > Enable access to internal non-volatile memory on DGFX
> > > > with GSC/CSC devices via a child device.
> > > > The nvm child device is exposed via auxiliary bus.
> > >
> > > ...
> > >
> > > > +void xe_nvm_init(struct xe_device *xe)
> > > > +{
> > >
> > > Same as patch 6, please handle errors.
> > This device failure is non-fatal for Xe, caller will ignore
> > the failure anyway.
> 
> Same as patch 6, let's atleast have the readiness.
> 
Ok, will do

> Raag
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
