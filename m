Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F7CE77188
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2025 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cB8f5XGzBK5gTHISUamqkI5z6BLO5kvKuiP3DIC79QE=; b=u/nJl8X1HBjX/V
	AlR+n13Wfax89XxzaSAas5q4LACYt55RG07C252zdbXF9GQyFdQNw3uJLpOsaGbdx7Bs1A+ihHFDr
	2PghrDtp7hY3561gTZkgGNYBPi52ZjZX0Ccp+A/QYaVhhVSAuvQGlDblItTTn12y2gn41qZOrutZ3
	FhmiEUun13WPImixICw58H3WeddnBlMPENavHoGzUG1tcghJ/dDKhWiTte7X8uSauqOIzFDi8nI45
	aq4WUORNVkcY2XSK1Ea1wvQF4w8cqmRw3p1ZIJiQtNediRn2It/acenxq7BR82FtJo5VqN/MZEjmn
	00C6WUE67g6gt1DtY5zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYJmE-0000000DzGY-2eR8;
	Thu, 16 Jan 2025 06:54:50 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYJmB-0000000DzF2-3NdG
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jan 2025 06:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737010488; x=1768546488;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=220b+hEHYLdwJ0kBAsK62UYU0cF+JjGzSuOt1bd1nko=;
  b=JFaNQSq3xQPKHYOBnDIt6ICxNuKC+BD+kVWPU9jxDhlZaHJSAUXK/Xf5
   CzG8ep+Xka+0cuxzjhz931OCeSspi00WGB4YLi4rHnd47K2av9tJnfTPT
   hDLanqNUPYN035IPJpbrfLT4qleXQFt9SvskzTAkk+IJSMocMPmB41nCV
   0uQ1jCi0piSQcpaHAok17PeO+LbygDxtvXzgw7jRzeL7EfiZ2vvaJzMlM
   PA8QhmtNXUTdr5ELmQ30XX42YyNMB5+z8BGlePtn2hYN8VE8ti6B77X0w
   D8GmI6GsUfGAkHNQtgWI5aJaywXe9hfq5Ot9wa5doogrD/ctfSJyCcgZZ
   A==;
X-CSE-ConnectionGUID: /edzvRd0Sn2FK90DHQUgQw==
X-CSE-MsgGUID: pIIxNxOST9G6idGHWi3Asw==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37409749"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="37409749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 22:54:45 -0800
X-CSE-ConnectionGUID: gtK7BtuhTxGlVg3O7Ywy4A==
X-CSE-MsgGUID: rGeq7qTRSK2J5tCDoTJ7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="142655478"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2025 22:54:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 22:54:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 22:54:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 22:54:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNUe73oqhxPWruR0naKqdusOCVSNbg2j7PcLx7/8FimTlIZ6MaXeRfjXl8dUjXapvB5+4XrCWi042yz9NfRQCUWVMDMLaY8fmLdY5CvDx+Tovgm1HdbiefiYpc1RnKyauwfnPOdRCt5vBzDKha1dSxa2z/+//ZVP5UkbmcV9+1edCE1Si69983avswaCNnNMFVeWKTBHSMdLe3NP50qJilIBOv54wU5e7fqzR+sSjALzGV0bxj3mSasBFUiANIuZKD11ibWTjTg002HnEv6AfKh0YIOCsCK9bS64gyVVcy1mK7GStqcVMbUCjczsFxjB1w1Lrn3PTxHSscfNWcLvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=220b+hEHYLdwJ0kBAsK62UYU0cF+JjGzSuOt1bd1nko=;
 b=J/ink/SNS651BoIkbziKZDITyQTUSe5w29GZ2AedSGCwsRDzs2ks0gKhlruZdOKXGBZhe4zM9HnNcVE4R6eRAW/NXsJ4KQCp5LcYd2F6HoA4ZJkSbckS/RONWe+YF/xtmA25Ba+1aeEDs9liXU600zEGgXyrivgZBTVFsgxOFgB7bECRQRAvX/92xe8MdMYUbYhL3FsP7xRqkmMudawppUPgY4vPjCGw9guscNWkkg9Te2QVsWR0z3GfLpt0EbgPV/WXjErMI3XqQ7OOtigWQY5K3diJDfo7Yk7/ahvgsIJKjT5YCD4TVX4h9PyWl6csuIPqYMoqtRceKU7sZaBfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB6883.namprd11.prod.outlook.com (2603:10b6:510:202::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 06:54:39 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 06:54:39 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Richard Weinberger <richard@nod.at>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
	=?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
	"Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
	<tursulin@ursulin.net>, "Poosa, Karthik" <karthik.poosa@intel.com>, "Abliyev,
 Reuven" <reuven.abliyev@intel.com>, "Weil, Oren jer"
	<oren.jer.weil@intel.com>, linux-mtd <linux-mtd@lists.infradead.org>, "DRI
 mailing list" <dri-devel@lists.freedesktop.org>, intel-gfx
	<intel-gfx@lists.freedesktop.org>, linux-kernel
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 01/11] mtd: core: always create master device
Thread-Topic: [PATCH v4 01/11] mtd: core: always create master device
Thread-Index: AQHbXGTq3Ynz/rfH2UqisY27+I2b+LMYgWoAgACDNgA=
Date: Thu, 16 Jan 2025 06:54:39 +0000
Message-ID: <CY5PR11MB63660C230457299E1201C38FED1A2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-2-alexander.usyskin@intel.com>
 <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at>
