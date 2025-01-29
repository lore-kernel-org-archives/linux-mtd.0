Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F4CC0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 09:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QBkirgUodPFTsni8f1LsilY+ynEdKT39vlLwWX5fvE=; b=rARNvUvJpTrJmb
	E39EeLQYKWQ9sYiqx85JLrmzxQYDRFQOcy+UIuGaNY/RYTVa9cm7JpB59Gad0BY+FCRRAnd82T02o
	k1ric0ot8C/VDM23q1Pfl5IEvev0Q28GvbuLCG1xcbpdUb+27CpROj/dnPd8uXZI7enpN4WSHldCJ
	Nn3pKiepsVt1bmOjuZr/DwssEKPu4+aFeV20X4QqbjJoInpEWLCxZnuyJsKk0Dc7O7OSSYI21eCoS
	yv8k6eRpV2oJJQ4u3pRpxF5JNSUa+Gn1jrGG8WNsgyO+tmrzX0WyoPPIITIYtxTruEMthsp8rw8bD
	xdbMiVZ0qOW0UskIeE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td42q-00000006bxu-26TL;
	Wed, 29 Jan 2025 09:07:36 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td42o-00000006bxM-1O3D
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 09:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738141654; x=1769677654;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UhPS4tO9tLqvzxUScFwmtVmRFiq2xhUHo0X+iu02bwo=;
  b=GLR3giQbJ+6cRYmD5VaL0TC96IZA0mJa5X/YDJkctfXWzmLlrsvTALrJ
   3hHa7CLe/yftvnpCP3wt+4JxGC96JRAFPEdsyNqaSsp5shem2QQI/epww
   khK9wr2j55QilyezeX0ldv47A//2gxs6qHiGWvU7ZjhoOFrtCNSTibWk7
   Hn7maNmJ8TD0MKQq3LvWAi0D17koD9YA0uP9nIPgn0Qu42aqNRlk47DD0
   tcVndWRy8yoS3842Cc6a5bAUOAVd1saypLv7efr0cW/PnhtesKiwrvpDB
   hlLxaLh9qw/q3JXNpSTNQYmvsOyIRcczKfIww12ihKEsbT99I5oct8qts
   g==;
X-CSE-ConnectionGUID: 0EXGcAYfRNKw8s5AsVA+BA==
X-CSE-MsgGUID: g+E/tu6MQ1+F7ftZ0jXAfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42303190"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="42303190"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 01:03:37 -0800
X-CSE-ConnectionGUID: uMIP0aoITW6zozkOY8CK0A==
X-CSE-MsgGUID: mQCm4JDpQiyIj4ZtWAhjvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="108780615"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Jan 2025 01:03:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 01:03:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 01:03:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 01:03:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igc/ak2R4hNy/KD4luzDtw0C5Ga/nR6aT6cpI2nhbqDfNMEWbywqd6izRzbyhFC03Hto3LU71EbMu6YvUEd7Xs78ZuiZoO6BsnJda99YvsqetdZX9lMJZIsna+Pm4iXMkCq3GMxLnlZB5XseRB8sOvR++DWz+C2crwvTzB4W9/avebKUpqVibfpHislgC7HFPMrHq27Svkmjxjv5MPr3PThDVwkUEpYeakEpN2plfRqtYMNtcrSpLnFjady1e9kuiZBjqbkQkZPLZzS0YkOXxY+juKEL9odUotd3V1uFHSgblhVcsUqGcu3CWgF506Y1S5xgCVK72YOfdXUwvWh9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhPS4tO9tLqvzxUScFwmtVmRFiq2xhUHo0X+iu02bwo=;
 b=klpd1ELv9t+tnhrsCYbGofv25NGEn3QarQs7dLnI02kaCAJ418DVc1ewg805ZQZnvWFtDUf6KKLtk4PkalM2fYOnkTfAfwMiYdGnIMOvpEZqJcSKu5r4sRHrpRUM799NB2kLV4MTI/SbNA/8oMWsjvM65FXVZnjvLWt6Jf/ZSwO8aPnKeu2/ofIqchtNpY8jgoypEt+g114Ztc5ZGnAYfYbfxCr7w0UWA5Zm4r3qoDsxIL5fgQHm2YCsiWDunwzzu14Q+bpuI7I0i/JGCeMIzEm2ejcTA0/PnXc3OJh0pPki4OMnjjeGlKlGLOhPMOkAemgAc2HuP/cKxPVS+0S72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by PH0PR11MB5031.namprd11.prod.outlook.com (2603:10b6:510:33::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 09:02:58 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%3]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 09:02:58 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, "linux@treblig.org" <linux@treblig.org>, Shen Lichuan
	<shenlichuan@vivo.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] mtd: rawnand: cadence: use dma_map_resource for
 sdma address
