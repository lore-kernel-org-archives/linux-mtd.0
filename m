Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE28CC54E65
	for <linux-mtd@archiver.kernel.org>; Thu, 22 May 2025 12:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prg18V7YEXe+pygstMW/suakNNfGcWp0wdXfe3Rpct4=; b=rwxyBindD4ZKzL
	dtJTIJyF+Z/nLYJsMzLxXYpl0IGNf/1Y/HTvNPzymn6VOPOADR7erPqIgIEMI+vOJEohd8IJ8ujNB
	USyTcDAaKcnGrK7tOPuWpfnC76qq/ciHn1PQECAZjcN3AyWFMBD3/BWhpOpGdE2K3dLKQPg3nwl/A
	oY7gZbIFStrsewadKS4RkUJ4NiQWXqxHs6g08fUc65xzpl6YU9inKqunOqXybKHa33vLLXhoQP3aW
	e+QOcEaiatk4KVZxyLSzL2rsM6QfD9FNjG7bZTtOXQy5kIpdXS0v7gN1JZvlQ+emCS5N9t0IMm56t
	1MBVmlLKoGg41hSCeA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4p9-00000000yBE-3wAI;
	Thu, 22 May 2025 12:14:59 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI4p7-00000000yAq-251I
	for linux-mtd@lists.infradead.org;
	Thu, 22 May 2025 12:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747916097; x=1779452097;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VJdFxrr9sYKfTcoBhNqyTKAXzWNtIEBELyVJr6CDLgs=;
  b=fIf5ZEwVR43ZGZWW0L1+fGyfcmApSBLqmc3SLDZ6VPYccagZOz0WEFdn
   oyhaT+sYUb6qGaxhBnnKiHNnac0KOj+QRds7DiXc2jX3DJiOu0Op4yhX7
   eW6kAAFZycj9O1F6FvHeOPTKsi8es4QMwtBlD2eu74r4PeB7jU+EUrDoF
   +zqc1C40T0ZQm0ITG0dN4RaGi4vvS5pHWKxb3T+rD820JHHgOZ/0euLJ2
   ag4n6Zi7dYrVpvVK7rLg9ryqI28jqNx+vJRa1ia/hN2oPupK0lRV76O9r
   no8YsjFx0Hlx8KmT5hfZO07n865PRab7ChdOe3IzPPBcDsiFWzIb9WGEG
   Q==;
X-CSE-ConnectionGUID: 72knxahLTBmpFqNOsoqk5g==
X-CSE-MsgGUID: qY5WVW7sTPOIBtlO0TB2ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50079515"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="50079515"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 05:14:55 -0700
X-CSE-ConnectionGUID: WY2Y5l3CSHizKDYmrjBeXA==
X-CSE-MsgGUID: nBNeyuPaRwubV4GbVxg6wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="163840077"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 05:14:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 05:14:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 05:14:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 05:14:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJF8kh1BBC5mctfQFEKBTuDBX+acM/CccHga96rR6YQAZgruDiTyMPpLLgqj4EHO1KXEsIIB3K8ToP+489PARLJWIReC54FCh9RFpkslENQtGv5zSinvU5bNa4TKhhoLVQMoC2uvbdByTc4LpN3x4TWFRujEAek/lJk1v/T36GtZ52Tj5+520Ujkq9rkm7vYS5seYWQw2VXYTokedctefHS2LuizegdDBZxfJ7qgPYkkQnrkVX/abszbXCWUfF2cn1ltsOQlbgZzk93MfqMGVT9OMP5AwcLhWHiMnJyMagD6CRQK/pX4Gopy2M5Ic5ozaeukrO0d43l2J4joxafhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJdFxrr9sYKfTcoBhNqyTKAXzWNtIEBELyVJr6CDLgs=;
 b=d2YDW5igd8P/bOIGrBls/Z/4dmmf9Ca7UWEYdltzlUxKgLjShLP1P2/AY7AT5Hp9HmsY/XhZTowDJWl8f1f1YWZtVAyZzCp9UQEottXkxaAKg5VAYZA14yR2Yr0pCWNsTEcu/8ZgD2Vm91Wq/qMmQ0GzoxM3vp2/qxS4KVVPSZlFTN1Zc723yRzhQT4dnl1qd9gdAeMO4MC1qZtFSJMNWjwYShBghBfxSBnmjO9F1gD22mGZJvbDnYnICoD58nywPqMBmacgn7oexlq+CyuDFbo9/wwrKrU9h8fiaCnecFOdJH/Kej52cz4ruLi76hY8crCz75VmuYtgc4EyUafahQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:14:22 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 12:14:21 +0000
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
	<tomasw@gmail.com>, Vitaly Lubart <lubvital@gmail.com>
