Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C06CD5BD0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4r+qyEFqW1pgX5G7WGu7QmbutcPApcBZV9VDf8atQw=; b=LlT1EnYyL0gVI8
	VORrRStWeB23o+p+O+L6i1wb2YMuaqH1vNmj+6w872Lk7Kfj/roAzK7PlGrv1hzM+p8Iwvuy+oJVW
	geuE/7plLMnWUHbyV5ZSI+KLOas6J6KPRs7ciUJTx15d5Ibyw2ttuiwiiOElY2QAkjpqbJkMjaoXq
	QkZklKBDiEEROZYYlDfhqhs0P85aRQetMPTRtvZI9/lB8AxaXw9DVN7bqm+D3yLR8AZVezGHo3vsG
	4D34jbZ8bc8r2ozMBi4OT3umjNNEwlzMl83dWhJFpaAIDp+LskFYZmbCverJ/Q++zphjxEH73ttA5
	BsYbCHBznzspYj+GfFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDt-00000002G0O-1EOB;
	Tue, 26 May 2026 14:57:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDp-00000002Fu4-0NUf
	for linux-mtd@bombadil.infradead.org;
	Tue, 26 May 2026 14:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZvYuapjDLszuAoE7EfIDrgXxtHYZlMbN5HCddu3uFlo=; b=n1SC7rHlIIVjVoA/5BtJ3MqWXX
	rXspdySsfiRTpZXog9/FvK6+2FKjVgy1c9Mafb40XpG0NV7xxOC4kMP5XF22SIJleCD15pNX+M2Hr
	raMfzBjW5L5XkMcaXP+G85R2yureCxsheQEs7fq4h4RXwQBe5kqu3qWb/8hn/+GzFnF+tlAJTdIVj
	Eattq04V3V6/nIUhpWT5bvODfL0iq+la6Ksie1lOapbd8pJ07vmJPU84DaVTozWrfiwamnV0kV90P
	hxubYPVuF6DvFGu5VZutgmT35Z+loIVFQXHUyGqTPgB+3GUcA+cNEf8T6gnsP1uvZV8IWVYWw0bVG
	6mkssT6A==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDk-0000000Batd-3rcO
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F7904E42D5F;
	Tue, 26 May 2026 14:57:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 632906011D;
	Tue, 26 May 2026 14:57:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F13C5108888DA;
	Tue, 26 May 2026 16:57:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZvYuapjDLszuAoE7EfIDrgXxtHYZlMbN5HCddu3uFlo=;
	b=XMiBtb0ET3Fkcpp0kMT6n92VwjwJuRFsXiyf7qKowaA5EMOhQzPtObk3TGZXDswnI9+r3J
	gGAzgZ513d+XHBmri3Ft/084N1yaKi7oaWicOUbwTUHSzf1zTg15GlKbu+S2o+COSGN73F
	uWfHJ/VRF8HVA6DNL9PH67EM46IkrywmJPOtc1KF1IqDISykAD8weUMtlcsyusikQ2YNbV
	uQdtRbGAg4sCwfP5tP9Jvn3TZRJG/1z2Ra2DTxbXMoXoGU2oQtvnz0CUcQIEPpr6tRZedz
	ZEjj7w1TpktK/kDprJ0IUsObtPj2exol6skj8gTmoz0uDL8XIJbXPh6tdO7fcQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:45 +0200
