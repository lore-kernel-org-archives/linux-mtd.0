Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7266FCCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 14:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=scSZelhddGoGRCo2pEoftI2R94VqijHzHqIy751zr1c=; b=ZOU6tGGV3S6vnE+4t7WCR9TqQ5
	YiKeDODqdn7rKqV6ZKZuZ0XdBm8V/BLRgGdpCTWyikixAyOlv+qKjw/p5AEUrzj3NSGQJZuiWi2F7
	uC0PngxkTBjvuDdp8HZ2arCWoJmxD8W9GSjGbIqQla57mPABG1VjFoQXKvuHxYtWaLkaPQ4GD2JP4
	8tRGs+qkHa/uEN1ryhEdAmvhyanzC4HUIKWpPcHXCdk4YLhOdc8CsM2JwXm6mjZ+lVx9PFp1CHpJK
	Ai2cBBt4UhPFuUkoNvE+jXNairAEVDkk8D4C6XBAHsM78BQIpTl1AEJKoIcmZ2/ap0b6BJEjdAQ1a
	tPLKfBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCIT-00000008zq1-30lI;
	Wed, 12 Nov 2025 14:58:09 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCIP-00000008zpJ-1sri
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 14:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762959485; x=1794495485;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vg5aN5BxuTejyO7i3CmMAHKTCUSpL2zNxJpdzbxVLd0=;
  b=J6yo/BnyGROivWtjSYRzCEem0rq7onQdN9StOtP9Cxym1M7/I6cgTsE5
   Q5CJ05YC3uoEDkODwSXquha/m9yE+MLuFd3sgTHgx/XbdqnQf+24yMdOG
   v3BTvg0E/YYDgg3BKioVUK9ksPOHNnikcl0ASmyXOgjj3SIFB1bfLeAIO
   iCWCcIahiEtQuTynZg+JVLXOZ0geFI0x5+F6X98Y9GHeLD+R/zbTfzBOU
   CQku6k+ugHS3cT/am9/lEKs1ByRPC6dgr50i43ObSldWBxmJn4AamtERI
   9EBtotN+EOkWjCmZcgRAEh03tZM+fQAZH5dv5BZiyTsrwKz384r23aqlp
   w==;
X-CSE-ConnectionGUID: c8fjVIsATESAZRGlKzbHXA==
X-CSE-MsgGUID: fFnw/JOnRcqHDyuSw8wlhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64905821"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="64905821"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 06:57:53 -0800
X-CSE-ConnectionGUID: mHYOu9DmSCOYEib37WUDug==
X-CSE-MsgGUID: DuUBkOWaS4atg6sRRWZ7dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="194431271"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 06:57:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 06:57:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 06:57:52 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 06:57:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfp90D1Tfry8J2+Q8jIYfGIeKU7GtrZ90yzmsdZtCbgcc7XZn8qKTueZtrcEN8PyLmPtPBXhx8uy0cI1nlyDOQUKU2GnRabK4Fox+1bbw9+tgEKeks6GeEI/fpcxsUYMxRgT5cH55TbAMtrjIOscv6KSn4LPb8rK9Yi5qFIlVuLlo6RkJrXJhMyqhByJmr9LooMYhrkG1EFeZvUVU6ti3OXxEz6wr2CSkGMtaNMOnLPfhKDV/Q7D6JuksqWOKn9wgvd9fGumyJ7gQrJPrPctY6p29l+4yiKkGSkiABPFgi0cfnkiUoxHcx8aRVENVSmJA+/pm6xTgrY67cyfxeugfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Rkn1GmeL5h2UGpI8tlppW817Rg0F2hmYF4iJsgbTxI=;
 b=AR3/jUwWvpYndt2FjunPZ+/ZzoN3qAPPIFvohso1xLgNK2gPKCvsYHPRtvpBEFHKouoIaNcNq5SFUIb31KHyNIgnxGJ7WIoIJ9iXe/a2p4AqilQKCrQvpS4ONRRfypCNmWhJbWooROQ41wKh0Q2vG0g5je1GksPVMbxXdU+46AALZIG8y/J+8EdBT0ToZDexJ/0MbPWfxcc/yoWOOgfCEYEY+SlGGb0keaSKy6+V0y3QwYNr5Wcvm/oR0G+G7KmZ5XwuKoaJTzUSjmmXnkDd79cD7moVXl7mf7bWSaAO2CrcSQcZUoNCylAt/xWE+lUPSKMT63nUjmtee2BbtO+pxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Wed, 12 Nov
 2025 14:57:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:57:49 +0000
