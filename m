Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF09FD7073
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0E4/rIE02WDljGOeVVesypd5xftruP8ms2fBQzhZNo=; b=J7PykRWq1MT67t
	SvPVsUOLWquUFjXB6T8vbS2cLSA/a1M83k4st6CvIb9lHMPqCvLtNGALboXfHFbkoiv+PWr5j1Xxm
	gNKHrj9CF/eSxZJpPyOvTkzaOFByNgXYwgOcodK+6zUr4lhAqYh9pLg8n6LCa18/8iSUR3Q7Y1aLp
	2Ya4oWgzNs+jgl9J2VLcr0xJilBaZJi0GMX4qpKQkaeZs94sntRPzP89i6D7snyCl47TvYORV8Lia
	oHOs5zTRI/sKzJQkn8MKXh45JnNiyQjBE6Qy5GAVkLRlWq03y5XM/b8hhCTDdWNw0tZpyun8YYFZ2
	XRgbcNX1A/mJ80+Uh1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RbX-00000005zz5-1pz7;
	Tue, 17 Mar 2026 10:24:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RbU-00000005ztg-4Ajg
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Mar 2026 10:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0d4fr+bJvxEOshjbMESAzB2lu/MMRIqXAZ81vdf7/Lo=; b=hiIkwwwg5nVj8oPciuPBB8ggSa
	6be0Vku7S6HTN50GLS7zMBk/gjrbsJb6KhZCku/DX1b9PME2pB7tMWy9viNNX/j2ev6Kb0Twxw8mr
	p2vNhcjhJ+STxJuw9XOOust8lsEtF7Hzq4YUkufEmtErbuyI41Rf3IfhzBss9r5x3vWDi/tAs6/OK
	MsFc7wHyhvawOzuB4e6+mf0MllxGQXwlSOrw6/rbSdKUZ9+qzgeA9jQP3tQ/jHtt9XH2YbP3D0zPN
	rDn7lszKF/Ysx/Kxt4D9OXl5on0LTNl9s+k01wQ7bmlfc1OMyLo11XTWKS9yEBImqfkilkh7I5xTX
	kRyQSWWg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RbR-00000002WG2-3yMK
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 10:24:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 05A0E4E42629;
	Tue, 17 Mar 2026 10:24:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C96565FC9A;
	Tue, 17 Mar 2026 10:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 957BB1045045F;
	Tue, 17 Mar 2026 11:24:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773743080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0d4fr+bJvxEOshjbMESAzB2lu/MMRIqXAZ81vdf7/Lo=;
	b=kLzcjMjzGNoRm8c40hnT47T+4Qmsg2VbsxdBna8rTJY6bjZinQZCI3IIaMzHWetgEt1t1k
	ZXz/5zJL/oM+BDHiq63VpxtGqQrFI6n9smvyzKlvauOQqpitFlRF9YAgofgNJSRxqh17Ld
	VABlq2XxP8PUtTTDHXcBkh7ZuAjhkuPAIQ4Tb4HcH1vESPxYspYEyt2ZfBS43Jn1ySWllo
	AdkT9yZ1yDuirtjMRqbVHvbpPjwk80IgLD6nqso8LDW+9wuxtfsbd3sl76fjOZWTdCUgxj
	FORk6x2ohhbW+rUxMBeGvfcoGcbHmHe7qFh+bH9y0YOQ/cLJooTvH/KVxTjTQA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 17 Mar 2026 11:24:19 +0100
Subject: [PATCH v3 16/27] mtd: spi-nor: Create a local SR cache
MIME-Version: 1.0
Message-Id: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-16-2ca9ea4e7b9b@bootlin.com>
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
In-Reply-To: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_102446_034600_A983EA33 
X-CRM114-Status: GOOD (  15.95  )
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
index 1a31266fde1a..a2479942e350 100644
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
index 3dc9ba3bc6da..091eb934abe4 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -674,6 +674,7 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
 
 void spi_nor_init_default_locking_ops(struct spi_nor *nor);
 void spi_nor_try_unlock_all(struct spi_nor *nor);
+void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr);
 void spi_nor_set_mtd_locking_ops(struct spi_nor *nor);
 void spi_nor_set_mtd_otp_ops(struct spi_nor *nor);
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index c3dbc8832025..7a6c2b8ef921 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -160,6 +160,25 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
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
@@ -269,7 +288,13 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -351,7 +376,13 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
