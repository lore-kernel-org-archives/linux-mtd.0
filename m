Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CE9C2BD09
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jun 2024 02:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QONqVruHi8aDtXoJYCZfRCF6xX+xyK6+4osb0Cyb6yI=; b=zGY0lALwEOntFf
	tFYMQRLdAHizkmPNglyPSCqjcDFmTxHp7v4CRjP4hx8lzYRtYqrNr84wscves0uWDG4FmVBUlH1iq
	KlayCEPb0IJQ63UZMKOiY7zHmlLHqJz3xQizUQH/uGeiYMbKe64XwqbXW/s8zG2pdCVOm7aQJNQqd
	b8wDUC1XgcBIqyZMuG9dxWxcWjYxUjDCjzcIIFIrw6s+iqiUVtjltuF7mGlBd7ptKjtNmz3vp47i1
	g9lWu3p59yPOYoKPVAh+qOr3Viw0dIFSKutT+F1Ryo87AlHmEaIl4NT7FwrwFaNkXSUbR/Ve0RtEs
	PiGVqGmYMWAwwMQQZZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLvvv-00000001Kdo-07MS;
	Tue, 25 Jun 2024 02:29:23 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLvvq-00000001KdA-2eBQ;
	Tue, 25 Jun 2024 02:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719282558; x=1750818558;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=V11zIKqk/6wupkP1AL+HaUeiYuY0nVFIKfm6Rg0OkQI=;
  b=oI9DPfWOgOWzyCPSLz9DS+Hv5xgQA3APqyWhtd1TfvgDHVLwgUBxCc07
   1oXjuhzmI4FKgAxfhWxkRelVfZAmNKKlQMOJZgUdA69oh2XNrX9tBmlht
   Gz5Dib7bIfDqN85HNL9ViaxLD6CcMMcWjhUJ7yEuSmO3s2PzJngwtH0+8
   HRz6M50QRd9PrTWTkqmC/ZIDC+MCMi8JxmHEhpEFZDs6gsbPlPVMcecWN
   20G/a4BVMcWl1f+yB/4XsoGVYd0L1JfQgqyt0AQK/VnCx3o7XrMDCgAt7
   O8eVGegx+P8M1el4/mqgqAHrUbMk3ltqsjgpJDytPLxcfaDwgtWZCtrf0
   Q==;
X-CSE-ConnectionGUID: xh+f9gIIQIiXb9XxfqTJCw==
X-CSE-MsgGUID: pIxyMv1cQrWQXKRhilEAEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16243600"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16243600"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 19:29:15 -0700
X-CSE-ConnectionGUID: AsAxO2tPRv6jk8yJ0kSNsQ==
X-CSE-MsgGUID: bX47Fp3gRPaL8p0eVze4JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43476889"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jun 2024 19:29:15 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 19:29:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 19:29:14 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 19:29:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9h8R6hzcnzhx4/2SvQorNvgdOcdkKvE0PLwksN7GPqMDbJF+VQw0p/0Fm/PCK6i7IMZeSQCBsLXgLBfZHdqr4TKJIdtx/LhSD3RiEjVQoQhz0kWPtfPOL/RH7oprc8Q418pLxlGNjF0I5qs86ckctHeyh59TOTIbQFM89ifuBbcbvUDYfdyZIxYkpgZ0g2hvBs4hoaOqUZrh5kxe8xWDMED2kV4ELERa/lXUJ/4mx/BzbudsxEVShYqelMvNIapixWiHQVA829BOFIgbyXhC7MnwHnfOpc29x16kitTJqLVlR+oP1doxcZLzU2EljTu2HCT5ChLvqdtkkADVZMwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwpKITPhZdY8rBpmX/A9w8AtI8ycz5+NsEaqwbLR1AM=;
 b=BRhf6AKDZEbWZkJctacnPUO1XrMuzfSzMhrA0783U9cwcQxkhCfM8pmENquiRBLuYhaTtL93JuwnG55xHWIai1kHfiFoOS4bCJ6O/FpyRst4grWyn7ZknvGsk/x7zNjdVxkUmMOAwaTN/xFpyHnVDVHoL1OB2gM2Mi7BY/AVkYI6/z57W+2d+H3znbzBV02VlZPSmoDFGTuFNRLJT2G3c0CYheLMLTqcMSWy3mCsGeTIfAKYhpkuOiT7j10asiOa2LpbzQoQm4W2L9U9HWjQ1sZJzCU+DRjO5GJFi+49imD6MpPDx5gYcRyxwIW4vJqQkgkl1woqAwHSNPj38HFxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Tue, 25 Jun
 2024 02:29:11 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%2]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 02:29:11 +0000
Date: Tue, 25 Jun 2024 10:28:54 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>, <linux-block@vger.kernel.org>,
	<linux-um@lists.infradead.org>, <drbd-dev@lists.linbit.com>,
	<nbd@other.debian.org>, <linuxppc-dev@lists.ozlabs.org>,
	<virtualization@lists.linux.dev>, <xen-devel@lists.xenproject.org>,
	<linux-bcache@vger.kernel.org>, <dm-devel@lists.linux.dev>,
	<linux-raid@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <nvdimm@lists.linux.dev>,
	<linux-nvme@lists.infradead.org>, <linux-scsi@vger.kernel.org>,
	<ying.huang@intel.com>, <feng.tang@intel.com>, <fengwei.yin@intel.com>,
	<oliver.sang@intel.com>
Subject: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min 22.6%
 improvement
