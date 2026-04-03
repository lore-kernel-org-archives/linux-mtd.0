Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C533E85371
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2026 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SDzell9ttQspSK05ec5PIJ5wbtOihDgHgdBm3Jv26Ac=; b=RyBdczcJQhcees
	0PPZ8oeCXRrKL0gaGAHT3pGhXh37uC/ACmP63tqxyuCcY4vp3uDmg4NPJGBvKJzwx3fG5TiCbFQJR
	dJ/VZdJ2kFurP3XwKZhwA1tBn/m9iNDRxaHPaZ/LOWJyxVgAE0caWLLwwOdPdCKTSZISh+TFxWCwZ
	uUCWFLuwmBlHsS1eZPMqTaP9D9Ng92exrkUr6y3oxIdK32Kkitx+xvljEB3xs51kMcODTjnWZUA9C
	hOKQ/66tsOJ+Gj9VdoPrzheE7S27pNwEJ0VTG4auJP0UuMBM3E+tQN1f/SOyIlAhCJESRiLbACtVY
	8PWUs3hpw2Vr9hSTkf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hCh-00000002J9t-0RrF;
	Fri, 03 Apr 2026 16:17:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hCb-00000002J8r-0vQ8
	for linux-mtd@lists.infradead.org;
	Fri, 03 Apr 2026 16:16:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C9C384E428D9;
	Fri,  3 Apr 2026 16:10:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0613603C1;
	Fri,  3 Apr 2026 16:10:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F17510450107;
	Fri,  3 Apr 2026 18:10:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232623; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iXL5jH9mmaZPVtSclR9ZGgChE+rApa+9y59mJvYGhKE=;
	b=T2+m4DbZIst6dAQaDNBb9l/kol4P7Q+CpK8jTe9YY0zLd+xeLp53BEOKWc+wHYfTJuuxpv
	Ot4u2QoR24QC4/ll3RQTxKSfaTQoEiSM2HO51/EJSzrfvC4IuPTc/xxAPsNaamGnOAZzDm
	rDHJLOS8wS22LfqrEUZ2FdbM/t8zgPo64TluHMILrUQ5tVZyCEc0UOu7RP9E7wTHG09EIn
	HYLyl1NlacF2cW0wPI7eQ0wN7B+MAhfQBxBBGTLHyyaRkhDFcm+PlK6TXbI/MEzDFu5rCf
	qb5omfT27BQ4/F8mwidk5yXULELtntch7bLfiBEBB454s8digOv1ZInjHumUlA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 03 Apr 2026 18:09:38 +0200
Subject: [PATCH v4 20/27] mtd: spi-nor: swp: Add support for the complement
 feature
MIME-Version: 1.0
Message-Id: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-20-833dab5e7288@bootlin.com>
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_091657_544727_038CAD90 
X-CRM114-Status: GOOD (  28.80  )
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

The current locking implementation allows to select a power of two
number of blocks, which is going to be the protected amount, as well as
telling whether this is the data at the top (end of the device) or the
bottom (beginning of the device). This means at most we can cover half
of the device or the entire device, but nothing in between.

The complement feature allows a much finer grain of configuration, by
allowing to invert what is considered locked and unlocked.

Add support for this feature. The only known position for the CMP bit is
bit 6 of the configuration register.

The locking and unlocking logics are kept unchanged if the CMP bit is
unavailable. Otherwise, once the regular logic has been applied, we
check if we already found an optimal configuration. If not, we try with
the CMP bit set. If the coverage is closer to the request, we use it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c    |   3 +
 drivers/mtd/spi-nor/core.h    |   4 +
 drivers/mtd/spi-nor/debugfs.c |   1 +
 drivers/mtd/spi-nor/swp.c     | 196 +++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |   1 +
 5 files changed, 173 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index eb7744926e44..c1e1d6d7cdf0 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2974,6 +2974,9 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
 	}
 
