Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43B9CD6E52
	for <linux-mtd@archiver.kernel.org>; Sun, 31 May 2026 13:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m8NJcLWOZefEg72M9ckiUZ4TDL7nJu43nEeEhKgZ1aM=; b=V5ALN8RVj9mRuB
	gIzNuU/99WEgDTekOxnECYfO6oMWLCDCVM8JzsJlgggx5ipB2QrRGfc0awtbq1xhd4OEwXu8w3LP9
	ybtvjwB8EBotTLXdZhsRpNsSe8OgUJGvFcpcJl02OU6CV+AtusCeFOgCFK65/X1GcvwRHADSvApVA
	aJAmhNnmEUJWeOUDRrJ2DL5qQ60RNJR8HEJHJGnyUfk8Sr6tfNPT6EKZZe6VHLJ0fOFXcTApNFOR3
	Z+Eq8SoGL9wC/zo7ZnHCXX6xLgZrn+O5DqJAtVaMU/mqwFjNvsxxVrZCX9JS/LwgltASkzd3s7g5k
	BjpBZqNlUMVgIVD/MOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfrQ-00000009bvF-2RE7;
	Sun, 31 May 2026 13:05:48 +0000
Received: from mail-japanwestazolkn19012055.outbound.protection.outlook.com ([52.103.66.55] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTfrN-00000009buu-3rWD
	for linux-mtd@lists.infradead.org;
	Sun, 31 May 2026 13:05:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5C6Sp/PtKaKImushjdXUC3GhQjd4RNj6SSJA3mVCNyyaBBXTC7BBp4faAvxVxkK6iRi1FZges9DKgSPF+mnKh65YHK7ggRZmWvVuxvBE3zyq/v5oK3Lcs88RINwi0+WJu3pH80civpmblIIL4kEqlixdRc5D8RMuDzedF1iGkmPhuZfCnThIzIgzK8YVNIPYW/zaDqIHy9E+I6z+pEVMgajEXkijbOOmKP2XLfRtSG+raqh5+B+A5YNVep/uanu0fOocq5QUdZFPmawV9YeCxWb9aZ7iYD3aFMIhc62wXTsbpXqs2+HQxBP3Jsu8l+WTm5WK8jWmemqHc+FkU2aFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLG+Xquccz5vuY9Gic7Ybi2I0MUbDD2c/3q32uu3+DU=;
 b=mRR0HQgqWL294uyJrXVtuxBgHwS16fTiJ3fr+UitzvJ8EjtmrBDqkdJtWr9ffr371CQ1uj5ZeoqPA2qtzkYa7m3W0PyQ+BRQX0oJbLCuBqjwQaIFhLm1p5QmATtltDjG/tYcb6X+xW95JcVwXVRulbBBWdDyPlDnOuupPCZyiznIgjEikNv1JtRs6/rg/xBkzDpMK0jrXQA2KX0DA0i4p2d4H80d9p+s3me83KH0+6UsZUyLcxzkeOUXfDosJDAI0ZjxPr3fKVkoWJsCZDCeNC+QnNAhFe6ICeR56HOtBJV4uUXZKDBip7jDO4VeodCOYiS+DG4yLAQ+zSXrZSI37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLG+Xquccz5vuY9Gic7Ybi2I0MUbDD2c/3q32uu3+DU=;
 b=fLyFZIVuIFV19VfF1pfN2HhD1OtvM+qOsTpUquyeiQuf8qaXOPmTjhCQvMSWqgBpDWzGRMeWgQ/hCmrcl9CkBnamGnM6GCLq+IdVqXXAxEPxkssGYCbxNkdbq69T7Rrzro3XDkWu6cWTCg+mgJj+mylyofTsMgp+/KySnadrM9TTAQQ1i0AoBaPz0SqcUe0QfHC2xX30wdCk7of1dmmldlS112VpPFiVIIap+2eGNdWFs/85e6sbTPxI8vjmu7uw9HG1vpwNqy/pDn+297UohZ4srn8kAOjwLIEWWfU3gCRbf8g49HBd8XQHmTmEXrlHilpEjS8yizC4nJ684X2T1w==
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9) by TY0PR0101MB4264.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 13:05:28 +0000
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612]) by SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612%5]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 13:05:28 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	cnsztl@gmail.com,
	hzyitc@outlook.com,
	csharper2005@gmail.com,
	mikhail.kshevetskiy@iopsys.eu,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mtd: spinand: fmsh: add support for FM25G{01,02}B
