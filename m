Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC12C531D0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jul 2026 21:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uAThl4z0lMstLhmfPzS9jAL2Qud+TpmpGY30FcyRzHY=; b=qWVAk83ojcrPar
	gS+T93maRz4NXi8MhfuAaIsOCJfcU4dZ/M10yPl59zqs2Ugg0pEX7wrPviQZqKpm9CiDaB09v5c0f
	LnPKG44Wch21gp/4Chvgz15gd3ggUXzzcRz+x6t1cP1nAttQ6bzJD4GwTfhBQW/hATbTxAnuKTyZ/
	n9jQEsL7VKAimsibq22a+zJgHWs/p2mfjEaxyLSsxnWu73ylTc3uaEPcgULtHCeyU0FgbfpkLcMnu
	CtAS9IycCN/L9aAY8jnGKiLJWKNJqVTEwROdWEMOO42KTID3SVc+d82IbLziJ8UMTXhCD07PXZUWu
	j12RJAlASqBLgINq1O/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSZl-00000003vb5-3FOA;
	Mon, 27 Jul 2026 21:09:29 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSZj-00000003vaG-0MTQ
	for linux-mtd@lists.infradead.org;
	Mon, 27 Jul 2026 21:09:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ybJkuOTFw31oMYRW1j8ZnB1qjbyh9G5qxXBLN2QbvFw4eK0zCrzTztYBwKEB/cP09G5zDrGK9hlLENgpJzDpBHIORXfu6+tyn3tJoRFz3lyr0cH0MfIHWHOsoJrfh0UyQ9BXLVqcfxxEBasYGoOQ4c4YUzJFwCY0ZIn7Q0uAakXe9sUBx4jRLMwKolTW/e2Cqea4FeoGXNiIB8WEXkeG8x45ck+nHQWs5J8Phf6JFOeScEn1bbZT2dRwImjgOotHuY45neZnWdOi7kfPAhNKYPQCzEFKLdPUFlPjjFuvhwimvx4SY/rhKmE6gTRPQM/ur3Q+lDzB62FHVZQKB/s7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/+wZVsnBFgyWz0zRegFfPBmF9AzSvGN/oPpvL7WEwU=;
 b=BEIJQU3zzJ5hyALbcgBOEeW+IVtBP9qrjQqFnmdzQcp2+56230pE5ojB2nWyf81YB/9i8EYqRNgTvCvXKUd2k8PYSuHwvUTL5YPafZDG7CDImjCzDJ+SlsVpxkH2iAG72WDmgVO3wFcd0HqGbHgXqFGP9CRzPho41awmm18dualnXwyEniZsVfWsfHenNLYMlz43926FbmPbvN6nOyAEqVsygDCQsT7yYF3tKrZlpQttHhISFIh4z4cM1qWBMLu8ABM/4GbPkN371szka8P4yOp3T6cowVzy/4T6ZNLLTsiSSLUMEERLE34l+vxtusR1fATnuV3B92WALMHr2vp+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/+wZVsnBFgyWz0zRegFfPBmF9AzSvGN/oPpvL7WEwU=;
 b=QNASAt+a4AU7G91o7ZOtsK70ilFjBA7laxS2QTK3U3Fepbc8SObUdZjNb4ikoS0glNuOhppvODO3eOoWB2UKaLjcaTXTiPtieK2WxeTfiuvEqcpIfkaYkhAPv2Q/afw+wqAZiFcNUlNXxbJQ8xKvQtt3f+yQXj8f8MoztH8L+8MOTjMcupUTjxMfy0TxYJa/BpAfo4RSuuTyl4sjCkHSqscEnxlfl1aWOsjywzku9uvbh2Cc02+X7kcGeFrbtaUcJIvvZqKYQob3pHDsuvBkm+KkEUMEgxFaTId3+iyJIjMmN1F40dN4gdH+axFSQ/ZcFE0MACz3SyhkzbAHyGWb6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12)
 by PA1PR04MB10723.eurprd04.prod.outlook.com (2603:10a6:102:491::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 21:09:21 +0000
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308]) by AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 21:09:21 +0000
From: han.xu@oss.nxp.com
Date: Mon, 27 Jul 2026 16:09:08 -0500
Subject: [PATCH] mtd: rawnand: gpmi: add debugfs entry for BCH geometry
Message-Id: <20260727-nand_debugfs-v1-1-7cba1ceab5ee@nxp.com>
X-B4-Tracking: v=1; b=H4sIAPPIZ2oC/yXMQQqEMAxA0atI1hacoi14FRmkNanGRR2aUQTx7
 lZdvsX/BwglJoG2OCDRxsJLzPiUBQyTiyMpxmzQlTaV1VZFF7FH8usYRNkaDRrvGo0BcvJLFHh
 /dt33tax+puF/P+A8L4bJB+pwAAAA