+	if (flags & SPI_NOR_HAS_CMP)
+		nor->flags |= SNOR_F_HAS_SR2_CMP_BIT6;
+
 	if (flags & SPI_NOR_RWW && nor->params->n_banks > 1 &&
 	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 8717a0ad90f0..842ab2a5a903 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -141,6 +141,7 @@ enum spi_nor_option_flags {
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
 	SNOR_F_SWAP16		= BIT(17),
+	SNOR_F_HAS_SR2_CMP_BIT6	= BIT(18),
 };
 
 struct spi_nor_read_command {
@@ -483,6 +484,8 @@ struct spi_nor_id {
  *   SPI_NOR_NO_ERASE:        no erase command needed.
  *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
  *   SPI_NOR_RWW:             flash supports reads while write.
+ *   SPI_NOR_HAS_CMP:         flash SR2 has complement (CMP) protect bit. Must
+ *                            be used with SPI_NOR_HAS_LOCK.
  *
  * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
  *                  Used when SFDP tables are not defined in the flash. These
@@ -531,6 +534,7 @@ struct flash_info {
 #define SPI_NOR_NO_ERASE		BIT(6)
 #define SPI_NOR_QUAD_PP			BIT(8)
 #define SPI_NOR_RWW			BIT(9)
+#define SPI_NOR_HAS_CMP			BIT(10)
 
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 1ed1a0bbef3b..e1b3406d489b 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -30,6 +30,7 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(ECC),
 	SNOR_F_NAME(NO_WP),
 	SNOR_F_NAME(SWAP16),
+	SNOR_F_NAME(HAS_SR2_CMP_BIT6),
 };
 #undef SNOR_F_NAME
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index d75ed83eb787..f5a2d667379a 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -32,6 +32,15 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 		return SR_TB_BIT5;
 }
 
+static u8 spi_nor_get_sr_cmp_mask(struct spi_nor *nor)
+{
+	if (!(nor->flags & SNOR_F_NO_READ_CR) &&
+	    nor->flags & SNOR_F_HAS_SR2_CMP_BIT6)
+		return SR2_CMP_BIT6;
+	else
+		return 0;
+}
+
 u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 {
 	unsigned int bp_slots, bp_slots_needed;
@@ -59,8 +68,10 @@ void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 	u64 min_prot_len;
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 cmp_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
 	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
+	bool cmp = sr[1] & cmp_mask;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -68,22 +79,37 @@ void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 	bp = val >> SR_BP_SHIFT;
 
 	if (!bp) {
-		/* No protection */
-		*ofs = 0;
-		*len = 0;
-		return;
+		if (!cmp) {
+			/* No protection */
+			*ofs = 0;
+			*len = 0;
+			return;
+		} else {
+			/* Full protection */
+			*ofs = 0;
+			*len = nor->params->size;
+		}
 	}
 
 	min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	*len = min_prot_len << (bp - 1);
-
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (tb)
-		*ofs = 0;
-	else
-		*ofs = nor->params->size - *len;
+	if (cmp)
+		*len = nor->params->size - *len;
+
+	if (!cmp) {
+		if (tb)
+			*ofs = 0;
+		else
+			*ofs = nor->params->size - *len;
+	} else {
+		if (tb)
+			*ofs = nor->params->size - *len;
+		else
+			*ofs = 0;
+	}
 }
 
 /*
@@ -140,13 +166,15 @@ static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
 }
 
 static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
-			    u8 pow, bool use_top)
+			    u8 pow, bool use_top, bool cmp)
 {
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 cmp_mask = spi_nor_get_sr_cmp_mask(nor);
 	int ret;
 
 	new_sr[0] = old_sr[0] & ~bp_mask & ~tb_mask;
+	new_sr[1] = old_sr[1] & ~cmp_mask;
 
 	/* Build BP field */
 	ret = spi_nor_sr_set_bp_mask(nor, &new_sr[0], pow);
@@ -154,9 +182,13 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
 		return ret;
 
 	/* Build TB field */
-	if (!use_top)
+	if ((!cmp && !use_top) || (cmp && use_top))
 		new_sr[0] |= tb_mask;
 
+	/* Build CMP field */
+	if (cmp)
+		new_sr[1] |= cmp_mask;
+
 	return 0;
 }
 
@@ -168,15 +200,22 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
 {
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 cmp_mask = spi_nor_get_sr_cmp_mask(nor);
 
 	if (!sr) {
 		if (spi_nor_read_sr(nor, nor->bouncebuf))
 			return;
 
+		if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+			if (spi_nor_read_cr(nor, nor->bouncebuf + 1))
+				return;
+		}
+
 		sr = nor->bouncebuf;
 	}
 
 	nor->dfs_sr_cache[0] = sr[0] & (bp_mask | tb_mask | SR_SRWD);
+	nor->dfs_sr_cache[1] = sr[1] & cmp_mask;
 }
 
 /*
@@ -185,10 +224,11 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
  * register
  * (SR). Does not support these features found in newer SR bitfields:
  *   - SEC: sector/block protect - only handle SEC=0 (block protect)
- *   - CMP: complement protect - only support CMP=0 (range is not complemented)
  *
  * Support for the following is provided conditionally for some flash:
  *   - TB: top/bottom protect
+ *   - CMP: complement protect (BP and TP describe the unlocked part, while
+ *          the reminder is locked)
  *
  * Sample table portion for 8MB flash (Winbond w25q64fw):
  *
@@ -215,11 +255,13 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
-	u8 status_old[1] = {}, status_new[1] = {};
-	loff_t ofs_old, ofs_new;
-	u64 len_old, len_new;
+	u8 status_old[2] = {}, status_new[2] = {}, status_new_cmp[2] = {};
+	u8 *best_status_new = status_new;
+	loff_t ofs_old, ofs_new, ofs_new_cmp;
+	u64 len_old, len_new, len_new_cmp;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB,
+		can_be_cmp = spi_nor_get_sr_cmp_mask(nor);
 	bool use_top;
 	int ret;
 	u8 pow;
@@ -230,6 +272,14 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	status_old[0] = nor->bouncebuf[0];
 
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf + 1);
+		if (ret)
+			return ret;
+
+		status_old[1] = nor->bouncebuf[1];
+	}
+
 	/* If nothing in our range is unlocked, we don't need to do anything */
 	if (spi_nor_is_locked_sr(nor, ofs, len, status_old))
 		return 0;
