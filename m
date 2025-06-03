Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FF6C5AD49
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Jun 2025 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3RZhBTbVszQA0ARoHSoxkXrBTDl9bh40UAjYYq9+0nc=; b=momTEPGFL+ZZYM
	extB0ySeTQz2X2WTQfieDb8pvNbqlRhwzYHDVD2MHz6mCHen17E9U573PmKri3IHoIfdkbsl81bJv
	KEaRtNQjXP1Uh8/o77z7+2AFy2fNgKA/XaC5nWrhL7I70vSto0jB7TKgeZpSWIYX6Gel5EPcbi23T
	4ginetCDnzR1OgfhypKuqFz5yXPLFoyBZpkMNklz7QIL2fRF8/F7BIWvbPax+b1MRropQwACJ9uzG
	0Fo2wm1LnG1acTRFoqDgnb2xKqfbthKHzlnXVlZLfjfl0zdDFYT5MIHeMWKjDkH6e1kdGGBzWs6Jl
	99U8PquFkLG0JJi5IiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMtI-0000000AJFI-0aAH;
	Tue, 03 Jun 2025 08:21:00 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMtE-0000000AJEr-2RB1
	for linux-mtd@lists.infradead.org;
	Tue, 03 Jun 2025 08:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748938857; x=1780474857;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FfVw7xP2Pxwbc74tvfDRLD62XzQiA184CbKuk7SrdS0=;
  b=dlLrvUxt46xx722Ly9Y17SExQqF6xS2E+3PgzGsITtMDoirr6Jzpds33
   V5I3l1IAbl/+GK8bHjffGYsfVW1piKREo76H8z1biDKHL7szh2iwLfZ3D
   fW1ML7PNc1Hw7APNDjXlHzYHlEMpO6+sIT+7iUtTJyx8BnoayAVxjy71v
   3XhisxYr4z0Zlx8UwgVGKUxcVw8UguA1Hqs9JVnFnUBkExj7/v8mEnX3O
   SpRGbSTXMbc5+OdmNOaMDBCf6KkC1fnxzUITuZezodEs0QOmPSTHo+WL+
   gdUTm91+B82SVA1af4Mc7udtG9XXtd08WQPtnifhjCoUesnse2Z8H4V26
   w==;
X-CSE-ConnectionGUID: uEi9OofyQWSr97bluf+dWA==
X-CSE-MsgGUID: UOlLSXAMSFaZjp7IJZwgjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62023248"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="62023248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 01:20:56 -0700
X-CSE-ConnectionGUID: PIXyRXOiToiIXe12F8Jx5w==
X-CSE-MsgGUID: lKAL915OQSKx6yhm+h+toA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="145417687"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 01:20:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 01:20:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 01:20:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.81)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 01:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qquS8YE36apBeaz5X1/Socq4uv+8UYUAwLUkonJfVCoD6XgqAHjTju2HyNUsEXWrdN+50rMOaqwwFUpBf2DQCH0YBL3uTRae1GofaLQSS5sNY7V8A8r/hlv78TE5KufZiDFetVxHJW2kMkbnmIfZWf+NrTdu1qBKBJF3F4siz3S16BUj2REHTLHjTi5omJP6qiBh4v8DMphrD/VriwbXYgOrq3yN2Vmu42OtPcRGjYF+oE1Bv505f7kXYg/HwxOhclrs876EUf+toVPlKn/NPdAjEr349D1TnoB8u/Acpyv7fACR9aKfI5So7xHRT9pUpJEMK1FCxQ3r3brOk2yofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfVw7xP2Pxwbc74tvfDRLD62XzQiA184CbKuk7SrdS0=;
 b=bxwkGngPp0+CPK37aZZ6lhHN3LwZ1PMkDf8/YX/A+J14ZpFfANmwn9+SPHbZRe8H28osNJ3B+iEkiyd6WWw4XJ8q/WnSkBooreOOrO/+h687LBMIHxUYqqdx7VrfV52z+9GKFFDFF4Fu1v99xv9fnVa/56E573A6oHiPAecVNjSSDH5QEE/xsksfHdpogLR+fkZejSWGiahuZ4wimN7m6Ouuci8/HUrzxk+EiC6vJe0AghZmcDOCXElJFsQ4nm+/XbDazzSs3NLa4Em6V08varq9cllTdMExZAapIM67mKu+3E1hC10KxNKgCmERyFrQoT+GnCj23wxNM8oU0LNAKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 3 Jun
 2025 08:20:24 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8769.031; Tue, 3 Jun 2025
 08:20:24 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
	<thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
	"Poosa, Karthik" <karthik.poosa@intel.com>, "Jadav, Raag"
	<raag.jadav@intel.com>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
	<oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v11 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Topic: [PATCH v11 08/10] drm/xe/nvm: add on-die non-volatile memory
 device
