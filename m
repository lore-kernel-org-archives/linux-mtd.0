Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EC4C0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 09:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtkzZYy9abGVvL4D80zVN+osQBHzTkFm+bZIf1ieFjA=; b=a6LAXpOeh7Ia1J
	DJC+ZiVX4R5BItWQ/H//Pxmf/yNGyf2r7+hkYTmBppxK7M0lDZFL2oIE/FoNqINWRTTRsrK1UhbH3
	3y4WUADm7rH8gIgCMatcdwIaYUoNWsxzYN0BJ5b4BGDaNVZ0EfTaRzCx6Lm8MBoXQmxAApKIXdKZS
	0o0mEgD1U5/cmfNM/+C/etjARMs/DwJNoPygkTClCpF54FIVoZcNm0CS3OjDelWpu1NNzS/FiBc8I
	kB1UZ2qHEDL/iv++TP21urPc7A9uo7rH9lqxagnNwQpDaej1h11s5qoGIFtib4TgquPEFpW0pv3dk
	4ocHRO20gcrwNKvINFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td3wF-00000006bE6-22uN;
	Wed, 29 Jan 2025 09:00:47 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td3wB-00000006bDj-2MwR
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 09:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738141243; x=1769677243;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q9atCY8bMtRJvbbpeAUcH5OkmMTG5iWil/EYnjuxOug=;
  b=OC4XLJeOHaSALjlOhobJqhrGMtbmPsEgnDE6YErOCnjQxe5j4ZKCMiEh
   3MFtndYjaYoaVsJJkWCbkLOmppDzKAOS6qL7zR00L/oVNM8A0neXrxV7F
   cFfKn6bJZqL3xHFiWB5D38I5lpk+A8pMndfNKYLzkPvug2utyQVwUYOQR
   0bg2nxVeKARw2jm67bpmwqB9KeUrESC4WKwOJL/7Icrk8hM7I3Doc8xVw
   GOhPuZaszeVArbvePIvPwX7wTnGeCCBc9CeJTwJKYUUXh5hJZc7SmRfeB
   YNKXH8YD+U9Lu+GSNw2xTbbpALbo5zkKMrriafVHukh2JWxuA7iAfNVxN
   A==;
X-CSE-ConnectionGUID: 6GGgCYZ8T8aG8zDpO8kIyA==
X-CSE-MsgGUID: NQsHAWplSJqlNc1hx+SEPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42302164"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="42302164"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 00:59:26 -0800
X-CSE-ConnectionGUID: 7gh5pXkdR3CH+osUUTYfOQ==
X-CSE-MsgGUID: B0dxHreNTjuqUL2oVX40sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109886755"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Jan 2025 00:59:13 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 00:59:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 00:59:13 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 00:59:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXcvvUK4NRUgbgE9dNDv8C2xYfmNsH20GvA6QJW9n96s8u6Wrti1tfR6ArkYifJEcrN3vfKMfmVE66ENWSi95b68i5nM4H3bETluXoK4TfHk/CaFtomsAjqI9GPK1tXmgjtxNDr7mGKSEK//1P/vGGgvHAGvEAMf+C+Arv5bU4jDKv2Rx+V2WLb81XO1TwNjFiDXJ2cZS+Tz1fB4xVQI2PgOpw1x5tCtA5/AJsDU1j2EMMA2SD1+P+rtQSeRccStQ5PCaozWse2AIx/UpugeflI1ynRPOkdxQ76uoY4a4kEaEdHu6fQDWxQh5oOAkdcOckRbYWCiX7VSEQMDkkUS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9atCY8bMtRJvbbpeAUcH5OkmMTG5iWil/EYnjuxOug=;
 b=ZbLk++zX3CzCKpgyPgS9tzSaKvChbOZdT4VoOj4UcgFby/eRx7W4cyyh7ICJObQQ0nlYALJfYj0aPYIzG4p7wi+HG5sYx76qsjvjfMS0DH9qKpu2ofTXqO59Zl7A1TjP8/1Btb86TF6/pf3xaXsg90p/0XwIwq/aTF517QQLQLroZckNZfHokxM0hDN8xHzbVbagsVhgJ21i68E71IfeY9r1XfY4ILRm4lZxOlIRvJPDRbf/I5mA0ov0N46rvr19sAA++Nb/v92k8qHax9XMFIpFQFXwXL1TYtm0qoVqkN5uAhRhhit0UKj9w08/mwFTQwWz46QzRGQgZpaRztxR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by PH0PR11MB5031.namprd11.prod.outlook.com (2603:10b6:510:33::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 08:58:56 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%3]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 08:58:56 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, "linux@treblig.org" <linux@treblig.org>, Shen Lichuan
	<shenlichuan@vivo.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] mtd: rawnand: cadence: fix incorrect dev context
 in dma_unmap_single
