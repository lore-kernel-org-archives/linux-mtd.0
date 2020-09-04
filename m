Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA69C43461
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 07:50:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF00E20791
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 07:50:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V+XAYcml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF00E20791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sQBgV83B0goIgwvgTmFiIv+SGZsvJW5KtgivzkWiAas=; b=V+XAYcmlq+bI3td9hhL2b5Wuv
	ofmwy8bYU70xjHYE+N3xtLYXiJD0bIrsF5KXtUPDdEyxw7R75XQC448pzXXWCynesUuSKG/aoUrrV
	qspDEj2uF1aqsam5zDKPdYeVSvwZ6s386w+yPBvVpyirKAk9u6pb+rnbcKPAV5jDiHuHoelsx4/OH
	tVYkbZ76QggxszOJA1GqGrB4QcJ1ycm8tev6EM9MMuhJNm2KFKNEx0b8+Zx3epzu5uHHKfvcv5J0K
	YvKMIQ39FTQOtznMn/gpUlayNozEIcJJpWO6vfCUMWbj5yH9CCWADhLKj/veM/bHNP8CzU/R3vQSi
	juMoeT5QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6St-0003Ph-M3; Fri, 04 Sep 2020 07:48:55 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6Sm-0003Nb-Rb
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2020 07:48:53 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 04EC039AAF885326471A;
 Fri,  4 Sep 2020 15:48:34 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Sep 2020 15:48:24 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <m.weisser.m@gmail.com>, <vigneshr@ti.com>, <p.yadav@ti.com>,
 <tudor.ambarus@microchip.com>
Subject: [PATCH 2/2] Revert "mtd: spi-nor: Add capability to disable flash
 quad mode"
Date: Fri, 4 Sep 2020 15:47:20 +0800
Message-ID: <1599205640-26690-2-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1599205640-26690-1-git-send-email-yangyicong@hisilicon.com>
References: <1599205640-26690-1-git-send-email-yangyicong@hisilicon.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_034852_679914_B5A2D82E 
X-CRM114-Status: GOOD (  15.58  )
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
Cc: linux-mtd@lists.infradead.org, linuxarm@huawei.com,
 yangyicong@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As the only user has been removed in previous patch, let's revert
this one together.

This reverts commit be192209d5a33c912caa4a05d6f92b89328d8db8.

Reported-by: Matthias Weisser <m.weisser.m@gmail.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/spi-nor/core.c | 55 ++++++++++++++++------------------------------
 drivers/mtd/spi-nor/core.h | 10 ++++-----
 2 files changed, 24 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ab8f554..0369d98 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1907,16 +1907,15 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 }
 
 /**
- * spi_nor_sr1_bit6_quad_enable() - Set/Unset the Quad Enable BIT(6) in the
- *                                  Status Register 1.
+ * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the Status
+ * Register 1.
  * @nor:	pointer to a 'struct spi_nor'
- * @enable:	true to enable Quad mode, false to disable Quad mode.
  *
  * Bit 6 of the Status Register 1 is the QE bit for Macronix like QSPI memories.
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable)
+int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
 {
 	int ret;
 
@@ -1924,56 +1923,45 @@ int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable)
 	if (ret)
 		return ret;
 
-	if ((enable && (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)) ||
-	    (!enable && !(nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)))
+	if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
 		return 0;
 
-	if (enable)
-		nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
-	else
-		nor->bouncebuf[0] &= ~SR1_QUAD_EN_BIT6;
+	nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
 
 	return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0]);
 }
 
 /**
- * spi_nor_sr2_bit1_quad_enable() - set/unset the Quad Enable BIT(1) in the
- *                                  Status Register 2.
+ * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the Status
+ * Register 2.
  * @nor:       pointer to a 'struct spi_nor'.
- * @enable:	true to enable Quad mode, false to disable Quad mode.
  *
  * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI memories.
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor, bool enable)
+int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
 {
 	int ret;
 
 	if (nor->flags & SNOR_F_NO_READ_CR)
-		return spi_nor_write_16bit_cr_and_check(nor,
-						enable ? SR2_QUAD_EN_BIT1 : 0);
+		return spi_nor_write_16bit_cr_and_check(nor, SR2_QUAD_EN_BIT1);
 
 	ret = spi_nor_read_cr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
-	if ((enable && (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)) ||
-	    (!enable && !(nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)))
+	if (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)
 		return 0;
 
-	if (enable)
-		nor->bouncebuf[0] |= SR2_QUAD_EN_BIT1;
-	else
-		nor->bouncebuf[0] &= ~SR2_QUAD_EN_BIT1;
+	nor->bouncebuf[0] |= SR2_QUAD_EN_BIT1;
 
 	return spi_nor_write_16bit_cr_and_check(nor, nor->bouncebuf[0]);
 }
 
 /**
- * spi_nor_sr2_bit7_quad_enable() - set/unset QE bit in Status Register 2.
+ * spi_nor_sr2_bit7_quad_enable() - set QE bit in Status Register 2.
  * @nor:	pointer to a 'struct spi_nor'
- * @enable:	true to enable Quad mode, false to disable Quad mode.
  *
  * Set the Quad Enable (QE) bit in the Status Register 2.
  *
@@ -1983,7 +1971,7 @@ int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor, bool enable)
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor, bool enable)
+int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 {
 	u8 *sr2 = nor->bouncebuf;
 	int ret;
@@ -1993,15 +1981,11 @@ int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor, bool enable)
 	ret = spi_nor_read_sr2(nor, sr2);
 	if (ret)
 		return ret;
-	if ((enable && (*sr2 & SR2_QUAD_EN_BIT7)) ||
-	    (!enable && !(*sr2 & SR2_QUAD_EN_BIT7)))
+	if (*sr2 & SR2_QUAD_EN_BIT7)
 		return 0;
 
 	/* Update the Quad Enable bit. */
