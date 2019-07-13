Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C60C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 557442087E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOUR/WEi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JF11AH83"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 557442087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=szwXG8ag1hoPYBBJexVEeriQ8nDWy/5KQ9t2wClE/28=; b=pOUR/WEiXcXjXJ
	J7KhgLCchOUwua7QYxhtIp3m1k6YYcBBOOGku2bwVdG/PsmU+Wu76gBqd8gnXYYpwJbwdxI52IVCl
	VqV9V/K8OmLrXDZhTE7fisIci7ZRZOmHoo/520CAADg1Pi754LPInE/Zoe/xDmETVRiq9elYYezaX
	AI3QedKeXfWjtBRjzFfbMQKFMBPoIgr//q1n7GMcSdTlDc/owGpUcnGHUn87UZPPpJIA8XL7w1WE+
	QVY4aaY5gV+H7FkbxkGzIDX8zm93XX56EL2CF3f8RujgVFoehfOQvKnwgAWX20+UP8rmOx12ZRl+E
	y6RyVuBMol+id83LVwug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht8I4-0002Kg-W6; Thu, 01 Aug 2019 10:26:33 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht8HQ-0001Sr-0d
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 10:25:55 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epoutp0202eb90c035d143492dc0eaa00ed6950a~2xZEue9ao3035730357epoutp022
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20190801102547epoutp0202eb90c035d143492dc0eaa00ed6950a~2xZEue9ao3035730357epoutp022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564655147;
 bh=0V2IeG0UIO9bcl/ljE7dNyMG66rht3EyWxSt6MvVN0g=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JF11AH83JAk/F7TE90wC+knVtGidZQ889XYeykTb52eWA09OtJ2FkRIFB9YUYa8bG
 mbJmbIjmfXzn/FPLi80QVaxwKjnmywUVF6xCfynBDLSCo7s8AENTihR6u3Dbw2shiW
 2kH8M9cwkOKDSm3DAfUCB/+wp5UK2bXWkBBK7Tfw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epcas1p10c97788c3f024e3c974299228e2bbc8c~2xZEOgfQg1158211582epcas1p1J;
 Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.165]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 45zmf22pFGzMqYkb; Thu,  1 Aug
 2019 10:25:46 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.18.04066.A2EB24D5; Thu,  1 Aug 2019 19:25:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epcas1p2ea4a29c514a6c54813f379cc7b7110dd~2xZCtliaN0958009580epcas1p27;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190801102545epsmtrp188d73eb6fc1810989c24d84aef12b802~2xZCqUVQJ2006620066epsmtrp12;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
