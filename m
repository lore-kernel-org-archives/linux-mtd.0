Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70F2E77188
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2025 13:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qe7nKEYtrDLkV5w80GEwEPg7aKfMOhurofPpleFTFQ4=; b=vae7Kh5n3iqOYT
	Wj5kYd3fcEevOlp8GTiOn3EzqadB7LvQOqkRcnaeqjPjzeTnAfQyBoyew5A6Be947IUqFt+SKJ14M
	imPh6xNzWqKjNq4QnQb6Em8dVN1CaGtuASrbkbprYsQ15Hdt48koPC28tZDe3nfO3qPVVTPpuy8am
	tR4wwuYbUsDq9YYHk5T6nXV0E1FOJT37mTgm2/Hhm0yN2/tO+JO4OPX5VwEdhMvabNT9KCycj4Tk+
	XayH+f2GaKJZpQfoPlskX/N8yoeBWqNyDmfsR68faHXZEivTT8C9lnURRtJo1xfJ2gaMVZarT4mB6
	Qc51zJb6ZjO8pd4b+SSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTL8r-0000000ATIl-1Lm0;
	Thu, 02 Jan 2025 13:21:37 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTL8o-0000000ATH4-2NaP
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jan 2025 13:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735824094; x=1767360094;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xpAKtWRVJd+dNNRwX4u9VDDcel9mTjuNBvArS30HMUM=;
  b=F/vuiteGAZlIEUoZnII/t6DwjYcumj9DdaKC/hwhloGaSCW/BtQuQMuo
   mojbPD6Es5nPi60GDm636fDD8H39khS1cpnJvFThx2mCmVuwHGy8Ui5Eh
   gSp/DtUtmR0v2iku4n9yAVoSJIvBvGQuk7jZbD/uwt4kh9KrF6qgRTRWE
   Apku2r6K8cYjtPitTyjLxNIvZiCDT2sZVLZVOcri/tsPyQv+SeGOPtLIW
   GoWViF9qIfYp/4Gczhw30sslrWND84LKCMLvyYzloUcDACkGC/JgZ8Q0G
   nsJXDDzmygFenCcuRgvHUYwdgy/ul5TgmBLefIHBXOMNH5wj/hcjLC/eJ
   w==;
X-CSE-ConnectionGUID: BogJVNVGTtylMQE0KW+Fng==
X-CSE-MsgGUID: Z68C3UL5Re+I6hnGro2j1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="36281904"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="36281904"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 05:21:33 -0800
X-CSE-ConnectionGUID: W1V9LIDKR5SD4axYnOnxhA==
X-CSE-MsgGUID: rQXu7t2FTi2hhDDjftN8Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101347385"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2025 05:21:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 05:21:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 05:21:32 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 05:21:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6m2HOkocQGWelWoAXSJ01vikZwjh0ZEzIfxtzQ26w+lmgE5suGvdK88uugsCUgUMGEOd0PKP2lD+Z+udsZEHBh0KZlkJltRC7gRCo4wJsLDmBgUQ2e/yQ4rg571EGRdyhVBBZHJcrod3hpx+aJUUyWfuqb3gstAaQaSC0OB4XsKJnwMdYXEjN3NE2FOGKuv47gSrQXZqYhOFeiHNxSAfsub4yTNmXsgFhnvPja8AO2WbarRTPSq8Z/fej1J2v+wyGqe9ZZ6844/5Ff9Wlo+ta/tB7+cYHJTnvp5YpJ707L4KOg3IgjL4rCkmTI0Q2NcaDu8x7VRjg0KcDKEVKHDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xpAKtWRVJd+dNNRwX4u9VDDcel9mTjuNBvArS30HMUM=;
 b=ZSMfIhs2J8G3ri+Gd9n9lmdB7l8Yzb9uNGQ3dCceBprEjHv30kWcEkzZoTFFS4TU5ElBuGyEx1Fj28Zi0lSaQQXFJdVnjsh4bIEwK+sq/q1nc01igzKKwILvEj0cbivJzXXJ/g4mbmmNiAjq1gs77vDpP/5Oh8mxzCVGtQ0Yal84oT/5zL/qZM5drY2IbUG4Zm8kK5cIK3xQ2tTHtnRCSxbJf0/7//1NpdyOoLmRCHTkyV/SjKrCeE57ZcwgLyO3c6277zKC3iN2ylvSZUui367DHSitVmgc0W3P4cl7Gic/vFDI9H0IjHMwqsUttgDp+u/93Lk40R1vPa1vmWox9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 13:20:44 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 13:20:44 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
	<thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
	"Poosa, Karthik" <karthik.poosa@intel.com>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
	<oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Tomas Winkler <tomasw@gmail.com>
