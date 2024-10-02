Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6EDCF6D3B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 15:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3oXINLNQewEMkO1wkrM8IxyST1V3eV0wP+uHaFJM2Y=; b=Phwm4vCGOR15oN
	o9iE5BXrf7yx5PVJ+o8jCR2djZ4C3a8AakMG9DiyrpgyWwfB2POru05Rj7cZ7YZVOtgu936SKNwJF
	zzeuGqPwVowwfl/BA74n1ui+LV9+CzVyuwBQkciw4eEPUx72BbLWIiqc44TqLB0uplIIFdHhHKuae
	VM9z6ojn9GAJAybNJkLVcXRCM9hr+bWlX+To+MlWIb6MAWWlrucm3etuT6ULiQTscuDkTo4AJDClT
	rZk+lJ98cVDatWQtFtbZsiRTQ53G11F8u8xds76gvfhiGLMQc1np4MoXAM3eWbgVdUZzwF60NBifn
	U0iTcoiNM6GPBbdaQrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1WD-00000006jec-1iNS;
	Wed, 02 Oct 2024 15:44:01 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1Sl-00000006ifE-06AJ
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 15:40:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYQoZvfS8kyoiKlMGE2BZDF3UcOBRZ8L8TWopjgp1SHjRC0+FtOWGmepNAxhY4Xc6xTiEzaBEPHcFoX7Jf4fhu93KmupOQw98A6dixX/YA0GilUO8C7xA3yuE4JJmhaTzl1tdSBBQd6SGTIFPZDEStG94KP+UrB2wnZDendLNw4bVadNa4SVJKVBtO5g5121kNIyHr7EqnyTPW9d8MO89WSxdT5Koz40uuGUY+C9FqIOap8bqitx+Tyq0AjTQ8MldV2A6EqkYp0E9kJxWPrOY/8ATlDU9PoTO/sV9cylmwiDguyIjfrkUeiStJLx38Jyw7fubv0UDmRATGB/J0ROhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQzzCjfkLMWr0bpgVIP1oSZbfwvDcllYPWTGFraoRdU=;
 b=f+92vYCXKpmfFXathCcijVbkzFuqhGMFwx+TOzl7W7DgUTdFXYE8Lxc2kqfO518d8uEMyRl/VwZhTlAcigrNbwkAUumLCR3GL6avkq+/Rhsf97e4/bnLPEsmDYycoB4bI3K3+xJBKNXSWw9u3H/VpnOKCb64hw7T6HsSPktOM7T82ruW6DiGRbLK+qlHcA6P+c11WaVyWpPs0mT5DO0+p35Y/0MFBLT+U1B3tnAIuEt9gVL7dszRp1j26ApW43pcPtLtwqhNuUyA2CBi0qcoA6JHLKHrFo1T0T42ulD+Qz92NXtbUiSYgOwXXE1q0wGLSzos4u+nyKIicT9gLtQ+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQzzCjfkLMWr0bpgVIP1oSZbfwvDcllYPWTGFraoRdU=;
 b=ULZmeden3w8BAYVOsVvI1Vp05ieGHryIjnvJ4jJPRWl/PQR2YMfTM/jMnsSFd+CK+OO2XzVXMUF6FvU1qy4+7g7g+/D4JJZytP2FHnT0VxHatd5gQNaLxGKHo3pYzCdhcjQg+K5KuTwaVEYoYnmD+jUTpvqY2jGFduqx6KR0V3ErIK7UgHSS1BkzuxsDxjyoTwmAg8GIk7XOwbzuPrx3Xjl8GEYj3mcNEJhf3y61ZqVZS50N+MA1EwTrSpqdw9FVKim/F0Rtf5ACTTAizxbA16t73fyoV0lmnOGYn+1Yh0zJzN3GqEWm1WPObXMkwN9vkntyLSn3/lcFOLMO5MqDXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AM0PR04MB7106.eurprd04.prod.outlook.com (2603:10a6:208:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 15:40:18 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58%7]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 15:40:16 +0000
