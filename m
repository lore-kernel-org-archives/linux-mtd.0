Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D0BC83F17
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jul 2025 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5Q5y+n5OJioKfXvd2P701pCglKHcNsTAsXKkmKmTnk=; b=hQXQHnWMawS/Gl
	Zdwhmzrv8nvdnZPvbm2ZZ5FO+MW7teMe8kxPf3bY5GyeCuDup7Uq9fSrilsP7tsWkNRnFbYSlNr5r
	Co7YNlGN5Xc+wN7Fo10/gIUA0MAcr6yM+CKfquZ5X7814dqhAn2yn5yrBPyCb6TSCe/EVNKOu1ekL
	6JlwCgbw+vOy2UB1iNXA1+3cERkHfdSsqtbM8I2JYSmtNdgJFbS90tApWOsxoAnYLDqJnRttWA/BE
	g98RQlG1blisRm9vMUZWEbtpo4/7E8qxzY10DB09J0gOGYflQbS4+SDI/01GqKfhquOMU5QVB/OX9
	C1MzuRcABBhEWz8dh2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOnP-00000003B7L-2bmH;
	Thu, 31 Jul 2025 08:37:51 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOiD-00000003AQr-0ghq
	for linux-mtd@lists.infradead.org;
	Thu, 31 Jul 2025 08:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753950749; x=1785486749;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0faNv83yCmIErsl6Y+IXCIxdXZU3g8OH/csncwqmfVs=;
  b=AMgzJrlwacf2o45BczAiTSE8hEYmwLyfAOFwVJNFJmejQAo1yeyB3KMV
   Rb93gBSWhEL3BvbZAwxJPG194Qh2bvbySbbzBT+vqERg7+Pw/VqSrOivp
   50J6D1Ij+jvAGNYjVbvoZrIXVEiZcKdUFOwEAPTxVeq3K1YBPiKs1PF88
   bi2+t4pyP0z1TYU1kMK0YF+iNOZsAOyiMlK3Sy1Bap6yyU5JVpzJuG9m0
   KaWIivHKK8SM4ZwtWazJvU47nr4wrbDdWq3ucD1/drrjzQ/2k8k1j+Y6S
   Lz5VfU/4bV7l/UuHFrBoLiAzqad1djVduQ0WR++u11JCXcLlXbc7YH/Xa
   A==;
X-CSE-ConnectionGUID: grHfoHYWSGiMrNxzSkANoA==
X-CSE-MsgGUID: EM1uWXe/SZee5YfMEvks9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="66537321"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="66537321"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 01:32:18 -0700
X-CSE-ConnectionGUID: 7oJ4eJskTOm8Gi7i93Ekog==
X-CSE-MsgGUID: d9q6BLhnRXynIMn56gDWMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="163228573"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 01:32:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 01:32:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 01:32:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 01:32:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lstda+YgD07tsDq1DPGfo8MkCiyPZFNzyWNt3x26aZ/aSxd/JQmylPuXvSYvRKSJTQgBDLknLICU2IvghpHOh0GeKDaHvrY02CGFbTT1xs5s2VBFrAYhSXETm5Ubiib3v+ty/8oZcXkhDK8RmlrY4CJrKE4UfTvv1KNzhQvTXopImkW2NvZsbUqHp6YeKMjPcvDE1VzMzp2ojJNSIEjhuSZIXnZQlvEHtfowLbBQJo2EWJvXSLD9m84LWmCUIIZD4XyZ9vuksJY0M+s9YT9C8UT/dNWTwpg52rCObYLi8AO34oVmHtNIOemvsMfS/74v23NgVBxSs3uoHAupI9yehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0faNv83yCmIErsl6Y+IXCIxdXZU3g8OH/csncwqmfVs=;
 b=YARqkRYmFs7DOFYTELb1DIZiABGapvadHuYcgW1mGsgIFyNj8z3V+0pcSgKdflHEQR4iMtz7NOF4i+VOBXASnE/9dczIWBZ3rdCEX3UsRF2zMt7dTx7ibN9PpoVEHqzI6MpVb1HkakqCW+7n7BKW5GbcMePllT7upFCCgEuRe8GvLecAB6Rc//AosNqCNPqdOw+yqn3/dM9BB6ZCN1t7nXw2TqtpqBZhZR+OxPPbTeh11gUIMU9TPcRm75QpKciH9Ajk81bN1atXLAbSUPSOTVfqTA3u7gxV+WVLXrccwU5RHaAA8eOVd0FlVqN+Ysee4o3z916nN7fImsHT9rdsDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 08:31:24 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8964.026; Thu, 31 Jul 2025
 08:31:24 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "Vivi, Rodrigo"
	<rodrigo.vivi@intel.com>, Tomas Winkler <tomasw@gmail.com>, "Jadav, Raag"
	<raag.jadav@intel.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
