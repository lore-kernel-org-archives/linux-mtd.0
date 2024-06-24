Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A800C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2024 08:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5xPec2WT7DQdypqT2fgoQTyXfmY8Hrg90szTWRZSsl8=; b=XG8MhX9BDbu9Qv
	kJadgphkUPIv++fFvscaPMNxv5LnA4zbXh20thB4ItRLfDsms9SN3WIte3W4tYpXKGhexpdRIVrgS
	fCiD5RmBXx3C3Fsr61PrAtWHDfm+zLEDOosm/YQ3wKvT0CyAS/uFfDawybc3LbMLHY3i6dxwcFVr8
	HLr3jK932JfOl7k3OCGDB3LhG4RZ4WS4eH5RTSfx3traPeElCACVr3224yafVJTjp8z83JGG9qikD
	rKXkFbcJM9epoSWAlu1XOjxmLBLEZY41Owx25OSjGRF/jQHoxgKkMeFoUpsPeePdf8GI9cG5M2ic3
	jwJugk46P5mzttlIqO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLf1n-0000000G2uw-2uT9;
	Mon, 24 Jun 2024 08:26:19 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLf1h-0000000G2r8-29rx;
	Mon, 24 Jun 2024 08:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719217574; x=1750753574;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=fGhZO2FmE8nE29RUwQ5tssL6/n/FksubW9qRWYQIPYE=;
  b=llHrujAgUOszgjQUCR4GiqK5gs7THt9RuSdqajsXLO/P1mPwTljjzc2N
   p8+ARCyDZfGtgGpF9Euuipx4reOOPVt9xOWK1mKqwws6elAiGB6I8VSy4
   n+NYT36Z0ptuMbdtUO9I6jnceQeaZsM2+h09B2hjsNH246xDoO9hCi2uE
   ey2NSuiiFqrk17JV5BnXrME7F7YeItmOkE6X42O0CbodCdabKNI3dRZw7
   Nv/ZWbG9NJhWhIFCyufT07evkOaXD3N3ZHxjLrqSY3K/J+h345n+nbnFz
   MOZAqtx+ebid9fIMcTg4SFFfjJZYUmtU9viERsMTO5IpEg5OYiMCXPu2+
   Q==;
X-CSE-ConnectionGUID: AByiGtXeRIyfULdbLTVulg==
X-CSE-MsgGUID: NJ/++iwpSBKT5C0k35bObg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26765436"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="26765436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 01:26:11 -0700
X-CSE-ConnectionGUID: Bx13QGr0TyeIl9N6cpzLDw==
X-CSE-MsgGUID: 4BMncUgvRYS9iGVr3ZiD5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="43035911"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jun 2024 01:26:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 01:26:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 01:26:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 01:26:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 01:26:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmJDppupfMahxXcPUuAOePZ2ectfuCcnhp3Cp7IPDANxTBkapRr0yhPJnZBHEmhoj+GoiRuqD5O7r9Kdrm2jNxiW9PV0Pj8nAK5BoRWAGwSjIdW+Zaz4sZj4TCDNvhBfNgw3qj842WlSIz+d+W513WfAe3aMb92q2WIQHZNyi7i18k9aVmRROolYYjNzaeEHJAjJGcgm8CPejwnZpM2bhuJgfyluPUOx/Bv7IPsgdjSXlcV6SA4xrQzAnPQSGV9Jqs73NcPaV9YJjCLTIgpHNP4AqyitCjaDfnnZ+KKc8vEh+BFFf9DNGfhxY2GZoBeqHAn1EFItA/NOuVD+PL7AjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ag/dNuxDxMpGNJjZ5/rdH7paw2w6rRWw/btotE8n6oo=;
 b=lVKvvOXa4WuNIaW4xj5/Qm3PAjJ6m5StURH11t2ym+k39u7QU/dfPWSJd8CWcBfxDpgalSUiXDTtn+wx9vlTKnnT1rU0BDD9e/TUdMbcP2HHAmC5cgfneBQMSgNdOp9O3FqKB9DYBubrsL64Ri0YIiKTwgOtkp1tml5mSs2kF6El6CgJf3aKeFCcE6H6O4U9KcZe5pSo+6kK1HR38iaYuhbPkgiWpHquPp8LSIAz8CAlm/A8PvhszcMNfF0/ryN9fu0/GZqHCvRhDyG69uiwLDfVtjUNWC6VaDulrJMdNRfTYJH/oMqq1tJTiC3wQB+3Hlb75pvUAmbLdDc6uTzkyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Mon, 24 Jun
 2024 08:26:05 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 08:26:05 +0000
Date: Mon, 24 Jun 2024 16:25:48 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jens Axboe <axboe@kernel.dk>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	<linux-m68k@lists.linux-m68k.org>, <linux-um@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linuxppc-dev@lists.ozlabs.org>, <ceph-devel@vger.kernel.org>,
	<virtualization@lists.linux.dev>, <xen-devel@lists.xenproject.org>,
	<linux-bcache@vger.kernel.org>, <dm-devel@lists.linux.dev>,
	<linux-raid@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <nvdimm@lists.linux.dev>,
	<linux-nvme@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<linux-scsi@vger.kernel.org>, <ying.huang@intel.com>, <feng.tang@intel.com>,
	<fengwei.yin@intel.com>, <oliver.sang@intel.com>
Subject: [axboe-block:for-next] [block]  bd4a633b6f:  fsmark.files_per_sec
 -64.5% regression
Message-ID: <202406241546.6bbd44a7-oliver.sang@intel.com>
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: c2345f79-9682-4c4c-7189-08dc94274a04
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|7416011|366013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ISgO9TcVw3b2S1YGeqXvIUmn8liNmawT+wyVQPqq50YLy07N9BJ6/mxWDr?=
 =?iso-8859-1?Q?7OQxMGXg7Q8EFMgZQb7hfIkoNn9opf82oJYkjQMoYmhwDYm0A/6apn1/xq?=
 =?iso-8859-1?Q?D3oUgZFhpY86dNnP4t/ZMqxm0qIJ3mR69ZgkJRzRjXwDZ6x9VrRhp36976?=
 =?iso-8859-1?Q?qdJMUC46nvzR4s49RP0krzW7Iq/x6U14BBUTZoMHYOivZF+OJTPBOs5XTT?=
 =?iso-8859-1?Q?0Yu+umvjAdkbWyzyLY9INBjoJiyUGKZZonhz9jw+ASvB74DqEqRwMMujjl?=
 =?iso-8859-1?Q?estJkYHmLrxlp20IJrIgCvUz92AckfE82Cx1exGAQ9/xV4bQSm2yhZZ4bX?=
 =?iso-8859-1?Q?35R3T07c+HlaXkRfYqyY70j3TdZKbF63tSHlfrys1dI1/tUsfJ+jSFNz2c?=
 =?iso-8859-1?Q?Ee/E1GZktZQMepihghPwqiBgKvGOAjUxK6I2F0t2LH5kFAAo4xmPgM3Fdu?=
 =?iso-8859-1?Q?f7mQTteNFgawhzbGSNQPn8INgh4GwaDy4KBr8lKWtnSkSywrHPtJT+Mw6K?=
 =?iso-8859-1?Q?ltB3q41onqUr9TM+0PUODmiCe3qgb15W6lCO/Q/F5aMfNL5YAiL/KaYBSj?=
 =?iso-8859-1?Q?3xQFJfGSyaNIyjE2CfYg+L/TTZbb91qxCXFtPjvgqLhIPtVa74WSqBBp1W?=
 =?iso-8859-1?Q?OBrCg8xtQ5mWgxj6Aft9N0Iwozk4/pcn4Y55TEj27G3tfMMEWRroPwgiCY?=
 =?iso-8859-1?Q?bzN22xFq6VsdflyK72od6McTfu2dCasRGjB+yaFo18pr9ew5cl2XgzQOFf?=
 =?iso-8859-1?Q?/Rknnt2Gu8i0FSQjBeO0NrOormWXRJRtpyehjh6CJOHC09Bg+tWBtYef5H?=
 =?iso-8859-1?Q?lFhx4bom/JDaAoaUHovSN6COCqbZY6NyXqRT8bdl4YjMVVbJ+g1JxuFpzf?=
 =?iso-8859-1?Q?FoZprsTg55xUznMHV8QzW3j35p/nbn17hF3KbmA9qpW2Q4BZjX6tPDWJK7?=
 =?iso-8859-1?Q?TT6M3N+8z6d7edIQ2guUz9ONgms5nvylzjT0LVsn+nWQ25RFdQ0zmOy38J?=
 =?iso-8859-1?Q?ZQQWJrD8b9Zf5Uer/fXabadrNvt8B5wo7Sug3l5jI3OC6yQOzAvCe9b0xb?=
 =?iso-8859-1?Q?CzRBwzyCjGnvXfpZJOjLLqNALYyz3gqD+OKi3u/PcNYPgEVo3ppK1aJ+5O?=
 =?iso-8859-1?Q?ehNyJtPVG6kcRD94RKOTUSMLbqUJ8zVdtPnZSgvbdgVqWyG4jnt/EOGNQr?=
 =?iso-8859-1?Q?45W6pifxYrhzcYe1AvUaML4pj50VxUpsn7SzpmS/XQ70rbgcLDzKCRLPO0?=
 =?iso-8859-1?Q?PuuNbn6a842qn72x9N0dzg6MFrymuCt1VlfDKppjbKbrHIstD/jV2+w4WT?=
 =?iso-8859-1?Q?L3KypFWdbXcVmqp0vt2EEeJNdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(7416011)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SSSc+j6be/IS4cJnPSFipnuHvhRcZ0Q0YRDXd50EobTaIxbSl7FYJqRvU+?=
 =?iso-8859-1?Q?9FzUAqctgbckJO2BlsoJZWvVWPokd7zrkW2i6pvz6PQy/6EukGIMVcufXT?=
 =?iso-8859-1?Q?ej5NMA9OuvWu0yIW4cIOjUPVTqLC+yWQGhtTrskfnwVawCSRT78Fzmlp0y?=
 =?iso-8859-1?Q?jJDAlZfFaHX4kBwyhA+T+F9E7bchGqWU6D2H2g1pSM8h3u9JTr5wWqBrtt?=
 =?iso-8859-1?Q?SB+UIuiALWMf4xmRfu08fODr4wVNj/xb23mPLEUKeCQSuSdZcxfzBsK96g?=
 =?iso-8859-1?Q?DKO1b7xTwSIaQgrLy3NphpnHPlGQgBktEJB8e7XuWbMv/Rp7JDtGxevdFa?=
 =?iso-8859-1?Q?4i7wpn3G3NvhR3KXZYI+nlzhk9yWqx645tghy1DVYs1WwCbKTmdF5dwWX/?=
 =?iso-8859-1?Q?df8WvHEp1caQRVRV/RQ/3ilQ4RgpdMfH9dgVPWA908bZEvGZC4qBE/rLGP?=
 =?iso-8859-1?Q?AZpgg1weePIpjKZ0SBDIiCHyyYVNFCVzP2qT1rGUTR3J1WWQy5BfweM7vI?=
 =?iso-8859-1?Q?n5WPg2DuFhY57s0CsfVzFoh74FDI/JORact57Ri8bsi2k+GCq7M5HORO3A?=
 =?iso-8859-1?Q?rslZx86InaCCY9pquxPbSp0By2ubQkKduYiUfbnbtBsW1l9jTnysrLoThG?=
 =?iso-8859-1?Q?y7pIDO4Psugj56/m9N+Pkwrnk7JHYxghzi4DPL24qgtcvEkCRxYUZ7ryRq?=
 =?iso-8859-1?Q?jPuz34L1HxsaLUB/xkIld/uBmkGC5podoQ5WTpWZdBZqvwOuu1y3NklnN9?=
 =?iso-8859-1?Q?1/m+JYsopjypyf5JMh/pDF6cnwo7Vm07Wb3hSqxd+cxzDO+/U7xa1+JMmA?=
 =?iso-8859-1?Q?a5eFU9Fs+nuCr0kT7ZCFCjsX1g5PqcrVptaO4R7g9iO94uutKMLOGYDSHS?=
 =?iso-8859-1?Q?H7z4T0l6YrPcXWaIisP64VVR1/smV1fkR79BfUNMTjPIC5fdOzbKwZXpgF?=
 =?iso-8859-1?Q?JDVgcavN9pF96TNKNM8lEhCNCVvRy6PEn/n7l9wVHrEmcJPLxkx/Xtoe0K?=
 =?iso-8859-1?Q?sIi2GwvTdmZG9Iok9121R04Su3Nyoz+mFiDIYmFoJtTMaLgT2NkTJ0JzR0?=
 =?iso-8859-1?Q?04Fqca74zXF6kqRjhXAO1tBLFJmhQHKP9BMjzaGvCnlnuzU0zyf6QG5H33?=
 =?iso-8859-1?Q?frsFQsdq5d2UTEV/SDDxEQyBhqLG3FVVDbI3XyxP2iI/Vzhh98A+cpKBu3?=
 =?iso-8859-1?Q?7aHaY/ieT9vI3dGCwZj850EzsOIQS8jKKEd/znuDw3Y74WM8ZxesMRB4ZE?=
 =?iso-8859-1?Q?LDR2Du0wXU3zH2xoXZ0h7DZvhCcpKmNtdV05EKjbvh45KfJRWNctXm1wWM?=
 =?iso-8859-1?Q?OI1a7BgiMtlJE3VspFNqSffdEQ8YGxzk5zBR1fPqMBulNFXhb86+eo+qLf?=
 =?iso-8859-1?Q?o06wHvGAL06UxX6/g17+jYCUwbifdnnliR+amwwCYdbfVmz40rUBrCPMdb?=
 =?iso-8859-1?Q?5EOzKW6BV0b+Mc/F16jrmIrJGw/yrIehuWidg3uL/5RB//1w+sfPV6E5Nw?=
 =?iso-8859-1?Q?egwf1bt7ZW1xH3o9zu8cRyzJ2wWQzFv7Q0EDkRUpDLtEuTu9GIYBuOfL1m?=
 =?iso-8859-1?Q?doMV9u/mJCSqnJyOJvkjnulAAeryVdmUpE8axkMej7ig3Pnq7ZvEt7aO8C?=
 =?iso-8859-1?Q?kCLKJs3ndneUm31IQYT1dWHwLxqpM2gUDa1Ya9TAReTDdliFtSObFIPQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2345f79-9682-4c4c-7189-08dc94274a04
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 08:26:05.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gp3etjs7JOufrTzb8Lrtgh2xiE06tVjjkgOFR5Mymtun16sgWRsEmUHEu/+u4F2kvbt1du++C1xIjYkJDK+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
X-OriginatorOrg: intel.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Hello,

kernel test robot noticed a -64.5% regression of fsmark.files_per_sec on:


commit: bd4a633b6f7c3c6b6ebc1a07317643270e751a94 ("block: move the nonrot f=
lag to queue_limits")
https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-next

testcase: fsmark
test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GH=
z (Ivy Bridge-EP) with 64G memory
parameters:

	iterations: 1x
	nr_threads: 32t
	disk: 1SSD
	fs: btrfs
	fs2: nfsv4
	filesize: 9B
	test_size: 400M
	sync_method: fsyncBeforeClose
	nr_directories: 16d
	nr_files_per_directory: 256fpd
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the followin=
g tests:

+------------------+-------------------------------------------------------=
-----------------------------------------+
| testcase: change | fsmark: fsmark.files_per_sec -54.0% regression        =
                                         |
| test machine     | 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @=
 2.70GHz (Ivy Bridge-EP) with 64G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                                           |
|                  | disk=3D1SSD                                           =
                                           |
|                  | filesize=3D8K                                         =
                                           |
|                  | fs2=3Dnfsv4                                           =
                                           |
|                  | fs=3Dbtrfs                                            =
                                           |
|                  | iterations=3D1x                                       =
                                           |
|                  | nr_directories=3D16d                                  =
                                           |
|                  | nr_files_per_directory=3D256fpd                       =
                                           |
|                  | nr_threads=3D32t                                      =
                                           |
|                  | sync_method=3DfsyncBeforeClose                        =
                                           |
|                  | test_size=3D400M                                      =
                                           |
+------------------+-------------------------------------------------------=
-----------------------------------------+
| testcase: change | fxmark: fxmark.ssd_btrfs_DWSL_4_directio.works/sec -75=
.6% regression                           |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ =
2.10GHz (Cascade Lake) with 512G memory  |
| test parameters  | cpufreq_governor=3Dperformance                        =
                                           |
|                  | directio=3Ddirectio                                   =
                                           |
|                  | disk=3D1SSD                                           =
                                           |
|                  | fstype=3Dbtrfs                                        =
                                           |
|                  | media=3Dssd                                           =
                                           |
|                  | test=3DDWSL                                           =
                                           |
|                  | thread_nr=3D4                                         =
                                           |
+------------------+-------------------------------------------------------=
-----------------------------------------+
| testcase: change | fxmark: fxmark.ssd_btrfs_MWUM_4_directio.works/sec -45=
.9% regression                           |
| test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ =
2.10GHz (Cascade Lake) with 512G memory  |
| test parameters  | cpufreq_governor=3Dperformance                        =
                                           |
|                  | directio=3Ddirectio                                   =
                                           |
|                  | disk=3D1SSD                                           =
                                           |
|                  | fstype=3Dbtrfs                                        =
                                           |
|                  | media=3Dssd                                           =
                                           |
|                  | test=3DMWUM                                           =
                                           |
|                  | thread_nr=3D4                                         =
                                           |
+------------------+-------------------------------------------------------=
-----------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202406241546.6bbd44a7-oliver.sang@=
intel.com


Details are as below:
---------------------------------------------------------------------------=
----------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240624/202406241546.6bbd44a7-oliv=
er.sang@intel.com

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_direct=
ories/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_=
size/testcase:
  gcc-13/performance/1SSD/9B/nfsv4/btrfs/1x/x86_64-rhel-8.3/16d/256fpd/32t/=
debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-ivb-2ep2/400M/fsmark

commit: =

  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.189e+09          +176.5%  3.288e+09        cpuidle..time
   4069531           +40.7%    5726734        cpuidle..usage
    107.82           +41.5%     152.62        uptime.boot
      4541           +31.7%       5979        uptime.idle
      1347 =B1 34%   +7052.8%      96367 =B1 17%  numa-meminfo.node1.Active=
(anon)
      9671 =B1129%    +152.0%      24367 =B1 58%  numa-meminfo.node1.Mapped
      1517 =B1 33%   +7000.6%     107767 =B1 17%  numa-meminfo.node1.Shmem
     70.27            -3.0%      68.16        iostat.cpu.idle
     22.10           +21.9%      26.93        iostat.cpu.iowait
      5.28 =B1  4%     -45.2%       2.89        iostat.cpu.system
      2.35           -14.1%       2.02        iostat.cpu.user
    337.03 =B1 34%   +7041.0%      24067 =B1 17%  numa-vmstat.node1.nr_acti=
ve_anon
      2492 =B1127%    +150.1%       6233 =B1 58%  numa-vmstat.node1.nr_mapp=
ed
    379.71 =B1 33%   +6989.5%      26919 =B1 16%  numa-vmstat.node1.nr_shmem
    337.03 =B1 34%   +7041.0%      24067 =B1 17%  numa-vmstat.node1.nr_zone=
_active_anon
     23.59            +4.1       27.67        mpstat.cpu.all.iowait%
      0.56            -0.3        0.27        mpstat.cpu.all.soft%
      4.71 =B1  5%      -2.3        2.37        mpstat.cpu.all.sys%
      2.35            -0.3        2.02        mpstat.cpu.all.usr%
     11.14 =B1  2%     -25.0%       8.35        mpstat.max_utilization_pct
      7.33 =B1 71%    +297.7%      29.17 =B1 11%  perf-c2c.DRAM.local
     12.83 =B1 13%   +3977.9%     523.33 =B1  9%  perf-c2c.DRAM.remote
      1.83 =B1 37%   +3063.6%      58.00 =B1 16%  perf-c2c.HIT.remote
      6.67 =B1 47%   +7842.5%     529.50        perf-c2c.HITM.local
      8.50 =B1 17%   +5262.7%     455.83 =B1  8%  perf-c2c.HITM.remote
    113674           -75.2%      28217        vmstat.io.bo
     12.73 =B1  6%     +21.5%      15.47 =B1  3%  vmstat.procs.b
      4.93 =B1  7%     -37.2%       3.10        vmstat.procs.r
    222679           -59.0%      91356        vmstat.system.cs
     53879           -15.5%      45537        vmstat.system.in
 1.347e+08          +150.3%  3.371e+08        fsmark.app_overhead
      4148           -64.5%       1471        fsmark.files_per_sec
     25.21          +179.6%      70.48        fsmark.time.elapsed_time
     25.21          +179.6%      70.48        fsmark.time.elapsed_time.max
     46.67           -60.7%      18.33 =B1  2%  fsmark.time.percent_of_cpu_=
this_job_got
    580573            +2.3%     593720        fsmark.time.voluntary_context=
_switches
      0.54 =B1142%      +1.8        2.36 =B1 45%  perf-profile.calltrace.cy=
cles-pp.do_anonymous_page.__handle_mm_fault.handle_mm_fault.do_user_addr_fa=
ult.exc_page_fault
      2.30 =B1 26%      +1.9        4.24 =B1 17%  perf-profile.calltrace.cy=
cles-pp.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record.ru=
n_builtin
      2.30 =B1 26%      +1.9        4.24 =B1 17%  perf-profile.children.cyc=
les-pp.perf_mmap__push
      2.00 =B1 52%      +2.0        3.98 =B1 21%  perf-profile.children.cyc=
les-pp.write
      1.76 =B1 55%      +2.0        3.75 =B1 25%  perf-profile.children.cyc=
les-pp.writen
      0.54 =B1142%      +2.1        2.60 =B1 38%  perf-profile.children.cyc=
les-pp.do_anonymous_page
      2798         +3767.9%     108260 =B1  2%  meminfo.Active(anon)
    293199           -34.5%     192046        meminfo.Active(file)
    224570 =B1  2%     +15.3%     258927 =B1  4%  meminfo.AnonHugePages
   1029143           +12.2%    1154431        meminfo.Committed_AS
     13542 =B1  2%     -14.4%      11598 =B1  2%  meminfo.Dirty
     32982           +49.1%      49184 =B1  4%  meminfo.Mapped
      3406         +3452.4%     121025        meminfo.Shmem
    699.76         +3768.6%      27071 =B1  2%  proc-vmstat.nr_active_anon
     73394           -34.5%      48087        proc-vmstat.nr_active_file
    599442           -23.8%     456690        proc-vmstat.nr_dirtied
      3372 =B1  2%     -14.0%       2899 =B1  2%  proc-vmstat.nr_dirty
   1054218            -1.1%    1042135        proc-vmstat.nr_file_pages
    192999            +2.2%     197338        proc-vmstat.nr_inactive_anon
    195427            -8.3%     179255        proc-vmstat.nr_inactive_file
      8470           +48.6%      12584 =B1  4%  proc-vmstat.nr_mapped
    852.97         +3451.5%      30293        proc-vmstat.nr_shmem
     55125            +2.4%      56454        proc-vmstat.nr_slab_reclaimab=
le
    598942           -24.0%     455415        proc-vmstat.nr_written
    699.76         +3768.6%      27071 =B1  2%  proc-vmstat.nr_zone_active_=
anon
     73394           -34.5%      48087        proc-vmstat.nr_zone_active_fi=
le
    192999            +2.2%     197338        proc-vmstat.nr_zone_inactive_=
anon
    195427            -8.3%     179255        proc-vmstat.nr_zone_inactive_=
file
      2992 =B1  2%      -7.0%       2783 =B1  2%  proc-vmstat.nr_zone_write=
_pending
   1701597            +6.4%    1810757        proc-vmstat.numa_hit
   1651924            +6.6%    1760989        proc-vmstat.numa_local
    145673            +4.1%     151618        proc-vmstat.pgactivate
   2171880            +6.0%    2302217        proc-vmstat.pgalloc_normal
    173881 =B1  3%    +101.2%     349830 =B1  2%  proc-vmstat.pgfault
   1649733            +9.4%    1804327        proc-vmstat.pgfree
   3257714           -36.4%    2070947        proc-vmstat.pgpgout
      8901 =B1  2%     +78.8%      15912 =B1 18%  proc-vmstat.pgreuse
      1779 =B1 15%     +94.2%       3455 =B1 21%  sched_debug.cfs_rq:/.avg_=
vruntime.avg
    233.79 =B1 29%    +200.6%     702.80 =B1 30%  sched_debug.cfs_rq:/.avg_=
vruntime.min
      5950 =B1 51%    +121.6%      13187 =B1 54%  sched_debug.cfs_rq:/.load=
.avg
     59.42 =B1 13%     -41.0%      35.07 =B1 22%  sched_debug.cfs_rq:/.load=
_avg.avg
      1779 =B1 15%     +94.2%       3455 =B1 21%  sched_debug.cfs_rq:/.min_=
vruntime.avg
    233.79 =B1 29%    +200.6%     702.80 =B1 30%  sched_debug.cfs_rq:/.min_=
vruntime.min
     38.83 =B1 16%     -60.1%      15.48 =B1 42%  sched_debug.cfs_rq:/.remo=
ved.load_avg.avg
    104.34 =B1 10%     -44.4%      58.00 =B1 29%  sched_debug.cfs_rq:/.remo=
ved.load_avg.stddev
      1198 =B1 12%    +919.1%      12211 =B1 93%  sched_debug.cpu.avg_idle.=
min
     25961 =B1  9%     +81.8%      47185 =B1 21%  sched_debug.cpu.clock.avg
     25962 =B1  9%     +81.7%      47186 =B1 21%  sched_debug.cpu.clock.max
     25960 =B1  9%     +81.8%      47184 =B1 21%  sched_debug.cpu.clock.min
     25888 =B1  9%     +81.6%      47021 =B1 21%  sched_debug.cpu.clock_tas=
k.avg
     25956 =B1  9%     +81.6%      47137 =B1 21%  sched_debug.cpu.clock_tas=
k.max
     24234 =B1  9%     +84.7%      44760 =B1 21%  sched_debug.cpu.clock_tas=
k.min
    737.62 =B1 10%    +100.2%       1476 =B1 21%  sched_debug.cpu.curr->pid=
.max
    727.72 =B1 10%   +3446.7%      25810 =B1 20%  sched_debug.cpu.nr_switch=
es.avg
      3502 =B1 18%    +922.9%      35827 =B1 21%  sched_debug.cpu.nr_switch=
es.max
    111.99 =B1 25%   +6551.9%       7449 =B1 55%  sched_debug.cpu.nr_switch=
es.min
    703.85 =B1 11%    +669.7%       5417 =B1 17%  sched_debug.cpu.nr_switch=
es.stddev
      0.01 =B1 79%   +2728.2%       0.18 =B1 19%  sched_debug.cpu.nr_uninte=
rruptible.avg
      5.50 =B1 28%    +186.2%      15.74 =B1 28%  sched_debug.cpu.nr_uninte=
rruptible.max
     -5.24         +1329.2%     -74.83        sched_debug.cpu.nr_uninterrup=
tible.min
      1.82 =B1 17%    +622.8%      13.16 =B1 29%  sched_debug.cpu.nr_uninte=
rruptible.stddev
     81285           -42.0%      47184 =B1 21%  sched_debug.cpu_clk
 4.295e+09           -57.5%  1.825e+09 =B1 21%  sched_debug.jiffies
     80731           -41.8%      46949 =B1 21%  sched_debug.ktime
     81773           -42.0%      47392 =B1 21%  sched_debug.sched_clk
      1.00           -57.5%       0.42 =B1 21%  sched_debug.sched_clock_sta=
ble()
      3.00           -57.5%       1.28 =B1 21%  sched_debug.sysctl_sched.sy=
sctl_sched_base_slice
   6237751           -57.5%    2651044 =B1 21%  sched_debug.sysctl_sched.sy=
sctl_sched_features
      1.00           -57.5%       0.42 =B1 21%  sched_debug.sysctl_sched.sy=
sctl_sched_tunable_scaling
      1.29 =B1  6%     +24.0%       1.60 =B1  2%  perf-stat.i.MPKI
 1.822e+09           -33.5%  1.211e+09        perf-stat.i.branch-instructio=
ns
      5.38            +1.1        6.49        perf-stat.i.branch-miss-rate%
  97326318           -19.2%   78633918        perf-stat.i.branch-misses
      6.81 =B1  5%      +2.3        9.12        perf-stat.i.cache-miss-rate%
  11262919 =B1  6%     -38.0%    6977426        perf-stat.i.cache-misses
 1.747e+08           -55.8%   77188971        perf-stat.i.cache-references
    247420           -62.0%      94049        perf-stat.i.context-switches
      1.55            +5.5%       1.64        perf-stat.i.cpi
  1.37e+10           -41.0%  8.085e+09        perf-stat.i.cpu-cycles
      1644 =B1  2%     -54.4%     750.14        perf-stat.i.cpu-migrations
 8.908e+09           -33.7%  5.904e+09        perf-stat.i.instructions
      0.65            +5.3%       0.69        perf-stat.i.ipc
      5.22           -61.9%       1.99        perf-stat.i.metric.K/sec
      5046 =B1  4%     -14.7%       4303 =B1  3%  perf-stat.i.minor-faults
      5046 =B1  4%     -14.7%       4304 =B1  3%  perf-stat.i.page-faults
      5.34            +1.2        6.49        perf-stat.overall.branch-miss=
-rate%
      6.44 =B1  6%      +2.6        9.04        perf-stat.overall.cache-mis=
s-rate%
      1.54           -11.0%       1.37        perf-stat.overall.cpi
      0.65           +12.3%       0.73        perf-stat.overall.ipc
 1.754e+09           -31.9%  1.195e+09        perf-stat.ps.branch-instructi=
ons
  93653136           -17.2%   77575731        perf-stat.ps.branch-misses
  10836125 =B1  6%     -36.5%    6879585        perf-stat.ps.cache-misses
 1.681e+08           -54.7%   76107773        perf-stat.ps.cache-references
    238085           -61.1%      92729        perf-stat.ps.context-switches
     46200            +2.4%      47330        perf-stat.ps.cpu-clock
 1.318e+10           -39.5%  7.973e+09        perf-stat.ps.cpu-cycles
      1582 =B1  2%     -53.3%     739.58        perf-stat.ps.cpu-migrations
 8.571e+09           -32.0%  5.824e+09        perf-stat.ps.instructions
      4847 =B1  4%     -12.5%       4240 =B1  3%  perf-stat.ps.minor-faults
      4847 =B1  4%     -12.5%       4241 =B1  3%  perf-stat.ps.page-faults
     46200            +2.4%      47330        perf-stat.ps.task-clock
 2.282e+11           +83.0%  4.175e+11        perf-stat.total.instructions


***************************************************************************=
************************
lkp-ivb-2ep2: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GH=
z (Ivy Bridge-EP) with 64G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/nr_direct=
ories/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_=
size/testcase:
  gcc-13/performance/1SSD/8K/nfsv4/btrfs/1x/x86_64-rhel-8.3/16d/256fpd/32t/=
debian-12-x86_64-20240206.cgz/fsyncBeforeClose/lkp-ivb-2ep2/400M/fsmark

commit: =

  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 8.362e+08          +108.9%  1.747e+09        cpuidle..time
   2413903           +25.3%    3024126        cpuidle..usage
     99.38           +19.6%     118.85        uptime.boot
      4236           +14.7%       4859        uptime.idle
     24.94 =B1  2%      +9.5%      27.30        iostat.cpu.iowait
      4.47           -55.7%       1.98 =B1  2%  iostat.cpu.system
      2.36            +4.1%       2.46        iostat.cpu.user
      0.27 =B1  2%      -0.0        0.25 =B1  2%  mpstat.cpu.all.irq%
      0.48 =B1  4%      -0.2        0.30        mpstat.cpu.all.soft%
      3.99 =B1  3%      -2.5        1.46 =B1  4%  mpstat.cpu.all.sys%
     10.39           -26.3%       7.65 =B1  2%  mpstat.max_utilization_pct
    774882 =B1 12%     -24.8%     582410 =B1 19%  numa-numastat.node0.local=
_node
    808526 =B1 12%     -25.3%     604191 =B1 17%  numa-numastat.node0.numa_=
hit
    349212 =B1 26%     +54.4%     539297 =B1 21%  numa-numastat.node1.local=
_node
    365300 =B1 28%     +55.3%     567307 =B1 18%  numa-numastat.node1.numa_=
hit
    123433           -63.1%      45597        vmstat.io.bo
      5.09 =B1 14%     -27.9%       3.67 =B1 11%  vmstat.procs.r
    176044           -50.8%      86694        vmstat.system.cs
     52141           -18.2%      42673        vmstat.system.in
  74993100 =B1  3%    +108.8%  1.566e+08 =B1  5%  fsmark.app_overhead
      3060           -54.0%       1408        fsmark.files_per_sec
     17.10          +115.2%      36.80        fsmark.time.elapsed_time
     17.10          +115.2%      36.80        fsmark.time.elapsed_time.max
     36.67 =B1  2%     -48.2%      19.00        fsmark.time.percent_of_cpu_=
this_job_got
    254561 =B1  2%     -24.9%     191102        meminfo.Active
      2679          +314.6%      11108 =B1 19%  meminfo.Active(anon)
    251882 =B1  2%     -28.5%     179993        meminfo.Active(file)
    148758           +12.9%     167936 =B1  2%  meminfo.AnonHugePages
     15112           -23.0%      11635 =B1  2%  meminfo.Dirty
     32981           +77.1%      58414 =B1  7%  meminfo.Mapped
      3295          +838.4%      30926        meminfo.Shmem
    200691 =B1 18%     -48.8%     102702 =B1 28%  numa-meminfo.node0.Active
      1010 =B1 28%    +159.8%       2626 =B1 80%  numa-meminfo.node0.Active=
(anon)
    199680 =B1 18%     -49.9%     100076 =B1 30%  numa-meminfo.node0.Active=
(file)
     11897 =B1 19%     -48.2%       6167 =B1 30%  numa-meminfo.node0.Dirty
    405731 =B1 10%     -26.9%     296744 =B1 15%  numa-meminfo.node0.Inacti=
ve(file)
      1370 =B1 16%    +183.3%       3882 =B1101%  numa-meminfo.node0.Shmem
      1668 =B1 17%    +409.3%       8495 =B1 21%  numa-meminfo.node1.Active=
(anon)
      1929 =B1 11%   +1307.1%      27148 =B1 15%  numa-meminfo.node1.Shmem
    252.78 =B1 28%    +160.3%     657.99 =B1 80%  numa-vmstat.node0.nr_acti=
ve_anon
     50066 =B1 18%     -50.5%      24802 =B1 30%  numa-vmstat.node0.nr_acti=
ve_file
    330634 =B1 12%     -37.2%     207678 =B1 20%  numa-vmstat.node0.nr_dirt=
ied
      2979 =B1 19%     -48.1%       1545 =B1 30%  numa-vmstat.node0.nr_dirty
    101630 =B1 10%     -27.2%      74010 =B1 15%  numa-vmstat.node0.nr_inac=
tive_file
      6210 =B1 44%     +65.8%      10299 =B1 12%  numa-vmstat.node0.nr_mapp=
ed
    342.90 =B1 16%    +186.3%     981.88 =B1103%  numa-vmstat.node0.nr_shmem
    324012 =B1 12%     -36.1%     206943 =B1 19%  numa-vmstat.node0.nr_writ=
ten
    252.78 =B1 28%    +160.3%     657.99 =B1 80%  numa-vmstat.node0.nr_zone=
_active_anon
     50066 =B1 18%     -50.5%      24802 =B1 30%  numa-vmstat.node0.nr_zone=
_active_file
    101629 =B1 10%     -27.2%      74010 =B1 15%  numa-vmstat.node0.nr_zone=
_inactive_file
      2718 =B1 17%     -47.0%       1439 =B1 27%  numa-vmstat.node0.nr_zone=
_write_pending
    808122 =B1 12%     -25.3%     603704 =B1 17%  numa-vmstat.node0.numa_hit
    774479 =B1 12%     -24.9%     581923 =B1 19%  numa-vmstat.node0.numa_lo=
cal
    417.60 =B1 17%    +309.6%       1710 =B1 48%  numa-vmstat.node1.nr_acti=
ve_anon
    482.47 =B1 11%   +1244.3%       6485 =B1 16%  numa-vmstat.node1.nr_shmem
    417.60 =B1 17%    +309.6%       1710 =B1 48%  numa-vmstat.node1.nr_zone=
_active_anon
    364919 =B1 27%     +55.1%     566146 =B1 18%  numa-vmstat.node1.numa_hit
    348831 =B1 26%     +54.3%     538135 =B1 21%  numa-vmstat.node1.numa_lo=
cal
    669.84          +252.2%       2359 =B1 41%  proc-vmstat.nr_active_anon
     63068 =B1  2%     -29.2%      44622        proc-vmstat.nr_active_file
    177070            +1.1%     178960        proc-vmstat.nr_anon_pages
    465975           -18.7%     378719        proc-vmstat.nr_dirtied
      3780           -22.5%       2928 =B1  2%  proc-vmstat.nr_dirty
   1004574            -2.7%     977058        proc-vmstat.nr_file_pages
    177173            +3.8%     183958        proc-vmstat.nr_inactive_anon
    155978            -9.9%     140569        proc-vmstat.nr_inactive_file
      8469           +77.0%      14989 =B1  7%  proc-vmstat.nr_mapped
    825.02          +796.6%       7397 =B1  7%  proc-vmstat.nr_shmem
     43851            +2.8%      45074        proc-vmstat.nr_slab_reclaimab=
le
    457971           -17.6%     377565        proc-vmstat.nr_written
    669.84          +252.2%       2359 =B1 41%  proc-vmstat.nr_zone_active_=
anon
     63068 =B1  2%     -29.2%      44622        proc-vmstat.nr_zone_active_=
file
    177173            +3.8%     183958        proc-vmstat.nr_zone_inactive_=
anon
    155978            -9.9%     140569        proc-vmstat.nr_zone_inactive_=
file
      3373 =B1  5%     -16.1%       2832 =B1  4%  proc-vmstat.nr_zone_write=
_pending
    157270 =B1  3%     +57.2%     247258        proc-vmstat.pgfault
   2488450           -26.5%    1829243        proc-vmstat.pgpgout
      7922 =B1  4%     +23.0%       9742 =B1  2%  proc-vmstat.pgreuse
      1.94 =B1 36%      +1.4        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.record__mmap_read_evlist.__cmd_record.cmd_record.run_builtin.main
      1.65 =B1 14%      +1.7        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_record.ru=
n_builtin
      0.00            +1.7        1.69 =B1  7%  perf-profile.calltrace.cycl=
es-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
      2.80 =B1 35%      +1.7        4.50 =B1 18%  perf-profile.calltrace.cy=
cles-pp.__cmd_record.cmd_record.run_builtin.main
      2.80 =B1 35%      +1.7        4.50 =B1 18%  perf-profile.calltrace.cy=
cles-pp.cmd_record.run_builtin.main
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.calltrace.cy=
cles-pp._Fork
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.calltrace.cy=
cles-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.calltrace.cy=
cles-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.calltrace.cy=
cles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe._Fork
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.calltrace.cy=
cles-pp.entry_SYSCALL_64_after_hwframe._Fork
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.calltrace.cy=
cles-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hw=
frame._Fork
      1.42 =B1 47%      +1.9        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.w=
rite
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.writen.record__p=
ushfn
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.entry_SYSCALL_64_after_hwframe.write.writen.record__pushfn.perf_mma=
p__push
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write.do=
_syscall_64
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write.writen
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cmd_recor=
d.cmd_record
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.shmem_file_write_iter.vfs_write.ksys_write.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.write.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.calltrace.cy=
cles-pp.writen.record__pushfn.perf_mmap__push.record__mmap_read_evlist.__cm=
d_record
      1.94 =B1 36%      +1.4        3.32 =B1 22%  perf-profile.children.cyc=
les-pp.record__mmap_read_evlist
      1.65 =B1 14%      +1.7        3.32 =B1 22%  perf-profile.children.cyc=
les-pp.perf_mmap__push
      0.00            +1.7        1.69 =B1  7%  perf-profile.children.cycle=
s-pp.dup_mm
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.children.cyc=
les-pp._Fork
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.children.cyc=
les-pp.__do_sys_clone
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.children.cyc=
les-pp.copy_process
      0.27 =B1223%      +1.7        1.98 =B1 33%  perf-profile.children.cyc=
les-pp.kernel_clone
      1.42 =B1 47%      +1.9        3.32 =B1 22%  perf-profile.children.cyc=
les-pp.ksys_write
      1.42 =B1 47%      +1.9        3.32 =B1 22%  perf-profile.children.cyc=
les-pp.vfs_write
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.children.cyc=
les-pp.generic_perform_write
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.children.cyc=
les-pp.record__pushfn
      1.15 =B1 72%      +2.2        3.32 =B1 22%  perf-profile.children.cyc=
les-pp.shmem_file_write_iter
      1.15 =B1 72%      +2.5        3.62 =B1  7%  perf-profile.children.cyc=
les-pp.writen
      1.42 =B1 47%      +2.5        3.92 =B1 17%  perf-profile.children.cyc=
les-pp.write
 1.799e+09           -23.0%  1.386e+09        perf-stat.i.branch-instructio=
ns
      5.46            +1.0        6.50        perf-stat.i.branch-miss-rate%
  97222174            -9.3%   88136147        perf-stat.i.branch-misses
      6.96 =B1  8%      +2.5        9.49 =B1  3%  perf-stat.i.cache-miss-ra=
te%
   9472265 =B1 10%     -19.3%    7648380 =B1  3%  perf-stat.i.cache-misses
 1.463e+08           -43.9%   82019846        perf-stat.i.cache-references
    199745           -53.6%      92597        perf-stat.i.context-switches
      1.46            -9.4%       1.32        perf-stat.i.cpi
 1.265e+10           -30.4%  8.795e+09        perf-stat.i.cpu-cycles
      1465 =B1  9%     -51.9%     705.40 =B1  2%  perf-stat.i.cpu-migrations
      1373 =B1  9%     -15.7%       1158 =B1  3%  perf-stat.i.cycles-betwee=
n-cache-misses
 8.814e+09           -23.1%   6.78e+09        perf-stat.i.instructions
      0.70            +9.4%       0.76        perf-stat.i.ipc
      4.27           -53.5%       1.98        perf-stat.i.metric.K/sec
      6615 =B1  6%     -16.4%       5530        perf-stat.i.minor-faults
      6615 =B1  6%     -16.4%       5530        perf-stat.i.page-faults
      5.40            +1.0        6.36        perf-stat.overall.branch-miss=
-rate%
      6.47 =B1  8%      +2.9        9.32 =B1  3%  perf-stat.overall.cache-m=
iss-rate%
      1.43            -9.6%       1.30        perf-stat.overall.cpi
      1347 =B1  8%     -14.6%       1151 =B1  3%  perf-stat.overall.cycles-=
between-cache-misses
      0.70           +10.6%       0.77        perf-stat.overall.ipc
   1.7e+09           -20.7%  1.348e+09        perf-stat.ps.branch-instructi=
ons
  91873961            -6.6%   85777312        perf-stat.ps.branch-misses
   8951075 =B1 10%     -16.9%    7442424 =B1  3%  perf-stat.ps.cache-misses
 1.382e+08           -42.3%   79820635        perf-stat.ps.cache-references
    188782           -52.3%      90114        perf-stat.ps.context-switches
     45375            +3.0%      46719        perf-stat.ps.cpu-clock
 1.195e+10           -28.4%   8.56e+09        perf-stat.ps.cpu-cycles
      1385 =B1  9%     -50.5%     686.49 =B1  2%  perf-stat.ps.cpu-migratio=
ns
 8.328e+09           -20.8%  6.598e+09        perf-stat.ps.instructions
      6239 =B1  6%     -13.8%       5375        perf-stat.ps.minor-faults
      6239 =B1  6%     -13.8%       5376        perf-stat.ps.page-faults
     45375            +3.0%      46719        perf-stat.ps.task-clock
  1.52e+11           +63.0%  2.477e+11        perf-stat.total.instructions



***************************************************************************=
************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz=
 (Cascade Lake) with 512G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_gr=
oup/test/testcase/thread_nr:
  gcc-13/performance/directio/1SSD/btrfs/x86_64-rhel-8.3/ssd/debian-11.1-x8=
6_64-20220510.cgz/lkp-csl-2sp7/DWSL/fxmark/4

commit: =

  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   2711233           -49.2%    1378365        cpuidle..usage
    113.67 =B1 32%     -77.0%      26.17 =B1 15%  perf-c2c.HITM.local
     68.36           +32.7%      90.69        iostat.cpu.idle
     16.62           -85.0%       2.49 =B1  3%  iostat.cpu.iowait
     14.20 =B1  2%     -57.2%       6.08 =B1  3%  iostat.cpu.system
     33.33 =B1111%     -33.3        0.00        perf-profile.calltrace.cycl=
es-pp.folio_remove_rmap_ptes.zap_present_ptes.zap_pte_range.zap_pmd_range.u=
nmap_page_range
     41.67 =B1 82%     -41.7        0.00        perf-profile.children.cycle=
s-pp.folio_remove_rmap_ptes
     25.00 =B1100%     -25.0        0.00        perf-profile.self.cycles-pp=
.folio_remove_rmap_ptes
   1494783 =B1  2%     -68.3%     473712 =B1  4%  numa-numastat.node0.local=
_node
   1516920           -64.6%     537707 =B1  5%  numa-numastat.node0.numa_hit
    114515 =B1 25%     +38.9%     159043 =B1 14%  numa-numastat.node1.local=
_node
     77985 =B1 18%     -53.4%      36364 =B1 53%  numa-numastat.node1.other=
_node
     67.69           +22.9       90.61        mpstat.cpu.all.idle%
     17.08           -14.5        2.56 =B1  3%  mpstat.cpu.all.iowait%
      1.46 =B1  3%      -0.2        1.23 =B1  2%  mpstat.cpu.all.irq%
      0.93 =B1  2%      -0.6        0.33 =B1  2%  mpstat.cpu.all.soft%
     12.01 =B1  2%      -7.5        4.49 =B1  5%  mpstat.cpu.all.sys%
   1045438           -85.4%     152557 =B1  3%  numa-meminfo.node0.Active
     75557 =B1 13%     -71.3%      21669        numa-meminfo.node0.Active(a=
non)
    969881           -86.5%     130887 =B1  3%  numa-meminfo.node0.Active(f=
ile)
    869623 =B1  4%     -56.8%     375494 =B1 16%  numa-meminfo.node0.Inacti=
ve
    653865 =B1  2%     -71.4%     186796 =B1  3%  numa-meminfo.node0.Inacti=
ve(file)
     92743 =B1 11%     -63.3%      33993 =B1  3%  numa-meminfo.node0.Shmem
     68.29           +32.8%      90.72        vmstat.cpu.id
     16.68           -84.7%       2.55 =B1  6%  vmstat.cpu.wa
    116067           -85.7%      16600 =B1  2%  vmstat.io.bo
   4660813           -29.0%    3309839        vmstat.memory.cache
      0.52 =B1 15%     -80.0%       0.10 =B1 39%  vmstat.procs.b
      1.58 =B1  9%     -21.0%       1.25 =B1 10%  vmstat.procs.r
     41812 =B1  3%     -73.0%      11271 =B1  2%  vmstat.system.cs
     27419           -31.7%      18726        vmstat.system.in
      0.10 =B1119%     -56.9%       0.04 =B1  5%  perf-stat.i.MPKI
     43412 =B1  3%     -74.3%      11165 =B1  3%  perf-stat.i.context-switc=
hes
      1457 =B1  5%     -71.2%     419.29 =B1  2%  perf-stat.i.cpu-migrations
    129.81 =B1 13%     +15.6%     150.07        perf-stat.i.cycles-between-=
cache-misses
      0.13 =B1 42%     -86.8%       0.02 =B1115%  perf-stat.i.major-faults
     61.60 =B1 34%     -33.0%      41.27 =B1  6%  perf-stat.i.metric.K/sec
     42626 =B1  3%     -74.3%      10965 =B1  3%  perf-stat.ps.context-swit=
ches
      1431 =B1  5%     -71.2%     411.72 =B1  2%  perf-stat.ps.cpu-migratio=
ns
      0.13 =B1 42%     -86.7%       0.02 =B1114%  perf-stat.ps.major-faults
   1046381           -85.4%     152689 =B1  3%  meminfo.Active
     75958 =B1 13%     -70.7%      22233        meminfo.Active(anon)
    970423           -86.6%     130455 =B1  3%  meminfo.Active(file)
   4602998           -29.7%    3237382        meminfo.Cached
   1062713           -44.5%     590084        meminfo.Inactive
    654829 =B1  2%     -71.5%     186936 =B1  2%  meminfo.Inactive(file)
   6405282           -22.1%    4991953        meminfo.Memused
    185977           -10.1%     167119        meminfo.SUnreclaim
     94548 =B1 11%     -61.3%      36622        meminfo.Shmem
    268307            -9.1%     243941        meminfo.Slab
   6936784           -21.5%    5447420 =B1  2%  meminfo.max_used_kB
     75.00 =B1  2%     -12.9%      65.33        turbostat.Avg_MHz
      2.86 =B1  2%      -0.4        2.50        turbostat.Busy%
    633581           -75.7%     154084 =B1  3%  turbostat.C1
      0.62 =B1  2%      -0.3        0.36 =B1  3%  turbostat.C1%
   1019660           -75.2%     252730 =B1  2%  turbostat.C1E
      1.80            -0.6        1.21 =B1  2%  turbostat.C1E%
   1946276           -32.6%    1312590        turbostat.IRQ
    191212 =B1 15%     -87.9%      23221        turbostat.POLL
      0.03            -0.0        0.00        turbostat.POLL%
     10.25 =B1  4%    +295.1%      40.50        turbostat.Pkg%pc2
    117.35           -11.0%     104.45        turbostat.PkgWatt
     18889 =B1 13%     -71.3%       5417        numa-vmstat.node0.nr_active=
_anon
    242499           -86.5%      32724 =B1  3%  numa-vmstat.node0.nr_active=
_file
   1759926           -87.0%     228849 =B1  2%  numa-vmstat.node0.nr_dirtied
    163471 =B1  2%     -71.4%      46702 =B1  3%  numa-vmstat.node0.nr_inac=
tive_file
     23187 =B1 11%     -63.3%       8499 =B1  3%  numa-vmstat.node0.nr_shmem
   1759571           -87.0%     228761 =B1  2%  numa-vmstat.node0.nr_written
     18889 =B1 13%     -71.3%       5417        numa-vmstat.node0.nr_zone_a=
ctive_anon
    242499           -86.5%      32724 =B1  3%  numa-vmstat.node0.nr_zone_a=
ctive_file
    163471 =B1  2%     -71.4%      46702 =B1  3%  numa-vmstat.node0.nr_zone=
_inactive_file
   1516890           -64.6%     537657 =B1  5%  numa-vmstat.node0.numa_hit
   1494751 =B1  2%     -68.3%     473662 =B1  4%  numa-vmstat.node0.numa_lo=
cal
    114346 =B1 25%     +38.9%     158813 =B1 14%  numa-vmstat.node1.numa_lo=
cal
     77985 =B1 18%     -53.4%      36365 =B1 53%  numa-vmstat.node1.numa_ot=
her
    115.07           +55.1%     178.53        fxmark.ssd_btrfs_DWSL_4_direc=
tio.idle_sec
     59.45           +55.0%      92.14        fxmark.ssd_btrfs_DWSL_4_direc=
tio.idle_util
     46.68           -85.2%       6.89 =B1  3%  fxmark.ssd_btrfs_DWSL_4_dir=
ectio.iowait_sec
     24.12           -85.3%       3.56 =B1  3%  fxmark.ssd_btrfs_DWSL_4_dir=
ectio.iowait_util
      3.35           -20.3%       2.67 =B1  2%  fxmark.ssd_btrfs_DWSL_4_dir=
ectio.irq_sec
      1.73           -20.3%       1.38 =B1  2%  fxmark.ssd_btrfs_DWSL_4_dir=
ectio.irq_util
      2.49           -66.1%       0.84        fxmark.ssd_btrfs_DWSL_4_direc=
tio.softirq_sec
      1.29           -66.1%       0.44        fxmark.ssd_btrfs_DWSL_4_direc=
tio.softirq_util
     25.18 =B1  3%     -82.9%       4.32 =B1 12%  fxmark.ssd_btrfs_DWSL_4_d=
irectio.sys_sec
     13.01 =B1  2%     -82.9%       2.23 =B1 12%  fxmark.ssd_btrfs_DWSL_4_d=
irectio.sys_util
      0.80 =B1 10%     -37.2%       0.50 =B1  8%  fxmark.ssd_btrfs_DWSL_4_d=
irectio.user_sec
      0.41 =B1 10%     -37.3%       0.26 =B1  8%  fxmark.ssd_btrfs_DWSL_4_d=
irectio.user_util
    226633           -75.6%      55335 =B1  3%  fxmark.ssd_btrfs_DWSL_4_dir=
ectio.works
      4532           -75.6%       1106 =B1  3%  fxmark.ssd_btrfs_DWSL_4_dir=
ectio.works/sec
   4143236 =B1  5%     -87.7%     508948 =B1  4%  fxmark.time.file_system_o=
utputs
      1228 =B1 47%     -81.9%     222.17 =B1 15%  fxmark.time.involuntary_c=
ontext_switches
     11.33 =B1  4%     -64.7%       4.00        fxmark.time.percent_of_cpu_=
this_job_got
    269631 =B1  7%     -75.9%      64948 =B1  3%  fxmark.time.voluntary_con=
text_switches
     18991 =B1 13%     -70.9%       5527        proc-vmstat.nr_active_anon
    242399           -86.5%      32827 =B1  3%  proc-vmstat.nr_active_file
   1759926           -87.0%     228849 =B1  2%  proc-vmstat.nr_dirtied
   1150679           -29.6%     809855        proc-vmstat.nr_file_pages
    163806           -71.3%      47029 =B1  3%  proc-vmstat.nr_inactive_file
     23665 =B1 11%     -61.4%       9139        proc-vmstat.nr_shmem
     20589            -6.7%      19203        proc-vmstat.nr_slab_reclaimab=
le
     46538           -10.3%      41763        proc-vmstat.nr_slab_unreclaim=
able
   1759571           -87.0%     228761 =B1  2%  proc-vmstat.nr_written
     18991 =B1 13%     -70.9%       5527        proc-vmstat.nr_zone_active_=
anon
    242399           -86.5%      32827 =B1  3%  proc-vmstat.nr_zone_active_=
file
    163806           -71.3%      47029 =B1  3%  proc-vmstat.nr_zone_inactiv=
e_file
   1711454           -57.1%     735022        proc-vmstat.numa_hit
   1611324           -60.6%     634659        proc-vmstat.numa_local
    583094           -90.6%      54844 =B1  2%  proc-vmstat.pgactivate
   1786453           -55.2%     799914        proc-vmstat.pgalloc_normal
   1682791           -57.0%     724247        proc-vmstat.pgfree
   8394850           -85.8%    1195219 =B1  2%  proc-vmstat.pgpgout
      0.01 =B1 17%    +190.9%       0.02 =B1  8%  perf-sched.sch_delay.avg.=
ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.04 =B1128%     -99.1%       0.00 =B1223%  perf-sched.sch_delay.avg.=
ms.__cond_resched.submit_bio_noacct.btrfs_submit_chunk.btrfs_submit_bio.sub=
mit_eb_page
      0.01 =B1 13%    -100.0%       0.00        perf-sched.sch_delay.avg.ms=
.btrfs_commit_transaction.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.01 =B1 49%    -100.0%       0.00        perf-sched.sch_delay.avg.ms=
.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_=
sys_fsync
      0.00 =B1 18%    +120.7%       0.01 =B1  6%  perf-sched.sch_delay.avg.=
ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawa=
it_range
      0.00 =B1 14%     +55.0%       0.01 =B1  7%  perf-sched.sch_delay.avg.=
ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
      0.00 =B1 60%     -94.4%       0.00 =B1223%  perf-sched.sch_delay.avg.=
ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[un=
known]
      0.00 =B1 82%    +630.0%       0.01 =B1  7%  perf-sched.sch_delay.avg.=
ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 =B1 33%    +266.7%       0.01 =B1 22%  perf-sched.sch_delay.avg.=
ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.01 =B1 28%    -100.0%       0.00        perf-sched.sch_delay.avg.ms=
.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_log_commit
      0.00 =B1 83%    +238.9%       0.01 =B1  3%  perf-sched.sch_delay.avg.=
ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.btrfs_tree_=
read_lock_nested
      0.01 =B1 13%    +163.9%       0.02 =B1 15%  perf-sched.sch_delay.avg.=
ms.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.btrfs_dio_write
      0.00 =B1 17%    +200.0%       0.01 =B1  7%  perf-sched.sch_delay.avg.=
ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devic=
es
      0.01 =B1 10%     +66.7%       0.01 =B1 15%  perf-sched.sch_delay.avg.=
ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01 =B1 11%     +35.0%       0.01        perf-sched.sch_delay.avg.ms=
.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.02 =B1 14%     +69.9%       0.03 =B1  7%  perf-sched.sch_delay.avg.=
ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.01 =B1  6%     +64.9%       0.01 =B1  3%  perf-sched.sch_delay.avg.=
ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.63 =B1 26%     -82.4%       0.29 =B1 71%  perf-sched.sch_delay.max.=
ms.__cond_resched.__wait_for_common.barrier_all_devices.write_all_supers.bt=
rfs_sync_log
      0.00 =B1178%    +693.8%       0.02 =B1 75%  perf-sched.sch_delay.max.=
ms.__cond_resched.down_write.btrfs_tree_lock_nested.btrfs_search_slot.btrfs=
_lookup_csum
      0.04 =B1 22%     +51.5%       0.07 =B1 13%  perf-sched.sch_delay.max.=
ms.__cond_resched.kmem_cache_alloc_noprof.alloc_extent_state.__set_extent_b=
it.lock_extent
      0.02 =B1 31%    +240.8%       0.08 =B1 18%  perf-sched.sch_delay.max.=
ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.30 =B1169%     -99.9%       0.00 =B1223%  perf-sched.sch_delay.max.=
ms.__cond_resched.submit_bio_noacct.btrfs_submit_chunk.btrfs_submit_bio.sub=
mit_eb_page
      0.01 =B1 33%    -100.0%       0.00        perf-sched.sch_delay.max.ms=
.btrfs_commit_transaction.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.01 =B1 67%    -100.0%       0.00        perf-sched.sch_delay.max.ms=
.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_=
sys_fsync
      0.10 =B1 51%     -94.4%       0.01 =B1129%  perf-sched.sch_delay.max.=
ms.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
     11.97 =B1117%     -93.7%       0.75 =B1 43%  perf-sched.sch_delay.max.=
ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawa=
it_range
      1.07 =B1 37%     -64.5%       0.38 =B1 75%  perf-sched.sch_delay.max.=
ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
      0.01 =B1 86%     -96.3%       0.00 =B1223%  perf-sched.sch_delay.max.=
ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[un=
known]
      0.00 =B1104%   +2221.7%       0.09 =B1 35%  perf-sched.sch_delay.max.=
ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.05 =B1 56%     -84.2%       0.01 =B1179%  perf-sched.sch_delay.max.=
ms.schedule_preempt_disabled.__mutex_lock.constprop.0.start_log_trans
      0.04 =B1113%    -100.0%       0.00        perf-sched.sch_delay.max.ms=
.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_log_commit
      0.96 =B1 51%     -54.4%       0.44 =B1 38%  perf-sched.sch_delay.max.=
ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devic=
es
      0.01 =B1 19%    +113.3%       0.01 =B1  4%  perf-sched.total_sch_dela=
y.average.ms
      1.73 =B1 12%    +266.3%       6.32 =B1  2%  perf-sched.total_wait_and=
_delay.average.ms
    158630 =B1 12%     -72.8%      43138 =B1  2%  perf-sched.total_wait_and=
_delay.count.ms
      1.72 =B1 12%    +266.7%       6.31 =B1  2%  perf-sched.total_wait_tim=
e.average.ms
      3.19          -100.0%       0.00        perf-sched.wait_and_delay.avg=
.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.=
drm_atomic_helper_commit_planes
      0.27 =B1  3%    +445.1%       1.46 =B1  3%  perf-sched.wait_and_delay=
.avg.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fd=
atawait_range
      0.06 =B1  2%     +18.1%       0.07        perf-sched.wait_and_delay.a=
vg.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
    171.54 =B1  8%    +127.3%     389.88 =B1  2%  perf-sched.wait_and_delay=
.avg.ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.43 =B1  3%    +466.1%       2.44 =B1  2%  perf-sched.wait_and_delay=
.avg.ms.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.btrfs_dio_write
      0.06 =B1 15%     +77.5%       0.11 =B1  3%  perf-sched.wait_and_delay=
.avg.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_=
devices
      2.32 =B1  4%     +20.8%       2.80        perf-sched.wait_and_delay.a=
vg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1.17 =B1  4%    +379.8%       5.63 =B1  4%  perf-sched.wait_and_delay=
.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     15.00 =B1 47%     -86.7%       2.00 =B1125%  perf-sched.wait_and_delay=
.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write=
.ksys_write
     35.83 =B1 25%     +67.4%      60.00 =B1  9%  perf-sched.wait_and_delay=
.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork=
_asm
      1.00          -100.0%       0.00        perf-sched.wait_and_delay.cou=
nt.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.d=
rm_atomic_helper_commit_planes
     17297 =B1  7%     -88.0%       2070 =B1  2%  perf-sched.wait_and_delay=
.count.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fda=
tawait_range
     10087 =B1  5%     -84.7%       1539 =B1  2%  perf-sched.wait_and_delay=
.count.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
     94.33 =B1 10%     -58.3%      39.33        perf-sched.wait_and_delay.c=
ount.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
    120.33 =B1100%   +1865.5%       2365 =B1  2%  perf-sched.wait_and_delay=
.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.btrfs=
_tree_lock_nested
     20315 =B1  5%     -71.5%       5784 =B1  2%  perf-sched.wait_and_delay=
.count.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.btrfs_dio_write
     10088 =B1  5%     -84.7%       1539 =B1  2%  perf-sched.wait_and_delay=
.count.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_d=
evices
      2141 =B1  5%     -28.8%       1524        perf-sched.wait_and_delay.c=
ount.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     20219 =B1  5%     -78.4%       4371 =B1  2%  perf-sched.wait_and_delay=
.count.wait_log_commit.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
     41448 =B1  5%     -78.1%       9088 =B1  2%  perf-sched.wait_and_delay=
.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.19          -100.0%       0.00        perf-sched.wait_and_delay.max=
.ms.__cond_resched.ww_mutex_lock.drm_gem_vunmap_unlocked.drm_gem_fb_vunmap.=
drm_atomic_helper_commit_planes
      1019 =B1  4%     +46.3%       1492 =B1 31%  perf-sched.wait_and_delay=
.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_=
64
     54.34 =B1 96%     -84.7%       8.32 =B1120%  perf-sched.wait_and_delay=
.max.ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fd=
atawait_range
      2.31 =B1 36%     -62.1%       0.87 =B1 58%  perf-sched.wait_and_delay=
.max.ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
      1321 =B1 55%     -77.3%     300.07 =B1 35%  perf-sched.wait_and_delay=
.max.ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.btrfs_=
tree_read_lock_nested
      2.08 =B1 47%     -48.5%       1.07 =B1 22%  perf-sched.wait_and_delay=
.max.ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_=
devices
      1437 =B1 27%     -31.3%     988.15 =B1  5%  perf-sched.wait_and_delay=
.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.19 =B1149%    +615.1%       1.36 =B1 73%  perf-sched.wait_time.avg.=
ms.__cond_resched.down_write.btrfs_tree_lock_nested.btrfs_search_slot.btrfs=
_lookup_csum
      0.04 =B1131%  +11801.2%       5.08 =B1134%  perf-sched.wait_time.avg.=
ms.__cond_resched.kmem_cache_alloc_noprof.add_delayed_ref.btrfs_drop_extent=
s.insert_reserved_file_extent
      0.47 =B1 67%    +471.0%       2.66 =B1 30%  perf-sched.wait_time.avg.=
ms.__cond_resched.kmem_cache_alloc_noprof.alloc_extent_state.__set_extent_b=
it.lock_extent
      0.42 =B1 20%     -98.7%       0.01 =B1223%  perf-sched.wait_time.avg.=
ms.__cond_resched.submit_bio_noacct.btrfs_submit_chunk.btrfs_submit_bio.sub=
mit_eb_page
     78.12 =B1101%    -100.0%       0.00        perf-sched.wait_time.avg.ms=
.btrfs_commit_transaction.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.05 =B1 14%    -100.0%       0.00        perf-sched.wait_time.avg.ms=
.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_=
sys_fsync
      0.26 =B1  3%    +450.9%       1.45 =B1  3%  perf-sched.wait_time.avg.=
ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawa=
it_range
      0.05 =B1  2%     +16.5%       0.06        perf-sched.wait_time.avg.ms=
.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
     11.37 =B1142%     -99.9%       0.01 =B1150%  perf-sched.wait_time.avg.=
ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
    171.54 =B1  8%    +127.3%     389.87 =B1  2%  perf-sched.wait_time.avg.=
ms.schedule_hrtimeout_range_clock.do_poll.constprop.0.do_sys_poll
      0.67 =B1  9%    -100.0%       0.00        perf-sched.wait_time.avg.ms=
.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_log_commit
      3.35 =B1 72%     -85.6%       0.48 =B1 39%  perf-sched.wait_time.avg.=
ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.btrfs_tre=
e_lock_nested
      0.43 =B1  3%    +470.0%       2.43 =B1  2%  perf-sched.wait_time.avg.=
ms.schedule_timeout.io_schedule_timeout.__iomap_dio_rw.btrfs_dio_write
      0.06 =B1 15%     +73.6%       0.10 =B1  3%  perf-sched.wait_time.avg.=
ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devic=
es
      2.31 =B1  4%     +20.8%       2.79        perf-sched.wait_time.avg.ms=
.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.07 =B1174%    -100.0%       0.00        perf-sched.wait_time.avg.ms=
.wait_current_trans.start_transaction.btrfs_attach_transaction_barrier.btrf=
s_sync_file
      0.06 =B1  3%     -44.4%       0.03 =B1 25%  perf-sched.wait_time.avg.=
ms.wait_log_commit.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
      1.17 =B1  4%    +381.5%       5.62 =B1  4%  perf-sched.wait_time.avg.=
ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.79 =B1 24%     -75.6%       0.44 =B1 47%  perf-sched.wait_time.max.=
ms.__cond_resched.__wait_for_common.barrier_all_devices.write_all_supers.bt=
rfs_sync_log
      0.19 =B1149%   +1796.9%       3.62 =B1 54%  perf-sched.wait_time.max.=
ms.__cond_resched.down_write.btrfs_tree_lock_nested.btrfs_search_slot.btrfs=
_lookup_csum
      0.04 =B1132%  +22425.6%       9.84 =B1139%  perf-sched.wait_time.max.=
ms.__cond_resched.kmem_cache_alloc_noprof.add_delayed_ref.btrfs_drop_extent=
s.insert_reserved_file_extent
      1.04 =B1 47%   +4402.5%      46.83 =B1 57%  perf-sched.wait_time.max.=
ms.__cond_resched.kmem_cache_alloc_noprof.alloc_extent_state.__set_extent_b=
it.lock_extent
      0.84 =B1 53%     -99.3%       0.01 =B1223%  perf-sched.wait_time.max.=
ms.__cond_resched.submit_bio_noacct.btrfs_submit_chunk.btrfs_submit_bio.sub=
mit_eb_page
    281.64 =B1 99%    -100.0%       0.00        perf-sched.wait_time.max.ms=
.btrfs_commit_transaction.btrfs_sync_file.__x64_sys_fsync.do_syscall_64
      0.06 =B1 16%    -100.0%       0.00        perf-sched.wait_time.max.ms=
.btrfs_start_ordered_extent.btrfs_wait_ordered_range.btrfs_sync_file.__x64_=
sys_fsync
      1019 =B1  4%     +46.3%       1492 =B1 31%  perf-sched.wait_time.max.=
ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
     49.01 =B1107%     -83.8%       7.96 =B1128%  perf-sched.wait_time.max.=
ms.io_schedule.folio_wait_bit_common.folio_wait_writeback.__filemap_fdatawa=
it_range
      1.67 =B1 64%     -69.6%       0.51 =B1 49%  perf-sched.wait_time.max.=
ms.io_schedule.folio_wait_bit_common.write_all_supers.btrfs_sync_log
    333.41 =B1141%    -100.0%       0.03 =B1146%  perf-sched.wait_time.max.=
ms.irqentry_exit_to_user_mode.asm_common_interrupt.[unknown].[unknown]
      2.02 =B1 88%    -100.0%       0.00        perf-sched.wait_time.max.ms=
.schedule_preempt_disabled.__mutex_lock.constprop.0.wait_log_commit
      1321 =B1 55%     -77.3%     300.06 =B1 35%  perf-sched.wait_time.max.=
ms.schedule_preempt_disabled.rwsem_down_read_slowpath.down_read.btrfs_tree_=
read_lock_nested
    533.71 =B1 48%     -71.8%     150.40 =B1 48%  perf-sched.wait_time.max.=
ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.btrfs_tre=
e_lock_nested
      1.47 =B1  5%     -24.6%       1.11 =B1  5%  perf-sched.wait_time.max.=
ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.14 =B1 45%     -43.7%       0.64 =B1  9%  perf-sched.wait_time.max.=
ms.schedule_timeout.io_schedule_timeout.__wait_for_common.barrier_all_devic=
es
    532.05 =B1 88%     -99.8%       1.28 =B1163%  perf-sched.wait_time.max.=
ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[=
unknown]
      0.07 =B1174%    -100.0%       0.00        perf-sched.wait_time.max.ms=
.wait_current_trans.start_transaction.btrfs_attach_transaction_barrier.btrf=
s_sync_file
      2.02 =B1 17%    +345.2%       9.00 =B1129%  perf-sched.wait_time.max.=
ms.wait_log_commit.btrfs_sync_log.btrfs_sync_file.__x64_sys_fsync
      1437 =B1 27%     -31.3%     988.14 =B1  5%  perf-sched.wait_time.max.=
ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm



***************************************************************************=
************************
lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz=
 (Cascade Lake) with 512G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_gr=
oup/test/testcase/thread_nr:
  gcc-13/performance/directio/1SSD/btrfs/x86_64-rhel-8.3/ssd/debian-11.1-x8=
6_64-20220510.cgz/lkp-csl-2sp7/MWUM/fxmark/4

commit: =

  1122c0c1cc ("block: move cache control settings out of queue->flags")
  bd4a633b6f ("block: move the nonrot flag to queue_limits")

1122c0c1cc71f740 bd4a633b6f7c3c6b6ebc1a07317 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 2.176e+09           +11.4%  2.423e+09 =B1  3%  cpuidle..time
    132.33 =B1 20%     -36.4%      84.17 =B1 10%  perf-c2c.HITM.local
    291.11           +31.8%     383.72 =B1  5%  uptime.boot
     56.19            +7.6%      60.45        iostat.cpu.idle
     18.23           -27.6%      13.19 =B1  6%  iostat.cpu.iowait
     25.05            +3.4%      25.89        iostat.cpu.system
   2507993           -14.9%    2134516        meminfo.Active
   2144083           -18.4%    1750586 =B1  2%  meminfo.Active(file)
     77605           -25.4%      57872 =B1  5%  meminfo.Dirty
     18.37            -5.1       13.27 =B1  6%  mpstat.cpu.all.iowait%
      0.84            -0.1        0.70 =B1  4%  mpstat.cpu.all.irq%
      1.16            -0.3        0.90 =B1  6%  mpstat.cpu.all.soft%
    297906           -18.3%     243394 =B1  5%  vmstat.io.bo
      0.89 =B1  3%     -29.8%       0.63 =B1  9%  vmstat.procs.b
     47364           -21.4%      37209 =B1  5%  vmstat.system.cs
     12792           -18.5%      10428 =B1  3%  vmstat.system.in
      2.47 =B1 13%     -30.3%       1.72 =B1 40%  perf-sched.sch_delay.max.=
ms.__cond_resched.btrfs_alloc_path.btrfs_async_run_delayed_root.btrfs_work_=
helper.process_one_work
      1184 =B1 25%     +26.6%       1499 =B1 31%  perf-sched.wait_and_delay=
.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.68 =B1217%   +6285.5%      43.38 =B1121%  perf-sched.wait_time.avg.=
ms.schedule_preempt_disabled.__mutex_lock.constprop.0.workqueue_set_max_act=
ive
      1.34 =B1220%   +5568.8%      75.81 =B1138%  perf-sched.wait_time.max.=
ms.schedule_preempt_disabled.__mutex_lock.constprop.0.workqueue_set_max_act=
ive
      1183 =B1 25%     +26.6%       1498 =B1 31%  perf-sched.wait_time.max.=
ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.80            -0.2        1.61        turbostat.Busy%
      2952            +3.5%       3055        turbostat.Bzy_MHz
      0.60            -0.1        0.48 =B1  6%  turbostat.C1%
      1.98            -0.2        1.80 =B1  4%  turbostat.C1E%
   1175575           +13.6%    1335284 =B1  5%  turbostat.C6
      6.37            -1.4        5.01 =B1  3%  turbostat.C6%
     11.16           -10.5%       9.99        turbostat.CPU%c1
      0.31           +12.8%       0.35        turbostat.IPC
   3186943           +11.3%    3548214 =B1  2%  turbostat.IRQ
   2505849           -14.8%    2134079        numa-meminfo.node0.Active
   2142339           -18.3%    1750535 =B1  2%  numa-meminfo.node0.Active(f=
ile)
     72152 =B1  4%     -25.9%      53438 =B1  5%  numa-meminfo.node0.Dirty
   5805800 =B1 13%     -36.0%    3718257 =B1 24%  numa-meminfo.node0.FilePa=
ges
   9182123 =B1  8%     -20.8%    7276407 =B1 12%  numa-meminfo.node0.MemUsed
   2447576 =B1 33%     -70.1%     731851 =B1123%  numa-meminfo.node0.Unevic=
table
     15180 =B1 80%    +197.2%      45112 =B1 40%  numa-meminfo.node1.KRecla=
imable
      3231 =B1172%    +524.0%      20162 =B1 58%  numa-meminfo.node1.Mapped
     15180 =B1 80%    +197.2%      45112 =B1 40%  numa-meminfo.node1.SRecla=
imable
    444470 =B1182%    +386.0%    2160224 =B1 41%  numa-meminfo.node1.Unevic=
table
    535497           -18.3%     437654 =B1  2%  numa-vmstat.node0.nr_active=
_file
  18593647           +11.3%   20701921 =B1  2%  numa-vmstat.node0.nr_dirtied
     18026 =B1  4%     -25.9%      13355 =B1  5%  numa-vmstat.node0.nr_dirty
   1451371 =B1 13%     -36.0%     929593 =B1 24%  numa-vmstat.node0.nr_file=
_pages
    611894 =B1 33%     -70.1%     182962 =B1123%  numa-vmstat.node0.nr_unev=
ictable
  18583823           +11.3%   20690513 =B1  2%  numa-vmstat.node0.nr_written
    535497           -18.3%     437654 =B1  2%  numa-vmstat.node0.nr_zone_a=
ctive_file
    611894 =B1 33%     -70.1%     182962 =B1123%  numa-vmstat.node0.nr_zone=
_unevictable
     18182 =B1  5%     -26.1%      13429 =B1  5%  numa-vmstat.node0.nr_zone=
_write_pending
    807.93 =B1172%    +524.4%       5044 =B1 58%  numa-vmstat.node1.nr_mapp=
ed
      3795 =B1 80%    +197.2%      11277 =B1 40%  numa-vmstat.node1.nr_slab=
_reclaimable
    111117 =B1182%    +386.0%     540056 =B1 41%  numa-vmstat.node1.nr_unev=
ictable
    111117 =B1182%    +386.0%     540056 =B1 41%  numa-vmstat.node1.nr_zone=
_unevictable
    107.60           +11.1%     119.54 =B1  2%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.idle_sec
     54.11           +10.7%      59.91 =B1  2%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.idle_util
     45.57           -31.6%      31.18 =B1 12%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.iowait_sec
     22.92           -31.8%      15.63 =B1 12%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.iowait_util
      1.76           -22.1%       1.37 =B1  8%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.irq_sec
      0.89           -22.4%       0.69 =B1  8%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.irq_util
      2.62           -27.4%       1.90 =B1 10%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.softirq_sec
      1.32           -27.7%       0.95 =B1 10%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.softirq_util
     40.98           +10.3%      45.20 =B1  3%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.sys_sec
     20.61            +9.9%      22.65 =B1  3%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.sys_util
      1373           -45.7%     745.50 =B1  9%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.works
     27.39           -45.9%      14.82 =B1  9%  fxmark.ssd_btrfs_MWUM_4_dir=
ectio.works/sec
    250.17           +37.0%     342.71 =B1  5%  fxmark.time.elapsed_time
    250.17           +37.0%     342.71 =B1  5%  fxmark.time.elapsed_time.max
   4153888           -19.1%    3360997        fxmark.time.file_system_outpu=
ts
      8.50 =B1  5%     -29.4%       6.00        fxmark.time.percent_of_cpu_=
this_job_got
     59437 =B1 10%     +34.9%      80200 =B1  8%  sched_debug.cfs_rq:/.avg_=
vruntime.avg
     77362 =B1 12%     +28.6%      99496 =B1  9%  sched_debug.cfs_rq:/.avg_=
vruntime.max
     49777 =B1 14%     +41.4%      70377 =B1 10%  sched_debug.cfs_rq:/.avg_=
vruntime.min
     59437 =B1 10%     +34.9%      80200 =B1  8%  sched_debug.cfs_rq:/.min_=
vruntime.avg
     77362 =B1 12%     +28.6%      99496 =B1  9%  sched_debug.cfs_rq:/.min_=
vruntime.max
     49777 =B1 14%     +41.4%      70377 =B1 10%  sched_debug.cfs_rq:/.min_=
vruntime.min
     70.10 =B1 28%     +69.8%     119.03 =B1 24%  sched_debug.cfs_rq:/.util=
_est.avg
    387.03 =B1 19%     +36.5%     528.40 =B1 18%  sched_debug.cfs_rq:/.util=
_est.max
    111.66 =B1 27%     +63.4%     182.43 =B1 23%  sched_debug.cfs_rq:/.util=
_est.stddev
    159901           +21.8%     194738 =B1  5%  sched_debug.cpu.clock.avg
    159904           +21.8%     194739 =B1  5%  sched_debug.cpu.clock.max
    159899           +21.8%     194736 =B1  5%  sched_debug.cpu.clock.min
    156754           +22.0%     191297 =B1  5%  sched_debug.cpu.clock_task.=
avg
    159016           +21.8%     193608 =B1  5%  sched_debug.cpu.clock_task.=
max
    151859           +23.0%     186807 =B1  5%  sched_debug.cpu.clock_task.=
min
    571773 =B1  2%      -9.3%     518561 =B1  3%  sched_debug.cpu.max_idle_=
balance_cost.max
      8586 =B1 10%     -76.2%       2040 =B1 87%  sched_debug.cpu.max_idle_=
balance_cost.stddev
      1547 =B1  7%     +39.1%       2152 =B1 12%  sched_debug.cpu.nr_uninte=
rruptible.max
     -3680           +35.1%      -4971        sched_debug.cpu.nr_uninterrup=
tible.min
      2008 =B1 13%     +44.5%       2902 =B1 13%  sched_debug.cpu.nr_uninte=
rruptible.stddev
    159901           +21.8%     194737 =B1  5%  sched_debug.cpu_clk
    159291           +21.9%     194110 =B1  5%  sched_debug.ktime
    160432           +21.7%     195278 =B1  5%  sched_debug.sched_clk
     90977            +5.5%      95982        proc-vmstat.nr_active_anon
    535809           -18.3%     437696 =B1  2%  proc-vmstat.nr_active_file
     80075            -3.3%      77402        proc-vmstat.nr_anon_pages
  18810399 =B1  2%     +11.4%   20960968 =B1  2%  proc-vmstat.nr_dirtied
     19409           -25.5%      14469 =B1  5%  proc-vmstat.nr_dirty
   1570377            -6.0%    1476623        proc-vmstat.nr_file_pages
     82770            -3.8%      79660        proc-vmstat.nr_inactive_anon
     18954            -1.0%      18765        proc-vmstat.nr_kernel_stack
      9590            -2.2%       9375        proc-vmstat.nr_mapped
     95937            +4.8%     100509        proc-vmstat.nr_shmem
  18800573 =B1  2%     +11.4%   20949542 =B1  2%  proc-vmstat.nr_written
     90977            +5.5%      95982        proc-vmstat.nr_zone_active_an=
on
    535809           -18.3%     437696 =B1  2%  proc-vmstat.nr_zone_active_=
file
     82770            -3.8%      79660        proc-vmstat.nr_zone_inactive_=
anon
     19688 =B1  2%     -25.3%      14712 =B1  5%  proc-vmstat.nr_zone_write=
_pending
      7670 =B1 50%     +96.4%      15061 =B1 26%  proc-vmstat.numa_hint_fau=
lts
      3803 =B1 88%    +157.4%       9788 =B1 21%  proc-vmstat.numa_hint_fau=
lts_local
  10950682 =B1  2%      +6.6%   11668450 =B1  2%  proc-vmstat.numa_hit
  10849707 =B1  2%      +6.6%   11566304 =B1  2%  proc-vmstat.numa_local
   1356796           +32.4%    1796173        proc-vmstat.pgactivate
  11864099            +5.9%   12565956 =B1  2%  proc-vmstat.pgalloc_normal
    791491           +24.6%     986144 =B1  4%  proc-vmstat.pgfault
  11653607            +6.8%   12444134 =B1  2%  proc-vmstat.pgfree
  75424328 =B1  2%     +11.4%   84002300 =B1  2%  proc-vmstat.pgpgout
     42955           +22.0%      52397 =B1  3%  proc-vmstat.pgreuse
  40751111 =B1  2%     -28.4%   29162586 =B1  8%  perf-stat.i.branch-instru=
ctions
      0.16 =B1  3%      -0.0        0.12 =B1  5%  perf-stat.i.branch-miss-r=
ate%
   1966173 =B1  3%     -28.9%    1398795 =B1  8%  perf-stat.i.branch-misses
      0.56 =B1  5%      -0.1        0.41 =B1  5%  perf-stat.i.cache-miss-ra=
te%
    338469 =B1  4%     -26.6%     248405 =B1  6%  perf-stat.i.cache-misses
   1788163 =B1  4%     -26.4%    1315825 =B1  7%  perf-stat.i.cache-referen=
ces
     47778           -21.6%      37457 =B1  5%  perf-stat.i.context-switches
      0.04           -25.2%       0.03 =B1  8%  perf-stat.i.cpi
      8075           -13.9%       6951 =B1  2%  perf-stat.i.cpu-clock
 2.255e+08           -28.1%  1.622e+08 =B1  7%  perf-stat.i.cpu-cycles
      2754           -11.1%       2447 =B1  7%  perf-stat.i.cpu-migrations
     45.89 =B1  3%     -31.3%      31.53 =B1  7%  perf-stat.i.cycles-betwee=
n-cache-misses
      0.01 =B1  4%      -0.0        0.00 =B1 13%  perf-stat.i.dTLB-load-mis=
s-rate%
     62240 =B1  7%     -26.9%      45496 =B1  9%  perf-stat.i.dTLB-load-mis=
ses
  44048882 =B1  2%     -28.0%   31716199 =B1  8%  perf-stat.i.dTLB-loads
      0.00 =B1  4%      -0.0        0.00 =B1 13%  perf-stat.i.dTLB-store-mi=
ss-rate%
      7368 =B1  7%     -27.7%       5326 =B1  9%  perf-stat.i.dTLB-store-mi=
sses
  15972047 =B1  2%     -27.8%   11527820 =B1  8%  perf-stat.i.dTLB-stores
      1.71            -0.4        1.27 =B1  6%  perf-stat.i.iTLB-load-miss-=
rate%
     22267           -24.7%      16768 =B1  6%  perf-stat.i.iTLB-load-misses
     19977 =B1  4%     -27.0%      14589 =B1  5%  perf-stat.i.iTLB-loads
 2.026e+08 =B1  2%     -28.4%  1.451e+08 =B1  9%  perf-stat.i.instructions
    286.78 =B1  3%     -30.7%     198.87 =B1  8%  perf-stat.i.instructions-=
per-iTLB-miss
      0.03 =B1  3%     -27.5%       0.02 =B1  6%  perf-stat.i.ipc
      0.18 =B1 43%     +96.5%       0.35 =B1 31%  perf-stat.i.major-faults
      0.00           -28.0%       0.00 =B1  7%  perf-stat.i.metric.GHz
     31.38 =B1  4%     -24.9%      23.56 =B1  6%  perf-stat.i.metric.K/sec
      1.04 =B1  2%     -28.1%       0.75 =B1  8%  perf-stat.i.metric.M/sec
      2330            -3.1%       2257        perf-stat.i.minor-faults
      1.87 =B1 15%      -0.6        1.24 =B1 15%  perf-stat.i.node-load-mis=
s-rate%
     32809 =B1  8%     -24.0%      24936 =B1 12%  perf-stat.i.node-loads
      1.60 =B1  8%      -0.4        1.17 =B1 15%  perf-stat.i.node-store-mi=
ss-rate%
     42947 =B1  3%     -26.9%      31405 =B1  6%  perf-stat.i.node-stores
      2330            -3.1%       2258        perf-stat.i.page-faults
      8075           -13.9%       6951 =B1  2%  perf-stat.i.task-clock
  41085549 =B1  2%     -28.6%   29351633 =B1  9%  perf-stat.ps.branch-instr=
uctions
   1980226 =B1  3%     -28.9%    1407007 =B1  8%  perf-stat.ps.branch-misses
    341317 =B1  4%     -26.7%     250339 =B1  6%  perf-stat.ps.cache-misses
   1802785 =B1  4%     -26.5%    1324804 =B1  7%  perf-stat.ps.cache-refere=
nces
     47554           -21.5%      37337 =B1  5%  perf-stat.ps.context-switch=
es
      8089           -14.0%       6956 =B1  2%  perf-stat.ps.cpu-clock
 2.274e+08           -28.2%  1.633e+08 =B1  7%  perf-stat.ps.cpu-cycles
      2740           -11.0%       2438 =B1  7%  perf-stat.ps.cpu-migrations
     62712 =B1  7%     -27.0%      45790 =B1  9%  perf-stat.ps.dTLB-load-mi=
sses
  44441011 =B1  2%     -28.1%   31931957 =B1  8%  perf-stat.ps.dTLB-loads
      7430 =B1  6%     -27.8%       5362 =B1  9%  perf-stat.ps.dTLB-store-m=
isses
  16118579 =B1  2%     -28.0%   11611258 =B1  8%  perf-stat.ps.dTLB-stores
     22459 =B1  2%     -24.8%      16880 =B1  6%  perf-stat.ps.iTLB-load-mi=
sses
     20158 =B1  5%     -27.1%      14693 =B1  5%  perf-stat.ps.iTLB-loads
 2.042e+08 =B1  2%     -28.5%  1.461e+08 =B1  9%  perf-stat.ps.instructions
      0.18 =B1 43%     +96.8%       0.35 =B1 31%  perf-stat.ps.major-faults
      2321            -3.0%       2251        perf-stat.ps.minor-faults
     32976 =B1  8%     -23.8%      25135 =B1 12%  perf-stat.ps.node-loads
     43093 =B1  3%     -26.7%      31604 =B1  5%  perf-stat.ps.node-stores
      2321            -3.0%       2252        perf-stat.ps.page-faults
      8089           -14.0%       6956 =B1  2%  perf-stat.ps.task-clock
     29.41 =B1  2%     -16.0       13.44 =B1 45%  perf-profile.calltrace.cy=
cles-pp.loop_process_work.process_one_work.worker_thread.kthread.ret_from_f=
ork
     19.06 =B1  3%     -11.3        7.73 =B1 45%  perf-profile.calltrace.cy=
cles-pp.btrfs_sync_file.loop_process_work.process_one_work.worker_thread.kt=
hread
     24.03 =B1  3%     -10.6       13.47 =B1  6%  perf-profile.calltrace.cy=
cles-pp.btree_write_cache_pages.do_writepages.filemap_fdatawrite_wbc.__file=
map_fdatawrite_range.btrfs_write_marked_extents
     23.72 =B1  3%     -10.5       13.24 =B1  6%  perf-profile.calltrace.cy=
cles-pp.submit_eb_page.btree_write_cache_pages.do_writepages.filemap_fdataw=
rite_wbc.__filemap_fdatawrite_range
     22.11 =B1  3%      -9.7       12.38 =B1  6%  perf-profile.calltrace.cy=
cles-pp.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_page.btree_write_cach=
e_pages.do_writepages
     22.11 =B1  3%      -9.7       12.38 =B1  6%  perf-profile.calltrace.cy=
cles-pp.btrfs_submit_bio.submit_eb_page.btree_write_cache_pages.do_writepag=
es.filemap_fdatawrite_wbc
     21.55 =B1  3%      -9.5       12.08 =B1  6%  perf-profile.calltrace.cy=
cles-pp.btree_csum_one_bio.btrfs_submit_chunk.btrfs_submit_bio.submit_eb_pa=
ge.btree_write_cache_pages
     20.06 =B1  3%      -8.9       11.16 =B1  4%  perf-profile.calltrace.cy=
cles-pp.btrfs_check_leaf.btree_csum_one_bio.btrfs_submit_chunk.btrfs_submit=
_bio.submit_eb_page
     19.94 =B1  3%      -8.8       11.09 =B1  5%  perf-profile.calltrace.cy=
cles-pp.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_bio.btrfs_submit=
_chunk.btrfs_submit_bio
     19.56 =B1  4%      -7.0       12.60 =B1  7%  perf-profile.calltrace.cy=
cles-pp.btrfs_write_and_wait_transaction.btrfs_commit_transaction.flush_spa=
ce.btrfs_async_reclaim_metadata_space.process_one_work
     19.18 =B1  4%      -6.9       12.32 =B1  7%  perf-profile.calltrace.cy=
cles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_write_a=
nd_wait_transaction.btrfs_commit_transaction.flush_space
     19.32 =B1  4%      -6.9       12.46 =B1  7%  perf-profile.calltrace.cy=
cles-pp.btrfs_write_marked_extents.btrfs_write_and_wait_transaction.btrfs_c=
ommit_transaction.flush_space.btrfs_async_reclaim_metadata_space
     19.16 =B1  4%      -6.8       12.32 =B1  7%  perf-profile.calltrace.cy=
cles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_write_marke=
d_extents.btrfs_write_and_wait_transaction.btrfs_commit_transaction
     19.13 =B1  4%      -6.8       12.30 =B1  7%  perf-profile.calltrace.cy=
cles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btr=
fs_write_marked_extents.btrfs_write_and_wait_transaction
     12.86 =B1  4%      -5.9        6.99 =B1  4%  perf-profile.calltrace.cy=
cles-pp.check_leaf_item.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_=
bio.btrfs_submit_chunk
     13.52 =B1  7%      -5.0        8.56 =B1  8%  perf-profile.calltrace.cy=
cles-pp.common_startup_64
     10.90 =B1 12%      -4.7        6.19 =B1 12%  perf-profile.calltrace.cy=
cles-pp.cpu_startup_entry.start_secondary.common_startup_64
     10.90 =B1 12%      -4.7        6.20 =B1 12%  perf-profile.calltrace.cy=
cles-pp.start_secondary.common_startup_64
     10.89 =B1 12%      -4.7        6.19 =B1 12%  perf-profile.calltrace.cy=
cles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     10.15 =B1  3%      -4.6        5.60 =B1 45%  perf-profile.calltrace.cy=
cles-pp.lo_write_simple.loop_process_work.process_one_work.worker_thread.kt=
hread
      9.98 =B1  3%      -4.5        5.52 =B1 45%  perf-profile.calltrace.cy=
cles-pp.vfs_iter_write.lo_write_simple.loop_process_work.process_one_work.w=
orker_thread
      9.86 =B1  3%      -4.4        5.46 =B1 44%  perf-profile.calltrace.cy=
cles-pp.do_iter_readv_writev.vfs_iter_write.lo_write_simple.loop_process_wo=
rk.process_one_work
      9.79 =B1  3%      -4.4        5.43 =B1 44%  perf-profile.calltrace.cy=
cles-pp.btrfs_do_write_iter.do_iter_readv_writev.vfs_iter_write.lo_write_si=
mple.loop_process_work
      9.70 =B1  3%      -4.3        5.36 =B1 44%  perf-profile.calltrace.cy=
cles-pp.btrfs_buffered_write.btrfs_do_write_iter.do_iter_readv_writev.vfs_i=
ter_write.lo_write_simple
      9.84 =B1 12%      -4.2        5.62 =B1 13%  perf-profile.calltrace.cy=
cles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_=
startup_64
      5.35 =B1  4%      -4.2        1.17 =B1 45%  perf-profile.calltrace.cy=
cles-pp.btrfs_sync_log.btrfs_sync_file.loop_process_work.process_one_work.w=
orker_thread
     11.34 =B1  8%      -4.2        7.19 =B1 11%  perf-profile.calltrace.cy=
cles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_sta=
rtup_entry
      9.33 =B1 12%      -4.0        5.36 =B1 13%  perf-profile.calltrace.cy=
cles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_sec=
ondary
      4.93 =B1  4%      -3.9        1.00 =B1 44%  perf-profile.calltrace.cy=
cles-pp.btrfs_write_marked_extents.btrfs_sync_log.btrfs_sync_file.loop_proc=
ess_work.process_one_work
      4.92 =B1  4%      -3.9        1.00 =B1 44%  perf-profile.calltrace.cy=
cles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_sync_lo=
g.btrfs_sync_file.loop_process_work
     12.68 =B1  5%      -3.7        8.94 =B1  7%  perf-profile.calltrace.cy=
cles-pp.btrfs_work_helper.process_one_work.worker_thread.kthread.ret_from_f=
ork
      4.92 =B1  4%      -3.7        1.18 =B1  4%  perf-profile.calltrace.cy=
cles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btrfs_write_marke=
d_extents.btrfs_sync_log.btrfs_sync_file
      4.91 =B1  3%      -3.7        1.18 =B1  4%  perf-profile.calltrace.cy=
cles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btr=
fs_write_marked_extents.btrfs_sync_log
     12.65 =B1  5%      -3.7        8.92 =B1  7%  perf-profile.calltrace.cy=
cles-pp.btrfs_finish_one_ordered.btrfs_work_helper.process_one_work.worker_=
thread.kthread
      7.36 =B1  4%      -3.6        3.74 =B1 46%  perf-profile.calltrace.cy=
cles-pp.start_ordered_ops.btrfs_sync_file.loop_process_work.process_one_wor=
k.worker_thread
      6.28 =B1  5%      -3.6        2.66 =B1 45%  perf-profile.calltrace.cy=
cles-pp.btrfs_log_dentry_safe.btrfs_sync_file.loop_process_work.process_one=
_work.worker_thread
      6.27 =B1  5%      -3.6        2.66 =B1 45%  perf-profile.calltrace.cy=
cles-pp.btrfs_log_inode_parent.btrfs_log_dentry_safe.btrfs_sync_file.loop_p=
rocess_work.process_one_work
      6.27 =B1  5%      -3.6        2.66 =B1 45%  perf-profile.calltrace.cy=
cles-pp.btrfs_log_inode.btrfs_log_inode_parent.btrfs_log_dentry_safe.btrfs_=
sync_file.loop_process_work
      7.27 =B1  4%      -3.5        3.72 =B1 46%  perf-profile.calltrace.cy=
cles-pp.__filemap_fdatawrite_range.start_ordered_ops.btrfs_sync_file.loop_p=
rocess_work.process_one_work
      7.27 =B1  4%      -3.5        3.72 =B1 46%  perf-profile.calltrace.cy=
cles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.start_ordered_ops=
.btrfs_sync_file.loop_process_work
      8.76 =B1  4%      -3.3        5.44 =B1  4%  perf-profile.calltrace.cy=
cles-pp.check_extent_item.check_leaf_item.__btrfs_check_leaf.btrfs_check_le=
af.btree_csum_one_bio
      8.24 =B1  4%      -3.3        4.92 =B1 14%  perf-profile.calltrace.cy=
cles-pp.extent_write_cache_pages.btrfs_writepages.do_writepages.filemap_fda=
tawrite_wbc.__filemap_fdatawrite_range
      7.38 =B1  4%      -3.1        4.27 =B1 17%  perf-profile.calltrace.cy=
cles-pp.__extent_writepage.extent_write_cache_pages.btrfs_writepages.do_wri=
tepages.filemap_fdatawrite_wbc
      7.27 =B1  4%      -3.0        4.26 =B1 15%  perf-profile.calltrace.cy=
cles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.sta=
rt_ordered_ops.btrfs_sync_file
      7.26 =B1  4%      -3.0        4.26 =B1 15%  perf-profile.calltrace.cy=
cles-pp.btrfs_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fda=
tawrite_range.start_ordered_ops
      6.00 =B1  4%      -3.0        3.04 =B1  6%  perf-profile.calltrace.cy=
cles-pp.btrfs_log_changed_extents.btrfs_log_inode.btrfs_log_inode_parent.bt=
rfs_log_dentry_safe.btrfs_sync_file
      5.81 =B1  5%      -2.9        2.89 =B1  6%  perf-profile.calltrace.cy=
cles-pp.log_one_extent.btrfs_log_changed_extents.btrfs_log_inode.btrfs_log_=
inode_parent.btrfs_log_dentry_safe
      4.50 =B1  9%      -2.7        1.82 =B1 11%  perf-profile.calltrace.cy=
cles-pp.alloc_reserved_tree_block.run_delayed_tree_ref.btrfs_run_delayed_re=
fs_for_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs
      4.30 =B1 10%      -2.7        1.65 =B1 19%  perf-profile.calltrace.cy=
cles-pp.btrfs_insert_empty_items.alloc_reserved_tree_block.run_delayed_tree=
_ref.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs
      6.97 =B1  6%      -2.6        4.39 =B1  8%  perf-profile.calltrace.cy=
cles-pp.btrfs_start_dirty_block_groups.btrfs_commit_transaction.flush_space=
.btrfs_async_reclaim_metadata_space.process_one_work
      2.75 =B1 10%      -2.3        0.41 =B1 71%  perf-profile.calltrace.cy=
cles-pp.btrfs_search_slot.btrfs_insert_empty_items.alloc_reserved_tree_bloc=
k.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head
      8.18 =B1  7%      -2.0        6.14 =B1  9%  perf-profile.calltrace.cy=
cles-pp.insert_reserved_file_extent.btrfs_finish_one_ordered.btrfs_work_hel=
per.process_one_work.worker_thread
      2.48 =B1  7%      -2.0        0.49 =B1 45%  perf-profile.calltrace.cy=
cles-pp.check_extent_data_item.check_leaf_item.__btrfs_check_leaf.btrfs_che=
ck_leaf.btree_csum_one_bio
      4.26 =B1  9%      -1.9        2.37 =B1 10%  perf-profile.calltrace.cy=
cles-pp.btrfs_run_delayed_refs.btrfs_commit_transaction.flush_space.btrfs_a=
sync_reclaim_metadata_space.process_one_work
      4.24 =B1  9%      -1.9        2.36 =B1 10%  perf-profile.calltrace.cy=
cles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transa=
ction.flush_space.btrfs_async_reclaim_metadata_space
      4.10 =B1  9%      -1.8        2.29 =B1 11%  perf-profile.calltrace.cy=
cles-pp.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_=
delayed_refs.btrfs_commit_transaction.flush_space
      3.72 =B1  7%      -1.7        2.00 =B1  8%  perf-profile.calltrace.cy=
cles-pp.btrfs_get_32.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_one_bio=
.btrfs_submit_chunk
      2.54 =B1  6%      -1.7        0.84 =B1 53%  perf-profile.calltrace.cy=
cles-pp.btrfs_cow_block.btrfs_search_slot.lookup_inline_extent_backref.look=
up_extent_backref.__btrfs_free_extent
      2.54 =B1  6%      -1.7        0.84 =B1 53%  perf-profile.calltrace.cy=
cles-pp.btrfs_force_cow_block.btrfs_cow_block.btrfs_search_slot.lookup_inli=
ne_extent_backref.lookup_extent_backref
      7.29 =B1  4%      -1.7        5.60 =B1  9%  perf-profile.calltrace.cy=
cles-pp.btrfs_drop_extents.insert_reserved_file_extent.btrfs_finish_one_ord=
ered.btrfs_work_helper.process_one_work
      3.75 =B1  7%      -1.6        2.12 =B1 28%  perf-profile.calltrace.cy=
cles-pp.__extent_writepage_io.__extent_writepage.extent_write_cache_pages.b=
trfs_writepages.do_writepages
      3.30 =B1  5%      -1.6        1.74 =B1  4%  perf-profile.calltrace.cy=
cles-pp.btrfs_drop_extents.log_one_extent.btrfs_log_changed_extents.btrfs_l=
og_inode.btrfs_log_inode_parent
      3.61 =B1  5%      -1.4        2.21 =B1  3%  perf-profile.calltrace.cy=
cles-pp.btrfs_get_64.check_extent_item.check_leaf_item.__btrfs_check_leaf.b=
trfs_check_leaf
      3.09 =B1 11%      -1.4        1.74 =B1 28%  perf-profile.calltrace.cy=
cles-pp.lookup_extent_backref.__btrfs_free_extent.btrfs_run_delayed_refs_fo=
r_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs
      3.08 =B1 11%      -1.4        1.73 =B1 28%  perf-profile.calltrace.cy=
cles-pp.lookup_inline_extent_backref.lookup_extent_backref.__btrfs_free_ext=
ent.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs
      2.91 =B1  6%      -1.3        1.60 =B1 30%  perf-profile.calltrace.cy=
cles-pp.btrfs_search_slot.lookup_inline_extent_backref.lookup_extent_backre=
f.__btrfs_free_extent.btrfs_run_delayed_refs_for_head
      2.40 =B1 11%      -1.3        1.09 =B1  9%  perf-profile.calltrace.cy=
cles-pp.log_extent_csums.log_one_extent.btrfs_log_changed_extents.btrfs_log=
_inode.btrfs_log_inode_parent
      1.83 =B1 17%      -1.3        0.53 =B1 73%  perf-profile.calltrace.cy=
cles-pp.asm_common_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle=
_call.do_idle
      1.82 =B1 18%      -1.3        0.53 =B1 73%  perf-profile.calltrace.cy=
cles-pp.common_interrupt.asm_common_interrupt.cpuidle_enter_state.cpuidle_e=
nter.cpuidle_idle_call
      3.32 =B1 10%      -1.3        2.07 =B1 10%  perf-profile.calltrace.cy=
cles-pp.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_=
delayed_refs.btrfs_start_dirty_block_groups.btrfs_commit_transaction
      2.45 =B1  6%      -1.2        1.20 =B1 11%  perf-profile.calltrace.cy=
cles-pp.btrfs_run_delayed_refs.flush_space.btrfs_async_reclaim_metadata_spa=
ce.process_one_work.worker_thread
      3.43 =B1 10%      -1.2        2.19 =B1 10%  perf-profile.calltrace.cy=
cles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_start_dirty_b=
lock_groups.btrfs_commit_transaction.flush_space
      2.44 =B1  6%      -1.2        1.20 =B1 11%  perf-profile.calltrace.cy=
cles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.flush_space.btrfs_a=
sync_reclaim_metadata_space.process_one_work
      3.43 =B1 10%      -1.2        2.19 =B1 10%  perf-profile.calltrace.cy=
cles-pp.btrfs_run_delayed_refs.btrfs_start_dirty_block_groups.btrfs_commit_=
transaction.flush_space.btrfs_async_reclaim_metadata_space
      1.57 =B1 30%      -1.2        0.34 =B1100%  perf-profile.calltrace.cy=
cles-pp.blk_complete_reqs.handle_softirqs.irq_exit_rcu.common_interrupt.asm=
_common_interrupt
      2.38 =B1  5%      -1.2        1.16 =B1  9%  perf-profile.calltrace.cy=
cles-pp.btrfs_run_delayed_refs_for_head.__btrfs_run_delayed_refs.btrfs_run_=
delayed_refs.flush_space.btrfs_async_reclaim_metadata_space
      1.53 =B1 30%      -1.2        0.33 =B1100%  perf-profile.calltrace.cy=
cles-pp.scsi_end_request.scsi_io_completion.blk_complete_reqs.handle_softir=
qs.irq_exit_rcu
      1.53 =B1 30%      -1.2        0.33 =B1100%  perf-profile.calltrace.cy=
cles-pp.scsi_io_completion.blk_complete_reqs.handle_softirqs.irq_exit_rcu.c=
ommon_interrupt
      2.85 =B1  2%      -1.2        1.68 =B1  8%  perf-profile.calltrace.cy=
cles-pp.writepage_delalloc.__extent_writepage.extent_write_cache_pages.btrf=
s_writepages.do_writepages
      1.41 =B1 30%      -1.1        0.31 =B1100%  perf-profile.calltrace.cy=
cles-pp.blk_update_request.scsi_end_request.scsi_io_completion.blk_complete=
_reqs.handle_softirqs
      2.54 =B1  8%      -1.0        1.52 =B1 35%  perf-profile.calltrace.cy=
cles-pp.submit_extent_page.__extent_writepage_io.__extent_writepage.extent_=
write_cache_pages.btrfs_writepages
      2.30 =B1  2%      -1.0        1.30 =B1  8%  perf-profile.calltrace.cy=
cles-pp.cow_file_range.btrfs_run_delalloc_range.writepage_delalloc.__extent=
_writepage.extent_write_cache_pages
      2.31 =B1  2%      -1.0        1.31 =B1  8%  perf-profile.calltrace.cy=
cles-pp.btrfs_run_delalloc_range.writepage_delalloc.__extent_writepage.exte=
nt_write_cache_pages.btrfs_writepages
      2.24 =B1  9%      -1.0        1.25 =B1 49%  perf-profile.calltrace.cy=
cles-pp.submit_one_bio.submit_extent_page.__extent_writepage_io.__extent_wr=
itepage.extent_write_cache_pages
      2.23 =B1  9%      -1.0        1.25 =B1 49%  perf-profile.calltrace.cy=
cles-pp.btrfs_submit_bio.submit_one_bio.submit_extent_page.__extent_writepa=
ge_io.__extent_writepage
      2.23 =B1  9%      -1.0        1.25 =B1 49%  perf-profile.calltrace.cy=
cles-pp.btrfs_submit_chunk.btrfs_submit_bio.submit_one_bio.submit_extent_pa=
ge.__extent_writepage_io
      1.86 =B1  9%      -1.0        0.90 =B1  9%  perf-profile.calltrace.cy=
cles-pp.btrfs_csum_file_blocks.log_csums.log_extent_csums.log_one_extent.bt=
rfs_log_changed_extents
      1.88 =B1  9%      -1.0        0.91 =B1  9%  perf-profile.calltrace.cy=
cles-pp.log_csums.log_extent_csums.log_one_extent.btrfs_log_changed_extents=
.btrfs_log_inode
      1.96 =B1 11%      -1.0        1.00 =B1  9%  perf-profile.calltrace.cy=
cles-pp.__btrfs_free_extent.btrfs_run_delayed_refs_for_head.__btrfs_run_del=
ayed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction
      1.28 =B1 18%      -0.9        0.34 =B1100%  perf-profile.calltrace.cy=
cles-pp.handle_softirqs.irq_exit_rcu.common_interrupt.asm_common_interrupt.=
cpuidle_enter_state
      1.28 =B1 18%      -0.9        0.34 =B1100%  perf-profile.calltrace.cy=
cles-pp.irq_exit_rcu.common_interrupt.asm_common_interrupt.cpuidle_enter_st=
ate.cpuidle_enter
      5.08 =B1  7%      -0.9        4.16 =B1 12%  perf-profile.calltrace.cy=
cles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_id=
le
      2.09 =B1  4%      -0.9        1.18 =B1 15%  perf-profile.calltrace.cy=
cles-pp.btrfs_csum_file_blocks.btrfs_finish_one_ordered.btrfs_work_helper.p=
rocess_one_work.worker_thread
      1.49 =B1 12%      -0.9        0.58 =B1 47%  perf-profile.calltrace.cy=
cles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_i=
dle
      2.43 =B1  5%      -0.9        1.54 =B1 10%  perf-profile.calltrace.cy=
cles-pp.btrfs_get_32.check_extent_item.check_leaf_item.__btrfs_check_leaf.b=
trfs_check_leaf
      1.26 =B1 17%      -0.9        0.38 =B1 71%  perf-profile.calltrace.cy=
cles-pp.btrfs_create_common.lookup_open.open_last_lookups.path_openat.do_fi=
lp_open
      1.52 =B1 19%      -0.9        0.66 =B1 21%  perf-profile.calltrace.cy=
cles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.=
do_idle
      2.06 =B1 12%      -0.9        1.21 =B1 12%  perf-profile.calltrace.cy=
cles-pp.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head.__btrfs_run_de=
layed_refs.btrfs_run_delayed_refs.btrfs_commit_transaction
      1.39 =B1 15%      -0.8        0.55 =B1 47%  perf-profile.calltrace.cy=
cles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_opena=
t2
      3.06 =B1  7%      -0.8        2.24 =B1 10%  perf-profile.calltrace.cy=
cles-pp.btrfs_copy_from_user.btrfs_buffered_write.btrfs_do_write_iter.do_it=
er_readv_writev.vfs_iter_write
      3.04 =B1  7%      -0.8        2.23 =B1  9%  perf-profile.calltrace.cy=
cles-pp.copy_page_from_iter_atomic.btrfs_copy_from_user.btrfs_buffered_writ=
e.btrfs_do_write_iter.do_iter_readv_writev
      1.35 =B1 14%      -0.7        0.62 =B1 12%  perf-profile.calltrace.cy=
cles-pp.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head.__btrfs_run_de=
layed_refs.btrfs_run_delayed_refs.btrfs_start_dirty_block_groups
      2.15 =B1  7%      -0.7        1.44 =B1  6%  perf-profile.calltrace.cy=
cles-pp.btrfs_dirty_pages.btrfs_buffered_write.btrfs_do_write_iter.do_iter_=
readv_writev.vfs_iter_write
      2.09 =B1 11%      -0.7        1.39 =B1  7%  perf-profile.calltrace.cy=
cles-pp.btrfs_write_out_cache.btrfs_start_dirty_block_groups.btrfs_commit_t=
ransaction.flush_space.btrfs_async_reclaim_metadata_space
      2.06 =B1 10%      -0.7        1.37 =B1  6%  perf-profile.calltrace.cy=
cles-pp.__btrfs_write_out_cache.btrfs_write_out_cache.btrfs_start_dirty_blo=
ck_groups.btrfs_commit_transaction.flush_space
      1.75 =B1  8%      -0.7        1.08 =B1  9%  perf-profile.calltrace.cy=
cles-pp.btrfs_del_items.btrfs_drop_extents.insert_reserved_file_extent.btrf=
s_finish_one_ordered.btrfs_work_helper
      1.84 =B1  7%      -0.6        1.23 =B1 11%  perf-profile.calltrace.cy=
cles-pp.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1.10 =B1 31%      -0.6        0.49 =B1 47%  perf-profile.calltrace.cy=
cles-pp.setup_items_for_insert.btrfs_insert_empty_items.alloc_reserved_tree=
_block.run_delayed_tree_ref.btrfs_run_delayed_refs_for_head
      2.08 =B1 16%      -0.6        1.49 =B1 11%  perf-profile.calltrace.cy=
cles-pp.open64
      2.06 =B1 16%      -0.6        1.48 =B1 11%  perf-profile.calltrace.cy=
cles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.06 =B1 16%      -0.6        1.48 =B1 11%  perf-profile.calltrace.cy=
cles-pp.entry_SYSCALL_64_after_hwframe.open64
      2.04 =B1 15%      -0.6        1.47 =B1 11%  perf-profile.calltrace.cy=
cles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
      2.03 =B1 15%      -0.6        1.47 =B1 11%  perf-profile.calltrace.cy=
cles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.open64
      2.01 =B1 16%      -0.6        1.45 =B1 11%  perf-profile.calltrace.cy=
cles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
      2.01 =B1 16%      -0.6        1.45 =B1 11%  perf-profile.calltrace.cy=
cles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall=
_64
      1.22 =B1  7%      -0.5        0.67 =B1 10%  perf-profile.calltrace.cy=
cles-pp.btrfs_del_items.btrfs_drop_extents.log_one_extent.btrfs_log_changed=
_extents.btrfs_log_inode
      1.95 =B1 16%      -0.5        1.41 =B1 12%  perf-profile.calltrace.cy=
cles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys=
_openat
      1.87 =B1 17%      -0.5        1.34 =B1  8%  perf-profile.calltrace.cy=
cles-pp.__btrfs_free_extent.btrfs_run_delayed_refs_for_head.__btrfs_run_del=
ayed_refs.btrfs_run_delayed_refs.btrfs_start_dirty_block_groups
      1.63 =B1 10%      -0.5        1.10 =B1 11%  perf-profile.calltrace.cy=
cles-pp.blk_complete_reqs.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.k=
thread
      0.92 =B1 10%      -0.5        0.39 =B1 71%  perf-profile.calltrace.cy=
cles-pp.cache_save_setup.btrfs_start_dirty_block_groups.btrfs_commit_transa=
ction.flush_space.btrfs_async_reclaim_metadata_space
      0.81 =B1  9%      -0.5        0.28 =B1100%  perf-profile.calltrace.cy=
cles-pp.btrfs_comp_cpu_keys.__btrfs_check_leaf.btrfs_check_leaf.btree_csum_=
one_bio.btrfs_submit_chunk
      1.66 =B1 10%      -0.5        1.13 =B1 11%  perf-profile.calltrace.cy=
cles-pp.handle_softirqs.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fo=
rk
      1.66 =B1 10%      -0.5        1.14 =B1 11%  perf-profile.calltrace.cy=
cles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork=
_asm
      1.54 =B1  9%      -0.5        1.05 =B1 12%  perf-profile.calltrace.cy=
cles-pp.blk_mq_end_request.blk_complete_reqs.handle_softirqs.run_ksoftirqd.=
smpboot_thread_fn
      1.49 =B1 11%      -0.5        1.00 =B1 12%  perf-profile.calltrace.cy=
cles-pp.blk_update_request.blk_mq_end_request.blk_complete_reqs.handle_soft=
irqs.run_ksoftirqd
      1.10 =B1 15%      -0.4        0.66 =B1 14%  perf-profile.calltrace.cy=
cles-pp.write_one_eb.submit_eb_page.btree_write_cache_pages.do_writepages.f=
ilemap_fdatawrite_wbc
      1.06 =B1 10%      -0.4        0.62 =B1 15%  perf-profile.calltrace.cy=
cles-pp.btrfs_delalloc_reserve_metadata.btrfs_buffered_write.btrfs_do_write=
_iter.do_iter_readv_writev.vfs_iter_write
      1.24 =B1 10%      -0.4        0.84 =B1  9%  perf-profile.calltrace.cy=
cles-pp.__btrfs_free_extent.btrfs_run_delayed_refs_for_head.__btrfs_run_del=
ayed_refs.btrfs_run_delayed_refs.flush_space
      0.67 =B1 12%      -0.4        0.28 =B1100%  perf-profile.calltrace.cy=
cles-pp.btrfs_set_extent_delalloc.btrfs_dirty_pages.btrfs_buffered_write.bt=
rfs_do_write_iter.do_iter_readv_writev
      1.14 =B1 13%      -0.4        0.75 =B1  9%  perf-profile.calltrace.cy=
cles-pp.btrfs_setup_item_for_insert.btrfs_drop_extents.log_one_extent.btrfs=
_log_changed_extents.btrfs_log_inode
      1.13 =B1 13%      -0.4        0.75 =B1  9%  perf-profile.calltrace.cy=
cles-pp.setup_items_for_insert.btrfs_setup_item_for_insert.btrfs_drop_exten=
ts.log_one_extent.btrfs_log_changed_extents
      0.86 =B1 24%      -0.4        0.48 =B1 46%  perf-profile.calltrace.cy=
cles-pp.btrfs_get_8.check_extent_item.check_leaf_item.__btrfs_check_leaf.bt=
rfs_check_leaf
      1.00 =B1  9%      -0.3        0.68 =B1 21%  perf-profile.calltrace.cy=
cles-pp.btrfs_fdatawrite_range.__btrfs_write_out_cache.btrfs_write_out_cach=
e.btrfs_start_dirty_block_groups.btrfs_commit_transaction
      1.00 =B1  9%      -0.3        0.68 =B1 21%  perf-profile.calltrace.cy=
cles-pp.__filemap_fdatawrite_range.btrfs_fdatawrite_range.__btrfs_write_out=
_cache.btrfs_write_out_cache.btrfs_start_dirty_block_groups
      0.98 =B1 10%      -0.3        0.67 =B1 21%  perf-profile.calltrace.cy=
cles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.btr=
fs_fdatawrite_range.__btrfs_write_out_cache
      0.98 =B1 11%      -0.3        0.67 =B1 21%  perf-profile.calltrace.cy=
cles-pp.btrfs_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fda=
tawrite_range.btrfs_fdatawrite_range
      0.00            +0.9        0.87 =B1 12%  perf-profile.calltrace.cycl=
es-pp.btrfs_search_slot.btrfs_del_csums.cleanup_ref_head.__btrfs_run_delaye=
d_refs.btrfs_run_delayed_refs
      0.00            +1.4        1.43 =B1  7%  perf-profile.calltrace.cycl=
es-pp.btrfs_truncate_item.truncate_one_csum.btrfs_del_csums.cleanup_ref_hea=
d.__btrfs_run_delayed_refs
      0.00            +1.5        1.48 =B1  6%  perf-profile.calltrace.cycl=
es-pp.truncate_one_csum.btrfs_del_csums.cleanup_ref_head.__btrfs_run_delaye=
d_refs.btrfs_run_delayed_refs
     79.39            +1.9       81.32        perf-profile.calltrace.cycles=
-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.00            +3.2        3.16 =B1  5%  perf-profile.calltrace.cycl=
es-pp.btrfs_del_csums.cleanup_ref_head.__btrfs_run_delayed_refs.btrfs_run_d=
elayed_refs.btrfs_commit_transaction
      0.00            +3.8        3.77 =B1  6%  perf-profile.calltrace.cycl=
es-pp.cleanup_ref_head.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrf=
s_commit_transaction.transaction_kthread
      0.00            +4.3        4.32 =B1  7%  perf-profile.calltrace.cycl=
es-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_transact=
ion.transaction_kthread.kthread
      0.00            +4.3        4.32 =B1  7%  perf-profile.calltrace.cycl=
es-pp.btrfs_run_delayed_refs.btrfs_commit_transaction.transaction_kthread.k=
thread.ret_from_fork
      0.00            +5.2        5.22 =B1  8%  perf-profile.calltrace.cycl=
es-pp.btrfs_commit_transaction.transaction_kthread.kthread.ret_from_fork.re=
t_from_fork_asm
      0.00            +5.2        5.22 =B1  8%  perf-profile.calltrace.cycl=
es-pp.transaction_kthread.kthread.ret_from_fork.ret_from_fork_asm
     82.15            +6.1       88.22        perf-profile.calltrace.cycles=
-pp.kthread.ret_from_fork.ret_from_fork_asm
     82.15            +6.1       88.22        perf-profile.calltrace.cycles=
-pp.ret_from_fork.ret_from_fork_asm
     82.15            +6.1       88.22        perf-profile.calltrace.cycles=
-pp.ret_from_fork_asm
     36.06 =B1  3%     +19.8       55.84 =B1  3%  perf-profile.calltrace.cy=
cles-pp.btrfs_async_reclaim_metadata_space.process_one_work.worker_thread.k=
thread.ret_from_fork
     36.05 =B1  3%     +19.8       55.84 =B1  3%  perf-profile.calltrace.cy=
cles-pp.flush_space.btrfs_async_reclaim_metadata_space.process_one_work.wor=
ker_thread.kthread
     33.17 =B1  3%     +21.3       54.45 =B1  3%  perf-profile.calltrace.cy=
cles-pp.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadata_s=
pace.process_one_work.worker_thread
      0.09 =B1223%     +30.0       30.06 =B1  9%  perf-profile.calltrace.cy=
cles-pp._find_next_zero_bit.steal_from_bitmap.__btrfs_add_free_space.unpin_=
extent_range.btrfs_finish_extent_commit
      0.82 =B1 22%     +33.0       33.84 =B1  9%  perf-profile.calltrace.cy=
cles-pp.btrfs_finish_extent_commit.btrfs_commit_transaction.flush_space.btr=
fs_async_reclaim_metadata_space.process_one_work
      0.52 =B1 74%     +33.2       33.74 =B1  9%  perf-profile.calltrace.cy=
cles-pp.unpin_extent_range.btrfs_finish_extent_commit.btrfs_commit_transact=
ion.flush_space.btrfs_async_reclaim_metadata_space
      0.37 =B1100%     +33.3       33.66 =B1  9%  perf-profile.calltrace.cy=
cles-pp.__btrfs_add_free_space.unpin_extent_range.btrfs_finish_extent_commi=
t.btrfs_commit_transaction.flush_space
      0.29 =B1100%     +33.8       34.11 =B1  9%  perf-profile.calltrace.cy=
cles-pp.steal_from_bitmap.__btrfs_add_free_space.unpin_extent_range.btrfs_f=
inish_extent_commit.btrfs_commit_transaction
     29.41 =B1  2%     -16.0       13.44 =B1 45%  perf-profile.children.cyc=
les-pp.loop_process_work
     32.80 =B1  2%     -13.9       18.92 =B1  8%  perf-profile.children.cyc=
les-pp.__filemap_fdatawrite_range
     32.77 =B1  2%     -13.9       18.91 =B1  8%  perf-profile.children.cyc=
les-pp.filemap_fdatawrite_wbc
     32.72 =B1  2%     -13.8       18.87 =B1  8%  perf-profile.children.cyc=
les-pp.do_writepages
     24.60 =B1  2%     -10.7       13.89 =B1  9%  perf-profile.children.cyc=
les-pp.btrfs_submit_chunk
     24.60 =B1  2%     -10.7       13.90 =B1  9%  perf-profile.children.cyc=
les-pp.btrfs_submit_bio
     24.25 =B1  3%     -10.6       13.68 =B1  6%  perf-profile.children.cyc=
les-pp.btrfs_write_marked_extents
     24.03 =B1  3%     -10.5       13.50 =B1  6%  perf-profile.children.cyc=
les-pp.btree_write_cache_pages
     23.73 =B1  3%     -10.5       13.27 =B1  6%  perf-profile.children.cyc=
les-pp.submit_eb_page
     19.06 =B1  3%     -10.0        9.08 =B1  8%  perf-profile.children.cyc=
les-pp.btrfs_sync_file
     21.55 =B1  3%      -9.4       12.11 =B1  6%  perf-profile.children.cyc=
les-pp.btree_csum_one_bio
     20.06 =B1  3%      -8.9       11.19 =B1  4%  perf-profile.children.cyc=
les-pp.__btrfs_check_leaf
     20.06 =B1  3%      -8.9       11.19 =B1  4%  perf-profile.children.cyc=
les-pp.btrfs_check_leaf
     19.56 =B1  4%      -6.9       12.63 =B1  7%  perf-profile.children.cyc=
les-pp.btrfs_write_and_wait_transaction
     12.97 =B1  4%      -5.9        7.07 =B1  4%  perf-profile.children.cyc=
les-pp.check_leaf_item
     14.34 =B1  4%      -5.3        9.08 =B1  4%  perf-profile.children.cyc=
les-pp.btrfs_search_slot
     13.52 =B1  7%      -5.0        8.56 =B1  8%  perf-profile.children.cyc=
les-pp.common_startup_64
     13.52 =B1  7%      -5.0        8.56 =B1  8%  perf-profile.children.cyc=
les-pp.cpu_startup_entry
     13.51 =B1  7%      -5.0        8.56 =B1  8%  perf-profile.children.cyc=
les-pp.do_idle
      8.41 =B1  5%      -4.8        3.58 =B1 10%  perf-profile.children.cyc=
les-pp.btrfs_cow_block
      8.40 =B1  5%      -4.8        3.58 =B1 10%  perf-profile.children.cyc=
les-pp.btrfs_force_cow_block
     10.90 =B1 12%      -4.7        6.20 =B1 12%  perf-profile.children.cyc=
les-pp.start_secondary
     10.15 =B1  3%      -4.6        5.60 =B1 45%  perf-profile.children.cyc=
les-pp.lo_write_simple
     12.09 =B1  7%      -4.4        7.65 =B1 10%  perf-profile.children.cyc=
les-pp.cpuidle_idle_call
     11.44 =B1  8%      -4.2        7.27 =B1 10%  perf-profile.children.cyc=
les-pp.cpuidle_enter
     11.42 =B1  8%      -4.2        7.26 =B1 10%  perf-profile.children.cyc=
les-pp.cpuidle_enter_state
      9.96 =B1  7%      -4.1        5.88 =B1  9%  perf-profile.children.cyc=
les-pp.btrfs_run_delayed_refs_for_head
      5.35 =B1  4%      -4.0        1.40 =B1  5%  perf-profile.children.cyc=
les-pp.btrfs_sync_log
     12.68 =B1  5%      -3.7        8.94 =B1  7%  perf-profile.children.cyc=
les-pp.btrfs_work_helper
     12.65 =B1  5%      -3.7        8.92 =B1  7%  perf-profile.children.cyc=
les-pp.btrfs_finish_one_ordered
      5.14 =B1  6%      -3.5        1.65 =B1  9%  perf-profile.children.cyc=
les-pp.btrfs_alloc_tree_block
      9.08 =B1  5%      -3.4        5.67 =B1  4%  perf-profile.children.cyc=
les-pp.check_extent_item
      9.99 =B1  3%      -3.3        6.66 =B1  4%  perf-profile.children.cyc=
les-pp.vfs_iter_write
      8.67 =B1  4%      -3.3        5.36 =B1 13%  perf-profile.children.cyc=
les-pp.extent_write_cache_pages
      8.67 =B1  4%      -3.3        5.36 =B1 13%  perf-profile.children.cyc=
les-pp.btrfs_writepages
      7.59 =B1  4%      -3.3        4.28 =B1  6%  perf-profile.children.cyc=
les-pp.btrfs_get_32
      9.86 =B1  3%      -3.3        6.59 =B1  4%  perf-profile.children.cyc=
les-pp.do_iter_readv_writev
     10.64 =B1  4%      -3.2        7.39 =B1  6%  perf-profile.children.cyc=
les-pp.btrfs_drop_extents
      9.72 =B1  3%      -3.2        6.48 =B1  4%  perf-profile.children.cyc=
les-pp.btrfs_buffered_write
      9.79 =B1  3%      -3.2        6.56 =B1  4%  perf-profile.children.cyc=
les-pp.btrfs_do_write_iter
      6.28 =B1  5%      -3.1        3.18 =B1  5%  perf-profile.children.cyc=
les-pp.btrfs_log_dentry_safe
      6.27 =B1  5%      -3.1        3.18 =B1  5%  perf-profile.children.cyc=
les-pp.btrfs_log_inode_parent
      6.27 =B1  5%      -3.1        3.18 =B1  5%  perf-profile.children.cyc=
les-pp.btrfs_log_inode
      7.36 =B1  4%      -3.1        4.29 =B1 15%  perf-profile.children.cyc=
les-pp.start_ordered_ops
      6.05 =B1  9%      -3.0        3.03 =B1 10%  perf-profile.children.cyc=
les-pp.btrfs_insert_empty_items
      3.69 =B1  7%      -3.0        0.68 =B1 17%  perf-profile.children.cyc=
les-pp.btrfs_reserve_extent
      7.74 =B1  4%      -3.0        4.78 =B1 14%  perf-profile.children.cyc=
les-pp.__extent_writepage
      6.00 =B1  4%      -3.0        3.04 =B1  6%  perf-profile.children.cyc=
les-pp.btrfs_log_changed_extents
      3.57 =B1  7%      -2.9        0.62 =B1 13%  perf-profile.children.cyc=
les-pp.find_free_extent
      5.81 =B1  5%      -2.9        2.89 =B1  6%  perf-profile.children.cyc=
les-pp.log_one_extent
      6.97 =B1  6%      -2.5        4.46 =B1  8%  perf-profile.children.cyc=
les-pp.btrfs_start_dirty_block_groups
      5.24 =B1  5%      -2.5        2.75 =B1  4%  perf-profile.children.cyc=
les-pp.btrfs_get_64
      4.58 =B1  9%      -2.5        2.12 =B1  9%  perf-profile.children.cyc=
les-pp.alloc_reserved_tree_block
      4.58 =B1  9%      -2.5        2.13 =B1  9%  perf-profile.children.cyc=
les-pp.run_delayed_tree_ref
      8.27 =B1  7%      -2.1        6.20 =B1  9%  perf-profile.children.cyc=
les-pp.insert_reserved_file_extent
      2.53 =B1  7%      -1.9        0.59 =B1 10%  perf-profile.children.cyc=
les-pp.check_extent_data_item
      4.20 =B1 14%      -1.9        2.26 =B1 13%  perf-profile.children.cyc=
les-pp.handle_softirqs
      3.00 =B1 21%      -1.9        1.12 =B1 30%  perf-profile.children.cyc=
les-pp.asm_common_interrupt
      3.96 =B1  4%      -1.9        2.08 =B1 11%  perf-profile.children.cyc=
les-pp.btrfs_csum_file_blocks
      2.99 =B1 21%      -1.9        1.12 =B1 30%  perf-profile.children.cyc=
les-pp.common_interrupt
      5.13 =B1  9%      -1.7        3.43 =B1  8%  perf-profile.children.cyc=
les-pp.__btrfs_free_extent
      3.66 =B1 11%      -1.7        1.98 =B1 14%  perf-profile.children.cyc=
les-pp.blk_complete_reqs
      4.22 =B1  7%      -1.6        2.62 =B1 23%  perf-profile.children.cyc=
les-pp.__extent_writepage_io
      3.34 =B1 13%      -1.5        1.82 =B1 15%  perf-profile.children.cyc=
les-pp.blk_update_request
      3.94 =B1  7%      -1.5        2.46 =B1 10%  perf-profile.children.cyc=
les-pp._raw_spin_lock
      2.57 =B1 21%      -1.4        1.14 =B1 22%  perf-profile.children.cyc=
les-pp.irq_exit_rcu
      4.62 =B1  4%      -1.4        3.22 =B1  9%  perf-profile.children.cyc=
les-pp.setup_items_for_insert
      2.40 =B1 11%      -1.3        1.09 =B1  9%  perf-profile.children.cyc=
les-pp.log_extent_csums
      3.38            -1.3        2.08 =B1  7%  perf-profile.children.cycle=
s-pp.writepage_delalloc
      4.58 =B1  6%      -1.2        3.34 =B1  5%  perf-profile.children.cyc=
les-pp.btrfs_del_items
      3.12 =B1 11%      -1.2        1.90 =B1 11%  perf-profile.children.cyc=
les-pp.lookup_extent_backref
      3.12 =B1 11%      -1.2        1.90 =B1 11%  perf-profile.children.cyc=
les-pp.lookup_inline_extent_backref
      2.88 =B1  6%      -1.1        1.77 =B1 29%  perf-profile.children.cyc=
les-pp.submit_extent_page
      2.62 =B1  2%      -1.1        1.52 =B1  8%  perf-profile.children.cyc=
les-pp.btrfs_run_delalloc_range
      2.00 =B1 12%      -1.1        0.91 =B1 16%  perf-profile.children.cyc=
les-pp.intel_idle_irq
      1.85 =B1 20%      -1.1        0.78 =B1 31%  perf-profile.children.cyc=
les-pp.scsi_end_request
      1.85 =B1 20%      -1.1        0.78 =B1 31%  perf-profile.children.cyc=
les-pp.scsi_io_completion
      1.70 =B1 11%      -1.0        0.69 =B1  9%  perf-profile.children.cyc=
les-pp.btrfs_lookup_csum
      2.30 =B1  3%      -1.0        1.30 =B1  8%  perf-profile.children.cyc=
les-pp.cow_file_range
      2.50 =B1  7%      -1.0        1.50 =B1 32%  perf-profile.children.cyc=
les-pp.submit_one_bio
      2.58 =B1 10%      -1.0        1.61 =B1 11%  perf-profile.children.cyc=
les-pp.memcpy_orig
      1.88 =B1  9%      -1.0        0.91 =B1  9%  perf-profile.children.cyc=
les-pp.log_csums
      5.10 =B1  7%      -0.9        4.18 =B1 11%  perf-profile.children.cyc=
les-pp.poll_idle
      2.06 =B1  8%      -0.9        1.17 =B1 10%  perf-profile.children.cyc=
les-pp.btrfs_init_new_buffer
      2.60 =B1  4%      -0.9        1.73 =B1 47%  perf-profile.children.cyc=
les-pp.crc_pcl
      1.79 =B1  7%      -0.9        0.93 =B1 18%  perf-profile.children.cyc=
les-pp.intel_idle
      1.90 =B1 19%      -0.9        1.04 =B1 23%  perf-profile.children.cyc=
les-pp.__btrfs_bio_end_io
      3.49 =B1  6%      -0.8        2.66 =B1 11%  perf-profile.children.cyc=
les-pp.btrfs_get_token_32
      2.80 =B1  9%      -0.8        1.97 =B1 14%  perf-profile.children.cyc=
les-pp.btrfs_setup_item_for_insert
      3.06 =B1  7%      -0.8        2.24 =B1 10%  perf-profile.children.cyc=
les-pp.btrfs_copy_from_user
      3.32 =B1 10%      -0.8        2.50 =B1  6%  perf-profile.children.cyc=
les-pp.do_syscall_64
      3.32 =B1 10%      -0.8        2.50 =B1  6%  perf-profile.children.cyc=
les-pp.entry_SYSCALL_64_after_hwframe
      1.90 =B1 13%      -0.8        1.08 =B1 14%  perf-profile.children.cyc=
les-pp.folio_end_writeback
      3.05 =B1  6%      -0.8        2.24 =B1 10%  perf-profile.children.cyc=
les-pp.copy_page_from_iter_atomic
      1.74 =B1 18%      -0.8        0.94 =B1 23%  perf-profile.children.cyc=
les-pp.end_bbio_data_write
      2.41 =B1  7%      -0.8        1.62 =B1  5%  perf-profile.children.cyc=
les-pp.btrfs_dirty_pages
      1.50 =B1 12%      -0.8        0.73 =B1  8%  perf-profile.children.cyc=
les-pp.btrfs_get_8
      1.39 =B1 15%      -0.8        0.63 =B1 18%  perf-profile.children.cyc=
les-pp.lookup_open
      1.26 =B1 17%      -0.7        0.52 =B1 18%  perf-profile.children.cyc=
les-pp.btrfs_create_common
      1.66 =B1  9%      -0.7        0.93 =B1  7%  perf-profile.children.cyc=
les-pp.alloc_extent_buffer
      2.14 =B1  7%      -0.7        1.42 =B1  8%  perf-profile.children.cyc=
les-pp.__clear_extent_bit
      1.88 =B1 11%      -0.7        1.16 =B1 12%  perf-profile.children.cyc=
les-pp.copy_extent_buffer_full
      3.03 =B1  7%      -0.7        2.32 =B1  8%  perf-profile.children.cyc=
les-pp.btrfs_write_out_cache
      0.87 =B1  7%      -0.7        0.16 =B1 24%  perf-profile.children.cyc=
les-pp.btrfs_find_space_for_alloc
      3.02 =B1  6%      -0.7        2.32 =B1  8%  perf-profile.children.cyc=
les-pp.__btrfs_write_out_cache
      1.31 =B1  7%      -0.7        0.61 =B1 28%  perf-profile.children.cyc=
les-pp.btrfs_extend_item
      1.78 =B1  6%      -0.7        1.08 =B1 10%  perf-profile.children.cyc=
les-pp.add_delayed_ref
      1.16 =B1 20%      -0.7        0.46 =B1 17%  perf-profile.children.cyc=
les-pp.btrfs_create_new_inode
      1.45 =B1  8%      -0.7        0.76 =B1 16%  perf-profile.children.cyc=
les-pp.write_one_eb
      1.48 =B1 11%      -0.7        0.82 =B1 18%  perf-profile.children.cyc=
les-pp.__folio_end_writeback
      0.98 =B1 22%      -0.7        0.33 =B1 36%  perf-profile.children.cyc=
les-pp.__common_interrupt
      0.98 =B1 22%      -0.7        0.33 =B1 36%  perf-profile.children.cyc=
les-pp.handle_edge_irq
      0.98 =B1 22%      -0.6        0.33 =B1 36%  perf-profile.children.cyc=
les-pp.handle_irq_event
      0.94 =B1 22%      -0.6        0.31 =B1 37%  perf-profile.children.cyc=
les-pp.__handle_irq_event_percpu
      0.93 =B1 22%      -0.6        0.31 =B1 38%  perf-profile.children.cyc=
les-pp.ahci_single_level_irq_intr
      1.84 =B1  7%      -0.6        1.23 =B1 11%  perf-profile.children.cyc=
les-pp.smpboot_thread_fn
      2.15 =B1 15%      -0.6        1.56 =B1 10%  perf-profile.children.cyc=
les-pp.__x64_sys_openat
      2.08 =B1 16%      -0.6        1.49 =B1 11%  perf-profile.children.cyc=
les-pp.open64
      1.25 =B1 14%      -0.6        0.66 =B1 12%  perf-profile.children.cyc=
les-pp.submit_bio_noacct_nocheck
      2.14 =B1 15%      -0.6        1.56 =B1 10%  perf-profile.children.cyc=
les-pp.do_sys_openat2
      1.13 =B1 13%      -0.6        0.56 =B1 12%  perf-profile.children.cyc=
les-pp.__folio_start_writeback
      1.21 =B1 15%      -0.6        0.64 =B1 11%  perf-profile.children.cyc=
les-pp.__submit_bio
      1.67 =B1 12%      -0.6        1.10 =B1  8%  perf-profile.children.cyc=
les-pp.kmem_cache_alloc_noprof
      2.10 =B1 16%      -0.6        1.54 =B1 10%  perf-profile.children.cyc=
les-pp.do_filp_open
      2.10 =B1 16%      -0.6        1.54 =B1 10%  perf-profile.children.cyc=
les-pp.path_openat
      2.12 =B1  9%      -0.6        1.55 =B1  2%  perf-profile.children.cyc=
les-pp.__set_extent_bit
      1.12 =B1  9%      -0.6        0.56 =B1  7%  perf-profile.children.cyc=
les-pp.attach_eb_folio_to_filemap
      1.23 =B1  5%      -0.6        0.67 =B1 12%  perf-profile.children.cyc=
les-pp.btrfs_comp_cpu_keys
      1.71 =B1  8%      -0.6        1.16 =B1 12%  perf-profile.children.cyc=
les-pp.blk_mq_end_request
      1.06 =B1 17%      -0.6        0.50 =B1 15%  perf-profile.children.cyc=
les-pp.blk_mq_submit_bio
      1.26 =B1  9%      -0.6        0.71 =B1 12%  perf-profile.children.cyc=
les-pp.filemap_dirty_folio
      1.96 =B1 16%      -0.5        1.43 =B1 12%  perf-profile.children.cyc=
les-pp.open_last_lookups
      1.66 =B1 10%      -0.5        1.14 =B1 11%  perf-profile.children.cyc=
les-pp.run_ksoftirqd
      0.99 =B1  9%      -0.5        0.48 =B1 13%  perf-profile.children.cyc=
les-pp.__lruvec_stat_mod_folio
      1.08 =B1  9%      -0.5        0.57 =B1 13%  perf-profile.children.cyc=
les-pp.end_bbio_meta_write
      0.77 =B1 27%      -0.5        0.29 =B1 24%  perf-profile.children.cyc=
les-pp.insert_with_overflow
      0.79 =B1 25%      -0.5        0.32 =B1 23%  perf-profile.children.cyc=
les-pp.btrfs_add_link
      0.78 =B1 26%      -0.5        0.31 =B1 22%  perf-profile.children.cyc=
les-pp.btrfs_insert_dir_item
      1.42 =B1  4%      -0.5        0.96 =B1 12%  perf-profile.children.cyc=
les-pp.asm_sysvec_apic_timer_interrupt
      0.69 =B1 26%      -0.4        0.25 =B1 36%  perf-profile.children.cyc=
les-pp.ahci_handle_port_intr
      0.94 =B1  7%      -0.4        0.50 =B1 20%  perf-profile.children.cyc=
les-pp.__folio_mark_dirty
      1.06 =B1 10%      -0.4        0.62 =B1 15%  perf-profile.children.cyc=
les-pp.btrfs_delalloc_reserve_metadata
      1.31 =B1  9%      -0.4        0.87 =B1 46%  perf-profile.children.cyc=
les-pp.crc32c_pcl_intel_update
      1.70 =B1  6%      -0.4        1.27 =B1  7%  perf-profile.children.cyc=
les-pp.__schedule
      0.73 =B1 21%      -0.4        0.30 =B1 24%  perf-profile.children.cyc=
les-pp.btrfs_finish_ordered_extent
      1.00 =B1  9%      -0.4        0.58 =B1 15%  perf-profile.children.cyc=
les-pp.cache_save_setup
      1.06 =B1  8%      -0.4        0.64 =B1  9%  perf-profile.children.cyc=
les-pp.__filemap_get_folio
      0.69 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.irq_work_run_list
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.__sysvec_irq_work
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp._printk
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.asm_sysvec_irq_work
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.irq_work_run
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.irq_work_single
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.sysvec_irq_work
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.vprintk_emit
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.console_flush_all
      0.68 =B1 35%      -0.4        0.28 =B1 71%  perf-profile.children.cyc=
les-pp.console_unlock
      0.67 =B1 35%      -0.4        0.27 =B1 71%  perf-profile.children.cyc=
les-pp.serial8250_console_write
      0.93 =B1 13%      -0.4        0.53 =B1 14%  perf-profile.children.cyc=
les-pp.add_delayed_ref_head
      0.51 =B1 20%      -0.4        0.11 =B1 36%  perf-profile.children.cyc=
les-pp.find_free_space
      1.21 =B1  8%      -0.4        0.81 =B1 13%  perf-profile.children.cyc=
les-pp.sysvec_apic_timer_interrupt
      0.86 =B1 31%      -0.4        0.46 =B1  8%  perf-profile.children.cyc=
les-pp.folio_clear_dirty_for_io
      0.92 =B1  3%      -0.4        0.52 =B1 12%  perf-profile.children.cyc=
les-pp.set_extent_buffer_dirty
      0.88 =B1 10%      -0.4        0.48 =B1 14%  perf-profile.children.cyc=
les-pp._raw_spin_lock_irqsave
      1.36 =B1  2%      -0.4        0.96 =B1  9%  perf-profile.children.cyc=
les-pp.schedule
      0.65 =B1 36%      -0.4        0.26 =B1 71%  perf-profile.children.cyc=
les-pp.wait_for_lsr
      1.24 =B1 14%      -0.4        0.85 =B1  8%  perf-profile.children.cyc=
les-pp.btrfs_bin_search
      1.26 =B1 11%      -0.4        0.88 =B1 12%  perf-profile.children.cyc=
les-pp.__lookup_extent_mapping
      0.50 =B1 36%      -0.4        0.12 =B1 42%  perf-profile.children.cyc=
les-pp.btrfs_lookup_csums_list
      1.99 =B1  8%      -0.4        1.62 =B1 10%  perf-profile.children.cyc=
les-pp.__memmove
      0.87 =B1 12%      -0.4        0.51 =B1  9%  perf-profile.children.cyc=
les-pp.__reserve_bytes
      1.06 =B1  5%      -0.4        0.70 =B1  9%  perf-profile.children.cyc=
les-pp.lock_extent
      0.80 =B1 15%      -0.4        0.45 =B1 11%  perf-profile.children.cyc=
les-pp.btrfs_set_range_writeback
      0.85 =B1 22%      -0.4        0.50 =B1  8%  perf-profile.children.cyc=
les-pp.alloc_extent_state
      1.42 =B1  8%      -0.3        1.08 =B1 11%  perf-profile.children.cyc=
les-pp.kmem_cache_free
      0.76 =B1  8%      -0.3        0.43 =B1  8%  perf-profile.children.cyc=
les-pp.flush_smp_call_function_queue
      0.70 =B1 10%      -0.3        0.38 =B1 12%  perf-profile.children.cyc=
les-pp.down_read
      0.71 =B1 10%      -0.3        0.39 =B1  9%  perf-profile.children.cyc=
les-pp.__flush_smp_call_function_queue
      0.53 =B1 18%      -0.3        0.21 =B1 29%  perf-profile.children.cyc=
les-pp.queue_work_on
      1.44 =B1  7%      -0.3        1.13 =B1 13%  perf-profile.children.cyc=
les-pp.btrfs_fdatawrite_range
      0.94 =B1 12%      -0.3        0.64 =B1 45%  perf-profile.children.cyc=
les-pp.csum_tree_block
      0.97 =B1  7%      -0.3        0.66 =B1 14%  perf-profile.children.cyc=
les-pp.clear_state_bit
      0.74 =B1 12%      -0.3        0.44 =B1 12%  perf-profile.children.cyc=
les-pp.btrfs_reserve_metadata_bytes
      0.78 =B1  7%      -0.3        0.48 =B1 10%  perf-profile.children.cyc=
les-pp.percpu_counter_add_batch
      0.70 =B1 12%      -0.3        0.42 =B1  6%  perf-profile.children.cyc=
les-pp.filemap_add_folio
      0.54 =B1  5%      -0.3        0.26 =B1 21%  perf-profile.children.cyc=
les-pp.folio_account_dirtied
      0.67 =B1  8%      -0.3        0.40 =B1 22%  perf-profile.children.cyc=
les-pp.filemap_get_entry
      0.47 =B1 17%      -0.3        0.20 =B1 22%  perf-profile.children.cyc=
les-pp.__blk_mq_sched_dispatch_requests
      0.47 =B1 17%      -0.3        0.20 =B1 22%  perf-profile.children.cyc=
les-pp.blk_mq_sched_dispatch_requests
      0.80 =B1 13%      -0.3        0.53 =B1  9%  perf-profile.children.cyc=
les-pp.pagecache_get_page
      0.96 =B1 16%      -0.3        0.69 =B1 12%  perf-profile.children.cyc=
les-pp.btrfs_get_extent
      0.73 =B1 13%      -0.3        0.46 =B1 18%  perf-profile.children.cyc=
les-pp.xas_load
      0.67 =B1  9%      -0.3        0.40 =B1 16%  perf-profile.children.cyc=
les-pp.btrfs_truncate_free_space_cache
      0.56 =B1 10%      -0.3        0.29 =B1 21%  perf-profile.children.cyc=
les-pp.update_block_group_item
      0.98 =B1  5%      -0.3        0.72 =B1  9%  perf-profile.children.cyc=
les-pp.read_extent_buffer
      0.51 =B1  7%      -0.3        0.25 =B1 23%  perf-profile.children.cyc=
les-pp.__btrfs_check_node
      0.51 =B1  7%      -0.3        0.25 =B1 23%  perf-profile.children.cyc=
les-pp.btrfs_check_node
      0.46 =B1 23%      -0.3        0.21 =B1 23%  perf-profile.children.cyc=
les-pp.__queue_work
      0.53 =B1 11%      -0.2        0.29 =B1 18%  perf-profile.children.cyc=
les-pp.sched_ttwu_pending
      0.42 =B1 18%      -0.2        0.18 =B1 28%  perf-profile.children.cyc=
les-pp.__blk_mq_do_dispatch_sched
      0.52 =B1 11%      -0.2        0.28 =B1 17%  perf-profile.children.cyc=
les-pp.__cond_resched
      1.16 =B1 14%      -0.2        0.93 =B1  9%  perf-profile.children.cyc=
les-pp.read_block_for_search
      0.40 =B1 19%      -0.2        0.17 =B1 31%  perf-profile.children.cyc=
les-pp.__btrfs_run_delayed_items
      0.68 =B1  9%      -0.2        0.46 =B1 13%  perf-profile.children.cyc=
les-pp.lock_and_cleanup_extent_if_need
      0.93 =B1 16%      -0.2        0.70 =B1 13%  perf-profile.children.cyc=
les-pp.find_extent_buffer
      0.49 =B1  8%      -0.2        0.27 =B1 18%  perf-profile.children.cyc=
les-pp.btrfs_write_check
      0.55 =B1 15%      -0.2        0.34 =B1 16%  perf-profile.children.cyc=
les-pp.blk_mq_flush_plug_list
      0.44 =B1 17%      -0.2        0.24 =B1 15%  perf-profile.children.cyc=
les-pp.calc_available_free_space
      0.74 =B1 19%      -0.2        0.53 =B1 17%  perf-profile.children.cyc=
les-pp.find_extent_buffer_nolock
      0.35 =B1  8%      -0.2        0.14 =B1 24%  perf-profile.children.cyc=
les-pp.up_read
      0.26 =B1 32%      -0.2        0.06 =B1 84%  perf-profile.children.cyc=
les-pp.blk_mq_run_work_fn
      0.36 =B1 16%      -0.2        0.16 =B1 26%  perf-profile.children.cyc=
les-pp.blk_mq_dispatch_rq_list
      0.43 =B1 13%      -0.2        0.23 =B1 17%  perf-profile.children.cyc=
les-pp.__blk_flush_plug
      0.50 =B1 12%      -0.2        0.30 =B1 15%  perf-profile.children.cyc=
les-pp.menu_select
      1.08 =B1 17%      -0.2        0.88 =B1  9%  perf-profile.children.cyc=
les-pp.set_extent_bit
      0.32 =B1  6%      -0.2        0.13 =B1 15%  perf-profile.children.cyc=
les-pp.btrfs_reduce_alloc_profile
      0.72 =B1  9%      -0.2        0.53 =B1  9%  perf-profile.children.cyc=
les-pp.find_lock_delalloc_range
      0.53 =B1  9%      -0.2        0.34 =B1 18%  perf-profile.children.cyc=
les-pp.truncate_pagecache
      0.52 =B1  9%      -0.2        0.34 =B1 18%  perf-profile.children.cyc=
les-pp.truncate_inode_pages_range
      0.69 =B1 13%      -0.2        0.50 =B1 11%  perf-profile.children.cyc=
les-pp.btrfs_set_extent_delalloc
      0.28 =B1 12%      -0.2        0.10 =B1 60%  perf-profile.children.cyc=
les-pp.__rq_qos_throttle
      0.33 =B1 16%      -0.2        0.15 =B1 33%  perf-profile.children.cyc=
les-pp.scsi_queue_rq
      0.36 =B1 19%      -0.2        0.18 =B1 22%  perf-profile.children.cyc=
les-pp.__btrfs_wait_marked_extents
      0.47 =B1  9%      -0.2        0.29 =B1 21%  perf-profile.children.cyc=
les-pp.btrfs_replace_extent_map_range
      0.56 =B1  4%      -0.2        0.38 =B1 15%  perf-profile.children.cyc=
les-pp.check_dir_item
      0.54 =B1 12%      -0.2        0.37 =B1 31%  perf-profile.children.cyc=
les-pp.btrfs_alloc_reserved_file_extent
      0.33 =B1 19%      -0.2        0.16 =B1 17%  perf-profile.children.cyc=
les-pp.insert_state
      0.27 =B1 12%      -0.2        0.10 =B1 60%  perf-profile.children.cyc=
les-pp.wbt_wait
      0.23 =B1 16%      -0.2        0.06 =B1 76%  perf-profile.children.cyc=
les-pp.ahci_handle_port_interrupt
      0.32 =B1 11%      -0.2        0.15 =B1 14%  perf-profile.children.cyc=
les-pp.io_schedule
      0.23 =B1 16%      -0.2        0.06 =B1 76%  perf-profile.children.cyc=
les-pp.sata_async_notification
      0.22 =B1 19%      -0.2        0.06 =B1 76%  perf-profile.children.cyc=
les-pp.ahci_scr_read
      0.33 =B1 10%      -0.2        0.16 =B1 18%  perf-profile.children.cyc=
les-pp.file_remove_privs_flags
      0.28 =B1 42%      -0.2        0.12 =B1 26%  perf-profile.children.cyc=
les-pp.ahci_qc_complete
      0.57 =B1  7%      -0.2        0.41 =B1 22%  perf-profile.children.cyc=
les-pp.__slab_free
      0.26 =B1 22%      -0.2        0.10 =B1 20%  perf-profile.children.cyc=
les-pp.btrfs_put_block_group
      0.36 =B1  9%      -0.2        0.20 =B1 20%  perf-profile.children.cyc=
les-pp.__mod_lruvec_state
      0.28 =B1 19%      -0.2        0.12 =B1 17%  perf-profile.children.cyc=
les-pp.btrfs_lookup_inode
      0.30 =B1 13%      -0.2        0.14 =B1 20%  perf-profile.children.cyc=
les-pp.security_inode_need_killpriv
      0.26 =B1 20%      -0.2        0.10 =B1 32%  perf-profile.children.cyc=
les-pp.btrfs_insert_delayed_item
      0.36 =B1 12%      -0.2        0.21 =B1 13%  perf-profile.children.cyc=
les-pp.__mod_memcg_lruvec_state
      0.46 =B1 16%      -0.2        0.31 =B1 23%  perf-profile.children.cyc=
les-pp.prepare_pages
      0.23 =B1 21%      -0.1        0.08 =B1 61%  perf-profile.children.cyc=
les-pp.rq_qos_wait
      0.27 =B1  9%      -0.1        0.13 =B1 19%  perf-profile.children.cyc=
les-pp.cap_inode_need_killpriv
      0.42 =B1 12%      -0.1        0.28 =B1 11%  perf-profile.children.cyc=
les-pp.__filemap_add_folio
      0.31 =B1 22%      -0.1        0.17 =B1 26%  perf-profile.children.cyc=
les-pp.blk_mq_dispatch_plug_list
      0.34 =B1 24%      -0.1        0.20 =B1 19%  perf-profile.children.cyc=
les-pp.btrfs_leaf_free_space
      0.23 =B1 29%      -0.1        0.10 =B1  9%  perf-profile.children.cyc=
les-pp.xas_clear_mark
      0.35 =B1 16%      -0.1        0.22 =B1 28%  perf-profile.children.cyc=
les-pp.btrfs_drop_extent_map_range
      0.24 =B1 26%      -0.1        0.11 =B1  7%  perf-profile.children.cyc=
les-pp.__wake_up
      0.26 =B1 11%      -0.1        0.13 =B1 20%  perf-profile.children.cyc=
les-pp.__vfs_getxattr
      0.16 =B1 27%      -0.1        0.03 =B1101%  perf-profile.children.cyc=
les-pp.btrfs_wait_tree_log_extents
      0.34 =B1 15%      -0.1        0.21 =B1 25%  perf-profile.children.cyc=
les-pp.btrfs_invalidate_folio
      0.32 =B1 24%      -0.1        0.19 =B1 17%  perf-profile.children.cyc=
les-pp.need_preemptive_reclaim
      0.35 =B1 15%      -0.1        0.22 =B1 25%  perf-profile.children.cyc=
les-pp.truncate_cleanup_folio
      0.26 =B1 26%      -0.1        0.14 =B1 31%  perf-profile.children.cyc=
les-pp.rcu_core
      0.40 =B1 19%      -0.1        0.28 =B1 22%  perf-profile.children.cyc=
les-pp.free_extent_state
      0.26 =B1 28%      -0.1        0.13 =B1 16%  perf-profile.children.cyc=
les-pp.btrfs_can_overcommit
      0.39 =B1 13%      -0.1        0.27 =B1  6%  perf-profile.children.cyc=
les-pp.ttwu_do_activate
      0.16 =B1 48%      -0.1        0.04 =B1110%  perf-profile.children.cyc=
les-pp.__irqentry_text_start
      0.30 =B1 12%      -0.1        0.19 =B1 19%  perf-profile.children.cyc=
les-pp.__mod_node_page_state
      0.23 =B1 31%      -0.1        0.11 =B1 27%  perf-profile.children.cyc=
les-pp.btrfs_calculate_inode_block_rsv_size
      0.22 =B1 74%      -0.1        0.10 =B1 21%  perf-profile.children.cyc=
les-pp.push_leaf_right
      0.28 =B1 14%      -0.1        0.16 =B1 19%  perf-profile.children.cyc=
les-pp.__xa_clear_mark
      0.31 =B1 18%      -0.1        0.20 =B1 15%  perf-profile.children.cyc=
les-pp.btrfs_update_inode_item
      0.32 =B1 15%      -0.1        0.20 =B1 23%  perf-profile.children.cyc=
les-pp.btrfs_update_block_group
      0.33 =B1 12%      -0.1        0.22 =B1 22%  perf-profile.children.cyc=
les-pp.unpin_extent_cache
      0.34 =B1 12%      -0.1        0.23 =B1 21%  perf-profile.children.cyc=
les-pp.io_ctl_prepare_pages
      0.34 =B1 13%      -0.1        0.24 =B1 12%  perf-profile.children.cyc=
les-pp.activate_task
      0.22 =B1 26%      -0.1        0.12 =B1 32%  perf-profile.children.cyc=
les-pp.btrfs_map_block
      0.16 =B1 33%      -0.1        0.06 =B1 78%  perf-profile.children.cyc=
les-pp.blk_finish_plug
      0.29 =B1 14%      -0.1        0.19 =B1 11%  perf-profile.children.cyc=
les-pp.enqueue_entity
      0.24 =B1 16%      -0.1        0.14 =B1 48%  perf-profile.children.cyc=
les-pp.loop_queue_rq
      0.31 =B1  8%      -0.1        0.22 =B1 20%  perf-profile.children.cyc=
les-pp.run_delalloc_nocow
      0.13 =B1 36%      -0.1        0.04 =B1105%  perf-profile.children.cyc=
les-pp.tick_nohz_get_sleep_length
      0.14 =B1 27%      -0.1        0.05 =B1 46%  perf-profile.children.cyc=
les-pp.mod_zone_page_state
      0.19 =B1 20%      -0.1        0.10 =B1 47%  perf-profile.children.cyc=
les-pp.btrfs_delalloc_release_extents
      0.17 =B1 23%      -0.1        0.08 =B1 51%  perf-profile.children.cyc=
les-pp.__switch_to
      0.20 =B1 19%      -0.1        0.11 =B1 25%  perf-profile.children.cyc=
les-pp.__btrfs_prealloc_file_range
      0.28 =B1 23%      -0.1        0.19 =B1 20%  perf-profile.children.cyc=
les-pp.btrfs_block_rsv_release
      0.12 =B1 26%      -0.1        0.03 =B1100%  perf-profile.children.cyc=
les-pp.btrfs_update_root
      0.13 =B1 10%      -0.1        0.04 =B1111%  perf-profile.children.cyc=
les-pp.strcmp
      0.14 =B1 22%      -0.1        0.05 =B1 55%  perf-profile.children.cyc=
les-pp.btrfs_get_chunk_map
      0.18 =B1 18%      -0.1        0.10 =B1 32%  perf-profile.children.cyc=
les-pp.prepare_task_switch
      0.13 =B1 19%      -0.1        0.05 =B1 75%  perf-profile.children.cyc=
les-pp.scsi_dispatch_cmd
      0.19 =B1 17%      -0.1        0.11 =B1 48%  perf-profile.children.cyc=
les-pp.loop_queue_work
      0.31 =B1 16%      -0.1        0.23 =B1 16%  perf-profile.children.cyc=
les-pp.lock_delalloc_pages
      0.19 =B1 19%      -0.1        0.11 =B1 23%  perf-profile.children.cyc=
les-pp.extent_clear_unlock_delalloc
      0.14 =B1 25%      -0.1        0.06 =B1 52%  perf-profile.children.cyc=
les-pp.___perf_sw_event
      0.24 =B1 17%      -0.1        0.16 =B1 20%  perf-profile.children.cyc=
les-pp.blk_mq_plug_issue_direct
      0.23 =B1 16%      -0.1        0.16 =B1 19%  perf-profile.children.cyc=
les-pp.__blk_mq_issue_directly
      0.19 =B1 29%      -0.1        0.12 =B1 25%  perf-profile.children.cyc=
les-pp.rcu_do_batch
      0.12 =B1 20%      -0.1        0.04 =B1 75%  perf-profile.children.cyc=
les-pp.ata_scsi_queuecmd
      0.22 =B1  5%      -0.1        0.14 =B1 23%  perf-profile.children.cyc=
les-pp.__process_pages_contig
      0.12 =B1 41%      -0.1        0.04 =B1 77%  perf-profile.children.cyc=
les-pp.__mem_cgroup_uncharge
      0.24 =B1 16%      -0.1        0.16 =B1 17%  perf-profile.children.cyc=
les-pp.__switch_to_asm
      0.14 =B1 14%      -0.1        0.07 =B1 54%  perf-profile.children.cyc=
les-pp.btrfs_xattr_handler_get_security
      0.10 =B1 27%      -0.1        0.03 =B1100%  perf-profile.children.cyc=
les-pp.__ata_scsi_queuecmd
      0.28 =B1 18%      -0.1        0.21 =B1 18%  perf-profile.children.cyc=
les-pp.folios_put_refs
      0.11 =B1 20%      -0.1        0.04 =B1 77%  perf-profile.children.cyc=
les-pp.__kmalloc_noprof
      0.09 =B1 19%      -0.1        0.03 =B1100%  perf-profile.children.cyc=
les-pp.sbitmap_find_bit
      0.24 =B1 11%      -0.1        0.18 =B1 13%  perf-profile.children.cyc=
les-pp.sched_balance_find_src_group
      0.23 =B1 10%      -0.1        0.17 =B1 13%  perf-profile.children.cyc=
les-pp.update_sd_lb_stats
      0.09 =B1 14%      -0.1        0.03 =B1100%  perf-profile.children.cyc=
les-pp.__blk_mq_end_request
      0.15 =B1 28%      -0.1        0.08 =B1 22%  perf-profile.children.cyc=
les-pp.__btrfs_qgroup_release_data
      0.10 =B1 29%      -0.1        0.04 =B1106%  perf-profile.children.cyc=
les-pp.folio_mapping
      0.13 =B1 20%      -0.1        0.07 =B1 62%  perf-profile.children.cyc=
les-pp.btrfs_wait_ordered_range
      0.14 =B1 18%      -0.1        0.08 =B1 21%  perf-profile.children.cyc=
les-pp.btrfs_reserve_data_bytes
      0.10 =B1 10%      -0.1        0.05 =B1 77%  perf-profile.children.cyc=
les-pp.__memcpy
      0.18 =B1 19%      -0.1        0.12 =B1 29%  perf-profile.children.cyc=
les-pp.alloc_ordered_extent
      0.16 =B1 13%      -0.1        0.11 =B1 20%  perf-profile.children.cyc=
les-pp.sched_clock_cpu
      0.22 =B1 13%      -0.0        0.18 =B1 12%  perf-profile.children.cyc=
les-pp.vfs_read
      0.10 =B1 22%      -0.0        0.07 =B1 18%  perf-profile.children.cyc=
les-pp.put_cpu_partial
      0.00            +0.1        0.08 =B1 34%  perf-profile.children.cycle=
s-pp.btrfs_set_item_key_safe
      0.00            +0.1        0.10 =B1 36%  perf-profile.children.cycle=
s-pp.btrfs_alloc_from_cluster
      0.14 =B1 29%      +0.1        0.27 =B1 13%  perf-profile.children.cyc=
les-pp.memcpy_extent_buffer
      0.03 =B1100%      +0.1        0.16 =B1 43%  perf-profile.children.cyc=
les-pp.run_delayed_data_ref
      0.02 =B1141%      +0.1        0.16 =B1 42%  perf-profile.children.cyc=
les-pp.alloc_reserved_file_extent
      0.01 =B1223%      +0.1        0.16 =B1 23%  perf-profile.children.cyc=
les-pp.find_free_extent_clustered
      0.02 =B1149%      +0.2        0.18 =B1 26%  perf-profile.children.cyc=
les-pp.btrfs_select_ref_head
      0.08 =B1 75%      +0.2        0.32 =B1 18%  perf-profile.children.cyc=
les-pp.pin_down_extent
      0.18 =B1 40%      +0.7        0.87 =B1 10%  perf-profile.children.cyc=
les-pp.memmove_extent_buffer
      0.44 =B1 23%      +0.8        1.26 =B1  6%  perf-profile.children.cyc=
les-pp.__write_extent_buffer
      0.00            +1.5        1.52 =B1  7%  perf-profile.children.cycle=
s-pp.btrfs_truncate_item
      0.00            +1.5        1.54 =B1  7%  perf-profile.children.cycle=
s-pp.truncate_one_csum
     79.40            +1.9       81.32        perf-profile.children.cycles-=
pp.process_one_work
      0.10 =B1 11%      +3.2        3.32 =B1  6%  perf-profile.children.cyc=
les-pp.btrfs_del_csums
      0.17 =B1 26%      +3.8        3.93 =B1  7%  perf-profile.children.cyc=
les-pp.cleanup_ref_head
      0.00            +5.2        5.22 =B1  8%  perf-profile.children.cycle=
s-pp.transaction_kthread
     82.15            +6.1       88.22        perf-profile.children.cycles-=
pp.kthread
     82.16            +6.1       88.22        perf-profile.children.cycles-=
pp.ret_from_fork
     82.16            +6.1       88.22        perf-profile.children.cycles-=
pp.ret_from_fork_asm
     36.06 =B1  3%     +19.8       55.84 =B1  3%  perf-profile.children.cyc=
les-pp.btrfs_async_reclaim_metadata_space
     36.05 =B1  3%     +19.8       55.84 =B1  3%  perf-profile.children.cyc=
les-pp.flush_space
     33.17 =B1  3%     +26.5       59.67 =B1  3%  perf-profile.children.cyc=
les-pp.btrfs_commit_transaction
      0.41 =B1 36%     +29.8       30.19 =B1  9%  perf-profile.children.cyc=
les-pp._find_next_zero_bit
      0.82 =B1 22%     +33.8       34.61 =B1  9%  perf-profile.children.cyc=
les-pp.btrfs_finish_extent_commit
      0.66 =B1 30%     +33.8       34.48 =B1  9%  perf-profile.children.cyc=
les-pp.unpin_extent_range
      0.39 =B1 49%     +33.8       34.23 =B1  9%  perf-profile.children.cyc=
les-pp.steal_from_bitmap
      0.56 =B1 31%     +33.8       34.41 =B1  9%  perf-profile.children.cyc=
les-pp.__btrfs_add_free_space
      7.28 =B1  3%      -3.1        4.16 =B1  6%  perf-profile.self.cycles-=
pp.btrfs_get_32
      5.00 =B1  5%      -2.4        2.61 =B1  4%  perf-profile.self.cycles-=
pp.btrfs_get_64
      3.51 =B1  9%      -1.4        2.12 =B1 10%  perf-profile.self.cycles-=
pp._raw_spin_lock
      2.57 =B1  4%      -1.0        1.62 =B1 45%  perf-profile.self.cycles-=
pp.crc_pcl
      2.38 =B1  7%      -0.9        1.51 =B1  6%  perf-profile.self.cycles-=
pp.check_extent_item
      2.43 =B1  4%      -0.9        1.56 =B1 12%  perf-profile.self.cycles-=
pp.memcpy_orig
      1.79 =B1  7%      -0.9        0.93 =B1 18%  perf-profile.self.cycles-=
pp.intel_idle
      3.01 =B1  7%      -0.8        2.20 =B1 10%  perf-profile.self.cycles-=
pp.copy_page_from_iter_atomic
      1.44 =B1 12%      -0.7        0.70 =B1  8%  perf-profile.self.cycles-=
pp.btrfs_get_8
      3.26 =B1  4%      -0.7        2.58 =B1 11%  perf-profile.self.cycles-=
pp.btrfs_get_token_32
      1.20 =B1  6%      -0.5        0.65 =B1 12%  perf-profile.self.cycles-=
pp.btrfs_comp_cpu_keys
      1.11 =B1 11%      -0.4        0.67 =B1 13%  perf-profile.self.cycles-=
pp.__btrfs_check_leaf
      1.22 =B1 14%      -0.4        0.84 =B1  8%  perf-profile.self.cycles-=
pp.btrfs_bin_search
      1.24 =B1 10%      -0.4        0.87 =B1 13%  perf-profile.self.cycles-=
pp.__lookup_extent_mapping
      0.80 =B1 10%      -0.4        0.44 =B1 17%  perf-profile.self.cycles-=
pp._raw_spin_lock_irqsave
      1.97 =B1  9%      -0.4        1.62 =B1  9%  perf-profile.self.cycles-=
pp.__memmove
      0.75 =B1 15%      -0.3        0.41 =B1 17%  perf-profile.self.cycles-=
pp.add_delayed_ref_head
      0.79 =B1  6%      -0.3        0.48 =B1 21%  perf-profile.self.cycles-=
pp.intel_idle_irq
      0.92 =B1  5%      -0.3        0.61 =B1 10%  perf-profile.self.cycles-=
pp.read_extent_buffer
      0.71 =B1 14%      -0.3        0.42 =B1 22%  perf-profile.self.cycles-=
pp.check_leaf_item
      0.83 =B1  4%      -0.3        0.57 =B1 11%  perf-profile.self.cycles-=
pp.kmem_cache_alloc_noprof
      0.37 =B1 14%      -0.3        0.11 =B1 35%  perf-profile.self.cycles-=
pp.down_read
      0.68 =B1  7%      -0.3        0.43 =B1 12%  perf-profile.self.cycles-=
pp.percpu_counter_add_batch
      0.54 =B1 10%      -0.2        0.30 =B1 20%  perf-profile.self.cycles-=
pp.setup_items_for_insert
      0.62 =B1 13%      -0.2        0.38 =B1 16%  perf-profile.self.cycles-=
pp.xas_load
      0.30 =B1 17%      -0.2        0.09 =B1 22%  perf-profile.self.cycles-=
pp.up_read
      0.26 =B1 25%      -0.2        0.06 =B1 75%  perf-profile.self.cycles-=
pp.check_extent_data_item
      0.76 =B1 13%      -0.2        0.57 =B1 17%  perf-profile.self.cycles-=
pp.rwsem_spin_on_owner
      0.30 =B1 19%      -0.2        0.12 =B1 27%  perf-profile.self.cycles-=
pp.__lruvec_stat_mod_folio
      0.48 =B1 16%      -0.2        0.30 =B1 23%  perf-profile.self.cycles-=
pp.btrfs_del_items
      0.23 =B1 19%      -0.2        0.05 =B1 74%  perf-profile.self.cycles-=
pp.ahci_single_level_irq_intr
      0.39 =B1 15%      -0.2        0.22 =B1 25%  perf-profile.self.cycles-=
pp.filemap_get_entry
      0.22 =B1 19%      -0.2        0.06 =B1 76%  perf-profile.self.cycles-=
pp.ahci_scr_read
      0.58 =B1 12%      -0.2        0.41 =B1  8%  perf-profile.self.cycles-=
pp.__set_extent_bit
      0.26 =B1 23%      -0.2        0.10 =B1 21%  perf-profile.self.cycles-=
pp.btrfs_put_block_group
      0.34 =B1 14%      -0.2        0.18 =B1 31%  perf-profile.self.cycles-=
pp.__folio_end_writeback
      0.69 =B1 13%      -0.2        0.54 =B1 13%  perf-profile.self.cycles-=
pp.kmem_cache_free
      0.22 =B1 46%      -0.1        0.07 =B1 49%  perf-profile.self.cycles-=
pp.ahci_qc_complete
      0.28 =B1 12%      -0.1        0.14 =B1 34%  perf-profile.self.cycles-=
pp.__cond_resched
      0.29 =B1 22%      -0.1        0.15 =B1 15%  perf-profile.self.cycles-=
pp.__folio_start_writeback
      0.34 =B1 15%      -0.1        0.20 =B1 18%  perf-profile.self.cycles-=
pp.folio_end_writeback
      0.28 =B1 11%      -0.1        0.15 =B1 22%  perf-profile.self.cycles-=
pp.__mod_memcg_lruvec_state
      0.38 =B1 23%      -0.1        0.25 =B1 23%  perf-profile.self.cycles-=
pp._raw_spin_lock_irq
      0.19 =B1 15%      -0.1        0.06 =B1 49%  perf-profile.self.cycles-=
pp.btrfs_reduce_alloc_profile
      0.39 =B1 21%      -0.1        0.26 =B1 24%  perf-profile.self.cycles-=
pp.free_extent_state
      0.18 =B1 31%      -0.1        0.05 =B1 85%  perf-profile.self.cycles-=
pp.ahci_handle_port_intr
      0.22 =B1 27%      -0.1        0.09 =B1 11%  perf-profile.self.cycles-=
pp.xas_clear_mark
      0.34 =B1 15%      -0.1        0.22 =B1 17%  perf-profile.self.cycles-=
pp.menu_select
      0.30 =B1 12%      -0.1        0.18 =B1 21%  perf-profile.self.cycles-=
pp.__mod_node_page_state
      0.31 =B1 15%      -0.1        0.20 =B1 20%  perf-profile.self.cycles-=
pp.folio_clear_dirty_for_io
      0.13 =B1 27%      -0.1        0.03 =B1101%  perf-profile.self.cycles-=
pp.mod_zone_page_state
      0.26 =B1 23%      -0.1        0.16 =B1 31%  perf-profile.self.cycles-=
pp.block_group_cache_tree_search
      0.19 =B1 18%      -0.1        0.10 =B1 33%  perf-profile.self.cycles-=
pp.__filemap_add_folio
      0.17 =B1 22%      -0.1        0.08 =B1 49%  perf-profile.self.cycles-=
pp.__switch_to
      0.13 =B1 10%      -0.1        0.04 =B1115%  perf-profile.self.cycles-=
pp.strcmp
      0.27 =B1 25%      -0.1        0.18 =B1 18%  perf-profile.self.cycles-=
pp.find_extent_buffer_nolock
      0.12 =B1 21%      -0.1        0.03 =B1111%  perf-profile.self.cycles-=
pp.btrfs_calculate_inode_block_rsv_size
      0.19 =B1 20%      -0.1        0.11 =B1 16%  perf-profile.self.cycles-=
pp.insert_state
      0.24 =B1 16%      -0.1        0.16 =B1 17%  perf-profile.self.cycles-=
pp.__switch_to_asm
      0.10 =B1 23%      -0.1        0.03 =B1106%  perf-profile.self.cycles-=
pp.folio_account_dirtied
      0.14 =B1  7%      -0.1        0.07 =B1 52%  perf-profile.self.cycles-=
pp.lo_write_simple
      0.16 =B1 12%      -0.1        0.10 =B1 27%  perf-profile.self.cycles-=
pp.filemap_dirty_folio
      0.12 =B1 22%      -0.1        0.07 =B1 47%  perf-profile.self.cycles-=
pp.__filemap_get_folio
      0.09 =B1 17%      -0.1        0.03 =B1103%  perf-profile.self.cycles-=
pp.__memcpy
      0.08 =B1 16%      -0.1        0.03 =B1101%  perf-profile.self.cycles-=
pp.__flush_smp_call_function_queue
      0.10 =B1 21%      -0.0        0.07 =B1 18%  perf-profile.self.cycles-=
pp.put_cpu_partial
      0.09 =B1 20%      +0.1        0.14 =B1 15%  perf-profile.self.cycles-=
pp.__write_extent_buffer
      0.00            +0.2        0.16 =B1 29%  perf-profile.self.cycles-pp=
.btrfs_truncate_item
      0.05 =B1 74%      +4.0        4.05 =B1 10%  perf-profile.self.cycles-=
pp.steal_from_bitmap
      0.40 =B1 38%     +29.7       30.14 =B1  9%  perf-profile.self.cycles-=
pp._find_next_zero_bit





Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