X-AuditID: b6c32a37-e27ff70000000fe2-20-5d42be2a3a97
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 75.0B.03706.92EB24D5; Thu,  1 Aug 2019 19:25:45 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epsmtip17b3230841693ad79d2926aaf4c33cae5~2xZCf-oc_2162121621epsmtip1j;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v4 4/5] mtd: spi-nor: add 4bit block protection support
Date: Sat, 13 Jul 2019 23:59:37 +0900
Message-Id: <20190713145938.19203-4-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190713145938.19203-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+3nddpVWl1l6EKJ16YGj2a5zeg1nZlY3MrIHBdWaF71Naa92
 t8qIsrAoS+cSksonWqkhiYppmYkVRolKiGVlpEEPdfaiB9mizbuo/z7nfL+/cw7nd3BM9l0U
 jmeZ7ZzNzBpJcXBgy90IpVLRkaRTvSgIoa/lFiP6Xn89RrtqizDaUzIZQI8OTYnoW8evSOj7
 7S8xuqhtAtGfqhPp564ilBjMtF0cljBNNQqmse60mGmqPsq8+HEZMUNl+xinR8UUNNehVHyH
 MT6TYzM4m5wzp1sysswGLbl+i36VXhOjopRUHB1Lys2sidOSySmpyjVZRu+ApHw/a3R4U6ks
 z5PLEuJtFoedk2daeLuW5KwZRiulskbyrIl3mA2R6RbTckqlitJ4nWnGzGFPmDU/+WDZZbck
 B5Vo8lAQDkQ0VNQ8Rj6WEa0I6m/uy0PBXv6M4H1nMRKCbwjymjzivy/KR76KBeE2gp/OqgAh
 +ILgxrk+zOcSEwp4OtUo8glziHcB4O64JPIJIcRaKGp1SnwcSCyCvu6P082lRBz0PHnkbzEf
 rjV0egvheBCxHAr75UK6XQzd7UjgZBisueDnEBjrbpYIHA7vnSf9zENbrUvimwGIXASjV6v9
 ghom3fXT9TEiAq7fXCakF0DbVOl0TYyYBZNfz4p8FiCkcOqkTLCQMPEqN1BggP7X+SKBGSir
 bfZvKx9By/gvrBDNu/ivQwVCdSiUs/ImA8dTVvX/n9SIpo9OEduKGnpTuhCBI3Km9MHplTqZ
 iN3PZ5u6EOAYOUdaFbZCJ5NmsNmHOJtFb3MYOb4LabyLdGHhc9Mt3hM22/WUJkqtVtPRMbEx
 GjUZJq38QetkhIG1c3s5zsrZ/r4LwIPCc5B+eNOR+s2aLfMqWyODta+TPsdrlSuXPJysGN/5
 SpswaMhJYCY8DndB70hoQnRP34yopc51ZUNPfs127DqcuF28cPG2jm63a8MYT91T/P6QWP5h
 4G1PUuPq9dlnTpy3kJ5C+s2e+8cOlDoG8BTKNJJ2Z3xUtXXX7q6kcynPFh3beFVHBvKZLKXA
 bDz7Bw7GsPGKAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSnK7mPqdYg3tnVC1Wt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugSvj7l/xgl6XinlL
 37I3MM4x7WLk5JAQMJGY//ArWxcjF4eQwG5GieU/z7FDJCQkHu38wtLFyAFkC0scPlwMUfOR
 UaL/4gWwGjYBLYkbvzexgiREBD4wSVyedIoFJCEs4C4xeUc/WBGLgKrE+eMfGEFsXgFLiTPX
 T7NBLJCXWL3hADPIAk4BK4kJFxRAwkJAJRsO/2CewMi7gJFhFaNkakFxbnpusWGBYV5quV5x
 Ym5xaV66XnJ+7iZGcDhqae5gvLwk/hCjAAejEg+vQo9jrBBrYllxZe4hRgkOZiUR3sXi9rFC
 vCmJlVWpRfnxRaU5qcWHGKU5WJTEeZ/mHYsUEkhPLEnNTk0tSC2CyTJxcEo1MAqG3S+ofh97
 13/Li81fS8pu+jg4Fq+JeP8m7klyedyOPboukX47Tz7Yc175yPngDKlb4m0Zx3j+znm/3CJ8
 Hp/yrSMtTKyLtnyao3vtZnrEpX2FT7rqvm3NreXgXXdjTWqG8fPMAkFz4deWC56d+dd0aNbT
 tNJn0q0b+7/8rt/4LnzGynRXpfNKLMUZiYZazEXFiQBOt59hQwIAAA==
X-CMS-MailID: 20190801102545epcas1p2ea4a29c514a6c54813f379cc7b7110dd
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801102545epcas1p2ea4a29c514a6c54813f379cc7b7110dd
References: <20190713145938.19203-1-js07.lee@samsung.com>
 <CGME20190801102545epcas1p2ea4a29c514a6c54813f379cc7b7110dd@epcas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_032552_400425_A755CB8B 