Date: Wed, 12 Nov 2025 08:57:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Jani Partanen
	<jiipee@sotapeli.fi>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: Possible bug?
Message-ID: <3oma7kpe3fzt2kch3g7h5ejmpkni4arf3sm65gfojrkhu6ih26@seedyt6xjwhv>
References: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
 <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
 <zh45kns66vc62eldccyoefrjtylkqpexns4hli2j7jqpwwhvzn@viqinx2he3il>
 <CY5PR11MB636652A1A7F88249BD81047DEDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <98df450751f934f3a5c20ec09a08b72ef8fa2763@intel.com>
 <CY5PR11MB6366FD61EF0FC69D077F80E0EDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366FD61EF0FC69D077F80E0EDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
X-ClientProxiedBy: BYAPR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e7b520-cbc9-4909-d71f-08de21fbd8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?09jT90uU59rqQuUWEpycX4GwRk4xaZo0hdNwaKgUhIl8abEdlt2bWRICnK10?=
 =?us-ascii?Q?ndKBBCnIDeFzFrJY9FpAEUUKYex5nafLXYIZl9xGBXHFWRGzt15EWqwEdHta?=
 =?us-ascii?Q?gGKDb5AnLHCYfJaJRuL3VIxigav7EgJy2DlRr6hV3KVOBcXN8PFPWT3dvwg1?=
 =?us-ascii?Q?PIioek3w9R0r0DpOogL5sCSHPNCYwr8yn9ftN3aPokltBIZL5WbTX22vqFCo?=
 =?us-ascii?Q?puS2gpY1cNs2x72iVMjJKEXgv5o2hZuD2R6DN+4hy/2U1q/y1mFeonKFm0QY?=
 =?us-ascii?Q?IbYIJS3WbfkQKErcplF0iTvkfh6uwS2KfFE7Z8VqOmdqeX3e240GLYfZWTJO?=
 =?us-ascii?Q?L1cRRlNy4U+yQSIL2dcIhprnEVWHp9RrMbNAo6ApE/fQMsHElu+wwj1bcKjL?=
 =?us-ascii?Q?odxQkQSGW5I1s6yXagm7WabWT1DH5pIRyDpyXRoAygzcrad4o7Qj0LCCGfUV?=
 =?us-ascii?Q?9VGm2rNe+HsgQ0R+cdxqmLIN4sSO7+sYaCDricXZT1bzagdUIH9jZHoyl683?=
 =?us-ascii?Q?Wyv0RFMuBHIg5/jJ3fweiKWNVGV4gvljlirMGycLtKChRexsSwYMtBqqy84G?=
 =?us-ascii?Q?8qH73uFcQMG4b7VdSNbo9rlQTMV+/O0vYZpf5tEbqN15a7M4b2mxwP3U5qyg?=
 =?us-ascii?Q?hiwurk9muwDJc2M9s7cWErvgwHr2+9DGqgr1QOL5QRibOE3z6lagZtt8++WU?=
 =?us-ascii?Q?nZB0HR2vMymRSoMl5GX2miI0VN1jdas6kNcCuJAjxaPTJGfaOCtxbHAMYliV?=
 =?us-ascii?Q?HhQV2aTCIbS7XG7bFZHHxVkuryBk4J9bpGI8cNE/i/fpWHLwFNVmTkSX824X?=
 =?us-ascii?Q?FTyG68gnES2q889VmuMo2NBCANN4oQ3E0u1LDLOU91+eQC+AdoHWSf62mkfR?=
 =?us-ascii?Q?22um9c7YLM40+BxjvTR9oVOaShzI4paVRCWTK+C7w/XnSUfMnO0yOF/rz+Wm?=
 =?us-ascii?Q?mx/HYdKBem0eM0PASMFRms7UmuBVDtDf1mBnmPE0/aHp8Zwmh+y31aG9gyrw?=
 =?us-ascii?Q?I6xe3upWJkQ6LNBVxJleQwHq5GfXJfC+Qu0mnD1R6XQQzq/szYoqvnE3XCNj?=
 =?us-ascii?Q?j2Mz7i5a3qIsIqRIZtFFQAyUcF9gq3b1LkDEg3WFpg9u3KZgBqv2rK9zrDKz?=
 =?us-ascii?Q?5rPDDrpzXuhhwgrb8BPdxoky6mtGYuYBNJ5EYFIt+JVgVkNAMjRo3BP5EQ0l?=
 =?us-ascii?Q?LevqkQKLRFNM69+4raGKMQlE8AfP5JPdzGKFbFaVcQs013FwUPey9cv+uKHJ?=
 =?us-ascii?Q?53i4iDLdTHyTgBWG8J7snzrzZSu4RclMFrehG+LOfR36OVYsb65IxFGOMvPF?=
 =?us-ascii?Q?t4u/ljJAGCQ6/VY5b0ZzIocOyc8Ojtp+SmixXoefU+rVeLMFFPo51aHE1L23?=
 =?us-ascii?Q?u0ChJQVB8xc7z+vweqpQhnnvpvJ1hx81WSBUG9l3LibxAOovCjHHjb/7IJAL?=
 =?us-ascii?Q?QCCFRjfmm4Zrv2p4EqUUFV2M2BPmAimUDUWA+NPubLG/1wj8cHK2FQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FEpl9GwVrAe5XUQVXt2UdNuXFGY/jvQLlPoO0g45QhIZ9Nxr9ZnrMsbYQT28?=
 =?us-ascii?Q?ElO3T0wS79iGp+3kkb9T94vqsVDLIK+BdbMdOx5Ve2OQh8mEM7kPPMA14ORm?=
 =?us-ascii?Q?xilyFWNJPbHbrsBKNGzAFLS1U3ugGIwLMRJEfsmnkJY8CXS2eaIbJQrvXuBU?=
 =?us-ascii?Q?0ufwnaCeJRnSXIoR3CXoolHxRGDusjXgGgnXGUVEDxEbcp6shBK7sqnOT0zz?=
 =?us-ascii?Q?gxG5HyHw3vBF56YVgKUFRR9/Fxe9r52mAaKw5UxNvlBxrChEFabWyO2tCtz9?=
 =?us-ascii?Q?zeYvqFYoh8cWd4fNrwb0tgys0rAAnCRVUeDuHg27JiZiNquZ6WiT0ThKliVQ?=
 =?us-ascii?Q?3CKiYMGnBgw2KAWLS1YItieph9cvOuLJfbi3R9f2Up+mw0YWJrxayodcQ50m?=
 =?us-ascii?Q?PPJYqig3e6PdmkVo9xTZVO++qAr9+7Ej7HcdM89R2Xt/f5005nUBy2n6vTbN?=
 =?us-ascii?Q?iDBS/I8uVvXUSHK5Yqm8KG3M5lD4b4WklmON11nWB52Jn0mTJNexQ62ra0rQ?=
 =?us-ascii?Q?yLsY3QrV2P6l7r/BMfhAuCkox3h46YtMXjuUY8uAelGupBA63swP4ZSPaSii?=
 =?us-ascii?Q?uSzF9pThIZop5/hxqCMks+FmL/NYHprVDkR7iaYAfhPFTxX+d/ez4t6ms5A6?=
 =?us-ascii?Q?Y4rH2tg45LWMdqUtiSmZgkjbnRGWm5p/lfv3IXs9cOgk4r99KQyGPaUuh5Dm?=
 =?us-ascii?Q?PPJRhFpVh8QvXy/zdABdJGVk6pjsqzLrbDWwYlVJaowiyOWHEtNxyn2vVVpO?=
 =?us-ascii?Q?MFY6JBH12y0OnmMcJUWTiGd6UyfCTkPCsQj9rsjmz+9FLcKZdhNsZVetzc0D?=
 =?us-ascii?Q?gDHbKW102Z7fhsdzk7fuNy02bk9yDqtuM7SGtsS1hBgaqd8K4DRs7aihfyGs?=
 =?us-ascii?Q?hSL44RtvCcwvYIznWlRLEGNw6IqCHbXOksptcgFirmMCrQTMU0t4gbCVbpjB?=
 =?us-ascii?Q?8DzKbbZaYrlaXUuw/RyJ9dmi+CTA5UCXHWc15IPTNAKzjF1m/PF4eBLoOtrE?=
 =?us-ascii?Q?g08xssiVRYEx/aaOOhQzP0YOCFcUtQQUx+6PLOHSg1TVu6w8rWYP5tTcPHSp?=
 =?us-ascii?Q?fu27K6pdMVDTJ9MuYa16Rz3tO7yCfMAQmETaJz5I3yE3fRjFoy6XzzJEtDT3?=
 =?us-ascii?Q?nc6sgjd5sFZbSiD+x+tKYae/TAgUwVbrl/MLNhwAMnitOBjIOBun+IP5IG2z?=
 =?us-ascii?Q?dwk020Git0u/4QQMK5Yq/47a9G8tLO++HfDBeL+Pa0wfncrdqL4lSECjFy8f?=
 =?us-ascii?Q?8JiSwRsjQ2LyLX4x8eSonwTLFrGSgWLI1jNwEdWKXFvEtpFF/ShWP9LhP4u3?=
 =?us-ascii?Q?9PZRrglCw++Miqu7Sf13w/2VDzw17G2/ztbOLuT06tNgGWPe+V83wG4H+06l?=
 =?us-ascii?Q?wNd1jYPbB5FfzANEBoKM2RV9VTEbwVPTdBfCjV1HKl05TathF5e3rfQ1iD9+?=
 =?us-ascii?Q?3Nk7ym9YFGkU9JNNNMR/AmrrwfoPk0tV5V0LRpKGTpYRtBDojWA5bqObrhIg?=
 =?us-ascii?Q?dr3PysPc37gYaPwt73KU+VoQ4O5WH3xopzIcf06zNqfdQdpi4xCn0qXiDhil?=
 =?us-ascii?Q?G0PeHpXUiSEzKfK7ztRiSXMUQBGMHYy+eq3uTvGKWsDazvPjCirYlOpFVIG8?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e7b520-cbc9-4909-d71f-08de21fbd8d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:57:49.3918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVTMOAobhDIG2S/u+9I7ArUiG4ZsJEuApD/njPXAehiwI5T31Ev1s6mu8gSNyZ/kQw5IsxXZS6JieVzkQdJmBZ6jaXV2MThjidJ1W4k1opY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_065805_559065_A3807EC9 
