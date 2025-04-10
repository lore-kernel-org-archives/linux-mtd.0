Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567F4C369A8
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 14:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2yLByrWrqW269z67lRFwaDuMYhN8evRAQ91ShomI7F4=; b=2ZxAz98SLaVoJb
	7MYV8F3LD/Jj+DRBOQBas/BNqYquZ59VBqLrVtT8rvey8iuMKSs4RMkdGJ3ODfu/JMVQvn+LJUOQV
	NRawAASn8ADtCDrzzdPFcG2Dglkm19+Cj5SD5B0MEhQHBQTpAfpH/eaoKuzmT8c5z4iYU8mpioOTK
	/VpAg3pO3ONX1WH3FWygNAFnSVJUy2dSqz4JJcxrl/XplASdDY+IQTtAR67ZrPOanlSGQ6bbwZE19
	ZrUWNclZUuX26pW+eJGGIbj8vG/QQvsYDiBhlbHfR5DGkHLSJQ6FbE7i0TCmRBCxf7DX2ilHR0UZ/
	8srlcOSMGWQxUc3QD2rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2se2-0000000AnWA-2WMc;
	Thu, 10 Apr 2025 14:12:42 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2se0-0000000AnTC-0FKe
	for linux-mtd@lists.infradead.org;
	Thu, 10 Apr 2025 14:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744294360; x=1775830360;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jfnNM8T9JsxSwMv1w34fauGywMZw+SkMHiMMAjim6Wg=;
  b=OsUbhuXk19f0PBkKkR1S3nbh6uioilGduUdKlkYegF60SCULJiemBCAc
   4w6IP389yqBMiT6iexh3a2XoV4sycI7K85nVVMifPUdm89SJM/IGxn3su
   y/E7eX5ChDDlaA3MyFYt5qWKsfmyrvrwgJgBrj+16klgzsbM3XuwGrkm+
   uhUckABNAQHjv5Tfz+ZNL6fiVlWbW1sAQUDft90lHOqg1l8ZW7pg3Dbv7
   rMqdtAlDYNZnEh/3zJiwbYLxxlwo6XayKoBTw2h5cH2FL8gvL9JcFBW/g
   uyVIeZfnOaxkMfae4ZDXqzeGO4m7+ZvrQaXqOiDjLJ+Ga9OA9rRKZVyua
   A==;
X-CSE-ConnectionGUID: hxoRTfTaQhCs+wyUMZJIUA==
X-CSE-MsgGUID: 7X9stCkERT+sJDyFhrVj8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="45711067"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45711067"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 07:12:39 -0700
X-CSE-ConnectionGUID: Bv8xoFfvTC26SE3OUOWe5w==
X-CSE-MsgGUID: m65ea2UjRCqcGUgwNz/NmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="134094590"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 07:12:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 07:12:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 07:12:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 07:12:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCv8qVWSLLnUNOxcw3MC+hSa8nsquxBr/Jap8SycgjUywgfK+yPFioAk2WUkKBB3Ofxrcleh9CuZvmyl3zFW6hLmXKqmRjkV/OIlOoK8/gGcpOTm2chLX2t6wljFQgXk8FsFti9fkubbn48uKPU1fW45a3PeuDLPSvlTIdf72oxooJXCoeZNyetq0SW+Y56PVZoXZdcIf//lFHNyOEeVVdPEs1xeoQ27orLcrDDvI+lFo7kZifgKSVTHDIOoCpLtm9iaU2CfTLm59lYXPNVwCsGOfmkxVZyUp4kY39b647YCAk60c/FmkyMKSsIbvowyt1d5R6expgmQVyYakMY7bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfnNM8T9JsxSwMv1w34fauGywMZw+SkMHiMMAjim6Wg=;
 b=GuU8A+LVG6oopdPSXZff864Cr6qgxx67WAtitEHezV6QBYRJiRUrFkBAd9r1AsRK2s54Bhe8xAWewn7CSZjESGLsihsi7e4P++RQwR/VdL/AJEZUkbVhP4k3Y7zfaig6x2iOCV6vzzT+Ld5vFeksKjl6HC2NZvvSKkueXNqFpBPkSgSkRKrAiuB30Vizgmzf/9PocUd+o3zBcEmXAdN5/rM12bN1d3MClDKEq+g2DkJ+k/hO5SnuSZZkYDqSfzuaOJzCm4hzr5QeNXSejYMtIiOzdOZU6EhezEGY7ngq8qoovfg8MmlIyErrf8hP3nIWcfKKgRr56ya/l8FM5T9dQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 14:12:29 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 14:12:29 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
	=?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
	<tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev,
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
	<oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 01/12] mtd: core: always create master device