@@ -260,24 +310,56 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 
-	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
+	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top, false);
 	if (ret)
 		return ret;
 
+	/*
+	 * In case the region asked is not fully met, maybe we can try with the
+	 * complement feature
+	 */
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	if (can_be_cmp && len_new != lock_len) {
+		pow = ilog2(nor->params->size - lock_len) - ilog2(min_prot_len) + 1;
+		ret = spi_nor_build_sr(nor, status_old, status_new_cmp, pow, use_top, true);
+		if (ret)
+			return ret;
+
+		/*
+		 * ilog2() "floors" the result, which means in some cases we may have to
+		 * manually reduce the scope when the complement feature is used.
+		 * The uAPI is to never lock more than what is requested, but less is accepted.
+		 * Make sure we are not covering a too wide range, reduce it otherwise.
+		 */
+		spi_nor_get_locked_range_sr(nor, status_new_cmp, &ofs_new_cmp, &len_new_cmp);
+		if (len_new_cmp > lock_len) {
+			pow++;
+			ret = spi_nor_build_sr(nor, status_old, status_new_cmp, pow, use_top, true);
+			if (ret)
+				return ret;
+		}
+
+		/* Pick the CMP configuration if we cover a closer range */
+		spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+		spi_nor_get_locked_range_sr(nor, status_new_cmp, &ofs_new_cmp, &len_new_cmp);
+		if (len_new_cmp > len_new)
+			best_status_new = status_new_cmp;
+	}
+
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
 	 * wrongly tied to GND (that includes internal pull-downs).
 	 * WP# pin hard strapped to GND can be a valid use case.
 	 */
 	if (!(nor->flags & SNOR_F_NO_WP))
-		status_new[0] |= SR_SRWD;
+		best_status_new[0] |= SR_SRWD;
 
 	/* Don't bother if they're the same */
-	if (status_new[0] == status_old[0])
+	if (best_status_new[0] == status_old[0] && best_status_new[1] == status_old[1])
 		return 0;
 
 	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