Thread-Index: AQHbz9mkygYLLZi1TUaCjRbwRsx96rPrLNGAgAXk/3A=
Date: Tue, 3 Jun 2025 08:20:24 +0000
Message-ID: <CY5PR11MB6366659755FEBF265C892CF0ED6DA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250528135115.2512429-1-alexander.usyskin@intel.com>
 <20250528135115.2512429-9-alexander.usyskin@intel.com>
 <1d7eb70c-7752-411f-8e20-f41f85438d31@linux.intel.com>
In-Reply-To: <1d7eb70c-7752-411f-8e20-f41f85438d31@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MN2PR11MB4645:EE_
x-ms-office365-filtering-correlation-id: 7a7ba6b1-bb76-4a8e-a4e7-08dda2777d5e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cHR2MUQrU2Z5NkpCVjlhYXkzSUlOSkZYV0ZiU0RXRzdMeHZrQ3FFT0FXNjRs?=
 =?utf-8?B?T1lBN1k5T2tET0M1WXN0MGd0NjhvZWZNN2ZpellyRytsaElkYkxwc1VQNGlo?=
 =?utf-8?B?SnZscTFmOTlmVC9KK2tmdTBaRDZUc1VYek5FckdmMXUzU0grOXFwUlRnM1U3?=
 =?utf-8?B?RG1POUtUYk1BVEtSWUs5SmVqMUtVSFVFTUhwdlRiT3ZLaGNNZ2taZkVqQWtk?=
 =?utf-8?B?RUdidmM1c2hoQ0VYU2I3S3FxeUw5K3E0QXhFajRQQ0NPY1QxbnV5cmxWSnhT?=
 =?utf-8?B?T1gyZUZzaDhLam9zODVacHpoeVhiMkJPQjJzV3NmckViMXJuQ0cvMnlyWHZt?=
 =?utf-8?B?ZGtEaFpWRVV2M3VsOS9wKzhVSjBYMG9oUEUvdkhnWWZnbTZydlRFeXJwU3hj?=
 =?utf-8?B?TkhBMklVK1p4cm9saFF5OFpXMnZLeHJXRi82K01PVzlYaUJMOCs5N3ZkT1hh?=
 =?utf-8?B?TkJrTTU3S2FpdWkvTUdEdFlXVTVBYllkY1hYS2tHZkwvcW9pRjhuNWw5eXFG?=
 =?utf-8?B?ZDJUTjhVTEZFTytnWFQ2OE42NW9vY01zWndzejF1TFdscy83SnZJZS8wOUlv?=
 =?utf-8?B?UTFtNjhZdmwvR2RtTFRTNzF2Mkg4cmIwSEZ3ZUFjL3pDRXg4d2FYU0Rka0di?=
 =?utf-8?B?ZlBRSUFlNlNOMHVDOEdHbHZvZERmcVI1S2F1TmtnTjU0bGQ3dWt0WHZYU1VI?=
 =?utf-8?B?aVg1czFJOU1xMitVMk0vNzQ3aDk5RThRenFubjhSaWswZFlLKzJiaW1PT0k1?=
 =?utf-8?B?L2h6SUppeUdYS2ZYWm1hb3hjaUJia3dseWhHcHgyVWRDUzF1bHlPVXQ2ZitF?=
 =?utf-8?B?dXhvVE1IaFVtSFp6WXFjcWNnVnR6aUhLT1k4ZFF1dFFScFZ2ZFkrWUw4bUxB?=
 =?utf-8?B?L0RjRkszeWtldzg5SnhjOHFwb3NmaVJSQjU5czlLTldDQWhsb2N2aWl0bDJh?=
 =?utf-8?B?cnZwOWNXbVlGa0lOU3FHa1hLd2FVSXl2aGl0ZWFKMlZGb1piNmdTOHMzOC93?=
 =?utf-8?B?VnBRMFVtN3hkSm5JZG5SK0lIejFDQ0ZwY1U5Y3hlejhUTFdPekRMMUp5Z2Vy?=
 =?utf-8?B?cVVEdWs2UlVtelhpM1BUSFpHRUQ4dUxhdDFGRDYrQXJhcEFPOCtWRnZ4VU15?=
 =?utf-8?B?L1ZkK0pLN1FNWnowaFhZQ1dETVNYQUMwRzE2ZE5BaXlLd1cyUUZ6VDkyZHQv?=
 =?utf-8?B?RDRGR2tlOXp0YjIwVnN0dWZ5Ull1MWtXVElOd01wOThkNnV1VmFDSnFiTzFM?=
 =?utf-8?B?VExua0xIVWJ5TStBNzV0dG9acHRWNWlxSE40cDd6a1U1bnRzZllodWJiS3FL?=
 =?utf-8?B?ZDVzamJ2YUJPNlJMU1IvSWRaWWtVSGZPNERNL3F2aWJIRmVZSmFrK3R3bTIv?=
 =?utf-8?B?bGhCb1E2UHFBTG41a0s4WEdBZmpWQzVXaGVnMUdjeitFdUJqWStqUCs1NmRJ?=
 =?utf-8?B?b0tOODV6L1pFUmo0VWJ5dnl2WnMzL3ZudXRXUjg5SVlJV2hScXVaZ215R2I5?=
 =?utf-8?B?cDFjTnphSDFxNXFCS2dQbzRqM3lVdE8wbENydm03WlJoRWNHd3R5NWQ5NW9C?=
 =?utf-8?B?S3RWRkFidncrRVVxa0ZrMDlaMWNRUEw3dHJMa1lHQVpZVEVsTWhYSExRdjBw?=
 =?utf-8?B?NHdUdGJJRDgzWDVCS253eEZqb0U1cTh4VjgxKysyblFXZVpVL093SGpYSzNT?=
 =?utf-8?B?dFpVMTNSZUJOV09lZm1raEtLRkpmcU8yQ243aTkrOVk1UlVQUjZkUlVlQWVh?=
 =?utf-8?B?VWZhZVhkeVJYanNHZythUldNUk1rSVdkNi9HTFIyR2JtbXUya1l4N3NsNGFv?=
 =?utf-8?B?NDM0OENWdGU4Um15TkpIdjhxRzk4aFZzc3hydjN5MlF4SnRWVklOK2paYUdR?=
 =?utf-8?B?MnZIUitIMHVBQ21HTVdMZmNKZ1k2R2N3TWpGQmpndktIWFdBaTJRdSs4cjhQ?=
 =?utf-8?B?MWgzcUluUVRDcFAwc1BYNlpWZ0R3UElNdEs0YU9teUJJWnVyU0VSRWY0eXAz?=
 =?utf-8?Q?fn4aVwf6OIS4/mbjr41wL3tp4P4nak=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dzJlM0sxQ2lwdXpIVWhSZElFREd2MWx2WmlNYzZIeWs3Y1VsNWUxdkZuYzQ5?=
 =?utf-8?B?L1Ryb0VVZU9LVG5RWVl2VUVLazZXTisxRTFQMWRkY0pMNnBmU2l5akdvbkNq?=
 =?utf-8?B?cFZTSlR3SEpEMTN3bk9zTjNxb05LVFFpSkVCalh2V2dkYURmSHVmblNYR3VP?=
 =?utf-8?B?am1YTUs2WEx0ZXhZbzdidnZqczdTWndEVWMrdldOMUtROUtGYmh2K1FHMnVE?=
 =?utf-8?B?VEZsUlZ5SmVrMWtoMGJVazRMRG5MTXJEbTBuT2wyeDVhRzRBZlZJaHo5aVZP?=
 =?utf-8?B?azRxNkVpM0ZwenNKZGZVVm8wU3BXVW5oaHRGcmpCNWF5ZkRVYkhYQTg4ZjlU?=
 =?utf-8?B?ZThzNFlaZCtEUGtaL0RmbkR0ajJ4cWljZ3hXaml0OE5iamR5Y0tNKzRkVk5l?=
 =?utf-8?B?Yi9JQXFSZFRwdGhxcGo1VXZuOXg3ckxDZTlhUWcwVGZuQkZhWDV4amN6V0xw?=
 =?utf-8?B?anNLNjNpUzRqYTBvN2ovYjhVWTMxK0szUnVqK1grcmpYY2Q0ZkVweUd0NWpm?=
 =?utf-8?B?d09HVjl6OEYxWjdKc2JaMzdqcnQ1SkNBZ3N2ekZNZkpBWDRXNXRpRDNGYVZi?=
 =?utf-8?B?bENCdmtrOVVGd2lob2dzNytlZUdyZnNucm1ha0lwWXdlbXYzYXdCZEludEh1?=
 =?utf-8?B?ME56ODRYdmJJc1FuWDlMTXdqZmh3bitsYW9ZTnc2TVloQzlUWlV3N010b2xN?=
 =?utf-8?B?Q1JWUExabFdsZk5EanhGWFlNTlV4ZzNhL2VuZzFLMk4vM2dZZVpTVnlYVE1p?=
 =?utf-8?B?QjNDSlRxaExqVzNldHVEN1l5VzVCMlM2NVBWRm1rMlRXbnhZUUZPYWpyK3NF?=
 =?utf-8?B?cklYckJtSXdWQ0ozcy8wOWJwYnh3QWdyMlFwYTA4MG9VYktxZ0hmcFdDd2Ra?=
 =?utf-8?B?c2RBV2NLcWNBczhXOHBYR0ROcVRxWDY1VlNhNmFNYTIwVENKYVhKTW9OdStN?=
 =?utf-8?B?SUpWUFR2SCtVaWFSSTlXSmtjSWo0c2dmZWVDcWsvTHU1a2lucHdnUDE3MHpw?=
 =?utf-8?B?bjRzTGx3bXA4Mi9wU2lSSWdMajZvZVRhQXVBMEs4VUdMeHFYSlZLb3VzdlZ4?=
 =?utf-8?B?N2JYM0s5bkxZODhodlUwcUU3Z2VNZlpveGVZdk5DWFg5TVN5K291WnFoRjdO?=
 =?utf-8?B?ZWpDQ3BlNy83QisrbkhScUcxajhxYkVLSm1tLzRRTEh6SW5UVDNCWGQxWVhs?=
 =?utf-8?B?T0VWb2NlcHJRMFNqbkk0NGtxTFIxdGhkejBNUm1tOElrT09paVV4d0QxN2Vr?=
 =?utf-8?B?MlNUSWdKYzRnY3k4QWc0YmtLNktCei9pU01WM2tTNlY2MnlTV0VWdHVwRUVE?=
 =?utf-8?B?eDVPV2JGS1VsUWtneXhEVFpmYkVlSyt2WHRGbmtwTUlHS3JzNlptVWliTGs5?=
 =?utf-8?B?OVgrMmRZUkZCK3Fld2FOa2RKVjFZd01pdVZyUW9xcVZJMDJBWEhtc0tuZDIw?=
 =?utf-8?B?Q3pQbTNTODAzMjFrVThJK0hJc0hBRHo2NzR5aloyTzF2TzJUQ01qVkQ0UUNy?=
 =?utf-8?B?TkVHWElIeHNjbndxanppT3k4SjdNbWRiclFmNEZXcWhTZHFYM1ljOVI5dXdv?=
 =?utf-8?B?d2p3S1hTNnpNTEVCNmRoYXdIMnJZUVI0MXNTUml4V0pNbDlEeTMzaGJ4RzY0?=
 =?utf-8?B?MkpISjZvOTYwNVNXaTkwOTRrcUlkZ2dWalFUb1FtVEZ2K3o1T1A0SzU1MEIz?=
 =?utf-8?B?QVJqUXZsRlVnQWUyTmZidnlFR1VrcjZ5VllnYSsvNTdsak9tR0FyZXJIeWI5?=
 =?utf-8?B?U0Y4dUo2VTN5TGZCQ0diMTJZekNRRU14VjVvdWdjTTV5WmFvZzNJQ3pTQVlN?=
 =?utf-8?B?S0lKS1J3ZkdxWlNBMUY0YVNhQjZPVlhWdGtvZEg1VnpRYVorVnAyRCtMdW9L?=
 =?utf-8?B?MGx0TjVxanRSRy9Jc203bnlLV1NJTnIwWGU0M2E1d25iUWp3UEUyT2JzZmJL?=
 =?utf-8?B?YU5qckE3bjVGallMeXlOdDRuVUNVN0I2Ry8yWklNcTI0ZlZINkpRUXRmQXlp?=
 =?utf-8?B?T0IxTDJBS2tvTlZRbFpheHNWOHVCRTVxeUdOTHkwUkxhQVdTeDdZZGR5eDB5?=
 =?utf-8?B?T3lRd1piblF1eXpmTGlUTlRJZ3hxdmRIRkZ6UERnRnNrTUNuTndEZmp1TFVu?=
 =?utf-8?B?Z2xnNTBZMmxkMTZ4ZUVRK2lORmU4ejVFekszMk1XUThYVnJtQXRMeFZ1dmF2?=
 =?utf-8?B?THc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7ba6b1-bb76-4a8e-a4e7-08dda2777d5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 08:20:24.4054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VEQmGC0Kiuojwv43zUckoLIwHuB6E/Vqaa5CNVxTb/TnNZbmntT+R8KRLBAV9UOdCqvbo0wyPzwFEzWHuRQHKWOgSzCBryCdwL6/tQ3OXbc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_012056_701074_FBEB45E5 