Subject: RE: [PATCH v10 04/10] mtd: intel-dg: register with mtd
Thread-Topic: [PATCH v10 04/10] mtd: intel-dg: register with mtd
Thread-Index: AQHbxaAJPNuSEp81lkKjqc2nDVfgyrPdpcuAgAD0lJA=
Date: Thu, 22 May 2025 12:14:21 +0000
Message-ID: <CY5PR11MB6366FBBB13319D7986105AF7ED99A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250515133345.2805031-1-alexander.usyskin@intel.com>
 <20250515133345.2805031-5-alexander.usyskin@intel.com>
 <aC5HjQKRf_4Ewous@black.fi.intel.com>
In-Reply-To: <aC5HjQKRf_4Ewous@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|DM6PR11MB4516:EE_
x-ms-office365-filtering-correlation-id: 103d684f-9159-4478-78c8-08dd992a2f2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RDdhZUF1QmRHUit0NXJXWmJTYnRQa09NRk1KeGxickpXNFJoNVdwb2NFTGZ5?=
 =?utf-8?B?cTFYTm5ROVBMcmtEdmNIUlh0Q1p2aHVtSHd6bDVSeTA1S3NYRDVSaERXMGtX?=
 =?utf-8?B?dHlIbXdEWXdNRGhidmVkVFN1M1hGVDltZzBtT2dVbFlSb3NyU3VENXZNSUFP?=
 =?utf-8?B?eFQwK01kdTc3QWd1eUdHK3dKNUZQMGhObUxsdWRwR3owQVUyOGIvN0tqUXNj?=
 =?utf-8?B?UzZLMEordjZSR2lMRS9nTUJWL2J6Q3cxUWNJQ3ZaTGIvd0JGZlVXYmthM3dP?=
 =?utf-8?B?Qnk0N2s1Y2VKNUZJYXd5Sjh3NmtsMUJHU3A5a2xESzYwbVhpYTlIRmlydnI1?=
 =?utf-8?B?TVlYN0NwQzdmak4zVjBacUZ2L1g1ZXQ4Q05YSjNjYzlGVU1FaEFvUi9QZmdE?=
 =?utf-8?B?cnNaZndLZG42Y1RiOXhLSlZraStOdEFoSU9za1pFOW12SGkwRmRPVzAxRmJs?=
 =?utf-8?B?bWxEQUYyRnRFYk95bEZ0ejY4TWJBTjQ1clQwYzhJOHc4eGJNZmFiVUxBVEZL?=
 =?utf-8?B?ak9xR0ZzdGtrT2Rha2dkTkM2eTVvMVQrRk1pa0Q1bXJQRkkwWUc4UXY2aEpw?=
 =?utf-8?B?Nk1RMzBDdWw4VDkySjdqSGtsdjBDR0dvSElnNnp5YzJYbVErTFpoVVNtNXZx?=
 =?utf-8?B?bXZzd0J0VzVrUk1JWHBtTkNLVFhMaDJqR29UZkFpL3hRVVBmalM2MmxqbUF2?=
 =?utf-8?B?eEozS2RrNmlNdzJrNStqK0pyTUsvMXE3MG5SSFZIWHpoL3RwbU95cXZubkQ2?=
 =?utf-8?B?ZEpuVm9PalEyRC9mN0oraDV0cnRJcGtuSE9TcCtsMllzMVNRNkdkQ0VmT2JN?=
 =?utf-8?B?WXBxLzhndk0yQWdJOTJKL1BucjJzVzBQbU9iTE84VWxrRWE0VzVaZGNwSWpE?=
 =?utf-8?B?ZWFDaWZPZXAyTGV1WThkeFpucC9ReVRvSmMyVkpyU0pQZ1lvTlllRjd0d3NM?=
 =?utf-8?B?MnQwWlpqUllRMURDVmtpMXV3aHo2UXU1bGRnNVV5eHRaclUwYnpwdW9ncE83?=
 =?utf-8?B?Rm1GdkQ1c1JXa1dnd3BJV29mUG9Gc29hOU0xTy9NaHhuNkUvcmtqMzZtNHpo?=
 =?utf-8?B?eVhtbDcxK0RzYVVPb24vbmZITURPS2kzNDA0RlhUS0dzVUtKUGwwdTBrKzZT?=
 =?utf-8?B?Tzg3WTNiOTdBam1ScmZ5bld1M2U4V1U3dFdwT1JaNk9aMHNHU3dQZ0EyMWtn?=
 =?utf-8?B?TEphRE9TN3NaSzNHNVYzZzRGKzJaeGMyelBmbnZYZUsydnUyQUZoeGhCdEh1?=
 =?utf-8?B?b0RWUEhZME5zbzlpQ2FwcExOalRtSTFUbWxUM1E1bTdNM0UwQm1FRGNFUXNm?=
 =?utf-8?B?eU8va1VENVJ6M0s3MnZGdU01WmVQMXhITTY0L1RYNklQY0hhanl3Wmx3WWpN?=
 =?utf-8?B?UTJMU1lOalFZS2h0WHlXRk1VQWs1TUxXWWZ4TFVVZVhxNjl0ZGlHZncwNWs0?=
 =?utf-8?B?Y1A2bHVVUXJrVmh5L290ZEFsLzlaMjhCZkVWM0xGZ0hzQTVuU2J1UDY3alQ1?=
 =?utf-8?B?bkN1aktyaytDSUV3ZTdLaGdtaXVFdm1vS0pYMGcrOUJrVXVTNDRTUFJ6RVdV?=
 =?utf-8?B?cVRGaUhOYUNjMno2QU5ZYmErWGd6SXRIRHRxL2MrcWtlOWxrMmJCRTBNb0x2?=
 =?utf-8?B?Tm9odFVkajZKMWE0SThFbzJ0NlJGVlM4cVh3MjVadGpZTzlFRHFiRk43M0Ex?=
 =?utf-8?B?TzBobmQrQTNKYmw2NnVEVG1PYmhXWFBVNUkrdGlXMDFlcVJiYXF1RHBwb3By?=
 =?utf-8?B?dktpYTJWZXVqRnBUMU1RQlorenFHTUJxU0VRR2doZkJiNkFvQlQvbnpoYmJs?=
 =?utf-8?B?MUtjTXlUZ0lueWh0ajVWRWNxbkRVNmdRZjVBTEFZWW9veS8yOVpXY2RpbjB4?=
 =?utf-8?B?YStJOTR4YnJUak1iMUdLS0xOWkNLbCsrYkpPTEhSVGZFcyt1Vm5BNmUranB2?=
 =?utf-8?B?MHoxK3pzRXpqdGM1bW01clBjRUxEcnIvTHp3aFRUdG9pVk9nc01tbXUrdlJH?=
 =?utf-8?B?TjQxVHZmUTBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVpORVo1eTl5SnRkSzQ5ZlNveHEwa01WRWNtT3NaSHV5MTJCUnFwbkRORFJw?=
 =?utf-8?B?MHhIcjByVHRqWE9ISFdyaDRFUmg1dmdBZTFsdnkxNzhLVFpzU3FxaVhHU2lR?=
 =?utf-8?B?a002NFpXNW5WUTM0YVZ5UXdRQjFKYUZLZG15d1hLQXFIckxZdnpkS1RSeCtm?=
 =?utf-8?B?TzhxMUo2K1RyZFNBOFRTZjFsOFZNTk94UDNMYjJTaEhjbTNoSVhoNW9wS2Ru?=
 =?utf-8?B?NGwwU0E1am53dUIybFg1N2xwL0dJdnZBa2wrZEtlb0VQMStGOVd4VXUrRHVu?=
 =?utf-8?B?eDJSQkpEOHRveG9LVlhFdHA1aFJWUk5sSHA0K3FPNkllMlI3bThyWnlmV0dE?=
 =?utf-8?B?V2ZndjBIK2ZBK0RBNVNOT0hpVXd2QTEySVlSTXlnZmFrRnhFVFZsV3gzWU5q?=
 =?utf-8?B?Z1dubDE2UE5TRmVmZ0lwVnhTU2dnc2pvd2tERFd4aFVJTm9BU2xTdWhCbnl2?=
 =?utf-8?B?Y3BmZWI5VjRUYVhDM3pvZHZZVkRiV1U3b3JuTSt6Qnpyc3BSSUZRUjhJMFUy?=
 =?utf-8?B?V01yT1NFek9hUGNYVHRYYjI2TGxLTFZTRlZVbXhybFlyZjZCUG4wSG5SU2JY?=
 =?utf-8?B?QWFMbDMrcDlpTHQrS3ZmczVLUDJ0SCtuRFhWYnl0TWQ3TXkwNnhmWFF4S2F2?=
 =?utf-8?B?MVFrekNaZno5YjBnVUlmTzZaQ3ZMb21sWnMzK0lzbm1NV2pWYzBRQkVDQmJE?=
 =?utf-8?B?cjJOM2RxSDlQSy9KOXl1WG9qaXNYdnF3Y3lwaTdrSFFzTDluVW9aOFBIeGJy?=
 =?utf-8?B?ZVEwdzFNSXJtTUpsNDdPTVhYeW02Ujk4SDk1ZGVOSXU1bGJTVUZXanczZ29y?=
 =?utf-8?B?MU5qSFJ6cStPM3gzTllYVGFJREYzdlRCTFVoWkViVmZ1c1ZzektsZHp6anVk?=
 =?utf-8?B?TVdKd2xjUm9ONU9vZHJiUWFNNS9JRHJOaGtBQXNQNlNEWG5ValJuRUVzVXZt?=
 =?utf-8?B?OGJONUdvTklqZEV2NGFHUVpPeDJEVjhRZ2ZGeEJjdVB0V1o3bWFBRmg2VG41?=
 =?utf-8?B?V1NWeHlYbE1TbnkxYjFOQWI3d1lObjAyL09xUloyZzh5RHh0cjJsQlRIeHNi?=
 =?utf-8?B?cUk2U3VOMjZqRkh3b3lvVU96VWFFZ21kcmVkT2NXNzhjcGkyZnhubjduKzdG?=
 =?utf-8?B?cVpiWTFZV2FuYTBKeThVdFFQbmxVb2dBdWl6UFdpYkhxSFBLYXhXZG5ORFJS?=
 =?utf-8?B?TjJpUWdSVG1ETFhKdkFRQ0JRc2xRRVhBQm9WNHJFRExiL2pDWFlPL003RElD?=
 =?utf-8?B?TUtraW9CNFZaL2NvYlV1cTltYWxiei9VSUMzeUNnQWhmdzhhNmRDUVR6L2tR?=
 =?utf-8?B?RVpXRnh3MlZDZkNrcWg5OGFTVUpiNWZIVHpJYTlOZElDNy9NbXhlc3ViYS9k?=
 =?utf-8?B?dGVjVTRVM3NYNHZ2eVhBRy9NM3d2MDNLalkxV3M3ZEhFQWF5VkdEZ1puYm8z?=
 =?utf-8?B?UERDRlBpTzVHeVI4ZThIOHo4V0ZDckJPdTZzRE9pcGxsYXZMaUZsRDVaajBJ?=
 =?utf-8?B?STVkSXQ5U3FIMDhGRkdaZyt3dGQyQTVJWUFIZU5sN25pbTEyOUdxbmxRd2pD?=
 =?utf-8?B?eENjN2hMNzZrMmp1cTlJNEZyWkdvSE9yRzFMQWdiRFNmK1dON1NRckZ6QTB1?=
 =?utf-8?B?by91cDRtaWhycGJ4NkkyUzZVU1JTK3BHRmxwSEtJbERMTnVHM2lwR0dReWJB?=
 =?utf-8?B?Y3RaelVlSWdROHFsQXZGOURTUUhycGpYU3JpdDFKczdoOTNzRUVEbVNKUjl5?=
 =?utf-8?B?NjR2cTgvdHhmbmhnUGdjWUo2TEt1SkN5MDM3ZExnWXRyMHlBcjIxY1QydzVT?=
 =?utf-8?B?eXlnSTVHVjl2d3NQR0k3YmlxbEt1cFozN21ZcVg0WEsxRjFRN3lidDhzYU9m?=
 =?utf-8?B?T1dvOGd4aXZGYU8xZHdNTDBjNkgrR0ZYK09VR0o5eDRXK01SeGJsZ0Y1RE4y?=
 =?utf-8?B?TEFtRVJRdmt4aEhCc09TS1pmUUtTenFQOXhhTWd1Si94eTFwQW1HL3hCL1Ra?=
 =?utf-8?B?NHVZcDFxVm9RZGtiM2s0UEo3ODVMWFp5eGVNV3ZQT09aMUh0UG5OZEZoUlRE?=
 =?utf-8?B?ZW8xVTJCSnJmZjcvTGpGT1BJY0c0bjcvTDEyNzVqbDFqVTVleVZUVy9EcDlR?=
 =?utf-8?Q?s5RjRy/q9VBous7R4UwacUK9q?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103d684f-9159-4478-78c8-08dd992a2f2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 12:14:21.5227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /VkO7Fz9n4e3vxP6SQ6SHuAJTyqa4iX6cF5Rdq5SlTCx8SMohZjUpOcChGidM5pd9BPvN+Sevv9DmSGE+VIz7PXXVv2c+Nam3Hha96Dgo5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_051457_580070_5024C8A4 
