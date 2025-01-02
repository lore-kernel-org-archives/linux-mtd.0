Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5F9E77188
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2025 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Jo0IBhMgiLLZvebEQZ+39pRGJ/c0Kx0aerBmjM7sUo=; b=pb3szD4ji4oPGb
	1YPHDUNB4pZJhAmyeJmHH97+8DAOQO6DoirOKXvCsZx6rtaTlSCzGkm9KvJsL/Gb2rfk9hrfGtB0Q
	jpbLbvcTNayWDzuzycZmMD6ASgYX3fIxOk5Bnw4x5SJok1jVsljuHjxbN6IwDEyNWY4V7ZFEJ0y0a
	GESPsBwoVX6pA59WCPUkluMAhD8E/r94jY3pc7yR0dGmemmf+yDxXYxZa2SKTT5i53YbKRxfElPVB
	RTdH5EDyj3NR3pgAU67kM8B+9rpcAeXyfF/pxsxO7iisqEx6+J2iVkpKla++Tv8phGcmrfGNVRO8X
	yFGNCBGlMtcJV/UR9xwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLh2-0000000AXOz-1cwU;
	Thu, 02 Jan 2025 13:56:56 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLgz-0000000AXNb-1Bpp
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jan 2025 13:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735826213; x=1767362213;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zNRTNF6qTYrwT3S6uioZ6zKc1w0F1Dnmc2eclo5nLOc=;
  b=Yvp7MnjSjE5LjD/IdbBAZmypx5XTCmG8e7P9MwSLdmz/Iuk8X4MFAp2E
   tfugAtfARHWF7SoI3l8UJPrHjy4t+ZMD/yDBK2BA478lWpfGanlm4Jrt+
   pfsds/HL2NIPuy/veVjVF2HsJheQMwjBpvEdx5E/G0HePEEO4SbVzAXwh
   1kx1fMAvVp6mdwkLi5vPhU74Vj1LbL5KDB1DNn0f2DXldKuq2oCN71yLp
   FA50+KuxMDbCUFnO6KxGONviuSGn55O4KQfgJX/NskCC1+tCo2z46EgGF
   QYWIcCrI7vt88cKQl8NDe22GRPPIYJqjNe/QV2Xdne75/IOf9+oMuuuRf
   g==;
X-CSE-ConnectionGUID: bp/VRVSVTbWG0cI0I0GKWA==
X-CSE-MsgGUID: MC1Bc0wfShSiEXy/gDVK7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35762808"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="35762808"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 05:56:52 -0800
X-CSE-ConnectionGUID: jKDbMVOJRZOGz+SYBGsltw==
X-CSE-MsgGUID: q4mPuBhSQHqH31xy1HnuOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101599464"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2025 05:56:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 05:56:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 05:56:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 05:56:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3Y2sn5K+uxCU3t2kMxY8/ZsxHc+SllVIQ0zHYezI0aivfdX5i2RUW4u8ZiGc1QBtiHFI/ZeeCNhjxuyq/bDoM3ocKLcDtPfgo+TPr+sj2PhzYiH4d+mOTDfVAX8ZE7/DN78RB70ZGNFuFdR4LEpkQdVFDvPfm8q3Lmy7VgzGgq4pRUOg2RzZDYpnMilGfvb14JAWmLKfpyqyEIyd3NoBgHQp28vhAa4bA9uzXEHPuHqMrDIaIitWPKvsTQyO3HjKbXrKyUSrMk1ExTQrhoi7TsCD3pym8DZ8cAcKcHHjcmRdOmLF/TGBTYbIPx8t2W7VUzt2toBY/scRJxX5SMdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zNRTNF6qTYrwT3S6uioZ6zKc1w0F1Dnmc2eclo5nLOc=;
 b=LFgPlQ+jsIwhpsB4LATJ9mPexjfBrJM/21p6vYv9p0we6Bb99Rx29UqmJj8o0nAqAAxh8T2S0mlgN6kybTkD+Fz3CDJIJ8Jw5XXONP7H8+hg9VRdytAZ/uOVzc/ZHygmYUuoE0rL99vHhsMD3LKHj7Iyo/IzZRwJU1Odf8cZZ1D2OW64DV15lk4M7OfxVcWSL5x6L1k0baMe2x5UeORhRPiTHZVv9yjFlJLajFg6CbRS96VhaBtGLkMuT7smEzibnHJGSUj62+3aOAjM7O/C8Wul5jNvfRgUez2UG+OteolPY6FQ62t7D9uRF8o8V/ALR0WP4cp9/iEtAgUwYtpaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 13:56:18 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 13:56:18 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: David Laight <david.laight.linux@gmail.com>
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
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Thread-Topic: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Thread-Index: AQHbXGT7p9lsQxsIJ0mgWNAVlUOGTrMCHy2AgAFiB6A=
Date: Thu, 2 Jan 2025 13:56:18 +0000
Message-ID: <CY5PR11MB636623DF234A109B17CD075AED142@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
	<20250101153925.865703-7-alexander.usyskin@intel.com>
 <20250101164119.000d2bd4@dsl-u17-10>