X-CRM114-Status: GOOD (  19.30  )
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

> Subject: Re: [PATCH v11 08/10] drm/xe/nvm: add on-die non-volatile
> memory device
> 
> Hey,
> 
> I was looking into testing this with the xe code on PVC, and noticed some small
> changes that would be useful to integrate before merging.
> 
> On 2025-05-28 15:51, Alexander Usyskin wrote:
> > Enable access to internal non-volatile memory on DGFX
> > with GSC/CSC devices via a child device.
> > The nvm child device is exposed via auxiliary bus.
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile          |   1 +
> >  drivers/gpu/drm/xe/xe_device.c       |   5 ++
> >  drivers/gpu/drm/xe/xe_device_types.h |   6 ++
> >  drivers/gpu/drm/xe/xe_nvm.c          | 107
> +++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_nvm.h          |  15 ++++
> >  drivers/gpu/drm/xe/xe_pci.c          |   6 ++
> >  6 files changed, 140 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
> >
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index e4bf484d4121..4c51fe3520dc 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -80,6 +80,7 @@ xe-y += xe_bb.o \
> >  	xe_mmio.o \
> >  	xe_mocs.o \
> >  	xe_module.o \
> > +	xe_nvm.o \
> >  	xe_oa.o \
> >  	xe_observation.o \
> >  	xe_pat.o \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> b/drivers/gpu/drm/xe/xe_device.c
> > index d4b6e623aa48..845b38aea692 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -46,6 +46,7 @@
> >  #include "xe_memirq.h"
> >  #include "xe_mmio.h"
> >  #include "xe_module.h"
> > +#include "xe_nvm.h"
> >  #include "xe_oa.h"
> >  #include "xe_observation.h"
> >  #include "xe_pat.h"
> > @@ -884,6 +885,8 @@ int xe_device_probe(struct xe_device *xe)
> >  			return err;
> >  	}
> >
> > +	xe_nvm_init(xe);
> > +
> >  	err = xe_heci_gsc_init(xe);
> >  	if (err)
> >  		return err;
> > @@ -941,6 +944,8 @@ void xe_device_remove(struct xe_device *xe)
> >  {
> >  	xe_display_unregister(xe);
> >
> > +	xe_nvm_fini(xe);
> > +
> >  	drm_dev_unplug(&xe->drm);
> >
> >  	xe_bo_pci_dev_remove_all(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> > index 50b2bfa682ac..938cf1a440de 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -35,6 +35,7 @@
> >  #include "intel_display_device.h"
> >  #endif
> >
> > +struct intel_dg_nvm_dev;
> >  struct xe_ggtt;
> >  struct xe_pat_ops;
> >  struct xe_pxp;
> > @@ -319,6 +320,8 @@ struct xe_device {
> >  		u8 has_fan_control:1;
> >  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
> >  		u8 has_flat_ccs:1;
> > +		/** @info.has_gsc_nvm: Device has gsc non-volatile memory
> */
> > +		u8 has_gsc_nvm:1;
> Is this flag really needed, or is IS_DGFX() enough? It's literally only used during
> NVM init, so any conditions could probably just be put there.
> 

There are some DGFX that do not have GSC/CSC and corresponding NVM.

> >  		/** @info.has_heci_cscfi: device has heci cscfi */
> >  		u8 has_heci_cscfi:1;
> >  		/** @info.has_heci_gscfi: device has heci gscfi */
> > @@ -544,6 +547,9 @@ struct xe_device {
> >  	/** @heci_gsc: graphics security controller */
> >  	struct xe_heci_gsc heci_gsc;
> >
> > +	/** @nvm: discrete graphics non-volatile memory */
> > +	struct intel_dg_nvm_dev *nvm;
> > +
> >  	/** @oa: oa observation subsystem */
> >  	struct xe_oa oa;
> >
> > diff --git a/drivers/gpu/drm/xe/xe_nvm.c b/drivers/gpu/drm/xe/xe_nvm.c
> > new file mode 100644
> > index 000000000000..33ba635ce116
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_nvm.c
> > @@ -0,0 +1,107 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright(c) 2019-2025, Intel Corporation. All rights reserved.
> > + */
> > +
> > +#include <linux/intel_dg_nvm_aux.h>
> > +#include <linux/pci.h>
> > +
> > +#include "xe_device_types.h"
> > +#include "xe_nvm.h"
> > +#include "xe_sriov.h"
> > +
> > +#define GEN12_GUNIT_NVM_BASE 0x00102040
> > +#define GEN12_GUNIT_NVM_SIZE 0x80
> > +#define HECI_FW_STATUS_2_NVM_ACCESS_MODE BIT(3)
> > +
> > +static const struct intel_dg_nvm_region regions[INTEL_DG_NVM_REGIONS]
> = {
> > +	[0] = { .name = "DESCRIPTOR", },
> > +	[2] = { .name = "GSC", },
> > +	[9] = { .name = "PADDING", },
> > +	[11] = { .name = "OptionROM", },
> > +	[12] = { .name = "DAM", },
> > +};
> > +
> Small ask, can we enable PSC for PVC too? Or at least bump regions with 1 so
> it's doable.

Let's enable PVC as follow-up patch as this series is delayed too much already.

> 
> > +static void xe_nvm_release_dev(struct device *dev)
> > +{
> > +}
> > +
> > +int xe_nvm_init(struct xe_device *xe)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +	struct auxiliary_device *aux_dev;
> > +	struct intel_dg_nvm_dev *nvm;
> > +	int ret;
> > +
> > +	if (!xe->info.has_gsc_nvm)
> > +		return 0;
> > +
> > +	/* No access to internal NVM from VFs */
> > +	if (IS_SRIOV_VF(xe))
> > +		return 0;
> > +
> > +	/* Nvm pointer should be NULL here */
> > +	if (WARN_ON(xe->nvm))
> > +		return -EFAULT;
> > +
> > +	xe->nvm = kzalloc(sizeof(*nvm), GFP_KERNEL);
> > +	if (!xe->nvm)
> > +		return -ENOMEM;
> > +
> > +	nvm = xe->nvm;
> > +
> > +	nvm->writable_override = false;
> > +	nvm->bar.parent = &pdev->resource[0];
> > +	nvm->bar.start = GEN12_GUNIT_NVM_BASE + pdev-
> >resource[0].start;
> > +	nvm->bar.end = nvm->bar.start + GEN12_GUNIT_NVM_SIZE - 1;
> > +	nvm->bar.flags = IORESOURCE_MEM;
> > +	nvm->bar.desc = IORES_DESC_NONE;
> > +	nvm->regions = regions;
> > +
> > +	aux_dev = &nvm->aux_dev;
> > +
> > +	aux_dev->name = "nvm";
> > +	aux_dev->id = (pci_domain_nr(pdev->bus) << 16) | pci_dev_id(pdev);
> > +	aux_dev->dev.parent = &pdev->dev;
> > +	aux_dev->dev.release = xe_nvm_release_dev;
> > +
> > +	ret = auxiliary_device_init(aux_dev);
> > +	if (ret) {
> > +		drm_err(&xe->drm, "xe-nvm aux init failed %d\n", ret);
> > +		goto err;
> > +	}
> > +
> > +	ret = auxiliary_device_add(aux_dev);
> > +	if (ret) {
> > +		drm_err(&xe->drm, "xe-nvm aux add failed %d\n", ret);
> > +		auxiliary_device_uninit(aux_dev);
> > +		goto err;
> > +	}
> > +	return 0;
> > +
> > +err:
> > +	kfree(nvm);
> > +	xe->nvm = NULL;
> > +	return ret;
> > +}
> > +
> > +void xe_nvm_fini(struct xe_device *xe)
> > +{
> > +	struct intel_dg_nvm_dev *nvm = xe->nvm;
> > +
> > +	if (!xe->info.has_gsc_nvm)
> > +		return;
> > +
> > +	/* No access to internal NVM from VFs */
> > +	if (IS_SRIOV_VF(xe))
> > +		return;
> > +
> > +	/* Nvm pointer should not be NULL here */
> > +	if (WARN_ON(!nvm))
> > +		return;
> > +
> > +	auxiliary_device_delete(&nvm->aux_dev);
> > +	auxiliary_device_uninit(&nvm->aux_dev);
> > +	kfree(nvm);
> > +	xe->nvm = NULL;
> > +}
> In xe, instead of exporting nvm_fini, it would be good to use the drmm
> interface, like drmm_kzalloc for allocating NVM so it doesn't have to be freed
> on failure, and drmm_add_action_or_reset as last action in during init. That
> also removes all checks from fini().

Can be done, but I prefer it to push as follow-up patch to not delay whole series.

> 
> > diff --git a/drivers/gpu/drm/xe/xe_nvm.h b/drivers/gpu/drm/xe/xe_nvm.h
> > new file mode 100644
> > index 000000000000..7f3d5f57bed0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_nvm.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright(c) 2019-2025 Intel Corporation. All rights reserved.
> > + */
> > +
> > +#ifndef __XE_NVM_H__
> > +#define __XE_NVM_H__
> > +
> > +struct xe_device;
> > +
> > +int xe_nvm_init(struct xe_device *xe);
> > +
> > +void xe_nvm_fini(struct xe_device *xe);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index b68c90910d82..6aa9850bb342 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -63,6 +63,7 @@ struct xe_device_desc {
> >
> >  	u8 has_display:1;
> >  	u8 has_fan_control:1;
> > +	u8 has_gsc_nvm:1;
> >  	u8 has_heci_gscfi:1;
> >  	u8 has_heci_cscfi:1;
> >  	u8 has_llc:1;
> > @@ -271,6 +272,7 @@ static const struct xe_device_desc dg1_desc = {
> >  	PLATFORM(DG1),
> >  	.dma_mask_size = 39,
> >  	.has_display = true,
> > +	.has_gsc_nvm = 1,
> >  	.has_heci_gscfi = 1,
> >  	.require_force_probe = true,
> >  };
> > @@ -282,6 +284,7 @@ static const u16 dg2_g12_ids[] = {
> INTEL_DG2_G12_IDS(NOP), 0 };
> >  #define DG2_FEATURES \
> >  	DGFX_FEATURES, \
> >  	PLATFORM(DG2), \
> > +	.has_gsc_nvm = 1, \
> >  	.has_heci_gscfi = 1, \
> >  	.subplatforms = (const struct xe_subplatform_desc[]) { \
> >  		{ XE_SUBPLATFORM_DG2_G10, "G10", dg2_g10_ids }, \
> > @@ -318,6 +321,7 @@ static const __maybe_unused struct xe_device_desc
> pvc_desc = {
> >  	PLATFORM(PVC),
> >  	.dma_mask_size = 52,
> >  	.has_display = false,
> > +	.has_gsc_nvm = 1,
> >  	.has_heci_gscfi = 1,
> >  	.max_remote_tiles = 1,
> >  	.require_force_probe = true,
> > @@ -346,6 +350,7 @@ static const struct xe_device_desc bmg_desc = {
> >  	.dma_mask_size = 46,
> >  	.has_display = true,
> >  	.has_fan_control = true,
> > +	.has_gsc_nvm = 1,
> >  	.has_heci_cscfi = 1,
> >  	.needs_scratch = true,
> >  };
> > @@ -589,6 +594,7 @@ static int xe_info_init_early(struct xe_device *xe,
> >  	xe->info.dma_mask_size = desc->dma_mask_size;
> >  	xe->info.is_dgfx = desc->is_dgfx;
> >  	xe->info.has_fan_control = desc->has_fan_control;
> > +	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
> >  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> >  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> >  	xe->info.has_llc = desc->has_llc;
> 
> Kind regards,
> Maarten Lankhorst


- - 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
