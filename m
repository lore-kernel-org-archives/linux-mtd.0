Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270CCCCD1AB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Oct 2025 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UaLhrC72xqZs2bEQXISSyH2JSxVxFwUA237S6u4v1w=; b=qf1tk6vLuG/MKy
	ZoHEX1QPJMhi2jDS42+C0C5lh/oNi+lx0ruhHeDa9y8MXPhgqq/NFrqZEI/S+YSg3NpoUZ6AN2yq2
	r7rijKloJUkE16h+DsYqD8nFv9AoQ79t8GSl5nAwb31H0SUAFotX5PgfTnQ3T/NB7gqvJWb+6oc6w
	d9LAog+8Jk1OoCQlUtwuJBHXPUnw4MFLCTdzTke7ru6benhzpzN731KXGzWTcagUjeTgqXJVIFfAt
	GFJChSmUKLxP+F4Znqiw4/1N/p0jY2cj41xOUJcuhp4xKfyrPXF1hkLo77PR1Th7RRGLm7nFd/FY2
	wieoIpszeGSFMWYIGXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZnM-00000003DMJ-1TOb;
	Wed, 22 Oct 2025 14:26:32 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZnJ-00000003DKl-3x1n
	for linux-mtd@lists.infradead.org;
	Wed, 22 Oct 2025 14:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761143190; x=1792679190;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OPpOoT7vl77YkyvJVjCDDqY3PzzooirNc91neFsp3MI=;
  b=jmmfhn7NNWTzo4XD9YizsyXVoPbP7y+EwLO5omS93I12vbKupJgsCicF
   ZvJu4uPNuMzBDqtBHw2OjnMi8HpWq9HMA7JjXZ83UQrVW2iiLsV+YmzGj
   Xei5HNMN4cyzKjZKfowRjPgkgFJdfqd1h3cYeX8tuL5VKrMb/HRlWHcOz
   OkQOSXe9DoopZWOGLfJ9USWP+LzA0bu1qqB6N+uA8Q1VmXg7rSLYSBwLj
   9eQ19GYD2BHO1nOk1h+BssWy16YMdqIiq8i0Wjn5XEOAudPvqvSp5DdvB
   daqA3WDG9iSFWtmE7VJcik2XOGf9UEB1Cx0WHMu36M/MX1cs8YD/Bc9Qy
   g==;
X-CSE-ConnectionGUID: wuJGhgzvQi+T+lWORp9jwA==
X-CSE-MsgGUID: 5X3vykXASiGSPLz6Ohu05g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80730221"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="80730221"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 07:26:29 -0700
X-CSE-ConnectionGUID: v6sVH72eRzCKfncAA7KA+g==
X-CSE-MsgGUID: izXN1pa6R+uylh8+WRwHAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="184285930"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 07:26:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 07:26:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 07:26:25 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 07:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWzV0h3mAl9eEq/J2mOuQjB/SfGrCsqTJ698ePxHYmFF4xc1yXyQ7YDw5L+viJoiJaDZsubMOYYCxn/P1hl71qCD6cprAVGFaqw8gfaj7a8IKmE6WAq0vuqYRaX8FSglP/mwMw6PpKr0sMKrOknjKvYX98SLacjclUcvUuTssdpW20/mjEKdAxaLJmsvfe5Y7qGHXi0HvTxiYArHhxVONGAxsfgrplIakvIllh/PLYwRy9abd+Qn93UAnDpfMyluqI9sNiOyDC1sE2XJFY1Wee4SD4oBA9cx7nCc3TU7677tieGuejxe6063TaYYZHtLIX3WGeJikxUtrOijSw1fRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPpOoT7vl77YkyvJVjCDDqY3PzzooirNc91neFsp3MI=;
 b=XyhaHgig7PKEBogCj6PsKqbrHVUhftchLHKkmAtPeCBGF57PcqMpahwSpz3pKu0yWxLl8j8/yaee/aq8tFp8hsvqZUpX9gCTFN/KV6b5us6H4ZJMdeDRLqTaWHO/jG0O8Z6lxs1bQXZSlbQTS39hsxSIs3oVBL6hS7FAt6hbo2lsNvw4clje4s9ZxJVOpxq8YEyKZ733eAHXXbNgk0IjY+wTx1IzZVdwASs8Drcukk2VXLOkC8V9KBpamJx5BeF/XuL/uVlVvcKDjMFJ+FEsyAQ+jbrjectB8BMKFQf4oj9ItF5gBkUp+j+dgyezsiy4ZP7AKrFwsQZDVaTAXCbrgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA1PR11MB6613.namprd11.prod.outlook.com (2603:10b6:806:254::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 14:26:23 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 14:26:22 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "Abliyev, Reuven"
	<reuven.abliyev@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH v2] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH v2] mtd: intel-dg: wake card on operations
