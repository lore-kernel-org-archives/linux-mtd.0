Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C06CCD1AA
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Oct 2025 12:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rTyOfAjEXzE4KwqJRlaXfxcs88+z+INvX8m1AKdUFUw=; b=H0oUhEIV4h97ms
	b973aWiEAbdZtxSs0CUrOQsEaLabqvShR63XRmp8WyXhz+S26GXywb822d7shGZ5F3aVfVfLScqFf
	cKo08EwBmdILrJyGL6gRGN+dHHJ7oMqODPjm4ovLEJvvJpyxYyzG3cWr7bbNojxVSTH11hhL4BiBS
	KVvNGJnrdyT/bik9McH7ShYxE5G2NpSyyz8pLwxeypf/i7kiXR4oJpBqUH7Sjklr38pcsiXHMb/9d
	MAGy9PwWGu+nGA7qnnqQKKla7Kvp12eI0ldQKeX1rywnshL023+EANTYHg2Kv3iURMLeL8du5nfpv
	qiCgnPAA6y5FHtJtDsXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBpw-0000000H2Vp-1XNF;
	Tue, 21 Oct 2025 12:51:36 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBpu-0000000H2Ut-1pr7
	for linux-mtd@lists.infradead.org;
	Tue, 21 Oct 2025 12:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761051094; x=1792587094;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yNav58Gr6+zOcE+it/iV4PoFVWkfUJOQaz4T2wkS9KM=;
  b=PdutdWs1jJ2Nd++T3b9eoGMWPyQ2EZgv4vrdKXNOvCEw2QWoMTzVUiXC
   lMr/nzzl85sBorC7QOz+20JtnGjL0lotQDcPw+l/A0oU7B1u4xRSOXb/T
   1dm6qvSR1t/CRc5PUKvEd8aW8yyqKldg93PJbwnWaFfFGQDN2pctLs4GX
   tOD2sIEk5wRVCksvzBbB1SbD07uz1H9aM/UWakiluQfHe0jC18/Ftg9lR
   W/MER2IsZNiB70ifg2PDqO4DIjV8cqaUUudVbXqW/f6d4KzTdXQ2FGyq2
   xPp7ug3E6+NwJS7QbtAuEKxCgqJQnIIddxC27Gkqc2BO3H7pMhjeSOo7y
   Q==;
X-CSE-ConnectionGUID: j0Rq3+mkSyaU3ION3D1DoA==
X-CSE-MsgGUID: WWbw+sbgRNmhA80LukBBcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80799515"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="80799515"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 05:51:34 -0700
X-CSE-ConnectionGUID: N6Z9PxbCQ7mODDzvoarNGA==
X-CSE-MsgGUID: ZJ7+cKezQteDGgWqAkOOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="187620040"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 05:51:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 05:51:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 05:51:33 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 05:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxA6H9yhY2NPUrc5jk1wI19JJnAeK0nVlJdw2BNdzG4aNUr64fuGbV9/30Nn++SLbwediMHM71X04fPRIIc+qcMDR0OkLfHrzMRv+SVkvn8G2qa9fkrI1EEm0KQP2QCEoqXnSydQeE5AVKj7uMZVT5p3Xl5MqvcW+d09gSNnJkFSS0ez00HJomkC1PCL9nIaTgyx9NdaT0mK3YaqlEyxKUCUytKx9GzZR2eMumXMnZpFXY8okuBXsFR129F6QtgsH8kFOFdksHBhMzb0Ta40v0K175ScH1FUK5ExmAebuOo8CcduDXQqI80qTXcBYlHMKrakjGLQEwMAAQYS3VHp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNav58Gr6+zOcE+it/iV4PoFVWkfUJOQaz4T2wkS9KM=;
 b=GonTXIO5XQRMSWDh9uNO7Nje9iyzp+ysXkz+abukAmqYVegr1RLyX1sVcdzSzj7xQOLv3J5Jjj/ARTaLCTd84JDr0QtGLuYMadx7Tl+R6K/FaMFKNd40OjtatwkVZVV8BBzP+porecVkHrMNgS85m4qfVmNfNGvasbQeyau0K4gegywWXfnXMVk+SAUxePkTjmzPk1R5cDmeJsK3rCKVXKVCiSeuo16mUPBdQCh5SdqpwXAPz+/7M1hzjemfRm2HgU/Un1nuQhiJKD2MbRgbM0HcGC4wgpE3E5tNL0uJYFXLAOTQjcGC2NP12BbEubYFhDwntMmMM8S6CYRlbRbzrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA3PR11MB9374.namprd11.prod.outlook.com (2603:10b6:208:581::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 12:51:30 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%4]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 12:51:30 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Abliyev,
 Reuven" <reuven.abliyev@intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>
