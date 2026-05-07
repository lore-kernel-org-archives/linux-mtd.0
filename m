Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F626CD3442
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGb2kzhElyS6nC2pvXa95nOZG5aVxL6xdnLN0h/HHcE=; b=0FscYMKQel+E6V
	Oo5lQSTpW0HpbTj47zXdNjE7SzOLGyW8FluTrz/TrU3a0NfwCaWUOd8W8DTWar+vlDS23I+5At1nZ
	uBkcNVRfXhZtYcQSOFIr94Gx4XHBPr+GKsDvAInc818EA+XF50VZm+eKjrsF0qdX1tf3EerM5MhiT
	qa4+VGa3IiKYced/8zQMXgz4uUlt2xt/9pPbbPQfScYe6Sn8DVldb7fKtPC3mO7h5R+UK3vEA1JwV
	Hpu28d+xDa4efTKGf+f/rteCWL0ifc+V7RufGAPvod/1d2tdyVyuJ119VzZWMGHnFjWdzowrlnDlC
	9KbHaIoCVq5htw/2eMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1so-00000004NRa-3ght;
	Thu, 07 May 2026 16:47:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sm-00000004NLY-0iFT
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 16:47:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B4E9D1A355C;
	Thu,  7 May 2026 16:47:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 830E0605CF;
	Thu,  7 May 2026 16:47:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 580A3108194E4;
	Thu,  7 May 2026 18:47:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tyk4eiCefGG1PtqLnRTT3btja7/h8QBKgIFeSq5ePuk=;
	b=VLTOP8FNVo6lLMxRzSz8X0EcPKhzT0LxEj/GsssLOcevgWVrekxFgzMUbT1BBwQ35aG4CZ
	KaLk2Tc/KPaXYtWmALW4xAreUbbUjKLAEt2n9jllWR1xIZsx+pk84frweRHTcQeEfbjsNu
	RI/aWUTEFQp9ZXNUMrB3llQXOOPs89QlkJ6btlHmwMs6I0tqG0aLncWEX7w1rJr/4WwPhG
	OOveUcL+MrQjK334bJnDpAILMxEjT8BgFIrL1VdG3Go+fltDp4fnPDrYmvCWwhynj4Ocho
	MbtdYhG2CuWRbjIobdQc+ytn3LMKGjH/oVjXihHt2M9DgdCw8VAT8eTtRp/hCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:58 +0200
Subject: [PATCH v5 17/28] mtd: spi-nor: Create a local SR cache
MIME-Version: 1.0
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-17-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_094728_351470_1810A12A 
X-CRM114-Status: GOOD (  18.54  )
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

In order to be able to generate debugfs output without having to
actually reach the flash, create a SPI NOR local cache of the status
registers. What matters in our case are all the bits related to sector
locking. As such, in order to make it clear that this cache is not
intended to be used anywhere else, we zero the irrelevant bits.

The cache is initialized once during the early init, and then maintained
every time the write protection scheme is updated.

Suggested-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c  |  6 +++++-
 drivers/mtd/spi-nor/core.h  |  1 +
 drivers/mtd/spi-nor/swp.c   | 35 +++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h |  2 ++
 4 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 2799c21d0b67..cdca0fd881a3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3328,8 +3328,12 @@ static int spi_nor_init(struct spi_nor *nor)
 	 */
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE) ||
 	    (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE) &&
-	     nor->flags & SNOR_F_SWP_IS_VOLATILE))
+	     nor->flags & SNOR_F_SWP_IS_VOLATILE)) {
 		spi_nor_try_unlock_all(nor);
+	} else {
+		/* In the other cases, make sure the debugfs SR cache is up to date */
+		spi_nor_cache_sr_lock_bits(nor, NULL);
+	}
 
 	if (nor->addr_nbytes == 4 &&
 	    nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 7f92586b326b..16bf6190e55a 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -679,6 +679,7 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
+void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr);
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
 void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index c22cb094b66a..2455f1f6fdf1 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -162,6 +162,25 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
 	return 0;
 }
 
+/*
+ * Keep a local cache containing all lock-related bits for debugfs use only.
+ * This way, debugfs never needs to access the flash directly.
+ */
+void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
+{
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+
+	if (!sr) {
+		if (spi_nor_read_sr(nor, nor->bouncebuf))
+			return;
+
+		sr = nor->bouncebuf;
+	}
+
+	nor->dfs_sr_cache[0] = sr[0] & (bp_mask | tb_mask | SR_SRWD);
+}
+
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
  * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the status
@@ -271,7 +290,13 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	return spi_nor_write_sr_and_check(nor, status_new[0]);
+	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	if (ret)
+		return ret;
+
+	spi_nor_cache_sr_lock_bits(nor, status_new);
+
+	return 0;
 }
 
 /*
@@ -353,7 +378,13 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
-	return spi_nor_write_sr_and_check(nor, status_new[0]);
+	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	if (ret)
+		return ret;
+
+	spi_nor_cache_sr_lock_bits(nor, status_new);
+
+	return 0;
 }
 
 /*
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 90a0cf583512..9ad77f9e76c2 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -371,6 +371,7 @@ struct spi_nor_flash_parameter;
  * @reg_proto:		the SPI protocol for read_reg/write_reg/erase operations
  * @sfdp:		the SFDP data of the flash
  * @debugfs_root:	pointer to the debugfs directory
+ * @dfs_sr_cache:	Status Register cached value for debugfs use only
  * @controller_ops:	SPI NOR controller driver specific operations.
  * @params:		[FLASH-SPECIFIC] SPI NOR flash parameters and settings.
  *                      The structure includes legacy flash parameters and
@@ -409,6 +410,7 @@ struct spi_nor {
 	enum spi_nor_cmd_ext	cmd_ext_type;
 	struct sfdp		*sfdp;
 	struct dentry		*debugfs_root;
+	u8			dfs_sr_cache[2];
 
 	const struct spi_nor_controller_ops *controller_ops;
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