Thread-Index: AQHcQolvORGnd1sEf0+OYSMjpAJgarTN8lr+gABHU9A=
Date: Wed, 22 Oct 2025 14:26:22 +0000
Message-ID: <CY5PR11MB6366CDF16D135064955D3842EDF3A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20251021123246.3629282-1-alexander.usyskin@intel.com>
 <87wm4ns10j.fsf@bootlin.com>
In-Reply-To: <87wm4ns10j.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA1PR11MB6613:EE_
x-ms-office365-filtering-correlation-id: ac3f2665-fd8d-4890-9b4f-08de1176f9c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UEtIWWF0TWhDZGNodExtQlJTZnZFTnI0ZlpBWnRsd0owemNoV0FCM28zMlVZ?=
 =?utf-8?B?Sjh1M09BaU5LdVJOcGwvTG9XOTNvTCt3OVVRYmdzUWZaZDc0WWVzWm9ETUF3?=
 =?utf-8?B?YzAvUFQ5eWc5ek5qa1BKSWhZWldhODRROTBiZ2NZSmtEOVZuU1U3ajdwNTYw?=
 =?utf-8?B?eExuYWFxeHNzNU9zRmJsZmR0ZXpXUE9yYnl2bHFHNmRlWkI5aklXbjgyTmlQ?=
 =?utf-8?B?MkU5MnV2b2JjSms0cm1wNlBFNXJnWXlpNmlqMEVKcWdmMUEreDNEL3YrSUNN?=
 =?utf-8?B?SWtQdjg5UWtOWG5KZVNtN2NNT29MUlJUZk5kSmFtUTUvY3dKaEw0dS9FR3Fm?=
 =?utf-8?B?ZGNKVGRrUi9lSnJjNndTeTB4T1dNS21yWWZWdjY0ekc0a1RBS2pjRmhtMWds?=
 =?utf-8?B?c1lEZkVtaFpvdStyQUJxYVhJd3VxbFNvZS9oYkVNYWptTWlBSGd2R3hJaEFm?=
 =?utf-8?B?MmhBdXBIZjlMblFiMkI3cHBUMDdsUFJIK0ZoZjFyNFRTU0FmeXJwT3RxNnMw?=
 =?utf-8?B?S25tZ2JFVklzY3pyN2JSMVI2NVZzVkMzOEtUUVVpQVB6Qld0L29RNW5yVTlp?=
 =?utf-8?B?RVU4bzBKR3QzNnJtdndLUnJKeTFGQ1VVOWJLdjZrblJwVEt2TXRBTFd6QmVl?=
 =?utf-8?B?NmRlaktKMUFlWmMvMHdBdkt2NmQ3OWJubHk1S05WQW9hWWt1bWFFSmFxaW82?=
 =?utf-8?B?cnhCQ2x3dGl1dEdSNmlBQ0ZCTmQzM2pvcDZESmc4TGY1Ri9EREk2cTY3WlJ5?=
 =?utf-8?B?RjE5c05aNUhiZ3VGdnVxWnk0R1cwME8rMFpId2JCOGs2M0I5Sm11Tm95VHJv?=
 =?utf-8?B?OUlsV0hwY2tjdzZWRDRQOWJYR3NIcWZNenZWT3FMZUJUUE5hWFc5eTZvcXJh?=
 =?utf-8?B?d3Yrem1wQm9mT0FCVlBPT0xBWmswR21uN094MWhPKzRTd1FVejZrM3BHY0lz?=
 =?utf-8?B?VWU5OEVsb1R6SDhLTUg3Mlh4cVZkbmFXVzhrc3IyUGFObHdsQnF3YkJjMFQ4?=
 =?utf-8?B?WEJ1SjM5UEJ2WEt0SkZRVXp4VzB3ai9oYXliTlVld2hxS05DOE5GUjR2bDlH?=
 =?utf-8?B?djFMaURaT3o0aytaa2VjUWxIQkdORkw2bHQvaXdweHNrMHViZlgwelh0VFh3?=
 =?utf-8?B?N3FJVlM3elBDcGpoNktldkNUUXlmZ0wxQlNmSWZVaUFtM2gwbE5ldTcrQ3Aw?=
 =?utf-8?B?OVZYUks2emV4QnRWSWtrcWVUN2J0NHRYM3lVZ3M0UEgrUXdiVjhoTkJXWDNQ?=
 =?utf-8?B?TG9CTGY4VkE4c0pnOXhQSkRvam5zZGxYRmtuVnRGc1RKM0tncDZFNWJ5VlBN?=
 =?utf-8?B?OVZRbFIwYmJPREJVUU43ZlFTZnVrQ1BqWXZDNmhWOC9nVjM3bE1LemNRRDhz?=
 =?utf-8?B?OGYvWDRnNU1KelZQTHhDN0lIUlJpYStYdC9jc0g5a3V6WjVUTnpLa2xiVzFI?=
 =?utf-8?B?bG0yalZPdnRqZjJQcmRTOERtalRkK3IwWVNjVWk1UlhyNnh2MlhSZU4wdU9T?=
 =?utf-8?B?M0F2Y1ZmellJVlM2KzVTbE5kc0E2QjFSeHpJeVViS0RvTStzbUJDekM2bDZv?=
 =?utf-8?B?bWdIdm9kMkEzaEdSYzRQRGFEa1NpOHN0b3ZKdkZSZEcrYkVXT0JlZCtwUU5o?=
 =?utf-8?B?KzJtQXZmdFQ4SmI2aHZJcjhsNkJqYlRmaDRJOGpBRXBWR1lwSndHdjdSRlZQ?=
 =?utf-8?B?ekRLTFB2TXE5N013cngrWUg0WTFNQ3RkK205b1NudlNxMEVKdHFvd0UrdjFs?=
 =?utf-8?B?SUNTR3FzcE4vazBKbUJRb3VpMWw3YzVoSk5DdS9xSVNOc2g0ZFZsb0Exajkx?=
 =?utf-8?B?MEtoUDFMZ0ZPMkw5bFRtUHYwUkFIV2V6T1RQRUdkNDlRTFNQTCtwelQ4YUlV?=
 =?utf-8?B?OWkwUWxxM3dVRStCV3FjNmdyZ1BsS1NpcDVXYVFmcHE1TnlHaG4rdHlEdzlj?=
 =?utf-8?B?Q3V0NGh0NVd3Tm11RW5tNFR0Tmp4eTRVVkZ3TERLTjNxRXpNbUMxYTRDTzg4?=
 =?utf-8?B?Z2xsZlRveTJaYWxaVm40WnlQVHR6NXV1Z1pEcTZHUkEzOXlNNGZHQTErdmtV?=
 =?utf-8?Q?gIxZiB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGZrblJOcThHOHVGUXZFNS9nT0NvczB4WFZQMGxMZmUzeStvUHdnWTZUOFJm?=
 =?utf-8?B?NE1SMGErMUNueHh1QUNmeVBxdEF2cklSWnE4Z1lka1hKS0lXYmR3aHNkMWtx?=
 =?utf-8?B?Nk5BZFVnSmx1VzMwQklKUEhqQ0JKSC8zN1crZ3U2Q2hDa3hrT3lSV2g1T2pu?=
 =?utf-8?B?WGYzU2YyWUFpa2xlTHhmOEFXUG9UMUhhbzJySGdCUjI2bWRUdTVSbE1ncTJV?=
 =?utf-8?B?MzZPUktaZ3RKRGhTVE55clpZbEJjaEZIRVk0dUlXRGVid0dEZjlBUG5zb3BJ?=
 =?utf-8?B?SVV3Yi81dDJlRjRWd1pOdkN2NWVYZXp3SkliSjJMRTUxZm5kZ0R5UjhiZzhM?=
 =?utf-8?B?dGhLdjVEWUprSS9TZU9WOE1BUFYzQzhKdFJvL2JpYmlybTBINVh1YmNhKzVw?=
 =?utf-8?B?byt1Y0tDcjJKY2dNSk5tMTFsbDU1YUdMYVA5cXp4a0JCMDNBOWdPRkM0amRT?=
 =?utf-8?B?VkUvdk4rWC90alk2RVZtU0NsaUx1eUtuUFVzejJvTFRpcFE0M00yeDlGcHBy?=
 =?utf-8?B?MitqR2pqcU1GenN4cU9mTFZGOHEvTFM3bkpvVzBJSTFPKy9wZTZGQjZvRmtr?=
 =?utf-8?B?bEp6OTNneW1sZ0hTcnVRT1pvQmpCTll3dmdPRHo0NHdKVEluMEdOT3NldmJh?=
 =?utf-8?B?T3U5MUVMa3RWazNVWS9NYnZocjNUVUlwMUU5dlFPaTJwbjBVbFF1TjFCcmpE?=
 =?utf-8?B?dlk1WHVPeEljcDlhOWROS29OYXEzTTlWMDQrK21UWjJWRExJTkFrUlMwWUh1?=
 =?utf-8?B?YnkxVDJ6LzZUYUJ6a0VGcEpQU082czBsSVZvYnJtdjFIUHhRd2ZzSVRacWl1?=
 =?utf-8?B?VTdHKzFGSmdwSHUvb3VoY2o5aVZKMzh1elowM3ZzMWcxRjBvTWRweFNFUG9l?=
 =?utf-8?B?aGR3cGdGcXVIbEtWY21Pd2doaFU1RzkvbEltb0lGNUFRYXZ0RWpHTG53U3J0?=
 =?utf-8?B?NGxKdnVZZTRubWtDZTlsTXpNRmMvTnhPdmNJWnVySUVsT0hPeFV5V2ZNbEpv?=
 =?utf-8?B?Z1htNEpucmxQb2lia0lXN213NEkydGpHWjlxVGxSTWdzZGJVakl5bTJVK3pl?=
 =?utf-8?B?NWhBZFJFTHN5aHg0dWlpYklmcHFaL1poUzZ6aW9BSVFrYWFyL0p6ckpLY0ZS?=
 =?utf-8?B?bFhraHZWZ3Q3ZUFleUNhN3pST1NONlFlQ0ZmNTQ3NmpqZDhaSmNOMHVFMUtM?=
 =?utf-8?B?SFRndjNPZGZydEh2VjNLOFJCWWwxNzFXZWJNME9YSjhUU3dmUnpRcStWL1FW?=
 =?utf-8?B?VDZKV3dleWpPRnRyMGNleVNES0d0UFNTbHdRdHpsUkp0SExnd2s1c01Cendk?=
 =?utf-8?B?YlU1RUw5VnJOWE5jRy9WdnErNXdlUHNrNWhxZ3hBRlM1ZEw5a3AvREV5NTAv?=
 =?utf-8?B?NDlhT1FBVEtNMlR1dkx0NW1KOTd2QVZWQnFDVzVibHM5SmNFb3hPYk90OGJZ?=
 =?utf-8?B?Rkg3WkdQMTRMTDEvTE1RZWNSOUw3NVVsUElKYUFkdCtGQWIvOWljY3d6MlBq?=
 =?utf-8?B?S2ZOR0lsck9taXNiN0U4RUlxNE1xQXJaanhCN0JVb0dVUS9CMUtGSHNYTDFr?=
 =?utf-8?B?bkI1VlFxUlo4aWNEMzFUTFV1R28wRTFCWHJKMkc4eGlOTjRWVUlXUnVCai83?=
 =?utf-8?B?bFlhOEt1b3BQWTRHLy9RWVZKdkpaaEN0V2NkRjE3YnNvNDFWNFdwOFE0RmJv?=
 =?utf-8?B?d1h5TlhMRzZIQTE3Z1VaU0R2Z0JTbi9NcDZDRDc1bUJUdGNGZXFvUnU4bldj?=
 =?utf-8?B?d05RaWhGeHpTMW5NVjhvUGV3Y0FPM2pKN3hiWlJPQm4wVnozK0QwblpYWGhH?=
 =?utf-8?B?SDFLeUNrSHpNWWxRYks1RGh3c3MrZ3ZoTUVKd0tndVNYZjhjcFY5Q3FpNHJG?=
 =?utf-8?B?czQ0aTRkclZ2a3lkeGdIRnlnK0ExRk9xRlhBZWU4TWxYOHp6RExvd3dnRk9H?=
 =?utf-8?B?T3hJOWd6VWZPYmhmUXR0Y0h5RGNxQ0h2VE45dEhlemVjTTUzMFBnUHU3MnJQ?=
 =?utf-8?B?N2NnZjRKVVdaWnBRb0ZHdGNpN0JvUGM2NXBETkRVenJnc01yZFkzMm9pSC9p?=
 =?utf-8?B?bFhLZUJOdWZ5TDBzZ0VDenZ1TmF3QVFsRURTMlNaQTJMbjEvZHp0SU1TWFV5?=
 =?utf-8?Q?P+SodOfyTaNuzlr9IetgxFuSH?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3f2665-fd8d-4890-9b4f-08de1176f9c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 14:26:22.6460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFWv7Ix3VF/5brs/LPZcRDpbrDOghaTKAUse84u/s/6EAg5iU2EiTE9W0dTUf6oIOdarYHyNxpztdfX3jdQv9o2UcVS0qixIcTGjFM1t9wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6613
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_072630_066228_7EDC63F8 
X-CRM114-Status: GOOD (  17.38  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBtdGQ6IGludGVsLWRnOiB3YWtlIGNhcmQgb24gb3Bl
cmF0aW9ucw0KPiANCj4gSGkgQWxleGFuZGVyLA0KPiANCj4gT24gMjEvMTAvMjAyNSBhdCAxNToz
Mjo0NiArMDMsIEFsZXhhbmRlciBVc3lza2luDQo+IDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5j
b20+IHdyb3RlOg0KPiANCj4gPiBUaGUgSW50ZWwgREcgY2FyZHMgZG8gbm90IGhhdmUgc2VwYXJh
dGUgcG93ZXIgY29udHJvbCBmb3INCj4gPiBwZXJzaXN0ZW50IG1lbW9yeS4NCj4gPiBUaGUgbWVt
b3J5IGlzIGF2YWlsYWJsZSB3aGVuIHRoZSB3aG9sZSBjYXJkIGlzIGF3YWtlLg0KPiA+DQo+ID4g
RW5hYmxlIHJ1bnRpbWUgUE0gaW4gbXRkIGRyaXZlciB0byBub3RpZnkgcGFyZW50IGdyYXBoaWNz
IGRyaXZlcg0KPiA+IHRoYXQgd2hvbGUgY2FyZCBzaG91bGQgYmUga2VwdCBhd2FrZSB3aGlsZSBu
dm0gb3BlcmF0aW9ucyBhcmUNCj4gPiBwZXJmb3JtZWQgdGhyb3VnaCB0aGlzIGRyaXZlci4NCj4g
Pg0KPiA+IENDOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50
ZWwuY29tPg0KPiA+IC0tLQ0KPiANCj4gSSBhbSBjdXJpb3VzIHRvIGtub3cgd2h5IHRoaXMgbm93
IHdvcmtzLCB3aGVyZWFzIGluIHlvdXIgcHJldmlvdXMNCj4gYXR0ZW1wdCAod2hpY2ggaGFkIHRv
IGJlIHJldmVydGVkKSB3ZSBoYWQgdG8gZG8gYSBsb3QgbW9yZS4NCj4gDQoNClRoZSByZXZlcnRl
ZCBhdHRlbXB0IHdhcyB0byBhbHdheXMgY3JlYXRlIG10ZCBtYXN0ZXIgZGV2aWNlIGFuZCB1c2UN
Cm5vcm1hbCBkZXZpY2UgaGllcmFyY2h5IGluIHBvd2VyIG1hbmFnZW1lbnQuDQpIZXJlIHRoZSBw
b3dlciBtYW5hZ2VtZW50IG1hbmlwdWxhdGVkIGRpcmVjdGx5IG9uIHRoZSBwYXJlbnQgZGV2aWNl
DQp3aXRob3V0IGludm9sdmluZyBtdGQgbWFzdGVyIHRoYXQgbWF5IG5vdCBiZSBpbml0aWFsaXpl
ZC4NCg0KLSAtIA0KVGhhbmtzLA0KU2FzaGENCg0KDQo+IFRoYW5rcywNCj4gTWlxdcOobA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