-	if (enable)
-		*sr2 |= SR2_QUAD_EN_BIT7;
-	else
-		*sr2 &= ~SR2_QUAD_EN_BIT7;
+	*sr2 |= SR2_QUAD_EN_BIT7;
 
 	ret = spi_nor_write_sr2(nor, sr2);
 	if (ret)
@@ -2914,13 +2898,12 @@ static int spi_nor_init_params(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_quad_enable() - enable/disable Quad I/O if needed.
+ * spi_nor_quad_enable() - enable Quad I/O if needed.
  * @nor:                pointer to a 'struct spi_nor'
- * @enable:             true to enable Quad mode. false to disable Quad mode.
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_quad_enable(struct spi_nor *nor, bool enable)
+static int spi_nor_quad_enable(struct spi_nor *nor)
 {
 	if (!nor->params->quad_enable)
 		return 0;
@@ -2929,7 +2912,7 @@ static int spi_nor_quad_enable(struct spi_nor *nor, bool enable)
 	      spi_nor_get_protocol_width(nor->write_proto) == 4))
 		return 0;
 
-	return nor->params->quad_enable(nor, enable);
+	return nor->params->quad_enable(nor);
 }
 
 /**
@@ -2953,7 +2936,7 @@ static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
-	err = spi_nor_quad_enable(nor, true);
+	err = spi_nor_quad_enable(nor);
 	if (err) {
 		dev_dbg(nor->dev, "quad mode not supported\n");
 		return err;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 95aa32f..6f2f6b2 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -198,7 +198,7 @@ struct spi_nor_locking_ops {
  *                      higher index in the array, the higher priority.
  * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
  *                      Table.
- * @quad_enable:	enables/disables SPI NOR Quad mode.
+ * @quad_enable:	enables SPI NOR quad mode.
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
  * @convert_addr:	converts an absolute address into something the flash
  *                      will understand. Particularly useful when pagesize is
@@ -219,7 +219,7 @@ struct spi_nor_flash_parameter {
 
 	struct spi_nor_erase_map        erase_map;
 
-	int (*quad_enable)(struct spi_nor *nor, bool enable);
+	int (*quad_enable)(struct spi_nor *nor);
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
 	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
@@ -406,9 +406,9 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear);
 int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_lock_and_prep(struct spi_nor *nor);
 void spi_nor_unlock_and_unprep(struct spi_nor *nor);
-int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor, bool enable);
-int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor, bool enable);
-int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor, bool enable);
+int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
+int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
+int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
 
 int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr);
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
