Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFB4CE8D6F
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CN77ro4zIa+tys4UaSFQOQz29HXtz1W78hOBiD08jRY=; b=XDsNuAG9xpS15H
	xcQE1qxrka2b89nSPveez1NOApjchYxDoiTtQ3/+PvRIdXygD0q5mT0SVIS7dmtWgn+hObWp2a0qe
	oTjMZW/I1IjBocXVsDVDpL7jNXA9DnfWuLZp51blQfu6eHja0+4cHHVrL0pR5DdwirEeqD3n+6kPs
	kK+Uznvnt+xPZENFepma1Mt2BaUbK2HPciRNmANoV5FOEdggHwfXszbcczuSr8MFNHMsXCXc8EwR9
	NmsghNa6txXAZVOgxHKcWlLn/h/e4YSDwGzX46Y4euD6w3U+BLLoyPB/GR9PY09rFb5aAaxtpPgtW
	MLs2gESFY3YQLUiqEoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzW-0000000CtFB-03Ap;
	Fri, 14 Nov 2025 17:53:46 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzT-0000000CtAT-3el6
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7CFE71A1A84;
	Fri, 14 Nov 2025 17:53:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 531456060E;
	Fri, 14 Nov 2025 17:53:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5377103719B8;
	Fri, 14 Nov 2025 18:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X+WamAy2nRs/ruUdo1bhUm2AXL9vdRoCmEPHNhd85A8=;
	b=l7hN54ihYOXOl8xCMY6/iScDmoeO9KeCNkS5ahGrpe8iuydviys/kBEHJ4SojnkTfpyhmf
	PLLuA8c7UckD9hcKmPW10g6T5EWM9KbrN4SvZ0PqG7deQvk2pYGxHayNhhYtdyDp07sJCy
	V1Qcs3gh+3Dquk8jcpCg29JWWVPDx9RnWS0ma0ltoyDKyMKevbJ7FftFRgqCIDCbESLVc8
	SRkcHZRRaNTitI941CMk9lMtq2wnZ0Bdks5OLtLXvI0M9wCXOhCqrLv26va2weG7OJXv7y
	aqo7zJFFLGkaeqxANfsV3ncophWJhjIWjO6Vk/ok29H05HzUHnlFFFn3MSt4uw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:13 +0100
Subject: [PATCH 12/19] mtd: spi-nor: swp: Create helpers for building the
 SR register
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-12-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_095344_063801_D73FDB24 
X-CRM114-Status: GOOD (  14.92  )
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

The status register contains 3 or 4 BP (Block Protect) bits, 0 or 1
TB (Top/Bottom) bit, soon 0 or 1 CMP (Complement) bit. The last BP bit
and the TB bit locations change between vendors. The whole logic of
buildling the content of the status register based on some input
conditions is used two times and soon will be used 4 times.

Create dedicated helpers for these steps.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 83 +++++++++++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 61d899b4fbf42b8bd9d86dc4e6b3ffcfe91a90e8..48c4f76db793a17dedb0f904d57e446de8fd04cd 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -123,6 +123,43 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
 }
 
+static int spi_nor_sr_set_bp_mask(struct spi_nor *nor, u8 *sr, u8 pow)
+{
+	u8 mask = spi_nor_get_sr_bp_mask(nor);
+	u8 val = pow << SR_BP_SHIFT;
+
+	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
+		val = (val & ~SR_BP3) | SR_BP3_BIT6;
+
+	if (val & ~mask)
+		return -EINVAL;
+
+	sr[0] = val;
+
+	return 0;
+}
+
+static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
+			    u8 pow, bool use_top)
+{
+	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
+	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
+	int ret;
+
+	new_sr[0] = old_sr[0] & ~bp_mask & ~tb_mask;
+
+	/* Build BP field*/
+	ret = spi_nor_sr_set_bp_mask(nor, &new_sr[0], pow);
+	if (ret)
+		return ret;
+
+	/* Build TB field */
+	if (!use_top)
+		new_sr[0] |= tb_mask;
+
+	return 0;
+}
+
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
  * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the status
@@ -162,11 +199,10 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	int ret;
 	u8 status_old[1] = {}, status_new[1] = {};
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
-	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
+	u8 pow;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
@@ -200,24 +236,19 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs + len;
 
 	if (lock_len == nor->params->size) {
-		val = bp_mask;
+		pow = (nor->flags & SNOR_F_HAS_4BIT_BP) ? GENMASK(3, 0) : GENMASK(2, 0);
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
-		val = pow << SR_BP_SHIFT;
-
-		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
-			val = (val & ~SR_BP3) | SR_BP3_BIT6;
-
-		if (val & ~bp_mask)
-			return -EINVAL;
-
-		/* Don't "lock" with no region! */
-		if (!(val & bp_mask))
-			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
+	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
+	if (ret)
+		return ret;
+
+	/* Don't "lock" with no region! */
+	if (!(status_new[0] & bp_mask))
+		return -EINVAL;
 
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
@@ -227,9 +258,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (!(nor->flags & SNOR_F_NO_WP))
 		status_new[0] |= SR_SRWD;
 
-	if (!use_top)
-		status_new[0] |= tb_mask;
-
 	/* Don't bother if they're the same */
 	if (status_new[0] == status_old[0])
 		return 0;
@@ -252,11 +280,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	int ret;
 	u8 status_old[1], status_new[1];
 	u8 bp_mask = spi_nor_get_sr_bp_mask(nor);
-	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
+	u8 pow;
 
 	ret = spi_nor_read_sr(nor, nor->bouncebuf);
 	if (ret)
@@ -292,29 +319,21 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 		lock_len = ofs;
 
 	if (lock_len == 0) {
-		val = 0; /* fully unlocked */
+		pow = 0; /* fully unlocked */
 	} else {
 		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
-		val = pow << SR_BP_SHIFT;
 
-		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
-			val = (val & ~SR_BP3) | SR_BP3_BIT6;
-
-		/* Some power-of-two sizes may not be supported */
-		if (val & ~bp_mask)
-			return -EINVAL;
 	}
 
-	status_new[0] = (status_old[0] & ~bp_mask & ~tb_mask) | val;
+	ret = spi_nor_build_sr(nor, status_old, status_new, pow, use_top);
+	if (ret)
+		return ret;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
 		status_new[0] &= ~SR_SRWD;
 
-	if (!use_top)
-		status_new[0] |= tb_mask;
-
 	/* Don't bother if they're the same */
 	if (status_new[0] == status_old[0])
 		return 0;

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
