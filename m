Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87093C02194
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ae9a3UEmWvkujfmUFZktRR6TNYO+VxsFBMEIKnYC0cc=; b=SJYTWUXhAy46hb
	/sXGf5d7DlxERpq5PSt6U2m4JiiQrEFcOConSVirYMTbb9AHevCyDx0pCkkko6Fgq5G9ZoeFlwD87
	kRkuxBuUsO36f8Pa6f7FHG1Akk0qCkgZA2lX+TcH9v+aEL4p7M0ZMKwb68edayno3VkxltzRaiFWd
	nNRQm4KRDrvy9AiqaKjkEm4nYGpC0ATpbMn4c7DEkfbYcQ7ji33ogLfzeXC7bZk3RfESKXCJKEEzl
	u33/yrShrp5HHZIc4mlccQ+s54rE2xAZlNLAYElaOjNnhgX/m4IJqsh3WTHC9RgQc1Q+2+hZa82R/
	LLeNs/0nTKiW5khzSi1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJfB-00000000eIP-0jiV;
	Tue, 04 Feb 2025 14:12:29 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfJe9-00000000eAV-0OVF
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 14:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738678285; x=1770214285;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t9JlUcExKv9LP9BaeYHDQfSxKS2cnO8KJ4vLD/3CSvo=;
  b=DvcQSY/yqQWacxVnoCmJZuLjT0UkbYJnmFUqaTIsIW1V03auMVI4anVG
   IJZDc+2HQJhliVvcfKzgVQ4RSLugAkzaiuMRbRwW7ML4BJVZiQFWA5YC0
   dMTSaenGM386Cn+uWfsGCdm37JTqI9LGxerRh6RX+qTJdRcNWUO+8Fvj/
   ypf9nOlkH3AL5Z2XCWj1by7uBzoNzh6gfTmfeMnilv2UiXH8dpzCN3oJj
   0ACk1+3GrgX3EJJ5ZzcFFbcAUzOqalNImlmd5mmYtylZgOzGOXihlyNtv
   i85J55ggWQHLL3t4N74t/OJ+/IpS1LS1hU7aK4vo15zUmZE7geR1tFjle
   w==;
X-CSE-ConnectionGUID: MXA+3BMxRIeCgQjjMjWywg==
X-CSE-MsgGUID: TPKYR6uyTAeb1l5Wn/puuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50595771"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="50595771"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 06:11:21 -0800
X-CSE-ConnectionGUID: XQ4k94uRTKWPd0oV1mtW3w==
X-CSE-MsgGUID: idNR/Nc6RbSMTT91K98s1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="111148924"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2025 06:11:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 06:11:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 06:11:19 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 06:11:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5qXyOJNTrYWBLwQ9lKdRZRsrCszv8mt6wskkx3JAIKcyl7QrHNXtOjJXnfUeXMDgVQlTbZDNilF+032vplKQA5LgS+zmdT85nCUk81wqDpbc7OfbtDsU56EUiS+Knop+N9LVq9armElriOox4x5UjQ+m8mgphEMOKnC2kQSmwxKYdeaVeTr8PoYW2zECPldxBTZ63hjd8j8EpQQUCigsXn9VxOpD9/MaYXvSPlmW4IAi2iUr/ExP6lcWVMCHHMCD3RX5IfBFJQDc9IqL5SGy9I9j7ows6QN/XF8Vc3quaYcNN//994TtIVtVS2MAiOb5sK+/XNcSq23rCNanIbsYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9JlUcExKv9LP9BaeYHDQfSxKS2cnO8KJ4vLD/3CSvo=;
 b=WclN4XM/Dc75SPCbA52MSuJ7mNi5xcrMVlwCVGnppKaUNIkUO0dvyPrr+va2jgen1+QQW9k/9MZs2MuNicpFd+ElzeeO9uwxB/Vzbibjahb8As2+45s6J97K2sv/YFmONoRns8AfrpJxTj4nOX0JtP4actcO+1W3tql1SlNzUvtwxNCJMeUJzBIVOkgJiQC/R/pYn+BH7hUUVblCXR0tgDc6jClTJFuv2AVbyGLnNYhUCERMgIbpWUp3P3Rw06RzAHxVSbeV98qS/1qeCimmkmcfv2TO8Tal23/hE5s1dnq+9vVi4wtvuU8FJQb0gBwmXl8CYxeIqTnH1t5gt4cSqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9)
 by CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Tue, 4 Feb
 2025 14:11:16 +0000
