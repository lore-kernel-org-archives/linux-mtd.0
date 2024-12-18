Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBCAE77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 05:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FMXMbonR6wNM4SbBoEjmoOhQG6WSnbSjaiS2a4JguQ=; b=WeTgAPiypateC2Y1sUHOf+lzuE
	mruzt+q6jdjAMkjvA6SpY9LctZZONXx7tCZIuDikt236PA7KnzPRX5J+xo6SgR2e2AvSZaRb564SE
	az3OZtfrDcqCI+CE6Yozr/pdCB5v5NzFxNOSU6VzOHXlBH8NJVfsPUvVubl0PW8lvbUzvVQjKQEts
	tCkWwP+QJitNX+n2g/aWEGeYTc4lV7cBZE8cdyenwJM9yjnS8j2ozFydOzPEh9E1WiLPupJwaQIUt
	UYQMQ8U0WQXpoVy44C57hex77LwYW7j0/XizZ8LCBXUDr57gvo4sNy8zmkQK/QVrEBSPeIw85wWB+
	ahKpqWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmSE-0000000Fcns-2Z6g;
	Wed, 18 Dec 2024 05:18:38 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmNF-0000000FcFT-19Am
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 05:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734498809; x=1766034809;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ptrd3mtvloyZBPsx4eA1U16MQqqlJoCN/KbFVtjTCNw=;
  b=eMFgurxvyEwzdEBLYCk3xBAZn46eDVdoWUHnz1G9G6eHrdvqQgIjR22D
   1DJACsvzsNa+E6h28Lsfj3WsM+qJq1NsoUay6oRw+nXkbBZCABSryANAC
   5/ZQaAPJX0HVhX7/zGzobQMcl3HFPls5pfWKlam6G8uq2FMz36Huc5+Mv
   +vLBXIKULQk8kGH+U/krk2IKPcRTZb8PGNNzYPeuzu8kdAv8JWpmkxtwg
   fTiOz9JR8xbG4b0mWjQTzTDFTPSaXzF0tU5bsbQ3XXopLVfTbKFrNdDcj
   8jyKlFpRunJY3ZyalA5HnYiDLJf7Ap1rr5MfFRYV3ycLv0GlHgnHiJ8pX
   Q==;
X-CSE-ConnectionGUID: /VYN96z7TW6yskogxFVKyQ==
X-CSE-MsgGUID: yJ/Ade+9STCwuvVUM7F2DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="34847161"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="34847161"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 21:13:27 -0800
X-CSE-ConnectionGUID: hlmwEaXwTiyotRWvSMrUuw==
X-CSE-MsgGUID: LtZPjWFoTtKRxkLXaXhVeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102746861"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2024 21:13:27 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 21:13:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 21:13:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 21:13:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q77XcAsrIKmpQIub+oyBkihtb62ULjr7BRRZcwQlRs6bO1vcP4FrPVxTDZiNz2VjMQaUjTQO6hlve4VyhHuqJ4nFnGvsyLdjJaCtd+wqCn8ak1M4Xwqo0cLSpryvGHWzHnjO1arynxCZFc58O3hJe9c4s3CA705yrzzDCX1rfkfuGMrb6eS7VLjORcj+EhGNbwcHVa13PjAexpz9wZDv3J8U/0p+XuPRxFx2FzR3PKnuyJnjkI7yi0gpxnCASjW2wQ8YiOZmxa0LsvT0P0k/OzLWqEeQHtALXGrksqtcEHcDcWsHk0hRkordaAdY2200GMR5zkhF+22nmaLT39YTew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPXIeyut89dXwUGrOV6u4SDO/M33pqQfUmbB08aiQk8=;
 b=f4aTawPRbVmzO+56nMgXBR2xdHqS6+kM7ykM3zVBgx/vhM3SSE52tp5FSdgEOGP4X1O0EvwGRGS7fTDfsfBjs+J6VbmhCt9wP9KmtHCe625CKJ0hh4IG4zRiACE8gZgikjwN+0HziOwFUWjH81cmi+W/+na4Xo5nR42twdmwTYMknw8bNaRMSu78YPm3vRTA7xD1KkpVWN4J/ouHuc8oFoDPfo7fv9iDFZ5SQ8WD05c6mYcNkwpRBP16Po1V+ZhNQf1MRu+uG50GVoQM5URTWfGC4lDj4qVvCQ+jj8NySC7KJgu9obLcWLwD6fdlICb/YIyf8S7b9oRmPwVfd0mArg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 05:13:24 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%7]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 05:13:24 +0000