Thread-Topic: [PATCH] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
Thread-Index: AQHcATvO9HTIDCWzyUOkCb+UXhZeGLRKd+2AgAAKEoCAAWRwAIAAAdjw
Date: Thu, 31 Jul 2025 08:31:23 +0000
Message-ID: <CY5PR11MB6366BE84D8D6800CE4282691ED27A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <07f67ab8ee78f6bf2559131e193381aafff7479a.1753870424.git.geert+renesas@glider.be>
 <d947168fd02d6f820159b456099e6aa8f465b633@intel.com>
 <CAMuHMdUJF6V4v1+zbKKG1A_UvHUXU-ySXe7Xj_ryZtRnk2B2nQ@mail.gmail.com>
 <b58c7cdee44b573c84e0f79dad2655f8286bc89a@intel.com>
In-Reply-To: <b58c7cdee44b573c84e0f79dad2655f8286bc89a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA2PR11MB4891:EE_
x-ms-office365-filtering-correlation-id: ba2270e5-a81c-4fce-65f8-08ddd00ca270
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?c0tPekxMSXNYRFhZYUtscDUyRThiNjFmV2d0OTBkdmVkSW9qbVFpVWJjRWNS?=
 =?utf-8?B?SkQ3elZKZVc5VmQrNGtUd1dRMzFjTUt6ZUZyUmZza01TM2gyQVBGR3dkUVBy?=
 =?utf-8?B?UmJDZlArR3hTNm9JNWRmOVJNaXRwNXJsU1Y3UjNBUk1WQzRWekcydG9xcGpl?=
 =?utf-8?B?NjVWdktYN0dNRWl6M05maFdYYkl5M2R3M3g3bFF6WE80TjJ3SU0xU2hOSXA4?=
 =?utf-8?B?Y1ZJSVhjZXJJU1h4TzBxTTU1ZjVrVEF4TmdkRFYydkEyclBKL2VxV0xINTlU?=
 =?utf-8?B?S2R2VHQvQmxmSW56TFpzUStzK3NFaUhVckhPamREUkJqeW5SV3dSTUd1dFpj?=
 =?utf-8?B?aG5tSHNaSVZuQjh3a20rRWlmREdJWHJvQ3g3bkFrTFp2VzdJMVMxb3kwSlJw?=
 =?utf-8?B?MUVrVzMyL1BWNEo5MzBmd3dWZkg0MVp0N2tqWUlxMC9XbWRiTjFqZExXOE0z?=
 =?utf-8?B?MzdtTWRyZFhISUZDbC9GRFlucVRlTkN2ZVpRaURCRVlFMzluZlJmTlE4cHRv?=
 =?utf-8?B?dTBmZFlURFFXZ1duVCtDVElSMFVYbllCeUJTaGNFdnQyalBHRGJKVWRJNGd5?=
 =?utf-8?B?NVpTQm9YNW4zazVvSmxPNS9rV3VkV1IrR0lTeHlsTTl2MlViUFdrb2hyK1ZI?=
 =?utf-8?B?RGhNSUc1U21sT0QyMTFhc0pHdE41QnVnQVM1QjdqQ2JEQ0xKWHJ0TkI1dHdq?=
 =?utf-8?B?cVRSY1F1dVFoeGt3Y1dvdEEveGFZOTB0L01VUWxCZ29QSkh4U0ZLdzZ1UlVB?=
 =?utf-8?B?ckJMOCt4enkvYzBGQjFZZVBzMmd1MWZiN1RpTmtKQXB0aVJrTi9lWWpJT0Jp?=
 =?utf-8?B?N3E0S0JLVGFFS0hTK254SGphTHFSekhvMytoOGovRWRxcHF2L0JBZ1hKTzJx?=
 =?utf-8?B?SktxV01DdDhwcW1QVTQ3OFI4LzIyVFJQSmx0dlRtd2NhRUJtdWlWL0c3SWNM?=
 =?utf-8?B?WFR0cHFEMktqNU9SZDZ2KzRMc25JZG80VGp4enR2aHdwRVkwNHFYOXF2bWJZ?=
 =?utf-8?B?VjVJaFlqY05CMDFrR3llNEM5YnBtLzFBTmNhUDUrQ3UyZTNNSm52eFBNZVo2?=
 =?utf-8?B?T05lay8zcjhlL1VFMy9MSTRlT2MvUEU4cmNBczFRakJlOTFGYWRvd0J3T3BB?=
 =?utf-8?B?LzljbzNtN2k0cFAyd1NaVHUzeHBIQmpQaGZBZWFZaXA2WWwxV2V3cFRaZWVo?=
 =?utf-8?B?cTluU3NZZUpld1g0RitkQ0U2bWJLLysrQjcxTTQ3WlpjS1hoVzJkOE1adFB4?=
 =?utf-8?B?d1J5STN4b0U5K0ROcUhibDgraDhvUG11SERJaDNzVUlYTG5ONkprbFUyNGFI?=
 =?utf-8?B?TlpjWE01YjRDc1R3SFAwamxidHJvTHc4azBERmxuVzVpZ212dFpJdUFNZ1ZQ?=
 =?utf-8?B?MktTVTlyNmVHcXJ1YWZSNkZkdElnS3BBZksxTS9tVEFybklPeTRTQ3R6YXN0?=
 =?utf-8?B?dUhmNUd3NEdVWk56cEphNVF0aUJFS1FTQ1BLU0xmZjhmLzZQNEZTRzBHaXd2?=
 =?utf-8?B?cWk5OExRV1lkdGRhT3kzMVlZZUJiaE9NdGp3ODZKci9vdkpkdmdRNEgraG5X?=
 =?utf-8?B?Z2d1OHIvOUJVeU5ISFlkbnpmSlhCbjQ5OHdaUzd2MWUvdnVlajNxMEZYSWR4?=
 =?utf-8?B?bjcvaEw5UW1ETUloTG5YaXhSdmplSnpFYW90MzJML1pLQlZtOHViTEhiZ3ZW?=
 =?utf-8?B?YVZrWkZ1OFJMZytHNURyOWQyRFdxOVJiRDJPY25YOS9TQ20zVnd2d3NISVhF?=
 =?utf-8?B?LzExMmhyek4xS2xxVnA2bCt4V1RvSytWV0JXb1dIWWc3bFd3V0c0NEVQcVhN?=
 =?utf-8?B?UVh0ay9zVFFWdUptT2VEbi9xbGtFUmw2WnhINTZsaG5jZDk5ZWJUWmQwUEdB?=
 =?utf-8?B?a1NQcVU0a1R4QXFoMEdxdEo1bjZMN0Y0UFFKbUYyRE1MMFZ2N1I4LzdvL3Bl?=
 =?utf-8?B?aDQra01NQnRnaFZhclRTNnNTci9ScldyNjh1eTZLVVFnZEZqR3hQWE0wejJO?=
 =?utf-8?B?c2JMbjdFMnZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFVPYmJwZGJXV2IyT3dDSlpRbjFHRnVhWlRNWWc2b2xlbVJmVGdGdjlneE5r?=
 =?utf-8?B?aFhaVkdRZ0xvTDk2SnA5ZEUxSTN0Rmp1OFM3Sjdyb0FESmpwWm5aakxuTEl6?=
 =?utf-8?B?YWI0M2Y2dG5xYzZIdnR0QzNqak0wb1M1UHliaGl0Y2RvcmJiYWpzV3lBQmVO?=
 =?utf-8?B?OW1ORlE1UHRvejFxek9ORStFd0ZwTHJ1SGIwUnEycURTMXFkeSs1RjFtVzlq?=
 =?utf-8?B?YXlvT0crclBCMWRxTzFKUDFrQ2ROWXprSWxkNE0rd0ZhN3cxVERCNlI1WEln?=
 =?utf-8?B?bVkwbW40eGlnMFg0b2k0UFg1YWttU21Ic1hsTnhFR3BtOS8vaURjVHFiVWtC?=
 =?utf-8?B?blJtMnpRWnRURnZKRkRVL1ljOTFUSEtQSTVMdUMyekdIWUdEbTBaMHhySWdJ?=
 =?utf-8?B?N251RmZBWmltVU1TZVFaU25zNUdXQlAyZlVvdm9ieU8ydTJzUkxDSlRrTUJZ?=
 =?utf-8?B?MGJjdWtyZ0hOWWcyMk43R2VkTmdZa0cydVdVcW9Za3QzN3VLWitsU0U4Ynpt?=
 =?utf-8?B?ZDBBTmFpOGp1ekg1bXc3SHQ4VytSSmE2dGc5dDRVTVJGL1RHWU85NmpnWmow?=
 =?utf-8?B?UkY0a0FaRWxOZC9VZjBhQXBlbTcxSE1Ldk4yQTRCOWYva3llUDMwSDZYMkt3?=
 =?utf-8?B?eXlGcE8zVUpSMGZqeVhHMUs0WDkrVnIwVUE0RkdCbGJsT2xiVjc4S29hNDhG?=
 =?utf-8?B?eEJFQ3V4czEzQzNXV1hnUHlmQy9UbjFwWU1sRXBCWENTbUo0ODRSUS9ZL05K?=
 =?utf-8?B?dzNIbHl0WHZvblBFYkFUSGRJaE5YRHczNmtGVnllMnpabUFraDlGTFhwMktB?=
 =?utf-8?B?aVVtemZ0bzNJNFB4dkkxeWZuZndoSlViQzU2NndpeDI2L2JJZmFWWEVtZVox?=
 =?utf-8?B?UFhLd0FHMjJnOFBnT1BTT0JFeWVtTnhmUEhhekIyRlNST0JHM0FaQ3ZaS1VE?=
 =?utf-8?B?Q2YwYVJhTllJVmNKTUMzTWxPaE9ZY0ppajUzYW9hWHl5b2VoUlc2cHd2NW1O?=
 =?utf-8?B?Skc1cnRCZXMzR04vQnhTUHFaMVdra1dleDlyWDNMT0Y3ck1Eekc2dTQyQTVr?=
 =?utf-8?B?MHRyMEo5dGxUcU10WDNpUzZzZ2g4Y0FrRExxbU16VXZEbUpzeWxWeUVrbU8v?=
 =?utf-8?B?cy9HYmhrWXRZbTBBZWF0ZGoybzRHZGFXUVpKUXZFNUtUN1B2bHdGclhsRUFK?=
 =?utf-8?B?aDFkTi9qK0plZW1sZk5ZcXJmRTFlclJ6VHBUSmdZQWlqZ0JtZ29MYnVFenhq?=
 =?utf-8?B?cmdZZERpTjVUd1NDZndwN25JcHRZcFV2ODlpRzNxeDRwcmU5K04zNm1Gdjg0?=
 =?utf-8?B?U3BQY2xGaHlZQWhmc3pnTmJFcWkyYzRtVVRrRGRUZXRjTWVqdU85V0ZodDNR?=
 =?utf-8?B?Q2lBM1E5OEtHSVNSVXAwOXZ0aDg5TTVocXllcHBCMmFENXYrTkRYVjZlRThw?=
 =?utf-8?B?Z2xrZjYxd2l5M3JDODVmcjdicDYxNnc5Z0lWeXVKY011UHVzWWFQWEhadFpK?=
 =?utf-8?B?c3psZHFSMFNWS1pLUFVlMW10bDVjY1dSSXltcTcweWp6cXdzZDBRd0M4b09G?=
 =?utf-8?B?MzV5U3BIeEtmVWdtc3lhWExZNnVXWVVRRDB1K1NVMjlYZXN2azJiY1dJbmJV?=
 =?utf-8?B?QWRjV2tXWHlmTWNZN2JOS0VVS1ZjK1lhdG52TmRlb2wxU01PcGlaRXJWS2Nn?=
 =?utf-8?B?S2dERXVUamp6SmFrVStoK0YyTVI3VTcvRmJ2NEpCS2ZVNGV2YXJtUUpiOHZk?=
 =?utf-8?B?Umw0VlA1VmRLQllXcDBVKzE3bmdhbitPVGFEd01pa2czQ3ludDBuUVBqUmYr?=
 =?utf-8?B?bFNPdDFURzVuL05YYWZneFJrM3Y4MWI5YUFhWlZ5SUZKcDlvZDdscjFMRUQ0?=
 =?utf-8?B?dWNQMFJoYkxpTWNhOGw2MFRROGxQMzE4dmNyNlNLM1VZc2liQ1NXaldabWtw?=
 =?utf-8?B?WjhmVU9kVy9iSno4L0hIazJUSnFTT3JHQjI0Kzdwa3gvbFlSMktJM3cxK1o2?=
 =?utf-8?B?M2FKZFZTYnBXU1psdWc1cmZxMjJudHQ3Q2J5ZURtNnRFR3VhcG5WOWVoMXhT?=
 =?utf-8?B?NHFSYkdTWFFNdVVyQkRxT28vV3JQaTF3eGpESW5UaFF0dXBrQ2ZqTXRnckFX?=
 =?utf-8?Q?aUGYokEhmKXKczEfZgquvDH14?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2270e5-a81c-4fce-65f8-08ddd00ca270
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 08:31:23.9685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XWHy/ejjprp7ag4I4Npr6ySdzthOtuNATKbW0556NkMewLqfz78MA5oUx3Vz2fu6n7qoAXo6aJzm0MfTWdpg5dG0AwyIVYqZZrTbCr2462o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4891
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_013229_266482_D589FC60 
X-CRM114-Status: GOOD (  26.90  )
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