Subject: RE: [PATCH] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH] mtd: intel-dg: wake card on operations
Thread-Index: AQHcQQvroNhSaCIfh0abEtSYk7POBrTK0Q8AgAAAQwCAAY4gcA==
Date: Tue, 21 Oct 2025 12:51:30 +0000
Message-ID: <CY5PR11MB6366D892E7B6FDB112751306EDF2A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20251019150145.3228079-1-alexander.usyskin@intel.com>
 <aPYKRvCenwnrFXcb@ashevche-desk.local> <aPYKfhTDF5kXulz9@ashevche-desk.local>
In-Reply-To: <aPYKfhTDF5kXulz9@ashevche-desk.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA3PR11MB9374:EE_
x-ms-office365-filtering-correlation-id: 20af1f6b-fc2d-456f-31ed-08de10a08e56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WnY1RStFenZSWVRMcVhTWGNVc1pDbTRiaFNyY3ZOSEhxVHVFNkR5ejRWY3FO?=
 =?utf-8?B?dFh3MTRUTjdESkJWZG5KUUk1cE9JeXFrNGVWbVVIU3FGdUhNUUl6c29KREpj?=
 =?utf-8?B?Kzk0b1Q1eTVmNExTNnFXNzNGakRmV0gxTjVhaUtlMEZPeGlBdm1iVFNQbG1O?=
 =?utf-8?B?bUY1SzcwZFltc2hIQmNRclJsTEhsQUd6Kyt0Ui9Yek9ZWDc0N0Jjcm1ibUUv?=
 =?utf-8?B?RUhESlk4dnE5V2VGR1hodS9HdVowZ0lyWENhY2krdHAvS3I4dG83ZWtsTDlw?=
 =?utf-8?B?THQ5OUR1ZEY4SkFOd0NrNGc0WEJQbnhOVFAxQlI1SEhmdU1lVXlHYUxyci9k?=
 =?utf-8?B?UzlDdjhtYVZXRm9iN3k1cEpJb0FFVkhzdkZOdU1CVXpCc2FiaUtocGswOFJQ?=
 =?utf-8?B?ZkVvU0dTOEJZMkdpY09TN1F2b1I3ZlZwT0JzV1dQd2VuZkpNb1NxS2hiek5k?=
 =?utf-8?B?b0tHUXBXOWlFblFQeVBWcHpROVpBb1pYUDZ0ZloxSVlKNGk1U1poOHNiekpK?=
 =?utf-8?B?VkZpV1ZBTzBuN2tUZ3JvNFNEaE1mQmtjNDBlc2tmQXY3WXZETkNpcmxvSlBq?=
 =?utf-8?B?L0JuSG5GTVB4TzZOc1k2d0F6SWE3YXRHZ1JKb2pGSFNIZnhycDd6MUdCMEZN?=
 =?utf-8?B?MmlBQU9sS3pOcTVLUzJJQlFWeDlacU1qdzVEdTZuY0E3UUpvOVNpOE9NWHlX?=
 =?utf-8?B?NnA3Z0paMFBpNklJbVNaQ0tlejRFbkhkcGdaaHNoQmRCVHdJVS9vYTluQWVu?=
 =?utf-8?B?OTRYekk4K2M5VEdTRytiYVB4dkZEQmVnL3FTcGZoenFUYTRVSWJaWGhhWFJU?=
 =?utf-8?B?Y2tRck5qYUQ3UGpqdjRPSmcrdFlLNkw4ZVNiNGErcG04bkJuN01mRUJEWE5n?=
 =?utf-8?B?RFp6NXd1dTk4Wk9MUWNnMTNXNDBrdzU4VGZYaTMwMTVNV2Ivd1J2KzVDNmE5?=
 =?utf-8?B?eis4MiswTDRTUzZ6Uk4wRm5YczlhOVk1WERxM3JTdGV4TkIrbHZscjJOcExV?=
 =?utf-8?B?VktrclNIWlowa2U2ZE1KamZPeGhtZTBqVzZwRjhmNFBKVzlUWjlHa3pCTGFP?=
 =?utf-8?B?YnBaaFNWQnBFbTdNdlZtR2lHZjNxUGZRQ2kxU1VkNjZydndwYzU5THZ0a25S?=
 =?utf-8?B?Zm1adWQ2ZFBaSW9maU1qKzluQTlxbGxhRHBGdFlmVDJLQkprMXVzOGpKci9p?=
 =?utf-8?B?ODlhaTVWQjVNWjJKRHdNajFINmVUeXhZYzRNY2F6MXNqTnBXRnlzNUg0N2pF?=
 =?utf-8?B?WkJscktKMURZYW9kcldzZ2w5WERpbHFWUEhiS2tpeEZRZlYvUDlyQjBsY2lx?=
 =?utf-8?B?M0M5anA0cWl1a09nTDJ5MGpONDg1eUhjcXA5MUFYZ2FyYytxU1loZVlHMkhE?=
 =?utf-8?B?TSszOTkvQXpwWm9aOFRQNDFUdzMrUGc1dkU0NUpPaytKVitqMmh3UWRqS1Z4?=
 =?utf-8?B?ZmtSUUcwb1RTTHlibmZYUUVrbUVCZjVBRGdNMEFheldRVDV2eWpsbU1YU0Z3?=
 =?utf-8?B?VCsySnljNmROYlpqSUQ3SStqODZyc1lPa0dHRm9tdVY3aWdFK1NWZG5lTlRM?=
 =?utf-8?B?Q3BKQnFlekhtRVJXUVdPbG45VFhvSDFPY1FTekxXWVRoMUxQVHh4S2xZRStM?=
 =?utf-8?B?VGFiSThQUUIvT2RuSWhiS2tDV3ZRWmRJbTRhY0t1K1pLT3RKNVhjalhlSWJl?=
 =?utf-8?B?OVkxQThnQVVHeE0vRVloOFdoWjI5eUFZdzZSOGM0OHNpcXVmMVlLcHNBMjRS?=
 =?utf-8?B?dWNzMWNSNEs2TUREWGtmUXpaeHZNMFRVeXFaeDlVZURVbURsMDNTdWJtUTBV?=
 =?utf-8?B?eXBRdk9uTm5ZVVNZS2xVazA1TnZPOU9jYzllc1hqcnNFMy92LzRmdUtpVitp?=
 =?utf-8?B?QnhXdVpwWUt2RFNNSW1JYmh1QS9OdERTNnhjL0wxaGlZOU1PRzRYWk1jRE9F?=
 =?utf-8?B?Y2hhMjZkcmpjTjE4MkhqYlYxYTlYdFprcjRIR3pmRkU0Y0RpSVR1WWh0MEZQ?=
 =?utf-8?B?S3lUL1pubjIyalFvZUhBb2tWU3B6c2d2Z2FHSG42YlNiSXBSd2pobFI3MUVm?=
 =?utf-8?Q?dfx52y?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlNkUnlQRlRoT0NlcFRlU0ZGckJ1a0tvNWh2N09yWUVaeXJwUlM1aXhrU2Jn?=
 =?utf-8?B?QlBldmdKQ3BlR2QvQUtoNVJQMjRtRXIybkFCQnVCdGJMc05HRUx3cVBpZHJx?=
 =?utf-8?B?RDRyYjdQRzVYRXJ2alBDUXlETGFVa0VBMnBBZGRBRTdFcFErN2ZZWXFuTm5F?=
 =?utf-8?B?TEJkZSs1NDZiMEcvODdJZ1o2c0dqVHNTdWliMWxibVZ0Yk5nS2czVGQ1Q1px?=
 =?utf-8?B?ZVdBYkcyYTBrdXBkNXNvMHZzOHFSWEZubXQ1ZUFnTUtIRkdBZUY0L0Q2Y1d6?=
 =?utf-8?B?VUZHdHpTdGd2MzhTc1hDVTc3bGpvSElXbmtER2xYMTVINTVxMVZaampXMVVC?=
 =?utf-8?B?MzBXdVBjcWl4SGRUNXFpRWE2NHp1S204eDhQRTVVaDU1NGszR3doazVjaDhz?=
 =?utf-8?B?cWYxY0JPVVgvNEkyeTJmRUd4QklOYmF0bTZiZW50RnA5UWRUUnR1bWRpZXZX?=
 =?utf-8?B?dlhiRTdYSnhtb3JqdkVpcDB0QjBSMWNEaTg1UEpKSVR5WlZoek03VDFnVU1L?=
 =?utf-8?B?cEZRZEh3UWk3ZHJuZ0xiSWhuSGJkMlgzZG5VWTQxZnM5TVl1TS95Ly82akNo?=
 =?utf-8?B?c1ZDbTFaNDNCQ0FFdGhlaWR3V0VXZUdNZGpEZ0VzUzJLNVFUaU0xVUp1aksw?=
 =?utf-8?B?NkpJbUp0SzZ6L3pZTDBqNWdjRlNQQjdEOHJxak1RYk1JcHNzVGM4VjY1WlRm?=
 =?utf-8?B?emJtUzE0SElzSjhNV1YyaDBkSkNaOVZZSGpsaXhneUZ3QWxHWlJJVXZNQ2Fl?=
 =?utf-8?B?Yy92ME9URFVpSTFlb3JKb1FXdlpScjc4eUZ2SDh5YmsxcEgvU1NUWHA1aDVO?=
 =?utf-8?B?Qk04ZXlUd29aYllrc01uTmdpWnNLSTVyRUExaDdxRzFYajg0aGxNZGhPZlFV?=
 =?utf-8?B?eXIvbHJjU2RMV1pqamZITUlFeGN3L3dMMWRKUHBnZ2ExNE5ReHVuTEx2MHFD?=
 =?utf-8?B?Z0xGUU53TkFjNFBKbnR6ME9VMlhUZVROSUZWNS9RQTdjYWp1YytmRmNjeDBp?=
 =?utf-8?B?Tkp3M2xWNzhzMnRxelVSaGFVakgzTzVtNjlJUVdyZ0F5ekh0VGpDbnllc0FC?=
 =?utf-8?B?Um5KbFdZVFc3RmZ0Tkk5c1dlOFVRRjZENnVla3dGb0JsdEh3dkFLV0FJTmwv?=
 =?utf-8?B?TDFPbjMzQXpmUVh2SktLZW9vc1ZuUmV1QkU4d2hOdWxiTTE3RDlHeE5QeEV0?=
 =?utf-8?B?SnZ0RlFxUmZXMWs3R29wR2wrM0k4SFl2RWRUY1IzaXFiQjZlSEdEL0NLUThU?=
 =?utf-8?B?QXBEVlYxMmloV3FGS2YyK3M3dWt5N0JGRkZURlU4dVh5bzl2LzFzMnFjTnJa?=
 =?utf-8?B?ZWtpanFBSEt2OThKM3ZXdnh1OGgveUxFL05mZmpLVTYvN3huL0l2dCtTNXpR?=
 =?utf-8?B?UmV5V0ZCcFA4OXoyelhEWkZhcnAwKzZzV1pNVlg1aFhlaFExL0hOUGJpamEv?=
 =?utf-8?B?dm80UUFpL1lJVnFPTGpqSkFZTWZIMlYrZWpVT01peElCbFg0ak93MFVFQ2kr?=
 =?utf-8?B?aFVBb01IcHZlSnNJTHUxM2lwYnF2UXduY1BHTURhYjhwaTBiSVF3amMrVDE3?=
 =?utf-8?B?TXBqT1RrakxXeHJnKzNsWEx6cVZSZ0o3UG5aT3NKajc3MnF3RGpaR0RwWnl1?=
 =?utf-8?B?c2VOanBSZ29GSjFhMXVNM3ZFdlJaeVQzQ1R0V0hZTkoyQ1BRSWZkaWRuR09F?=
 =?utf-8?B?aXFqK1JzN0kyTmhBN3ZPOU9ySFdYb1c4MkEzOFBiR3BQWXhRN2VyNzRYejJ0?=
 =?utf-8?B?LzRiblRHTFROaThOUWtPQUFqOU5BaGM4MGVYRi8xaU9POHdPejZmZmJycUI4?=
 =?utf-8?B?WE5QemhYWCtCMm4rZG01Q1BidU9oZlRqdjFGSDB1RVZjRU1kZFJOZVBIQzl1?=
 =?utf-8?B?Mlk5SW05MHNSNmhCa3crd0ZDVzVGNlp6VU9pL1FLZGJ4cWcyNTllTTVPRWJ1?=
 =?utf-8?B?Nm1FRHFaTXUrRGxWU3RrSy9ZZFFQeTVheFNZc05vS3hvMTVQb1hFTW5tTmx6?=
 =?utf-8?B?REUrZlVsemFpSmticGRValpNRlplZDVQT2hjc1BmQ2ErUk9VVzNPYm1uU2lu?=
 =?utf-8?B?Z2IxQ3RDM0tESmFNZHdMaEdPRjV4SGFVVXdKWDV0em5zUlVkZDJDUTUvQ0FF?=
 =?utf-8?B?K21zaC9vQnRuWWRmZkNMdWh4SjVsb1JJUWJEU2dKRi9ycllDMS9NTFhnMmRr?=
 =?utf-8?B?UXc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20af1f6b-fc2d-456f-31ed-08de10a08e56
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 12:51:30.1700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqdbun7qo3hr5eKDw8cnfHD8ZbPugxSmg7xqDGZ3+RDIgOC7wv/U/xeHGuW1JRrYAho+4QtA36CnWHK3haPm+dth8Fe12A+3VkeJXtWt5ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9374
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_055134_505147_C6B249F8 
X-CRM114-Status: GOOD (  21.17  )
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

