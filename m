Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF38CCF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 07:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Oy07cZZz1/DBuRCIe7SvzfCD+yqz2D3VWHGH9qbXVv4=; b=3OO3DrBLWSBza8
	490glzSzr2TXvoa5ewu7rzeX7n8lZzsHsbB/AkXO5QkDS/N3z3dbcJq0vgONpQTQgnH0idayevPuf
	WlT/PpTwqeA5cdTnuz0j8eN84YHD54c9BeV0pd+c4Pm4xLP2RSMa5/ns3axjpilOZzLYgRQeKuxM1
	XVGsg4teIyLDoBvyk0KOx7pyJr1Psc4PleRcA60requd6WHAe+ipN7I0g+B6Nw4lqH/MOUOa7laGm
	ShrlIpFNdY/rV8sVAnRgu6EX9I3+PV0lUrfYFU193bNJ8bxfVAPG+/Hx1JlHViK5oPQSsTdzfQYqS
	SzjNsPbQciFTXXb/UYmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssd3t-0000000GTuy-3x7e;
	Mon, 23 Sep 2024 07:00:45 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssd0Z-0000000GStf-1T0V
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 06:57:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wI9ievtVsK9GlxWRn7FdvkPqGcl4bsr9shFqwWY1BowDzkEsToBNSxP8OklqFgcS76OeJMM1BA85xS1bq17qjVrocf+hmq98rdE4B6N0lnjI4Aub4Kn1AX+lued3ERrwvo4/mgWkvCA40aoZFCNlrl5kyrkTWhNiKjwjP2jIDcf58lqeuihJXDI6jXIUu4H99PexZ1yMfCmgNBxJQZxeb13VtBnj8f/m3azWACuBrU986DsP6WRxWUvI/WD8vMeF2qhSV+H61K/I2RdUf2fydwrK3e1gDZ1kic0/Cbz/UNZzghXvmiFvkdQXve70WBxVgPt5YwgBU/lQYExi9HOUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGCE+44M5NNe0hhADGpmahDg58tK4OVGYBbZBP6wR9o=;
 b=Wwz1hXyCNmcgBAKXG8bEHH8T0eHOSWdrY1Tx+hh+JgSfU2MifNz+99YYJ3VsCttuHfPXdj3y2TeQWQX0uoprIG+eLfjDlQJFPjXQ6h+nQJ9x4+QOv7Wohm3hZG4aEqNGu8IuZ+zFQxkgbQG3ySZstSqOcJwvcq+E0wqCbz07lSweYwNWLI8OqWpgzASFpVLX3FwX2wllhK2Pg3RlKWqOVXPLA5kcb68+QLuoPtOUF8RPX7Jr+DDXUSRKxZe/Ry2MlpHryzoN9C1JfotOZAWt2hlpT0C3ZRgRNyrpbqaPA/ltEx5HPV3smRicwLte0cNnc1BgV+G3PP4k6E72ChUWag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGCE+44M5NNe0hhADGpmahDg58tK4OVGYBbZBP6wR9o=;
 b=qlQmfAwlcVzrKm8lkKS2Bz9Fdz0rmwto8dBlV0MROHx6jUkZ5/rYFJUai9b+fbO2agYRQJvoLe0+5ke5KhKr3DNxxImPiA2+GTcpPvazIOy2rQEjGhw4ID6Giaqig0lU68tNVvvTyM/fCu645YknozZfDsk+Stht19DDspm/1cE/dWpjpC5OQH1Uley2vYgMgb37oHLEM/LSDW6nL2DbnjI0Di8Ce0Jnk7ZVtIEnh6tVukvl5GN9AQQ8BW6saB2r+tAKMLoNrdee3S+gSPJ/+7sHrAylvI2BLmZwTUHAXsDmZqZUGWdpxWASWpsO1L4LvGZ1Wqj47QJ/2vd+WxzFGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by TYZPR06MB6725.apcprd06.prod.outlook.com (2603:1096:400:45a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 06:57:01 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 06:57:00 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: computersforpeace@gmail.com,
	kamal.dasu@broadcom.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	maximlevitsky@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	richard@nod.at,
	michal.simek@amd.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] mtd: rawnand: Correct multiple typos in comments