> Subject: Re: [PATCH] mtd: MTD_INTEL_DG should depend on DRM_I915 or
> DRM_XE
> 
> On Wed, 30 Jul 2025, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Hi Jani,
> >
> > On Wed, 30 Jul 2025 at 12:32, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >> On Wed, 30 Jul 2025, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> >> > Intel Discrete Graphics non-volatile memory is onlt present on intel
> >> > discrete graphics devices, and its auxiliary device is instantiated by
> >> > the Intel i915 and Xe2 DRM drivers.  Hence add dependencies on DRM_I915
> >> > and DRM_XE, to prevent asking the user about this driver when
> >> > configuring a kernel without Intel graphics support.
> >> >
> >> > Fixes: ceb5ab3cb6463795 ("mtd: add driver for intel graphics non-volatile
> memory device")
> >> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> > ---
> >> >  drivers/mtd/devices/Kconfig | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> >> > index 46cebde79f34b0b7..f0ab74d695347117 100644
> >> > --- a/drivers/mtd/devices/Kconfig
> >> > +++ b/drivers/mtd/devices/Kconfig
> >> > @@ -185,8 +185,8 @@ config MTD_POWERNV_FLASH
> >> >
> >> >  config MTD_INTEL_DG
> >> >       tristate "Intel Discrete Graphics non-volatile memory driver"
> >> > -     depends on AUXILIARY_BUS
> >> > -     depends on MTD
> >> > +     depends on AUXILIARY_BUS && MTD
> >> > +     depends on DRM_I915 || DRM_XE || COMPILE_TEST
> >>
> >> I understand the intent, but IIUC auxiliary bus usage should not require
> >> a "depends on" relationship. Couldn't you have MTD_INTEL_DG=y and
> >> DRM_I915=m just fine?
> >
> > That is indeed a good point!
> >
> > What about
> >
> >     depends on DRM_I915!=n || DRM_XE!=n || COMPILE_TEST
> >
> > instead?
> 
> Fine by me, up to Alexander.

This variant is good from my side.

- - 
Thanks,
Sasha


> 
> BR,
> Jani.
> 
> 
> 
> --
> Jani Nikula, Intel
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
