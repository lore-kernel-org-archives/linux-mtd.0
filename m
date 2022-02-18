Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DABDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Feb 2022 12:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Nn17rHbrBSC3lnuIEJvmdInFMEl00+0c05IIlas5i0=; b=SKaKWEhhzP6pau
	+iFcmGFavzE8jP+kujLYQW3cU+Laxd33NDaTypqtlZv02H0nb0VOX5CdkPRRRB6alVbJY2O+nMGbR
	ggep3fjhKTgVqAapicMyaOPmYhE5ZIPzT92t/E33PGNHi02s69cpDchZo4HMJF/zCypPwjAT3sh/O
	E/6XDJ6qEGUJEkDv/MDj9NQaHuIZ8A9BskW1quh3tvsf4Zsn9SwTNsMxd0MjpW7+fykLbgphRDj03
	Ylr3IitdU6N3XZ5Kr+wNx79iaPXEKM2VbLHwEBeoyemRle6V/1QRMBBo2JwoE46hsgvmZJCqYml0U
	mKf6mKqCnRXvTry1AQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL23n-00E8vr-Ua; Fri, 18 Feb 2022 12:08:28 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL1Yr-00E1Rm-Di
 for linux-mtd@lists.infradead.org; Fri, 18 Feb 2022 11:36:34 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 33499223EF;
 Fri, 18 Feb 2022 12:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645184183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfCCzUPTOP+4bjBQpTuSfDS2yYDjRFWUHlf1SjyvktE=;
 b=dgcKd3i3W8E008P3gPKDeURo1K5OPeYPpgxzSwa7+7bzMVBpr47dnX9rqgNG2yn0UgRAt+
 VLGmuXzsJZAmpeWuooCML2U9FkCD0pix2i9BB/cRjK34XwddKWPTJmBW6tUSe1X1qFY/ej
 VejZfNVLEs961G17xghLqSjder97jK0=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 yaliang.wang@windriver.com, Michael Walle <michael@walle.cc>
Subject: [PATCH v2 28/32] mtd: spi-nor: move all spansion specifics into
 spansion.c
Date: Fri, 18 Feb 2022 12:36:03 +0100
Message-Id: <20220218113607.1360020-29-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220218113607.1360020-1-michael@walle.cc>
References: <20220218113607.1360020-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_033629_876364_6690854F 
X-CRM114-Status: GOOD (  19.80  )
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

The clear status register flags is only available on spansion flashes.
Move all the functions around that into the spanion module.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c     | 49 ------------------------
 drivers/mtd/spi-nor/spansion.c | 70 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h    |  1 -
 3 files changed, 70 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac0faedebafe..e2b8b0a438ce 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -554,33 +554,6 @@ int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
 	return ret;
 }
 
-/**
- * spi_nor_clear_sr() - Clear the Status Register.
- * @nor:	pointer to 'struct spi_nor'.
- */
-static void spi_nor_clear_sr(struct spi_nor *nor)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op =
-			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
-				   SPI_MEM_OP_NO_ADDR,
-				   SPI_MEM_OP_NO_DUMMY,
-				   SPI_MEM_OP_NO_DATA);
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
-						       NULL, 0);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
-}
-
 /**
  * spi_nor_sr_ready() - Query the Status Register to see if the flash is ready
  * for new commands.
@@ -595,28 +568,6 @@ int spi_nor_sr_ready(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (nor->flags & SNOR_F_USE_CLSR &&
-	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
-		if (nor->bouncebuf[0] & SR_E_ERR)
-			dev_err(nor->dev, "Erase Error occurred\n");
-		else
-			dev_err(nor->dev, "Programming Error occurred\n");
-
-		spi_nor_clear_sr(nor);
-
-		/*
-		 * WEL bit remains set to one when an erase or page program
-		 * error occurs. Issue a Write Disable command to protect
-		 * against inadvertent writes that can possibly corrupt the
-		 * contents of the memory.
-		 */
-		ret = spi_nor_write_disable(nor);
-		if (ret)
-			return ret;
-
-		return -EIO;
-	}
-
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 86665e55970d..f7d781194850 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -8,6 +8,7 @@
 
 #include "core.h"
 
+#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 #define SPINOR_OP_RD_ANY_REG			0x65	/* Read any register */
 #define SPINOR_OP_WR_ANY_REG			0x71	/* Write any register */
 #define SPINOR_REG_CYPRESS_CFR2V		0x00800003
@@ -294,6 +295,72 @@ static const struct flash_info spansion_nor_parts[] = {
 	},
 };
 
+/**
+ * spi_nor_clear_sr() - Clear the Status Register.
+ * @nor:	pointer to 'struct spi_nor'.
+ */
+static void spi_nor_clear_sr(struct spi_nor *nor)
+{
+	int ret;
+
+	if (nor->spimem) {
+		struct spi_mem_op op =
+			SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLSR, 0),
+				   SPI_MEM_OP_NO_ADDR,
+				   SPI_MEM_OP_NO_DUMMY,
+				   SPI_MEM_OP_NO_DATA);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
+						       NULL, 0);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d clearing SR\n", ret);
+}
+
+/**
+ * spi_nor_sr_ready_and_clear() - Query the Status Register to see if the flash
+ * is ready for new commands and clear it.
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: 1 if ready, 0 if not ready, -errno on errors.
+ */
+static int spi_nor_sr_ready_and_clear(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	if (ret)
+		return ret;
+
+	if (nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
+		if (nor->bouncebuf[0] & SR_E_ERR)
+			dev_err(nor->dev, "Erase Error occurred\n");
+		else
+			dev_err(nor->dev, "Programming Error occurred\n");
+
+		spi_nor_clear_sr(nor);
+
+		/*
+		 * WEL bit remains set to one when an erase or page program
+		 * error occurs. Issue a Write Disable command to protect
+		 * against inadvertent writes that can possibly corrupt the
+		 * contents of the memory.
+		 */
+		ret = spi_nor_write_disable(nor);
+		if (ret)
+			return ret;
+
+		return -EIO;
+	}
+
+	return !(nor->bouncebuf[0] & SR_WIP);
+}
+
 static void spansion_nor_late_init(struct spi_nor *nor)
 {
 	if (nor->params->size > SZ_16M) {
@@ -302,6 +369,9 @@ static void spansion_nor_late_init(struct spi_nor *nor)
 		nor->erase_opcode = SPINOR_OP_SE;
 		nor->mtd.erasesize = nor->info->sector_size;
 	}
+
+	if (nor->flags & SNOR_F_USE_CLSR)
+		nor->params->ready = spi_nor_sr_ready_and_clear;
 }
 
 static const struct spi_nor_fixups spansion_nor_fixups = {
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4622251a79ff..5e25a7b75ae2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -90,7 +90,6 @@
 
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
-#define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
 
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