Date: Sun, 31 May 2026 21:05:17 +0800
Message-ID: <SEYPR01MB58821E380C5DD8F7B3FFDA23C9142@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: TP0P295CA0029.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::9)
 To SEYPR01MB5882.apcprd01.prod.exchangelabs.com (2603:1096:101:1e1::9)
X-Microsoft-Original-Message-ID: <20260531130517.3115569-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB5882:EE_|TY0PR0101MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: 96130445-3387-427b-ac6e-08debf154991
X-Microsoft-Antispam: BCL:0;ARA:14566002|23021999003|51005399006|24021099003|19110799012|8060799015|41001999006|5072599009|15080799012|5062599005|26104999009|40105399003|440099028|3412199025|10035399007|12091999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TDbZvxAfSqgNPagjqeuSgFrwZQr4+XAvW1u3GlzNtYxKPKFreQYSRXr88BnO?=
 =?us-ascii?Q?NThBZ0TDN1zPm1nbY93LORH5NlJFmPC7YvXF5TtMP4PFlozKSoqANlD4gAMH?=
 =?us-ascii?Q?FWJy4f5O1dqAGdgzUT5gAzdDJXWRDmlT4vhQNZHAeTGcZFdXJjBiQtFnLFTJ?=
 =?us-ascii?Q?UKmfg21vYoXeUd3hte5tH9bCSHXFTBTIjtcKld2zPQgQSsYJXqwQnYAbkHo+?=
 =?us-ascii?Q?WUOioY/eS/mDW8n8xvC+zrskS2IwhzeFgYwbXHJFIUuY7kcZdpNk7OBG7afp?=
 =?us-ascii?Q?IRh2jNo/A/jZcoeBMpLVdeOOTXA5l+YiA8JUWeYnk93UAqZYXMkLOvvESIPo?=
 =?us-ascii?Q?vhBqiYyMAz5wAYR054dcZpEiMOR9AaxXpxbIFaV8+88oy5ZcjAMFpaIPXwDr?=
 =?us-ascii?Q?u22ns4A2RzHyedmXg94bCG3w81ge3eEL3zEz76xJGTpSsGmZTPujNbTR206l?=
 =?us-ascii?Q?d5z5yrig7SA7zP8/imFPdpX873ODB6kTJ2lQ65wyoLQeNtaei7D3b0Mv5Apc?=
 =?us-ascii?Q?9BFIXsTKKQ80KVbiHpqRIv8u94Gv5TPh/1SETyuX3BO4X5tzzdBB30iUf883?=
 =?us-ascii?Q?ymHC1ifqOEyuuGxlE02EOYNKrYGlWXOOPVk1nGdE9XvT2VxcpuTsd4tDzo8Y?=
 =?us-ascii?Q?+KxiXguWG6n7JVKp080b+QKdGVSn95LD+OZ009C0gnY6JKjuhe6btvszkzKt?=
 =?us-ascii?Q?dZcsyZOjUFnbOV5f+8w9wolM33qf0IH8yQdMcehyjw+7DO204GwVSdeQQGfN?=
 =?us-ascii?Q?WfbRSUe4+Mfma3blRbmPz8zXaIyOt9UHr01gqxZbqcL9T327IIEWoZvKJxNI?=
 =?us-ascii?Q?FYItt0EtotbD9MfWZTKS3O24DPvmjQlNMjyhWDf7OoRSOCNlwUT1ySLt0BP2?=
 =?us-ascii?Q?EL76S8skm6X3aqltj+zPiAx4a4oTOW1/LPjTa6rGyQmGhH7qevJImGI+/SWc?=
 =?us-ascii?Q?KvelSeHjywE72FVyQbipaqiu5WWLlJ/CDj3XyLno2MrKFww7yTUu+4kxe4uU?=
 =?us-ascii?Q?mcI7dLY6BRWOLs76b+i7KEt9GXF/gJo3rYZZJwom+asQInw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3HqepOd/we7UYlcezsKr5isBUkgt1gHs0u5on1O5HDQpjWBwNu8OTo5tK4HI?=
 =?us-ascii?Q?FxkjzcIPrjHov5wbhZoO1k7eZEVuKbBNXFPcJ8aFB6l0XFGzbpRmuXtYrdy3?=
 =?us-ascii?Q?Hc/5bY46bGqKveO0wXsoPcQl+heYYp/EIpTZjlue+ylv63gdWjo8ZhNOkgj2?=
 =?us-ascii?Q?ktHKIalz9y7wBcdQcPoRaZ2egasapfCMoIdq64v0bRoeS3wYsRxwC7GewJ6D?=
 =?us-ascii?Q?F/eoU14CKHcTxXIJ+g/wzQ3jqq8g18ylnQDCTdL3QVUt6ogiGy6N45OFKTWe?=
 =?us-ascii?Q?9e66uormXvYdcpSNxcNpl1MphGcBSqu1yAM48EaEymZmXrXfTPOM8jkI7Qh9?=
 =?us-ascii?Q?s9k7Hl5cUpyTmvLBNMQ37aq5QRxrylS8zNKe1sirOFiuxZgMCB00BKlFh22j?=
 =?us-ascii?Q?CBtJ1slOghHDWldnJDEbHf+R2bYDZWAxqkZh1B74wqbyaIcu4tePHFXj70xH?=
 =?us-ascii?Q?yayuHXUqsvzIio0p1Zu6TobbcqgN2DcPf3qvJpEL28g+Dpt7Mbhi7cRPL2mu?=
 =?us-ascii?Q?N5B4BjZhCzt8AtnJY81scD4IxcgZ6lb6ubCKPaag/wHIrvBvmuLxg1Rtj+/u?=
 =?us-ascii?Q?DWk4VCek1wB/wECh5Ec5ht+PSLBfsUnpFPJSvnW81ZYPdro/4q91KUpx/bn/?=
 =?us-ascii?Q?C1SgXabMC1QlKFu8ePnL6GET2cJab1XUMZ7mG5vTDGei70lUOz3lJjU6CF4z?=
 =?us-ascii?Q?Md0sxwyiS/Wr3wHL4J8R2V3xJ4sEBaEeRzO35O8oieg+qVnSHv6XmjJ018pw?=
 =?us-ascii?Q?ZlvOJ5GXLIm0nVGoFAxBJSyICob9J/X5fXgJ8z4yZ/jpZVKe1fWMNOE9+qUc?=
 =?us-ascii?Q?/2bzJb78XT1w8kZsAIrrY3hcLEYcTk/z7PXKCGFfIq8qtnklWNrA666VN99e?=
 =?us-ascii?Q?OX7ADujTd5awLPHZk3sf1gJ0TuUfPFbGmZewOwQZDb7SPXoteLTYAX8kIHN+?=
 =?us-ascii?Q?8kco3/0sc4Z2c3u3ZR96Zh/NrRG9k3S/1COvjtNkx6egkPU8J+9EZlBZqLxs?=
 =?us-ascii?Q?Iu1WecbIMSOiUIlgff6qN0kT0Yc1cr2ILGKrZVCc+OL43+cOSLSYd1NoH++r?=
 =?us-ascii?Q?EEw/vLBMBIABXIHTXReNcvkQ5iGqOSTFe7zcD4kFOPmp7MIOvuyCIrClC7OV?=
 =?us-ascii?Q?5wqsIu+xMPqkm77zYn8siCtgXHaiaL4O2aA8X88fv3yOM8LiTnAthDdAC4PI?=
 =?us-ascii?Q?PdYH/uwz40TqAi+WNjhR+/530AK6YovJY5jqLRw+TJByDEdQtoJE6GyZ6ofv?=
 =?us-ascii?Q?D3MX2MUhLlVrd0YUxypCqDsvBOF1A2Ap0w7+3P03nsyjf9TGS+FmiUPDOqoK?=
 =?us-ascii?Q?RBFmJ5e1d4lDIFOYBWQOh7BoyiLPbsAmAvkvqp8QxyRLLfELiPDoVma1FfbU?=
 =?us-ascii?Q?3dw6ApA=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96130445-3387-427b-ac6e-08debf154991
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB5882.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 13:05:28.4373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4264
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_060545_978790_3E93BC25 
X-CRM114-Status: GOOD (  12.17  )
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

