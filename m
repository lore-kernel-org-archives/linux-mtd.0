Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4765CCD1BC
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 10:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoLbt0Fkxwtoo+tdF0pfU7TlCWBxbfvZ7afxBFO0tZs=; b=0SB0dmlwf1x4EA
	N1FvyI3QLga+njlfSm3Mrz4Ue7z0HsnUF5vQXPzHutp2QaCsMx0NyZ4MFQ1Y0JLFBKibSjiAjkzQR
	sDIRTGbu0Se54KBW0Y3nnW1SuBX3BcWVcaqazeagsek4BCuqXaP/m+EQoC/QCOqKA1JhanGvk21Ix
	ybjrnMRFjy3m9UaK1JjlURoyrjZqQSZqhZWjKsSLhd3hAHq5kD9Q/mnmRXZIzQqOLD5SBqbpfykrv
	xj+l9lOYfOk2AdvPnPEMvS+P82oS6+3UpKS4Kor+Qd9dUIA6iWvWABGD7Yw+VG+lD7CdlnLZJo24J
	A4X6rRxaSoEqOrzqrgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBswd-00000005ywC-1BdZ;
	Thu, 23 Oct 2025 10:53:23 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBswb-00000005yuS-0tAI
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 10:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761216801; x=1792752801;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z5aX9LS8OQmv/UevHkv6X+Ghixsm0ygoNCFS/M/RvsI=;
  b=mClKUORFJJ7sAzkHcQMvB4/YgnW/Jv3l8VG1e3evoQJA9vIhNT1Sslx+
   W8tMooHKRRyJEJ9h1vyoqaSX4zJk8KnQeklkN/xQyEGQZZA5g6ZLo4TYU
   k4pAQ2D2R9SKSJSAGaSp2YjCkRr2B2TVaYNo5CQMHWDO/LWLO93cdW3h+
   dQyFuS1ZEfd3asmbw/PLso/+2mrFlriAswQsfyji3PeQODpexXNjX3flQ
   z6mj64suFH8ofqeHSxXAF7qzDcr8axO82Bnp5Qg2XHtTWAFT33LtzlddK
   cRQ714pSi1WL6JfS+X3uy844G+8UnhvyIgHUwXRFfvbK4eBTbszBHuK8V
   g==;
X-CSE-ConnectionGUID: H8WpcpZbTvuP9V5Rx5YJqA==
X-CSE-MsgGUID: zn7PsgmbTdaMb9OrR10sVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74500320"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="74500320"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:53:21 -0700
X-CSE-ConnectionGUID: c64o4cE4T8iBrnlJr0L5iw==
X-CSE-MsgGUID: NSb6yEhnQM+pmEPsY2I33w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="189259216"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 03:53:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:53:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 03:53:20 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 03:53:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUPuItgaUf9KLxR53xm8v4hP+WIXL5CSvrlOGLvsY6lgpaqD3IV2SCsXV3H6uXWOc05x5s0nhBwAy9eiMzbceuFzk4A5d9iqWV/8PB6/8SKb/0mSPGddItP8AzQYEV7LfWvjWUu3o5V89m/kMxt9cvzHzPwFGN9V76YcmgTpYDEmx9OsrpCv+5MHjhoZdB0R5RkwsYnXIHvk96SqyGX/gC5NvcmoKlrL7NLb7LbRvEHjO7EWB/yxZoufETbMiJ67zXVaWBYZnaIiZzx7P7YqAjxpgesg4JY/ebw3/3mz62O0Ku/V7zYHQqF8rw5EJ7HTr8cmQrNU0UCfxRqw/HJOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5aX9LS8OQmv/UevHkv6X+Ghixsm0ygoNCFS/M/RvsI=;
 b=X4xrM3IPneCJ7i3/N10IoQssujl0IeO9IzXe5CcSOwg4yiQ0kNd44PBUke/qckirS7VtfTUyfIHD9a6TMSHkAAzkWtVCjcriojeIYl24JpYUSyWocYiitTfgHYw3abmrmBHCVn92q0+mfQt3rUOgwwZrrorj85zp1n04aA7JOJ9ghKYYkx2Cm3I3RMq1l5CY/peRqMhfhbtRw+/9GLklCnGdern5PfE5YZIpcop/vhN+ioannmM6VvV6DTI7wpyqdb/op3H+D7U5Y2m5hCWz7O6+jqLHFT/qSXs7oD14OfsjNeP0TJ74n1zVP2XQVn8FCLtKqZTuW4gA/cTgM9FDfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 10:53:18 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 10:53:18 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Abliyev,
 Reuven" <reuven.abliyev@intel.com>
