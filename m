Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AE4C2D0CD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 11:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgqyPa8xMoYRr6LGBuvQYpclseeUhFfR4KXl7Iv/5gQ=; b=X1SQk9743B3CiE
	HxY+evZkkycm1BAh1ln4cPARjC0WV3a5PVDxA2aUeB/10zq2ZJF95yP9yTPtizSm80KOnMYpg9Zpp
	Ok+Q3ojGL0EAZpopT896L0nQ+vRXuvvHR/mby/+1lbvyjix3s2zenvdDbo1ykwjO0pO0JCNDm4hwt
	Jc16n9CC1o6Uv4utF66qRhHUqK7DaQfceZOUytJlEUE/eIxFBqDu4cYgZpalXz6K87aK4dJuucR/I
	fQkky+++mhE4hbdVM4gLmzy2hMsoc2WNmgLUooIe2i9a4CJ4a/aQQ35BIRk+hS8mKFq98cK3zez9k
	ShTAPOHIWc0s7+dgYBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWhG-00000000OCn-01eJ;
	Thu, 15 May 2025 11:24:18 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWhD-00000000OBi-19GL
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 11:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747308255; x=1778844255;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vp8rkL3bref1Md5E/zCj8pZakFUQyIaZm/uYxGfjzxA=;
  b=jg1rYYavLFBPVBs/XcGL5SeNK0aaJvEN+OaacJ2lHPSeMmwkd6+KeUw2
   mflGdDsulzuSLqoEiFUCuNH1iVomuxf7P+KYJ5I0rrULb6y8ZbNk7SfON
   Nh/T+yVr8qk4QlKvBW39H6w34nLEUzaD1hHjBrGbmrCdvMjtc52G3q5g5
   glue0mB25i458KXqZQhVLBwcp1321hI9m/d8AhKhhuc4pSJ/GgJBgjG9y
   I0+6CJ3Df4jBHs/Ty786o25l+k2LrR3qpZMTti/vdz3Z/LBi1Z5Cxdggx
   Kn8Z3JMa0WAJMcpyWA5WzyzZRS7F2IaGH0JCf/oURfiaGBLmml5qttXAO
   Q==;