In-Reply-To: <78709125.231818577.1736980238251.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB6883:EE_
x-ms-office365-filtering-correlation-id: 1e5b102a-ae37-47a7-a35e-08dd35faa5ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M3gyNXBoNGd5UkdrOENoZ2V4SkRrRGZHNjRUZzNML0tweHlLUHV6UUZ4d2xO?=
 =?utf-8?B?QnoxSTZuQTJLQzZKNnNML3V5UVNMbGdBYXRFR1FOM3o4TXR4djlybU11VEFH?=
 =?utf-8?B?WFZBZnhCbHpSNXRlVzFRRlZlUTZQOE9kdXNrWG54RnFsalBBT1k5TFB5NXYy?=
 =?utf-8?B?N0twUmNVRVFTZHZINmIyb0NtK2dPZ3B5SDFGNFNDMmFmVG9HLzc4a3Y1dTVD?=
 =?utf-8?B?aTFsZXZGaWVsYzJobDNpNVVHWmN3ZjFUZ0xpejJLRW1uMXpUc3l6WS9wbFlQ?=
 =?utf-8?B?MDVlUy92WkVjZ3ZHdTJqQXFzWUpnblErSitZcWs1SFdsdi9xTDgxbXFwRVVm?=
 =?utf-8?B?OThBcmxrdmVsKzdXeXNUam8vTGc0SUtsdG52Qy9xZWFhUnh2c1FXSkZiUFZW?=
 =?utf-8?B?dU9nMFIvcXFDR0tNUVY5ckNhQlYrbHFJMmhra2ZzbEdkcVNiM2pSMlVMQU9F?=
 =?utf-8?B?aVZUQU9JckFLS1cyOVZRNWg4eW9ySjZ0SW80OVNseW8zdStoQWIyOXFEVEc1?=
 =?utf-8?B?dWpjN3QxMzVhTlhxaERmMzZqVU9XRnhBd05zUXhqemZndzcvc0xiN0QveDdH?=
 =?utf-8?B?NGFRc3ZPYnhKR1RyWTMxdncyNWw5eTd4SUFrQ2R2SWtYQ3MvNDRQWEJHbU1D?=
 =?utf-8?B?cTM2WDBtaUIzbVcwbytBTUkvc002Nmhnc2xLZFhiNTc3YWFUVzhHL2tBbC9y?=
 =?utf-8?B?TzRTZWd5ZlZCKzJzU0lPV3pSZUJtWndEcUlHVUM2eXJFdG1YMENUSXJQYnhI?=
 =?utf-8?B?UmdIRDhCeUhPWjdtQm5KemJYZEtpV0dGeG9uRlJEZGYwTnZtb041ZlNIK2dI?=
 =?utf-8?B?WkcxWWErWmloSWFuWHZYY1NOcWlQWXl6UnkwZXZpQUNIdXl2YW5mN2IyRVI4?=
 =?utf-8?B?Nld4cUFTQi9uWk5iSUxzY1grRXB5dFlVaDBkaWhXa3pxdFd1TmJhZXNERnVj?=
 =?utf-8?B?N2d6THBWK0k1Nk1VN2lVSWxZT0N5V3ZEMi9lanZOM3lvOHExdFBWUTEreWFv?=
 =?utf-8?B?cnZDU0JUS0o0b3lwdUJBYkdHampjS0tyT2FqNEF6ZVR5Y2oxbUcrY2NxVG11?=
 =?utf-8?B?dGd0MVNyWG9IaFBuRVluUFUwQTNJTE9HZENXSVFvdXNmKytzMTdSa1djUzdi?=
 =?utf-8?B?cENicWlxMTNadi94NjhMR1Fwdnl4dk1ZeUN6WDRKeGpxSmVobk5vWHUwYm5h?=
 =?utf-8?B?Y01yc3lBV00wTjRwRzNFc1M5OGY5UnVOY3RvV00rMWlzbHBkcFk4aWk1K2RQ?=
 =?utf-8?B?alc3WW5ORFZjdmQ4SFBnL29EdlNEcGx6V0s2Q0EyblBFeHB4RlYxYmNyRXFN?=
 =?utf-8?B?WHJpam8yWVczZWhUQXlyWlJUUm0yL1dOWGd0Qm5hZUV0YjlHcUxBTFBDQmF0?=
 =?utf-8?B?aXhkVDhVZG91cE9HeU1rRmRjdHFnMnhkUlpFcm00T1ZxaE5jQkNuWW5IQURt?=
 =?utf-8?B?S1Z1OFZxM2dsRUFhaTc2OXJyN0w3Y1FqUWYvZTdmVzZidFAxQ3RsUlkzSjF0?=
 =?utf-8?B?YXhRSlZHVXorNHJ0NE80K0VpVE5ETlM0THNieldUZ1pNUFlvdmZSNEUvczNK?=
 =?utf-8?B?U09KZERvbjVIU3QyaHNEUHArZW45cDdORTFLWno5c3M4MHQ2TVJ6QnFvT2cz?=
 =?utf-8?B?RkNIN21pWFJCVC9RRDJYcURGaUhMZjZsSGo1b2FJQlRoR2RGOSs1TW9SeUc2?=
 =?utf-8?B?Q2RYMlRTaHRQYjBIcGVBaTg2OVF2dmpjMllnRllaandnSURsVmdacytwVkJD?=
 =?utf-8?B?QVNNdE5QTnVydzJRQWFSaTdHYVN1NTNRWFk1d2x3dHljNm5aMlhaUmNSbFdJ?=
 =?utf-8?B?d04rMXpNRC9vMUVmNUVTYzV5dmcvY2U5SGdhSEx1VzY2WkdtdC9QcTh4OUNn?=
 =?utf-8?B?cklrMWx5TXdHL3ZrUnhJMW5kL2lzMHlRTHRJWGJjVEVqeDdoY0RZMVgzZExx?=
 =?utf-8?Q?udUg1VD4TiqBWQqhwr2KP+8AS9OEJUDJ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTVTNFljVUtWNmZLTG1RSURLa0cyaE56TVNveEE3Slp5c1MxejJFM1VOVVk5?=
 =?utf-8?B?bnQ5aHpVZUNwRVBUOWY0R1BoM25sVlNwY2p5NlBkeTRvN2NIc0lIZm44djJU?=
 =?utf-8?B?bytzcjlVZXlmd2pDTXpVN1k3MXczT0R3M2txZnBKVjUzbGVRRUxqeXZGSFVt?=
 =?utf-8?B?VDFGU243S0g2Q3F4U2pFcXo2eWdvN2lNa3poQU1jY3lQNEkrRnJHcjRYMi9H?=
 =?utf-8?B?c3BCMnlnODVFYUNtblRNRWZxUFQ1RzZGek1ibnBCazQ3NExRV0ZCTmFEUmlD?=
 =?utf-8?B?K1d1UVRpcXhuM3lXRDk5M2dMMjBHUVQ4VGFNNjZYdGJhMEJ5V0I4REM4blhY?=
 =?utf-8?B?K3NIY2pvRzRmUFltaFhFOHlZVFhTejgvNlNRWFpNVHVaRlFvaHpvNWhxSzB2?=
 =?utf-8?B?Q1NSMmFZU1ZpRzJZRFJhSW9EalJTQ2lWV1o3T1VRYTY4VEwvQlBneW9aWDUr?=
 =?utf-8?B?K2dqL3p5Q2kySUVOSFRyNWhYUWpzK1RxR1hIYUlxM2FrSkRhOXNlcXlaUWxX?=
 =?utf-8?B?eTRhN1hpZWRxZnMwNmJJeEdLZzErZkN6dnhWeVp0VCsxYm1SMWVQcWZvVDNX?=
 =?utf-8?B?d3lDUEFSNGdDN2xlbzZYcW5BQ21vM0RueTZPNHFvc1FHVVhSc1QzbXVpRkNm?=
 =?utf-8?B?UnFMMmwyWk9neXFjaWhYTkpsaXVPby9PMk1qcnc1YjRmNEJmZTVwK1VwYkwx?=
 =?utf-8?B?RHJ4UGh3cHZFbE1OeklUY2pVbDE4RmRQTGQ3OURHMDlFU1JyeDJHdmVOMEdR?=
 =?utf-8?B?S0Z5Y0RiNXZOZVRuKzNud1RTMGlqeVdVd0xJTHpCaXU3RjdUNUg3MkNyMnhH?=
 =?utf-8?B?SFF2bzM1dGhHcEVJUy9UMUJ2ZThjWXNCZ0JNVG5IMlljQ1AyNmtVUnI5b1Nq?=
 =?utf-8?B?dlFOb210aGxmL09aWnNTRVZGK2dqTlpuSTRJUUQwTjMySDlmSTV5SmdrV3B0?=
 =?utf-8?B?WTRCUllRM0doQ2Y3UG4vckRPWHdtSk5leW42RXgySW1BQS94TUZvTFkwTkN2?=
 =?utf-8?B?M3JzcnNIM01MRTVnblArM2NMN1hoZXR2cDJwTThkWVhjcjZuYldrUXRtejRw?=
 =?utf-8?B?S3VDYWVYZVBldnkrbGs4K2FvTkNpNHlUN05pcnM0Zk5EQ3Y3V3dWV2UycS9R?=
 =?utf-8?B?SkZpMTd1UEN1RVVJKzVUcTBQejlpNGpzNzN5THlVUDh5YmRKeTNpbE1vNEp4?=
 =?utf-8?B?a3ZGeEFKY1dHUHNwSmdSbEZZQU5tbHBvVzNucHlTSFZNMDVzcFQ2Qnh3NkNu?=
 =?utf-8?B?VTdDYlBxT0JlUm91NVEySC9TTjZQWnR0RTRxYUcwOURnYld5OW9nMmZ6anFj?=
 =?utf-8?B?RkdsREpHY3V0N1h1N2R6VjYyUEFOOUZoUHlqdjNlQWlnektPWXEwZ0xrcm5H?=
 =?utf-8?B?RWp5eDVKRU1VcTI1c2g0OW5oNytHVDhNcXlleGZVQjNySWZWY0FVOGhQclEx?=
 =?utf-8?B?YjBDSStJT3NreUhRYzE5Wng0eHkvRkVZM0g3RWM5cllFYi9yYktVaDBCZFAx?=
 =?utf-8?B?eFJsWGExbExqdlcyQjZSSnk0RzdZZExOTWhOY0thSko1bHRMM242dHBCTytS?=
 =?utf-8?B?clBiTTM3bWVXUjhuc0hEeHNQNGdKeW5hYnFZRWhRcHUxSDlBN01BVE02b0Zj?=
 =?utf-8?B?cE1vTThuNURwbHdXUUxPcDZpWDJDdTR1bjVUMkRnU2xWcExMc0Y2K2pCRWFt?=
 =?utf-8?B?U3JRNnl1ZlUvT013Y2V1eGlvSEJSQVI2SVAzbGVMQ1RvVFo1T3R0V1VrbmxK?=
 =?utf-8?B?ejdXYWY4RnI0Tmh1NFdkR2cva0NvaTRPNUNBQmpJdWtsemNHMFZ2enRFMWl4?=
 =?utf-8?B?a1JqWGUyS3pXVk1TTThLYVZFd01RdWlpQlBPVTNnWng0UVpFMFk2VUJVdUFW?=
 =?utf-8?B?M3J5Vng0eEd0VUVZSWFmMnNHZ1lCNldmanRhU2k3YUt6WTJ4UERSQnVGZVJM?=
 =?utf-8?B?VzVvOFRIelI4WllpUGlTcTYzZU96b3RwLzQraVB5VFpwTG5hZm9NRnc2ZS95?=
 =?utf-8?B?RWNSN2xSdWNIeDArOE5RSFp1ZHFnZjUvdEI3cVViRmNNOW1SNWFoTHVidHVw?=
 =?utf-8?B?b2cwSDloQVFyZzU3TXBuRXFCOFR6SHVxK0Z5NmhCd0ozZk4xanQvZ1VJc1d0?=
 =?utf-8?B?N3MvM3JsUlRVSk82dzV2aW85eEx4RHpQYWpkS093aTAvS3Y3bmMrYit3SUxa?=
 =?utf-8?B?M0doM1I4U2tkditoV0dEK1hXWmtKU0NkOTdSb0M0Tmcwc1lRdkVPVytCQ0Nt?=
 =?utf-8?B?aVFPU1VXZHZBWmNJaHZTVktQdXRnPT0=?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5b102a-ae37-47a7-a35e-08dd35faa5ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 06:54:39.5651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3GxubvAZ5DmVEgsCCGz19LuBtCshNfgJPn46MJwqIglUDc+aih/r8Wc4tfxoRtOIflQqbFgIEKSS+vnCPwPt/hAxX0ari962ZjPEyGXgZq4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6883
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_225447_912777_2C64FAC0 
X-CRM114-Status: GOOD (  22.35  )
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