X-CRM114-Status: GOOD (  25.55  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently, we are supporting block protection only for
flash chips with 3 block protection bits in the SR register.
This patch enables block protection support for some flash with
4 block protection bits(bp0-3).

Because this feature is not universal to all flash that support
lock/unlock, control it via a new flag.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 107 ++++++++++++++++++++++++++--------
 include/linux/mtd/spi-nor.h   |   5 ++
 2 files changed, 88 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6d9c63ab6e51..0fee22068d94 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -96,6 +96,7 @@ enum spi_nor_pp_command_index {
 struct spi_nor_flash_parameter {
 	u64				size;
 	u32				page_size;
+	u16				n_sectors;
 
 	struct spi_nor_hwcaps		hwcaps;
 	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
@@ -250,7 +251,7 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -279,6 +280,7 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 #define SPI_NOR_OCTAL_READ	BIT(15)	/* Flash supports Octal Read */
+#define SPI_NOR_HAS_BP3		BIT(16)	/* use 4 bits filed for block protect */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1088,26 +1090,49 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 mask_tb = SR_TB_BIT5;
-	int pow;
+	u8 mask_tb = SR_TB_BIT5, mask_bp3 = SR_BP3_BIT6;
+	u8 sr_masked, mask, tmp;
+	int pow = 0;
 
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE) {
 		mask_tb = SR_TB_BIT6;
+		mask_bp3 = SR_BP3_BIT5;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = mask_bp3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	sr_masked = sr & mask;
 
-	if (!(sr & mask)) {
+	if (!sr_masked) {
 		/* No protection */
 		*ofs = 0;
 		*len = 0;
-	} else {
-		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
-		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & mask_tb)
-			*ofs = 0;
+		return;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		if (sr_masked & mask_bp3 && mask_bp3 == SR_BP3_BIT6)
+			tmp = (sr_masked & ~SR_BP3_BIT6) | BIT(5);
 		else
-			*ofs = mtd->size - *len;
+			tmp = sr_masked;
+
+		tmp >>= SR_BP_SHIFT;
+
+		if (ilog2(nor->n_sectors) >= tmp)
+			pow = ilog2(nor->n_sectors) - tmp + 1;
+	} else {
+		pow = (sr_masked ^ mask) >> SR_BP_SHIFT;
 	}
+
+	*len = mtd->size >> pow;
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr & mask_tb)
+		*ofs = 0;
+	else
+		*ofs = mtd->size - *len;
 }
 
 /*
@@ -1181,9 +1206,8 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 mask_tb = SR_TB_BIT5;
-	u8 pow, val;
+	u8 mask_tb = SR_TB_BIT5, mask_bp3 = SR_BP3_BIT6;
+	u8 mask, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1218,8 +1242,15 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		lock_len = ofs + len;
 
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE) {
 		mask_tb = SR_TB_BIT6;
+		mask_bp3 = SR_BP3_BIT5;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = mask_bp3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
 
 	/*
 	 * Need smallest pow such that:
@@ -1231,7 +1262,17 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << SR_BP_SHIFT);
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) - pow + 1;
+		val = val << SR_BP_SHIFT;
+
+		if (val & BIT(5) && mask_bp3 == SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | SR_BP3_BIT6;
+	} else {
+		val = mask - (pow << SR_BP_SHIFT);
+	}
+
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1266,9 +1307,8 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 mask_tb = SR_TB_BIT5;
-	u8 pow, val;
+	u8 mask_tb = SR_TB_BIT5, mask_bp3 = SR_BP3_BIT6;
+	u8 mask, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1303,8 +1343,16 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		lock_len = ofs;
 
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
-	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE) {
 		mask_tb = SR_TB_BIT6;
+		mask_bp3 = SR_BP3_BIT5;
+	}
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3)
+		mask = mask_bp3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
 	/*
 	 * Need largest pow such that:
 	 *
@@ -1317,13 +1365,20 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	pow = ilog2(mtd->size) - order_base_2(lock_len);
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
+	} else if (nor->flags & SNOR_F_HAS_SR_BP3) {
+		val = ilog2(nor->n_sectors) - pow + 1;
+		val = val << SR_BP_SHIFT;
+
+		if (val & BIT(5) && mask_bp3 == SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | SR_BP3_BIT6;
 	} else {
 		val = mask - (pow << SR_BP_SHIFT);
-		/* Some power-of-two sizes are not supported */
-		if (val & ~mask)
-			return -EINVAL;
 	}
 
+	/* Some power-of-two sizes are not supported */
+	if (val & ~mask)
+		return -EINVAL;
+
 	status_new = (status_old & ~mask & ~mask_tb) | val;
 
 	/* Don't protect status register if we're fully unlocked */
@@ -3714,6 +3769,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	memset(params, 0, sizeof(*params));
 
 	/* Set SPI NOR sizes. */
+	params->n_sectors = info->n_sectors;
 	params->size = (u64)info->sector_size * info->n_sectors;
 	params->page_size = info->page_size;
 
@@ -4233,12 +4289,15 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
+	if (info->flags & SPI_NOR_HAS_BP3)
+		nor->flags |= SNOR_F_HAS_SR_BP3;
 
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
 	mtd->dev.parent = dev;
 	nor->page_size = params.page_size;
+	nor->n_sectors = params.n_sectors;
 	mtd->writebufsize = nor->page_size;
 
 	if (np) {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 97f0c3a05f86..243c522dbaa2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -127,7 +127,9 @@
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
 #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_BP3_BIT5		BIT(5)	/* Block protect 3 (on Winbond/GigaDevice)*/
 #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect (on Winbond/GigaDevice) */
+#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
@@ -246,6 +248,7 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_4B_OPCODES	= BIT(7),
 	SNOR_F_HAS_4BAIT	= BIT(8),
+	SNOR_F_HAS_SR_BP3	= BIT(9),
 };
 
 /**
@@ -349,6 +352,7 @@ struct flash_info;
  * @dev:		point to a spi device, or a spi nor controller device.
  * @info:		spi-nor part JDEC MFR id and other info
  * @page_size:		the page size of the SPI NOR
+ * @n_sectors:		number of sector
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
  * @read_opcode:	the read opcode
@@ -387,6 +391,7 @@ struct spi_nor {
 	struct device		*dev;
 	const struct flash_info	*info;
 	u32			page_size;
+	u16			n_sectors;
 	u8			addr_width;
 	u8			erase_opcode;
 	u8			read_opcode;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