Add support for FudanMicro FM25S01B SPI NAND and FudanMicro FM25S02B SPI
NAND.

FM25G01B datasheet: https://www.fmsh.com/nvm/FM25G01B_ds_eng.pdf
FM25G02B datasheet: https://www.fmsh.com/nvm/FM25G02B_ds_eng.pdf

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
Changes since v2:
  More verbose commit message.
  Use only one section in fm25g01b_ooblayout_free().

Changes since v1:
  Fix copy-paste issue. (Correct FM25G01B size.)

 drivers/mtd/nand/spi/fmsh.c | 96 +++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index f417955f7d1c..c1a9a4d54435 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -9,6 +9,16 @@
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
+#define FM25G01B_STATUS_ECC_MASK		(7 << 4)
+	#define FM25G01B_STATUS_ECC_NO_BITFLIPS		(0 << 4)
+	#define FM25G01B_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
+	#define FM25G01B_STATUS_ECC_4_BITFLIPS		(2 << 4)
+	#define FM25G01B_STATUS_ECC_5_BITFLIPS		(3 << 4)
+	#define FM25G01B_STATUS_ECC_6_BITFLIPS		(4 << 4)
+	#define FM25G01B_STATUS_ECC_7_BITFLIPS		(5 << 4)
+	#define FM25G01B_STATUS_ECC_8_BITFLIPS		(6 << 4)
+	#define FM25G01B_STATUS_ECC_UNCOR_ERROR		(7 << 4)
+
 #define FM25S01BI3_STATUS_ECC_MASK		(7 << 4)
 	#define FM25S01BI3_STATUS_ECC_NO_BITFLIPS	(0 << 4)
 	#define FM25S01BI3_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