X-CSE-ConnectionGUID: T9W4W3I/QESH9p0dSJMMsA==
X-CSE-MsgGUID: pPQmJPXaSXqFa+3NnS1XJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66643631"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="66643631"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:24:10 -0700
X-CSE-ConnectionGUID: cwuSVGtBROeYzpgGjWxirQ==
X-CSE-MsgGUID: YFWYoh2IQuCd58AMksSGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138741572"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 04:24:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 04:24:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 04:24:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 04:24:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kbih6c7ruEZ/lpALtn3YvhjbkWrMqWh1+pqLrVu1uWTTWn21H6LY4VGZPr3FzlRwcWnGPvlCVJdUUCbxspJRHQ7ke5lyCWI7RwCS1wIdVQ2Sw0Sl2AaLQsqbXLI64slm+ZnUiihKHUi7hQPe3q0+egra81X5ZtZlUfFLhwXT323cC1FfKvVWQQYWtT7B44MK2xwAl6N2MZLbK7Mmm+jLkC7zRiWnKAQj9pz/Yq5/uK/oGqBtXyFpHAs4+talCLbHNkVgrLWfBKAHwMLz7Es3OfRSR9uzGPocjM/I6duJaxz9kU1ssNJnafAVSk5ycUThbHq7CmIiTqhBQL4639Hrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vp8rkL3bref1Md5E/zCj8pZakFUQyIaZm/uYxGfjzxA=;
 b=md7oJQs0QTbDQ/A+tP6v3rQcgMWNBKy3TNW/v3Rhi1EsLCicCuSm2XyadCo2rfY3+DOgamZy1IRBgy8xMLO7OQM079xJKimhMGvBE4U9f/07oVZWEOR8KYGaFIsadvQQoqh+wLu2niDfBlpvYMkaktEfa/1oaZsXc52abxrWGwm1z1NDZuQI0qknAowqHTm6TF1KhUw4SWBH4+kAT9owT4wEXW1pobLqJmqR7rFV5yb52ukXUuMLvq9ghmGuUKDFXRpDoFPUq1lZ8KNvssWvhEW0hZg9eEm/w0qRIrthi9OrUp1GzD+mrLhcHiHfDj6SMIJPb+N2B1fxT3JWKs1nPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by LV1PR11MB8843.namprd11.prod.outlook.com (2603:10b6:408:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 11:23:39 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 11:23:38 +0000
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tomas Winkler
	<tomasw@gmail.com>
Subject: RE: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Thread-Topic: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
Thread-Index: AQHbtR4fMekOitQZHke4tW+4RuIcRLO6bEuAgBk0gmA=
Date: Thu, 15 May 2025 11:23:38 +0000
Message-ID: <CY5PR11MB6366AACB5EA494893CA8D16DED90A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250424132536.3043825-1-alexander.usyskin@intel.com>
 <20250424132536.3043825-4-alexander.usyskin@intel.com>
 <aBCfbaYs9CnXL2h1@black.fi.intel.com>
In-Reply-To: <aBCfbaYs9CnXL2h1@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|LV1PR11MB8843:EE_
x-ms-office365-filtering-correlation-id: 8f908714-78a5-4228-e9ac-08dd93a2f05d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TVV2OFFvZzVPVGVRRU50TGNGTGtUOU9Oai85THhDTmRFSCtPR2oyakxIZ3NU?=
 =?utf-8?B?Zkp5ZG9sRE9qVWVwRlgxeHQwaEhKS1U0N1YxTzhsQVdxYndKMEZ1Wm56Zmlo?=
 =?utf-8?B?ME4xTG1qak1IcXlzT01LRGxSa1VLbkgwLzNrUjdNTkJzbDBBd3gvT1h0Vjlr?=
 =?utf-8?B?OGNnWmNIdXpIcG5VeEoydk0ycm1NcjBDL3JnWjZYWHBBRzNtYWU4ZEJrZW91?=
 =?utf-8?B?bzE5Zk1yN2VvSlExcjdEQWxxNFd2WGJlbzNyYXdzRzd0bExPN2ZHSVYzUFFU?=
 =?utf-8?B?YXl5QWdaYmZoSUNIbklsVzl4UDU1eFhxUmhrOU8vMUIxQ1FPT1l6aUV3ZGJh?=
 =?utf-8?B?R2J4MnBHdS9MMGlhL0tCNHVJMnhocmd2bXVWYkhZOUhiVXNSVEkwaDN4dTVw?=
 =?utf-8?B?eGhmKzA4UDIxU2JIbWhGVWxPTnJZb1FTbnRzeDNHbU5TSGhPclBNQUtUQWU3?=
 =?utf-8?B?UXEzSHM3Z1lKWTNEQlFYQXhRcWQwY2tmdzEwSlhISFFZMkNHbVRjd1hZWUlN?=
 =?utf-8?B?UkxLRTFNZTNiVVp0Z1hCZldwNmpHVnc3UW00VEdsanY3aGNQd2dnK2paNHN3?=
 =?utf-8?B?OFB2b2JvUlVtN01Xc2dHRFlJK2VpSVdiY3JVYlZ4S0JUMStPL3lnNEFYK2lI?=
 =?utf-8?B?VC9HWEdMamZ4VHQwVXN5aDAvN1Z1NkFIcklHTy9GNWxBWGpUR3ZUMXFmaVI1?=
 =?utf-8?B?MUROM2NzOERzaGNHNkIyb3JVS0VTaHNwbEg4UDM3RVZvQ3k5SmhuYUhmUkhF?=
 =?utf-8?B?MERPMHZhRzVTUmU4U0RzeXhMdGI3bVAwTnJyZ0V2SHN2QlUyTUYrSFZWZUZC?=
 =?utf-8?B?b0lBZ21oL3J2NFBqZ0pyTkdGelpsKzNLTEpGTGpWb3NsWU5nWSsxdFJ0UVZk?=
 =?utf-8?B?NXIxa0YwOStQY3Y3ZmoxL3laRE5acElrS2lHS1lPWDBrakJ3VmxsZk1CQXBj?=
 =?utf-8?B?VFIzV0tnNzdscGIvMHA1Qk9VTktQZnVVQmU3dTRNU1dYcUNWYVUxcFRid3JE?=
 =?utf-8?B?Vi9jblBERW1uYzV0Yjc1VG54R1R3eXpMQktseXpiNGlEUG1UbGVENnVDRTdM?=
 =?utf-8?B?N01DWHNTTmlpdTUwSFVBMjNDQ0lwS00xdzArdXFqVXNTU1QvdlAvZENFYUdp?=
 =?utf-8?B?Zk1NaGZ6M3JxOGJCUDRTNmsxVzZmZW4xbTkvNTRwdXNaMjJBcGU3b0ZKYXJx?=
 =?utf-8?B?dVhCTWhmZlRndWFRRWcrU0xrNHRna2RpWjl2Ykh4NzVwSzgvR2FWWXJFaGFH?=
 =?utf-8?B?aUNCRy93ekQ4dDdOZ0RzaHlZL2dmMUxpcU9zZ3BoVDl2OXlCaUVKMjhaajg0?=
 =?utf-8?B?REpjRlMrZ0s3UHdqeDIwL3prRDNVaWNsSS8zbTZiT0dCOWd5dEdxc2tzTjVX?=
 =?utf-8?B?TmxRZGZFNVZ3QzdzbzhVVlVVL3VhT2Y3M3ExTDRlUGVqN0NSUDhUSjRpZVZ2?=
 =?utf-8?B?ZW5TQUZvNXRVdWd0bFVRYUg1YUl1czJ0ZE1jNm9SYllqaFJBK05QNlArVzJV?=
 =?utf-8?B?b21weTkxSU9sdG91UzExRUlZVE5VY1FGSldBKzdnTldPbEs3d2tKc0ovNTJx?=
 =?utf-8?B?QVEyWG9HelpMTm85eExCd2t0VjFCL2xJTmkzeW9RRTdBM1RGVGpCWnk4K2JZ?=
 =?utf-8?B?UGlKbEl5Ny9lQmsyTnFSWjJXeERXSE8wc214SGkzN0p0K2p5NTQwMVZobm9Y?=
 =?utf-8?B?V21UMGJOd2FQUkswcmNSdHV2K0tMSzEwTVR3ZmNzRHkrMnFaR2dMaWhsZDZn?=
 =?utf-8?B?YnB3MWZxeDAwNXpTZ0kvdlFuc2lxbFhiNEl3SC9FTjFEdFZiMXBPMHhkNDhM?=
 =?utf-8?B?elZHK0wyWWplNzdjdVRKd0VzNHZnK28rSGZYeUUvZGM3QlFkSHZXTGFYZXJ4?=
 =?utf-8?B?dFREVFBBcFhzdkl5VHRrZ0EvUGRWQ3hoUHMwRUQ1U2R1d0pkRUwrUk9SUWpt?=
 =?utf-8?B?V2cwQVZ3VUJWb3NuYzNobDRNK2s1UU5haEJHdmdSd2o4L0xXczFIWFBoOHZC?=
 =?utf-8?Q?yRlMUNDzg0+k3xE9vi63R0deBGzZqU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXVJYWF0bDJkTE0wbjI2eFRWL1ZFQ1BzUytuRldaSm1zTFpkMTJHNXRCUWlF?=
 =?utf-8?B?eWZIczJvSjVNR0c3L0pzQWMrRzdxTFNZWHczNnJQY2ZhV3ZPTzhNcXVmWTJJ?=
 =?utf-8?B?Ui9pS0xJdnNWZTQzNUszR1pmSE1tSUlSTmhiV2hFcVpSWnEvanhwbDM1T0ZL?=
 =?utf-8?B?NDE1YUd1M1Zmb2s5K2pBazdHM0JLS3FDby9HS2ExdlVpR0EwVWs4clloOFJo?=
 =?utf-8?B?a0xYQ1pvbC9xcjZNYVVUOGpCMlRoZEdFdlRvSkpVZzVXeW1Gc3A1MnhWVmFx?=
 =?utf-8?B?ODEzK2lFTFFuQ05EcHpnYWNTNDhhWTlRYW9tT3VWQkZmMlkraXNxOHplbE5p?=
 =?utf-8?B?ZmFGVGVoTXp0elJWNjArRDY3aUROOVgvQnJITlB1V3FsMW5SMWgzWVBGcVRL?=
 =?utf-8?B?Sk02TGZwVzZqSEV3UzAzZWx1Z1laRFBERmVwcGlPZGJFeklFOVRkNWZkZ2ps?=
 =?utf-8?B?MmVsV2w2SXNrRDdsc0paTFNnTmNkNkNreUd4aG02R2t5eENVekRNSCtmZm1a?=
 =?utf-8?B?eHliRGZLTkg4UGI0cU16dTZETy9VUUJDNVh1RE1yRUEvZlZDMEYvWHIzNTI4?=
 =?utf-8?B?dXhEQUFkNndPYVJ1M1hhZ2ZUdVBUWjlGczdMMXgrOXI5VUtRdDJWRkh5V1Uw?=
 =?utf-8?B?cUJaWmtCMnhQbVNoMnd3KzhlTDlGSHdzZjlVZHlodEFWakUxbmRrenk1SzRm?=
 =?utf-8?B?RjJsUlZ1OE1Fb2JnQ1FwdlBMcHJSRHF2S3B2V0gwbUJKcW15dEhPaDEzOVJt?=
 =?utf-8?B?QjNoNUN5RHJoTm10ZEVxNXVSVU9HdDJYY1Via25WUjI0aW5wVFlFTHpKQzli?=
 =?utf-8?B?cHNiSE1iT0RCNUVKZFRRS09pWXdvRm9EOVU4QmI2V21PWmR1MDJmLzFGd3ZT?=
 =?utf-8?B?UG5WNFFkREg2N2RncUdJZUcrVU93L3FibGdReDFOYmFmZG00WUVUZGxmQmhv?=
 =?utf-8?B?dzJrT01WL2tiY3EzbmhQQS9EVmdvTWpvWTAvS1l6YXZSMENzelN2QTJKcmJG?=
 =?utf-8?B?R2VXOFVaZDgyREZBRXN5MVA3c3I2czFNVEhsbnZIT1I3YzFjck1BdG1hWnZE?=
 =?utf-8?B?ZW82NHlPVXdzSmY5Q1RXaVpET1dyeEdEZmMrbkNyN1F3a0VkMDZNMlJDeGF5?=
 =?utf-8?B?eDVXTWtGZy9Hc1hEOTgzMnRLeU5jcjBJc1RHOFdlT2NxbXBvSWRGS3laZXVY?=
 =?utf-8?B?T1BLN1ZaNEswRDh2eFBXc09OdlNScStwWHFOYzhhRlZqZnM2U1VFVlZYRitn?=
 =?utf-8?B?SmFlWkFGQks2cURPSDNVUVUybjV4Skg0eldzblBHc1Z1Z3VHNDFieXdpejRt?=
 =?utf-8?B?WTAwNnhZdjNRYnk1VkpEY0ltVytWTUc0THo4S2RnT2p4Qjg3R0ZwamtSQUpI?=
 =?utf-8?B?YzlKRENGWldRZ0pObmhPTGV6UEFKblluY1poaTI4RjNZR2xSZVVvWll1Vk1k?=
 =?utf-8?B?S1dDWWpzQ0lBUTdYZW1idThNa2RjOFQrcnR2UlE0RC8yRXRUT2plZjV6Mkhp?=
 =?utf-8?B?cHFOQ0YvUU5aT1ZRU2VKZlcwdUYxcDBWYjNobFZUaEY5eFg5bUZ0dVk4MTYw?=
 =?utf-8?B?THQ1STVJenVEMXdsVERxbUJMM281eUlrWGtpbzQycGJXV05DU254SjBtNG1h?=
 =?utf-8?B?RnRsWDdmL0U0c0FxTG05S3NEdjNlMEl2bEhYZzBPdS9NQ2hIamY5dDg4bmV0?=
 =?utf-8?B?YTVxSm5mL250bmU0WTJZclozN0VuTUhqTi9IcnJYdnVrZ3RsbWpmRVJJSVJM?=
 =?utf-8?B?eGYxa0NxRWhSNDVONG9KSVpzUGRJU0JVN2xlSGFEU3pySnl0R0l4QVlFQ0hw?=
 =?utf-8?B?SVNPTnlTTW9UTE1TcklQUlg4Zm0rN2RaLy9IU1IrdFcrS2ZvR0k2OHhSVC8x?=
 =?utf-8?B?a09RdzVmcm12ajdjK3hkeEZPRE5CQXE4VnRaQ3Y3WU1uaHJqWmtRSzdrUldB?=
 =?utf-8?B?Y0JPTGNhbUQzUXlVYlQ3SXJqS2c4cmREbmZaYldCMEpvYUM1bjF6aGs2Mllz?=
 =?utf-8?B?N0dGcWx5NkwvbTM3bW1USlYwcE5SVGJWbjExYjdyVkZ4a3R3Sk9JRnphaVhy?=
 =?utf-8?B?SDVCVjBvQi8zWG1PUzRJWTN4NEhTT2VqQURLK3hUYnVybHRDbXR4VFNrMHVG?=
 =?utf-8?Q?fgEWBzEkcrCLPfgJ5/Fqk8AvM?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f908714-78a5-4228-e9ac-08dd93a2f05d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 11:23:38.2663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAB93PqItBabeXiIwh1/wYrRHL0EWxly+vXU/eQK6bvyqWTQNEjh5J53/ofCzgLD4YpEbiEnQcdCjk5LaKOZKGBL5y6DM7cZwkQgozGtqpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8843
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_042415_387055_D171DB70 
X-CRM114-Status: GOOD (  16.28  )
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

> Subject: Re: [PATCH v9 03/12] mtd: intel-dg: implement region enumeration
> 
> On Thu, Apr 24, 2025 at 04:25:27PM +0300, Alexander Usyskin wrote:
> > In intel-dg, there is no access to the spi controller,
> > the information is extracted from the descriptor region.
> 
> ...
> 
> > @@ -22,9 +24,199 @@ struct intel_dg_nvm {
> >  		u8 id;
> >  		u64 offset;
> >  		u64 size;
> > +		unsigned int is_readable:1;
> > +		unsigned int is_writable:1;
> >  	} regions[] __counted_by(nregions);
> >  };
> >
> > +#define NVM_TRIGGER_REG       0x00000000
> > +#define NVM_VALSIG_REG        0x00000010
> > +#define NVM_ADDRESS_REG       0x00000040
> > +#define NVM_REGION_ID_REG     0x00000044
> > +/*
> > + * [15:0]-Erase size = 0x0010 4K 0x0080 32K 0x0100 64K
> > + * [23:16]-Reserved
> > + * [31:24]-Erase MEM RegionID
> > + */
> > +#define NVM_ERASE_REG         0x00000048
> > +#define NVM_ACCESS_ERROR_REG  0x00000070
> > +#define NVM_ADDRESS_ERROR_REG 0x00000074
> > +
> > +/* Flash Valid Signature */
> > +#define NVM_FLVALSIG          0x0FF0A55A
> > +
> > +#define NVM_MAP_ADDR_MASK     GENMASK(7, 0)
> > +#define NVM_MAP_ADDR_SHIFT    0x00000004
> > +
> > +#define NVM_REGION_ID_DESCRIPTOR  0
> > +/* Flash Region Base Address */
> > +#define NVM_FRBA      0x40
> > +/* Flash Region __n - Flash Descriptor Record */
> > +#define NVM_FLREG(__n) (NVM_FRBA + ((__n) * 4))
> > +/*  Flash Map 1 Register */
> > +#define NVM_FLMAP1_REG  0x18
> > +#define NVM_FLMSTR4_OFFSET 0x00C
> > +
> > +#define NVM_ACCESS_ERROR_PCIE_MASK 0x7
> > +
> > +#define NVM_FREG_BASE_MASK GENMASK(15, 0)
> > +#define NVM_FREG_ADDR_MASK GENMASK(31, 16)
> > +#define NVM_FREG_ADDR_SHIFT 12
> > +#define NVM_FREG_MIN_REGION_SIZE 0xFFF
> 
> Should we move these to a header?
They are used only in this file, not shared to anyone, why to put in header?