Subject: [PATCH v6 21/28] mtd: spi-nor: swp: Add support for the complement
 feature
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-21-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
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
X-CRM114-CacheID: sfid-20260526_155729_434528_DF9B0C72 
X-CRM114-Status: GOOD (  28.65  )
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
 drivers/mtd/spi-nor/swp.c     | 214 +++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/spi-nor.h   |   1 +
 5 files changed, 190 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1fc71d6e0fec..b25d1a870a22 100644
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
index ce46771ecdc8..ba2d1a862c9d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -141,6 +141,7 @@ enum spi_nor_option_flags {
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
 	SNOR_F_SWAP16		= BIT(17),
+	SNOR_F_HAS_SR2_CMP_BIT6	= BIT(18),
 };
 
 struct spi_nor_read_command {
@@ -491,6 +492,8 @@ struct spi_nor_id {
  *   SPI_NOR_NO_ERASE:        no erase command needed.
  *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
  *   SPI_NOR_RWW:             flash supports reads while write.
+ *   SPI_NOR_HAS_CMP:         flash SR2 has complement (CMP) protect bit. Must
+ *                            be used with SPI_NOR_HAS_LOCK.
  *
  * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
  *                  Used when SFDP tables are not defined in the flash. These
@@ -539,6 +542,7 @@ struct flash_info {
 #define SPI_NOR_NO_ERASE		BIT(6)
 #define SPI_NOR_QUAD_PP			BIT(8)
 #define SPI_NOR_RWW			BIT(9)
+#define SPI_NOR_HAS_CMP			BIT(10)
 
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 0eedafb1b19a..fbefcef2d2e1 100644
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
index 2411d8f1012d..235070b215d1 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -34,6 +34,15 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 		return 0;
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
@@ -61,8 +70,10 @@ void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 	u64 min_prot_len;
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 cmp_mask = spi_nor_get_sr_cmp_mask(nor);
 	u8 bp, val = sr[0] & bp_mask;
 	bool tb = (nor->flags & SNOR_F_HAS_SR_TB) ? sr[0] & tb_mask : 0;
+	bool cmp = sr[1] & cmp_mask;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -70,22 +81,37 @@ void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 	bp = val >> SR_BP_SHIFT;
 
 	if (!bp) {
-		/* No protection */
-		*ofs = 0;
-		*len = 0;
+		if (!cmp) {
+			/* No protection */
+			*ofs = 0;
+			*len = 0;
+		} else {
+			/* Full protection */
+			*ofs = 0;
+			*len = nor->params->size;
+		}
 		return;
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
@@ -142,13 +168,15 @@ static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
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
@@ -156,9 +184,13 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
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
 
@@ -170,15 +202,27 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
 {
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	u8 cmp_mask = spi_nor_get_sr_cmp_mask(nor);
+	u8 sr_cr[2] = {};
+
 
 	if (!sr) {
 		if (spi_nor_read_sr(nor, nor->bouncebuf))
 			return;
 
-		sr = nor->bouncebuf;
+		sr_cr[0] = nor->bouncebuf[0];
+
+		if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+			if (spi_nor_read_cr(nor, nor->bouncebuf))
+				return;
+		}
+
+		sr_cr[1] = nor->bouncebuf[0];
+		sr = sr_cr;
 	}
 
 	nor->dfs_sr_cache[0] = sr[0] & (bp_mask | tb_mask | SR_SRWD);
+	nor->dfs_sr_cache[1] = sr[1] & cmp_mask;
 }
 
 /*
@@ -187,10 +231,11 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
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
@@ -217,11 +262,13 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
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
@@ -232,6 +279,14 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	status_old[0] = nor->bouncebuf[0];
 
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf);
+		if (ret)
+			return ret;
+
+		status_old[1] = nor->bouncebuf[0];
+	}
+
 	/* If nothing in our range is unlocked, we don't need to do anything */
 	if (spi_nor_is_locked_sr(nor, ofs, len, status_old))
 		return 0;
@@ -262,27 +317,60 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
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
+		if (len_new_cmp <= lock_len &&
+		    (lock_len - len_new_cmp) < (lock_len - len_new))
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
 
 	spi_nor_get_locked_range_sr(nor, status_old, &ofs_old, &len_old);
-	spi_nor_get_locked_range_sr(nor, status_new, &ofs_new, &len_new);
+	spi_nor_get_locked_range_sr(nor, best_status_new, &ofs_new, &len_new);
 
 	/* Don't "lock" with no region! */
 	if (!len_new)
 		return -EINVAL;
 
 	/* Don't bother if they're the same */
-	if (status_new[0] == status_old[0])
+	if (best_status_new[0] == status_old[0] && best_status_new[1] == status_old[1])
 		return 0;
 
 	/* Only modify protection if it will not unlock other areas */
@@ -290,11 +378,14 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	ret = spi_nor_write_sr_and_check(nor, status_new[0]);
+	if (nor->flags & SNOR_F_NO_READ_CR)
+		ret = spi_nor_write_sr_and_check(nor, best_status_new[0]);
+	else
+		ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
 	if (ret)
 		return ret;
 
-	spi_nor_cache_sr_lock_bits(nor, status_new);
+	spi_nor_cache_sr_lock_bits(nor, best_status_new);
 
 	return 0;
 }
@@ -307,11 +398,13 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len = spi_nor_get_min_prot_length_sr(nor);
-	u8 status_old[1], status_new[1];
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
@@ -322,6 +415,14 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 	status_old[0] = nor->bouncebuf[0];
 
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf);
+		if (ret)
+			return ret;
+
+		status_old[1] = nor->bouncebuf[0];
+	}
+
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
 		return 0;
@@ -359,30 +460,66 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
+		if (len_new_cmp <= lock_len &&
+		    (lock_len - len_new_cmp) < (lock_len - len_new))
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
+	if (nor->flags & SNOR_F_NO_READ_CR)
+		ret = spi_nor_write_sr_and_check(nor, best_status_new[0]);
+	else
+		ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
 	if (ret)
 		return ret;
 
-	spi_nor_cache_sr_lock_bits(nor, status_new);
+	spi_nor_cache_sr_lock_bits(nor, best_status_new);
 
 	return 0;
 }
@@ -396,13 +533,24 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
  */
 static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 {
+	u8 sr_cr[2] = {};
 	int ret;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
 		return ret;
 
-	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf);
+	sr_cr[0] = nor->bouncebuf[0];
+
+	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
+		ret = spi_nor_read_cr(nor, nor->bouncebuf);
+		if (ret)
+			return ret;
+
+		sr_cr[1] = nor->bouncebuf[0];
+	}
+
+	return spi_nor_is_locked_sr(nor, ofs, len, sr_cr);
 }
 
 static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {
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