Thread-Topic: [PATCH v7 01/12] mtd: core: always create master device
Thread-Index: AQHbnmT6czHkKmL9wkq39BK9P9qwmbOO8SWHgAjtlcCAA1DrIYABjPIQgABLchA=
Date: Thu, 10 Apr 2025 14:12:29 +0000
Message-ID: <CY5PR11MB6366593316EAAB6880745E5BEDB72@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
	<20250326152623.3897204-2-alexander.usyskin@intel.com>
	<87ecycrko4.fsf@bootlin.com>
	<CY5PR11MB63661044DCB37577A12B5DF9EDAA2@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87zfgpejtu.fsf@bootlin.com>
 <CY5PR11MB63664C1F1C2094580649F4D5EDB72@CY5PR11MB6366.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB63664C1F1C2094580649F4D5EDB72@CY5PR11MB6366.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH0PR11MB5175:EE_
x-ms-office365-filtering-correlation-id: 8a4cea80-6db2-47e3-5a79-08dd7839baad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S2JIczg1MlM4N3VkZ3AwL1RQN1FYcVZYTGlvcFd1czdiaFBqVjdQTWFlb2xr?=
 =?utf-8?B?NEZKeDIvU2V5V1RMQkRiREpJeXNUd0xkMHVBcE9oS1N0Z0RzdGJaSlRLRTJh?=
 =?utf-8?B?NjZSalZDRmN6eVhYbWtZb3JNVGcyU0hySzluWW5VU0pGVTBsaXRCMUIvWUZ2?=
 =?utf-8?B?VnJBS1hPTjJPSUhqanp4TTNORlNzbnZ6aytBNWhiSjZFRVBwZ0NkMU5Jb2pE?=
 =?utf-8?B?OUZXVTNXT092WXBDYng2aXVpVTFrYnRwZzgzd05FU3BJbEZrVW9YbmQ4TE5K?=
 =?utf-8?B?c2h0czJROW53NHVUQVQ3U3JIUzd0TCtWSkg4RU9FSCtIK0tWRi9wb1NqUTBS?=
 =?utf-8?B?VjVxeFcwaVVVR0R4akUzSW5DRkFhMzhDQlZqYjZhMDRPd3Rjb2QvVThJWm5l?=
 =?utf-8?B?UmFuSmFaSHVoR1B3SFFXZFdGWW9KTTI3VmNTNGVONVQ3M2tDUWVEVVRmd2F6?=
 =?utf-8?B?K0dpTEF3aUcyNEQza2dyV001L2pSRjZ4MjlZd0xHa0dmdGhmcktCYWRCaHRF?=
 =?utf-8?B?K3pxQ2Fsa2VLaVdOSDg3R3Axc2FCV3p5TlVFcy9iWm5IZ0J2a1pvZUFyUzg0?=
 =?utf-8?B?TDVBMDV1WFpCTjVmdFhicW90TUlyckppNDJPMkMrVDBzWUxGUjAzZVExRG5k?=
 =?utf-8?B?T2NsV21ReHgzZ2IxcTRsMk5WLzBhd1dmeDdYaVBjaUh2U1pqSmRLalVkRWJQ?=
 =?utf-8?B?MzJPdjVzaHJ0bThwRG1iOTFtZHA0bE5YU21xNHg0b2JVRWR0NEpPS2xxV0ow?=
 =?utf-8?B?QTJGYUNYR0dMZlc1dTNZRVpYdytDbHNFLzRLbGFBbWtHV2JqaC9LczR2dHBx?=
 =?utf-8?B?RUNLVURxcG9PNE9IWjVDakZXbjQzeThlMVJIU2lhaGR1RFJPWHFIYzkyYm1N?=
 =?utf-8?B?RDllWUFkNGhIalVZbVJlTVZ0RXdrK3J1Q1JvNXQ1NnRpRzVaUWQ3MHQvd1F4?=
 =?utf-8?B?VU5mdk03U3FSK1ZERE00WlRqYTNRUFdnUWNBNlJKMFlCNlJ3WlRUaTFOdEhn?=
 =?utf-8?B?YmhyWWpZNEoyZURXY29UWjBzblhIZXZQeTdBdEt1RjdJSEFOVUFUbVlGaExZ?=
 =?utf-8?B?SnVTZDZ0cTR1KzlkcHh1NkhSUXdmODI5ZGY2WnF6UWp4M002V05iVkNUcyt2?=
 =?utf-8?B?NUZkWmdsMStMaXZZaFIyYjdTRUdBQVdNN1ZCT1ZBY0lITXV4VTRKeVA4WFdi?=
 =?utf-8?B?Z2VBeDdkKzMzb0FWendpTzlNODVkOVNOWEhSaHJ5aDdDL25CVzRsR3JUenVX?=
 =?utf-8?B?eXBlYlBPNDVLWk9UaWpiQkVpV25NNjNtT3p6MUljcVRjeGpEZkdYd01WQ3dx?=
 =?utf-8?B?K3NxUTFuMzFhRW55MndRaWNnaUY0bWR1ME0xdXB4dEpoNk9zOGtnYXVVdXN2?=
 =?utf-8?B?WFY5Y1dDYVVJZjRNQTNQUmRNYmhucm9OWjRRazZMYzRvY2JodWJRbDBEcmxI?=
 =?utf-8?B?aS9vTFdrSnBobEtwV05xNWtBeUx2Wmt6MjU5UHRVMC84QmNma3dQcnNZQ2JU?=
 =?utf-8?B?VjNDaWZ6NmFpMmtXQmhGUFpnNzBWMWxtbnJkblJYTDBRbldQZFlpVERlR2lE?=
 =?utf-8?B?UVRmcFVobzdzYTZaZnEwSWl3eFdFV3pia09ZVnZaZnNKbXBmK0Jyb0VKNWI3?=
 =?utf-8?B?OTRGcVdYL0JGdVB5ektnNXE3QzRXTWxTRE94TitMcFlRRGdQTE5LenpVQSsv?=
 =?utf-8?B?OFZIUnA5WWdTM1lFd1hZY251dTNBTkJnZk85UDJuakJIblZmYVNyS3BrTmF2?=
 =?utf-8?B?RUtaSjFueXFHa0xsRktPb2M2d093L1pKZE84RG5WaGlVa29pL09rbEhzZnRz?=
 =?utf-8?B?UDdJYjZKaHEwVXJaOU9qblRlZzBPRFIzbStOYVlJRlhhbWxlbTgyV0d1bkk1?=
 =?utf-8?B?c1lYSlhuMmxMUjhTTzRIZ3R3NUx5dkkxWDFUTGN2OW01RmJRbTVuTll4YU1q?=
 =?utf-8?Q?ydjhxSt9VQguJi+NBVEHjMYkGTHfeU/p?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2gzUEdaSGpycWxWZ2NHYzNxdm5GMHF6aDFKTFBIejVMd3M0TWRBVElIeEpZ?=
 =?utf-8?B?NE1BUmdONUtuRUJIYkhIempMYmVXaGNyT20rQ2RjMlV4Vm0vZ0IrZ1J6TnZT?=
 =?utf-8?B?MFRMTkdZZ0NSOS9ocDNmU3pxOE8xa2l2NjhvUFR1SEg4bGpkRG0xTWxqTC9U?=
 =?utf-8?B?T3J3cnE1T3JORHllc2YyV2w1RjNubHRnSEtnUHduUEFtaGx2ZklHOXhEU1k1?=
 =?utf-8?B?cXc4dEZIb09BVWJ5aWV3d1YxZ1h1aGkxMGZGWDViS2ttU1lLd09xaTRSaUZq?=
 =?utf-8?B?ZkNPaDhyWjRjZlB2c3prbHcrSEgzenV0bWNOZHRJWXBBM2UxZTYydDBKT3Fo?=
 =?utf-8?B?K08xYm9YWU14R3lSY0NTUFVEaHk5MmI5TWprTmRmdnpNV00rd3ZUbHhTV0ZC?=
 =?utf-8?B?NWFGOEtUTDMvbisybGZKZnFRMjZmRDRZYXd1SGNzNzV5bnZ3V1FQNVNJaFo5?=
 =?utf-8?B?YzhDMlh0VjhtYmlhUGtnc3IvTHFBV2lqcUdSM25wRlNLczNTd1o0aE5UWDBl?=
 =?utf-8?B?c21wNVN0dzdOendFWk9RZzZxUG9CRXY4amQvc3V0WmJaQWZPVGFrTkFYSWxI?=
 =?utf-8?B?NkxnTjJCNEx0RC9mZll0NkNsYXl6eDNEa0NXN0hBdVZ6TnF3SWtLdko3WDJV?=
 =?utf-8?B?N0lSaGRmRGRwcmFoSmw2UThlUnFLV3Q3cGpydk1QRkJOWCs1bEFXNExVcE1W?=
 =?utf-8?B?LzU1TURMOXRucUE2VnZUUWFFT0ppcXNuRkQ0MWpZdFdHN04rS0NUczdXVFdE?=
 =?utf-8?B?djB3cGlNWXBUQjllRSthZWNiWUVmbFhZWXIxQUZJMEpHZEtCTjUwVXhrb1Q4?=
 =?utf-8?B?eHdzSEZ2NGp0QVhudkdnUlRIRDFBWlArSnZDSWhiUDl3K1llaDFnUVdVdDFF?=
 =?utf-8?B?VER3cE82cDdURVd3bDNiTWwydkVrV0x2ZitUWVVHOENGTzNqOGY1SzhkSkpQ?=
 =?utf-8?B?eGh4UjFDQTFNNW84dnRXQzFzNlJXUXhWaldKc2VZaEJDWEdrOWpaSXB6bm1h?=
 =?utf-8?B?c2FtL3NtcXZocVBBUW5pbWRLZlJPck1GR1BUR0NGSTRWVnovSW1tbGJSSjN6?=
 =?utf-8?B?eFdJb0tuNGdrSTZoQWV6QTNyWW4yY2hmVHBKdGdla2hmcDgvTFp4L0lqOUhW?=
 =?utf-8?B?b0oyakxHVXdDY1lNVDVuL2VEbFNSbEpKK3ZZdkVRd2tsWlBjVWNFWEdFVW92?=
 =?utf-8?B?YXVHMTV3bHJaNTNoWU4zTHJtK1VZUTUvZ3FkVGkxVWgxRkgxWFdpeCtKKzV4?=
 =?utf-8?B?MlNEbTBLeTdjSzZxWUtPWWFOL2ZvZU9hY1FONGZKMzJrYXh2WStjdTFBSHEw?=
 =?utf-8?B?TFhIeVBlajNJWG5rWGZvM2wzV044Wnl3Z2pyOU1vRFYzZDVUQkRoa1JDMXZL?=
 =?utf-8?B?bjVDQnVIRGlSTExRdnhDbE95UGlqMEN0UXc3a0gvTmVmQ2pXT0JDVFA1QU1W?=
 =?utf-8?B?b055UUVzU1BSYWd6Z2JILysvNlZib2dSUk9VazBnNlNQMGUvbEE5NG5oQTlv?=
 =?utf-8?B?SEdFaHRmSlU3VExtWHdsSWc0NTdJRER3OVFiZzZPMnl6c0c3cmUxb3MwVnJn?=
 =?utf-8?B?YWFpSGZDa29zR3VzNDd4eGZtWGdBeXVCb01Mb2Ftanl6cFNUODRmeFM5NDVN?=
 =?utf-8?B?N2U5emJNRnJLdHk2anNWZDRZQ1ZTNWg1cVdlWE5WR21IYnFVaTZ5bWZzODNZ?=
 =?utf-8?B?QWxuQWtaMXQzWUpDb0VxVlFIb3Jtelp6NS9FUHF3aXdzTkxXZTMxMFdWdXJ4?=
 =?utf-8?B?TEdKcXAwVG8zL3M3bjlScmdiQTNkcDhpUVZ5eUNIbm5ORnNlQmJ0RW5Mdzk0?=
 =?utf-8?B?L1Y4ak9KMCsxeUxlNW8vbUw1Q01qeGl6WEQ4MCtMSVpFVitkRXhoZVQ0YjlI?=
 =?utf-8?B?SU51WkNQcEZ6TWk4b1M2ZGM4ZGY3RWp1ZXFkRnVabVk0THZMMC9VdE9mQjg1?=
 =?utf-8?B?UFZKdXdSdHltcWJ1VHhxci83Z2FJK21xY3FTSTE3cWtKbXRVNCt1ekhDdHNG?=
 =?utf-8?B?Q0lvaWQzUVRDdjdwemxZTlJiUEs4UFYxTjdQZFNsY3VJb0JOay9JNmZpRkd4?=
 =?utf-8?B?bUVhS3JlUHhZNy80aVMxTjF0bWdaTG8wSTlRVURIcWxZTW1CaUR1WG9VWldG?=
 =?utf-8?Q?EK0zL6y4bJuG2QASD/fvOtX79?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4cea80-6db2-47e3-5a79-08dd7839baad
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 14:12:29.6589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: js9A8h19hJnT6ZmPS0lo/2v2IYSObzKXB6hDCSQmxCkQ544+/rC1S2zpvXCzOZNx572TsRK7WohBBzj9pMura2CPNmIfp7Et1Y9RFF/RS0Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_071240_170287_2EB408A0 
X-CRM114-Status: GOOD (  22.13  )
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

