Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C8EC021BB
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:CC:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tMmxhcEiZcGEU0emh1nmX43UnidOAxZCLCtHZm5ezc=; b=da6eNIsAyCGlDcIZnyx/72ubdK
	ey1PpXhutZTtqGhPEPcGajKL+GQ6/UBDIhXvbuj0uCJhmwBPlbqBqiRy+8TUjuT0NCiR/d1cwCAdk
	Miot7izELE6w8X781AxP6li4aHlVPnOG4Orlt9SqUV7Nrmvk7cdowXUzGtKgfmzggQa5daEBqr1zw
	QuPpeLSERSYF7lqxSy5X3PBigrWkddH5pxoISmsPcauZVQXbdt+19qJQoH0Vj7XN9IszPO67kT2Hz
	dUEb508ghtpgnZdRqIXkUd4lIZWl5DP5gl3Md1MkEgOZEGIwH+eSo42yqz5Jx+8y43s1R2reJa1St
	R7euaaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzI5-00000000oVO-37zH;
	Tue, 25 Feb 2025 18:04:21 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyj8-00000000dld-258O
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 17:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740504494; x=1772040494;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yAnzZ+X/nF3HPSzMeLVeiF9IBWa5SHNm07AHg5ro27w=;
  b=Xy7jVl1a9dSkrWvJybOPhLv026+ru596eavIt5/JIVrmKYUP0V95pqi+
   H97fxlZhYMbjJQgdiWY0DLddmb+0B5hMH7yibY6s/JHB5ui619PmG42DP
   ogUBV/7jZVDuLKCXWyFRXukMcKW+F7HKb2gfcVI/kG4wNdr/8EoQzVEtI
   pEYQMCRY594B0KSQ1OLqKlcCmPIphspZcLPkXHzvze79tRuUQgHahmZo/
   WoTE5nbTr5yXAiyCTJJIs+4QjZw0h6aASr02pO2+z1lKSe5fOXlL8+b7S
   CrG2i1M64nmsgKEELgcfLwkBxwJmte8TKBjJJoyjgNIXxillmj/oQzEs4
   g==;
X-CSE-ConnectionGUID: VQ9V31aVT1GfH7igHXnghA==
X-CSE-MsgGUID: kadgpkOdTGiD8NZReoVbZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41340332"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; 
   d="scan'208";a="41340332"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 09:28:13 -0800
X-CSE-ConnectionGUID: //AUNvMoQV63nmOZXKTPvQ==
X-CSE-MsgGUID: NDetPQDPSmynIdG3sox1NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117381317"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 09:28:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 09:28:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 09:28:12 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 09:28:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUYZgoR+JCOk0g1OI6UlVG5B1aRIy5D9wmG/ZOH8dtrnY10vp/9rN2EuEdfXftlHAlWgPg+cK4H8xaLKduPjyH+oTR2NK/079KCdOMiQRc4Oic43efd2VHUsDICYcMvcpmzjdfQ5vlVEDd3RkLCd95orKcra10JMzurL3H7r1hp8rISHzlZqdMYGq9XH6FTmKrkb1k7c1FNNNm3Jnd4dnIDdW0H16Ud2Efkm2JNf+4wXz7wHDMhEbcG3eCrLqkTq/mjsFSEd1r8bfSMqNJO6lS1ooepLxvvB07k7sqFwO2q8dbVGx0UIKSc/xFdHRVbfN8aN5agnkmAz9iuGhI52tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSw9K3x5w2wq8j1FYiwURAZtNvnJnQALB6DQnjMC9ck=;
 b=khELgtFK6jGqKOKxdOHrT1n1trWgrKXWMp1XEJ8SaiszOXv8STdC2ImsBPlD/XAkfGaIQuDaoB5hw4bsOIcCiy23Nz9ly5ebuaynXhzqJyKNHRG1bCT2nZktOzq+LqO5kQ+vpKhqH96Rcgi0hunwiuVGYkihHCeTSTfvyBKA5Qk9XypwYQXasVxpc/G8xwFYk1U9RtKM0P/Yq4DpfVUGFiC8NdwgPvi0tGQx52l0wx0eyfT8ODpuI3pxY05fuPAkvolmmgx+25wlyAMqpe4IkV8qTCPzS2XMS4OrTU2E/nfasxLX87EM+fofZAX3Lon2tlixNHwLpJeBtNzcT7Jg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by IA1PR11MB6267.namprd11.prod.outlook.com (2603:10b6:208:3e5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 17:28:08 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 17:28:08 +0000
Message-ID: <15c121c7-aeed-480e-8b1a-8ff23b4a3654@intel.com>
Date: Tue, 25 Feb 2025 18:27:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH *-next 01/18] mm/mmu_gather: Remove needless return in
 void API tlb_remove_page()