X-Change-ID: 20260727-nand_debugfs-74d6d6ba52df
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Xu <han.xu@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785186557; l=2398;
 i=han.xu@nxp.com; s=20240131; h=from:subject:message-id;
 bh=ZFJ8KAM4kGwphBsj8UAn5eVNzbqG+nZaWT4k75kdqps=;
 b=Ijb3iCKe3t5W2p+lYtqjecFiYla39ouOc3BIvk9S5SSwXDhQ2eJUGUsSWkpbMRGW2JADLpsEl
 noWLgh8G9m/D6H6anKP+6qg1xTDOOrWJSk3MQBtjHHUnINNg7bTbJKv
X-Developer-Key: i=han.xu@nxp.com; a=ed25519;
 pk=XSryOlQ4EKXqt7ZHz2D+BcDu1AWYF0m5bX48xQOVF5A=
X-ClientProxiedBy: SA1P222CA0124.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::12) To AS8PR04MB9079.eurprd04.prod.outlook.com
 (2603:10a6:20b:446::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9079:EE_|PA1PR04MB10723:EE_
X-MS-Office365-Filtering-Correlation-Id: ff99dd10-9050-4429-a97d-08deec23541c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|19092799006|366016|56012099006|11063799006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: jKQKPKNAo/Jfe5lwAKbqwcksYG3kojVPvZvBPbfjGBSgteCXF/w+8cvID3S+c61Ev5Hk0AZeM5zJQ7Yb1g0Q5CB9hGrW7VWG4tbbmgfybzrLduBRkWUfXHch7N77xoBWXyAP/k4j7/Li9Ftc4Um21emm9a8UoUh56FFdFh2SMjmB584JsnT2QxMtyzCGmdg+wTGQA4g8vwbXciAQaq1uZF4DO/xroXETH/SSUW2mfCCoEr3SdBhi7qxX/nLnWOKvzbrnD8q1cHk2CjMAi15LXZ8hypPe2Kf94J/lpaOzHUFX4Qz11cef6kTx5cslyEqgmt5uR4r3pT02RTrwneelvhQEPTSBW+F+r5TEUHnjue4zRIB+XKtmUrw5rZygg9FsCHLxdYiDwfM9S2q1fASM7ozB1SlfCDJIxgAjQgiZ93rJqNYlKwfUieBEZztEPB3Bzk8t2Mdjk6rMzme8Twc7FlrkLs/mWzKW9g9fk4r+YwiuR+eVfQok/bs/5HHKz2YwVk7jQ5Adik3DbjZGW3jF9lRiFsvLNjAtEDORCjmv0XzI+bDkaKhT5Nig4m0YZP1hjvLsbpnNsJTRQkl8uPWSNPGNgbdZFDFKOOf1hjDXj5z5MNsy96+8wqSB6XcDJa2vTGpiuQ/gvkJZPmStgcgBQcTj9oDS4DAyMfm557XIvy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9079.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(19092799006)(366016)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNubHJXWDdSaThiV2JqblpXS3lJcTM4cVlZOTlkWTlPYmw0Wm9Va2xJQjd4?=
 =?utf-8?B?RmFCcDJhOXQvRGsrNENoTlhIS0ZLaGdaczNrelN3aGFoTitqSWFJYlowdWh3?=
 =?utf-8?B?N3dEdnpDMHNlRlgzN3NjaktkZEhIcjI4VTg1VnV2UjhibkVBREUvL0pOY2FU?=
 =?utf-8?B?dzBEeXY4RkdGekZrOUZWcUt4WjEzYVNyL2wzbTF4QzNNblUwd2dLMXdXVHlv?=
 =?utf-8?B?ZmpFMi80THNIbTVZS1pqbHh6VlpLQndQakdxMHl5aWk0WUo1YVRzc3FGakd4?=
 =?utf-8?B?M2JUN2p1TGs2Qkdyb0hzOVUwdUdwMmlVa0FSME1yeUs0TVYrOUF6RDNNOUNp?=
 =?utf-8?B?eXptazNSRVUzdEZSMnRQeERmVmd1a29aWWx3Y2YyRUlFbkQ2am00UjduR3Bo?=
 =?utf-8?B?Zk0vM1Z1S3JFbytwM0FQM0w4dlpGOVg3S0F4VkhPbERkeE9hSzlXblhXWWRS?=
 =?utf-8?B?eU9RSXoxOWJvWUlhMXVXM0NSNnNxQWorZ0IzUUpjSWs0eExCS2g5STJXajVy?=
 =?utf-8?B?TmNnVEgzbTMwM2NHT0tUMnlDcVZXb1V4U3ZyV1BPdTNNQStYZ1k4VzlSd1o5?=
 =?utf-8?B?eEp5aUdZYjJlU1hZcTFOQWZFYXZXZ2g2WXpKanhWZHdWRmNqQ01Fb3hJM2p1?=
 =?utf-8?B?bFdIY3hZYW4rVW9GQXZzNWtPSzNlSXloWUNzVEYyaWVMMGV3d2JQZCsyRzhy?=
 =?utf-8?B?YUsvVFVlM1JoTURreFVlclk2ckRBMjlNUnpBdFZGRUhaS3hrWVB1cW5zWEdl?=
 =?utf-8?B?bGFQSVZsVW5YQ09Hd1libCthMFpOSERmK2JnZjRGVkxQSG54Y3NlVHJyUnVz?=
 =?utf-8?B?M1pKWHd5UWxMVTQ1VUp6US84end2V0ZWMzkxQjBGVUl0UkxNcDhFZEs0WTNO?=
 =?utf-8?B?YlRrd2F3UGRqQWpCVWlMdUtLRDRIbythQzJ5am12WDFpREhxM0JVMVp4R0h2?=
 =?utf-8?B?YTVWS2tQclM4ZWdpU2NyZWJCaEZMSVg4YXJQRWQ5SnJFclJ2TzhMaDNCdG1D?=
 =?utf-8?B?ZWJEYjd1QWY5UitOOFRvU2V2aHNMRndULy9hdjB2QmU3dG9ybmpEQ1gzLzVC?=
 =?utf-8?B?bFhIRTZ2MWJTdFljM21iL1BFM281cW9hVDZLWWFiek5OcHN3OEpNN3Z3bFd2?=
 =?utf-8?B?OG1BOEF2Zlhkc1h0WFpMVkYzZUVMbExNajlsVW5xNjl0a3pwdmZvQ0xaUVZR?=
 =?utf-8?B?b3FCS3VldDNQNDN6ODhkQ1M5UFI4Q2UydHlCclBuVEpFWkszdVRBOTkxVGpJ?=
 =?utf-8?B?OXJTN0FFdW92L04wa1lWZUFjMjF4alNwTlZ4RE5jdjAxdGpDRTBtbmEySWo5?=
 =?utf-8?B?RW84V3JnWG1qNjBNTk8rMko3ank5NXYyUHRIb0xhNGh4L1UxbVVIMHNzN1gr?=
 =?utf-8?B?RWlCNEp4S0llbHpvV05zR3I0MFVYOGE1N1huK3R6UFozZzIxQWIvaWVTME9B?=
 =?utf-8?B?NmQ2QjNXMDJUQTNycWQzNTBISllYV2gvaGlRTFo1cDBvZ0hSK0RPUkt0dDlh?=
 =?utf-8?B?MzNmTzgvR2gxTXFEdkt6KzliSFMyU3h5NUJ5bjl5YktEa2hGRTR3RGFoazJK?=
 =?utf-8?B?UngwaGFIRnJWRXJreWtjcUR6S0lROVJRaVMxdHhJRjR6NW5iLzVKVlBoQWJa?=
 =?utf-8?B?WnJyMFc0bk42TkxzODdBNEJhWkkwKzI3LzBYYmVEd003aVIveGpIM1p3M1JB?=
 =?utf-8?B?bXRhRGJlZTZET3BOUXl3MFpFNUFwN0wvQlg5bkdqNGRHZlJLbWUxdG93aHpZ?=
 =?utf-8?B?aE5yY01YTVdwVEY1d0QyQUlvdDFyODlxRGFwcUIveUZLZUViLzF1S2V0Y0wx?=
 =?utf-8?B?a045WWVzN0tSQmRFY1RYT3FPVjlsT1M0c3R0bmg5TnRxZ2tuejRwZlFEQ1pr?=
 =?utf-8?B?Nm1BeXlFRksxVTVXV0syWThybVlRdmd0bG9lNFU2NjI3UHE5N0tMRStFa2p3?=
 =?utf-8?B?aVdrbU1CTGhsdDdJZEI4Zk02bE1ORW96Ukk0QkJwN015d0VZV1dHQzR5dzhI?=
 =?utf-8?B?bGxjLzJwOS84dGZCa0tkMnFCT29mVmpFQkpzc2N3ekxpenhiT0FOL01UWWVN?=
 =?utf-8?B?OUlZVTF1WHBiUnlRYkxwa2xXa0dyVnRrTVF2cE9sUHJvbkI5SlRKdWl6RWQr?=
 =?utf-8?B?aTNyWFBJSkJCcDhnT3Z5ZkRjTDZsSWFtS01WWjd0SWlNNC9Nd2ZiUjFWUElB?=
 =?utf-8?B?S1BFbVhqRzVoYS9MenJuVFhxd2tFSFMvbkhsb3c4c2NLaE5YaXBjSG5YMzU1?=
 =?utf-8?B?NHhCZjc0R2pXOEMvcWNwMXJmUkVhTzFBREdJMkF6dDRINE5oa3RzRmdrSXVh?=
 =?utf-8?B?c1VjTDN0ZmNkdXM1NzlNMi9RVElMU2E0OUcrQWpFbmxXdnprZUROVURNNURh?=
 =?utf-8?Q?cbqTY22gjAtvVKJU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff99dd10-9050-4429-a97d-08deec23541c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9079.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 21:09:21.3503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Tl8BK6sJKcOKPRhxBFneHq+qxr1L8OO4Gw2wgcX+IP4Y9PVYoFSKXv+GuyfYB7Tj88xf0L4xfb6K/1j9jEGuYOuJiVmfxS2Z8tcW2NN8/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_140927_134528_812C720E 
X-CRM114-Status: GOOD (  11.32  )
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

From: Han Xu <han.xu@nxp.com>

Export the BCH geometry parameters via debugfs to aid debugging and
provide the necessary information for legacy kobs-ng tool. The debugfs
directory "gpmi-nand" is created under the root debugfs tree, exposing:

bch_geometry  - blob containing the struct bch_geometry fields
raw_mode      - flag indicating raw mode status

The implementation is guarded with #ifdef CONFIG_DEBUG_FS to avoid
build failures when debugfs is disabled.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index c1f766cb225aa..3ceb8df7f8f93 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -7,6 +7,7 @@
  */
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/sched/task_stack.h>
@@ -732,6 +733,26 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
 	return err;
 }
 