From: Han Xu <han.xu@nxp.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: nand: raw: gpmi: improve power management handling
Date: Wed,  2 Oct 2024 10:39:44 -0500
Message-Id: <20241002153944.69733-2-han.xu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241002153944.69733-1-han.xu@nxp.com>
References: <20241002153944.69733-1-han.xu@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To GV1PR04MB9071.eurprd04.prod.outlook.com
 (2603:10a6:150:22::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9071:EE_|AM0PR04MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae2eebf-7c2c-43f2-5b6f-08dce2f88314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vBgQigix2GMhFXt6b60Yt0jOr2YxIRStDKWE9EQDzMY4wt0IuhDEqFD/IJbb?=
 =?us-ascii?Q?aq1LX/g4WIKBMjelNKVMyXVbcipoIZREqBc3r+0hYr+ZOLtP/8ET5/IKl3+O?=
 =?us-ascii?Q?MCZEAjYxqmrfcN+gkYD3+6LW2D39d/ezoQnB5tvxSo2NMBtphtZ2R7Yb7iX+?=
 =?us-ascii?Q?9EYXbkYaaQzENqEeaq9kUWR3iQ01n6usfRPD9AK+dssp9f1weiHqHXuisEfX?=
 =?us-ascii?Q?oSD+Si6eSgqdHa9yUdTJCrePQNZP6zTfzrY8gvblhptByBXHKfQi0j6NQWEE?=
 =?us-ascii?Q?YiIeGGtxEdk1lepjRmcEswK5gSnbpE6ANdygOZ4QRM8Sqy4JfXcRi4KHFGWm?=
 =?us-ascii?Q?cIV7JginO7YG803Owg1rym8qbeuwaHa80KmQH4TAwIaf9+NtiKHOMumr91XD?=
 =?us-ascii?Q?SnGgEUO6GmNrVLuu9XoJgWmvfGCybMOptUwiG7bxiuEWmjxhK2S7PXURRcNy?=
 =?us-ascii?Q?ffZ9coPr6nnop40XnGO52FMudxdf39wdEp8xfA8Cc2p81pdNOPhTZgkGfWTp?=
 =?us-ascii?Q?WAxIi48DhvVLDPICCeKw7bmuGIOBGoyS2riPRK5Tg9kdeDZGeMoijcqTmsB3?=
 =?us-ascii?Q?OYQbUgfdA3UbArJ5u4QBTleJSXoSMddxvXIa2J75y14S7zvcuqv8YiT4EWOs?=
 =?us-ascii?Q?DjhqHx5REElb4uJ2gB3SlJKef65bDaSSHBJfEfdkiwQtgUg1ngvCi3Olu44u?=
 =?us-ascii?Q?B0vDkO49gIyo6842hciD7mv1Fbf+8RlVag6cUb3FV2vt9dZh5HFaVysxPxJE?=
 =?us-ascii?Q?F7e/nPvVPuiMWJ0OBar2iD8Ke0r5ikYRu5VyKLstBxwsZ1aP+03I3PNoNW49?=
 =?us-ascii?Q?fPioUURau3/t+NLO9quVlNI3QnXMHMd2QO/aFlDPzR70/InDxnjxZx6U06nq?=
 =?us-ascii?Q?1Jy7jPhcBT/LB4B2EH/BY7ZIA7ML+HjWM/8Eq3NHlhBvlzgSFvceMfMIlGHm?=
 =?us-ascii?Q?nLX5LKq0RLwyM6xya1mToq38jF+3T69wmeHREl3LJUc9NOeB9UJZl0RqjHFA?=
 =?us-ascii?Q?JMw4vXxKh/u4Kbj75F93Qw4xCBjm47ozpkC8BfU41KUODlR1nyqSXXdsu7xa?=
 =?us-ascii?Q?JW6fqa+UccV7omIKBy0/IHJ1iUYQqR0RYXobhMmV329IoxfTojnNyCjuaQoW?=
 =?us-ascii?Q?4jj9W0OgYfVF+wqc3/2AKYANpZ+nD4DcXPNQNLrPYD/h+hQipYywRk4cpDm6?=
 =?us-ascii?Q?2R0+B4jE77RP/5H4ZypjWdTpEmQaxTowvHcTRI7I/vh5Mmbhy2mw9tordxDY?=
 =?us-ascii?Q?x2m8YplXyJJBlmYHBwQvsieKIrlEs5Yda0WQrfTYwFpgdeSj8Poruan8avuZ?=
 =?us-ascii?Q?TarXOMN4HSf73bWFRfbSrRm03zzLnujOMVj3k6JhSZOfKQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKQjG8Z4kKWQRIbmIj/SiHBSw3IcU0JrEyuzgWksxtkr6HkdfwaTwsRg5Hqs?=
 =?us-ascii?Q?tK0S8y/JWa9xk9vmFVQcv1J154CTpQ2qUptJ6G7MuROipCchKGeFh4/53Jr/?=
 =?us-ascii?Q?L70ahAFlz7AvQQV7RHYCE4jueC7Hn4DT5rmonOpfgzrfsdtHTJ2OH+sMxFfM?=
 =?us-ascii?Q?VEvil63j4YrEaVAOUlwAGsD2WhJEvDKHiqNMtfQJdeBhxlhU4BSvJhNxk2z6?=
 =?us-ascii?Q?Mb8cBvF0Rbkk3I29Y0GdCzCLYdI/Adbsu48mf9AvkoxwOf662c/BlUbRk2hg?=
 =?us-ascii?Q?H1keDXHu7CMr5n1tYt+h+ky1tl8QnESbHsg9GpgjQ6d1e7Hu82KDD/jlxlYP?=
 =?us-ascii?Q?Z3BVyahtcRdH1gX5rO3jf7lrkR/yWZ4MYe6gBnGiDwRhGZE25vxIHpRFrchB?=
 =?us-ascii?Q?jFZLswnxdN7XZDkLQP4JZ3CI+TQJnfiI7TtboNO1Hnf819d/85o2QvkjFf1V?=
 =?us-ascii?Q?12mPe2Dl+CZFpLOaiXOgs5FqT7ORfKeIu3IsrRscM4ToTOz1Uesj+XmbQZwv?=
 =?us-ascii?Q?qyxz5kZHv9+S72ECbwvjgReFhTm7XOocjn0cryoMnE6LRGHvNvBKc4lvo2oM?=
 =?us-ascii?Q?JGuflEixXGh2YzdJ2Fj9GuZaaGfwo8izvRCXOgRCGOZueQUgNor3lVV/fxIk?=
 =?us-ascii?Q?03s1iZQwPfDeCQIeC9qVpJgi8K0XQiqfNAv0Ea+AHsUo5fB2eGENNRHbfPmu?=
 =?us-ascii?Q?O94Q6NazJCQfwrFx1zXFmgt41v4pou4ivbT8z47RZuOFJcSxW4o5cvKopXj1?=
 =?us-ascii?Q?5z1C3Xgs3MpK7fT4ADbUPquP+4I2qPI3v2KAq9JOQXEZD/tDig0w2BYBg1Xw?=
 =?us-ascii?Q?oRcXMOSN3RLZg9IyGdPpjWweMtKac37/H4OOpR005UxuIeuknTYtHH9yTGjr?=
 =?us-ascii?Q?KWPa+tXQdPSZjLcz/hewS782AmOLjgLszJbpiNVUwC4cvwe8R0Fu2OOAnWDM?=
 =?us-ascii?Q?2bcnGldHGIIEg6KGRyd2Bzk1q0idf9LjYF4bMnm2ENmx0BstJF7VjVZpjK9D?=
 =?us-ascii?Q?btl2yM8bu1apH1dow65/nUkZYiWlsBu9+mx/O9Oe0AJAhEh/A8B/iY1j6yTA?=
 =?us-ascii?Q?CNahICRUVvHQFKLf6l0d3+GEjFOKrPsxvPf2gNA1SuUoFKwkByzaze8Ae2T0?=
 =?us-ascii?Q?V9IPsKKjB0Z93kSOSJr7o9mWAF8qPi4ODVHm2dfQPGSW+Fj6g3N7pm4NLGO3?=
 =?us-ascii?Q?oFzNg1KPuib/dJO10F2yW0i++eAJAh4kvVHLbDpJ4JqzGbN2vtpMxcnYZI5L?=
 =?us-ascii?Q?/HepJbMG9gQEb81+ryLwbEJFUNjwTEATZhG4i0FcWFLYynr4p25CLUEuB+m0?=
 =?us-ascii?Q?QJflud0tzpIH74lylBoLOOROF+Vx69hu/ubHHXxROBS2NEdyDnmrIvAe+cLV?=
 =?us-ascii?Q?tIjyAh+iYpeaVQisBe9emed4B5RewA199TZU2DMsdf7QCI5skVbppEJSX8vQ?=
 =?us-ascii?Q?F+Tp7xW49z7Z8kiNDx2IM66keoqmnpbNg0Hv89CDhyk67fyH54nhfK98gtIO?=
 =?us-ascii?Q?vdYm6ey623O4gIcES0R4FVd1yPIgneKLai3krIdNNRlFnExXNZ39V7gsUCtN?=
 =?us-ascii?Q?wjpsAjZIpfdLX4eTxl6Stzwz1M0J/q76nVOQFc35?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae2eebf-7c2c-43f2-5b6f-08dce2f88314
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:40:16.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +nEXzRxZhsunaTT3ajLTnkNPAMsXKLH/pPqeOKM0cn5wsDc7bIY/yyOItv9/MeYj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_084027_129297_8A70CF0F 
X-CRM114-Status: GOOD (  20.10  )
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

The commit refactors the power management handling in the gpmi nand
driver. It removes redundant pm_runtime calls in the probe function,
handles the pad control in suspend and resume, and moves the calls to
acquire and release DMA channels to the runtime suspend and resume
functions.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 66 ++++++++++++----------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index a7d79679248d..76e4b89e2451 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/dma/mxs-dma.h>
 #include "gpmi-nand.h"
 #include "gpmi-regs.h"
@@ -737,9 +738,8 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_get_sync(this->dev);
+	ret = pm_runtime_resume_and_get(this->dev);
 	if (ret < 0) {
-		pm_runtime_put_autosuspend(this->dev);
 		return ret;
 	}
 
@@ -1301,10 +1301,6 @@ static int acquire_resources(struct gpmi_nand_data *this)
 	if (ret)
 		goto exit_regs;
 
-	ret = acquire_dma_channels(this);
-	if (ret)
-		goto exit_regs;
-
 	ret = gpmi_get_clks(this);
 	if (ret)
 		goto exit_clock;
@@ -2761,15 +2757,9 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_acquire_resources;
 
-	ret = __gpmi_enable_clk(this, true);
-	if (ret)
-		goto exit_acquire_resources;
-
+	pm_runtime_enable(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
 
 	ret = gpmi_init(this);
 	if (ret)
@@ -2779,15 +2769,12 @@ static int gpmi_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto exit_nfc_init;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
-
 	dev_info(this->dev, "driver registered.\n");
 
 	return 0;
 
 exit_nfc_init:
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	release_resources(this);
 exit_acquire_resources:
@@ -2801,22 +2788,23 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &this->nand;
 	int ret;
 
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 	nand_cleanup(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static int gpmi_pm_suspend(struct device *dev)
 {
-	struct gpmi_nand_data *this = dev_get_drvdata(dev);
+	int ret;
 
-	release_dma_channels(this);
-	return 0;
+	pinctrl_pm_select_sleep_state(dev);
+	ret = pm_runtime_force_suspend(dev);
+
+	return ret;
 }
 
 static int gpmi_pm_resume(struct device *dev)
@@ -2824,9 +2812,13 @@ static int gpmi_pm_resume(struct device *dev)
 	struct gpmi_nand_data *this = dev_get_drvdata(dev);
 	int ret;
 
-	ret = acquire_dma_channels(this);
-	if (ret < 0)
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(this->dev, "Error in resume %d\n", ret);
 		return ret;
+	}
+
+	pinctrl_pm_select_default_state(dev);
 
 	/* re-init the GPMI registers */
 	ret = gpmi_init(this);
@@ -2849,18 +2841,34 @@ static int gpmi_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused gpmi_runtime_suspend(struct device *dev)
+#define gpmi_enable_clk(x)	__gpmi_enable_clk(x, true)
+#define gpmi_disable_clk(x)	__gpmi_enable_clk(x, false)
+
+static int gpmi_runtime_suspend(struct device *dev)
 {
 	struct gpmi_nand_data *this = dev_get_drvdata(dev);
 
-	return __gpmi_enable_clk(this, false);
+	gpmi_disable_clk(this);
+	release_dma_channels(this);
+
+	return 0;
 }
 
-static int __maybe_unused gpmi_runtime_resume(struct device *dev)
+static int gpmi_runtime_resume(struct device *dev)
 {
 	struct gpmi_nand_data *this = dev_get_drvdata(dev);
+	int ret;
+
+	ret = gpmi_enable_clk(this);
+	if (ret)
+		return ret;
+
+	ret = acquire_dma_channels(this);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 
-	return __gpmi_enable_clk(this, true);
 }
 
 static const struct dev_pm_ops gpmi_pm_ops = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