To: Zijun Hu <zijun_hu@icloud.com>
CC: Zijun Hu <quic_zijuhu@quicinc.com>, Peter Zijlstra <peterz@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann
	<arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Johannes Berg
	<johannes@sipsolutions.net>, Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang
	<xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, Jason Gunthorpe
	<jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones
	<lee@kernel.org>, Thomas Graf <tgraf@suug.ch>, Christoph Hellwig
	<hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Miquel Raynal <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-rdma@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-mtd@lists.infradead.org>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
 <20250221-rmv_return-v1-1-cc8dff275827@quicinc.com>
 <20250221200137.GH7373@noisy.programming.kicks-ass.net>
 <8f36be7c-6052-4c5d-85ff-0eed27cf1456@icloud.com>
 <20250224132354.GC11590@noisy.programming.kicks-ass.net>
 <a28f04e5-ccde-4a08-b8fa-a9fa685240b1@icloud.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <a28f04e5-ccde-4a08-b8fa-a9fa685240b1@icloud.com>
X-ClientProxiedBy: MI0P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::18) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|IA1PR11MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa7e979-e779-4813-01f4-08dd55c1c56b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTIxT283UnZWTVRqSDhaYVJCdGRYQkRKdDJDa2lNL3ZwL3dTZW5oVW1vWjdk?=
 =?utf-8?B?U3pmNVVvdGhBSkJTTkM3VS9DZUdCNnZ2aE1qMG12R0U2YVpMVHRaUWlGRHJK?=
 =?utf-8?B?OEE0MnFHd3RJTlRKdXJJTmhScjMzRU5QN3FNSEtpNHE5TmNHVW5yRDFWa3ZG?=
 =?utf-8?B?VkcyaW9SWHF1cWs2YUZsamZrc1BwaXlpcC9HcFIwL2Z3K2ZJSnhxVEc5WU1M?=
 =?utf-8?B?dlRRY1hyNUtMZ0pzeDdjOWFOZ3RCWHJpdmFrT2ZZbUx0SmR2WmpKak13QXBU?=
 =?utf-8?B?WW16Nk40eDBCY2JzaEpLS240b3VUd3ovUUdpL091SHZkMTdjai9hSGRSSjZT?=
 =?utf-8?B?U1k4c0ZZa2VZWGJzVS85eW8vdUdNMEx6TzY2YXRoQStSV1IwUk9BUkVUaEgw?=
 =?utf-8?B?UHlEREZaVlhzeXEycTlDMjVDWktvMHExK3pWS1hmVVdKdHdDU3p3ek9MSWFs?=
 =?utf-8?B?NXF6ODJvTXZJc3pRRnk2SFdEUjVrZ1BJVnFMNFE4L05mZy8ySlhPc29ZRDRE?=
 =?utf-8?B?ZE00R0NDQlA1UytTbW5JOTgwQmZoZzlsMEd5QjkxV3d6U2F0Y0d4YU9IT2Q4?=
 =?utf-8?B?eWJaODJ1VGVVdGZFM01TSjMycXA5blpsdnFKeGhHUGpwWkNrMVIyOFY1a3JZ?=
 =?utf-8?B?UmlKeTZNME00cU5mRlQ4U21rL01rQXl1bkFjVjdNdGkrQ2JQWkRuaUl5Ukg0?=
 =?utf-8?B?RXVWd0d3VXVkcjRhOUlkWmlsdFJoSTFKakErSHZvcUw1WVBDSjVVWE51dGVo?=
 =?utf-8?B?RHEzeWJBMmY4cjZaSTdoY2ttZFc4aERNbFl5bG5JaDVrNnhJdm9BeldOdjQz?=
 =?utf-8?B?dDZuK1JwUTZ0QnVXdHBHNjBmN1hsRWlUbjBTakFRY1Roa2plMGJWQ2VYaklY?=
 =?utf-8?B?ano5Tngxcll3NXJhcW4wY1JYbG9iRW5QM2xhaDlsbDBNbW9BYXN2RStiMGlN?=
 =?utf-8?B?RWlkZjRjUmhHSXNmbHBXcTQ0aGhML3pFd0RnNHBwVDJteW1YSCtpNHZUOGZh?=
 =?utf-8?B?RXNZaThyN096TGQyWHhHV3lEYXUvTWdJdzY3azl6SnV1bythQW9tTHJHbTND?=
 =?utf-8?B?MFVWS1ZlWWJDaXBoWTgwYkxJSjRGTUpycEFOQkF1dWJlRWQwbWx0V2VzVHA5?=
 =?utf-8?B?OWNKZFcvSkZtWUJyRXNlOGozS0NCVWlmYVVDNnVMSGkxOWk5WlJLNGx2MnE4?=
 =?utf-8?B?UmNqQmtMVHVTWGo5TUNuQ2phcVRLNGc1R3NlaUJENHhaT3h5VVRZVFlDVzlJ?=
 =?utf-8?B?UHRHN0d1Q3R0eWNTZFNMYmtMM3dUM3V6SVVMSUllNURUZzZ4TCs2WXdJZE15?=
 =?utf-8?B?dnptbm10SytLbWFadmYrcFJidHNWYUU0ZWk3aVkyd3Azb2FISGE4LzRIOU13?=
 =?utf-8?B?NTBNcEx2eGRLeGZ1K2hpUE92RGV3L1BneGJ5VXB4eXdqWVVDb3JiUldNMnRO?=
 =?utf-8?B?dTloU1J2c1llTG1UVEpmdG9wNVF0NXZJcmpzWDN4SVdXd25KWnh0MERLbUt1?=
 =?utf-8?B?TytodFd6OFVWdkVRZWlGTVZGY3F5ZTRNLzNoZXFlZHUrSEtHNHFpNkRmaGV4?=
 =?utf-8?B?RC9tdC96TTNPL2EzeVlnRVB3blBZNnBpcVV1azR0WFFCUXpPQkI0SzdOWjVL?=
 =?utf-8?B?ajVIVnRpUWJxOEE1bHJZVXN1NFE1RVZnRW8wVndrM1BXRVd6cnBFTFkrNE05?=
 =?utf-8?B?Z29neGdxK3MrOE1CdHpzTS9zaDlCT09ja2pucTN1MTZFbThzUTdlUW9JYlFU?=
 =?utf-8?B?ekc4bCtxRHhka3NacGJCck1NZFFCNWwvZE1Kc29mRmo4RmxiQitBbHRGTUJV?=
 =?utf-8?B?em00cEFlSXpCd3doVUdkQTRFdEs3QUduQk5lVHFvYWNNVTJrRjJ3RWJsT0t1?=
 =?utf-8?Q?h/pEB6Gp/X+5p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR11MB8102.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzV0UCtPeXVhZThKY2VqVlUrdlBRRUQvTjhFdWxRSU1DNVVkb0o1bHN5V3Nw?=
 =?utf-8?B?TlVCb0c5dHpSSmJwWnhLSlNtZzUxeW5wNUhFQ1hwNVorTjh6U2dXRGRLWHpH?=
 =?utf-8?B?WXlIMkFXZ1liVTVmQWZHR2tuUzJIOXE5QndYQ2d1bTJnZkd2U0ZpOWZmd1NL?=
 =?utf-8?B?a2hyK2pnY3d1ZHBWQ3Jya3RiMzU2YlNmbFlhdVMvcDBJU09qaHRvZERSZmt2?=
 =?utf-8?B?a3RhSnQ5L0ZabHRhelBQZ1FvcjluZmwvaXR0YTJweCtDN09mNUZzb1BtN0VW?=
 =?utf-8?B?cldzNGx1OEtsYkJUY2I5eS9xRlVtTThnQlFObmR5TmZEWGJHZVVicWFRSXIr?=
 =?utf-8?B?Mjh2cStSUENXNFVpVE9OSUF3dkIycWNQT3N4bWpldzUzWDNscVZaNmVQZ3hY?=
 =?utf-8?B?V1JTNjZ3aVJXUnIwMThacVFRUW1OTm5uYm9TN2M3QmM0RFQ1dkFsOWxwSFRC?=
 =?utf-8?B?ajh6anMvdUM0MFlEbk9qckpCdHU4MEhNeVAwbVFzNWw5SUZzNER6SFh1SCs0?=
 =?utf-8?B?S1F0enhHdkVYWjI1MHRNYlNVWE1TMXloc2wwWFkrenExcVJ0OTB0bzVOMUZD?=
 =?utf-8?B?d2hxTnJOY3RuOTVHdE1mcTR4L1FVenhzSkxDdTY5c1NGZ1VKaGFadFpJeXl5?=
 =?utf-8?B?SHdFYW1VZXVXQ0twTXNWYjJBL0I0YWdqQ1dGZCs0Z0gyeXUwYnkrNDY3dGV0?=
 =?utf-8?B?TnM4TWFVRndpMldPbExXdUtMMnEwK1dQVHNOakNyc2haRVMydC90dUxjVWMx?=
 =?utf-8?B?LzVQR2pJc1Q1VUJEZExFbXJNNHM0UldrejJUanVCK3dEcXJGMGNhWHY4Tklj?=
 =?utf-8?B?Skc3OTFkVjA2azZJNDlaWGJBY05HTHNVU1p1WjN2UHdFT0NzTHkydEQ4dEV4?=
 =?utf-8?B?WkpJNWVQeTRVZ1lLYTFwS09aa2FDY1p3N0YzNE1OemZ4QnVBQWZib3dRbThq?=
 =?utf-8?B?Zmk0ejRiV2ZxQUlwSGtIcktjWDQ3MHRSRjdLM0svcTVBd21FNHR4dnN6UHZE?=
 =?utf-8?B?K3lrQmVieVNzeSswRzA1YlpwUEluVTQwZmxpN296Wmx0aWVVM3FTd3hrVU96?=
 =?utf-8?B?eTJCL2JXUzhmaHk3MVpnSTM5YTJHVENOS1ZDeVJRdGZoZjJyTHQ3R1ZmRW41?=
 =?utf-8?B?NTdpRW9RekhObjJleWhNRnhmUHlKb0pTc2xDVWNEZ2RsTEk0Mm1nbTlYUVpv?=
 =?utf-8?B?c1NnckttRU9hc2diZWNvM0svYkt3SUpFblAwZVRBY3NsbDBkdG1ldk1qY1ZB?=
 =?utf-8?B?dWcvNlh2ZXAwOFlXM1oyNklPZHFHZTIwekJqbGlQLzhvalRQb2dwWHR5QjBY?=
 =?utf-8?B?UkllRWlOcndYRnU2dEk0WUVjMGErUlRKMjBtZEhjY1RLM2RxcGR1aFNMVFVi?=
 =?utf-8?B?MFpTTUpGUmJHVDdBNlJkcUZKZk9qckNNc3d0TExINVIvZi9RRk8xSm5pWEVT?=
 =?utf-8?B?WDlJbk4zNmNSZ2d3RzUrK1lKSHRGV1gvZGVmVVNpREZlbWplYXVOcGdOZUQy?=
 =?utf-8?B?ai9GaHBHM3N2MnBTSmFBdHN0VWxscTQ5RkJldSswSHN6eVArUmJGNFFDMS9z?=
 =?utf-8?B?UGlLdXY5d1hTcHdpZ0VzTDNDRjZJV2ZmdWJuVzdOeXNTN2QvWVhtWXh0eWtL?=
 =?utf-8?B?NW5SMTRDaHkzT0hOcENtRXFFOTQ4WVdnTmIvTCs2eHhRb09MblhvZTlpdm03?=
 =?utf-8?B?MGJwdW5jYWwrRmNNZzBrV3F2RjFlUklJbXlFQll4OE5hZEM3U215L3ZBeHhT?=
 =?utf-8?B?TnJ3QlBnY0l3SGRTWmROY1hsL3pla2xJSkIwWUNFRnJ5dzYybkd2cjVvQU1V?=
 =?utf-8?B?UE8xeEw2bkNlR0hoS2owcWxIWFVnWUVqb0dsY25vSWROWmRYNC9JZE16ZTc5?=
 =?utf-8?B?aGk3aGUvd29aekE5cWxkQXRscGtobEZDUDZINWpMVFlHdjdsUmw2eG1kWEdu?=
 =?utf-8?B?bGFSaEtoY3h1RFo5VTBGbEQxeC9vWUNnUnFLb0hZSWdtVkpvdks0cHg2QTlp?=
 =?utf-8?B?dFkybHNNZ0ZaeWxPRWVBRTZTODMvYkdtaXp1NFg0WVNtbGZPcGNxMytMem1T?=
 =?utf-8?B?YXhGOG1vemtqOUpveFNXWVQvUko5SERzRkl5VlVWNGtTR2EyNCtUa2lLMXQ1?=
 =?utf-8?B?ajZKUnBzOHZJT2ZCalduTDR2RmtyN1pWTU1YTjU4MUNIVTVhc1JVcVRjYXh4?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa7e979-e779-4813-01f4-08dd55c1c56b
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:28:08.7931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5v3Key/DVhIio6zsw5HyCGTpxBdmmZKGlYNKbnmTKv5YT1p4vNsce5rbeILyDDZ7YIID9zgv6kz9wJOF21KS48lKls/4mpI8Glyjlagga0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6267
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_092814_601022_FD487499 
X-CRM114-Status: GOOD (  13.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/24/25 15:45, Zijun Hu wrote:
> On 2025/2/24 21:23, Peter Zijlstra wrote:
>> On Sat, Feb 22, 2025 at 07:00:28PM +0800, Zijun Hu wrote:
>>> On 2025/2/22 04:01, Peter Zijlstra wrote:
>>>>>    */
>>>>>   static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
>>>>>   {
>>>>> -	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
>>>>> +	tlb_remove_page_size(tlb, page, PAGE_SIZE);
>>>>>   }
>>>> So I don't mind removing it, but note that that return enforces
>>>> tlb_remove_page_size() has void return type.
>>>>
>>>
>>> tlb_remove_page_size() is void function already. (^^)
>>
>> Yes, but if you were to change that, the above return would complain.
>>
>>>> It might not be your preferred coding style, but it is not completely
>>>> pointless.
>>>
>>> based on below C spec such as C17 description. i guess language C does
>>> not like this usage "return void function in void function";
>>
>> This is GNU extension IIRC. Note kernel uses GNU11, not C11
> 
> any link to share about GNU11's description for this aspect ? (^^)
this is new for C17 or was there for long time?

even if this is an extension, it is very nice for generating locked
wrappers, so you don't have to handle void case specially

void foo_bar(...)
{
	lockdep_assert_held(&a_lock);
	/// ...
}

// generated
void foo_bar_lock(...)
{
	scoped_guard(mutex, &a_lock)
		return foo_bar(...);
}

etc

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
