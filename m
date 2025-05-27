Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB0C54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 06:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVbvKabJ9SJlNLvK+vGuLbSUT5eqH02kOP4Jkn1d/ME=; b=w5W49u18ppdafY
	wGyNAnCGYs0v4+hB+OTZazSnMXSoYcB0D831oqvjSKfaTKJTagvDs8hULTRxIUupaQlY4Kso+DsBc
	2w3feBCApvKI3Fn0LqT0a4sz9ciVIE1dqdVIcmSquNIHMoHTbbWY4GsALPpTgRm4uGSEQmBQCrp7M
	aqBdfH0T5kIWzIxtcD1sjqE9d3cZHbBtxaB7N/9ifIooc2guO1J9n5BiiyvWrulq61lmIpQbg2KTU
	UyK/NzeenK/AUrcq+zKizSdPEZJ8XsolFiUvLKyBGj3HpnIeR/c3nVefuqUTferEm9Tbi2I/iG6hu
	oXXKBY7IixnZFd2fDG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnlo-0000000A1mI-1hWS;
	Tue, 27 May 2025 06:26:40 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnkV-0000000A1aJ-1kjM
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 06:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748327119; x=1779863119;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nK3Jg3b2+51dyjkJ28cmsRao3aAED+8bxGLH/sIKBm4=;
  b=niaT5UAT+G6e7l2W92ruvNBC0lnmKyy3VGOgu77VeaSA0KaoLWWkfJuX
   p5qi7fp0JtGdgr3Dgk4bM843JpJBWD0FizfkFHkk616mPVdj5fcbpqJXF
   5rYs44Y9EL0uMCHpteakD7lFBJ7fapR2cIxSaEMh+0lEb+dsi5cGx0/az
   NGr47x/RKwOcQXFS0ssctqX3Ce5bWBfUFy58LV87WvKhqhINspHs76JI0
   xxBTToLHzD1j02V/ysmULAXYnns8RcwAU4/76NN3InJUtv32KAk8NjA/s
   fQ1YrwPNDY5AKlwjmPckyAjxbPmylBx5Lyi7z7a5IP1aLpT6/fyc7hVhV
   w==;