Date: Mon, 23 Sep 2024 14:56:49 +0800
Message-Id: <20240923065649.11966-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|TYZPR06MB6725:EE_
X-MS-Office365-Filtering-Correlation-Id: ebcc5137-be9d-40d1-af3f-08dcdb9cec2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fPEzFwGIv1JZhjAtJMJeOUBQ3ZguaklpvR2SQsP+QT9nEt0euQl0ZuHzgGiP?=
 =?us-ascii?Q?sNNODPeZ98xK0RTgUpTnfQe4y28Gr6s2GidAI8tIA0DUMTOOfoKnUER6Ua1e?=
 =?us-ascii?Q?OAg0poFCDM3wwa1DPrYDmgy+TnbGNjO8kL9dlhp8kuc7e2e67d6qjdOcj3n1?=
 =?us-ascii?Q?xbNq6hEcERDTaUd/IsoVMf6RSvm8l0+GftJ9mgA9h8+CUqwzVkAQ0gk+LJzV?=
 =?us-ascii?Q?uNyjfSloqnoOtOlylnxzr8nWHmYIjksRaOB8aqmcsxaCEr4WiiikwN8KXL4V?=
 =?us-ascii?Q?LPtIj+TEZD5es0fL9tIIXz/wWm/JwHv6fApy+7dgy4ub8I8bEhqOcmQUbiSL?=
 =?us-ascii?Q?WrBQkWQneGdoXSBi2FqIc7nUbiyPK6Th0xSZAggRrj/SXqCCjYGk5z627IhV?=
 =?us-ascii?Q?4bqqgX0Gy18WaIL/J7logY+OE4X0O/lgTk3bHyAM7JS+PKPVb0b0Z7GznUza?=
 =?us-ascii?Q?0mAYXMotBr2GEXuiP7Z4AD2Xd5lpWORhOXTcv0vDf8mOfhM8tnN7zS2JEybI?=
 =?us-ascii?Q?cQWTAr8XjARg+65iAu+BySbOAv1yvIH0OQ+QuWppXeIeeAhjCg8N2uqhjlsR?=
 =?us-ascii?Q?vcbediRS4hoWZMqI2cgW0oDYtnIIc1Ovbbkp+oljSWRuFBwj+a8+cegIFAkz?=
 =?us-ascii?Q?Lbf5aS9N1/8qCt27oO2GfRMUD7MMkp1G+1qhwD2z+YmZL1tbvPQInAHROXrg?=
 =?us-ascii?Q?EvqXOQMXBd3lUhNY+YslQT9rCiD23akp7U1OVIE7iMjgiaKDmOrJZm8JV0ZG?=
 =?us-ascii?Q?6UGehrWWMBPF0YF+SIRwdtGaDUiPhkwepEUwPoAd5c0QZG8IRLPwA+TyCQyR?=
 =?us-ascii?Q?DOwGcGajWAA5bmaKH7Dsc1U84K9IBtOgrNbDHG3mDEffgYM1MZceKNkng6Sg?=
 =?us-ascii?Q?lv08bUrcM7xnTTgbqJZomX6grhXRwH38CZhRmugaT6JD/sxWhx6VlymnNHsU?=
 =?us-ascii?Q?QguB1IExhQGLH8B33ytB6FZjhRsAlZGDsFopOeRmw6VWtgheZAK2QDAoevg6?=
 =?us-ascii?Q?9/l6iMiYnv8/wyMSUoAKODUB+o4QVi3YbisH4D6ROK5Uu+TRpmyQ9w0fcRHW?=
 =?us-ascii?Q?F7gxBLnevCQNqZg8CH9T2MhLgR8qHafgbfWWFjO1M1lZYmzKac/EBl5v+mtY?=
 =?us-ascii?Q?SqUZKawY8A5ZT7ZYSjyf32N5CwEeaF3wtfvC7RZUJsyGxh2BfcyaDxsA/4dB?=
 =?us-ascii?Q?Y26HeTC2VsQNQAen2EZOl+kLdinSC/Wa6isMAifyWjqUZYk7N7jIjlsL/o4e?=
 =?us-ascii?Q?USq3zAV8RP/Q+Y2tc637MTK7rQVMBqwYfInjDyFj+reBqCnUOR923Qwad0G8?=
 =?us-ascii?Q?AiQQN+zXFLw6EbEYcoJ8NxVQpphFa6F3Hma4pLNoLDokAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z6v6tqTIU69HvwyG27bGtnq3FzNP3CsDA4Mdv0M693daTpX/iEnxwEwdLIDL?=
 =?us-ascii?Q?m5h27KF3/arvEwUBaAc/L5mTaIeLfw/0NuERqZi7t7GB5uM29uciZZCvyEsA?=
 =?us-ascii?Q?BY0fRsmSXa//VzQXdYGMz9IqcykMwyJQ7DGTYL6VcwPLCqPvepRpvDkOWaQ9?=
 =?us-ascii?Q?+sBylw24W+bkuWQVejTpwSHXI8aHJprOFliYTjE7Gi8PUSabZltxQmPMDDvd?=
 =?us-ascii?Q?ri/CsqkaznLXNaWw3ZjG4RSYEKkg2hwL1qYj3tV6gJSwXpz5DDeTIiBdTyaV?=
 =?us-ascii?Q?R/Ykdc4As2HofuJYhEfy+DheDu5viJAkJBn3AoibHxT7c4r+hXPd6X2Sn9OA?=
 =?us-ascii?Q?K8dOZ/lenfXRU1PGAlW6Gp2gw296vKmAwK0RxYsLXf5Iv7mJHxlVYIsmpcCz?=
 =?us-ascii?Q?yxNhAW8+Ar1ZBVOhH+HfAlgeFkAJqLzmm4CGu8sMkn2WltgYA4rTkyGOGGLP?=
 =?us-ascii?Q?GaIclIi92L0QxnTlZzsq409yBu5ueg2dZ2UXqhwu40BoA/8ULhLGl1EPmk1V?=
 =?us-ascii?Q?kHicBaBEXyvEPqNTMvfdDpfUDXAu38W34MpM+c+umosGVxLGW6WOD06UqqBH?=
 =?us-ascii?Q?Nrn68Z3ymY7JczG5Xlp1dlY8Unb5KAyDKLgrFkM3CffH0rWTQOfqHbiyEns1?=
 =?us-ascii?Q?Za1Ed95rGr3O+bVSc/vd13ei7QEpEi/axaapOjmZrUYmsi6e6CUjlSSb8RQW?=
 =?us-ascii?Q?pS5Rsygy3t2T/KqpyGoNEnwEY/DJqsf0RZbSaSYFvXTMbTAcClKdkomAiMUu?=
 =?us-ascii?Q?jDmiUQ8JFUqRS0lyRAAx8axzE+/Lae4v5Nc8rxK3XYFgFh45BVtyRb9fETcr?=
 =?us-ascii?Q?B/EgMlsnAAe1kpxH7Yh3LhgVZsr47KRrVDCAOoC+PLW96nQus2VJHf8kPaWl?=
 =?us-ascii?Q?GOQScD08C/NHwjsaD6tC+x2gPx4xWthy0dmL8JT8uzWn9LyLxz/BIxTrBk4C?=
 =?us-ascii?Q?nCWbbGiwzkKtMCQjr8vEZRxltC4bjhfLr8uzesKjBaAlBOC9vSMaCuyloi7L?=
 =?us-ascii?Q?RahabPGdMO9Ebmlb/rpLI/rjJbzwvglrp/elWi+rZ9WRJ/TP6QpWmiJaq0+s?=
 =?us-ascii?Q?5X+t1zzw7nMfAkfIqsYM+Yano2ooqAPmBsDHrj4TqoAVXDuxxiVwkEHIayd4?=
 =?us-ascii?Q?TzMhX6Ky4uaQmciS+BiB1IuHqdOsDPUUEKsAIlshxvxkMSOcO5ZWlKLU3ZP2?=
 =?us-ascii?Q?Y0X0kqKz1bKIg6R3kbe+6jCSXMLpSe/OfRIPfKlt9B5KgqmhNAhW4/nf07Xq?=
 =?us-ascii?Q?Tq6KpEIBQ1CF0GQNAU2iUHLtLVjjI32kFzB9Mh9rCq15mY3o6YtwQcI7Lwkc?=
 =?us-ascii?Q?MPOiE51tWuHSVOG1tUKqbu4CWISrs/dIx9z5yyEGQS2fPJPMIbNUIrdgYPxY?=
 =?us-ascii?Q?fH35ISluI7pncGeP8KfbFJfdte5xv5DlA5kgWzYRCktReJ2UR4BlJaCrkyVJ?=
 =?us-ascii?Q?YvxgCtNsiTCYtRz5XUXtbt5edoWaQdizCxRNqKErGnXEssdUCtauV7Jqm9YB?=
 =?us-ascii?Q?ciXGd53ms39i9RI1yJN0EH+ILrtTCuKlfu1BdjSwmD/eYXoqf4q2RnC7wxvi?=
 =?us-ascii?Q?v3H2/iALnjrER2lHlXNM7vkvwukJVB8RRMKRfV8W?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcc5137-be9d-40d1-af3f-08dcdb9cec2e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 06:57:00.6993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uC7zVZAo9vQWYkoc7YhnWQ3jKJJZzVoaHKJ+XGRcrTBrVGCIWPXuQ7uF9WfZ7LMu87QA9dpcZhsJxi5mmMPevg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_235719_438849_45A71A63 