Subject: RE: [PATCH v4 02/11] mtd: add driver for intel graphics non-volatile
 memory device
Thread-Topic: [PATCH v4 02/11] mtd: add driver for intel graphics non-volatile
 memory device
Thread-Index: AQHbXGTtGGP/1CG3iUSlqIRDeU09/rMDSnCAgAApEzA=
Date: Thu, 2 Jan 2025 13:20:44 +0000
Message-ID: <CY5PR11MB6366A3FD539462F8473D24DCED142@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-3-alexander.usyskin@intel.com>
 <2c89e56d-26e9-4ef6-9da3-4b0121163b30@wanadoo.fr>
In-Reply-To: <2c89e56d-26e9-4ef6-9da3-4b0121163b30@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB8569:EE_
x-ms-office365-filtering-correlation-id: da835260-3e97-485a-01f4-08dd2b30438c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?aTB4SFBQc1ZSYS9JR0FrOTR0YnJOeGdFMkpla2o2L1FWVjFWdlhFdFRJWmwx?=
 =?utf-8?B?STJiN216RWV5ajRiWGFwSFVHODBRZ2lKOHN4ZmdqVGhoRlBEdEJaWGRpVVVF?=
 =?utf-8?B?OG9UcHhvTEJjMWF1UEtObDFvenUzaHFIZUtLMlVyL3BCa0dPTWI1S2xRYVd3?=
 =?utf-8?B?cWtBVDlmRWYvWHFmMU9FTjQ0NGRjMnNZdjJDalQ4T3Uzdi9VOTFJemRtb0Qv?=
 =?utf-8?B?ckVWZmQ4VU04T3h6MlVRRnU2R1k5TCs0d2lFeWYwSTFST2ZmcXVNWVowUEdi?=
 =?utf-8?B?cGlWZHRLQjZRTERQN2h1L0hPWmJnY01qU3MzT0l4L3NxdmM3MmpJOUI1QjlL?=
 =?utf-8?B?WGVNYmRYajY0M0NaQU91bUVmd29qYlovVTFQSXBzQk5QdzUvUkN2a3NtRExZ?=
 =?utf-8?B?dUR0MnBybXNzN3BhWVVabUdXbTJhcnJKeDR1WC8rVHUrcjYyY01TWHdvRlpt?=
 =?utf-8?B?bCtzU3lkMWFweXlLdmFQRVNaSXdqRWo2dGN2ZEdpT0U2OHJTenVHbFhmdU1z?=
 =?utf-8?B?SUlEK1JVSnU0YjQ4SU1UNlZMTkY3YTJrUTYzRGVkV2RpZlhhcVpUNHNVaWR6?=
 =?utf-8?B?UEF4SXp6YlpSTmFXeVo5ZkcwVlNwTXBnRHc1byttKzh5U2xObStrVUJZd2lN?=
 =?utf-8?B?TXgyaldVWEUwNXJLZG1xc1RkRkhiVVFzQjB6VWhUOU1jMFBMbUptMEhVK3hU?=
 =?utf-8?B?U2p5ZVljUFRXVzRlNVdIOFRjRmpwRm9XakRVT01UTVpLOEdyQWhOVzVGKzFl?=
 =?utf-8?B?MmVub2d1NU9NdDMrRVVlRVlac3FJQWhPRGhibHdrRVBvNFpPeTlFcWtpNHEw?=
 =?utf-8?B?TU84eERMZGxBMmpwdDFCbWIwTnFYZGdUVHhaY3piaFkzaDZyTzR0T3QvMS9n?=
 =?utf-8?B?Mm00UTdzeXlGQlN1S3I0WE5NTGk2MUtkd3M2L0NnM0YzL2pGUWtNZEdDME41?=
 =?utf-8?B?OEUxU0xCMThjN0paa3d3L1F3WndhN1FqTXYydThPaWx5MmpzSHZ1WDd4cjRO?=
 =?utf-8?B?NDZYaytmbnRGaFMyYzg2Z1ovbE55MTY0ek4wc2RSdENsY0hyYk9GSEZDVkxK?=
 =?utf-8?B?ZXdHMk5DUFhIUnpLUnFpRjlhbVdGRkdaZEIrcldXamFkYUtDSmJXZWJQRy9t?=
 =?utf-8?B?MUZXT1BNSXdsaHlFMGFqOGpndHJtOTBQYkNTc3JBbkNBNFZUMnhBcnAvcE5T?=
 =?utf-8?B?WXZaV2xtZlljRU9MZGl2dDlBZk1QbzVWY1Z0WGY3cEJJM1VVejBCb2QvZ3dC?=
 =?utf-8?B?Yzgza2hjaXFyMDFyNmVESE5WV2tnWnozazF2QmROdndMR3VPRngwTXpTNFR0?=
 =?utf-8?B?b2RQSzFqZW03TUtzWi90dWxWc3ZzVXNmUVlCc3hNd1RHSVNZaXdtWW9UR3U5?=
 =?utf-8?B?b2d3U3RIakM3dExQWWE0aklFYjZybVREL2ZkZUZyd0oyTjFyQlFjckZyYkdr?=
 =?utf-8?B?dm14MTBuRDFGNEo0YjhGaUpQWTVyaXM5MDJqVkdTVkxkOGVKRnlGSy9HbWRP?=
 =?utf-8?B?RUd3TW15a3JveUdHaTZNSUZpSHc3ZitycnBSdFlsYXprSzhaS1pVUyttYzVp?=
 =?utf-8?B?SFJLbXlrZEp6MUtKbDFaRFYwQnhDMS8vcGRXdEI4c2docGNRSE84OWN2ankx?=
 =?utf-8?B?N3phN3VzKzdUUEUrRDQ2R2JYOTJ0VERZM003dHFGTDRidXA3ZjRsMVRub0R1?=
 =?utf-8?B?Nml0VlZDRCtyMlZMaXNaaEpOZExhK2lYVk1RQ0FpS2g5ZU9KcG55c05mRDR3?=
 =?utf-8?B?dmlBaGkrSG8zL2J5VFl0RjJJTUJTQU5SMm9MVnYrVC9VUm4xSnI2OEMrUXdH?=
 =?utf-8?B?ckhCMm1mblFycTIwcDNSZWlNSTM5UzlNeGhabzVSZmxmNFVqUXU4WnNZY1VZ?=
 =?utf-8?B?dUh4UXlGMTAwS01TOFJpcDlUaE12ekVTYWxGS1VZNi9RVUJWTURoWEpUaGhw?=
 =?utf-8?B?Sks0M2dBdHhIcHFOT1VJdk0zOHdQcm9DMEE0M3MvQjZCUmJUcUNIUjhqU2RU?=
 =?utf-8?B?cmNWZHEvb0pBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWZyUnNUbjJwd0MzTzhHQ1c3K0NBOStkS1lQYS9uWlk1SjRzL1QzRmRpU0RZ?=
 =?utf-8?B?SlJjVnZwSWczTk1KVWxjM3laYnZEMWFtTTFKd0g1T21zZCt5bkM4T3A4bWRS?=
 =?utf-8?B?TitPWFA3dWwxZkoyUkxsLzFrVUdwai85YmtMWXZRVXBROG5ibU9OWVBKY3RE?=
 =?utf-8?B?WUpOZEgyc3lETWpYU21wM3grbENZZVA2Tm85dlp2ZmhrSHAzczRXSUNiYmM2?=
 =?utf-8?B?ZXlRTllnUW5CcW9hTXN2My9QVDVKSURnR2tLZTdDQllkVWoxNHhlY1QxbXc0?=
 =?utf-8?B?UVJwZUdWYmN5MDJhWE1MRnlqTmRMbGRKNHJ4VzFDaHRnVkR3cEpGZkNOdUl3?=
 =?utf-8?B?czdpKzFlOHcycU1tY2doZ2IxUTFkV2NNdHNCQ01tOVZ2L0I5WW1Jb0wwMWxC?=
 =?utf-8?B?YU9jdk0wczRJSGhDWnJoV0ovalJpQ0d4UWxNcmxsYmZnWW54c2RaTzNqTWx0?=
 =?utf-8?B?bUJJdW53aWU0aEJsZUh2NnZJUnVkNHBScVpUcnBiTGZxekVzSWRzdEZ3RWx3?=
 =?utf-8?B?T0NuU1NUbDdsV3M3enM3eWk1ZTE1L21QY081bUs1cWpkVThxS3VlaEJPeFA4?=
 =?utf-8?B?ZmQ0ZWZRZ2VETkd3dXdFTUFCTDh0ZTEzOHkrQ1BENlFDY0hMTjhvellHb3Zm?=
 =?utf-8?B?cjBwZFdCcGR5cXg5dU9pdldwRTI0Smw4K1B5dXFJQlNvMnpjbElKWUt0ZTVa?=
 =?utf-8?B?RW1lVzJVdUNCbU9jN3U3ZXNzMFNnMC8raGlhcTZQbXhqTUI2ejRlZ1JFSmh0?=
 =?utf-8?B?OGlvbWhpVTR1TS9EakxjTU5WTDdMQVg2RGk4Y05Dd0V3bmlrb3VFUnRJZHk3?=
 =?utf-8?B?YU5SR2haTlNDSVlJbFJLcksvOVkzRzFSdDlGK2UvUy84dEU5N0g2bS83WDc3?=
 =?utf-8?B?RjVGdHFPSDhEVEJaMXRwMUhzQUk3YzRZajBzSVlCamN4YzhUd3FxRnBXc2VL?=
 =?utf-8?B?U0p1ZTRNZE9lSFl6anorYkFiTXdOSklaTmloUDlYM1AyL0ZNQS9iRG1LNnZE?=
 =?utf-8?B?dXlsSytJblZveC80Z0RXMnl5N0hCZHlxZVhRaGQzSU1wcTN2d3dpVjhHV1lB?=
 =?utf-8?B?em5FNkZ3MEZkSlZQeXBwYkJxMzJLN0tpRlI5N3UvTW44MFIzY0xRd0VDc1E3?=
 =?utf-8?B?c0x5VEpsVmJlN295dWJ3YlMwczlSVmVVaS9zelRENlJ0V1FvdFZSRmp1SUsy?=
 =?utf-8?B?VytDUytwZnRWYVN3MFZUZEhWTERlU3p3UGNaWFhZRWlIdHJOMHF0OFkxQ1M3?=
 =?utf-8?B?ekI5enRDM1Eyc2cyVnZEampldWpaMXBOaStBdmVJai9rd2FwbDlSck5mdFBi?=
 =?utf-8?B?Q1NST2RiOHByT3plMEtwTzZ1VWp6NytUZmswT3NlS0F1S2trMzZONUdYVHlt?=
 =?utf-8?B?MFl2OUs0TUJKeHhaSHhLamEvUVBta2lUVDNycHZ6Mm5YeTZUdnNUWWc2bkZi?=
 =?utf-8?B?SG95THA1TzY3N1ZMUEtVNUxnRUFCZFA2UUs3aXhTR0k5dWVCRXNaY2xOencv?=
 =?utf-8?B?b3d0TU1oUTNLb2hCM25TNkF4QXdqTXU0L2plc3k0SEhPdWF1Y1pRUEVoL0s4?=
 =?utf-8?B?L0dGSHpTL3NSc1J4T2FrQURTZ1gyVUxvbTlVcWE0QytJakdQMWxaVmduZmdw?=
 =?utf-8?B?ckIzQ3Z5MUFSUWNqdVU1dDc1azhjd2kycFJVd1ZJRnJpWFBtdTBjSHpMYkwv?=
 =?utf-8?B?T01QNDNQWnR5OHo1clA0SFR6Z2JXdnZ2M1IrYTJvQ0IyNHhJT2NJRk0vTmg5?=
 =?utf-8?B?ZG1ha21MVUxkUnR4cm16aCtTYjFZWUxTUnJPMlR1b3g0RVBTM1kzZENIUFZm?=
 =?utf-8?B?eXlXUmFFNDdLeEtpUlFpUmlsL3NQWVcrM0lqckFQNlJ5MXkvSUJuSW5wbHpk?=
 =?utf-8?B?YUJQTzlXSTJiTmNPYjN3aE9aNnA2M3QxTHkrWCtSczNpbW9BSXBPSWNSc0ZM?=
 =?utf-8?B?VER4MmEyWUZreUNVbTd1K2xpL0dFa2lPNVZLOHN6ZHRkd0RieERjVlhjYi9J?=
 =?utf-8?B?bkRFbjJwOEo3Y28rM2VMZWpKc3EvMjJVeUpRTEdDQ0VFR1pJOVJmY0ltM1Nr?=
 =?utf-8?B?QU5uTnhzZVZOWjE5dFYwZzBnWWxYV1pZQlpYNmR5aFZIUlZPNkE0cS9hTDlx?=
 =?utf-8?Q?r6RDM9fg0/RK9JKFLQxY9zSok?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da835260-3e97-485a-01f4-08dd2b30438c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 13:20:44.7871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsEQVxgGNU7jNPOCI8HglpBQgN8UqvkU0HZJDDYUpCjR3vhoxtw+cb9r7gBLTFt3kkii+6IYh+7bgMQghLJYyNY+SdEt4NjmQim73XJOkUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_052134_676582_EB981F53 