@@ -34,6 +44,67 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
+
+static int fm25g01b_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 64;
+	region->length = 64;
+
+	return 0;
+}
+
+static int fm25g01b_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* reserve 2 bytes for the BBM */
+	region->offset = 2;
+	region->length = 62;
+
+	return 0;
+}
+
+static int fm25g01b_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
+{
+	switch (status & FM25S01BI3_STATUS_ECC_MASK) {
+	case FM25G01B_STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case FM25G01B_STATUS_ECC_1_3_BITFLIPS:
+		return 3;
+
+	case FM25G01B_STATUS_ECC_4_BITFLIPS:
+		return 4;
+
+	case FM25G01B_STATUS_ECC_5_BITFLIPS:
+		return 5;
+
+	case FM25G01B_STATUS_ECC_6_BITFLIPS:
+		return 6;
+
+	case FM25G01B_STATUS_ECC_7_BITFLIPS:
+		return 7;
+
+	case FM25G01B_STATUS_ECC_8_BITFLIPS:
+		return 8;
+
+	case FM25G01B_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static int fm25s01a_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -102,6 +173,11 @@ static int fm25s01bi3_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static const struct mtd_ooblayout_ops fm25g01b_ooblayout = {
+	.ecc = fm25g01b_ooblayout_ecc,
+	.free = fm25g01b_ooblayout_free,
+};
+
 static const struct mtd_ooblayout_ops fm25s01a_ooblayout = {
 	.ecc = fm25s01a_ooblayout_ecc,
 	.free = fm25s01a_ooblayout_free,
@@ -113,6 +189,26 @@ static const struct mtd_ooblayout_ops fm25s01bi3_ooblayout = {
 };
 
 static const struct spinand_info fmsh_spinand_table[] = {
+	SPINAND_INFO("FM25G01B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd1),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 21, 1, 1, 1),
+		     NAND_ECCREQ(8, 528),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25g01b_ooblayout,
+				     fm25g01b_ecc_get_status)),
+	SPINAND_INFO("FM25G02B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd2),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 41, 1, 1, 1),
+		     NAND_ECCREQ(8, 528),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25g01b_ooblayout,
+				     fm25g01b_ecc_get_status)),
 	SPINAND_INFO("FM25S01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