X-CRM114-Status: GOOD (  12.83  )
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

Fixed some confusing spelling errors, the details are as follows:

-in the code comments:
	remaing		-> remaining
	alingment	-> alignment
	capabilitiies	-> capabilities
	operatoin	-> operation
	decriptors	-> descriptors
	stareted	-> started
	Unfortunelly	-> Unfortunately
	compatabable	-> compatible
	depenent	-> dependent

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c       | 2 +-
 drivers/mtd/nand/raw/cadence-nand-controller.c | 2 +-
 drivers/mtd/nand/raw/cs553x_nand.c             | 2 +-
 drivers/mtd/nand/raw/nand_macronix.c           | 2 +-
 drivers/mtd/nand/raw/pl35x-nand-controller.c   | 2 +-
 drivers/mtd/nand/raw/r852.c                    | 4 ++--
 drivers/mtd/nand/raw/sm_common.c               | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 1b2ec0fec60c..9c253a511e45 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1561,7 +1561,7 @@ static int write_oob_to_regs(struct brcmnand_controller *ctrl, int i,
 				(oob[j + 2] <<  8) |
 				(oob[j + 3] <<  0));
 
-	/* handle the remaing bytes */
+	/* handle the remaining bytes */
 	while (j < tbytes)
 		plast[k++] = oob[j++];
 
diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 3bc89b356963..5e87ba66ea03 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1891,7 +1891,7 @@ static int cadence_nand_read_buf(struct cdns_nand_ctrl *cdns_ctrl,
 
 		int len_in_words = (data_dma_width == 4) ? len >> 2 : len >> 3;
 
-		/* read alingment data */
+		/* read alignment data */
 		if (data_dma_width == 4)
 			ioread32_rep(cdns_ctrl->io.virt, buf, len_in_words);
 #ifdef CONFIG_64BIT
diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index f0a15717cf05..341318024a19 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -26,7 +26,7 @@
 
 #define NR_CS553X_CONTROLLERS	4
 
-#define MSR_DIVIL_GLD_CAP	0x51400000	/* DIVIL capabilitiies */
+#define MSR_DIVIL_GLD_CAP	0x51400000	/* DIVIL capabilities */
 #define CAP_CS5535		0x2df000ULL
 #define CAP_CS5536		0x5df500ULL
 
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index e229de32ff50..03237310852c 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -113,7 +113,7 @@ static void macronix_nand_onfi_init(struct nand_chip *chip)
 	rand_otp = of_property_read_bool(dn, "mxic,enable-randomizer-otp");
 
 	mxic = (struct nand_onfi_vendor_macronix *)p->onfi->vendor;
-	/* Subpage write is prohibited in randomizer operatoin */
+	/* Subpage write is prohibited in randomizer operation */
 	if (rand_otp && chip->options & NAND_NO_SUBPAGE_WRITE &&
 	    mxic->reliability_func & MACRONIX_RANDOMIZER_BIT) {
 		if (p->supports_set_get_features) {
diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 2570fd0beea0..a4c192061528 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -187,7 +187,7 @@ static const struct mtd_ooblayout_ops pl35x_ecc_ooblayout16_ops = {
 	.free = pl35x_ecc_ooblayout16_free,
 };
 
-/* Generic flash bbt decriptors */
+/* Generic flash bbt descriptors */
 static u8 bbt_pattern[] = { 'B', 'b', 't', '0' };
 static u8 mirror_pattern[] = { '1', 't', 'b', 'B' };
 
diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index ed0cf732d20e..b07c2f8b4035 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -335,7 +335,7 @@ static void r852_cmdctl(struct nand_chip *chip, int dat, unsigned int ctrl)
 		else
 			dev->ctlreg &= ~R852_CTL_WRITE;
 
-		/* when write is stareted, enable write access */
+		/* when write is started, enable write access */
 		if (dat == NAND_CMD_ERASE1)
 			dev->ctlreg |= R852_CTL_WRITE;
 
@@ -372,7 +372,7 @@ static int r852_wait(struct nand_chip *chip)
 
 	nand_status_op(chip, &status);
 
-	/* Unfortunelly, no way to send detailed error status... */
+	/* Unfortunately, no way to send detailed error status... */
 	if (dev->dma_error) {
 		status |= NAND_STATUS_FAIL;
 		dev->dma_error = 0;
diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index 24f52a30fb13..e238784c8c3e 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -52,8 +52,8 @@ static const struct mtd_ooblayout_ops oob_sm_ops = {
 	.free = oob_sm_ooblayout_free,
 };
 
-/* NOTE: This layout is not compatabable with SmartMedia, */
-/* because the 256 byte devices have page depenent oob layout */
+/* NOTE: This layout is not compatible with SmartMedia, */
+/* because the 256 byte devices have page dependent oob layout */
 /* However it does preserve the bad block markers */
 /* If you use smftl, it will bypass this and work correctly */
 /* If you not, then you break SmartMedia compliance anyway */
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