Message-ID: <202406250948.e0044f1d-oliver.sang@intel.com>
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0133.apcprd02.prod.outlook.com
 (2603:1096:4:188::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8ede53-74eb-4dff-a384-08dc94be98a9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PIIgtCnwHZoc/HDZapjTLstCsf2vJA7dqGuvyDdI+BFfAm9aBdaewcOf34?=
 =?iso-8859-1?Q?Jooffxj7oiw8pKHAv17Sq4mUOjtkpSUV/tcs5vj1nkiKk3Q++QlO/JO/Gh?=
 =?iso-8859-1?Q?8tlONGWUxgY47PMxma4El1ngJwEU7Oc+3op87+IezaceDVmIGXdJptjDdP?=
 =?iso-8859-1?Q?iIVg2eGYFpKwr2pfoXlMtUZcAeWbMDBcVEccd5U2rKljURimKIe2NV+TZl?=
 =?iso-8859-1?Q?Q9rX0DyRwPjhFB6V5l5qPpkO3wAxzzOiTB+KPPpYFhEALw2Rd2pAX8+KBW?=
 =?iso-8859-1?Q?epVTj44l2NewRbspVVAqRajF785U3k6g3U/mZVnvgaTkx85He0SypHAuDr?=
 =?iso-8859-1?Q?6Y6eHYfkZWl5QB6V41AnB1Y4aFKAltJcM1hkvNgujDRGn28R7G9PhV68cG?=
 =?iso-8859-1?Q?xEOVHyrYDmm2RNFwwdiZOef6WgAg5isxrDK6uQ2+jgx2GlAOpPLtFpbZQF?=
 =?iso-8859-1?Q?IqxHMUMJXvRzSoEbTBqgbgTfobyNrwnYCgY8tAyD8GpHwIP2ff4FCFMWe4?=
 =?iso-8859-1?Q?jC3nKsIXZycbbfIc+8u7GpXMJN16hTbeqQXaAGFdVwu6U4Jyt7zM8fCKbD?=
 =?iso-8859-1?Q?/h4a4Bh5rClpKoNWhUU94vav++fqm/6cp73Yu8r3T3KtVUmIyDh8jGAOrV?=
 =?iso-8859-1?Q?wB9vpx8ebFCakwWbPdIdDT37Tc/6z+5tJm5dZ0U2PZF1vU3CfSTvZTdSXd?=
 =?iso-8859-1?Q?4xRIsAdP99TG1gAluRlLdUU0bchgP8rcexw/UllnPGqidY9np58WrtM9au?=
 =?iso-8859-1?Q?nD4jSn5gH+OPJKP5Pm+BtloYFaHluH+BYzgDk/8KwUaok1PVv5NYQykuuB?=
 =?iso-8859-1?Q?sR90Poe9tnBPpaUpZM0F/M/Tl6SCsepytiKPgpVkI3kFKCo9lv3QCrgL3S?=
 =?iso-8859-1?Q?KwtKafjHocGu7VorMLvNpY6zGNQSaySLlJRppuiLQ8SU6nus/bPUllCGr0?=
 =?iso-8859-1?Q?4BkqhMcXzal3fErmbMPMETqxWRNSoVldhIrOTH0Ve2ial7vAZcg0A14cmW?=
 =?iso-8859-1?Q?8spKsHUVkqX+xoNJDCn2jkSMc12Iw9Lh8IpodGdXep+K8GuFgtMogOjKJV?=
 =?iso-8859-1?Q?ZRbDDwRQ0nb54bIjcrPoxI8FUgiKrHJDn3NzxclmH/ikJ4SHpKxPOJEHNX?=
 =?iso-8859-1?Q?Dz4PoKFuiGpKYXirLXeiiFMCP/OolpA8h+tOaWZyMpoX6CyC1r07mNivV0?=
 =?iso-8859-1?Q?/yvDYDb84NmdI02GnJMv+Jydn0E2cd4db84d61nKPt86rfNdCPsQNGwDtS?=
 =?iso-8859-1?Q?BppUGS2/6QMIIzj+/tylz0apPhWRVTcqpGWp/o1Fsrz/ZlCSSegdy56VT4?=
 =?iso-8859-1?Q?lONpg/ZuYe5jMybgDLAOcIgpzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?a2eBOImJcv9EUqqAdM8+K8Sx2DYwG3JU+3AgvaMH5Y9h+UewAjTEgUqvLH?=
 =?iso-8859-1?Q?+O3U7SLWDyeVMNg16Bhdpbs2pUshRwXhsE3H2xcOLINxGV65wpjjwKcGlg?=
 =?iso-8859-1?Q?FT3ZbeLkalts+157JmiNEya3cIzAJZ2jNT/h50EYtR5IFGLxc2EPg1669S?=
 =?iso-8859-1?Q?yqQUnfnJ+ySx/XyBAtlcakbuXFKHVn4StmPSyvdHEBmXILHoC4kgJ+vTS1?=
 =?iso-8859-1?Q?os5l85/9nGv5jpPO8zKOAmyGeuOhsToOQAF0J/m6TNi7CAQQyMdkhaDRle?=
 =?iso-8859-1?Q?o0tkhlZror8Wq78cGXZ6P/aLAJ6uZtPv8pzcwp7GoWmK+fKwB5Pw8qnQNh?=
 =?iso-8859-1?Q?xRISnEz3xUQEdX84SJs8Wliubv/r5SHRRHkPpxiE10INEeVsg9HlEBwVma?=
 =?iso-8859-1?Q?Hk9lMLebXIc04/8wgltIt0ubrzxw0JOkCv1lHSSdtr9+thDoC3vcqKTvK+?=
 =?iso-8859-1?Q?+ZoxeR1NeTUZoBAiQptrIaKDn3iFkn3ksfo7aa59NUn/HJ5njz7MOvuHIq?=
 =?iso-8859-1?Q?YXjzdI8tJztF3OIu+8I1HE0WeYhxESwQiN6EOFHKg3TvE1GSQdKo/rxTRp?=
 =?iso-8859-1?Q?GZOdDX5ZxUcorUXZAlqocczlCpTMMS/T5tuqERry+PSGd/KUORLtAP2zpA?=
 =?iso-8859-1?Q?YugVmhWwiA36p7ZtzqV/14Nl4FnLhVRPTIekbVhZ+V4dcVBbbR5JLMv63C?=
 =?iso-8859-1?Q?BHBad851pqVlkxI1anKxI/P+9W23qifsT71mqEu1LsI0+aR18HsfviUB07?=
 =?iso-8859-1?Q?W+kf8kLK4SR38dVzA7Ek9v+B3JJzqy/+a2J5j9zND3kAG/WmDgXGsJebBF?=
 =?iso-8859-1?Q?FZm1oIEQAAgD6caN6uD2jHxXbwlkDLedzNnajIRn49zT1lQbeqnr6wY5wk?=
 =?iso-8859-1?Q?QnE6jDseNZXU7+SLoEeCv5bdFpgJt466kcS1uZ0Ci7GCzHxq7y/Sl/l1gj?=
 =?iso-8859-1?Q?227wuuHzhXE2+ADXTxSBBd4vuBPqxo5eFIo08xHhpIKDlBWbEXn02XyH/+?=
 =?iso-8859-1?Q?6lZuWo4hAcEsHZoekesn9i2hwbQEg3f2Hu4QklGeDKmy8GcvbfbSKygrrA?=
 =?iso-8859-1?Q?MeuFOQUF0W1DtG1yJ7YKgYml/nXBnv6r/M6EvRy8rDv+0X4J8mIaK9PBTm?=
 =?iso-8859-1?Q?YrObpua6oP1Pe1QRpdeyN85CiEWYCUQl5wSvM8jVeTsPFK7tU+rbi+tF56?=
 =?iso-8859-1?Q?bJRz7LDmCsuTxpbtBSyFrgZbTrNSQwfwqcTqDp5nSzfDJg1O366ZTL1NgQ?=
 =?iso-8859-1?Q?qoBZVtwsfmwPZWQ+zWRz18g66g8HyyrJVKdJLXavldaMnVIrbjNDjxA6fo?=
 =?iso-8859-1?Q?miH9183wvA7rkwqya2SqBHoFmay/0RQYU835d/zRIRf3DFNTMb2trmWZKG?=
 =?iso-8859-1?Q?FtsdKW2FE9ybmB4WnjsiMPBmOXGDvI55r1JCUn23c5K/dBFP7UUl/y+3O6?=
 =?iso-8859-1?Q?WXM2Ks4C7RgpdT98LWt88LpjkoiQDr9hV+kVWikPYNHVIc7kVOHEBXy1ck?=
 =?iso-8859-1?Q?cvor5rxLsgNRM3dtfWpIRhd6dU0zZoV2IRBhIG+vY0HtzXYiqJbZgDe0n3?=
 =?iso-8859-1?Q?LSszv7iifTKphqYTy6EnRcRm+XT77QB0AXjIrYmlKtgoKmMBWfiVHvrdEt?=
 =?iso-8859-1?Q?/qlwyfKtu33jTIZ+KHY2DF2n0p0RlySTXQQG6B4jdYTxOIKO0/FCzezg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8ede53-74eb-4dff-a384-08dc94be98a9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 02:29:10.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kxJ5gKgNkwM5s9fmrlour0cJ/y8l5AOLx8gfJoGmkeKSBi0NVGkj+TFuyayyHymlrUKN1zDxX8yNoipbVI70Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_192918_830270_10BC6C20 
X-CRM114-Status: UNSURE (   5.95  )
X-CRM114-Notice: Please train this message.
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

kernel test robot noticed a 22.6% improvement of aim7.jobs-per-min on:


commit: 1122c0c1cc71f740fa4d5f14f239194e06a1d5e7 ("block: move cache contro=
l settings out of queue->flags")
https://git.kernel.org/cgit/linux/kernel/git/axboe/linux-block.git for-next

testcase: aim7
test machine: 96 threads 2 sockets Intel(R) Xeon(R) Platinum 8260L CPU @ 2.=
40GHz (Cascade Lake) with 128G memory
parameters:

	disk: 4BRD_12G
	md: RAID0
	fs: xfs
	test: sync_disk_rw
	load: 300
	cpufreq_governor: performance






Details are as below:
---------------------------------------------------------------------------=
----------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240625/202406250948.e0044f1d-oliv=
er.sang@intel.com

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/te=
stcase:
  gcc-13/performance/4BRD_12G/xfs/x86_64-rhel-8.3/300/RAID0/debian-12-x86_6=
4-20240206.cgz/lkp-csl-2sp3/sync_disk_rw/aim7

commit: =

  70905f8706 ("block: remove blk_flush_policy")
  1122c0c1cc ("block: move cache control settings out of queue->flags")

70905f8706b62113 1122c0c1cc71f740fa4d5f14f23 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    153.19           -13.3%     132.81        uptime.boot
   2.8e+09           -11.9%  2.466e+09        cpuidle..time
  21945319 =B1  2%     -40.4%   13076160        cpuidle..usage
     29.31            +7.8%      31.58 =B1  2%  iostat.cpu.idle
     69.87            -3.6%      67.35        iostat.cpu.system
      0.04 =B1  4%      +0.0        0.08 =B1  5%  mpstat.cpu.all.iowait%
      0.78 =B1  2%      +0.2        0.99 =B1  2%  mpstat.cpu.all.usr%
     52860 =B1 49%     -78.2%      11536 =B1 78%  numa-numastat.node0.other=
_node
     46804 =B1 56%     +88.4%      88190 =B1 10%  numa-numastat.node1.other=
_node
    955871 =B1 10%     -43.3%     542216 =B1 14%  numa-meminfo.node1.Active
    955871 =B1 10%     -43.3%     542216 =B1 14%  numa-meminfo.node1.Active=
(anon)
   1015354 =B1 10%     -34.7%     662696 =B1 13%  numa-meminfo.node1.Shmem
      6008           -14.3%       5146 =B1  2%  perf-c2c.DRAM.remote
      7889           -12.4%       6908 =B1  2%  perf-c2c.HITM.local
      3839           -16.5%       3203 =B1  2%  perf-c2c.HITM.remote
     11728           -13.8%      10112 =B1  2%  perf-c2c.HITM.total
    695109           +20.5%     837625        vmstat.io.bo
    105.99 =B1  7%     -23.7%      80.83 =B1 11%  vmstat.procs.r
    803244           -30.9%     555360        vmstat.system.cs
    209736           -12.9%     182626        vmstat.system.in
      1448 =B1 89%    +207.9%       4459 =B1  6%  numa-vmstat.node0.nr_page=
_table_pages
     52860 =B1 49%     -78.2%      11536 =B1 78%  numa-vmstat.node0.numa_ot=
her
    239214 =B1 10%     -43.6%     134883 =B1 13%  numa-vmstat.node1.nr_acti=
ve_anon
    254124 =B1 10%     -34.9%     165421 =B1 13%  numa-vmstat.node1.nr_shmem
    239214 =B1 10%     -43.6%     134883 =B1 13%  numa-vmstat.node1.nr_zone=
_active_anon
     46805 =B1 56%     +88.4%      88190 =B1 10%  numa-vmstat.node1.numa_ot=
her
     17374           +22.6%      21299        aim7.jobs-per-min
    103.64           -18.4%      84.58        aim7.time.elapsed_time
    103.64           -18.4%      84.58        aim7.time.elapsed_time.max
   4641240           -83.4%     770073        aim7.time.involuntary_context=
_switches
     32705            -4.3%      31289 =B1  2%  aim7.time.minor_page_faults
      6562            -3.1%       6359        aim7.time.percent_of_cpu_this=
_job_got
      6775           -21.0%       5351 =B1  2%  aim7.time.system_time
  49095202           -38.3%   30299361        aim7.time.voluntary_context_s=
witches
   1297567           -37.0%     817692        meminfo.Active
   1297567           -37.0%     817692        meminfo.Active(anon)
     97760 =B1  5%     -23.4%      74859 =B1 20%  meminfo.AnonHugePages
   2390317           -15.3%    2024905        meminfo.Committed_AS
    884407           +11.9%     989723        meminfo.Inactive
    743152 =B1  2%     +14.8%     853331        meminfo.Inactive(anon)
    159265 =B1  8%     +38.6%     220668 =B1  3%  meminfo.Mapped
   1382079           -27.1%    1007445        meminfo.Shmem
    324534           -37.2%     203663 =B1  2%  proc-vmstat.nr_active_anon
   1165686            -8.2%    1070277        proc-vmstat.nr_file_pages
    185928 =B1  2%     +14.9%     213697        proc-vmstat.nr_inactive_anon
     35436            -2.9%      34420        proc-vmstat.nr_inactive_file
     40463 =B1  8%     +38.2%      55918 =B1  3%  proc-vmstat.nr_mapped
    345824           -27.3%     251424        proc-vmstat.nr_shmem
     28871            -1.4%      28477        proc-vmstat.nr_slab_reclaimab=
le
    324534           -37.2%     203663 =B1  2%  proc-vmstat.nr_zone_active_=
anon
    185928 =B1  2%     +14.9%     213697        proc-vmstat.nr_zone_inactiv=
e_anon
     35436            -2.9%      34420        proc-vmstat.nr_zone_inactive_=
file
   5120744            -2.4%    4996195        proc-vmstat.numa_hit
   5020486            -2.5%    4896473        proc-vmstat.numa_local
    207026 =B1 10%     +50.2%     310941        proc-vmstat.pgactivate
   5196440            -2.7%    5057618        proc-vmstat.pgalloc_normal
    763396 =B1  6%     -11.8%     673464        proc-vmstat.pgfault
  74254490            -1.3%   73292473        proc-vmstat.pgpgout
     11.25 =B1 24%     -60.0%       4.50 =B1 29%  sched_debug.cfs_rq:/.h_nr=
_running.max
      1.59 =B1 20%     -42.7%       0.91 =B1 13%  sched_debug.cfs_rq:/.h_nr=
_running.stddev
    968.29 =B1  5%     -13.2%     840.04 =B1  5%  sched_debug.cfs_rq:/.runn=
able_avg.avg
      5533 =B1 21%     -47.1%       2925 =B1 21%  sched_debug.cfs_rq:/.runn=
able_avg.max
    798.88 =B1 13%     -38.3%     492.63 =B1  9%  sched_debug.cfs_rq:/.runn=
able_avg.stddev
    578.50 =B1  5%      -9.9%     521.30 =B1  4%  sched_debug.cfs_rq:/.util=
_avg.avg
      3120 =B1 20%     -40.3%       1862 =B1 19%  sched_debug.cfs_rq:/.util=
_avg.max
    479.36 =B1 12%     -30.4%     333.40 =B1  8%  sched_debug.cfs_rq:/.util=
_avg.stddev
      4592 =B1 24%     -51.8%       2215 =B1 31%  sched_debug.cfs_rq:/.util=
_est.max
    615.47 =B1 21%     -35.7%     395.64 =B1 15%  sched_debug.cfs_rq:/.util=
_est.stddev
     11.33 =B1 24%     -58.8%       4.67 =B1 26%  sched_debug.cpu.nr_runnin=
g.max
      1.62 =B1 20%     -42.6%       0.93 =B1 11%  sched_debug.cpu.nr_runnin=
g.stddev
    224323           -28.2%     161088        sched_debug.cpu.nr_switches.a=
vg
    242363 =B1  2%     -27.9%     174695 =B1  2%  sched_debug.cpu.nr_switch=
es.max
    197870 =B1  2%     -27.6%     143186        sched_debug.cpu.nr_switches=
.min
      7911 =B1 19%     -33.1%       5295 =B1 10%  sched_debug.cpu.nr_switch=
es.stddev
      1.23            -4.8%       1.17        perf-stat.i.MPKI
 1.105e+10            +5.6%  1.167e+10        perf-stat.i.branch-instructio=
ns
      1.20 =B1  2%      +0.1        1.29 =B1  2%  perf-stat.i.branch-miss-r=
ate%
    820863           -30.7%     569230        perf-stat.i.context-switches
      3.79           -10.2%       3.41        perf-stat.i.cpi
 2.176e+11            -3.2%  2.106e+11        perf-stat.i.cpu-cycles
    212040           -27.8%     153137        perf-stat.i.cpu-migrations
 5.416e+10            +6.8%  5.785e+10        perf-stat.i.instructions
      0.32           +11.8%       0.36        perf-stat.i.ipc
      0.05 =B1 77%    +233.9%       0.17 =B1 50%  perf-stat.i.major-faults
     10.74           -30.2%       7.50        perf-stat.i.metric.K/sec
      1.28            -4.3%       1.22        perf-stat.overall.MPKI
      4.02            -9.4%       3.64        perf-stat.overall.cpi
      3145            -5.3%       2979        perf-stat.overall.cycles-betw=
een-cache-misses
      0.25           +10.3%       0.27        perf-stat.overall.ipc
 1.094e+10            +5.4%  1.153e+10        perf-stat.ps.branch-instructi=
ons
    812563           -30.8%     562343        perf-stat.ps.context-switches
 2.156e+11            -3.4%  2.082e+11        perf-stat.ps.cpu-cycles
    209965           -28.0%     151248        perf-stat.ps.cpu-migrations
 5.365e+10            +6.6%  5.717e+10        perf-stat.ps.instructions
 5.641e+12           -13.1%  4.905e+12 =B1  2%  perf-stat.total.instructions
     14.88 =B1  5%     -14.9        0.00        perf-profile.calltrace.cycl=
es-pp.blkdev_issue_flush.xfs_file_fsync.xfs_file_buffered_write.vfs_write.k=
sys_write
     14.86 =B1  5%     -14.9        0.00        perf-profile.calltrace.cycl=
es-pp.submit_bio_wait.blkdev_issue_flush.xfs_file_fsync.xfs_file_buffered_w=
rite.vfs_write
     14.77 =B1  5%     -14.8        0.00        perf-profile.calltrace.cycl=
es-pp.__submit_bio_noacct.submit_bio_wait.blkdev_issue_flush.xfs_file_fsync=
.xfs_file_buffered_write
     14.76 =B1  5%     -14.8        0.00        perf-profile.calltrace.cycl=
es-pp.__submit_bio.__submit_bio_noacct.submit_bio_wait.blkdev_issue_flush.x=
fs_file_fsync
     14.74 =B1  5%     -14.7        0.00        perf-profile.calltrace.cycl=
es-pp.md_handle_request.__submit_bio.__submit_bio_noacct.submit_bio_wait.bl=
kdev_issue_flush
     14.72 =B1  5%     -14.7        0.00        perf-profile.calltrace.cycl=
es-pp.raid0_make_request.md_handle_request.__submit_bio.__submit_bio_noacct=
.submit_bio_wait
     14.71 =B1  5%     -14.7        0.00        perf-profile.calltrace.cycl=
es-pp.md_flush_request.raid0_make_request.md_handle_request.__submit_bio.__=
submit_bio_noacct
     13.32 =B1  5%     -13.3        0.00        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irq.md_flush_request.raid0_make_request.md_handle_requ=
est.__submit_bio
     13.25 =B1  5%     -13.3        0.00        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.md_flush_request.=
raid0_make_request.md_handle_request
      9.70 =B1  3%      -1.1        8.61 =B1  3%  perf-profile.calltrace.cy=
cles-pp.cpu_startup_entry.start_secondary.common_startup_64
      9.70 =B1  3%      -1.1        8.61 =B1  3%  perf-profile.calltrace.cy=
cles-pp.start_secondary.common_startup_64
      9.70 =B1  3%      -1.1        8.61 =B1  3%  perf-profile.calltrace.cy=
cles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      9.80 =B1  3%      -1.1        8.71 =B1  3%  perf-profile.calltrace.cy=
cles-pp.common_startup_64
      9.12 =B1  3%      -1.0        8.15 =B1  3%  perf-profile.calltrace.cy=
cles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_=
startup_64
      8.95 =B1  3%      -0.9        8.01 =B1  3%  perf-profile.calltrace.cy=
cles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_sta=
rtup_entry
      8.95 =B1  3%      -0.9        8.02 =B1  3%  perf-profile.calltrace.cy=
cles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_sec=
ondary
      2.21            -0.4        1.78 =B1  2%  perf-profile.calltrace.cycl=
es-pp.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2.22            -0.4        1.79 =B1  2%  perf-profile.calltrace.cycl=
es-pp.kthread.ret_from_fork.ret_from_fork_asm
      2.22            -0.4        1.79 =B1  2%  perf-profile.calltrace.cycl=
es-pp.ret_from_fork.ret_from_fork_asm
      2.22            -0.4        1.79 =B1  2%  perf-profile.calltrace.cycl=
es-pp.ret_from_fork_asm
      2.08            -0.4        1.68 =B1  2%  perf-profile.calltrace.cycl=
es-pp.process_one_work.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      3.09            -0.2        2.86 =B1  2%  perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_q=
ueue.xlog_wait_on_iclog.xfs_log_force_seq
      3.10            -0.2        2.87 =B1  2%  perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.xfs_log_f=
orce_seq.xfs_file_fsync
      3.10            -0.2        2.87 =B1  2%  perf-profile.calltrace.cycl=
es-pp.remove_wait_queue.xlog_wait_on_iclog.xfs_log_force_seq.xfs_file_fsync=
.xfs_file_buffered_write
      3.44            -0.2        3.23 =B1  4%  perf-profile.calltrace.cycl=
es-pp.xlog_wait_on_iclog.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered=
_write.vfs_write
      0.95            +0.1        1.04        perf-profile.calltrace.cycles=
-pp.mutex_spin_on_owner.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xl=
og_cil_force_seq
      0.57            +0.1        0.71 =B1  2%  perf-profile.calltrace.cycl=
es-pp.iomap_file_buffered_write.xfs_file_buffered_write.vfs_write.ksys_writ=
e.do_syscall_64
      0.58 =B1  2%      +0.3        0.84 =B1  3%  perf-profile.calltrace.cy=
cles-pp.xfs_end_ioend.xfs_end_io.process_one_work.worker_thread.kthread
      0.59 =B1  2%      +0.3        0.85 =B1  2%  perf-profile.calltrace.cy=
cles-pp.xfs_end_io.process_one_work.worker_thread.kthread.ret_from_fork
      0.90 =B1  2%      +0.4        1.27 =B1  3%  perf-profile.calltrace.cy=
cles-pp.__submit_bio_noacct.iomap_submit_ioend.iomap_writepages.xfs_vm_writ=
epages.do_writepages
      0.88 =B1  2%      +0.4        1.26 =B1  3%  perf-profile.calltrace.cy=
cles-pp.__submit_bio.__submit_bio_noacct.iomap_submit_ioend.iomap_writepage=
s.xfs_vm_writepages
      0.92 =B1  3%      +0.4        1.30 =B1  3%  perf-profile.calltrace.cy=
cles-pp.iomap_submit_ioend.iomap_writepages.xfs_vm_writepages.do_writepages=
.filemap_fdatawrite_wbc
      0.57 =B1  3%      +0.4        0.95 =B1  6%  perf-profile.calltrace.cy=
cles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_vn_update_time.kiocb_modifie=
d.xfs_file_write_checks
      0.64 =B1  3%      +0.4        1.03 =B1  6%  perf-profile.calltrace.cy=
cles-pp.__xfs_trans_commit.xfs_vn_update_time.kiocb_modified.xfs_file_write=
_checks.xfs_file_buffered_write
      6.90 =B1  2%      +0.5        7.40 =B1  3%  perf-profile.calltrace.cy=
cles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_i=
dle
      0.92 =B1  4%      +0.5        1.43 =B1  6%  perf-profile.calltrace.cy=
cles-pp.xfs_vn_update_time.kiocb_modified.xfs_file_write_checks.xfs_file_bu=
ffered_write.vfs_write
      0.00            +0.5        0.52        perf-profile.calltrace.cycles=
-pp.complete.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_log=
_force_seq
      0.94 =B1  4%      +0.5        1.46 =B1  6%  perf-profile.calltrace.cy=
cles-pp.kiocb_modified.xfs_file_write_checks.xfs_file_buffered_write.vfs_wr=
ite.ksys_write
      0.96 =B1  4%      +0.5        1.48 =B1  6%  perf-profile.calltrace.cy=
cles-pp.xfs_file_write_checks.xfs_file_buffered_write.vfs_write.ksys_write.=
do_syscall_64
      0.00            +0.5        0.54 =B1  2%  perf-profile.calltrace.cycl=
es-pp.xfs_iomap_write_unwritten.xfs_end_ioend.xfs_end_io.process_one_work.w=
orker_thread
      0.00            +0.5        0.55 =B1  2%  perf-profile.calltrace.cycl=
es-pp.iomap_write_iter.iomap_file_buffered_write.xfs_file_buffered_write.vf=
s_write.ksys_write
      0.00            +0.6        0.56 =B1 10%  perf-profile.calltrace.cycl=
es-pp.__folio_start_writeback.iomap_writepage_map.iomap_writepages.xfs_vm_w=
ritepages.do_writepages
      0.00            +0.6        0.57 =B1  6%  perf-profile.calltrace.cycl=
es-pp.__folio_end_writeback.folio_end_writeback.iomap_finish_ioend.md_end_c=
lone_io.__submit_bio
      0.00            +0.6        0.58 =B1  7%  perf-profile.calltrace.cycl=
es-pp.folio_end_writeback.iomap_finish_ioend.md_end_clone_io.__submit_bio._=
_submit_bio_noacct
      0.00            +0.6        0.60 =B1  6%  perf-profile.calltrace.cycl=
es-pp.iomap_finish_ioend.md_end_clone_io.__submit_bio.__submit_bio_noacct.i=
omap_submit_ioend
      0.08 =B1223%      +0.6        0.72 =B1  5%  perf-profile.calltrace.cy=
cles-pp.md_end_clone_io.__submit_bio.__submit_bio_noacct.iomap_submit_ioend=
.iomap_writepages
      1.45 =B1  4%      +0.7        2.15 =B1  4%  perf-profile.calltrace.cy=
cles-pp.iomap_writepages.xfs_vm_writepages.do_writepages.filemap_fdatawrite=
_wbc.__filemap_fdatawrite_range
      1.46 =B1  4%      +0.7        2.16 =B1  4%  perf-profile.calltrace.cy=
cles-pp.xfs_vm_writepages.do_writepages.filemap_fdatawrite_wbc.__filemap_fd=
atawrite_range.file_write_and_wait_range
      1.48 =B1  4%      +0.7        2.18 =B1  4%  perf-profile.calltrace.cy=
cles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.fil=
e_write_and_wait_range.xfs_file_fsync
      1.51 =B1  4%      +0.7        2.22 =B1  4%  perf-profile.calltrace.cy=
cles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and_wa=
it_range.xfs_file_fsync.xfs_file_buffered_write
      1.51 =B1  3%      +0.7        2.23 =B1  4%  perf-profile.calltrace.cy=
cles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.xfs_file_fsync=
.xfs_file_buffered_write.vfs_write
      0.00            +0.7        0.72 =B1  7%  perf-profile.calltrace.cycl=
es-pp.iomap_writepage_map.iomap_writepages.xfs_vm_writepages.do_writepages.=
filemap_fdatawrite_wbc
      1.60 =B1  3%      +0.8        2.36 =B1  4%  perf-profile.calltrace.cy=
cles-pp.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_write.vf=
s_write.ksys_write
     85.48            +0.8       86.24        perf-profile.calltrace.cycles=
-pp.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_=
64
     87.06            +1.4       88.49        perf-profile.calltrace.cycles=
-pp.xfs_file_buffered_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
     87.18            +1.5       88.64        perf-profile.calltrace.cycles=
-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     87.36            +1.5       88.82        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     87.19            +1.5       88.65        perf-profile.calltrace.cycles=
-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
     87.36            +1.5       88.82        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.write
     87.62            +1.5       89.10        perf-profile.calltrace.cycles=
-pp.write
     56.74           +13.7       70.42        perf-profile.calltrace.cycles=
-pp.osq_lock.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xlog_cil_forc=
e_seq
     57.89           +13.8       71.74        perf-profile.calltrace.cycles=
-pp.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs=
_log_force_seq
     60.36           +14.6       74.96        perf-profile.calltrace.cycles=
-pp.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_se=
q.xfs_file_fsync
     61.48           +14.6       76.09        perf-profile.calltrace.cycles=
-pp.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync.x=
fs_file_buffered_write
     68.74           +14.8       83.60        perf-profile.calltrace.cycles=
-pp.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_write.vfs_write.ksys=
_write
     64.97           +15.1       80.03        perf-profile.calltrace.cycles=
-pp.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_w=
rite.vfs_write
     14.86 =B1  5%     -14.9        0.00        perf-profile.children.cycle=
s-pp.submit_bio_wait
     14.96 =B1  5%     -14.8        0.12 =B1  4%  perf-profile.children.cyc=
les-pp.md_handle_request
     14.94 =B1  5%     -14.8        0.11 =B1  3%  perf-profile.children.cyc=
les-pp.raid0_make_request
     14.83 =B1  5%     -14.8        0.00        perf-profile.children.cycle=
s-pp.md_flush_request
     14.88 =B1  5%     -14.8        0.06 =B1  6%  perf-profile.children.cyc=
les-pp.blkdev_issue_flush
     15.82 =B1  5%     -14.5        1.32 =B1  3%  perf-profile.children.cyc=
les-pp.__submit_bio_noacct
     15.81 =B1  5%     -14.5        1.31 =B1  3%  perf-profile.children.cyc=
les-pp.__submit_bio
     13.86 =B1  5%     -13.6        0.29 =B1  3%  perf-profile.children.cyc=
les-pp._raw_spin_lock_irq
     22.32 =B1  3%     -13.1        9.23 =B1  4%  perf-profile.children.cyc=
les-pp.native_queued_spin_lock_slowpath
      1.96 =B1  9%      -1.5        0.49 =B1  4%  perf-profile.children.cyc=
les-pp.intel_idle_irq
      9.70 =B1  3%      -1.1        8.61 =B1  3%  perf-profile.children.cyc=
les-pp.start_secondary
      9.80 =B1  3%      -1.1        8.71 =B1  3%  perf-profile.children.cyc=
les-pp.common_startup_64
      9.80 =B1  3%      -1.1        8.71 =B1  3%  perf-profile.children.cyc=
les-pp.cpu_startup_entry
      9.79 =B1  3%      -1.1        8.71 =B1  3%  perf-profile.children.cyc=
les-pp.do_idle
      9.20 =B1  3%      -1.0        8.25 =B1  3%  perf-profile.children.cyc=
les-pp.cpuidle_idle_call
      9.04 =B1  3%      -0.9        8.11 =B1  3%  perf-profile.children.cyc=
les-pp.cpuidle_enter
      9.04 =B1  3%      -0.9        8.11 =B1  3%  perf-profile.children.cyc=
les-pp.cpuidle_enter_state
      2.21            -0.4        1.78 =B1  2%  perf-profile.children.cycle=
s-pp.worker_thread
      2.22            -0.4        1.79 =B1  2%  perf-profile.children.cycle=
s-pp.kthread
      2.22            -0.4        1.79 =B1  2%  perf-profile.children.cycle=
s-pp.ret_from_fork
      2.22            -0.4        1.79 =B1  2%  perf-profile.children.cycle=
s-pp.ret_from_fork_asm
      2.08            -0.4        1.68 =B1  2%  perf-profile.children.cycle=
s-pp.process_one_work
      0.57            -0.3        0.24        perf-profile.children.cycles-=
pp.__wake_up
      0.63            -0.3        0.32 =B1  2%  perf-profile.children.cycle=
s-pp.__wake_up_common
      1.26            -0.3        0.99        perf-profile.children.cycles-=
pp.try_to_wake_up
      3.56 =B1  2%      -0.2        3.34 =B1  4%  perf-profile.children.cyc=
les-pp.xlog_wait_on_iclog
      0.46 =B1  2%      -0.1        0.36 =B1  2%  perf-profile.children.cyc=
les-pp.select_task_rq
      0.86 =B1  3%      -0.1        0.75 =B1  2%  perf-profile.children.cyc=
les-pp.asm_sysvec_apic_timer_interrupt
      0.43 =B1  2%      -0.1        0.33 =B1  2%  perf-profile.children.cyc=
les-pp.select_task_rq_fair
      0.64            -0.1        0.55 =B1  2%  perf-profile.children.cycle=
s-pp.ttwu_do_activate
      0.71 =B1  3%      -0.1        0.62 =B1  3%  perf-profile.children.cyc=
les-pp.activate_task
      0.57            -0.1        0.48        perf-profile.children.cycles-=
pp.__flush_smp_call_function_queue
      0.17 =B1  2%      -0.1        0.08        perf-profile.children.cycle=
s-pp.xlog_state_release_iclog
      0.48            -0.1        0.41 =B1  2%  perf-profile.children.cycle=
s-pp.sched_ttwu_pending
      0.61 =B1  3%      -0.1        0.54 =B1  3%  perf-profile.children.cyc=
les-pp.enqueue_task_fair
      0.28 =B1  3%      -0.1        0.21 =B1  3%  perf-profile.children.cyc=
les-pp.select_idle_sibling
      0.19            -0.1        0.13 =B1  2%  perf-profile.children.cycle=
s-pp.schedule_idle
      0.22 =B1  3%      -0.1        0.16 =B1  4%  perf-profile.children.cyc=
les-pp.select_idle_cpu
      0.47 =B1  4%      -0.1        0.41 =B1  5%  perf-profile.children.cyc=
les-pp.update_load_avg
      0.35 =B1  2%      -0.1        0.29 =B1  2%  perf-profile.children.cyc=
les-pp.flush_smp_call_function_queue
      0.42 =B1  3%      -0.1        0.37 =B1  2%  perf-profile.children.cyc=
les-pp.enqueue_entity
      0.11 =B1  6%      -0.1        0.06 =B1  8%  perf-profile.children.cyc=
les-pp.finish_task_switch
      0.18 =B1  5%      -0.0        0.13 =B1  5%  perf-profile.children.cyc=
les-pp.available_idle_cpu
      0.33            -0.0        0.28        perf-profile.children.cycles-=
pp.xlog_write
      0.12 =B1  3%      -0.0        0.07 =B1  5%  perf-profile.children.cyc=
les-pp.xlog_write_partial
      0.30 =B1  3%      -0.0        0.25 =B1  3%  perf-profile.children.cyc=
les-pp.asm_sysvec_call_function_single
      0.12 =B1  4%      -0.0        0.07 =B1  5%  perf-profile.children.cyc=
les-pp.xlog_write_get_more_iclog_space
      0.37 =B1  5%      -0.0        0.32 =B1  8%  perf-profile.children.cyc=
les-pp.dequeue_entity
      0.08            -0.0        0.03 =B1 70%  perf-profile.children.cycle=
s-pp.__cond_resched
      0.46            -0.0        0.41        perf-profile.children.cycles-=
pp.xlog_cil_push_work
      0.27 =B1  3%      -0.0        0.23 =B1  3%  perf-profile.children.cyc=
les-pp.sysvec_call_function_single
      0.08 =B1  6%      -0.0        0.04 =B1 44%  perf-profile.children.cyc=
les-pp.select_idle_core
      0.26 =B1  2%      -0.0        0.22 =B1  3%  perf-profile.children.cyc=
les-pp.__sysvec_call_function_single
      0.12 =B1  3%      -0.0        0.09 =B1  5%  perf-profile.children.cyc=
les-pp.queue_work_on
      0.14 =B1  3%      -0.0        0.12 =B1  6%  perf-profile.children.cyc=
les-pp.prepare_task_switch
      0.12 =B1  3%      -0.0        0.09        perf-profile.children.cycle=
s-pp.ttwu_queue_wakelist
      0.26 =B1  5%      -0.0        0.23 =B1  6%  perf-profile.children.cyc=
les-pp.update_curr
      0.12            -0.0        0.10 =B1  5%  perf-profile.children.cycle=
s-pp.perf_trace_sched_wakeup_template
      0.13 =B1  3%      -0.0        0.11        perf-profile.children.cycle=
s-pp.wake_affine
      0.08 =B1  4%      -0.0        0.06 =B1  8%  perf-profile.children.cyc=
les-pp.set_next_entity
      0.10 =B1  5%      -0.0        0.07 =B1  6%  perf-profile.children.cyc=
les-pp.kick_pool
      0.11 =B1  4%      -0.0        0.09 =B1  4%  perf-profile.children.cyc=
les-pp.__queue_work
      0.10 =B1  3%      -0.0        0.08 =B1  4%  perf-profile.children.cyc=
les-pp.__switch_to_asm
      0.10 =B1  4%      -0.0        0.08 =B1  6%  perf-profile.children.cyc=
les-pp.switch_mm_irqs_off
      0.07            -0.0        0.05        perf-profile.children.cycles-=
pp.__smp_call_single_queue
      0.11            -0.0        0.09        perf-profile.children.cycles-=
pp.xlog_cil_set_ctx_write_state
      0.10            -0.0        0.08 =B1  4%  perf-profile.children.cycle=
s-pp.task_h_load
      0.08 =B1  4%      -0.0        0.06        perf-profile.children.cycle=
s-pp.sched_mm_cid_migrate_to
      0.08 =B1  4%      -0.0        0.06        perf-profile.children.cycle=
s-pp.set_task_cpu
      0.07 =B1  5%      -0.0        0.05        perf-profile.children.cycle=
s-pp.__switch_to
      0.13 =B1  4%      -0.0        0.11 =B1  3%  perf-profile.children.cyc=
les-pp.menu_select
      0.13 =B1  6%      -0.0        0.11 =B1  5%  perf-profile.children.cyc=
les-pp.reweight_entity
      0.11            -0.0        0.09 =B1  4%  perf-profile.children.cycle=
s-pp.xlog_cil_write_commit_record
      0.06 =B1  6%      -0.0        0.05        perf-profile.children.cycle=
s-pp.___perf_sw_event
      0.08 =B1  5%      -0.0        0.07 =B1  6%  perf-profile.children.cyc=
les-pp.avg_vruntime
      0.06            -0.0        0.05        perf-profile.children.cycles-=
pp.perf_tp_event
      0.06            -0.0        0.05        perf-profile.children.cycles-=
pp.place_entity
      0.06            -0.0        0.05        perf-profile.children.cycles-=
pp.sched_clock
      0.05            +0.0        0.06        perf-profile.children.cycles-=
pp.rep_movs_alternative
      0.05            +0.0        0.06 =B1  6%  perf-profile.children.cycle=
s-pp.kfree
      0.06            +0.0        0.07 =B1  5%  perf-profile.children.cycle=
s-pp.copy_page_from_iter_atomic
      0.10 =B1  3%      +0.0        0.12 =B1  4%  perf-profile.children.cyc=
les-pp.xfs_inode_item_format_data_fork
      0.05            +0.0        0.06 =B1  7%  perf-profile.children.cycle=
s-pp.xfs_trans_read_buf_map
      0.06            +0.0        0.07 =B1  6%  perf-profile.children.cycle=
s-pp.xfs_btree_lookup_get_block
      0.07 =B1  5%      +0.0        0.08 =B1  5%  perf-profile.children.cyc=
les-pp.filemap_get_entry
      0.09 =B1  5%      +0.0        0.10 =B1  3%  perf-profile.children.cyc=
les-pp.memcpy_orig
      0.12 =B1  3%      +0.0        0.14 =B1  3%  perf-profile.children.cyc=
les-pp.xlog_state_clean_iclog
      0.07 =B1  5%      +0.0        0.08 =B1  5%  perf-profile.children.cyc=
les-pp.filemap_dirty_folio
      0.07            +0.0        0.09 =B1  5%  perf-profile.children.cycle=
s-pp.iomap_set_range_uptodate
      0.07 =B1  5%      +0.0        0.08 =B1  5%  perf-profile.children.cyc=
les-pp.writeback_get_folio
      0.07            +0.0        0.09 =B1  5%  perf-profile.children.cycle=
s-pp.xfs_end_bio
      0.06 =B1  9%      +0.0        0.07 =B1  5%  perf-profile.children.cyc=
les-pp.io_schedule
      0.10            +0.0        0.12 =B1  3%  perf-profile.children.cycle=
s-pp.xfs_buffered_write_iomap_begin
      0.09            +0.0        0.11 =B1  6%  perf-profile.children.cycle=
s-pp.xfs_btree_lookup
      0.10 =B1  3%      +0.0        0.12 =B1  5%  perf-profile.children.cyc=
les-pp.writeback_iter
      0.09            +0.0        0.11        perf-profile.children.cycles-=
pp.xfs_trans_committed_bulk
      0.26            +0.0        0.28        perf-profile.children.cycles-=
pp.flush_workqueue_prep_pwqs
      0.10            +0.0        0.12 =B1  3%  perf-profile.children.cycle=
s-pp.__filemap_get_folio
      0.07 =B1  7%      +0.0        0.09 =B1  4%  perf-profile.children.cyc=
les-pp.folio_wait_bit_common
      0.16 =B1  3%      +0.0        0.19 =B1  3%  perf-profile.children.cyc=
les-pp.xfs_inode_item_format
      0.08 =B1  5%      +0.0        0.11        perf-profile.children.cycle=
s-pp.__filemap_fdatawait_range
      0.07 =B1  5%      +0.0        0.09 =B1  5%  perf-profile.children.cyc=
les-pp.wake_page_function
      0.07 =B1  7%      +0.0        0.09 =B1  4%  perf-profile.children.cyc=
les-pp.folio_wait_writeback
      0.12 =B1  4%      +0.0        0.14 =B1  2%  perf-profile.children.cyc=
les-pp.iomap_writepage_map_blocks
      0.07 =B1  6%      +0.0        0.10 =B1  5%  perf-profile.children.cyc=
les-pp.folio_wake_bit
      0.13 =B1  2%      +0.0        0.16 =B1  2%  perf-profile.children.cyc=
les-pp.llseek
      0.03 =B1 70%      +0.0        0.06        perf-profile.children.cycle=
s-pp.get_jiffies_update
      0.12 =B1  3%      +0.0        0.15 =B1  2%  perf-profile.children.cyc=
les-pp.iomap_iter
      0.14 =B1  5%      +0.0        0.16 =B1  3%  perf-profile.children.cyc=
les-pp.__mutex_unlock_slowpath
      0.03 =B1 70%      +0.0        0.06 =B1  6%  perf-profile.children.cyc=
les-pp.tmigr_requires_handle_remote
      0.04 =B1 44%      +0.0        0.07        perf-profile.children.cycle=
s-pp.__lruvec_stat_mod_folio
      0.14 =B1  2%      +0.0        0.17 =B1  4%  perf-profile.children.cyc=
les-pp.iomap_write_end
      0.04 =B1 45%      +0.0        0.07 =B1  6%  perf-profile.children.cyc=
les-pp.xfs_trans_alloc_inode
      0.03 =B1 70%      +0.0        0.06 =B1  7%  perf-profile.children.cyc=
les-pp.xfs_map_blocks
      0.15 =B1  3%      +0.0        0.18 =B1  2%  perf-profile.children.cyc=
les-pp.iomap_write_begin
      0.11 =B1  5%      +0.0        0.14 =B1  3%  perf-profile.children.cyc=
les-pp.wake_up_q
      0.14 =B1  3%      +0.0        0.17 =B1  3%  perf-profile.children.cyc=
les-pp.xlog_cil_committed
      0.14 =B1  3%      +0.0        0.17 =B1  2%  perf-profile.children.cyc=
les-pp.xlog_cil_process_committed
      0.03 =B1 70%      +0.0        0.07 =B1  8%  perf-profile.children.cyc=
les-pp.balance_dirty_pages_ratelimited_flags
      0.22            +0.0        0.26 =B1  2%  perf-profile.children.cycle=
s-pp.xlog_cil_insert_format_items
      0.15 =B1  2%      +0.0        0.19 =B1  5%  perf-profile.children.cyc=
les-pp.xfs_bmap_add_extent_unwritten_real
      0.16 =B1  2%      +0.0        0.20 =B1  5%  perf-profile.children.cyc=
les-pp.xfs_bmapi_convert_unwritten
      0.02 =B1141%      +0.0        0.06 =B1 13%  perf-profile.children.cyc=
les-pp.xlog_grant_push_threshold
      0.28 =B1  4%      +0.0        0.32 =B1  2%  perf-profile.children.cyc=
les-pp.update_process_times
      0.15            +0.0        0.19        perf-profile.children.cycles-=
pp.entry_SYSRETQ_unsafe_stack
      0.32 =B1  3%      +0.0        0.36 =B1  3%  perf-profile.children.cyc=
les-pp.tick_nohz_handler
      0.18 =B1  2%      +0.0        0.23 =B1  4%  perf-profile.children.cyc=
les-pp.xfs_bmapi_write
      0.27 =B1  2%      +0.0        0.32        perf-profile.children.cycle=
s-pp.xlog_ioend_work
      0.36 =B1  4%      +0.0        0.41 =B1  3%  perf-profile.children.cyc=
les-pp.__hrtimer_run_queues
      0.26 =B1  2%      +0.0        0.31        perf-profile.children.cycle=
s-pp.xlog_state_do_callback
      0.26 =B1  2%      +0.0        0.31        perf-profile.children.cycle=
s-pp.xlog_state_do_iclog_callbacks
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.xa_load
      0.00            +0.1        0.05        perf-profile.children.cycles-=
pp.xfs_iext_lookup_extent
      0.02 =B1141%      +0.1        0.07 =B1  5%  perf-profile.children.cyc=
les-pp.up_write
      0.31 =B1  2%      +0.1        0.38 =B1  2%  perf-profile.children.cyc=
les-pp.xlog_cil_insert_items
      0.41 =B1  4%      +0.1        0.47 =B1  2%  perf-profile.children.cyc=
les-pp.hrtimer_interrupt
      0.41 =B1  3%      +0.1        0.48 =B1  3%  perf-profile.children.cyc=
les-pp.__sysvec_apic_timer_interrupt
      0.13 =B1 12%      +0.1        0.20 =B1  8%  perf-profile.children.cyc=
les-pp.xfs_log_ticket_ungrant
      0.30            +0.1        0.38 =B1  3%  perf-profile.children.cycle=
s-pp.copy_to_brd
      0.56 =B1  3%      +0.1        0.64 =B1  2%  perf-profile.children.cyc=
les-pp.sysvec_apic_timer_interrupt
      0.35            +0.1        0.43 =B1  3%  perf-profile.children.cycle=
s-pp.brd_submit_bio
      0.95            +0.1        1.04        perf-profile.children.cycles-=
pp.mutex_spin_on_owner
      0.11 =B1 11%      +0.1        0.21 =B1 12%  perf-profile.children.cyc=
les-pp.xlog_grant_add_space
      0.44            +0.1        0.55 =B1  2%  perf-profile.children.cycle=
s-pp.iomap_write_iter
      0.19 =B1  5%      +0.1        0.30 =B1  6%  perf-profile.children.cyc=
les-pp.iomap_finish_ioends
      0.21 =B1 11%      +0.1        0.35 =B1 12%  perf-profile.children.cyc=
les-pp.xfs_log_reserve
      0.22 =B1 11%      +0.1        0.36 =B1 11%  perf-profile.children.cyc=
les-pp.xfs_trans_reserve
      0.40 =B1  2%      +0.1        0.54 =B1  2%  perf-profile.children.cyc=
les-pp.xfs_iomap_write_unwritten
      0.57            +0.1        0.71 =B1  2%  perf-profile.children.cycle=
s-pp.iomap_file_buffered_write
      0.25 =B1 10%      +0.1        0.39 =B1 10%  perf-profile.children.cyc=
les-pp.xfs_trans_alloc
      0.13 =B1 11%      +0.2        0.32 =B1 16%  perf-profile.children.cyc=
les-pp.schedule_preempt_disabled
      0.23 =B1 13%      +0.2        0.46 =B1 12%  perf-profile.children.cyc=
les-pp.sb_mark_inode_writeback
      0.25 =B1 12%      +0.2        0.50 =B1 12%  perf-profile.children.cyc=
les-pp.sb_clear_inode_writeback
      0.59 =B1  2%      +0.3        0.85 =B1  2%  perf-profile.children.cyc=
les-pp.xfs_end_io
      0.58 =B1  2%      +0.3        0.84 =B1  3%  perf-profile.children.cyc=
les-pp.xfs_end_ioend
      0.46 =B1  6%      +0.3        0.72 =B1  6%  perf-profile.children.cyc=
les-pp.md_end_clone_io
      0.30 =B1 10%      +0.3        0.57 =B1  9%  perf-profile.children.cyc=
les-pp.__folio_start_writeback
      0.11 =B1 11%      +0.3        0.38 =B1 13%  perf-profile.children.cyc=
les-pp.rwsem_down_read_slowpath
      0.43 =B1  7%      +0.3        0.72 =B1  7%  perf-profile.children.cyc=
les-pp.iomap_writepage_map
      0.16 =B1  9%      +0.3        0.46 =B1 11%  perf-profile.children.cyc=
les-pp.down_read
      0.44 =B1  8%      +0.3        0.76 =B1  7%  perf-profile.children.cyc=
les-pp.__folio_end_writeback
      0.52 =B1  7%      +0.4        0.88 =B1  6%  perf-profile.children.cyc=
les-pp.folio_end_writeback
      0.54 =B1  7%      +0.4        0.90 =B1  6%  perf-profile.children.cyc=
les-pp.iomap_finish_ioend
      0.92 =B1  2%      +0.4        1.30 =B1  3%  perf-profile.children.cyc=
les-pp.iomap_submit_ioend
      0.72 =B1  3%      +0.4        1.16 =B1  5%  perf-profile.children.cyc=
les-pp.xlog_cil_commit
      0.82 =B1  3%      +0.5        1.28 =B1  5%  perf-profile.children.cyc=
les-pp.__xfs_trans_commit
      0.92 =B1  4%      +0.5        1.43 =B1  6%  perf-profile.children.cyc=
les-pp.xfs_vn_update_time
      0.94 =B1  4%      +0.5        1.46 =B1  6%  perf-profile.children.cyc=
les-pp.kiocb_modified
      0.96 =B1  4%      +0.5        1.48 =B1  6%  perf-profile.children.cyc=
les-pp.xfs_file_write_checks
      6.96 =B1  2%      +0.5        7.49 =B1  3%  perf-profile.children.cyc=
les-pp.intel_idle
      1.45 =B1  4%      +0.7        2.15 =B1  5%  perf-profile.children.cyc=
les-pp.iomap_writepages
      1.46 =B1  4%      +0.7        2.16 =B1  4%  perf-profile.children.cyc=
les-pp.xfs_vm_writepages
      1.48 =B1  4%      +0.7        2.18 =B1  4%  perf-profile.children.cyc=
les-pp.do_writepages
      1.51 =B1  4%      +0.7        2.22 =B1  4%  perf-profile.children.cyc=
les-pp.filemap_fdatawrite_wbc
      1.51 =B1  3%      +0.7        2.23 =B1  4%  perf-profile.children.cyc=
les-pp.__filemap_fdatawrite_range
      1.61 =B1  3%      +0.8        2.36 =B1  4%  perf-profile.children.cyc=
les-pp.file_write_and_wait_range
     85.48            +0.8       86.24        perf-profile.children.cycles-=
pp.xfs_file_fsync
     87.06            +1.4       88.49        perf-profile.children.cycles-=
pp.xfs_file_buffered_write
     87.19            +1.5       88.65        perf-profile.children.cycles-=
pp.vfs_write
     87.20            +1.5       88.66        perf-profile.children.cycles-=
pp.ksys_write
     87.66            +1.5       89.14        perf-profile.children.cycles-=
pp.write
     87.50            +1.5       88.98        perf-profile.children.cycles-=
pp.do_syscall_64
     87.50            +1.5       88.99        perf-profile.children.cycles-=
pp.entry_SYSCALL_64_after_hwframe
     56.76           +13.7       70.44        perf-profile.children.cycles-=
pp.osq_lock
     57.89           +13.9       71.74        perf-profile.children.cycles-=
pp.__mutex_lock
     60.36           +14.6       74.96        perf-profile.children.cycles-=
pp.__flush_workqueue
     61.49           +14.6       76.10        perf-profile.children.cycles-=
pp.xlog_cil_push_now
     68.74           +14.8       83.60        perf-profile.children.cycles-=
pp.xfs_log_force_seq
     64.98           +15.1       80.03        perf-profile.children.cycles-=
pp.xlog_cil_force_seq
     22.30 =B1  3%     -13.1        9.22 =B1  4%  perf-profile.self.cycles-=
pp.native_queued_spin_lock_slowpath
      1.91 =B1  9%      -1.4        0.46 =B1  5%  perf-profile.self.cycles-=
pp.intel_idle_irq
      0.24 =B1  2%      -0.1        0.18 =B1  4%  perf-profile.self.cycles-=
pp._raw_spin_lock_irq
      0.18 =B1  4%      -0.1        0.12 =B1  6%  perf-profile.self.cycles-=
pp.available_idle_cpu
      0.37 =B1  2%      -0.0        0.32 =B1  2%  perf-profile.self.cycles-=
pp._raw_spin_lock_irqsave
      0.20 =B1  3%      -0.0        0.17 =B1  4%  perf-profile.self.cycles-=
pp.update_load_avg
      0.14 =B1  3%      -0.0        0.11 =B1  3%  perf-profile.self.cycles-=
pp.__schedule
      0.09 =B1  4%      -0.0        0.07 =B1  8%  perf-profile.self.cycles-=
pp.prepare_task_switch
      0.10            -0.0        0.08 =B1  4%  perf-profile.self.cycles-pp=
.task_h_load
      0.10 =B1  5%      -0.0        0.08 =B1  6%  perf-profile.self.cycles-=
pp.__switch_to_asm
      0.08 =B1  4%      -0.0        0.06        perf-profile.self.cycles-pp=
.sched_mm_cid_migrate_to
      0.07 =B1  5%      -0.0        0.05 =B1  7%  perf-profile.self.cycles-=
pp.menu_select
      0.09 =B1  5%      -0.0        0.08 =B1  6%  perf-profile.self.cycles-=
pp.switch_mm_irqs_off
      0.06 =B1  7%      -0.0        0.05        perf-profile.self.cycles-pp=
.__switch_to
      0.07 =B1  7%      -0.0        0.05 =B1  8%  perf-profile.self.cycles-=
pp.enqueue_entity
      0.10 =B1  4%      -0.0        0.09 =B1  7%  perf-profile.self.cycles-=
pp.update_curr
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.r=
ep_movs_alternative
      0.06            +0.0        0.07 =B1  5%  perf-profile.self.cycles-pp=
.xas_load
      0.08 =B1  4%      +0.0        0.10 =B1  5%  perf-profile.self.cycles-=
pp.__flush_workqueue
      0.07            +0.0        0.08 =B1  5%  perf-profile.self.cycles-pp=
.iomap_set_range_uptodate
      0.08 =B1  5%      +0.0        0.10 =B1  3%  perf-profile.self.cycles-=
pp.memcpy_orig
      0.05 =B1  7%      +0.0        0.07 =B1  5%  perf-profile.self.cycles-=
pp.down_read
      0.08 =B1  5%      +0.0        0.11 =B1  4%  perf-profile.self.cycles-=
pp.__mutex_lock
      0.09 =B1  4%      +0.0        0.12 =B1  6%  perf-profile.self.cycles-=
pp.xlog_cil_insert_items
      0.03 =B1 70%      +0.0        0.06        perf-profile.self.cycles-pp=
.get_jiffies_update
      0.02 =B1 99%      +0.0        0.06 =B1  7%  perf-profile.self.cycles-=
pp.__folio_end_writeback
      0.15            +0.0        0.19        perf-profile.self.cycles-pp.e=
ntry_SYSRETQ_unsafe_stack
      0.10 =B1 12%      +0.1        0.16 =B1  9%  perf-profile.self.cycles-=
pp.xfs_log_ticket_ungrant
      0.00            +0.1        0.06 =B1 11%  perf-profile.self.cycles-pp=
.balance_dirty_pages_ratelimited_flags
      0.30 =B1  2%      +0.1        0.37 =B1  2%  perf-profile.self.cycles-=
pp.copy_to_brd
      0.95            +0.1        1.03        perf-profile.self.cycles-pp.m=
utex_spin_on_owner
      0.11 =B1 11%      +0.1        0.20 =B1 14%  perf-profile.self.cycles-=
pp.xlog_grant_add_space
      6.96 =B1  2%      +0.5        7.49 =B1  3%  perf-profile.self.cycles-=
pp.intel_idle
     56.27           +13.5       69.81        perf-profile.self.cycles-pp.o=
sq_lock




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