X-CRM114-Status: GOOD (  12.06  )
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

On Tue, Nov 11, 2025 at 10:58:03AM +0000, Usyskin, Alexander wrote:
>> >> >
>> >> >It's probably due to struct intel_dg_nvm regions[] member being
>> >> >__counted_by(nregions) but regions[] is indexed before nregions has
>> been
>> >> >initialized.
>> >>
>> >> yeah... and we shouldn't silently continue hiding the ENOMEM... Sasha,
>> >> something like this?
>> >>
>> >
>> > In general, looks good for me, but I see that we can fill less entries because
>> of
>> >                 if (!invm->regions[i].name)
>> >                         continue;
>> >
>> > Let's leave 'nvm->nregions = n;' in place, only need to fix the comment.
>>
>> You have this in place, nregions already accouns for them:
>>
>> 	/* count available regions */
>> 	for (nregions = 0, i = 0; i < INTEL_DG_NVM_REGIONS; i++) {
>> 		if (invm->regions[i].name)
>> 			nregions++;
>> 	}
>>
>
>Yeah, missed this, so original fix from Lucas is ok

I submitted it as a proper patch with commit message:

https://lore.kernel.org/all/20251111-mtd-nregions-v1-1-61db61e78c63@intel.com/

Lucas De Marchi


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
