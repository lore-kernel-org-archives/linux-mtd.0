Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AACCE8D6A
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlAy2SViOPEr2OEPOXGp0IeBkigk3xIowaYk0EYOHQU=; b=vb4Jd/EmBWJmd8
	nIKKTnTjx7PKHImSxFKNaBHRq1tMTPkgOrBiJ/AroNV8CgA6lNvjD1Fu5tJJYvDuCtB/8FBXEqG29
	EXIPrTX0ZQ0BczYgsAQSQeefFsPtWnJQaLrT1xhdCGYK2E8RJxgUmNaq23QoU6ZgQ484PjV3GcX3p
	7h0emnQF0JzE4ZlPpMmLaR69k7Vtqgcy/6bMXIghA+k2haYVwws0sIf0EhiqvfSeyit+cKzjbrShQ
	qmKOXxThLi1cv2B9M0VF1Mw5jKqIFAjPhUrhZwQYApS10Ak3wLgnnsn5Z2HkxxbOul+ziCSecU1+g
	HwdUCQ4AIh5Tb0QVacjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzQ-0000000Ct6H-0tbA;
	Fri, 14 Nov 2025 17:53:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzN-0000000Ct1m-0AN2
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C5004E416B8;
	Fri, 14 Nov 2025 17:53:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DC726060E;
	Fri, 14 Nov 2025 17:53:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AECFD103719A5;
	Fri, 14 Nov 2025 18:53:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142814; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y/WeeXtRbXR7iq7YMUsDfUK2bl94kyFbQtNORKsntUA=;
	b=P34ptUBHyEzPqiVlqXNQY1uDiSCnHX+Ve20zAwtwsVx1ksZrzkBjxNY26CaKjDYO9DAFD9
	LhvgKl5s+hMH874t2S5ZF+m13apiAwd0zxtwsS/NTFG1uJ7HtPJYd/MIMJuzwlbKg/etWi
	kQwVprg9+3JL6slT0PRqaVxH28/RXQIHQg9yon3vNMaiEDHsqsvFstFHBwhipCPa6rNk8u
	IKxhukFaFbR+a0T105TU/IgB+v4l2sFmen4+egzpab9qCVl60Eumo1cDQCZ6n/+2yLYfyD
	PE3KyilnkWmJzzP5fZ79ui3DYrFFZ7tRiCbqnSvYQEqX6i/oF7sGU+LQpEZQog==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:09 +0100
Subject: [PATCH 08/19] mtd: spi-nor: swp: Use a pointer for SR instead of a
 single byte
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-8-487bc7129931@bootlin.com>
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
X-CRM114-CacheID: sfid-20251114_095337_219150_5F4A3A1B 
X-CRM114-Status: GOOD (  15.59  )
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

At this stage, the Status Register is most often seen as a single
byte. This is subject to change when we will need to read the CMP bit
which is located in the Control Register (kind of secondary status
register). Both will need to be carried.

Change a few prototypes to carry a u8 pointer. This way it also makes it
very clear where we access the first register, and where we will access
the second.

There is no functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/swp.c | 48 ++++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 350fb8cd67dbafa3c62201c8c06bff7131143c04..bac07287ada036f49c25237549e4900f76a0247d 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -53,13 +53,13 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 		return sector_size;
 }
 
-static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
+static void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, loff_t *ofs,
 					u64 *len)
 {
 	u64 min_prot_len;
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
-	u8 bp, val = sr & mask;
+	u8 bp, val = sr[0] & mask;
 
 	if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3_BIT6)
 		val = (val & ~SR_BP3_BIT6) | SR_BP3;
@@ -79,7 +79,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;
@@ -90,7 +90,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
  * (if @locked is false); false otherwise.
  */
 static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
-					 u64 len, u8 sr, bool locked)
+					 u64 len, const u8 *sr, bool locked)
 {
 	loff_t lock_offs, lock_offs_max, offs_max;
 	u64 lock_len;
@@ -111,13 +111,13 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
-static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, u8 sr)
+static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, const u8 *sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
 }
 
 static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
-				   u8 sr)
+				   const u8 *sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
 }
@@ -158,7 +158,8 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len;
-	int ret, status_old, status_new;
+	int ret;
+	u8 status_old[1] = {}, status_new[1] = {};
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
@@ -170,7 +171,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	status_old = nor->bouncebuf[0];
+	status_old[0] = nor->bouncebuf[0];
 
 	/* If nothing in our range is unlocked, we don't need to do anything */
 	if (spi_nor_is_locked_sr(nor, ofs, len, status_old))
@@ -215,7 +216,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
 
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
@@ -223,20 +224,20 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	 * WP# pin hard strapped to GND can be a valid use case.
 	 */
 	if (!(nor->flags & SNOR_F_NO_WP))
-		status_new |= SR_SRWD;
+		status_new[0] |= SR_SRWD;
 
 	if (!use_top)
-		status_new |= tb_mask;
+		status_new[0] |= tb_mask;
 
 	/* Don't bother if they're the same */
-	if (status_new == status_old)
+	if (status_new[0] == status_old[0])
 		return 0;
 
 	/* Only modify protection if it will not unlock other areas */
-	if ((status_new & mask) < (status_old & mask))
+	if ((status_new[0] & mask) < (status_old[0] & mask))
 		return -EINVAL;
 
-	return spi_nor_write_sr_and_check(nor, status_new);
+	return spi_nor_write_sr_and_check(nor, status_new[0]);
 }
 
 /*
@@ -247,7 +248,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len;
-	int ret, status_old, status_new;
+	int ret;
+	u8 status_old[1], status_new[1];
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
@@ -259,7 +261,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	status_old = nor->bouncebuf[0];
+	status_old[0] = nor->bouncebuf[0];
 
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
@@ -303,24 +305,24 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
-		status_new &= ~SR_SRWD;
+		status_new[0] &= ~SR_SRWD;
 
 	if (!use_top)
-		status_new |= tb_mask;
+		status_new[0] |= tb_mask;
 
 	/* Don't bother if they're the same */
-	if (status_new == status_old)
+	if (status_new[0] == status_old[0])
 		return 0;
 
 	/* Only modify protection if it will not lock other areas */
-	if ((status_new & mask) > (status_old & mask))
+	if ((status_new[0] & mask) > (status_old[0] & mask))
 		return -EINVAL;
 
-	return spi_nor_write_sr_and_check(nor, status_new);
+	return spi_nor_write_sr_and_check(nor, status_new[0]);
 }
 
 /*
@@ -338,7 +340,7 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
+	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf);
 }
 
 /*

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