Received: from BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f]) by BL3PR11MB6532.namprd11.prod.outlook.com
 ([fe80::2458:53b4:e821:c92f%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 14:11:16 +0000
From: "Rabara, Niravkumar L" <niravkumar.l.rabara@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, "linux@treblig.org" <linux@treblig.org>, Shen Lichuan
	<shenlichuan@vivo.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob when
 DMA is not ready
Thread-Topic: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob when
 DMA is not ready
Thread-Index: AQHbZ8ZOILCVzRcq3EiB9N8/dGJ/ZLMhBMtugAlQtQCAA0UcDoAA++LggADu3AKAB1OZ0IAAI5krgAAWHVCAADB9joAAB7yw
Date: Tue, 4 Feb 2025 14:11:16 +0000
Message-ID: <BL3PR11MB653239DDBD9D8E7D413B60F4A2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-2-niravkumar.l.rabara@intel.com>
	<87plkgpk8k.fsf@bootlin.com>
	<BL3PR11MB653276DFD3339ADAADC70CCFA2EE2@BL3PR11MB6532.namprd11.prod.outlook.com>
	<874j1i0wfq.fsf@bootlin.com>
	<BL3PR11MB65321B556C59C995DC05C70AA2E92@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87msf8z5uu.fsf@bootlin.com>
	<BL3PR11MB6532451B44E7C5D82F5EC4AFA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
	<87o6zi83se.fsf@bootlin.com>
	<BL3PR11MB6532369D14375CC94AA2714BA2F42@BL3PR11MB6532.namprd11.prod.outlook.com>
 <87frkt96nw.fsf@bootlin.com>
In-Reply-To: <87frkt96nw.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6532:EE_|CY8PR11MB6865:EE_
x-ms-office365-filtering-correlation-id: 68a2e8d1-aa5c-4c00-39bd-08dd4525ca65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q3YyeVk3WlRIZytaeFcvMStmeHNDTkpkSUMyQU96d2gvRkRKRVRRSlptU2E1?=
 =?utf-8?B?NElXeXZRSE1LaFBCa3dubzFTM3pEZ3lBUzVqUGk2RTd3cHBpWlpOLzRaaUF5?=
 =?utf-8?B?UVM2YWtTVVhySXR1M0lUc2J3MnJiam1kaEkxZ0VZTmxXZW5wL2JSUDNEc29w?=
 =?utf-8?B?cGtqc3NRQmJUaEhydGxnWXlDSnRWMnRSZ1crejYyYWpXYzBLbUNtR3VZYUpX?=
 =?utf-8?B?MEtKQUUwRjl6cDdTNmd5aUUydTYwY1RSYWl0Rkx2M3owYjMwY3o1WkJodmNv?=
 =?utf-8?B?YThlTXZHR1d2eHpodlZCbHVOcGswbFhQZ00xTHRYK3lsVHNEQUc1SlErTGpo?=
 =?utf-8?B?TkY2YTJ1akJRMzZDTWVsdUZva0JtWHpSb1hZNHcrSlI1T0tMUVNqMXVqNnE5?=
 =?utf-8?B?TkhHMUJYdnZud0F2UkNWaU5BcUhodGNtMTkwL3V6T2NaNnJnUUNkMzVRNFRK?=
 =?utf-8?B?Rklsbkx1ZFRxM3NzZnUzKzR3cU5BTWNaQnk2TWFZR3RWZ0FHKzF4RjVDRjBL?=
 =?utf-8?B?V1VoRVpFUUZBOXBSVklyUXkwYk10bWdpcnVuN01TYkdiVUVZWjJtcEdCQUxr?=
 =?utf-8?B?K2gwc0c3NEExeEpjTTU3Nm5teW5EMi9laHhhMXYybElEWXgzY3dPOVk4cWlV?=
 =?utf-8?B?ekNNLzlwSU9RTFlFREM1clgyQU4wUW5HWEtyNTF6NDBpZGJpWCt2SHM3Ni9E?=
 =?utf-8?B?THEzS2Y2ekNvVGNvclhUTittWk02VEJkcVREdUlXUDJXQ2tzWmVOTDNtRDlG?=
 =?utf-8?B?aDdqSHJXd2FzeGhoTFo0d3NNejFNc0IyTS9hQ3V2NHNtN3FNYzdEdzNtRVgy?=
 =?utf-8?B?Nm8zaTk2TkUrV09EaHpVM1luTVhqb2Z0aktvQXdHYUVBc014VnNXL2p3R0tp?=
 =?utf-8?B?SWFhTDZyTWVtTTVXYnlKTzhPbXNHY2E5Sk84YW9zWWFPaitxdFd6ZmVySjMx?=
 =?utf-8?B?cjR4Y1hvK3IzWm53eW1lajYzS0hxb0hiNG9ZWWw5TEp2RnNnSGprSzlaQ2FL?=
 =?utf-8?B?WlkwbVJnWEJENXBVdmNaejRVSHM0cmtHRUZmZkNFbzNudWY4YjRFT2RudkR6?=
 =?utf-8?B?UXRXUFlFK0NZK0h0d0ZPYXY1S1dZSFFUc1ZUbUc1M2E1QmhWMHYwMk11OW1T?=
 =?utf-8?B?M2tDMHBvdEljZXczMzkyamt4aWg1UXNWb3dFVUt6QW10bFBFd3dSRVRVYjFY?=
 =?utf-8?B?c0tmeU5ZZDg3U0RycHVLbXhZUHdwTHZvREtVaVRVeFRlNGRySHdYeGkyQkRr?=
 =?utf-8?B?dktZc1BIenl2WWM3RHMvamNzN0JyVHJzVXp4eWsyMVg2RDVJZkxBa1lEY0RB?=
 =?utf-8?B?aHJ0ejZFYjhLQzlLbzMxdjlEanEzZHNlOE1TTTBGMWJEbW5TU0dEdExINXlJ?=
 =?utf-8?B?Y2k4VlZDOGRmOTNJZDNzR1BQbStwRWZRRzJxMEZVTnc0MWdkZW9EaHRyN09t?=
 =?utf-8?B?M09GbFUrcVVPTlp0QzBwSW1SZFNaT0pXV21OanhGeWM1ZXRLK0FOTFhvUFJv?=
 =?utf-8?B?YXQ4UHg5MzRFNmhJL3Z5c2NwZkJEdGY2VDlTSlZ5TEExYmNjSHVNdEN4b3gy?=
 =?utf-8?B?bUV3ZGhOUFV3dHMxQjJMSEtYRkNNM0VVVnI0UjM0bEVhSlkxRUl2ZGkvQkx2?=
 =?utf-8?B?V256MEx3MW05c2lvRXUxTUYyR05zV3lWMnlwU3pSaWp6ZGc2aHhhN3JHbFBG?=
 =?utf-8?B?RCtFVEExanorbWZzVmRsS1VBekVNVnp0bGt0ODdyOEEzMjJJMWgvYnhrZ0gr?=
 =?utf-8?B?OElqYXRVQWlWTzBCNWw2NjBiRXFEZGRGNUU1NWJWYXVwTWt0U3ZqTzh1TitU?=
 =?utf-8?B?ZkM4dkRFaVRJM2pzS0Rrd3VVVkdLa3V6OEhUOVZmWjZRYm5pSGRBWVRNODcx?=
 =?utf-8?Q?US6Tolx4Y4ek4?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW1GZ0dmY0xqQk4zOGk2dFdEUDlUa1g5Vzg3ZmhxZE9iaXpYRk01RG5ZNEFw?=
 =?utf-8?B?YWp6WDJaOVRzM3J2LzQ0NEU2SGZXL01PRHBBTHNLZEdsTmpTMjBDM3U1L3Nz?=
 =?utf-8?B?dGF4VHVwaENNU0dpNTd6NTJrZkVzMWZUcU1EREIvakpaWGJXUk1xNnlmeGJz?=
 =?utf-8?B?dVVWTGJWUlFmZTk3Y2xaQ1JYNkVSR1lHYUFWcGRyb3dNN0dwSUVoZzYwanBj?=
 =?utf-8?B?dUo0NmQzclF1NVpRdmQrbXNLSVFHTE1WWXFFbS9HOFlIU1JSd0Nxb1Q4QnhL?=
 =?utf-8?B?OVpkbkdZUFBMV1ZRM251T2lvMUlPYzQ4TlRDdm95Y1RiSGNJRmN4dUZnRXNp?=
 =?utf-8?B?cTNpOUVmL25EWCtESHpiZG53VUU5ZU5FTHNseFp0bTkzK2crQ3NFU1c1SGVU?=
 =?utf-8?B?OEJkUmdBek1zR2lkMDNMQ0ZGdFp5OG5xUWVPcWtBVWExUjNnTHQvN1dJK0lI?=
 =?utf-8?B?Qk9zU3VNc3U1eUpuQnNaektvb2dybjJZYi9kNTYvNmxrTnZNc2wzMjRzNGIw?=
 =?utf-8?B?SU9nR1FLbUtXNENpQUdzTDNrcFQ3RkFQMUl3bTRLTmtkWDR0WlJ6d1FYYXJo?=
 =?utf-8?B?cTdUTHNuNENsNWpPWFI3ZS9TUTFFelNEeFlCMHJnMjZKQmphVEo5UTVuRk1t?=
 =?utf-8?B?bWhFTkVKQ1NrUVJnUTBoWi9sMFVDZUQ0QVVDaGhybnVXcm1MaEhoUTU4NFNr?=
 =?utf-8?B?RzI0OVRnZ29ZbUVsMzdtM0RlZVM2WGZGaHlXVWZJVEJpOENtemN1U0lLVmo3?=
 =?utf-8?B?QllkV044eUFSeUlZU2NVb21mc3BPSG1QM1UwL1BJaFoxTnUwaWdaR3NoTERo?=
 =?utf-8?B?ZCtlUXFQbXpaVHd6Y1dkcTlrUTlOckFKcVdQanpXbGJWdE9YYnRmczVPWlRw?=
 =?utf-8?B?NjlDT2w5K0E4U0htY0RidHF0U2NzdEpKNW1XcGpGejhsMjJwUExmU1o4RTRl?=
 =?utf-8?B?WDlvdWhEN0NzMnZ0M3UwMTdUM2gxVCtGS2k2ZzhGMGRMdzF2ZHF6bjQwcUFC?=
 =?utf-8?B?dDFKZ1crWGp6cW1QbjBHemppKzBwVHJ5VnVPaXRHUmVTcXVxbDN6RXlvejE5?=
 =?utf-8?B?NGJzcTZUSEtDeEQyRW50K0JhQzMrWUZQUTBoeGVJcHlLbGl5VGlvMGVGY2RJ?=
 =?utf-8?B?R1RjdSsvUU5RTjNuSGMrZVlFekVRRDdYOGk0ZWhieXZnZWZQRm5RUlF3MUtT?=
 =?utf-8?B?VHd3cG1hU0MyaVlLRjNOMUtSaXhkVkd4Z1RNUjdPQlZRc011WUZWUTlrdjJI?=
 =?utf-8?B?dlJwV3hZSjA5WjhSNEJZTHdEVmwrcmdWV2hlMFNLZVgzZUZGdHlMSE00UEp5?=
 =?utf-8?B?S0orSGVRdzJhUzNGOWJValFjd051WC80MWxwYncvdWZwck1QZTVhT1JyYzFi?=
 =?utf-8?B?QWRjWmQ3bmVzb2JVYldPc3FkeUZvTml0NHo0R0lBMW1lOGtmbzhkR0tDVE9t?=
 =?utf-8?B?WStGc3B2dkZDbmNIc0FLa0lzNlF2SDZTeFlCTUd1TGpvclg5bUdyQTZBa2Ey?=
 =?utf-8?B?QjFlSVl1Qis5TVo3MERZY3d3dlBzdk4xdnA2aDhvN0xqdGRYTzJ4c3oyYTIy?=
 =?utf-8?B?RzNXV2pMSldmQ08zSmpicXhsdGNUMi83dklkbUIxWlpnYWpCSlF3WlNxOUtk?=
 =?utf-8?B?eDlIUG1jeFY1cUxVVjQ0akJpVGtCVHlBMHZJdVJuSG5WbTQrVDlXQUMyUlhS?=
 =?utf-8?B?NDk3TmJYY2ZJcEpZWUVVaG5Xb3czWUVtZ010SktWcVVLTGROVjZQNjBJaWYx?=
 =?utf-8?B?ZkN3OEpnakxoVG5iRERKMDlUWHJQbHJkUFFaaFRlYk0zMjNoQjNQaFJzNzh5?=
 =?utf-8?B?NUxKZ3BiN2lMdlduL2JpeDBGOHIyUEk0c2wrS2lXTnh2SnhvNEVyeE14bytT?=
 =?utf-8?B?Mm5sV0NRRkJIYmFBeDQ1SjJSeTg0eHFQaC9sU0tZUXp2ZmxBQkxwSEtTTTFj?=
 =?utf-8?B?UUV3bGJ2a21BT09RMkJlS2ZaQnNkSVhod3lrNDFRMFp4dEMyTlN0dVE2SC91?=
 =?utf-8?B?Sk1kUVZFZjBuTGZFNUY1ZXZvUEkxSVlpbk94L1lZclRubUM1SnlLdXZmYXNE?=
 =?utf-8?B?a0FVbzJCcUlhVTF2aUhEL3drQUJLNk4rNFdteFpXYWE3SDhSV3ViaENlZVY2?=
 =?utf-8?B?TkFWNkJ5VFVVcFdrSkM5Y21Td0NjVFlkaEtmYnZQdmN2dzRzRmIxc0dzbUwr?=
 =?utf-8?B?clE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a2e8d1-aa5c-4c00-39bd-08dd4525ca65
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 14:11:16.7807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FwQbTPT/6Vbpv216DMVO6TgFeDNSSRIcU6v+uy8ZhXjlnB+NLkSBuiV/YkXXaEZ6e+6U205yqMW6EMX4Tg3ZmBbOsxP/SuNgjCKAZbv3zOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_061125_251589_6211E4A7 
X-CRM114-Status: GOOD (  20.16  )
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
> Sent: Tuesday, 4 February, 2025 9:33 PM
> To: Rabara, Niravkumar L <niravkumar.l.rabara@intel.com>
> Cc: Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>; linux@treblig.org; Shen Lichuan <shenlichuan@vivo.com>;
> Jinjie Ruan <ruanjinjie@huawei.com>; u.kleine-koenig@baylibre.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH v2 1/3] mtd: rawnand: cadence: support deferred prob when
> DMA is not ready
> 
> On 04/02/2025 at 10:43:20 GMT, "Rabara, Niravkumar L"
> <niravkumar.l.rabara@intel.com> wrote:
> >> Hello,
> >>
> >> > My apologies for the confusion.
> >> > Slave DMA terminology used in cadence nand controller bindings and
> >> > driver is indeed confusing.
> >> >
> >> > To answer your question it is,
> >> > 1 - External DMA (Generic DMA controller).
> >> >
> >> > Nand controller IP do not have embedded DMA controller (2 -
> >> > peripheral
> >> DMA).
> >> >
> >> > FYR, how external DMA is used.
> >> > https://elixir.bootlin.com/linux/v6.13.1/source/drivers/mtd/nand/ra
> >> > w/c
> >> > adence-nand-controller.c#L1962
> >>
> >> In this case we should have a dmas property (and perhaps dma-names), no?
> >>
> > No, I believe.
> > Cadence NAND controller IP do not have dedicated handshake interface
> > to connect with DMA controller.
> > My understanding is dmas (and dma-names) are only used for the
> > dedicated handshake interface between peripheral and the DMA controller.
> 
> I don't see well how you can defer if there is no resource to grab. And if there is
> a resource to grab, why is it not described anywhere?
> 

Since NAND controller do not have handshake interface with DMA controller.
Driver is using external DMA for memory-to-memory copy. 

Your point is since the driver is using external DMA and it should be described in bindings? 

Thanks,
Nirav





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