> Subject: RE: [PATCH v7 01/12] mtd: core: always create master device
> 
> Hi
> 
> > Hello,
> >
> > > The mtd_master is completely different class to avoid mtd tree
> disturbances.
> > > It is real kernel device object, I'm not sure how we can do 'link to'
> > > magic here.
> >
> > Maybe we can add that later if someone needs.
> >
> > > About MTD_PARTITIONED_MASTER - we can treat it as another partition
> > and
> > > create master device plus whole device partition as it's child with all other
> > > partitions as children of master device.
> > > For unpartitioned device this mean that we create master device and
> > partition
> > > regardless of MTD_PARTITIONED_MASTER flag.
> >
> > I am not sure I follow you. I am proposing to create the mtd_master
> > device in all cases. I believe this is the future-proof approach. Can
> > you make this change?
> >
> > Regarding the hierarchy, I indeed agree with what you propose:
> > mtd_master parent of whole partition device (if any) parent of
> > partitions.
> >
> 
> To be sure:
> 
> You want to have this hierarchy without MTD_PARTITIONED_MASTER:
> mtd_master
> \/
> |->partition1
> |->partition2
> 
> With MTD_PARTITIONED_MASTER flag:
> 
> mtd_master
> \/
> |->master_partition
>    \/
>    |->partition1
>    |->partition2
> 