X-CSE-ConnectionGUID: tSUkyP/pQeGIyDc95QrZzw==
X-CSE-MsgGUID: hPFE+e3KSAyUXeBIo+XVLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49412025"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="49412025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:25:16 -0700
X-CSE-ConnectionGUID: fWAA5VrzSMWQ7I1Iyr46xg==
X-CSE-MsgGUID: lGsAJylUSgeYeAqi0W08+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="147442523"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 23:25:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 26 May 2025 23:25:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 26 May 2025 23:25:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.67)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 26 May 2025 23:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4mfbm0WvG5rDrp0XuX/nba7vafqQ5T2WLF7TxqfjpbQNEnASGegb65SYX5yVhNg0fqBcq+ZLNZIpNzSVa29lkan4MsaSwtgDaDgzGd4TEhNw0YVg1CLXegQ/P6ccXDnd9x1mMS3tnJ2tNk+jCxW2eprd0NoHVx0sSMJqVOnXmdbkBUSBFYTH4gbrhI1hnkoFx/ayT9yFX6BV0tex3glx8BZLbRYo5hdrIz4f1cBXzQs8QI55MRR710CxWeEZFlVnVATaQFW+r7iMOaBBv9Y/pEb1LIHi3pVlbxm+yAVy8UZ3CjJRI6zsYRRfULnMXLSM9Z8UFCnENHBJwNcJC1pvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nK3Jg3b2+51dyjkJ28cmsRao3aAED+8bxGLH/sIKBm4=;
 b=JGe/5T+Rboeb2EkT39R1gTcvI/6Z630Vy/1VjGB0qmI/BxDIgw3seiCSPnMRe6YhjtmrNh261z1M7/EUOU151DeU3uJxEOzNLQjb4kC5P1vYdGcvpztCojwPDwVtcfmmJGUueDz1qHnIlQzMx5PjVFTdADhAeh2JQhciJqeG/W7GKa9LO7vf6TWWtfuk4uHkeMmoMIZNadmYfKs3yR9MzG98i9NIWDjfqivNraVqTLH4tHMBFm5krp1LDx9heI5t53HrTJSQrLX/yevElCGz8j8l7CWyek/+Mes+R662rjm5/waSCNCgM0VJsYBw0qO8FDwa6GFvMjhy6pYc1nLMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CO1PR11MB5202.namprd11.prod.outlook.com (2603:10b6:303:97::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 06:25:13 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 06:25:13 +0000
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
Thread-Index: AQHbxaAaBNngr+ItyEmq2P6oEpoBdrPhoi0AgARsrvA=
Date: Tue, 27 May 2025 06:25:13 +0000
Message-ID: <CY5PR11MB63666722F7C02E4D776CE601ED64A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-9-alexander.usyskin@intel.com>
 <aDGfgubuFfa3e0K_@black.fi.intel.com>
In-Reply-To: <aDGfgubuFfa3e0K_@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CO1PR11MB5202:EE_
x-ms-office365-filtering-correlation-id: 8118fb6b-c4a4-49fa-649d-08dd9ce73d15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dUlXOGVuejgwTEdGY293YmRYbzhQa29WUUVHeXdIQ1VlKzJlRFVNc05sNkFn?=
 =?utf-8?B?Si9wbFlZWEtWU0t1V1FjZER0UG9IZFk5SVFEY3N2TmJKUGZ3eDltS0NJY05Y?=
 =?utf-8?B?elpMVkxtWXBYVEdTR3Vad0Y3YW5xVFJKVU1kY0VtWVYzcmJ5Z3hjQm02Rjgw?=
 =?utf-8?B?TmR4dEF6VFdmTkNoOVlsVkswc3Rab3lDd04zMXkrMWRncTBVT2wrK3M3eFN3?=
 =?utf-8?B?R29CL2ZYNkEva2hqcktnREpZWjQvNmhjZkdXVjRGc3J3THNZL3RBOUdIcUxU?=
 =?utf-8?B?SUlZRkdQdklUaEhOc3Z6R0hDRnkwWDdId2FLZzR4UEdKQkx5VlRxUnVsS0RC?=
 =?utf-8?B?akJhUWFBWVN0YXpEb2c1MXJ0TGdwUHVnSTB0MGRwUi9nMmprSmlTN1VOS0Ns?=
 =?utf-8?B?aVhPNTEwMVVwNDZMWlZMT1hYZ1FDMFhTSXk1WkhpSkNNbXdzcmtPWlI3YmRD?=
 =?utf-8?B?Z0hrQXZYZENtMUlkSTc2cjNONGgyK1A2KzcwTzBuRlBEYlZleG5hbjYyc3E3?=
 =?utf-8?B?WFl1TTUvTUxMTElLdFpUTU1zcHZKQ0UzcGxCdTdnSHlpS1htZnlSQXovbEFB?=
 =?utf-8?B?T29jZUhjbCtuNHBGNEtpRFVMTnRBL3VHQmRXVzFQbytOSmZUbytzMktOdFl6?=
 =?utf-8?B?MTdXZVNORHBicjZCZFNBeUZSWnNpUTdtbTNZbm45Wm82UVFBMnpmaGk2MHBv?=
 =?utf-8?B?TjFsQVlad1dpa3FiSFo3ekFwQUxWR1VBTy96cmM2Qy83UmcwYzg0STk5MklO?=
 =?utf-8?B?OHhsOEtRbnZHSkorVGNPYjZKaXRWTVJ4aGs4dVBlRkRKZHQ3RzczWWRMRS9I?=
 =?utf-8?B?MHVIQncvd045aXBicU54Wk5zNDZDbUlEN2tIRS9saWRlYW9DMGpsYVF2OVpr?=
 =?utf-8?B?c09wbXMrRWI5clRzcXJ5bk4ySWl3TG9tY1lEODlUbnBybEJhRkRuNklRN3lR?=
 =?utf-8?B?SjBOcnNRVkgvUzNFbGJpVnpuS1R3V2c4N2tlUWFtZzQyamJTME5YSFU3ZlMz?=
 =?utf-8?B?a2hxQ0VDZUtGdmV4VnRway9udEh4MHdoWmc1bHMwV2Q4eDVxZ0hBOVNmamlZ?=
 =?utf-8?B?Zk84SU1XYUwzRUF0RCt5cTZlaVBBVyt1cWpGMGRVbkZDZTZBSVlzTDU5VTRh?=
 =?utf-8?B?KzU0TVBWeldBUzZyRVQ4RitaZzFQNEFybFRpbUZ1OWlFTDd1elJESjZMdkx2?=
 =?utf-8?B?aS9ZdDFMZzVtVWh4ZEVzNzMrK0FXMHNmVTBodFVFZ0dYYTRMN2sxT1EzakRv?=
 =?utf-8?B?dnpDU3h1alYzcVE1OTZIaDJ3TStjUkNaT1NxejhCK0IzeC9RL3pzVlArVGpF?=
 =?utf-8?B?clhFWXQvZnBuY1Q1QjNIY2NXelB5eVFBS0pMclYxR2Nzbi9IMm1oUmQxU3px?=
 =?utf-8?B?ekt2UUdodGxFVjU0d2tyc1orTmk5SkE1eWlNWXAvWkZuN3hpRllZNlJmby9q?=
 =?utf-8?B?K25VV1Mza3FhY2VtM090TW44bHdXamtSWSsvQWhDbDZFTEd6RzZEcnhDeXdi?=
 =?utf-8?B?NUhubEUvRzEranpqQVlMMjNITndyUmNjOENyNUNCM2FxUU9Gdlg5K0VZQWMv?=
 =?utf-8?B?SVBQVER3RlgyMm1FOTVoQWVpbzliNnVEakxyT0l5SGhUbUd1OEg1T0dBb3BR?=
 =?utf-8?B?R1EwaGdWZm81NzRrMDBJYysrUlBxNFZacEJVL1Y1eU5SMkswMFlUK0x1ZGUz?=
 =?utf-8?B?U1ROOGdzVU1RbzhISmZ6ZkZCQXJtVFN4S3RHVkhRMGNjT3FrYmduWk5jZnE0?=
 =?utf-8?B?T0kyRjNPZFF2Z3FGTVdhcjAza0pDVTlNRmRBZ0VFaTgrZnpJQ3UrWlQvSU0r?=
 =?utf-8?B?MFg3WVVVUEdMVmJkWVRNT0dRTkZoRHpxT01uYm43enVNeEx4eHdvOFBVemdh?=
 =?utf-8?B?Y1VER29CcFoyaWZsbGZsamlqb25KblZGL0JWa3RCZzFoa1g0RWgzMUFhbHh2?=
 =?utf-8?B?dnNLRTFRb2VMV1lMZU9ucEUveTJnd2xFODdwN0VFUzFscjlaU0QvSkVHTW1P?=
 =?utf-8?B?dkN6R0FMdXlRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUFPdWxNV0kxdnhHbEdBQjVzSUhxQ1ljZDhhMmdVRStET3J0S1JtaFBBRDlD?=
 =?utf-8?B?ZC9PckxtYnU5YXB2MmluRjZzTFdTTmVUQVJhZlVONThtSDNhRmdZek51TTZ4?=
 =?utf-8?B?Z2djdzczbXltVHFlZ2RZaWJSUXg1VGtnalFnTzZ2Tlo2aEVoTm53Um5LMHdD?=
 =?utf-8?B?bi9oOUZHZDBTV1EwSEV2RjEwWWkxZ0lRR1pSTzQzeFNndm9wQ0VFUERBN0Ux?=
 =?utf-8?B?ZzN4VmUvRVZJbC91SXVRN2QxUktSR0MvNXRNZ29YN3ZxSzdBU2NwL0VhL0J2?=
 =?utf-8?B?QjhCeXFINGRuRWFXMk5GbnVuZ1FoaHAyNklVbTZQaFZYc094blA1U3h5M0pW?=
 =?utf-8?B?RjNhYWdvczJ3TlVCMmZTTjNtZ2E3UklFWXhIWUYwVFpTclVuc0xaOHRRdU9M?=
 =?utf-8?B?eVQzOFlsMnd5aVYwemlRRGpvYnNUbEhhKzRobU82d3lBRFN4ellaNC9qYTNL?=
 =?utf-8?B?Nmd5d2FrYjJvV1FCRWorcXZwVFlhZmYrQkNEWi9oM0txVGhIcXdpRjdJd09k?=
 =?utf-8?B?UFZQdWNLYTZRRWpXdW5PamVuTm94a1VZNXczV1oxUmFITUVWVk5yekxQTEdE?=
 =?utf-8?B?dmxpem9GYmMzNDBuYktsbnNvOGJ0eHY0aG9WSmZncFZENmJyb0JVVE0vcUF4?=
 =?utf-8?B?WEhWZktkSHd0d0x3aVN1bWh2d0VmYWFyV3c5MDUzRjB1RVR4WlFrTVhla0k4?=
 =?utf-8?B?YXFHclhpeTlQZnNrRzNVKzNoK1BtWmEvNloraUEwa2RKSldBc0JrYTJHUS9x?=
 =?utf-8?B?N2YyQzZpcjZEbjZZZXRwTncvWEhqVzZBT2pydnBZRTlORlVYMnVMOEQyNkx1?=
 =?utf-8?B?VFp6QTBMdnJPRjlmREYvTmlxNEpqS3lXNExMVmdmQzVYR3hiQnoyaFRjQnEx?=
 =?utf-8?B?cHUwVk9XVVNuS2xhS29aaEFmbE5MbGdLR1Q1c2dKUWV0V1YweUR0L05wSzRo?=
 =?utf-8?B?andmblVRVVB2d09mVnc4OGtnSEFERzYxWmpoaGdnN2xCWUFJNUNkT0ZuWTl5?=
 =?utf-8?B?NzkzeU1rY3JWaXROMVdhYVBTVWVSem9MS0NJUDZobGVPUUdVMWJxOUpORW8y?=
 =?utf-8?B?S1VpWXVqMDVST3dDbmVGRFMzSnQzWEZqQjB2Qko0TVFOQ09UZ0ZVRzdReXNp?=
 =?utf-8?B?c3dsVGw2Sk9oT2JjYldUNUZnR2x6UWtlbm9JNVV5d0FUdEl1d3VUMGowN3RW?=
 =?utf-8?B?TVltWXdLcjNjRHU1cmxUQnpUSk5vZnc4MWE2T2VZeWQ2VC9IN253dHJQdXpD?=
 =?utf-8?B?bTU1Y1VUNzFzWUUzQlRnaThKMWpaSDhCN0p6bzlqWS9tcUFWWUVxcXhYMHNC?=
 =?utf-8?B?Zmpqc0RLZVZEZjZnR2NtNjNJWXpVb0FKaDVWZVBqWFZReHFzNk9VYVNYMGlY?=
 =?utf-8?B?MHBKaHB3Z2FSUjZtYU9SWXYxZzlvanJlY2xSZk9STW15TjZEaWZ1OXNqaC9a?=
 =?utf-8?B?b3NNY2pZZHhzdzRzaStEM3RPNUdFdjQzOUhLMXB4UFo3eEtOalU2bzg1d1lv?=
 =?utf-8?B?MlJIYkZFSEZ2UGZ5N3BjOXNrTUFOZzhnbzlkRktrbFdLZE4wUkNMVDYxb2F2?=
 =?utf-8?B?ZUtUZHU0bFU0T3A1Qkc5VDJnNHJFUVFVWnZEbFdxTDRSMWRPTktOSENZSDJK?=
 =?utf-8?B?aU5tSmQ2RmRTRldJTlJJY0hSa2REZnJSN2Eyb01YWGdVbDBsbngyZEVsZEZ1?=
 =?utf-8?B?QUFMOW5GcVBQaVJnQS9RS1ZDcUNkc1Rvb2NpSVcwZEJITVliYk1aYUxFaGpL?=
 =?utf-8?B?ekc2SUZDU0FRVmNOOXZ0bUtoZ1k2eTIybThXaUhjZS9xL21aRGV2cG5QcC9O?=
 =?utf-8?B?TUZnSGw2RTZDYUNNSWVmckR2YVJsMG42bmdRbUtnUzZ1cTdteFVNVTRqRnpD?=
 =?utf-8?B?Q0Zmays5azQycXhrMkFZbmhYN1hBd1VqdnUyVWJQYlB5TXdsWTRaTmJsUUVx?=
 =?utf-8?B?VFZtUERaSkhZM0R3QVh1bUhlNjcyZ2NBNWZkZzdoT1N2OHFFL0Mxb0NrQ3hH?=
 =?utf-8?B?MmZBK01VVWhoNE1uOVBTZnV4Sk9kREhsTWJrRHVVOWEwTG44RjU3dVNBWUhj?=
 =?utf-8?B?d010bk1rQTkyOUEyVDEvSHRvUkJSQTVOZ1JYaFNLTlB0OUhHZ0laU1RzVEpt?=
 =?utf-8?B?YVAwbndQUEtoZ3FtQzVlc2x1NzhSSk9McTFBUnhCbUFNSXBiVTFkdktSUlVZ?=
 =?utf-8?B?Ync9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8118fb6b-c4a4-49fa-649d-08dd9ce73d15
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 06:25:13.2256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VCqgOfXlvs8v0ha91FMVTA68wGJnFbCOm9LylmPvAB0/Q2fA0HhbMTImG6QrQ0KPZ8l4fqTpAdj1cYJLMnZeF+EYI2QRZI4Mr224xUoDUac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5202
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_232519_470688_E20C06FA 
X-CRM114-Status: GOOD (  16.87  )
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
> On Thu, May 15, 2025 at 04:33:43PM +0300, Alexander Usyskin wrote:
> > Enable access to internal non-volatile memory on DGFX
> > with GSC/CSC devices via a child device.
> > The nvm child device is exposed via auxiliary bus.
> 
> ...
> 
> > +void xe_nvm_init(struct xe_device *xe)
> > +{
> 
> Same as patch 6, please handle errors.
This device failure is non-fatal for Xe, caller will ignore
the failure anyway.

> 
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct intel_dg_nvm_dev *nvm;
> > +	struct auxiliary_device *aux_dev;
> > +	int ret;
> > +
> > +	if (!xe->info.has_gsc_nvm)
> > +		return;
> > +
> > +	/* No access to internal NVM from VFs */
> > +	if (IS_SRIOV_VF(xe))
> > +		return;
> > +
> > +	/* Nvm pointer should be NULL here */
> > +	if (WARN_ON(xe->nvm))
> > +		return;
> > +
> > +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> > +	if (!xe->nvm)
> > +		return;
> > +
> > +	nvm = xe->nvm;
> > +
> > +	nvm->writeable_override = false;
> > +	nvm->bar.parent = &pdev->resource[0];
> > +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev-
> >resource[0].start;
> > +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> 
> Just out of curiosity, why off by one? Aren't ioremaps all PAGE_SIZEd?

Was here all the time, never questioned this.
> 
> > +	nvm->bar.flags = IORESOURCE_MEM;
> > +	nvm->bar.desc = IORES_DESC_NONE;
> > +	nvm->regions = regions;
> > +
> > +	aux_dev = &nvm->aux_dev;
> > +
> > +	aux_dev->name = "nvm";
> > +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) |
> > +		       PCI_DEVID(pdev->bus->number, pdev->devfn);
> 
> Ditto as patch 6.
Will do
> 
> > +	aux_dev->dev.parent = &pdev->dev;
> > +	aux_dev->dev.release = xe_nvm_release_dev;
> > +
> > +	ret = auxiliary_device_init(aux_dev);
> > +	if (ret) {
> > +		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	ret = auxiliary_device_add(aux_dev);
> > +	if (ret) {
> > +		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
> > +		auxiliary_device_uninit(aux_dev);
> > +		return;
> > +	}
> > +}
> 
> Raag
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