-	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	spi_nor_get_locked_range_sr(nor, best_status_new, &ofs_new, &len_new);
 
 	/* Don't "lock" with no region! */
 	if (!len_new)
@@ -288,11 +370,11 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
 	if (ret)
 		return ret;
 
-	spi_nor_cache_sr_lock_bits(nor, status_new);
+	spi_nor_cache_sr_lock_bits(nor, best_status_new);
 
 	return 0;
 }
@@ -306,11 +388,13 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 	int ret;
-	u8 status_old[1], status_new[1];
-	loff_t ofs_old, ofs_new;
-	u64 len_old, len_new;
+	u8 status_old[2], status_new[2], status_new_cmp[2];
+	u8 *best_status_new = status_new;
+	loff_t ofs_old, ofs_new, ofs_new_cmp;
+	u64 len_old, len_new, len_new_cmp;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB,
+		can_be_cmp = spi_nor_get_sr_cmp_mask(nor);
 	bool use_top;
 	u8 pow;
 
@@ -320,6 +404,14 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	status_old[0] = nor->bouncebuf[0];
 
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf + 1);
+		if (ret)
+			return ret;
+
+		status_old[1] = nor->bouncebuf[1];
+	}
+
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
 		return 0;
@@ -357,30 +449,62 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	else
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 
-	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
+	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top, false);
 	if (ret)
 		return ret;
 
+	/*
+	 * In case the region asked is not fully met, maybe we can try with the
+	 * complement feature
+	 */
+	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	if (can_be_cmp && len_new != lock_len) {
+		pow = ilog2(nor->params->size - lock_len) - ilog2(min_prot_len) + 1;
+		ret = spi_nor_build_sr(nor, status_old, status_new_cmp, pow, use_top, true);
+		if (ret)
+			return ret;
+
+		/*
+		 * ilog2() "floors" the result, which means in some cases we may have to
+		 * manually reduce the scope when the complement feature is used.
+		 * The uAPI is to never unlock more than what is requested, but less is accepted.
+		 * Make sure we are not covering a too small range, increase it otherwise.
+		 */
+		spi_nor_get_locked_range_sr(nor, status_new_cmp, &ofs_new_cmp, &len_new_cmp);
+		if (len_new_cmp < lock_len) {
+			pow--;
+			ret = spi_nor_build_sr(nor, status_old, status_new_cmp, pow, use_top, true);
+			if (ret)
+				return ret;
+		}
+
+		/* Pick the CMP configuration if we cover a closer range */
+		spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+		spi_nor_get_locked_range_sr(nor, status_new_cmp, &ofs_new_cmp, &len_new_cmp);
+		if (len_new_cmp > len_new)
+			best_status_new = status_new_cmp;
+	}
+
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
-		status_new[0] &= ~SR_SRWD;
+		best_status_new[0] &= ~SR_SRWD;
 
 	/* Don't bother if they're the same */
-	if (status_new[0] == status_old[0])
+	if (best_status_new[0] == status_old[0] && best_status_new[1] == status_old[1])
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
 	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
-	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	spi_nor_get_locked_range_sr(nor, best_status_new, &ofs_new, &len_new);
 	if (len_old && len_new &&
 	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
 	if (ret)
 		return ret;
 
-	spi_nor_cache_sr_lock_bits(nor, status_new);
+	spi_nor_cache_sr_lock_bits(nor, best_status_new);
 
 	return 0;
 }
@@ -400,6 +524,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf + 1);
+		if (ret)
+			return ret;
+	} else {
+		nor->bouncebuf[1] = 0;
+	}
+
 	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf);
 }
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 9ad77f9e76c2..4b92494827b1 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -125,6 +125,7 @@
 #define SR2_LB1			BIT(3)	/* Security Register Lock Bit 1 */
 #define SR2_LB2			BIT(4)	/* Security Register Lock Bit 2 */
 #define SR2_LB3			BIT(5)	/* Security Register Lock Bit 3 */
+#define SR2_CMP_BIT6		BIT(6)
 #define SR2_QUAD_EN_BIT7	BIT(7)
 
 /* Supported SPI protocols */

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