Like this?

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8dc4f5c493fc..391d81ad960c 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -559,7 +559,7 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 		/* Sanitize user input */
 		p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
 
-		return mtd_add_partition(mtd, p.devname, p.start, p.length);
+		return mtd_add_partition(mtd, p.devname, p.start, p.length, NULL);
 
 	case BLKPG_DEL_PARTITION:
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index ee46766d74f1..a32cea0ba535 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1108,6 +1108,7 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
 {
+	struct mtd_info *parent;
 	int ret, err;
 
 	mtd_set_dev_defaults(mtd);
@@ -1116,17 +1117,31 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 	if (ret)
 		goto out;
 
+	ret = add_mtd_device(mtd, false);
+	if (ret)
+		goto out;
+
+	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	{
+		ret = mtd_add_partition(mtd, dev_name(&mtd->dev), 0, MTDPART_SIZ_FULL, &parent);
+		if (ret)
+			goto out;
+
+	} else {
+		parent = mtd;
+	}
+
 	/* Prefer parsed partitions over driver-provided fallback */
-	ret = parse_mtd_partitions(mtd, types, parser_data);
+	ret = parse_mtd_partitions(parent, types, parser_data);
 	if (ret == -EPROBE_DEFER)
 		goto out;
 
 	if (ret > 0)
 		ret = 0;
 	else if (nr_parts)
-		ret = add_mtd_partitions(mtd, parts, nr_parts);
-	else
-		ret = add_mtd_device(mtd, true);
+		ret = add_mtd_partitions(parent, parts, nr_parts);
+	else if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+		ret = mtd_add_partition(parent, dev_name(&mtd->dev), 0, MTDPART_SIZ_FULL, NULL);
 
 	if (ret)
 		goto out;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 8a019cf0360d..cd5ae919b80c 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -242,7 +242,7 @@ static int mtd_add_partition_attrs(struct mtd_info *new)
 }
 
 int mtd_add_partition(struct mtd_info *parent, const char *name,
-		      long long offset, long long length)
+		      long long offset, long long length, struct mtd_info **out)
 {
 	struct mtd_info *master = mtd_get_master(parent);
 	u64 parent_size = mtd_is_partition(parent) ?
@@ -281,6 +281,9 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 
 	mtd_add_partition_attrs(child);
 
+	if (*out)
+		*out = child;
+
 	return 0;
 
 err_remove_part:
@@ -401,12 +404,6 @@ int add_mtd_partitions(struct mtd_info *parent,
 	printk(KERN_NOTICE "Creating %d MTD partitions on \"%s\":\n",
 	       nbparts, parent->name);
 
-	if (!mtd_is_partition(parent)) {
-		ret = add_mtd_device(parent, IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER));
-		if (ret)
-			return ret;
-	}
-
 	for (i = 0; i < nbparts; i++) {
 		child = allocate_partition(parent, parts + i, i, cur_offset);
 		if (IS_ERR(child)) {
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index b74a539ec581..5daf80df9e89 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -108,7 +108,7 @@ extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 		      deregister_mtd_parser)
 
 int mtd_add_partition(struct mtd_info *master, const char *name,
-		      long long offset, long long length);
+		      long long offset, long long length, struct mtd_info **part);
 int mtd_del_partition(struct mtd_info *master, int partno);
 uint64_t mtd_get_device_size(const struct mtd_info *mtd);
  
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
