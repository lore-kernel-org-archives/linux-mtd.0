Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338EFC48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Feb 2024 12:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cC45IEwyx+dlZCQmGVJvtXtGoSNFHaHdWwneiULZvXM=; b=yXHvRBiekAC0yc
	chdacXlx2GkLH59zbTISr9uAe72ZmjdIal6w+t9zhdoejG7r2hCK+IE7FK2sQbHbC/akl2VYcxxHZ
	SxYeD2gfyj3+OZ3cx1+qnZYXE2NHyaYsmyONr5HSNqP1O2tGGJUsj4sFJWt81tjU9j6eVS0cfk4Gb
	hXgOgVmfp6qNFDgF9N6d4tMjOgvtKlrSQ5a+2rrzGTRd0JE5oz58Co1FtLd+5DJfoK8aADelv3L6N
	wxX1IlN8FUwTBOYaJcWaxShnvaAA/Q5Pa971afUVeshn/4YLcI2qiFSOKWwvXIEVvtyU1Rpa3YDfU
	4BiVB8KR2NpFt2PnUh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEUE-0000000CqZB-42pA;
	Wed, 14 Feb 2024 12:35:38 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEUC-0000000CqY4-0kKt
	for linux-mtd@lists.infradead.org;
	Wed, 14 Feb 2024 12:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707914135; x=1739450135;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kddIO29y0zowUmNdZzbUzlhZ2f4l/bukaxwy7FWXF2g=;
  b=mKkgYcE19oyk0bnMvXmfvru6tArKQuN7FTw0owTF9Y7zK76OvOPzwdnm
   170I+/7KJtRW2qAqYg9rOZIGtUGKjZiZAYCn1klZNtUPI0Oykzo39/pB1
   Ane8Qm88zK60a9S3nCPRRQK8/9tnPWIH20cLbr0bJsRk7cFuHFLL/ZjaD
   kGEJIvxD7BkNRh0inPeWXtj+JLdnA2IqPda4RtbHzklYcnL5352r54TU6
   DO1JqT+eZBMHTRR25OkYvFettO9j0UYt2VqCcXVp/5VIQsKku8mHbnUTU
   SmkT41KAEfi6U6Y/Ei+AXR9w5RQPbf3HdjSRI3EJkIS8GWZNBctLlUsOD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2327514"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2327514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 04:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3495798"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Feb 2024 04:16:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 04:16:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 04:16:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 04:16:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GazOCdG7ulTfAYBKKvy9hxrAjXNtf35WVrkTQUp3SeAzrt/AZGPrS0YgA7RFKPJaLiSazIAau5qTN4ScZudu0YeetmELas2Z5vwY0NG3XrCkszDEl6jMsAfae21MSqcaA4k8Kqzi7fIv62BwbSojL3felOFRUyFGHSOA3iBYinfI06cFjvaFYYdFUe2gMrk41uv79n5E6WSohGiPH+aBJFbOtDNjAGJnt2v2iKy5UuU9Ip8vR7IZlxbWEhgpfddNuqxfWWAcW/QAhd/gS+MDd98W6Xnrjg0GiwKXdlrPGt7MSj3hxryjldm+bAAO6fJzh76KUouJF/fAwdhShhrVuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kddIO29y0zowUmNdZzbUzlhZ2f4l/bukaxwy7FWXF2g=;
 b=E6NvKP4xFuZRiU93mjDOHz9sCCaxuCTBDvlOCdjR1FKMcfi/QE0DX9beoLBc8rw7uB5+EoISsrSkfanj5/3eklT2GEC9ZvPMdmczlqFZ0i45jaKIHDyuJKfVZYbkUCyS4XaDbOhBD4SL58IQEoDCEzF6V8KCFwfoOFPWX7fG/HyZnsbiPk2IIoqXuQ2BqOE72Y1tLVPAFecX3pTvDSZhvE4C7UFmuKCsPORwitYASJXMOX0nNPlfqAc9hNWcfBYC4rkrhcXhTLE6Uxi9KmRTmM//W7XdhW0VWkaFO/8sT7hEQRWrHPSkHpUMl2tXj7aKSYMc9htKtzoEdIP+kxql0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ0PR11MB6621.namprd11.prod.outlook.com (2603:10b6:a03:477::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.41; Wed, 14 Feb
 2024 12:16:00 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::1819:577e:aefc:d65d]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::1819:577e:aefc:d65d%4]) with mapi id 15.20.7249.039; Wed, 14 Feb 2024
 12:16:00 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
	"Lubart, Vitaly" <vitaly.lubart@intel.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "Winkler, Tomas"
	<tomas.winkler@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
	Michael Walle <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: RE: [PATCH 06/10] drm/i915/spi: spi register with mtd