X-CRM114-Status: GOOD (  18.47  )
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

> ...
> 
> > +struct intel_dg_nvm {
> > +	struct kref refcnt;
> > +	void __iomem *base;
> > +	size_t size;
> > +	unsigned int nregions;
> > +	struct {
> > +		const char *name;
> > +		u8 id;
> > +		u64 offset;
> > +		u64 size;
> > +	} regions[];
> 
> __counted_by(nregions)?
> 

Sure, will add

> > +};
> > +
> > +static void intel_dg_nvm_release(struct kref *kref)
> > +{
> > +	struct intel_dg_nvm *nvm = container_of(kref, struct intel_dg_nvm,
> refcnt);
> > +	int i;
> > +
> > +	pr_debug("freeing intel_dg nvm\n");
> > +	for (i = 0; i < nvm->nregions; i++)
> > +		kfree(nvm->regions[i].name);
> > +	kfree(nvm);
> > +}
> > +
> > +static int intel_dg_mtd_probe(struct auxiliary_device *aux_dev,
> > +			      const struct auxiliary_device_id *aux_dev_id)
> > +{
> > +	struct intel_dg_nvm_dev *invm =
> auxiliary_dev_to_intel_dg_nvm_dev(aux_dev);
> > +	struct device *device;
> > +	struct intel_dg_nvm *nvm;
> > +	unsigned int nregions;
> > +	unsigned int i, n;
> > +	size_t size;
> > +	char *name;
> > +	int ret;
> > +
> > +	device = &aux_dev->dev;
> > +
> > +	/* count available regions */
> > +	for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> > +		if (invm->regions[i].name)
> > +			nregions++;
> > +	}
> > +
> > +	if (!nregions) {
> > +		dev_err(device, "no regions defined\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	size = sizeof(*nvm) + sizeof(nvm->regions[0]) * nregions;
> 
> struct_size()? (and maybe no need for size)
> 

Will do, thanks for suggestion

> > +	nvm = kzalloc(size, GFP_KERNEL);
> > +	if (!nvm)
> > +		return -ENOMEM;
> > +
> > +	kref_init(&nvm->refcnt);
> > +
> > +	nvm->nregions = nregions;
> > +	for (n = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
> > +		if (!invm->regions[i].name)
> > +			continue;
> > +
> > +		name = kasprintf(GFP_KERNEL, "%s.%s",
> > +				 dev_name(&aux_dev->dev), invm-
> >regions[i].name);
> > +		if (!name)
> > +			continue;
> > +		nvm->regions[n].name = name;
> > +		nvm->regions[n].id = i;
> > +		n++;
> > +	}
> 
> Should we set the exact number of regions, should a kasprintf() fail?
> 	nvm->nregions = n;
> This would make __counted_by be more accurate in its check.
> 

Sounds good, will do

> > +
> > +	nvm->base = devm_ioremap_resource(device, &invm->bar);
> > +	if (IS_ERR(nvm->base)) {
> > +		dev_err(device, "mmio not mapped\n");
> > +		ret = PTR_ERR(nvm->base);
> > +		goto err;
> > +	}
> > +
> > +	dev_set_drvdata(&aux_dev->dev, nvm);
> > +
> > +	return 0;
> > +
> > +err:
> > +	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> > +	return ret;
> > +}
> 
> ...
> 
> CJ

- - 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