Message-ID: <24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
Date: Wed, 18 Dec 2024 10:43:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Alexander Usyskin
	<alexander.usyskin@intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
	<lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
	<thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
	<tursulin@ursulin.net>, Oren Weil <oren.jer.weil@intel.com>,
	<linux-mtd@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
 <Z2H_7Xry3R2fWpMZ@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <Z2H_7Xry3R2fWpMZ@intel.com>
X-ClientProxiedBy: PN2PEPF000001AE.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::a) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a8871d-6fdd-4343-3a41-08dd1f22b2a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1hOdVdDdXJqbTZMcVJVZlF3Z0d5ckZFU2tWR01SYXRZMWdzMytzQXVqNnpi?=
 =?utf-8?B?OTRXUW1rSHc2OWRBd3pta2VicWFSWUtBTnpRY3NvRGJjN0VibkVkZmVGVjJ6?=
 =?utf-8?B?aWk2TGF5QWVhQUJJSE91eVdjZ2h6NG41TG5KTWNNbWlZU0JHSnNVMkptV1Mx?=
 =?utf-8?B?Uk15NzgrZE0yaG11SEpYd2hVR1JGOWNJMnl3TkRaOFlPZzZEendyMWFWTVFw?=
 =?utf-8?B?cWRoT0NzRHYzVFN3RHF4UGlQRmEwUXRWaUlTd2hMRGFSRTJQNHQzVDViQVpp?=
 =?utf-8?B?RC8rZk5EN2IrVndPM1g5T2tOd1luWVBZYmhOelZQaDFXSEtZUG56Q0RnSDVp?=
 =?utf-8?B?dndkS083TEZCMEdCNTYxSEJjeGNoVDhab0V6VmhQOS9WVDJGUzZNZHUwZ0ww?=
 =?utf-8?B?RGRWMnNrcUhrT2JOU2VFYmh1dEhJZlNkWUh2RmJKOXozclZNNERGT0NHcUlT?=
 =?utf-8?B?WXhwOEY1WW9PM3Y5Q3B6N2hNWW5BRy9lMW1HMXJSVmpsNHhNVStXek5wbDdu?=
 =?utf-8?B?VzZDVkhOVEdvd21BZjlzSWRZZVhtWS9lNTBkQ0RqZVNBLzQyNFFqVlNTaUdZ?=
 =?utf-8?B?MGM5R3kyZFppTFdBTHZuSTR2UTJSSzE4NXpERWtHMW1oV3VSSUw3c1hQenJL?=
 =?utf-8?B?ME52aGQrRDBwTlZxdmxNMG9RSXR4emNHQnd5bzd3bGc3WU5mbXY2eFlCRnQ1?=
 =?utf-8?B?ZWxURERnSURDaE80WGlPR1BnTTRVQ2FhYWJrT2d0cVExaFJoaTBYaEFpOHhi?=
 =?utf-8?B?Ni9GZnBtOXd3eHNUTTIxYThIeXMxb1NYaDFkQSsyZjV1UEwvbjM0WWpVa3Y1?=
 =?utf-8?B?NkpuZmFZZ25IMVd2aDUvZmNDOVBiTjVYUk1jV1E2MjRkUVVpd24xeXN1MDg0?=
 =?utf-8?B?eHhlREtZNXFIdFp0KzM3R0xncW5hS1l6ckNMZEs4MTArb2tBQjlCUCszQkJm?=
 =?utf-8?B?VnJrSG05MkEyU1kzZURSQUgzSXhiNG5MbktoZUNXU3Q1aHpCZ2ozNGV0UHN1?=
 =?utf-8?B?RzBCOVkvd3gvWDY4ZGZLbUJoWkU2NnJRYlhhRFBlUHpjRktXZnF1T29nY0Va?=
 =?utf-8?B?N083Y05CUjJtQW9aUGVUUUs4bVovMW5ueG4zbm5YSmZRMWhReEN3ZEtQUjZt?=
 =?utf-8?B?OFJPY1VmekwzRm4zbUhoSWVDS20yZW5qekxDSjNGUGpZQnFDbllkQ1pLOWJW?=
 =?utf-8?B?azYxNk96bHJocHpibFd3N3pkM2ljREFtL2ZWQ0YvbTVkdG9pR0x2dEVqazgz?=
 =?utf-8?B?Y1NaMHR1b3QzbU5oL21rWVd5K01BNS9IUjUxOCt3bGhNa2RUb2pEcS9yZ0RU?=
 =?utf-8?B?Rk5MaDFucERnYjlRRThoZXNCSTRCcXpPL1NDK0tnZzlrbXViNkhCa1B6UGNH?=
 =?utf-8?B?K0Q1Q2tWc0ZGN3loV2JUdDZFK09VTnBxUG5ybitkWUV6M1VaZitsSUtram44?=
 =?utf-8?B?MUU2MUN3czc4WU1ZVkFGUkdUSzI4Q0k2TWI5eUo1cnN6a29ZeGRMTHhuUysx?=
 =?utf-8?B?VldDVUxNZXV2cUYyeFFpMzNaWXFXQU9NVlYyNkNHR2ZPbXBvSWZSU2pmazBv?=
 =?utf-8?B?bmJYTWlNc1YxWXRVTHA4Z1d0VDhoYnhEc3ZyWHVyUzRZaUVIL1drQXVQMmkw?=
 =?utf-8?B?VnM1QzhDVXB1RTFMQ0JSdDdSNTRhYkR6emIxNHR3NmNuY0JQcTFFRlg4Nmo5?=
 =?utf-8?B?bmltTFlHNURGdjBmZThzdUZ4Vll0YW1VZ0d2ak9FcUlqK3l1dVlZOHVqTVhZ?=
 =?utf-8?B?YVZWUnkxRUxHV2lGOHlMbmg4dEJXWkllQ1N4RER2aDBLdXBVNXk5Z0x0dHRC?=
 =?utf-8?B?MitWMHRJVkEzTE9nc2tmZ3pJNG1YbWIwbHR2dVk4TG9ZTUZWOHd5aTQ5anY4?=
 =?utf-8?Q?4glF7N1VqJHyB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1Y1Mk5KNHhydjQweFYzamxLdDV3RUNBcUh1OERPcDJGaHp4TU9YenQ1ZlBP?=
 =?utf-8?B?QzNQQUlTdjNOU2NwNXpzd0RqN043Ykx6N1dqR2xFeGRNREtXYS9URHduYVJW?=
 =?utf-8?B?K0JGVzh0aDJzVUo1b0ZkejhYSnZXVXc3Kzd2WldHNWtGS29iUmZKL2J3SG5W?=
 =?utf-8?B?NjI0d3dUN2d1bnFXNlpnZHJaRzMwYzd5NmNFeURkT2dhNmtzZndiVlJUVTZh?=
 =?utf-8?B?aHVpOHNhZVU2Z3IzVVB1Y3MzZVQzSkZXV3BTSERDTkZXUmNIcTRXalFaOE9N?=
 =?utf-8?B?Y2F5cnAyaEYrUFM2V2RUUXJWRjAzUnlyeUxsVDFHeGpleDFHSGZ6Ym1tbDV6?=
 =?utf-8?B?VDFBUnZSanRiMXhodDdyZ0g0SG1jYzRtejZCT1diSFZTQkM0MzZiSDYrM1Fp?=
 =?utf-8?B?R25xYzlHd1k1dC9RN0lBUWVtVHNvMlhRUVdIR1UvRzZBZmhpMEJuTXczTGNa?=
 =?utf-8?B?QUFuTlFnakdkWU5zVEVxMjdselVxbFpHYUhyWDNJcXQ3VnhaOFZRY3lablJV?=
 =?utf-8?B?c2ZCOGpjN2xGd3VSTFRCekVtUy9Ic1RYM09LbEFqcnRES3lBajB0MjRvLzkr?=
 =?utf-8?B?N3lKbmNQd0o4RVNkRWErSi9maStTeGRkUkFRSHNZcjB5SXlmcnpUWUFkSHYr?=
 =?utf-8?B?anhBQU10ak9HZnNiemFUcVAvYkZ2NXJJR3pjZ0M3NldGNDJjd3hyMTNxQ09w?=
 =?utf-8?B?ekNPVTRHclU1T0w4MElzelVvUklad3A4QzdsQmVhMm9HdkFWNUluYmxyNkJy?=
 =?utf-8?B?Wm5HTXRuWEpENUJSV3g5VkZNUUVOM2RQN0dWdlpEU0E0TlpQVVJ2cWM2UjRw?=
 =?utf-8?B?cUNEbjVpR0xhVTZqTGYrbHN2MjBZMkdtY3VyWnhWL2IwV3N5Z09EazVqMmtx?=
 =?utf-8?B?RUVjUlIySDVxLy9ReWpPL3FobVZ0NTVmSkVhNUM3Snc2TjBVUmluMm1oKy9v?=
 =?utf-8?B?aklnYWY2UzUzdktpNWZ0T1BsSUxNdTRFTlJmRzJwNjg4dzRIK2hSMnA4Sko5?=
 =?utf-8?B?aGdkSnRIMmdJR2ZqRWRRNzFwTTRsQUFQWTdyUGhSOW83SjZtRHhaQ3FUdmIv?=
 =?utf-8?B?SVVTVUR2S2FESDJBMFBuUFh5NUtkUDlLZ01EMFoyV0svZ3FtYU9ld2hGTlVO?=
 =?utf-8?B?R054WVFZWEpKNFhlN0xQWTJuc2JqRHR0NmRVcFZVWmlkTVVzZExaTVE1dHpP?=
 =?utf-8?B?QzcxdU1RZFJ3QmN3Z0dUTHJaSnhKaFFaZW1vTy9mMCtlK3kxOTJNQmpKVWtl?=
 =?utf-8?B?bVAzTkxkZ1hmVk9od21UR1VIN25rZm9PZlR2Ryt1L2YwR245b2tyQVJza1NS?=
 =?utf-8?B?NC9WUE0wYU15RlVEWDBPTFREZ1d0R0tnMS9ISGdMUHRDSFkwc1k1bkdhTmRm?=
 =?utf-8?B?WHByUjVlK3hsL0hwV2ZQc2phVnlqM0s4SlFGS0NCdUV1MUh3VkMxRjRlZG95?=
 =?utf-8?B?Q080VmIvMkIrWmRRc1RlbTN1SjhMZTJYUjdObGNVKzcxK1VHa1lGZzNSaDBs?=
 =?utf-8?B?QVg5UWMyZktENXF1U2QxYzBhVzhySmNTZTBtWlFlaXBhTEtVN1JBZjdleWtJ?=
 =?utf-8?B?dlM4elk2cFdudWNmZmY0djJoV2NNRmJlakZndEdVeTUvU1AyOFRKT1pqUnBs?=
 =?utf-8?B?aUkrdmZzd0g2bURGaU1xaWNUTUtFTmJ6L0E4bStRU2VFRU0wK2JVNFB0ZDNX?=
 =?utf-8?B?K2w4OUdRUHljeUJyWGlVZyt5YmJkVVVJY0tsRVZheUN3dzB2dVBSZ3hrVXFR?=
 =?utf-8?B?U2o0b2gwNVN6L2J2NkgraXYwS1lMakpIdHVEM1hObmF1THp3UmFMZjhXQ0dq?=
 =?utf-8?B?ZjFKT2htcGhqWFB6WmdFcm15THgwWHdwbFNFcjlhZDdLQmVUVHJhUjVFRmJv?=
 =?utf-8?B?Tnpjdk9xaGVoL1VCY1psbXhtOFBzUmZiUGtIejBOSFpRcWo4SXlISFU5N1R5?=
 =?utf-8?B?dUUxOERqMnZWOU9zaFg0Unk1RHFZbGZjOEpaN205Z2hSR3A3VFljWGlSM2VR?=
 =?utf-8?B?bmtnTUQ0L1M0OUhZYjFZMGpMY21ta2xsd1VIZ1JOa3JaTXM2b2NRalpaNGJt?=
 =?utf-8?B?SlpHRXQ5bnVlSWJmcURLbFkvMXNQd1dSYzQ1UTBOUHkycytlb3VxRnJjSi9X?=
 =?utf-8?B?eFZtY0UxUVFuOGJXeGpDNG9UNDVWT3Y4NmNuZVhxZWd2bTBYV1lyWkEzSkMx?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a8871d-6fdd-4343-3a41-08dd1f22b2a0
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 05:13:24.5115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dpUPbB9dQjfOp6gcmCoSWLv+MlsfwMFyrmjroA5mAMFvIGPWQ3402NgFmr3gsrhCs9JbAj0aaHdhT1rtOnbaWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_211329_329968_F7E16D21 
X-CRM114-Status: GOOD (  21.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDE4LTEyLTIwMjQgMDQ6MTksIFJvZHJpZ28gVml2aSB3cm90ZToKPiBPbiBUdWUsIE5vdiAx
OSwgMjAyNCBhdCAwNDowMTowOFBNICswMjAwLCBBbGV4YW5kZXIgVXN5c2tpbiB3cm90ZToKPj4g
RW5hYmxlIHJ1bnRpbWUgUE0gaW4gbXRkIGRyaXZlciB0byBub3RpZnkgZ3JhcGhpY3MgZHJpdmVy
IHRoYXQKPj4gd2hvbGUgY2FyZCBzaG91bGQgYmUga2VwdCBhd2FrZSB3aGlsZSBudm0gb3BlcmF0
aW9ucyBhcmUKPj4gcGVyZm9ybWVkIHRocm91Z2ggdGhpcyBkcml2ZXIuCj4+Cj4+IENDOiBMdWNh
cyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KPj4gQWNrZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+Cj4+IC0tLQo+PiAg
IGRyaXZlcnMvbXRkL2RldmljZXMvbXRkLWludGVsLWRnLmMgfCA3MCArKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL210ZC1p
bnRlbC1kZy5jIGIvZHJpdmVycy9tdGQvZGV2aWNlcy9tdGQtaW50ZWwtZGcuYwo+PiBpbmRleCAy
MzBiZjQ0NGI3ZmUuLjlkZDIzYjExZWU5NSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2
aWNlcy9tdGQtaW50ZWwtZGcuYwo+PiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL210ZC1pbnRl
bC1kZy5jCj4+IEBAIC0xNSwxMSArMTUsMTQgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4KPj4gICAjaW5jbHVkZSA8bGludXgv
bXRkL3BhcnRpdGlvbnMuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Cj4+ICAg
I2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4+
ICAgI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+
Cj4+ICAgCj4+ICsjZGVmaW5lIElOVEVMX0RHX05WTV9SUE1fVElNRU9VVCA1MDAKPj4gKwo+PiAg
IHN0cnVjdCBpbnRlbF9kZ19udm0gewo+PiAgIAlzdHJ1Y3Qga3JlZiByZWZjbnQ7Cj4+ICAgCXN0
cnVjdCBtdGRfaW5mbyBtdGQ7Cj4+IEBAIC00NjAsNiArNDYzLDcgQEAgc3RhdGljIGludCBpbnRl
bF9kZ19tdGRfZXJhc2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvICpp
bmZvKQo+PiAgIAlsb2ZmX3QgZnJvbTsKPj4gICAJc2l6ZV90IGxlbjsKPj4gICAJc2l6ZV90IHRv
dGFsX2xlbjsKPj4gKwlpbnQgcmV0ID0gMDsKPj4gICAKPj4gICAJaWYgKFdBUk5fT04oIW52bSkp
Cj4+ICAgCQlyZXR1cm4gLUVJTlZBTDsKPj4gQEAgLTQ3NCwyMCArNDc4LDI4IEBAIHN0YXRpYyBp
bnQgaW50ZWxfZGdfbXRkX2VyYXNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgZXJhc2Vf
aW5mbyAqaW5mbykKPj4gICAJdG90YWxfbGVuID0gaW5mby0+bGVuOwo+PiAgIAlhZGRyID0gaW5m
by0+YWRkcjsKPj4gICAKPj4gKwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KG10ZC0+
ZGV2LnBhcmVudCk7Cj4gb24gdGhpcywgSSByZWFsbHkgZG9uJ3QgYmVsaWV2ZSB0aGlzIGlzIHJp
Z2h0IGFuZCB3ZSBzaG91bGQgdXNlCj4gdGhlIHBhcmVudCBjaGlsZCByZWxhdGlvbiBzaGlwIGlu
IG91ciBmYXZvciBhbmQgb25seSBoYXZlIHRoZSBtdGQKPiBkZXZpY2UgdG8gaGFuZGxlIHRoZWly
IG93biBydW50aW1lIHBtLi4uCkkgY29uY3VyIHdpdGggUm9kcmlnby4gSWYgdGhlIHBhcmVudC1j
aGlsZCByZWxhdGlvbnNoaXAgaXMgcHJlc2VydmVkLCAKdGhlIHBhcmVudCB3aWxsIHJlc3VtZSBi
ZWZvcmUgdGhlIGNoaWxkLCBlbGltaW5hdGluZyB0aGUgbmVlZCB0byAKZXhwbGljaXRseSB3YWtl
IHRoZSBwYXJlbnQuClBsZWFzZSByZWZlciB0byBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2
ZXItYXBpL3BtL2RldmljZXMuaHRtbAoKVGhlIG9yZGVyaW5nIG9mIHRoZSBkZXZpY2UgaGllcmFy
Y2h5IGlzIGRlZmluZWQgYnkgdGhlIG9yZGVyIGluIHdoaWNoIApkZXZpY2VzIGdldCByZWdpc3Rl
cmVkOgoiYSBjaGlsZCBjYW4gbmV2ZXIgYmUgcmVnaXN0ZXJlZCwgcHJvYmVkIG9yCnJlc3VtZWQg
YmVmb3JlIGl0cyBwYXJlbnQ7ICIKYW5kIGNhbuKAmXQgYmUgcmVtb3ZlZCBvciBzdXNwZW5kZWQg
YWZ0ZXIgdGhhdCBwYXJlbnQuCj4KPj4gKwlpZiAocmV0IDwgMCkgewo+PiArCQlkZXZfZXJyKCZt
dGQtPmRldiwgInJwbTogZ2V0IGZhaWxlZCAlZFxuIiwgcmV0KTsKPj4gKwkJcmV0dXJuIHJldDsK
Pj4gKwl9Cj4+ICsKPj4gICAJZ3VhcmQobXV0ZXgpKCZudm0tPmxvY2spOwo+PiAgIAo+PiAgIAl3
aGlsZSAodG90YWxfbGVuID4gMCkgewo+PiAgIAkJaWYgKCFJU19BTElHTkVEKGFkZHIsIFNaXzRL
KSB8fCAhSVNfQUxJR05FRCh0b3RhbF9sZW4sIFNaXzRLKSkgewo+PiAgIAkJCWRldl9lcnIoJm10
ZC0+ZGV2LCAidW5hbGlnbmVkIGVyYXNlICVsbHggJXp4XG4iLCBhZGRyLCB0b3RhbF9sZW4pOwo+
PiAgIAkJCWluZm8tPmZhaWxfYWRkciA9IGFkZHI7Cj4+IC0JCQlyZXR1cm4gLUVSQU5HRTsKPj4g
KwkJCXJldCA9IC1FUkFOR0U7Cj4+ICsJCQlnb3RvIG91dDsKPj4gICAJCX0KPj4gICAKPj4gICAJ
CWlkeCA9IGlkZ19udm1fZ2V0X3JlZ2lvbihudm0sIGFkZHIpOwo+PiAgIAkJaWYgKGlkeCA+PSBu
dm0tPm5yZWdpb25zKSB7Cj4+ICAgCQkJZGV2X2VycigmbXRkLT5kZXYsICJvdXQgb2YgcmFuZ2Ui
KTsKPj4gICAJCQlpbmZvLT5mYWlsX2FkZHIgPSBNVERfRkFJTF9BRERSX1VOS05PV047Cj4+IC0J
CQlyZXR1cm4gLUVSQU5HRTsKPj4gKwkJCXJldCA9IC1FUkFOR0U7Cj4+ICsJCQlnb3RvIG91dDsK
Pj4gICAJCX0KPj4gICAKPj4gICAJCWZyb20gPSBhZGRyIC0gbnZtLT5yZWdpb25zW2lkeF0ub2Zm
c2V0Owo+PiBAQCAtNTAzLDE0ICs1MTUsMTggQEAgc3RhdGljIGludCBpbnRlbF9kZ19tdGRfZXJh
c2Uoc3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvICppbmZvKQo+PiAgIAkJ
aWYgKGJ5dGVzIDwgMCkgewo+PiAgIAkJCWRldl9kYmcoJm10ZC0+ZGV2LCAiZXJhc2UgZmFpbGVk
IHdpdGggJXpkXG4iLCBieXRlcyk7Cj4+ICAgCQkJaW5mby0+ZmFpbF9hZGRyICs9IG52bS0+cmVn
aW9uc1tpZHhdLm9mZnNldDsKPj4gLQkJCXJldHVybiBieXRlczsKPj4gKwkJCXJldCA9IGJ5dGVz
Owo+PiArCQkJZ290byBvdXQ7Cj4+ICAgCQl9Cj4+ICAgCj4+ICAgCQlhZGRyICs9IGxlbjsKPj4g
ICAJCXRvdGFsX2xlbiAtPSBsZW47Cj4+ICAgCX0KPj4gICAKPj4gLQlyZXR1cm4gMDsKPj4gK291
dDoKPj4gKwlwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KG10ZC0+ZGV2LnBhcmVudCk7Cj4+ICsJ
cG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQobXRkLT5kZXYucGFyZW50KTsKPj4gKwlyZXR1cm4g
cmV0Owo+PiAgIH0KPj4gICAKPj4gICBzdGF0aWMgaW50IGludGVsX2RnX210ZF9yZWFkKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwgc2l6ZV90IGxlbiwKPj4gQEAgLTUzOSwxNyAr
NTU1LDI1IEBAIHN0YXRpYyBpbnQgaW50ZWxfZGdfbXRkX3JlYWQoc3RydWN0IG10ZF9pbmZvICpt
dGQsIGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuLAo+PiAgIAlpZiAobGVuID4gbnZtLT5yZWdpb25z
W2lkeF0uc2l6ZSAtIGZyb20pCj4+ICAgCQlsZW4gPSBudm0tPnJlZ2lvbnNbaWR4XS5zaXplIC0g
ZnJvbTsKPj4gICAKPj4gKwlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KG10ZC0+ZGV2
LnBhcmVudCk7Cj4+ICsJaWYgKHJldCA8IDApIHsKPj4gKwkJZGV2X2VycigmbXRkLT5kZXYsICJy
cG06IGdldCBmYWlsZWQgJXpkXG4iLCByZXQpOwo+PiArCQlyZXR1cm4gcmV0Owo+PiArCX0KPj4g
Kwo+PiAgIAlndWFyZChtdXRleCkoJm52bS0+bG9jayk7Cj4+ICAgCj4+ICAgCXJldCA9IGlkZ19y
ZWFkKG52bSwgcmVnaW9uLCBmcm9tLCBsZW4sIGJ1Zik7Cj4+ICAgCWlmIChyZXQgPCAwKSB7Cj4+
ICAgCQlkZXZfZGJnKCZtdGQtPmRldiwgInJlYWQgZmFpbGVkIHdpdGggJXpkXG4iLCByZXQpOwo+
PiAtCQlyZXR1cm4gcmV0Owo+PiArCX0gZWxzZSB7Cj4+ICsJCSpyZXRsZW4gPSByZXQ7Cj4+ICsJ
CXJldCA9IDA7Cj4+ICAgCX0KPj4gICAKPj4gLQkqcmV0bGVuID0gcmV0Owo+PiAtCj4+IC0JcmV0
dXJuIDA7Cj4+ICsJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShtdGQtPmRldi5wYXJlbnQpOwo+
PiArCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKG10ZC0+ZGV2LnBhcmVudCk7Cj4+ICsJcmV0
dXJuIHJldDsKPj4gICB9Cj4+ICAgCj4+ICAgc3RhdGljIGludCBpbnRlbF9kZ19tdGRfd3JpdGUo
c3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90IGxlbiwKPj4gQEAgLTU3OCwx
NyArNjAyLDI1IEBAIHN0YXRpYyBpbnQgaW50ZWxfZGdfbXRkX3dyaXRlKHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sCj4+ICAgCWlmIChsZW4gPiBudm0tPnJlZ2lv
bnNbaWR4XS5zaXplIC0gdG8pCj4+ICAgCQlsZW4gPSBudm0tPnJlZ2lvbnNbaWR4XS5zaXplIC0g
dG87Cj4+ICAgCj4+ICsJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChtdGQtPmRldi5w
YXJlbnQpOwo+PiArCWlmIChyZXQgPCAwKSB7Cj4+ICsJCWRldl9lcnIoJm10ZC0+ZGV2LCAicnBt
OiBnZXQgZmFpbGVkICV6ZFxuIiwgcmV0KTsKPj4gKwkJcmV0dXJuIHJldDsKPj4gKwl9Cj4+ICsK
Pj4gICAJZ3VhcmQobXV0ZXgpKCZudm0tPmxvY2spOwo+PiAgIAo+PiAgIAlyZXQgPSBpZGdfd3Jp
dGUobnZtLCByZWdpb24sIHRvLCBsZW4sIGJ1Zik7Cj4+ICAgCWlmIChyZXQgPCAwKSB7Cj4+ICAg
CQlkZXZfZGJnKCZtdGQtPmRldiwgIndyaXRlIGZhaWxlZCB3aXRoICV6ZFxuIiwgcmV0KTsKPj4g
LQkJcmV0dXJuIHJldDsKPj4gKwl9IGVsc2Ugewo+PiArCQkqcmV0bGVuID0gcmV0Owo+PiArCQly
ZXQgPSAwOwo+PiAgIAl9Cj4+ICAgCj4+IC0JKnJldGxlbiA9IHJldDsKPj4gLQo+PiAtCXJldHVy
biAwOwo+PiArCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kobXRkLT5kZXYucGFyZW50KTsKPj4g
KwlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChtdGQtPmRldi5wYXJlbnQpOwo+PiArCXJldHVy
biByZXQ7Cj4+ICAgfQo+PiAgIAo+PiAgIHN0YXRpYyB2b2lkIGludGVsX2RnX252bV9yZWxlYXNl
KHN0cnVjdCBrcmVmICprcmVmKQo+PiBAQCAtNzIwLDYgKzc1MiwxNyBAQCBzdGF0aWMgaW50IGlu
dGVsX2RnX210ZF9wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldiwKPj4gICAJ
CW4rKzsKPj4gICAJfQo+PiAgIAo+PiArCWRldm1fcG1fcnVudGltZV9lbmFibGUoZGV2aWNlKTsK
Pj4gKwo+PiArCXBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KGRldmljZSwgSU5URUxf
REdfTlZNX1JQTV9USU1FT1VUKTsKPj4gKwlwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZChkZXZp
Y2UpOwo+PiArCj4+ICsJcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChkZXZpY2UpOwo+
PiArCWlmIChyZXQgPCAwKSB7Cj4+ICsJCWRldl9lcnIoZGV2aWNlLCAicnBtOiBnZXQgZmFpbGVk
ICVkXG4iLCByZXQpOwo+PiArCQlnb3RvIGVycl9ub3JwbTsKPj4gKwl9Cj4+ICsKPj4gICAJbnZt
LT5iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNlKGRldmljZSwgJmludm0tPmJhcik7Cj4+ICAg
CWlmIChJU19FUlIobnZtLT5iYXNlKSkgewo+PiAgIAkJZGV2X2VycihkZXZpY2UsICJtbWlvIG5v
dCBtYXBwZWRcbiIpOwo+PiBAQCAtNzQyLDkgKzc4NSwxMiBAQCBzdGF0aWMgaW50IGludGVsX2Rn
X210ZF9wcm9iZShzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZSAqYXV4X2RldiwKPj4gICAKPj4gICAJ
ZGV2X3NldF9kcnZkYXRhKCZhdXhfZGV2LT5kZXYsIG52bSk7Cj4+ICAgCj4+ICsJcG1fcnVudGlt
ZV9wdXQoZGV2aWNlKTsKPj4gICAJcmV0dXJuIDA7Cj4+ICAgCj4+ICAgZXJyOgo+PiArCXBtX3J1
bnRpbWVfcHV0KGRldmljZSk7Cj4+ICtlcnJfbm9ycG06Cj4+ICAgCWtyZWZfcHV0KCZudm0tPnJl
ZmNudCwgaW50ZWxfZGdfbnZtX3JlbGVhc2UpOwo+PiAgIAlyZXR1cm4gcmV0Owo+PiAgIH0KPj4g
LS0gCj4+IDIuNDMuMAo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