X-CRM114-Status: GOOD (  20.57  )
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

> Subject: Re: [PATCH v10 04/10] mtd: intel-dg: register with mtd
> 
> On Thu, May 15, 2025 at 04:33:39PM +0300, Alexander Usyskin wrote:
> > Register the on-die nvm device with the mtd subsystem.
> > Refcount nvm object on _get and _put mtd callbacks.
> > For erase operation address and size should be 4K aligned.
> > For write operation address and size has to be 4bytes aligned.
> 
> ...
> 
> > +static int intel_dg_nvm_init_mtd(struct intel_dg_nvm *nvm, struct device
> *device,
> > +				 unsigned int nparts, bool writable_override)
> > +{
> > +	unsigned int i;
> > +	unsigned int n;
> > +	struct mtd_partition *parts = NULL;
> > +	int ret;
> 
> Reverse xmas order (along with all other places).
sure

> 
> > +	dev_dbg(device, "registering with mtd\n");
> > +
> > +	nvm->mtd.owner = THIS_MODULE;
> > +	nvm->mtd.dev.parent = device;
> > +	nvm->mtd.flags = MTD_CAP_NORFLASH | MTD_WRITEABLE;
> 
> Isn't MTD_CAP_NORFLASH already writable?
You are right, will drop MTD_WRITEABLE
> 
> > +	nvm->mtd.type = MTD_DATAFLASH;
> > +	nvm->mtd.priv = nvm;
> > +	nvm->mtd._write = intel_dg_mtd_write;
> > +	nvm->mtd._read = intel_dg_mtd_read;
> > +	nvm->mtd._erase = intel_dg_mtd_erase;
> > +	nvm->mtd._get_device = intel_dg_mtd_get_device;
> > +	nvm->mtd._put_device = intel_dg_mtd_put_device;
> > +	nvm->mtd.writesize = SZ_1; /* 1 byte granularity */
> > +	nvm->mtd.erasesize = SZ_4K; /* 4K bytes granularity */
> > +	nvm->mtd.size = nvm->size;
> > +
> > +	parts = kcalloc(nvm->nregions, sizeof(*parts), GFP_KERNEL);
> > +	if (!parts)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0, n = 0; i < nvm->nregions && n < nparts; i++) {
> > +		if (!nvm->regions[i].is_readable)
> > +			continue;
> > +		parts[n].name = nvm->regions[i].name;
> > +		parts[n].offset  = nvm->regions[i].offset;
> > +		parts[n].size = nvm->regions[i].size;
> > +		if (!nvm->regions[i].is_writable && !writable_override)
> > +			parts[n].mask_flags = MTD_WRITEABLE;
> > +		n++;
> > +	}
> > +
> > +	ret = mtd_device_register(&nvm->mtd, parts, n);
> > +
> > +	kfree(parts);
> 
> I didn't find anything questionable about this, but hope this is tested
> and there are no side-effects of this.
> 
This was in i915 internal for years.

> > +
> 
> Nit: Redundant blank line.
> 
Will drop

> > +	return ret;
> > +}
> 
> Raag
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