Thread-Topic: [PATCH v2 3/3] mtd: rawnand: cadence: fix incorrect dev context
 in dma_unmap_single
Thread-Index: AQHbZ8ZV54NjqKr2okmLe+RdIvTQZrMhBZQtgAyBXpA=
Date: Wed, 29 Jan 2025 08:58:56 +0000
Message-ID: <BL3PR11MB653275BDFAB8FAA2EC499666A2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-4-niravkumar.l.rabara@intel.com>
 <875xm8pk4n.fsf@bootlin.com>
In-Reply-To: <875xm8pk4n.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|PH0PR11MB5031:EE_
x-ms-office365-filtering-correlation-id: c4fa3b8d-34e7-4d96-303f-08dd404329c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TmwrVi90T0lrczd5aSs5TFF5WDdsWkYrVkcxZ0hNTk1ndThod0pubkFzZVkv?=
 =?utf-8?B?dnp0M3hlMnVIRmJ5V3o1NE93aGVEYkZmbUdkL2VmTmR1Zmw4YzlTYzNNNFVl?=
 =?utf-8?B?Q1FqT2FFNjlIakhzb2RYQW1xZkxESGFIZXczMTdLUTlGWkRiOHh4Y042ZHV1?=
 =?utf-8?B?WnFuaEdiRTN6bzkybEFkOWhra0Y0bWx0V2E0M2NDUllYN216REVoVGZVb1E0?=
 =?utf-8?B?S1hwOTRNSHRLaCt4VU0zMWJoRkZGTHV5UEdmVjJDOXpCV0lzOVFHK0JoUWNX?=
 =?utf-8?B?SDAxditycWpRK2RhdExIN3V5THluNGVjNmJWZVMwd3o5aHVlUFBsYktYUzg4?=
 =?utf-8?B?YUFyMnI3cWozY2FMVjJ1YzV4MlVKZzhObTQ1NFhEdzQwVlQwQWM2bGw3V3pw?=
 =?utf-8?B?aUVzak5CYXNSekNDbW1wTlVRL2FVeEFtVXNXOS8zTEZEalhYNFdQdE5GTmFL?=
 =?utf-8?B?TVdOejY2czVmbW9pMVFtTlhiRWFhYXdqN2dadTZ3eW9jWTZHT1hvNkJ2a0pS?=
 =?utf-8?B?dGFrNGEvUHppbHFGSCtwenY5cGhlcERTRmJQSFBrNEQyeEVIT2s5ZTRzb1Er?=
 =?utf-8?B?OUJyN0tnMnY5dnpjUW5wYkIxZGtLVnZpK0dlRExQcDU4cW1ZSlZ2Mm9zSmJl?=
 =?utf-8?B?ekQybnNITDN3aXRrc2duSUxzZFh3d25BMWNkVkJQZHBWSEk3Yjc1U1lWTkVD?=
 =?utf-8?B?SnIvN3VwNEp3TytWOGxoL3E1a2I5QlNxekdRWVVZeG9JS1ZOajAydmErbXpR?=
 =?utf-8?B?SmpvTm9mN3dNbzNXbk9lNWgwOUkwaVVyZjNtc3M5cUcrTHJicWIzek9kNlFB?=
 =?utf-8?B?dzhsZXlQYUFKUXNwTmJsUGJDTE43c2lqQkdWdCthQ3o4RkdOaGRsSXpneGdF?=
 =?utf-8?B?Q3JsNzlLeXhIdjFDWTM2dG12d3h4WGRIS0N4M2JTa1N6MVJ1Rnh2MlB2WmI3?=
 =?utf-8?B?Y2Fad0JqTmNtZXVobWpXQzJXd0hDRmRRVW1oZmpya1o2cE9WeVNleHRGZXVx?=
 =?utf-8?B?UUhUY1FMN01IM2tvdnNrTWpLcXJGQWVXcUtXVllYWjZFOEd0UFdXWWRNNWRo?=
 =?utf-8?B?dCt2azY1YmZJVEk1c2lzVTRvbHI5WEtxeU95T3ZXclZoRm1WeU5DaDRQSm1v?=
 =?utf-8?B?eWJISEFrRGpVUkxVVVR6Zy9BRzBQQnpDeXNiM3poVWZZdk5RWnduQk9QYzQ1?=
 =?utf-8?B?TkF5cGdXeVR3RVBqZlJjRkdDUUZiMXY2TWlDN0k2Y0FpSWtZVjc1c21MTk54?=
 =?utf-8?B?UUozZm53L1p4VXJDdHV4ZXdiVTNGUzZCTlo0MjFRTW04RHJ5VSsyZFVMc01C?=
 =?utf-8?B?ZkgxcVZ1TmZ4Q2lnY0ZlVE5KVCtkU09xQVVKMlVYVHRVZnFhRzNXNDZBUWl2?=
 =?utf-8?B?UmVKY1ZMWHJiZlpVR3IzdUdvR0NJL1RjV1BvYnl5OCttQW45VWp1L1Vnamg3?=
 =?utf-8?B?b3I2VjBXb29NK1VqRitTZWx2bCs3U2sxSWREeXhUdVJ5TXUvekpGenVFcUdt?=
 =?utf-8?B?TG5LWS9hVHJkcGlQQkNoMEM5WEF6THNGcjJzcThPcUhnRUJhbjMvaFdOZTc5?=
 =?utf-8?B?UTV1U0ZFRTRSMVlLcE8wWkY2VHNwVHlRRzdTd3dkZDNSRGx3cXpWV091SExW?=
 =?utf-8?B?RFJWOUE1K0hzYWVBVHBpbnF6MkNFVDJVNHExME9KUk1wR2hmUkFuRUgwYi92?=
 =?utf-8?B?RG85MCsyd0RoY2tSdGNvdGxMWWNpWG5BdkJCRmM5eU9ibFA0TFdxTHZFeHVt?=
 =?utf-8?B?SzZVUUJnQU5NSTZDWnN0NDk0UTdObzRlSm1jN3VVeDBDb3RIMHdKU3RBVFJq?=
 =?utf-8?B?Si8xREF4WVNib0lkbm5iZVF5aHJ4c0NNbGhRVDhQajRyU0NobHRWc01Ca1I1?=
 =?utf-8?B?SHpLeTJjOGJSeHkxaVFIKzJSM0ZQc1lmcHdZdWFJbG1ONkZRYXdwdmpiNnZr?=
 =?utf-8?Q?TyMofWHALmZPn940bI0s7FAAXf/aWuIT?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUZ5cjl5TUJPeHJ5Z01Ndm9DR2VBMWdmMjh1N2pZd1hCeEsrbzhJbVNTcXY1?=
 =?utf-8?B?ZFh6dnRCb0dhaEhmbU8yNkNZUXdHUGdwb0JaaDFBT29zQllhZ3RDendlTTBH?=
 =?utf-8?B?L2gyYzdsOXFycjVUQlV4U3VFK2s4NDA4VFV3eGR6cUY0RDJVazIveURvYWMv?=
 =?utf-8?B?N0tjNDNyV2RPd3lQUm5DQUtNaDFMY1UxMzJLakZua0w4ZytWem9NZ0s4WE9s?=
 =?utf-8?B?djUrUUpXZk1BM2FDSzdrekx1eitVK2VBT2taSWZkV1oyTzZqRlZpdklRSWpZ?=
 =?utf-8?B?NTErbWdrV3BKOExDZjBNdVd0YmQvNHpiUmh4c2ZTMG10NTBSODY0a3RtUTht?=
 =?utf-8?B?Q2NRMDBWSS9RSzlRSzU0a2VnNjhvV1hMaTIzY0dMQTlocFRRRWloWVpSS1Vl?=
 =?utf-8?B?UmM3a0JyY2FkYVFmdWJHSU91UGQrdlNhR3lhdmx5b0RkVXRHODZFOUxKUmZx?=
 =?utf-8?B?b2FRT2VaZy9GZWEycko3WGF6dzZ5U1NVeFlFT1BXOEVKeHdtek5OMm1tbGkv?=
 =?utf-8?B?eDcvY092YnBMWnpZZFZTOW56Tmt3SW1qcEVZRHh2YS96TzNaOUVTTEVnNUk3?=
 =?utf-8?B?ZGtxWXVDMFI4YVJxaEVFK2tVSVJMNndManY5TlgzRHZDWWU4OURBdmUzTHEv?=
 =?utf-8?B?TmJMYWtwb214UkpOL1FJS2xub0s0R3pOYUNtbzFscWNuRUMvWmtLZlpSeDhp?=
 =?utf-8?B?MENla2REaEgvZk5RcmZua0kzV1haemVOT3E4bHN2eG5QMXVEUzRLU2ZBVERP?=
 =?utf-8?B?OS81REtITXdZN0RPWEJoelQ0K3BDMHpiSlpaejVlUWtDdTdaNklTNjlvZy8w?=
 =?utf-8?B?VlJKZC9pQ3JkYjNKMEFjTjZTSmhRWTFtRzVxOXpTb0dtVlA1U0duZ3Y0eFF6?=
 =?utf-8?B?dHFxNkl1U3c3UUkvSzZiS203V2I3Qkh3TUdmMTZITityQWpTczVTbWNKZkU1?=
 =?utf-8?B?YVVoblpsM29vZUxoaDZZdDM5MzE2STJQS0hPZlNDc21HOVA3ai94bzVWNXdB?=
 =?utf-8?B?Y1NvTWpPN0F6NjBjZXh6ckk2ZnEyWDg2cDlEdFI4V1YzaWNyT2NCWFJ4UGl5?=
 =?utf-8?B?MndJSzBjRWdkc0wyelMxeURnYTBBZzJVRVI2UWNpSktvRk0wSDlmL0xKK0hz?=
 =?utf-8?B?LzVIZ3h5YlJmcU1pYVVyeitjUWh2K0F6SGdLWi9Kei90SDc5dFZZYUhpT3l5?=
 =?utf-8?B?dzl6RnpSaEtEdyt4Ty9mWjRieElqanhiU2RwRWxIeHJ0UlJuV0xCV0l4VThp?=
 =?utf-8?B?dzA0WktzamFFZnMrVzNuYnRueHlFRnU5ZUpXUmFsQitzK0ZEN2pteU5NWDhm?=
 =?utf-8?B?VHRJQmFzbHNyY3ZDTTFDK0FIeVlSeGV4eTI2Z2p5cTc4RUVRNUNVdERKdEJy?=
 =?utf-8?B?RmdST2xIL2pTQjdGRHh2bWxSOFNkRUlIcWJFKzl6SDhyRmd6ZzdkdHlnOS9i?=
 =?utf-8?B?WFJ4aGFtbVFDS0M3NUNLSFQyS0k0YWNqbnFnNGgzMVZxdDFLUUI0MFZzejI3?=
 =?utf-8?B?VUI1ZW1pWmpZOXM4R0xpTTlrYXdPazFSeERXdDlhMlJSWWVvcFNaclhFa01Y?=
 =?utf-8?B?REtPWHBQNENlSktwME16Rjk4QVE0aEI5T1pxeVBGN0dQdGZHdGVnOXdObWhR?=
 =?utf-8?B?aTVrRXhwL0tLVDRhU2JMdVZPY3Rzcm9oZDg0TEZCS1REU1RVb3JHeTVzc3FV?=
 =?utf-8?B?NmczeWloS1FuK0psN3hhaVN5aHBsSzFVU2ttQ2lVRkI5Z3krelRkVDdudVEx?=
 =?utf-8?B?aW5NdlIxMFlmdkh4REh6U0hjc0FNbCsyMFV1UXFSNnpqQVlTU3o3RUxCZG9q?=
 =?utf-8?B?OGNQQS8vTWU4NFBDVjFsbm1KWTFrbk5jZ0RtTGVmN2JsbC91RjF3N282QzIr?=
 =?utf-8?B?bUFIZ0RuS2tCZ09QOVQ3MndXTTI3YnlTNVpBSXVrSjhxSDJLdktiVHRBdnBJ?=
 =?utf-8?B?cVYwcW0zMmErYS9PcHg1cUZaUUI5WWU4YTBuRjlKeWttSnRsR09JdHdrRWtM?=
 =?utf-8?B?dXR2UEdXQ3U4RDFhNUV3MmZIOGI0R1hTaHRrRDlKSXpMVzJGNDNieHdSaUNa?=
 =?utf-8?B?RTlHdEc4UHBNSXRhdDMzL1laWXFVNTFCVGhyOTRmWkVVNUtCQjhXeTVCODhm?=
 =?utf-8?B?UlNBV0g2dElzV1E0WmZEbHkxQUpUR24reXIyZEhPelZvL2xlTEFseVVCMGN2?=
 =?utf-8?B?RWJrenNpYmF2RldTSlZ4VmF0L0I0Zjg2bVlaY21FYURKdkI1bFVzTUpkT0pL?=
 =?utf-8?B?SXVCVTVGT3V3SmNTSDJtQlJLdGhRPT0=?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fa3b8d-34e7-4d96-303f-08dd404329c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 08:58:56.3856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tyhRfrrOQ4ZjuAdB2cYQPfgmZu9X++eTG80T4h2LFPNKzrXkYP9mrgKSOHJp+3Fj6FZJ8h+0iJlqMtKSZU4x4rM8OKTIqAxRFDNeGVqBoh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5031
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_010043_730558_7B97DEE1 
X-CRM114-Status: GOOD (  15.78  )
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

Hi Miquel,

> -----Original Message-----
> From: Miquel Raynal <miquel.raynal@bootlin.com>
> Sent: Tuesday, 21 January, 2025 5:55 PM
> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>
> Cc: Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>; linux@treblig.org; Shen Lichuan
> <shenlichuan@vivo.com>; Jinjie Ruan <ruanjinjie@huawei.com>; u.kleine-
> koenig@baylibre.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH v2 3/3] mtd: rawnand: cadence: fix incorrect dev context
> in dma_unmap_single
> 
> Hello,
> 
> On 16/01/2025 at 11:21:54 +08, niravkumar.l.rabara@intel.com wrote:
> 
> > From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> >
> > dma_map_single is using dma_dev->dev, however dma_unmap_single is
> > using cdns_ctrl->dev, which is incorrect.
> > Used the correct device context dma_dev->dev for dma_unmap_single.
> 
> I guess on is the physical/bus device and the other the framework device? It
> would be nice to clarify this in the commit log.
> 

Noted. Is the commit message below acceptable? 

dma_map_single is using physical/bus device (DMA) but dma_unmap_single
is using framework device(NAND controller), which is incorrect.
Fixed dma_unmap_single to use correct physical/bus device.

Thanks,
Nirav
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