+#ifdef CONFIG_DEBUG_FS
+static struct debugfs_blob_wrapper dbg_bch_geo;
+static void bch_create_debugfs(struct gpmi_nand_data *this)
+{
+	struct bch_geometry *bch_geo = &this->bch_geometry;
+	struct dentry *dbg_root;
+
+	dbg_root = debugfs_create_dir("gpmi-nand", NULL);
+	dbg_bch_geo.data = (void *)bch_geo;
+	dbg_bch_geo.size = sizeof(struct bch_geometry);
+	debugfs_create_blob("bch_geometry", 0444, dbg_root, &dbg_bch_geo);
+	/* create raw mode flag */
+	debugfs_create_file_full("raw_mode", 0444, dbg_root, NULL, NULL, NULL);
+}
+#else
+static void bch_create_debugfs(struct gpmi_nand_data *this)
+{
+}
+#endif /* CONFIG_DEBUG_FS */
+
 /* Configures the geometry for BCH.  */
 static int bch_set_geometry(struct gpmi_nand_data *this)
 {
@@ -2282,6 +2303,9 @@ static int gpmi_init_last(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
+	/* save BCH geometry to debugfs if CONFIG_DEBUG_FS is enabled */
+	bch_create_debugfs(this);
+
 	/* Init the nand_ecc_ctrl{} */
 	ecc->read_page	= gpmi_ecc_read_page;
 	ecc->write_page	= gpmi_ecc_write_page;

---
base-commit: f97bdc8ec1dc7b33781a702eeba55326c206be56
change-id: 20260727-nand_debugfs-74d6d6ba52df

Best regards,
--  
Han Xu <han.xu@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
