Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAB9EA3F36
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Feb 2026 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YxWVOXyvdypc8GSBL8G8ChetQZZ42ahad8Li4S8Pak=; b=j4KFaMJhkXJZgV
	pXTphuZEtgKiz5nOPQOAvUxk6X5N6qiixSiIY98AsXzp8E63aIwqdjNEFvhWfkZQuSv2rf54NvM4u
	RSutqzi2Y3SApqN2PwJYbhdfq6UxjQSawVdLrKHqNexn05PqDEGl210Z3uGmWM95lFhAwE0cbYMGp
	ETPHAkVjtWS84H/9bNzp1wdlBo7McawwKTbA7NrfmyW3UQfL/Lgc7rAJu+v8Zdq+zufSVsbeRghDI
	nU+d8odw154sQndRbi4VKrkV4KYaylmVcNdQM6LFcPjxgsJhTOlkE7zUZ1Q1+WWxoxgmhGVx6h7Rv
	a4i+UauiUaqsCUivvUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkd4-0000000Gokv-2165;
	Tue, 10 Feb 2026 10:05:58 +0000
Received: from mail-eastusazon11011019.outbound.protection.outlook.com ([52.101.52.19] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkcz-0000000GokL-0yUn
	for linux-mtd@lists.infradead.org;
	Tue, 10 Feb 2026 10:05:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNRGaxvmEABN6+CcgfxN1oEGa41oQsFXJvdadZf2DOCV6zL2ij9ghcM14at7QqNpbSfH7ayCB6wHPknbzwc5Ua4O3O25BOdcoRKn8zk2YvRXXWNr4LMaHqJCacBbJAhMvFZ6W+CElS23meGmp1oA2KD+tKaDGSc/f5n4mrhtMbE234fQuObPtQjMYk1JCFZrXsQZXdzLXwS31467nwJtYfAj8jksj7qRek6bvQcrtWHKohH0lep4xgbGMgxAI2iTO9lEkx75kxAuAKBKumuuR3T6mmP6NGs0Sd392PDmCO7w6hXervhymsoZF/PANcKHxLSfe/ApAV3v5LiJiTmDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZZedvrQXs9jCVkkxBzuNLgG/cwlqy6DTlOhhPx8KqM=;
 b=ojjsT458J9etp6Owy7pUaUkbpdtoW459ffdpY/0E7ghtoM1cb66/PaEUXsLg/bX3v+QOfqVP/cwoAIUAJYjF9VRrvbL4LFOgWwm+niR3RepiCkFTuDln1me44ldNmRm+5D1fviyg6CNFveiZDPCvpKwrCtiLr7jhjS3o3zLlsvnukGnI9W7f+K/4CfN2BSVRQ34Z886PeSTd4dBlH0GYIYzmm8D6U9vp7bRZeAuo0QizR/gd3dKDRffVW6I+Cx4fddK923IdZLd96Wjkmv0aJvp/yYg03Up4tQOG7jR6s9cLGiV1eXSVS49/P7fqE0xivfrg46MhlLFB36uIxLsvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nod.at smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZZedvrQXs9jCVkkxBzuNLgG/cwlqy6DTlOhhPx8KqM=;
 b=wxhojvnsvY/GXZU2SREbNSQPs6tSi7chdeqaHDS6lUZuJer+/nWHitpOK51hOLL2JZXxvLzbPRJY/4QhE1VdkvKwuc02F7MqltQcxILr5RrZpc1KJTtDcZyRIC0DmaCG4HC/axgck///BdCPY96sSl9p9FdclsoWHWUibfEHGP8=
Received: from MN0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:208:52d::24)
 by MW4PR10MB5862.namprd10.prod.outlook.com (2603:10b6:303:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 10:05:46 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:52d:cafe::cb) by MN0PR04CA0025.outlook.office365.com
 (2603:10b6:208:52d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:05:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:05:45 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 04:05:42 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Feb
 2026 04:05:42 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Feb 2026 04:05:42 -0600
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61AA5e4Q3290220;
	Tue, 10 Feb 2026 04:05:41 -0600
Message-ID: <afc434a2-07d0-4a25-803a-4a42a4da8e3d@ti.com>
Date: Tue, 10 Feb 2026 15:35:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out
 do_write_buffer_locked() to reduce stack frame
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>
References: <20260124133730.3454241-1-andriy.shevchenko@linux.intel.com>
 <202601250653.LXBUL5W6-lkp@intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <202601250653.LXBUL5W6-lkp@intel.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|MW4PR10MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: effeb552-1327-4b28-527f-08de688bf510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHNIazMxWDFoNGhuVW1ZaVFtOFhESmt0cmViU0lnRmhSeHNSVU0xdDV4VjFv?=
 =?utf-8?B?VXoxL1lmQW9SVERGVmFEZjVZVGRNSS9zbGlBZWdKYmgySnAzZUJUblU1THpx?=
 =?utf-8?B?LzVqYUFab1BJUmZZdXBFQ2xGdC9jbVh5T3YraHlkaEtlQThpZzh5ZXZQVHRI?=
 =?utf-8?B?anY0TXVOMXp2WEl4bjFWbkhPaE1RS0ZBZnJsalhFL0pEbjhkNS92b2ZqQ1Rk?=
 =?utf-8?B?RTNLT2tFZzcwWUMwbTNMVWtaZ1VHSXliM0FGZE5MTDZ3NVk5blpYMVErMVNn?=
 =?utf-8?B?S0V5MWJPanRZcUpQQ3VwK3VFM0o1ZjNSa1hoZDYyOU1JMHZ0NlZrclE4bW4x?=
 =?utf-8?B?bFY1bnpmV1RSL1o4SERINXRnQ21DZ0ZYQ0xEeDJJcjlXTkNGcFRJcXptU2tY?=
 =?utf-8?B?V2tQVHJNYUQrY2xTWDZFQ2t1NlNzUG9FUm5ZNHdldEkwVkcxdnlDQUxnb3Zl?=
 =?utf-8?B?a2NNS1Uyc2g5WUpZK3o3dEtXTk5PbWliNy84WXE2S3p4V1ViNGo4UVR0cGZh?=
 =?utf-8?B?Y2FnM2tHNmRUV1JqdjlXQ293ZHh0N2xXZmg0OEJ6azBTNkkzNFczdWZEVTIw?=
 =?utf-8?B?VzlGWFRIQ01ZL1Z4aTViWkVBOEJjN0lzMEpBa2s3Q0JYUit2M0VKbWxNSXpr?=
 =?utf-8?B?UGJ0RGZOdHNZdWZHYmpxdkJ2eWRtNDYxYldGcmZkK1VubWhwWXlPa3JhTkNW?=
 =?utf-8?B?eTFXT2VvUVRGdjhCNzdWcmlJd1c0ZWFabFVMZG5jOFJGUFJVd3lyWGpIbldv?=
 =?utf-8?B?M0tpSEhpc0NyTWhPSlAveXRRNXRRVXVVeExSNWZkdWFqT3RCNmZxK3JWTDFi?=
 =?utf-8?B?VjBOVzEyekNKcTdiS1Z2K0VtclFvd3drRlpEb292eGNqdmZPOW53RnkzMHJo?=
 =?utf-8?B?M3M5ZEhvZWV1N3B1R2VVbzdITzJ3R0FzTVdsNkRjNGt0TEt3ejJSWTNFL2ZH?=
 =?utf-8?B?Uk9ybXdrT2FPWmFOVlBFOFcyOG1hUnB1N0NVcER5eW56cWdEV2dlSVJ2Rk8w?=
 =?utf-8?B?WG1iaHJMWUZHeFJzNURZMUJsK1JXMEJ2M3lwNDFGZGtlT3BlQW82aXRMdkVa?=
 =?utf-8?B?NHBUMEk4cDU0c0ZTczlkcXREK05ySmNnWDdCcVpTa3ZwZmZoa0w2TytkZmpN?=
 =?utf-8?B?STZFWXIvMWg0OHdjWHloZTJwRURPWW5nM3NIOWJVQWRLcTB4dnZXdklDU0FV?=
 =?utf-8?B?aXNRZ1d6b3hDZzNwem5JNlNrVUNRd0NJd29xNlA4aHJWZFFIKzVqWmd1WFFi?=
 =?utf-8?B?d2d2YjBzb2REb1RVMFJyZ1Zac29RWFh0eXJTKzNUYjEzV3BKVjNrNFNMZnYx?=
 =?utf-8?B?NEZNd3JHOHlMMkluY1UxektFREd5TUZMTlpyQkplT2JaVXg4cHJQOWJiNDVF?=
 =?utf-8?B?R0d2dlhQZzRacW1wMEZnejJDQVZoTDV4VlB1a01xNGt4TU43R2JNUS91d09L?=
 =?utf-8?B?bSt4TnREMkZhcjFVUVIraFNPUCtTSDNjMjNOOEZkR0o2aUpHZWhBQ2RidDI3?=
 =?utf-8?B?N0hBSDFsV2NTTktOTHJXRGc2NUtiWW14Z0JWZ2dnVFYwYXVvc0JIbzN5L1Y4?=
 =?utf-8?B?YVd3eE04MTBsak1iWmhNeE5IK1lNb2lzazc0RHdMQ2RHbFlPREFrWFg5UkxY?=
 =?utf-8?B?UEp0akdGRXVnNE9TSFRNOUhhdTVBM2tZOFhyTXpCeTZtRk8zZlBtRkd3NDJD?=
 =?utf-8?B?USswVGRoWUtRcUZlSHZDakhCa1JmS0xqZ3BWRTRKdVlHdkpwZktKS3pPd240?=
 =?utf-8?B?S21LVmwxYnBHUjNHSEN0cVF3eUQvUHc1dzBBTXVjV3FoajZmcTRQWnVrcVJq?=
 =?utf-8?B?ZUVkUWlJTWJ1b2gxWE1UUDhZNG4yK3ptU1pSaEIyTW10WXBSVmZXaFNrMG41?=
 =?utf-8?B?SjRmMi85eVhxK1p1Vk5MNW1uUitKcWJsZHFaT3QxWWFOaEZtQVUzbkEvbHlP?=
 =?utf-8?B?N2hoSEVBOGlVOEkvOWFSZjloOHFiWnRJTlhySW4weFV6amZXNWxKVmkzOWNE?=
 =?utf-8?B?VkNtU1g0U1JrUTdmQXFCM3pFTmUwbDljYmxrUnVpMjl6UVNyam9zOURsRTFO?=
 =?utf-8?B?YmVFRzM4cGlvYllIeFdKQ1o4b2JZK2xGR3l5c1k2TE02MHViQTJxenpEYUNZ?=
 =?utf-8?B?anRJekxIdEFXSmJCZnhjZjhwajNlNllHWnFqK1ZzNWNiTldaTjRkTG1CVE9C?=
 =?utf-8?Q?+Zs36iOfAbrvAr89ABcl/Ng=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ytwc665VhDUQbxTgSKR/O6XlyP9aslyO9u1qeKrMKsphvUaanccqyyKuT29P9aSUx6aTBcL0nRyX/D70w/HxgTyiLqn+3rhmkVem4Xx4sUtwire92Y5l5RggplpWOFdx2Ndyzisb1dyJNe+LjgOrCBSUpw/piDqHjSOLSUG3qJgvqI+Uxdfbt2dRul3uydgNFVilEAanIj0Y7+nxwTrB8EDDFw6AMYlZwe4wZQ8QaB8GkBV+lC/93u6nUgYTrr+3Xd6eBM306T9e4YGyfThnfMah2xNsT7oVq13RTmZkZjvsUD+dydROpgyAQFp/Xw0SN03+H1Vu3EmKhhg2OiW8/JI84+YwJFiv5WgYJCWhsbouGLz4nPMP+2S1T63QpEGk26iGWKUZ2w4EAuMAxwObn7GEwMM0OhlO1qT1LzN+EPR5v/ULEEODUnn2iaDbGeFt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:05:45.3248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: effeb552-1327-4b28-527f-08de688bf510
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5862
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_020553_379291_FC0A8662 
X-CRM114-Status: GOOD (  14.26  )
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



On 25/01/26 04:11, kernel test robot wrote:
> Hi Andy,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on mtd/mtd/next]
> [also build test WARNING on mtd/mtd/fixes linus/master v6.19-rc6 next-20260123]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/mtd-cfi_cmdset_0001-Factor-out-do_write_buffer_locked-to-reduce-stack-frame/20260124-213936
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
> patch link:    https://lore.kernel.org/r/20260124133730.3454241-1-andriy.shevchenko%40linux.intel.com
> patch subject: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Factor out do_write_buffer_locked() to reduce stack frame
> config: xtensa-randconfig-002-20260125 (https://download.01.org/0day-ci/archive/20260125/202601250653.LXBUL5W6-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250653.LXBUL5W6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601250653.LXBUL5W6-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/mtd/chips/cfi_cmdset_0001.c: In function 'do_write_buffer_locked':
>>> drivers/mtd/chips/cfi_cmdset_0001.c:1734:6: warning: unused variable 'initial_len' [-Wunused-variable]
>      int initial_len = len;
>          ^~~~~~~~~~~
>>> drivers/mtd/chips/cfi_cmdset_0001.c:1733:16: warning: variable 'initial_adr' set but not used [-Wunused-but-set-variable]
>      unsigned long initial_adr;
>                    ^~~~~~~~~~~
> 
> 

Copying my response here again from [1] , as this LKP report seems to on a 
different thread:


Things become tricky with CONFIG_MTD_XIP enabled. With
XIP_INVAL_CACHED_RANGE() moved to caller, initial_adr becomes unused
when CONFIG_MTD_XIP=y

One solution maybe to move calls to XIP_INVAL_CACHED_RANGE(),
ENABLE_VPP(map) and xip_disable() and their complementary functions to
do_write_buffer_locked() as these calls need to repeated for every
writes (if and when we find need to reuse do_write_buffer_locked())

Alternately move INVAL_CACHE_AND_WAIT() and everything after that to 
caller


[...]

[1] https://lore.kernel.org/all/4d4ab8af-3e09-4e48-a79d-0af3453600c3@ti.com/

-- 
Regards
Vignesh
https://ti.com/opensource


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