In-Reply-To: <20250101164119.000d2bd4@dsl-u17-10>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA0PR11MB4558:EE_
x-ms-office365-filtering-correlation-id: 7a23f98a-d506-4de7-0bc2-08dd2b353b16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NjdqYVJsMGtQNmdVb081RGJiZlRnMFNobDkyWjFPYlNjYVZybXY5U3ZDTi9J?=
 =?utf-8?B?azQyWGFHeGJkK2NWZDFsSFpVT1NRUU9nRStrOGE0aXJyZUg3NlFJNU9TSkd2?=
 =?utf-8?B?bUFJblFGc3hLdWdMRSs2ZXpLNWpUVUJQdHNjb2dtWnU0bVIvVkdXcFlWNGc4?=
 =?utf-8?B?SVlQNmVCZ2dDUXd1MkpzMkJuOGdWU2tQVTNlNWtoRUZwOWN0MEZXbjFGdW1V?=
 =?utf-8?B?THhENE9NaTV6ekdhUk5US1Bmai9jSElHamFoUFFkQWlEbnpOa2NPR0MrTHQ1?=
 =?utf-8?B?TE9MRG9BTzE2bmpzYzVhYkNXQk1OakQ3OGtJSXE2TjVPSWNhMzBXQXAwZmgv?=
 =?utf-8?B?MWpRd1Yvb1BmM3V6VkZ3bEY1dnNpZFR3anRzQXN6ZmtnSC9lTEZ2dncrZzFL?=
 =?utf-8?B?T0NoSU5MVFFhbWhnVUt5bkZMUjYxY2RGcEdybVZubENKdXRFYTZUelRhQk9T?=
 =?utf-8?B?KzFrcE1yRnFuZHNHRUdINTdVRm0xdkk0M09ueDk5NEtYR0E2L3IzMG4wUjla?=
 =?utf-8?B?QS93TkVvYkVxZUVRelZRQTNqUmhzRHR3T0NKZlQ3QjJtMzNXckpCc1RCRHdN?=
 =?utf-8?B?bFRHMTJPUktXU2JwNWxMVFpoWVZwQmlWaFNjaVkzK2xzTVNVZ21GaC95V2RQ?=
 =?utf-8?B?Z1ZQZ3ZLS2xVTjJWSVoweHpFQUtZL3FDZmVRWmtwV2RnMHl2OEZqTkJPc005?=
 =?utf-8?B?TGQzVDFWTngxUzRKVytGUW84ZndPcUVtMkxiaHl1b08yaTBwRlBvQWh0ZTl4?=
 =?utf-8?B?VTFXZTE4MEdaQXd4aVNOMktQZy9abkt5R0hOZDA0N2Fhc0NldHJhczhNelRB?=
 =?utf-8?B?OVBOSXhvdGNkckg1cDllWVo0ajVId29KcnZrQVB4UWE2aGQxZUUwRTM2OFdi?=
 =?utf-8?B?bnRXYjBSQThQU0tDd0pWSDlMZDBLYUhqUUt3K0ExZ3BNckVWVEFMNkZYMVM0?=
 =?utf-8?B?TEtTU1ZvUG8xSGI1VXdKamkrY25RSnlNWXFFM3NCUnZGcHFUTzdXUk5jVEdU?=
 =?utf-8?B?RXpJbHNLUmVqbWYvOEZlc2t1alBZcDk3aHJRWFFSSFZpQlVUc1VudWNKemhq?=
 =?utf-8?B?V1VCZm92QWJuZDBrTllqMlowM0tIUk9DZW4rcWJMSHk3bU9DSlMvcUlyK3Zr?=
 =?utf-8?B?bVJjZDM2TG1pR2EvRllCeTl1c3ZSUEk0TnVOQm1LOUxQazIzY0h6RUs3NWhI?=
 =?utf-8?B?K1FLZEJ2OG1BVEJSOTVyM2V3WHNKRFdKYnZ2aXVSemZ2OHZ2N29COVZRZVZ3?=
 =?utf-8?B?czJXVkNkQ3dtT0QrdW5nUDV2VHhlMzdyVy9PU29idkkwNEpDdkR2S0s3WWVo?=
 =?utf-8?B?SExuckFYMEtIRkM1dk56dU4vS1hzUSt0VDJ3L0hCSGh2SVI4TlZQVDBQcjAw?=
 =?utf-8?B?R0FlT0IzYlZhWWFEb3FsYUJyUDJBL1JhZlJGcHpCY00zY1VNZUkrbUFIYUpw?=
 =?utf-8?B?dEpYSHUrbjFLUyswNGtjQWlOcjl6d0QxcEIxWVdnbzNzeUdWTlVtVmF2NnFP?=
 =?utf-8?B?enNGSnV1eC95Nkt6YW45NXREdW4zb2NCWjNaeVJ2MWRQamtDd0NSK013dmEw?=
 =?utf-8?B?aFlhYnJEYmFyY2d3NHJXTEdFdkNrSERvc29OeXM5NHJLa3pWcldqOTdRazg2?=
 =?utf-8?B?VWdEMnRRVXMxSTQyaThqeXFsb2dNdllzajdSL045VzRhMWtjdDI5V0c5QytP?=
 =?utf-8?B?OGpwVllJc1loNkx1clR2UkVGdGFlQ1dBZWw4bEtRMVE1ZlNYS25LYnlhUjZG?=
 =?utf-8?B?cmNvTWxPdVVhdTY3RlprZzdpOU5xb0JkWVkxVXllMGZGK2k2UWZmaEZ5Z3FK?=
 =?utf-8?B?OS9YdGhHM29XSGZMNWFubDQzS1F6TTA0RVlOVDl1SDJ1VC9mWXhWQzFPdjVx?=
 =?utf-8?B?Q0R0UVo0VDQzTUsySDdxYlljVWc2eUlDNWI2SnpyODJJdThyVlBTYVgxNG5Y?=
 =?utf-8?Q?S3L4hJNZIXS4Zt6GboyYe8uKQWLLL2Sq?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDVpUThxMm5MTzg4cG9SUEk0eCtxd1BkakZoMW4wN1lyL0d2aGRjZ3dwS25G?=
 =?utf-8?B?d1VrK2tVRkNVZFN3V0ltY05LK0lHTldBbWJFaFEya1h3bGhyZVY1NVJKTUJn?=
 =?utf-8?B?MlRrbm1CVmU5OFlRc1QzY2Q0aUp2WkxWV0tHL0tDcnZ0RnFhTEdlaUNObnhk?=
 =?utf-8?B?WmtPWDJOVW5JQ1VIeHhCWFdua2diMS9wbit1K1NNLzRMejhablRNU1ZBbmJq?=
 =?utf-8?B?a2l6T1crL2swM1U4SmZXK0w5a01QbkZyUk9YVE03YWhzOTIzeWtUTmVBTUZ4?=
 =?utf-8?B?ZEtzd1NmTlh0SzVKdnJ5MVliMUZqSDJMajA4WE5wQ2hsTlZBcW5rNjVNYjNz?=
 =?utf-8?B?WTNkd1lhZW1neDhLbzBVVVZmbU8yaTY2UTg0UmswTy9QeUwwT2RkVW8yMG5E?=
 =?utf-8?B?Zm5nVHFVbERLVXJTOXcvTHluRU4zcDdia0pyeXFzcWRpbXEzUEl1YVR6UXlX?=
 =?utf-8?B?cTQrZGFnWThGRTRXUVJxVmRGd0xaZ2pCNTdXU0FncURtZVBJVEZFbStzL3R2?=
 =?utf-8?B?NTV1M0VGSmFhMVovRDhnaE9TZHZiYzlhdUtQK3hqTk82UVVJMjZzOHZrQ05t?=
 =?utf-8?B?dEpzZjU0VGRabUg4WXRhckhLTk1IRTRndENYS2V0dXJpdlNiYVNaNmVWNFdw?=
 =?utf-8?B?ZnN4aXdUb3FKRmdYWXBLbmJqNFdyQ3JpSGpBbm1BeDdRcXBnaTdDVmcvZ1Vr?=
 =?utf-8?B?ZWZJWWg3akQrWnM5MG5ndTJZQUlRNXZkQmVJTnp0SitTQUhWazJrMnZJNmNv?=
 =?utf-8?B?YVAvbG5FQ2p0RFlEVXpwdzZtZDhDSDR1cm1XdGk4OWN6ZXFpd0FWTVcvOHl6?=
 =?utf-8?B?elRUMTY2b0cwQy9iMDhNb2Z0U2E5azN4ME5TNzdHYVRGU29TNlIzb3JxTWFP?=
 =?utf-8?B?eXJscE0zZ1FqVm9XMEtoRTlRNzNUYStqRE1VeWdjSVQ5VHNveEJWVVZrV05E?=
 =?utf-8?B?Y2NnNjU2UHMvMnJQaVZiMXlIK1RwWWN5QmlBemh4bVBQdDZCRTZNKzRyc3RC?=
 =?utf-8?B?dEJFMDFTNTRrSDY4WWhIYmdpRUdGU0NWbUdTUStUSWVVaDlyeWZWSnV0VHc5?=
 =?utf-8?B?Qm1SMVVLRjdiN2dFem1kWDFqRDZvclB6MzF0MTV1OGllL0Z3TE5yc3hxSzlL?=
 =?utf-8?B?MCtua2t4c2k4UmtadFpFOCt5eDFWS3E4NnBVQjF4ZU1vdVpjdytXSEZKMTI2?=
 =?utf-8?B?YnpwR2huZXNlK3V1SHZIT2lYUWhDWXFkTE5kandXNU1EVlBtZnQzMUFDcUha?=
 =?utf-8?B?QnkwWHpwMHhiZ0RkQjJKd3RUb0kzbG9jVjU4L1NPK0p2L1NmUk9nTkhsOThi?=
 =?utf-8?B?SmMrTVFRZ3RoWVFDUERaVVY5bGZESTl0WmEvM2p0UkFxWStTSC9OMWFNVEpG?=
 =?utf-8?B?NGR3TCt4RDNLbzQ5Z1BIbHlKMXp4bWRBWTBIQlRzOTdRQ01KRW95TUNYbHZm?=
 =?utf-8?B?VlcwODdLMk5LRUtsWkJpSlhNaDZxYXhIZWhjZVdvWXJBZFVKZnNxQ0V4RGNi?=
 =?utf-8?B?SSs5UExDYldCMVZUZ2k1Wll0dmJSMXJxRXdOdUtVRnRYNW1vK2NpeFU5TWFD?=
 =?utf-8?B?U3hTSXRyOVlDNk14SnZvRU9OQWN0ek9TMVg1dGM2TGNHNTN2a0FWaTU1Y1lI?=
 =?utf-8?B?MTB5ckxIQzcvWW1iNE9lM1RobHkwd2FlZ2NidE8vczl3NHcyd290M04yTDNv?=
 =?utf-8?B?SEh3YXZ3YzVjSmNvY2hoWUNMLzAweVdraThNZWFTZWYwci9FWjlZQnFOZ0dq?=
 =?utf-8?B?dndtVkIvRlZNYXgrekRPZVMwMGM5NlgyQzF3NEZYQjZsemZubk0ydHlLb0Fr?=
 =?utf-8?B?cjFTdTNtbkxoUStMQ09mZ0ZkR2lXTE1XcmtYM3kvenZWc0YyWXZFNGpLMUhN?=
 =?utf-8?B?WDB6WW1MSW55YzY5dlBoQlZlSTNWWUZFUmEwSVJYQmJyUjVMaTNxMHpQS1VZ?=
 =?utf-8?B?M2VGaDQxZTBMenVTUE5idzBlZWhNMFpwa3JOOHVnZWhRRGNhSzlrWmhOOW5u?=
 =?utf-8?B?SkM3QjhPQk5YVUdzay95WTBaZXBmUG9kWFh3bHRLQ2RoZUdCMlRzVitNRFln?=
 =?utf-8?B?Tm9VeU1lYUI3akNvRkI3TDVCNjRVOUwwRC9VQ2tQSmYzR0VHQWxDS2pYY0VH?=
 =?utf-8?Q?WLQBD2PLJ01fDnQ8Vd5TiOocW?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a23f98a-d506-4de7-0bc2-08dd2b353b16
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 13:56:18.0698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wCaWjr0HiY1DQnxAuJ1fJe/uNibXNPgDO54W2J/CHPjFWoa5L2DL47F+WCsPCUPa2E8QDLKRIUal9ldO1v5vDKgMFY7EppZ91NyQSxhWA7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_055653_388662_EC203881 
X-CRM114-Status: GOOD (  23.74  )
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

