Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090FAF43832
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2026 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uDtLUO0FZQSTeTJej1leJfpr3Bja24N+lHK3FRuwpZY=; b=vC2TPKojO6kaom
	PlG8gP+t5iRgHlDudijFeWsZAvTAv+WreKfKXOaruxYy64B8KuQ2PBeWBhuX+YuZb+5aI3zv/XKDF
	Lbrc5rNvqiV1v4AlpsOKBjIne0vnEZy2Dgt7w4c3kmzyrqnX1H1GFRBJFMz5TDXTNjQJYLnbbEU+s
	wmPc+rO4bEogHsVT9MznYIEbtpn5xG+F7QycR4s5A+dI5oP2podQ9l6curR8OOGksiV/uVdh6UfAG
	2bVNlYR4e2CgKNlDNmvziV/MGnxTFyA/asniXaY+PioHTghAKTZamavEcxdQMZbIqlhBDLluzd0P+
	MEvZ6OdK4FGrdNSWHGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD23U-00000001JCC-0Mu8;
	Wed, 15 Apr 2026 15:21:28 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD23Q-00000001JBn-3enw
	for linux-mtd@lists.infradead.org;
	Wed, 15 Apr 2026 15:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RI2VB54Dxa25X/MXYZ80XmBg5MwrLDEttOwde1J3ciVU+nLibt5uUl9Wv8lVusQQhDmVq70xQm0QY5GM/2Fs2D+TbQvxPNi4GXfinRjhkw1HxZnYMC2my2JP18Eke3cPehYAUOjWNUFVeDa3QWtsOeIFYFux1PBhXjqgivge6FWClPLAxxRR8gqzD9LJwhArkJc/e+QGZ6hGOLYgaEnkHIc52X5St8SXD/wzVX5E8ddx6v4E7arLPv+IAdjgJ8Vi8TNb3pRfqu7/fB6s6mt3dGKgifvYjg2Op+XdoGC2j/CxcA5OE25Rxh939elAfW7aPMU+OpsV6qIJk6InRjkEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFJrIp7ZExsTVBvXg4Kr+gBuwYDUWGAewfvO2cyFBAg=;
 b=W+8pOYL55wCye4Ix+9NJHGnoHTsAnTH0RVgj7UBpa6/zh3au5Z8TMzIQzvUyX0AGOfuPX9uVX6JvCX0TDsQTYkSLZNsHJ/Q3c1aXPBxGHkLPF1YmjHo02fnOhzuImGF/zuOx6CEGgXz/V/devNx2RteNGPYrgBf1oWL1fWjz5hI6MYtf5M3r7E4eUV0eowce3krrB1otW8bDIXukOT5C8HzIbByzUyDxg14cipW7AyNLUc4cRYu6aICgrPj4gAahyyXqFEZ42FVTBes8RA/MqLxQeVC60ie61vAbmiNmGP8IuRh3R9xZ1XAdnSooU45UfZmf2Mea5Zj+PfzBX7YphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFJrIp7ZExsTVBvXg4Kr+gBuwYDUWGAewfvO2cyFBAg=;
 b=WCsqLKMmSSUZ/WL8+BkD9l4XSLWSzKg2YKMnM5oseqMHt+BTJMNj8Ina8xHMfC9BcD9OcdWUcf4DIa+giZHxZ5fV263lDK4LOfzwD/wLUqHxzkgx1n9oVJHoXjrE3bvou6OgzA3YHII1omUKEt0M4eZOpTnsPk4nDFYECLgzIb8m5FOc4mLXC2rEHpLlPHzNBQAxHjCBfnPXLdfm7O3S5fYiuOmnVnQXB3jPAhhFfBTct7RdiA71UTefv/2b4tBg53Kor6ZpxfgNMptNeVpgtSwOcqMJsY7k41Vt0X953E02nR7f6gcatNZ/1Jch4we/YawNK0jIEly5pXHWF82zOg==
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9) by KL1PR01MB5973.apcprd01.prod.exchangelabs.com
 (2603:1096:820:12a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 15:21:15 +0000
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612]) by SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612%5]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 15:21:15 +0000
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
Subject: [PATCH 1/1] mtd: spinand: fmsh: add support for FM25G{01,02}B
Date: Wed, 15 Apr 2026 23:19:52 +0800
Message-ID: <SEYPR01MB588282ABB72BB25F6DA16F15C9222@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: TPYP295CA0003.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::14) To SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9)
X-Microsoft-Original-Message-ID: <20260415151952.1773449-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB5882:EE_|KL1PR01MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: edaaa21c-f272-41cf-119e-08de9b02a1c7
X-Microsoft-Antispam: BCL:0;ARA:14566002|41001999006|19110799012|8060799015|23021999003|5072599009|5062599005|15080799012|461199028|40105399003|52005399003|3412199025|440099028|10035399007|12091999003|26104999006|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jy4IIZVsTAIbXNYeRTC5+C5b/p3a1cCZTE6IQKsrG5A/Q1mSvFXrl+xJUS2F?=
 =?us-ascii?Q?D8kNvJWENTCEdseElKnUT/6c2nqiapwm0sTwVGpvPWKkjE//eH1V74X+rM/L?=
 =?us-ascii?Q?aF3dVLbZCL/NaOr5ifAHvppJGoQ9WVqIyMM6Nq/9LYXqILyXPvzNB7MwgmT2?=
 =?us-ascii?Q?AGjxfFJNlQm8GelsDJjX/AsHpF5WkXL0eGaWEvFbXebWxOjhL1A/Gk7ZPX4z?=
 =?us-ascii?Q?hnguuh/Ds9ddzuTHACqSvDWb0PgUuRle1RzUxnS04F+9oH9doAbtBSTZgp4h?=
 =?us-ascii?Q?oCM+cha4tnfjU19dnwtf5JLG0Gaod1q++YspxGT4VnAzWtiCeYQkyNmUBXBe?=
 =?us-ascii?Q?tu5w8pb7oOSEMvEnb5dmQsOJ4dwUDlG73k0Fz1lmS5P55UHBYgckQ2HP23cT?=
 =?us-ascii?Q?uavoXdwgRCBKt9GPgLrsS6w/YuZ+7FFoGKer5VH69IDdErka7//8QiwmZ0Fj?=
 =?us-ascii?Q?Ww4rPiaitOJfI/CGQzdmdbsz8qOAJwx9tZ8ffjdN5Oc47yg5q4BVJBlzGUl+?=
 =?us-ascii?Q?z+lO8XiRDL+iHmC+c+A9pddcarnHqkY8Lo564kIurDsFQJQ2ZQ3sGrjXv5ZF?=
 =?us-ascii?Q?JBP61za3pHZANGT1wlhj2PWvP5xq7790AOmLznDgyWLX1dGfgVDjj+N4kIVi?=
 =?us-ascii?Q?2wwh7uGhNlRHfYDhiy19YQMufssmpAJ0vBqlTimyyJdd75mIdhc5goaFRqTQ?=
 =?us-ascii?Q?vNi4RKz4ueeQy7Fwg2oLA0PGGD+sCbkdtZESnE92TkwU1mvRTVqIz6aHYOtJ?=
 =?us-ascii?Q?m6E5IAGdpJ386hHpqxuJVdsWwWWTiPIxnzNb5Wm+JWmfbFGfaKoh3bTtOsZx?=
 =?us-ascii?Q?97r56+VVWWR5/Nhz3sf26YAY7tGEdq05RDOx4hvsBQMvkZu9dbtfvtH0orJ4?=
 =?us-ascii?Q?ezhM3bSQkczCZz86IGlK/4bRHZSuUDhAXp8yS7yqeuS+sIybpuD/1BDTB71p?=
 =?us-ascii?Q?LQuRFOmA7fut3lKXD41F4cujbN4DU82WbnJhhRYm3SlDtCJ3pV5bGfb+2xBB?=
 =?us-ascii?Q?XIFKvr8+uVEAAIxYecwt8mlsboQ3DErfv0ExrXGGvjVTT95s8tWwzIUbr58N?=
 =?us-ascii?Q?2czNgJsl?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4o62Zfv5PfdVLYF3xKZujZh67eHCJDNUYWxJEwMTtlz/zKNJx42X07Gjkh4d?=
 =?us-ascii?Q?CM6Y17Of6TfMJZqFUPY9B/4kYNUXOEKlHbNlPkySqKiNpDNiYjThCt8lC9aB?=
 =?us-ascii?Q?zxqQoQYZu1CL3JAkqS8Z4rJ8N52sBYFYSeTlzHagpJC/e4KGBbv0EqYKzp5E?=
 =?us-ascii?Q?JQPp9ZkpD+GHBbjYr3feqSVU9EGk2TbPem4JAqQMrlQKpmd65Wf7os/V9xaP?=
 =?us-ascii?Q?P5QBrX4uzjR6C0kErLFSSv+KdAoROFYHZUhjR3tDTcEutlDJaUoP+d6XORzb?=
 =?us-ascii?Q?Tbx0Ks2JvsRDuHjdqNViWy5p8EYWavqRmMRjxBP2O0acPkxqyXLbBM2UIpzn?=
 =?us-ascii?Q?viHsmN8JKUSq+t9nz1t70DDEQ33ccismiCldX/xxnIco7J24JxVYQ1juXpah?=
 =?us-ascii?Q?O54XffW9r2M8DOSSe3zVyVt8SmIhCxTv5S2AUE7lkbWdlpD8gIuei2RjSPjp?=
 =?us-ascii?Q?Uxn5nj7nqgouRjs/gcUYKtMz2tfOwxB97tByV9RRgjiaQBQrmgDcEEndWzIm?=
 =?us-ascii?Q?hTeMgGXZNHxcXZnOVTQlNUkK+TUP11yOIm6Sakz2D+/hgDRBlax3RE7zveK0?=
 =?us-ascii?Q?Ma+OFF2RhKdeqfHh+w6X8GgbYpBM3cWanwHLMr1P89k2e202ItqzPAatwTI0?=
 =?us-ascii?Q?/y8fdHII//sTzykhQ6a0O6Mbqw6lOYBioCNvHEPF3z+uf23u4HvAy5BwldJi?=
 =?us-ascii?Q?O/gOuzlWslTDytJIAPq8reUirWAydg/7IKSI+elQgoRkbEBPBA4BzvXKOo50?=
 =?us-ascii?Q?xyL/hUN+EVqrKWP4f6rbfPj2BbN7Zgo4guIm4PU76mXJRnbxfORqN2OzNF3P?=
 =?us-ascii?Q?G1B0EsN2Fbsxggh/cf8ADvDOCwlTs+7fUb0ltvNv4SMmBAhTtNGDXfANkINJ?=
 =?us-ascii?Q?eJfmCloMqeZCymtR47QdeNfq6NTqV0Z0DqCCgIFuI0EMRanJa3jtDEtDB3bQ?=
 =?us-ascii?Q?+I3EnsRqAvGEiryhfgXkfVqu8mkjl5wMqhPeyQR+cLimDzmkG98GRcX9Xga0?=
 =?us-ascii?Q?QDBJmCW/JbBfav/tTMnedsHhqjnYFBnC0x4DsGMBSPblW2aUYw47eD3pbpMi?=
 =?us-ascii?Q?Q8M+xWsABflHEL9Qym+IxA6rgMze+MLJvky0dW5nFyfLa73lt0+yTkLqPDJQ?=
 =?us-ascii?Q?q3RfeicWl/H8+vVeoBYpoEMy/bHeoAKg0UycBFaiElEC3KTKMkX8zrd1rOW+?=
 =?us-ascii?Q?JblVQ6Yss1Opqw6huudDh/kALLWqk0hcItxuQgAnlsH9M3JxFn2kvSuZ1w03?=
 =?us-ascii?Q?eZ/GlDEGD1kVxZuQDOAgdPVBdWsMV0uJFpAqCwwKxVjdUdCYgReb3Ni7W06p?=
 =?us-ascii?Q?ZWMxZhZeIWfaWRE9h2e13jRy0afwUJoZDWF+lKsB3dQHtafHcQxfB2afjcNN?=
 =?us-ascii?Q?Iy1rfgUbwWOVslwXAuv5ArC7qc2a?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edaaa21c-f272-41cf-119e-08de9b02a1c7
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB5882.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 15:21:14.9287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_082124_927125_D80D0434 
X-CRM114-Status: GOOD (  12.38  )
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

FM25G01B: https://www.fmsh.com/nvm/FM25G01B_ds_eng.pdf
FM25G02B: https://www.fmsh.com/nvm/FM25G02B_ds_eng.pdf

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
 drivers/mtd/nand/spi/fmsh.c | 101 ++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index f417955f7d1c..d29e0f6529e2 100644
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
@@ -34,6 +44,72 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
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
+	if (section > 3)
+		return -ERANGE;
+
+	if (section == 0) {
+		/* reserve 2 bytes for the BBM */
+		region->offset = 2;
+		region->length = 14;
+	} else {
+		region->offset = section * 16;
+		region->length = 16;
+	}
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
@@ -102,6 +178,11 @@ static int fm25s01bi3_ooblayout_free(struct mtd_info *mtd, int section,
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
@@ -113,6 +194,26 @@ static const struct mtd_ooblayout_ops fm25s01bi3_ooblayout = {
 };
 
 static const struct spinand_info fmsh_spinand_table[] = {
+	SPINAND_INFO("FM25G01B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd1),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 20, 1, 1, 1),
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