> 
> > +static inline void idg_nvm_set_region_id(struct intel_dg_nvm *nvm, u8
> region)
> > +{
> > +	iowrite32((u32)region, nvm->base + NVM_REGION_ID_REG);
> > +}
> > +
> > +static inline u32 idg_nvm_error(struct intel_dg_nvm *nvm)
> > +{
> > +	void __iomem *base = nvm->base;
> > +
> > +	u32 reg = ioread32(base + NVM_ACCESS_ERROR_REG) &
> NVM_ACCESS_ERROR_PCIE_MASK;
> > +
> > +	/* reset error bits */
> > +	if (reg)
> > +		iowrite32(reg, base + NVM_ACCESS_ERROR_REG);
> > +
> > +	return reg;
> > +}
> > +
> > +static inline u32 idg_nvm_read32(struct intel_dg_nvm *nvm, u32 address)
> > +{
> > +	void __iomem *base = nvm->base;
> > +
> > +	iowrite32(address, base + NVM_ADDRESS_REG);
> > +
> > +	return ioread32(base + NVM_TRIGGER_REG);
> > +}
> > +
> > +static int idg_nvm_get_access_map(struct intel_dg_nvm *nvm, u32
> *access_map)
> > +{
> > +	u32 flmap1;
> > +	u32 fmba;
> > +	u32 fmstr4;
> > +	u32 fmstr4_addr;
> 
> Nit: These are in order of appearance vs reverse xmas tree in other places.
> Perhaps make them consistent?
Will do

> 
> > +	idg_nvm_set_region_id(nvm, NVM_REGION_ID_DESCRIPTOR);
> > +
> > +	flmap1 = idg_nvm_read32(nvm, NVM_FLMAP1_REG);
> > +	if (idg_nvm_error(nvm))
> > +		return -EIO;
> > +	/* Get Flash Master Baser Address (FMBA) */
> > +	fmba = (FIELD_GET(NVM_MAP_ADDR_MASK, flmap1) <<
> NVM_MAP_ADDR_SHIFT);
> > +	fmstr4_addr = fmba + NVM_FLMSTR4_OFFSET;
> > +
> > +	fmstr4 = idg_nvm_read32(nvm, fmstr4_addr);
> > +	if (idg_nvm_error(nvm))
> > +		return -EIO;
> > +
> > +	*access_map = fmstr4;
> > +	return 0;
> > +}
> > +
> > +static bool idg_nvm_region_readable(u32 access_map, u8 region)
> > +{
> > +	if (region < 12)
> 
> Anything special about 12? Should it have a macro def somewhere?
> 

The access bits are separated for first 12 regions and last 4.
My feeling that making below numbers #define will make
code less readable.

> > +		return access_map & BIT(region + 8); /* [19:8] */
> > +	else
> > +		return access_map & BIT(region - 12); /* [3:0] */
> > +}
> > +
> > +static bool idg_nvm_region_writable(u32 access_map, u8 region)
> > +{
> > +	if (region < 12)
> 
> Ditto.
> 
> > +		return access_map & BIT(region + 20); /* [31:20] */
> > +	else
> > +		return access_map & BIT(region - 8); /* [7:4] */
> > +}
> 
> Raag

- - 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