Subject: RE: [PATCH] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH] mtd: intel-dg: wake card on operations
Thread-Index: AQHcQQvroNhSaCIfh0abEtSYk7POBrTK0Q8AgAAAQwCAAY4gcIAAT38AgAAGp4CAAt2h0A==
Date: Thu, 23 Oct 2025 10:53:17 +0000
Message-ID: <CY5PR11MB6366DA1D185F4FF2C01EA3B7EDF0A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20251019150145.3228079-1-alexander.usyskin@intel.com>
 <aPYKRvCenwnrFXcb@ashevche-desk.local> <aPYKfhTDF5kXulz9@ashevche-desk.local>
 <CY5PR11MB6366D892E7B6FDB112751306EDF2A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <aPebJrWsqMCKmMpX@smile.fi.intel.com>
 <mrnepuygncvslqg4mxxedsyiujdw4wqp4ofvykagwzycnn3pda@jzockckj55tt>
In-Reply-To: <mrnepuygncvslqg4mxxedsyiujdw4wqp4ofvykagwzycnn3pda@jzockckj55tt>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SA1PR11MB8839:EE_
x-ms-office365-filtering-correlation-id: 79a82bbe-3e23-4c29-a12c-08de12225fe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WEU4dWZPRGNvWVhCcDRHWkJtWFpvZ21ydlN4cXRYWW1CdGlZU1d3WkFma3Iz?=
 =?utf-8?B?cFJFVVlBejN6NTlQQ0JoNnhxbjJXUDJvVi9CTWNPQ3BtT0F3RElJR2ZabGJD?=
 =?utf-8?B?aXBHT1UwWFJWdkU5UCt6UkR3QTZXQ1lDZkNyS1RrQW55TGJiS0RRRVFaaGto?=
 =?utf-8?B?bjc3N3hZbXJmaWFzczAyaERiVXdPaGNOZ1NENGk3VzhJMjFyTWVQKzlIdXRZ?=
 =?utf-8?B?ZjVwaGdtRkZEWGxoa29ZTmFVTGd5TWlQK0daNXhUdWE1T25ZMmg2cjBSbkp5?=
 =?utf-8?B?YytRaDMrRGE3eC9WSVBpMTlXaFRTSmdheGJWQTV4TWhHdzYrRGFaUFArdElK?=
 =?utf-8?B?Wjl6QzE0S1ZCeHZTT0VONytlMkV2NGNXcmd5NjdMdDZtQUl2dXplSXRDZ0pt?=
 =?utf-8?B?WXhTMlRSaXFvZ0N2NWV1TWIwMWthVFpnTmY3N3JUMHBQblFtUFpyejVOSTJu?=
 =?utf-8?B?bGtPUFRVOGg5d1hzM3VIRUFSOGYrYytKVHp3eVdPbFM5S1NJMmttQjBBTnNs?=
 =?utf-8?B?T0MxQWlyQmNicnkvWGo0am1FbXpuWkVKQ2QxU0Uxa1dWRWI1ek04T09jU1FT?=
 =?utf-8?B?dmwrNi9mM3g0a09SeDlSRDh6alZBeGY1YWxjOUVzemVSWERBLzBKNTQ2a3VV?=
 =?utf-8?B?UkFRa2Q5WE9HY1BqcjdQNHRtYWhSNlBXam1wWkpXbzFoVUIzenlHY3kvS3Nn?=
 =?utf-8?B?RGpmeVpFTEoySXNEUEJQVXhBczREYUxxYlRDYk9hUXRQbTR1UlloS292Y1M0?=
 =?utf-8?B?REJacEg5Tmh3NWsrVWt0OXZHNXdkaXRqZ1o3cDcvZWYxRkt4cFNqYkxtemVi?=
 =?utf-8?B?TU1ZSFFYN0dSRHZlZjB3MncraFNEeTVhS240ZXQ3WjdxN3BnUUUyWExQejhm?=
 =?utf-8?B?Ukp5clEwYnlxZWF2N0hjcW4xakFkZHdFcUllQTRIRmI4WTlTZDVJeEl2cWUx?=
 =?utf-8?B?Z1QyQVg1Y2FSUHdDK0xkRFJNbzZqSk9wZFhHVGZzRUFxVEM0a05nS1UxemFU?=
 =?utf-8?B?L0tZbllQenV5NUZ4UkxCWjRVN2J2VEd2SUJpMk91aTd3eXRJYnNodTQydTgz?=
 =?utf-8?B?a0ErOW0rd0c4S2xyam9Lb0hqR0VHaDZpclR0emViSEJkTWN0bTdUNXdGc3FP?=
 =?utf-8?B?T1lDT0lZbUNBa3E3YXY5L1h2d2N2NVF5ZGhFRGVESlp4NXNCbFQvZkVzRXdm?=
 =?utf-8?B?UXF3ZDdmV3htbHllUHNnRys3RmhxZUZCMXdGdnc4ckQrWDJmcTZLS2o5Z2h6?=
 =?utf-8?B?eXh4aXo0SU5wMWJmeXd1S3NweG5ETktxTnlDUGJXbG50UXdGWUlyQlpFdWZP?=
 =?utf-8?B?Rk9rcUN2NzJUZlA5V1JJc2RBY081ZnZFaTduampjTWlDTUI4VmF0KzJOOXFI?=
 =?utf-8?B?dW8wUnBHTHdHb3hrQWYrQzEyMVV6ZkpXOUxGTnEzazBLY3pSK3JmK3ZuS2ZW?=
 =?utf-8?B?cTJXcXYyU0xNMDVHeElJWkJWeldIRW1lUkhGZCtDdnAyejZoVExGZFMvOUlt?=
 =?utf-8?B?VmNxcmV1VDBQS05jbjFDajV2bDVPR0lFYmFkNTNuMmtRSjl1Rjh1QTlHM1lU?=
 =?utf-8?B?SGpZQy96a2ZtR01scnVxRjRyTUN4V3YyYkx4VHA0YW1XOFBSMnZWeC8xZUda?=
 =?utf-8?B?cmhRbTJqZ2YwT3J2OVN6UnNXOENGdndlZG84WnU3RTFpU1pmM0p5OHBvWWNO?=
 =?utf-8?B?amFnSXd5RGRML0xVVDdwSW04TWplSUhHNHFjblYySldUTDlFRnBwUUQyKzB6?=
 =?utf-8?B?ZlhrSmFGeENuSURQR3pBMmV2eFdEYm5uaWNjYlVrc0x5dFg0eWEyaC9DZGNa?=
 =?utf-8?B?WVZhTjNxTDJLZ09rUU15bG5HNDZTajkzUkdWMmtRMUNqYlJWajhZVFZwYmVC?=
 =?utf-8?B?TncrdW9UWDY2cnc4aGtuZ2FYRUJOT0FJZURiMDVBSndMODFwaHAwNzJMQklj?=
 =?utf-8?B?ekJkNzN5ei9YYTdIU3RXWFhKMVhENlM3RkM0YVZFby9Oa1RLRmZqbVRQSUJ4?=
 =?utf-8?B?YzdlSUZScXoydXBkajgya3JkYXRoaFNFamZoQWkyYXhLWWJUZWRUazU4NFlQ?=
 =?utf-8?Q?PLScZT?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXZja25ZSGJkSXhmL0ZWek4vaURZL0NwZHR0WUJIQ1hMNzBGOFpWVnYzRFNo?=
 =?utf-8?B?TXl3R1IwOXVVVFhCY0xWdDMvNHh3SlovZ3c4bS9sbUhkSGJCQmdRQU4xeDhP?=
 =?utf-8?B?WXlvYldsVldiZkg5T3ZIdS91NDRkL1hHV3lvQkxjN004OENNLzdKcC9JY2pP?=
 =?utf-8?B?Z3dsdmh2bFdjcysvODFFaWJXZm9ZcS93TWpCNHpFU0xpSFBOeS8rYlJ3K3FP?=
 =?utf-8?B?V2hwUy9rSmVES2E2NjRuaHZOMjV1eVkxbHVvYlpVZGFFNlNUNWRVaEtjV2lJ?=
 =?utf-8?B?VVlGV085blJsYzA0QS9aMWxsZWh1d09pV0ZIaURhbk0rWUsvRyswNDczQ0ht?=
 =?utf-8?B?M1NBZUxBcWlLdENkblVNdm14aGx2UUNIZXRSVGE3UWhwMWhwK1dLZUNMVW92?=
 =?utf-8?B?Z1djWEtZUEd0VUMydklGWWVwcUhnNEFqamFNSlV2cWl6Z2VzYTQvYWVNVHM5?=
 =?utf-8?B?TDVIcVYxMUxGTXAza1daMTV5Wmw3Zm1RMmFqVXo2Y1pGeWpNaldFbXNSenBG?=
 =?utf-8?B?ZDZHdmFZd1lxRzRsRnprZm1GS3NkcTZRdyt5V0EybUFYTjlQUjAvMFVkT1ZM?=
 =?utf-8?B?RWQ3WXBSLzJrYzVDdDhkQXlZOUh3UzY4OGxKU201UkVqWDA3VHloRTNURXc0?=
 =?utf-8?B?WXM4bWlsSjFJM2pwK2FnMzlyNEEybUFBaVVzUjA1cVFKRngwU3c4RWtpN0tD?=
 =?utf-8?B?Uzh6S2FBM2ZST2xxOWE5NllzdERZNWdTNjNHb0ZmRCswWDM2YjZIUUh2NXMz?=
 =?utf-8?B?UFFUa1prY0RmajN0N25jYm9yQVBoaC9LS0JHYUhnM3l0dG1sc3dHWFl6UVpj?=
 =?utf-8?B?VlBIa2N4dDQ1M0xhU3VQNUNkM09qRFNEckpQeWpDNHM5d0lVYnFBbGNOOFJr?=
 =?utf-8?B?cTNwRUE2bmFpQjRyV2pxVjhiakNUK3hEOFh6VjNZdkNSUkJYc1p1WnJuTGlD?=
 =?utf-8?B?MVpLWGUxcUprL00wOU43MkpJTWVNTUNxSm9vMkVhSnVWWFhnaFJNbHRBVWkz?=
 =?utf-8?B?VjFZdmtoSzdKTkNHWmxYUy92ajYrR0wycmIrV2pBeHk2ZWI1enhGYlZIaHRH?=
 =?utf-8?B?cEJMdlhPbmZaWHFVb0lKUytMcUxUajU3Z1NLT1AzaVY4TkJiaENUeDlnWUoz?=
 =?utf-8?B?NWxRZ05STlgyU1JsUS9EVkdSdFJ4WWo3bGkyYlZMZHhlNzhUTmNSK3JTK01I?=
 =?utf-8?B?ZHRYdFl0L1FCMmh6U0p4bTJNS0pKOStNbHNsY1BDcTJ6Rm0rY3FaZW5uaERI?=
 =?utf-8?B?ZEd0R0lhL1JuQkh5MXZTMkZzUDJSeWExdGJDbzNvczgzeFBLeklPRlpwYysv?=
 =?utf-8?B?WEFSYUlMcEIxSjh0ajg5MHNydkFDMmk4aWc5R25JUVloajRGaXN4WTJPcGNO?=
 =?utf-8?B?N3ZacnVhL3l6SldreTZFaFQwUkp6ZmtpQzRLVUo2djRCZU1tOUVEemxkQXBz?=
 =?utf-8?B?SVZDejVzZ3Q3VVV6VnlMQWJlUTE1aFoxR2VJK0hncVNHNVpGWUNwd213ZG1t?=
 =?utf-8?B?MHlTNlZCdnFvM0pPc04wN0ZTZkVXMlh5YUxBdzhqem9jWUVoQjlXV1BzUXB4?=
 =?utf-8?B?SXRmekdrQzd6L0dFL1JEdnN5ekJ5VjJUMFpnMjdvd0x3YUIxSUhpeG5UOVAv?=
 =?utf-8?B?clVPb2toZ1ppTnYvWTN5WHJpMWpQMGh2NEtISnh1MC8wQlRtNWlQQUxwZTJE?=
 =?utf-8?B?QU5GQWhvMHdLM3RtdDZiQlJWREhLNzNiMW5ZS2QrbkJNRGQ0dVljcFdITEFs?=
 =?utf-8?B?VWZmcDdBM05yYnNMd0F3SEh4b2tKbzJBeWluMFRBK1hSNjY0SXZzd0RUUnhK?=
 =?utf-8?B?N3dWY3VWZzczUmRhV0FESWNmcjd1Nk9FYmwzNzBGNzg0aEREbThpMU1TRWNr?=
 =?utf-8?B?emRjMnNITTdBK0htQnV4T1ZYbDVEbk1pbjFRU1U2b2dES3ZkNkhRNWl1WE5R?=
 =?utf-8?B?eXhucUljaVBDYUZ2bndZU1J4UUliQ0t1RkNidzkrYUpUcXZMK0RKUUlZMFhY?=
 =?utf-8?B?V3A0MmRvZ2VjK0tYcXhXWHVSeE9HQlZ5c2FHL2Z4ajJ1aHRZK01oYmZMcS85?=
 =?utf-8?B?VXFmcWllT1dqaDJXZUhxTW5QeGh4cEU0NVNIeHJhanNSR0dSZjhta1kramhm?=
 =?utf-8?B?Z0hOaXNrVGt3WnUxSm5QYXh1WGxraFQrdnJuM0JIcWRtNCs4Rm1HcmY1TWZD?=
 =?utf-8?B?RVE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a82bbe-3e23-4c29-a12c-08de12225fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 10:53:18.0014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7CBmjTfE0/NoY9oKQrFTLyUIFRXxaw1rlC1YEEcj1qjkX4nDu6q3ARVKpsKykZuhHRw0+wYvUQScRayz/YA+7iwIuapdvzQn5Q55Mzf3jXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8839
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_035321_314816_481ACFA1 
X-CRM114-Status: GOOD (  24.16  )
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
> On Tue, Oct 21, 2025 at 05:39:34PM +0300, Andy Shevchenko wrote:
> >On Tue, Oct 21, 2025 at 12:51:30PM +0000, Usyskin, Alexander wrote:
> >> > On Mon, Oct 20, 2025 at 01:09:10PM +0300, Andy Shevchenko wrote:
> >> > > On Sun, Oct 19, 2025 at 06:01:45PM +0300, Alexander Usyskin wrote:
> >
> >...
> >
> >> > > > +	devm_pm_runtime_enable(device);
> >> > >
> >> > > Please, justify why this code is good without error checking. Before
> doing
> >> > that
> >> > > think for a moment for the cases when devm_*() might be developed
> in the
> >> > future
> >> > > and return something interesting (if not yet).
> >>
> >> We should not fail the probe because of runtime  pm enablement failure, I
> suppose.
> 
> not really
> 
> >> There are other ways to keep card awake.
> >> The pm_runtime_* functions work without runtime_enable but have no
> effect.
> >> Thus, we can ignore failure here.
> >
> >Using devm_*() in such a case is misleading. It incorporates errors from
> >different layers and ignoring both is odd.
> >
> >I would suggest to avoid using devm_*() in this case and put a comment on
> >the ignored PM errors (however, personally I think this approach is wrong).
> 
> Agreed. We should not silently continue on error. Fix the cause of the
> error intead. If it's something that can be disabled in
> runtime/configure time, and it doesn't return success, handle that
> specific error code.
> 
> If there's a reason to ignore the error, it should be intentional.
> 
> Lucas De Marchi

Ok, will check and fail the probe on this api failure.


- - 
Thanks,
Sasha


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
