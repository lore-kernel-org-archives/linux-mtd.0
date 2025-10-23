Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185A5CCD1AB
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Oct 2025 03:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zjUEZm12a2tFDdBoO+GhJMflPh1bR6iiGNgtQzQiLkI=; b=2QENe3yHqm1sdZ
	cGNgmEHT7zQlTXGx4ktHzoyNAxcYOHI9zAeM7L2FuMN3u0UndFaLFJLem0mOZd3/NmV+9TsNJtZcT
	XVK7V0mcyUsW8oOHttICZFWe5kuYYPHGWBmltrZyKkvuBOVGGEJIgwQBeBaNYTBd7kELL7/oU+QgE
	0O/3YkanniKW8APnRtRicsy206WRegMUYzczdS6GkcI95eMaIpfujAK2pXeRdbaVC2QFWMgH2Ni3r
	Z6bAKn2xaxvVl0ZWl72mcBQVwSVw7yjeHDKHV9cryHS7O72LQVrEQOmJBx0TmRklXaBSyZqkDbvb8
	ZSSrWSzJ88Nt/tOD/uLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBm5k-00000004xns-3Xfq;
	Thu, 23 Oct 2025 03:34:23 +0000
Received: from mail-westcentralusazon11013069.outbound.protection.outlook.com ([40.93.201.69] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBm5h-00000004xnE-1ygh
	for linux-mtd@lists.infradead.org;
	Thu, 23 Oct 2025 03:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKmA6WBovhG/olPc3ka91q262XtrL6i21NA11KJxFKjBJxiANV8PmYGi8+dpsujqSkUMVMgEabRsacd5ty/VmYTYx0FDsMAuwJoQPhfRDUqAwMiZkk74+vcMkIQzKQXbtI/XQYHW2q3ilDagX0d0DV0mQm7B9bITFE6RZ2v7oJgyfaIuvdh4dfMWiGZda1MNi9f/FaLjgYw6zQt5UnVA1hbjiIOyPoNo2JqtED9xPp8cuYmQFhnyLGgjjWVWtMWflC05vDt65xG2KThPdJOahzVMCClAtLNVIGxsEbcF6l0+X/8NJ2eO93Ocsw4wJBdF8+DdiPKVrAHn7JUzhjCe/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ggPNp4EuR+acxkZM50RjJf1lfUdyHAHOWZwDaqcTK2w=;
 b=szETlM/44pLYqPwmw29MEVMUPqmirEvwUawhBlqWiBvAunzr2O3clgOIwEvH6UurtOB+iTLvIffHtfGcYDF/Dhc1RqhTttMm0KGoMesa24icp+UFzEP+QXSl5ActBUASP0mhzG7GskM9CTOVCvHnYf5anoOl7pDIf3IWo6rDWIan9T+Lq61PTS2uosO3pUUUZ+O/V1nL6dYq2sFbWB8kpwDIDPoK5I39uPGyNwZZc6wZYaw2WhfUKCfSL0mq0eSrwwX4GXTBRqoI5jxYeWI28w2cfblkoDAURNxbB5M1JikaPJhaYaQS5yGAoGq5VNBYmCAQetcHcR6mOhEtkt/HTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ggPNp4EuR+acxkZM50RjJf1lfUdyHAHOWZwDaqcTK2w=;
 b=nGyk9e9qVod81SFa8hznDeWWfP1lKu8m6lBf8kP+Gh8DUT+hSzAFzRY9TcCzFIobnYiVPVMuA9yHoWVWD5pLNscon12dqu3wSW3NgaKq72yKXrhZaB5DSM2T60sOoPVDsyPg6h5BNGVwN6CEPgrDv6VvV5+A9q+2Hm/QeZwdEz7f57QLK1FyE46/fWTn77G/0oGig4oIhYnMykb1K73uUJmhPb/Br+FGCMf2Tp/AuVlQBHHxg/JLQ6JU4QZsG8HQJHWpbFk3Cl8oUClXpV1z8nExmHcL4fECDgytbHcfMlb6f2O0gmXlUF/lTdUXFM+FFvx/RrCUVwOEHcpVRwZmqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BL1PR03MB6037.namprd03.prod.outlook.com (2603:10b6:208:309::10)
 by CO1PR03MB5811.namprd03.prod.outlook.com (2603:10b6:303:91::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 03:34:08 +0000
Received: from BL1PR03MB6037.namprd03.prod.outlook.com
 ([fe80::9413:f1a2:1d92:93f1]) by BL1PR03MB6037.namprd03.prod.outlook.com
 ([fe80::9413:f1a2:1d92:93f1%3]) with mapi id 15.20.9228.015; Thu, 23 Oct 2025
 03:34:08 +0000
From: niravkumarlaxmidas.rabara@altera.com
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: cadence: fix DMA device NULL pointer dereference
Date: Thu, 23 Oct 2025 11:32:01 +0800
Message-Id: <20251023033201.2182-1-niravkumarlaxmidas.rabara@altera.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: KU0P306CA0067.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::18) To BL1PR03MB6037.namprd03.prod.outlook.com
 (2603:10b6:208:309::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR03MB6037:EE_|CO1PR03MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: 33398008-413a-4100-7a52-08de11e5060c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XD2en/RwqYukAeXqI5I39p/175R0Dej+gftGcmvi9yUbdprpsuPmGTyfb6oo?=
 =?us-ascii?Q?JdDrI6SjY7oT8sVny01Gh0uJ1c6u83slD2pYKHiSvGiu5l3QZw/04iDbc1BL?=
 =?us-ascii?Q?qkV4FP3JZ6Pxti3Ypo8n8XiRlOjG/l5Y79rm+U2XsrQR7sfO79M8lguUlVrs?=
 =?us-ascii?Q?yweVmM9YVzttXVVXKDDUSirwBSN0sww9DgAiN5qM7YkVdNr5ZzTpLZD0BRGK?=
 =?us-ascii?Q?ftPM/kjBiKoT1RVvTBpROJBj14kROrUO06iC4SIYYd9W6HJ5p4KqdFvvS2An?=
 =?us-ascii?Q?t1/4ILyMm+LjBjxdoGpUMQ4MIYqu09IBE4A8Me2NihBoo2LK6NtSTcuiJFN+?=
 =?us-ascii?Q?tlOiCjV6Z1yaVIhuNefS46HMDDzwgdpbPaZNwQu7AlQQ9HRHSxDRpqzFmLA+?=
 =?us-ascii?Q?6YuPBSsEbM9+jQjxvVJ/dMbNWhmjGACaeYYbnqY09+rVaEAfc7UTh3AvjadN?=
 =?us-ascii?Q?Hv2o/MkomPnCjXH0q5ooF2u5xcD0FUt5fuefXGZrX391zj1D3jZJ24JnXEOp?=
 =?us-ascii?Q?JOWAMEelmFwREl75FpxCrv5leI/BYA+0ixVvuuINBbxNIzAtW9rOESOpsO3j?=
 =?us-ascii?Q?VNiHqsiOMxNa/YH3TqKHTP4IrOgS7m8hi/qo9Mdl/76yGxFnqQ2m8Nr/BDNC?=
 =?us-ascii?Q?EXRh6GuMjsfsosBN6qMyC/FZkTdR4bckTFzvmEBKFgWdrrzcrEM4dBkfPBKX?=
 =?us-ascii?Q?ZHSgy3He4AFALdrtB3h9Bu0sDsGfhygo+zuuSETfpQpWYeqlg3+Q+UTvKSig?=
 =?us-ascii?Q?HS4RSmsdqBaG+I9TvINDulcr/TLSqPbe8AsjTBf7ocWa/c25eHqVeVSe8BOW?=
 =?us-ascii?Q?pJ2l0OelzAJRwANXLOTlccvxOIQcUrz1slMTBqC1VE62BNOJwccXw6hYlgWN?=
 =?us-ascii?Q?huhqD9nf3753EHhX45l4O9It4Ybth5lbeKNC8aCfeNkZNvf0ua0smIqaOCs/?=
 =?us-ascii?Q?c2KFaaXmIEq9jQLfxmUQWU417uy3Z78EP7PKUHB9mYUmHPxplrGTNZQAiUAP?=
 =?us-ascii?Q?mn3I13lDbLn5KOLbOgXAT9QeUW+8FDjaBnv/hvN0h/kCW7us7rJfkwEErir0?=
 =?us-ascii?Q?LgMDN+v+YqL+RZfN+rnzBNf9Kaf3j0dlL5mpGhNVNoglq0E457KZSyZpMCyf?=
 =?us-ascii?Q?rW1RauxjZn3hyQkuaqWuaROSM5Wmfv9c6SZsYIj4+FLcb20PoESQGlMj5Vb3?=
 =?us-ascii?Q?ZVzV/kyeljV1pKPfdkRXM2EDExOrdcBdh5lIZgGzFf2DiSQ12SueDpha2JJG?=
 =?us-ascii?Q?9Bm3As36dFK/pTNMpr1hsK8Xyl06H12+ZI08YF0OGJ2Csypye2Rp5ow9lBUu?=
 =?us-ascii?Q?ccgHLHaLB9GfTIg4r05gyyhwbe72FkACXQQgzK2EJuyS+0cSBwMuH3npcVZG?=
 =?us-ascii?Q?xkipUq/0f0N7pD9uKl5Y+Z0Kkb6DoN3clXXUpKf4x3pJ678Syu2mLT+hzRsc?=
 =?us-ascii?Q?TlraX0pRUdVmssIDLbOGdJ3IeThex8+u?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR03MB6037.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+8ysbvZB0wOoL0wjpTdXS9d9dqQK1HhgxwSBU+hJaDvH8SPzf+1958v+bfW?=
 =?us-ascii?Q?Do1wPSHUCPaWGU06L7mhbYYWI5rPPYUQW0n4veyj70+IV83M06/yOfvyBJLo?=
 =?us-ascii?Q?PW5TeCAcMmDAfp2XfQ5gRIBWjLx8fbX95kcUbfYxRnDgmoqDIIu4ZJzf+5tS?=
 =?us-ascii?Q?ofivLHAcm2atLFt1Rf9KwXGP+PaYNiGNWo+ZELLcSibpqkemyiOYb0OJDSxf?=
 =?us-ascii?Q?KVJ64PhSbhhb0wVv6FRYTQ9oZZiq6FdyxjuixO3G07Yf7Y3/GJmyJORLeRwX?=
 =?us-ascii?Q?6TSRfYy2uFkdERtRWGMm7EftUEiJQ8hXbEIelp7B623LAtSDD8eo65m0riD5?=
 =?us-ascii?Q?kfiiP+QhL/lnfeEpjx6iO8MznWa7fXAkp1x2Iowqt7QJCWMgZdD11h7KxY6l?=
 =?us-ascii?Q?Kt2zfUrClOqRxgR3kLULCL5KzHDWJrMelfyUqFbT/H9Cqn2sHLzN0GiVy2nb?=
 =?us-ascii?Q?sIJ64Oc/z0/CLfwdsHup++FsqgP4GeBOIXkV6hv1ht3szzwW37PibO6iKKVu?=
 =?us-ascii?Q?yaIlZUr7ML85/FWmIM2tbmrDMnZUT7RLXUSqO/eFZwQaRFUuhROu2K50XO+5?=
 =?us-ascii?Q?PwzFXoRCrVCz/6lBYNn4gkChusb9hy7PFomElUykatYRNDpbe5+5jggwCKsb?=
 =?us-ascii?Q?CP4yCNsv2ySHWjh5z/34qozU+h4G9Ga1MPHUM5pKOMiSFhSWSYNfhzICVmuP?=
 =?us-ascii?Q?1sTrYQRAH7VNsJZ0TXplsmKkaMk3KNEPK4pzVIKm1UpQdjMn52tClsk/BKW+?=
 =?us-ascii?Q?83AcDWyriN5LR9uOWvqFRz4YV3xaCWizeT+ogSoGzYZP8IuiCf1Qe+Sj27hQ?=
 =?us-ascii?Q?Cf9+hCJPZ1MMiQAKHZ5cZodIOoDisCiUo+lFJbCPd3rUFts4Rj1UUHWiPDJs?=
 =?us-ascii?Q?1q+9dLXw9eYRkMgPj/GbtW2N8wPrR0csyZlE0BytKcEJS4NflwYyddQIdQs6?=
 =?us-ascii?Q?NrwiG2Wde4/Yfc+ZIjuU2WlomN8dM+jPus0/f3oUvvLiC7P+2tSrjII63UTx?=
 =?us-ascii?Q?qa8T6AEO3AuVl2A4r2neOjD+x3JykLIwrhd6YQVpYjyV/R5SXJTNjARtjGKZ?=
 =?us-ascii?Q?uQ9OtF7RhL1Pd1+q+wlohcniwgauaqcj9nq2I1q15rnAaHnZfvTTsngZfKFS?=
 =?us-ascii?Q?PenhX4tMtmwuhAnhZJSD41Wddk3qol6TUTCbsD2avLal0xPwRu3sy4fB23Iw?=
 =?us-ascii?Q?6R8W6XGnvj6AGrkcwStgtzTONJtCqv0PAktAvVIISlTxauHYcMZJtWUpvbg+?=
 =?us-ascii?Q?eSaJ+DErAeOYz8gd0pBDQGPHr23xGMGdU7Wldu3PEycm+x5QrevhbHsINfL7?=
 =?us-ascii?Q?TASNIFBjFQZ+bnNydSgFxdlMJtU/djfm6aFs7GKSxrVw91E3qH5bJkhlN8s9?=
 =?us-ascii?Q?Gvo+mDJDcvufdwlSpnLULT+Qc0aFmCrNB9l0TICCGW2+Co7XEpBHfN20Bey/?=
 =?us-ascii?Q?9JAzT5lcL6/w1KMggIMdXlvi2fT3tc9ba/vm0WkvugXFdRqFZek3BBkJT+UU?=
 =?us-ascii?Q?FItqwtSHcckJ+C5hUb7QjE6yJnG2GJs13JLdHGWzwyDY1pcja8OthO74vCHd?=
 =?us-ascii?Q?/GzCbOoh6pGKG1ZnYo06IqsiMFHRLhOe1Xi2xjw39v8O2/koghaptA6ddCFr?=
 =?us-ascii?Q?qDRzl2SnX6TjFhH9XJ0eFc8zaVVruxqORFEO4OWLYyLS?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33398008-413a-4100-7a52-08de11e5060c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR03MB6037.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 03:34:08.3547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1If7SCYS2beigGO2LiIOOcPNKysVl0A1fQd5wZJsvUxub65rqfEp8xHC86ZVb0gw13+EvDuKGu+LKwglfzAaexOSPx08fhdBK/sy6Xvg2BThOJQ8AOZFnFrLvdQqagm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_203417_510521_1783EF6D 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>

The DMA device pointer `dma_dev` was being dereferenced before ensuring
that `cdns_ctrl->dmac` is properly initialized.

Move the assignment of `dma_dev` after successfully acquiring the DMA
channel to ensure the pointer is valid before use.

Fixes: d76d22b5096c ("mtd: rawnand: cadence: use dma_map_resource for sdma address")
Cc: stable@vger.kernel.org
Signed-off-by: Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
---

This patch fixes below kernel Oops:
...
[    1.469661] cadence-nand-controller 10b80000.nand-controller: IRQ: nr 21
[    1.476591] Unable to handle kernel paging request at virtual address fffffffffffffff8
[    1.484493] Mem abort info:
[    1.487280]   ESR = 0x0000000096000004
[    1.491019]   EC = 0x25: DABT (current EL), IL = 32 bits
[    1.496318]   SET = 0, FnV = 0
[    1.499366]   EA = 0, S1PTW = 0
[    1.502499]   FSC = 0x04: level 0 translation fault
[    1.507363] Data abort info:
[    1.510237]   ISV = 0, ISS = 0x00000004
[    1.514062]   CM = 0, WnR = 0
[    1.517024] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000087a0a000
[    1.523706] [fffffffffffffff8] pgd=0000000000000000, p4d=0000000000000000
[    1.530490] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
...

 drivers/mtd/nand/raw/cadence-nand-controller.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 6667eea95597..32ed38b89394 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -2871,7 +2871,7 @@ cadence_nand_irq_cleanup(int irqnum, struct cdns_nand_ctrl *cdns_ctrl)
 static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
-	struct dma_device *dma_dev = cdns_ctrl->dmac->device;
+	struct dma_device *dma_dev;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -2915,6 +2915,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		}
 	}
 
+	dma_dev = cdns_ctrl->dmac->device;
 	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
 						  cdns_ctrl->io.size,
 						  DMA_BIDIRECTIONAL, 0);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