> Subject: Re: [PATCH] mtd: intel-dg: wake card on operations
> 
> On Mon, Oct 20, 2025 at 01:09:10PM +0300, Andy Shevchenko wrote:
> > On Sun, Oct 19, 2025 at 06:01:45PM +0300, Alexander Usyskin wrote:
> > > Enable runtime PM in mtd driver to notify parent graphics driver
> > > that whole card should be kept awake while nvm operations are
> > > performed through this driver.
> 
> Ah, and perhaps a bit elaboration why graphics card needs that?
> 
The memory power will be cut when whole card is powered down.
Intel DG card does not have separate power control for persistent memory.
Will add this in v2.

> ...
> 
> > > +	pm_runtime_mark_last_busy(nvm->dev);
> > > +	pm_runtime_put_autosuspend(nvm->dev);
> >
> > Please, drop the second (duplicate) call.

Missed the patch where pm_runtime_put_autosuspend includes pm_runtime_mark_last_busy.
Will update in V2, thx

> 
> ...
> 
> > > +	devm_pm_runtime_enable(device);
> >
> > Please, justify why this code is good without error checking. Before doing
> that
> > think for a moment for the cases when devm_*() might be developed in the
> future
> > and return something interesting (if not yet).
> 

We should not fail the probe because of runtime  pm enablement failure, I suppose.
There are other ways to keep card awake.
The pm_runtime_* functions work without runtime_enable but have no effect.
Thus, we can ignore failure here.

> ...
> 
> > >  err:
> > > +	pm_runtime_put(device);
> > > +err_norpm:
> > >  	kref_put(&nvm->refcnt, intel_dg_nvm_release);
> > >  	return ret;
> >
> > Mixing devm with non-devm usually lead to hard to catch bugs in the error
> paths
> > / remove stages with ordering of cleaning resources up.
> 

I see that this pattern is reasonably common in drivers.
There can't be devm wrappers for pm_runtime_get/put and these functions works
regardless of enable status.

> --
> With Best Regards,
> Andy Shevchenko
> 

- - 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