> > Create master device without partition when
> > CONFIG_MTD_PARTITIONED_MASTER flag is unset.
> >
> > This streamlines device tree and allows to anchor
> > runtime power management on master device in all cases.
> 
> Please explain in more detail why this is needed.
> If this change makes the overall situation better and breaks
> no userspace, I'm happy. :-)
> 

The rest of the series is a driver that need runtime power management.
Absence of the master device breaks power management logic,
as kernel automatically propagates state from children to parent.
I initially hooked runtime_pm on chip auxiliary device, but this is a hack,
not a solution.

> From skimming over the patch I think the mtd_master device completely
> useless for userspace, right?
> 

As of today, yes.
In future we can add curated sysfs with common parameters for all partitions,
so user-space can query master device instead of one of the partitions.

> > int add_mtd_device(struct mtd_info *mtd)
> > {
> > 	struct device_node *np = mtd_get_of_node(mtd);
> > 	struct mtd_info *master = mtd_get_master(mtd);
> > 	struct mtd_notifier *not;
> > +	bool partitioned = true;
> > 	int i, error, ofidx;
> >
> > 	/*
> > @@ -655,6 +678,11 @@ int add_mtd_device(struct mtd_info *mtd)
> > 	if (WARN_ONCE(mtd->dev.type, "MTD already registered\n"))
> > 		return -EEXIST;
> >
> > +	if ((master == mtd) &&
> !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
> > +		partitioned = false;
> > +		pr_debug("mtd: unpartitioned master %s\n", mtd->name);
> > +	}
> 
> So, when CONFIG_MTD_PARTITIONED_MASTER is not set and a driver like
> MTDRAM
> does mtd_device_register(mtd, NULL, 0) we end up here with partitioned =
> false,
> and allocate just a master device but no real mtd because with zero
> parts the mtd_device_parse_register() function will not call add_mtd_device().
> :-(

Yep, missed this.
I think that we can create master after partitions and condition it
on master not created in partition phase.

> 
> Thanks,
> //Richard


- - 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