> > GSC NVM controller HW errors on quad access overlapping 1K border.
> > Align 64bit read and write to avoid readq/writeq over 1K border.
> >
> > Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > ---
> >  drivers/mtd/devices/mtd-intel-dg.c | 35
> ++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-
> intel-dg.c
> > index 76ef7198fff8..230bf444b7fe 100644
> > --- a/drivers/mtd/devices/mtd-intel-dg.c
> > +++ b/drivers/mtd/devices/mtd-intel-dg.c
> > @@ -238,6 +238,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm,
> u8 region,
> >  		len_s -= to_shift;
> >  	}
> >
> > +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> > +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {
> 
> I'm sure that should be (to + len_s - 1).
> Using GENMASK(31, 10) completely fails to indicate what is being tested.

Will look at it, but this form works fine in practice.
> 
> > +		/*
> > +		 * Workaround reads/writes across 1k-aligned addresses
> > +		 * (start u32 before 1k, end u32 after)
> > +		 * as this fails on hardware.
> > +		 */
> > +		u32 data;
> > +
> > +		memcpy(&data, &buf[0], sizeof(u32));
> 
> 	get_unaligned_u32()
> 

Can't find such function in kernel at all

> > +		idg_nvm_write32(nvm, to, data);
> > +		if (idg_nvm_error(nvm))
> > +			return -EIO;
> > +		buf += sizeof(u32);
> > +		to += sizeof(u32);
> > +		len_s -= sizeof(u32);
> > +	}
> 
> It isn't at all obvious why copying 4 bytes helps.
> Indeed, if 'to' is 1023 and 'len_s' is 2 it goes terribly wrong.

Data is aligned to sizeof(u32) before this check, so 1023 and 2 can't be here.
We can come here only if we 4bytes before 1k boundary and
we are reading all that left before boundary.
After that the data will be sizeof(u64) aligned.

> 
> 	David
> 
> > +
> >  	len8 = ALIGN_DOWN(len_s, sizeof(u64));
> >  	for (i = 0; i < len8; i += sizeof(u64)) {
> >  		u64 data;

- - 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