Thread-Topic: [PATCH v2 2/3] mtd: rawnand: cadence: use dma_map_resource for
 sdma address
Thread-Index: AQHbZ8ZSebLix6oqu0OjDvIjtrQsjrMhBSf2gAyDY9A=
Date: Wed, 29 Jan 2025 09:02:58 +0000
Message-ID: <BL3PR11MB653280E16A4399DDBB300CA8A2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-3-niravkumar.l.rabara@intel.com>
 <87ed0wpk6h.fsf@bootlin.com>
In-Reply-To: <87ed0wpk6h.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|PH0PR11MB5031:EE_
x-ms-office365-filtering-correlation-id: ef0c5714-831f-4a2d-fa43-08dd4043b9f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cW53WTJGNzJTcmhjZVd5bzc4Y3FNZUJ3cDVTMnhWUFFOcjdsNlpkM1pSUGVv?=
 =?utf-8?B?V0tHT1ZoSnZkMlFRekt5R0R6OWprbGMveStTWkg3cElZL0JDaUM5R2xQamNq?=
 =?utf-8?B?eGoyRm1hUzNBaDhOM1dKS2xSc3R5dzNmMEU5OGYvTkU0cGRlYWFwMEh2aHhN?=
 =?utf-8?B?SVVHWXJ4dStXcU84VklBR28vV3RoQkdHSC9VUVFOaXJmRFdidkxIVW9xWFAr?=
 =?utf-8?B?RUlFMk1jMk9LUDAxOXBKcksySm9tYXN5VFZpdlUxemp0QWI5NzlEcGN6TlNo?=
 =?utf-8?B?WWxyTVlYY0xQMW1BbTNwYTJMUFl1TVpuZ3BiSk5WMnlJejg5ZG51b1RGQS8v?=
 =?utf-8?B?VTZURmkzUkl1TzlVUnJGaG5LZGFDT3F0MTFqY0NEalIrTUF5U1pxRmkyNXJa?=
 =?utf-8?B?blgvQWUwVEYwYjdidHRQNFZqT2lxQm5NOGhZQURrcFEwTFpSMUNmY3lqc3Bx?=
 =?utf-8?B?N1dwcXlGNnNZSWVjY1VhWTFEK3VyTTlYOTRwM2xwZ2ZVMVh5NVJqQ0libzhp?=
 =?utf-8?B?MXExekNMZFFWTlBTWFMrMFpJNmlwQ1ovWkZYaHo0NTdaZ3BaK2UyTW1FRUNG?=
 =?utf-8?B?bXkvRU5KRk9nMnNOdDBNeU1xT3Jma1g3akJyME05ZFRSY25IVkhBVHJiT2Nz?=
 =?utf-8?B?M0VhS1FsaVhKZ3IzY3M3dmVGWmJjcXVQVEhyUHU0RHg1cWRVK2NlL2dkVDh2?=
 =?utf-8?B?Q2pWNzNkMnc0R2FVVG1zdU11SzBtYlNPaXNBU24vV2VuRGNDOFlHVHVsVnBL?=
 =?utf-8?B?d0FQQ0hyTW5VbGRSUHRLeVZtTnFMZkNrQjVxMU4wZElpNlczTVJSKytaQ1BF?=
 =?utf-8?B?UkpMczIvY2xuMldCemRyeFVRN2NZRnRxQVdWNzdvbTFvc3p4eiticENWQUpx?=
 =?utf-8?B?dEhFQnJFV1ZxQmhyQk45NTZWVzM1cHNIUFQyYUlFb0p3aFN6ejhWNjAvLzJl?=
 =?utf-8?B?NnByRFBVVFJYOC8xSnphS1k0T3ZHbnpDNWJKSDdDc3B6K0FFemNmeVNlMERv?=
 =?utf-8?B?RTExSFp4T2Y5YlBUZjRybk85VFRNd090TnlTeGNLUndzd2x2Ujl4d3M3aEp4?=
 =?utf-8?B?ZGh6U01uY0ZQMmNyYW5mZFlnQThVQ3NMZEhmcVlEZVpheDJOaElabzRjaHk0?=
 =?utf-8?B?THI3QktSU1ovR0dkeDhaekVGNHNiWWpwWS90eFM1blpkRDZUcVl2SFJ0amw1?=
 =?utf-8?B?dDV2Z29iOCtvMnN0STZhV1Y2K212QVpxY1pGN3YvQ1FYVm1Pb1YvMjNNdVVL?=
 =?utf-8?B?SDR2K21yaUczTXVSREJpckhraStJeVM3MFhmdFIzVVVuc1JnNTJySkVrbWpL?=
 =?utf-8?B?OUdPQ2lITnJsN1V1Myt0VFRlbUo2Q3dXclR5NjQ3THFsdTNTVjRJWnJoL2FM?=
 =?utf-8?B?enVjaFJzODNKLzNmM0JTcUdjZ2hwK3ZMQTZGQ1h6K2VTaGQrUjNDYk5KZURN?=
 =?utf-8?B?TU9qMnMvYXIrNGhVaTB4NTZlaTRXMWZLUFJCc2M3Q2VRZHR0MFZoMmIyeXhI?=
 =?utf-8?B?WUxvaXRlb3pPbWdxekpNRFNmb3A0RXFzd0hYaGhmT3JOOVFZR0R2SndYNnIz?=
 =?utf-8?B?QnljeUgxWjJYMExodkt3OUVDWXArWFB4SjlEMUZBZUd2alBHRC9NdHZycEc3?=
 =?utf-8?B?bXVpem1vSUw1aStYSTRaNURDdCtNdEJNNGx4ZGFnVFNndTRhYzdWWEtUNzRB?=
 =?utf-8?B?eTFoZ2VqZVRSZXdoZkUybThoa3k0YjNyRzZ4NDd3WFJhdWw2U3U5MVlrc3k4?=
 =?utf-8?B?RDNzb3kya0EwY2NWUHZaMkp4NkFzTzRFbnprY3hTeEg0dWJ4WkpnaElxY0RX?=
 =?utf-8?B?QnViamJwZEhNSUF3ZzlpKyswRjF0RG1BcnpvcnkxUmVkNCtHWFZmdzMrbWNi?=
 =?utf-8?B?QzNBOFlWLy81MWo1ajhMTGgxckoxRGZpNDJBYkRpbXBmODQ4YVFIMVdvQWFJ?=
 =?utf-8?Q?6TPBGZmGwe9GUanpKRmlvqWDD04KkSjS?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDNUUVhieHpWVGtWbHBZVVdob0RXTExZMks4ZkJ6Zkp2aTZrMXVqcGU3b1RT?=
 =?utf-8?B?YVpsN1Y0QW5qd1Z3aVNVZFJ0VkZwUmRqM3djOG9GM0JWcW1wOVY1aFp3czJC?=
 =?utf-8?B?WHBrYWh5bVpKaG5lUHgyaXJ6Zy9nOXVpZFpzL3JHM090SGsrZG55bktqK1d5?=
 =?utf-8?B?KzJEMTZGdW5rdWp4NGhSQmZ2RVVMQXY3bENuY1FlUTJQNzdhOGkxQUNMcUJ4?=
 =?utf-8?B?UzlvQ2hCTkNiQTVId1J0Mnc3ZlRlc0N3T0hyeUFVaTgyNnFvdVNHeExwWVVj?=
 =?utf-8?B?dlJUN0I2L05saTc4U1IzQ3J1NU96QTRiaG9HNkVPYWJ4cHZwWFFWWllzanZt?=
 =?utf-8?B?bGY3QW5SMmJMRS82WGZLM3RINEdzeEhVTnVHbmZBOUNlcVU2NTA4WFNEYkpT?=
 =?utf-8?B?bnN1UWJaNEdMY3I2K2FUcUtYN2VEQUUveExzaE11Q3NlMzFad1ptOVc2aVdM?=
 =?utf-8?B?Q3ZRT3N6NWE4TWQxSVdzUndQa0plQ3JvY0dWSENVZXZJOXkwWjZlMmV5d05N?=
 =?utf-8?B?eGJHOXpCNHU2dUo0MXRlQkV5RUFTOFJXMndNVGtGVFRlREdtd2xBSU5JV1NY?=
 =?utf-8?B?VVdUd3hYMzY5MUVuZkpLMGJ1NFB6Wnl3d0V2L2t0NERadGtEdWJDY0tNeXFm?=
 =?utf-8?B?Ukt5aytnaFUrTE5vVVdVRUZDaGtNQURoK3NDc2dYVjFRZE5ibzFmK2oxeXZl?=
 =?utf-8?B?WnlXZHZVS0puM1FjKzRmdTkxRVk2NVIwUVJCY2JXZWZYcEtMZkxKZmJWcStY?=
 =?utf-8?B?Wm1oNlU3dUo1a0NvU1BoT0tQdlJOOUY1Yy9lTXFhdVBkYzJqVlRoaEQyczdu?=
 =?utf-8?B?TlNCU2JGb214ckxESXUyZldCcWhPZitYcWZtL1EyamxueWtnMVRXRFlVckVt?=
 =?utf-8?B?dGpESlNueG5TWXNPT3ZmTHM2RnhFeVZ4VzBLbUdON0NqWmtmWXZEcWhOajRY?=
 =?utf-8?B?SS9oejlpQzRTSjZGOTA2NGhlNDNZTUdFbmNXbUUySXM2Z0hZNnJqMzFZUm9s?=
 =?utf-8?B?U2xOdjAzMUI1cEllS1V1c2h4SXdMOGJOanJRWk94MHhWWEt4UEhGNlNsbmxI?=
 =?utf-8?B?d3hadUVSZTlYbXhib2pKbGl3YUQzTHZ2ZGRuRGRMZG9QLzNObmd1elNLRzVY?=
 =?utf-8?B?YmVacEpzSGIrN28yUHJXL0VuRm9VQTNweW9CL05mVnFyMGkwOWgvV0Q4MnJM?=
 =?utf-8?B?QVp5TlNtc1hBOTNLK2tZSzNPUHNJUUlPU3RPd0s2ZVZsVWl1MVkvZkNXaGFI?=
 =?utf-8?B?YWtlRW5QVmlhRUhkcStiOEx6QTNGMitiQTRLSE1PNlhNWGZVdG15MUtoNjIr?=
 =?utf-8?B?MzZ5ZUZvbytPMnZRaysxZVd5TWM3bXRZckZhRzVGYXlJclI4ZmpTRUR4c1lI?=
 =?utf-8?B?a0hWV3RZdTJxcnRScGRrbW05N29qQVZ4SzkzYUtXOElRMmFlZzhJSTkyTHhX?=
 =?utf-8?B?d29YVVRPbzJoU1NEcnhKOWtQQzRUclJTWG55MTk1TUFsa08wSWlzMk44WDhG?=
 =?utf-8?B?cjlkS1o1WEVnZzJnTkxNdG1mUFcyUDBwZTU1K0VtRUh0TlRkdFF0ZHFSbHVU?=
 =?utf-8?B?dTZmbUg1SkNTcVZ2ZDVrOFhTK2VZcWROVlplTDlqRnNsL2ViZTlnb0VtTGhN?=
 =?utf-8?B?R3JaQmhVR1FZbG85V1hZQXF5RlFzb1FQOW1WbEJDc25pazNOTEJMdXV1NVpn?=
 =?utf-8?B?Uk1VQkV4Z1NQZFE3WVdjTkRuNmduTnYzN0pZSjIxWE1XeGtCVWMyMVFNUDVt?=
 =?utf-8?B?Mm1kRW00cHdGZE5tVkxFdjVPL1pvaGdlMW9TcXB5VzgrN2MySkhtRUZlcjdz?=
 =?utf-8?B?SEo5MEVLblliYWwyZEMrOEtIb1pjMUNZaFBuR3d3Lzl2dUY0cTV4SWdNTmdn?=
 =?utf-8?B?bGxVcmh1SWhZN0NkUmtibmh0RVk0WlNuK3gxVG9QUGthZUZYdmNEV011OEEy?=
 =?utf-8?B?MnJ0MU1jMmpaSkVGSzBaWnBpYVhUUkRlNlk2YnZIdVdkbXo1T3VTVkNVZ05l?=
 =?utf-8?B?Z3phU1JkWllFZ0gyTzZvNGxYcUtocmNqOTlCMWM4blEvbkJHVU9hWHBaYXpm?=
 =?utf-8?B?VzAvSzNYcmtLR0NqTC80RnhqQXNaL05WUFpnSTA5RHRxVmNPSlk3TTlmNTZ3?=
 =?utf-8?B?WXgwSlE1dzRZem5JcFZWSmhuSmhRR0Vab2I5RFBUM3BuenJnN1Q3M3VIUzhs?=
 =?utf-8?B?cUtnTER0Z1BESHdvYUtBZEYvWk1zc0Q2SWtTMjVCOEh4aWlSYlJCWndOdVV2?=
 =?utf-8?B?dzc5WEhWbnZrOFpJOGRQT3orc1NRPT0=?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0c5714-831f-4a2d-fa43-08dd4043b9f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 09:02:58.2713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UEZNEPcG+nOVfYeLAp04xYUD/qM9wxpfjICR/xzUWbk0rcrPmgiDgJS6mvSk4WqR/XOtrd8+5ncRgC2kjrx3C5LS4H6iLG5GQBC4qge3pmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5031
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_010734_481369_C0D07D82 
X-CRM114-Status: GOOD (  15.14  )
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
> Sent: Tuesday, 21 January, 2025 5:53 PM
> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>
> Cc: Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>; linux@treblig.org; Shen Lichuan
> <shenlichuan@vivo.com>; Jinjie Ruan <ruanjinjie@huawei.com>; u.kleine-
> koenig@baylibre.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH v2 2/3] mtd: rawnand: cadence: use dma_map_resource
> for sdma address
> 
> Hello,
> 
> On 16/01/2025 at 11:21:53 +08, niravkumar.l.rabara@intel.com wrote:
> 
> > From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> >
> > Map the slave DMA I/O address using dma_map_resource.
> > When ARM SMMU is enabled, using a direct physical address of SDMA
> > results in DMA transaction failure.
> 
> It is in general a better practice anyway. Drivers should be portable and
> always remap resources.
> 

Do you think the commit message below would be better, or 
stick with the existing one?

Remap the slave DMA I/O resources to enhance driver portability.
Using a physical address causes DMA translation failure when the
ARM SMMU is enabled.

Thanks,
Nirav
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