Thread-Topic: [PATCH 06/10] drm/i915/spi: spi register with mtd
Thread-Index: AQHZ4+SWmqcIZAUsFU2z1MSft+JTq7BMUNCAgAHIK5CAACJ6AIAABanAgAAIdICAK5iEkIAAC8QAgJDIeHA=
Date: Wed, 14 Feb 2024 12:16:00 +0000
Message-ID: <CY5PR11MB63660FF7942CA400439B76D8ED4E2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20230910123949.1251964-1-alexander.usyskin@intel.com>
	<20230910123949.1251964-7-alexander.usyskin@intel.com>
	<20231016103939.67445bee@xps-13>
	<CY5PR11MB6366850CCE851BCA05A9DC2BEDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20231017155544.6cceb6a6@xps-13>
	<CY5PR11MB63663DB0C17321A1A0C46FF3EDD6A@CY5PR11MB6366.namprd11.prod.outlook.com>
	<20231017164615.5b58fcc6@xps-13>
	<CY5PR11MB6366383C8C0DCA9B3D41BF63EDB2A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <20231114101324.39569e96@xps-13>
In-Reply-To: <20231114101324.39569e96@xps-13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ0PR11MB6621:EE_
x-ms-office365-filtering-correlation-id: 5975fb3e-3878-4d4f-d0b1-08dc2d56b4b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uyIetpSPdSMd2AAFgDcx635EvwTc16kJB3Lrk6kqn/Z8zhWfL0hKd3dFZsc6Nd9Nyx+IZYwZXLGic2ad95xp2/2gosGI/z59B9OyAD3gWn/9l7pxB2axZcSuoL2wml3uEbMcbdbN3AmcGMiZlsK1G9p8C7gDc/wnJzWvC25eOTrMlIRot7dLLrz+br7hbZyaTLm5hvSCyQ14oXtDHkaspMZ7HZyKKx9NSxFcP0j4RO4NXDPyn9c9xstk+bAK6BbBJ7z6SDgatu7+YiaqAWUh6WcY9fCzjU0rWf8l7mdaMgIOUJdn4ZCj7RBFuJdvMkYpmB3hssxN4MJ/1KBftEU5bgjD+CowlQoCKztJodXw2OP9KIVP7+BcF2Jfql1bJpb/hVWSfGY7yZRl/b5o0k2jdPbgAYX66ny2O2oG28dpjMtIo1b9pUD0KmAbFAIbocDM/MgEBC7szzbdJ1SA3YrdlUbPcFrZBX60LcbPb7DpYyp1e1Q80wj1QX5/44g7pepB+QQKMJEEYxfHWT9SQHKkJwyszv5ayFqFGipEkPaziKwS/vWaGqs3COJaAasq5Cp2IcMzfQBaekcW/iImaFKNx5Jlt6QP8rr5IN6dDFBaptkNHGj/pBFud/6elcU9YvjP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82960400001)(86362001)(54906003)(66446008)(26005)(478600001)(6506007)(66476007)(66946007)(76116006)(6916009)(71200400001)(7696005)(64756008)(66556008)(38100700002)(122000001)(9686003)(33656002)(38070700009)(316002)(8936002)(55016003)(4326008)(2906002)(52536014)(8676002)(5660300002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2c0ZWkwWERMWG1lSjRFVDJuL3ZIYldxVmFBckZTTVFwWHNXRmFNdW9oaThZ?=
 =?utf-8?B?V0dhVFpCa3FlY3A2OHFHWnQ0Tks0cHdyeTU4Mk90Y0RSQXRmRVVkTUtMczI2?=
 =?utf-8?B?TUtFZ29VditUdXhhSW9pTlhZSlMzaVlINFBmNVAxa0dkMU5Xd3Mzc2xFQ3hU?=
 =?utf-8?B?MFMxNHU2N0ZkcTRhYjdvVjBSbkpXNWFuNFYxc2dOVy9ZaVBmRTlWUWlEdllD?=
 =?utf-8?B?MlBpYVU3cHVRN3ovZmVXT2tZUHdjNXprREdZS3N6MzJUcTU3SHBnV2hUM2xs?=
 =?utf-8?B?c1V3WFd6bE0waTBhVGVVQnoraGt1dDliamxMSTlEVFYrUStoSUcxaU1vZFdV?=
 =?utf-8?B?aXZ4N0R4Ny9OVnBvL1d4VSt2aFJKWEFFS1gvOVNPYkJZVnVDNVU5TzlqMFhi?=
 =?utf-8?B?M1BtTk5ldUp6TGxxQ2lIdzgyQWNUbWt2RDdaaHd1ZWYwWDArOEVPRmJrNEpu?=
 =?utf-8?B?TzFWZFRnQW1vQ0wvdGNWK092djU1THNOWDI2UnZkVEt3U3Bqbkk5WWpqUFRM?=
 =?utf-8?B?dXp4SFgvNWFhRGVzOERuNVpnZHZIUlZXSUY4KzVvVXN6Sk1hd1RDdTJuelZu?=
 =?utf-8?B?V3JGS1d6UE9xajRGa0ZMNUZVbVVYZ0dpVmhPd0krbElHbXpQenRwOXAwTE56?=
 =?utf-8?B?SXNPNk15YUtVRkZOQ3IrZHNvV2h0c0ovWmtkcDE4Mm0yalNqY2hsRVhsV21L?=
 =?utf-8?B?c2Rqdms4ckxNWVhNa1NsOWNERHdwemJIemR5N3FyTHU1alZ0UVBVYnZnL2tL?=
 =?utf-8?B?RjlUcVlLSFFHMUZUeFc1bE9tU3NlMmVMZDJ6TU1UWHBrMFc2UzlSY0ZvSVZh?=
 =?utf-8?B?Z0RjZWJPeUxvbnRTNXYwbzJLMFlZaSthWWZFRklDdHFWWmoraUNpbTdQY3RD?=
 =?utf-8?B?TEdNUThHSkIvUHN3SjJUNXU3cTdYZHI2WkF1UTVWM29xVzZyVnN3ZUdUZkpx?=
 =?utf-8?B?QWFza2ZHTldvQ3RodCsxUVlMWUw3UXQ1LzFmY1RITUprNi8zek9XeTNTWTB4?=
 =?utf-8?B?NFR2RVM4QWtzQ1dhM3N3ZE81eVFOOWhZclorSFlPcFJick5rcWdkMm5wYTlV?=
 =?utf-8?B?dE5qdkhUZ1p6Z2VDK2VzQUZTVlQ0b1FjYjJ3NkgzcXlQODZtb1pSMlJnVDBp?=
 =?utf-8?B?ZEVadHlMbzNFZW9TbXhPT2MwTEpYR0hpSXdvcFpWbEFCTGluQkgxSnRJMjgr?=
 =?utf-8?B?eFc4QkU2U2wvU2MvK2JFd1p6MW9BZmozSko2SHpsMFhaUWYvc1Z6V3Y1Q3o5?=
 =?utf-8?B?YmFYSHFyNzAvV1FaeDQ2NUhxdTQ5L2dQWVE2MHlyOXYvOGpZNFVhVXcrUmdp?=
 =?utf-8?B?YVBNdjZDeGpGSDVzUkxLMXVPYkhIaG9BZXJ4cmh5cVpGdE5tdEpidDZLSlRP?=
 =?utf-8?B?QTVUbHh0MHczVDNGakk5VGhPa1pCVWdzT1B0MmxqK2dkUklEOE5WMUxoWUFQ?=
 =?utf-8?B?cTNhZWM0NHM4UGZsMWVqeEJ4bDI0YzRvcVJLc21tN3M1TmI5VFFkaTg2M0Y2?=
 =?utf-8?B?YSt2YkI0bkVmUjhta1UyRXJINHdJQ2xnekU5M1o2S2IyTDV6Z1FXTzdRWWIw?=
 =?utf-8?B?UlVPa2twSjcrSnZ5N3ZtemhIOVpYblhTeC9JTGErVWNGdWRQRzVIYkRMejdC?=
 =?utf-8?B?ZlZYUXlCSHdzNFQxcDk5Z0JtbHRDUk1wZXJvWU1lMjlGR1hRcC9HRnNITWFx?=
 =?utf-8?B?aEVMTTMzbVNPaEZwNjhqRGdnLzdCRVMyT2pqaXFBZ1ozM3BKMkdPelEvRVpJ?=
 =?utf-8?B?RStWZ0ZrMWsva3dxanpMUklJanM2RjFPYTFsTnZ6NjU4d1JhSFIyUXFMMWJQ?=
 =?utf-8?B?RHdGNUNzMmo3cmtjY2RkcXduQUpWcytpWllSUVY1VkxXaDc2eU9ONGtyM3lt?=
 =?utf-8?B?YmpRdSsxT0RhbmdXbnpjeG4za1lpOUlFdGdCbDAvMXA1RGR5SGZqQzJDKzVI?=
 =?utf-8?B?SXlPZWozYzU4eXdSbVliRmhuLzZYa1U1c0YxaFM3aDhJNEFrQUVFMHJSMFNy?=
 =?utf-8?B?SVpGMEpGWUFIdXMzcEkyNTAyY0toYlFCZExmZUNTYW90NjVSaElsMnM5SFBE?=
 =?utf-8?B?ODhNWGExMWh4Y3VGYzNuRHRuT1J6YlBYRFVITWtXYjJxbUpNaE5rUUpXNlBC?=
 =?utf-8?Q?cXkWRMWAwZpMzCla6tFZSsDSD?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5975fb3e-3878-4d4f-d0b1-08dc2d56b4b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 12:16:00.1590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbpVsqOu5Qy87Jbm2mLxAfLULid59i9SFPoz4CPPvoPZ6ZVYrdnMYZZBqSi4NB/Lk1tfKzUPw8rvWZ4laellzPd/DVVFpu0JJoK2GG+wL3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6621
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_043536_301931_ED2E3DEC 
X-CRM114-Status: GOOD (  25.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsDQoNCkludGVsIEdmeCBpbiBpbmZpbml0ZSB3aXNkb20gZGVjaWRlZCB0byBjcmVh
dGUgYW5vdGhlciBkcml2ZXIgLSBYZSBhbmQNCnRoZSBzcGkgZHJpdmVyIHBhcnQgb2YgdGhpcyBz
ZXJpZXMgc2hvdWxkIGJlIG1vdmVkIHRvIHNvbWUgY29tbW9uIGxvY2F0aW9uLg0KU2hvdWxkIGl0
IGJlIGRyaXZlcnMvbXRkIG9yIGRyaXZlcnMvc3BpLCBvciBzb21lIG90aGVyIHBsYWNlPw0KDQot
LSANClRoYW5rcywNClNhc2hhDQoNCg0KDQo+IA0KPiBIaSBBbGV4YW5kZXIsDQo+IA0KPiArIE1p
Y2hhZWwgYW5kIFR1ZG9yDQo+IA0KPiBGb2xrcywgYW55IGludGVyZXN0aW5nIHRob3VnaHQgYWJv
dXQgdGhlIGJlbG93IGRpc2N1c3Npb24/DQo+IA0KPiBhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5j
b20gd3JvdGUgb24gVHVlLCAxNCBOb3YgMjAyMyAwODo0NzozNCArMDAwMDoNCj4gDQo+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+ICsJc3BpLT5tdGQud3JpdGVzaXplID0gU1pfMTsgLyogMSBieXRlIGdy
YW51bGFyaXR5ICovDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFlvdSBzYXkgd3JpdGVz
aXplIHNob3VsZCBiZSBhbGlnbmVkIHdpdGggNCBpbiB5b3VyIG5leHQgcGF0Y2g/DQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gV2Ugc3VwcG9ydCB1bmFsaWduZWQgd3JpdGUgYnkgcmVhZGluZyBh
bGlnbmVkIDRieXRlcywNCj4gPiA+ID4gPiA+IHJlcGxhY2luZyBjaGFuZ2VkIGJ5dGVzIHRoZXJl
IGFuZCB3cml0aW5nIHdob2xlIDRieXRlcyBiYWNrLg0KPiA+ID4gPiA+ID4gSXMgdGhlcmUgYW55
IHByb2JsZW0gd2l0aCB0aGlzIGFwcHJvYWNoPw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSXMgdGhl
cmUgYSByZWFzb24gdG8gZG8gdGhhdCBtYW51YWxseSByYXRoZXIgdGhhbiBsZXR0aW5nIHRoZSBj
b3JlDQo+ID4gPiA+ID4gaGFuZGxlIHRoZSBjb21wbGV4aXR5Pw0KPiA+ID4gPiA+DQo+ID4gPiA+
IEkgd2FzIG5vdCBhd2FyZSB0aGF0IGNvcmUgY2FuIGRvIHRoaXMuIFRoZSBjb3JlIGltcGxlbWVu
dHMgYWJvdmUgbG9naWMNCj4gPiA+ID4gaWYgSSBwdXQgU1pfNCBoZXJlIGFuZCBjYWxsZXIgdHJ5
IHRvIHdyaXRlLCBzYXksIG9uZSBieXRlPw0KPiA+ID4gPiBBbmQgc3luYyBtdWx0aXBsZSB3cml0
ZXJzPw0KPiA+ID4gPiBJZiBzbywgSSBjYW4gcmVtb3ZlIG1hbnVhbCB3b3JrLCBJIHRoaW5rLCBh
bmQgbWFrZSB0aGUgcGF0Y2hlcyBzbWFsbGVyLg0KPiA+ID4NCj4gPiA+IEkgaGF2ZW4ndCBjaGVj
a2VkIGluIGRldGFpbCBidXQgSSB3b3VsZCBleHBlY3QgdGhpcyB5ZXMuIFBsZWFzZSBoYXZlIGEN
Cj4gPiA+IHJvdW5kIG9mIHRlc3RzIGFuZCBpZiBpdCB3b3JrcywgcGxlYXNlIHNpbXBsaWZ5IHRo
aXMgcGFydC4NCj4gPiA+DQo+ID4gPiBUaGFua3MsDQo+ID4gPiBNaXF1w6hsDQo+ID4NCj4gPiBX
aGVuIEkgcHV0IFNaXzQgaGVyZSB0aGUgIm10ZF9kZWJ1ZyBpbmZvIC9kZXYvbXRkMCIgcHJpbnRz
ICJtdGQud3JpdGVzaXplID0NCj4gNCIsDQo+ID4gYnV0ICJtdGRfZGVidWcgd3JpdGUgL2Rldi9t
dGQwIDEyOCAxIGMiIHBhc3NlcyBvbmUgYnl0ZSB0bw0KPiA+IGk5MTVfc3BpX3dyaXRlIChtdGQu
X3dyaXRlIGNhbGxiYWNrKS4NCj4gPiBJIHN1cHBvc2UgdGhhdCBtdGQgc3Vic3lzdGVtIGRvIG5v
dCBzdXBwb3J0IHRoaXMuDQo+ID4gT3IgSSBkaWQgc29tZXRoaW5nIHdyb25nPw0KPiA+DQo+IA0K
PiANCj4gVGhhbmtzLA0KPiBNaXF1w6hsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
