Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A09CD5BD0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7m2oqR3g47E3HrtYEZMfKk9DFUCss0X0T/3DndA0fZ4=; b=pcRJZGfW+Cvewc
	PZZL7yKAmgEysqbEpr8EnxB3mwUKeVaJkbKyzmolpYAjRrSOJPAD2LLmn1AbUu5fbSNSPo/10KJ1n
	0CRhkXg0daF5cNXJ6j8lUmujLqhzDYiRCdrGPY2oBW7AaL6I0/xXWb8mRzw3ErB05nPZlq9cwzfyr
	hWws+/nS5PNJ0JMK2T1/80pS4MH4KOg6r9DIGFLmnS/64267tc2glJS0u8zr5AowGtUQ0TIbARg1s
	xSHxaKYpl5mawby6Kmwwl/RnBjq/PsUl1gzzs57afw3jRHFPA/VjvIFAJyI6D2+1pmhtpPgt5hGng
	jtPyLdGDBZHmNo/IGqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDn-00000002Fsi-2rLr;
	Tue, 26 May 2026 14:57:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDk-00000002Fld-0DwA
	for linux-mtd@bombadil.infradead.org;
	Tue, 26 May 2026 14:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=v0jG7SSL0hvSmqOXyehgxCQdSJBYzJtwCSoWUhoR7Js=; b=g1xbXL5AX7bzLEN9T5NIbWX2fP
	/WuJsPXbYRNDRMIp7e+w16UT0K4GJ6P1rCRfviq7pwRfrslAoNj7Cv0lxbJoTe32wcDliVirTcT2p
	D03jpcJZp6drTKNNjx0RUsdER7audTdWLvxjmzfJm1TFEqJ3u644ve+OYz0xokenNQupkT0ey+1E/
	ky6Un5MIeKRUMyEOiTjl0H75dWPOpFuKS0xbUKYa7MFDBU2avG7B6BVFQgkBFCzIHTcyVa13y7+bc
	wpRZbgzsCwga5Qydi4PGwURySoGkxzT+kUSZzDwxAFnIR9drmumKZJ48bGBOhQSoMl5xT4dkgQEsD
	5kKNT82A==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDf-0000000BamM-1DT7
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D2532C2C643;
	Tue, 26 May 2026 14:57:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 502206011D;
	Tue, 26 May 2026 14:57:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0B59108888C9;
	Tue, 26 May 2026 16:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v0jG7SSL0hvSmqOXyehgxCQdSJBYzJtwCSoWUhoR7Js=;
	b=ZOfMtD+0427Ea+nIw0akmEqwdqb/QCLYZOTtCBUZYyjzdXNY2h9s3QA3eYoXj7LQvhxAdL
	h0p8OzFcsI0RSgqmP58Ba9JcxC73nc0qepBwgBOpkJ5b3Z6C2EAFnStFNSun/sHRJz9mLh
	t+flr4j90/zaxgCbliCQ4jUR+JlixWXSghvSz+kN+8NAmi24qBqpMga+MJHJnXn1pmL0w2
	eyhVrGcnHwA8lJ7RY4wM4gk/xw1jsFWKUNz9mqeF1st9wxhCd8QNUvf1QOh/Fr2slgNBca
	9wHgK1xokQDwHikPHSO0vUnvLcCLSvSNpFxBsfy4nvIchSqhIAwr6hMxgNuZjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:34 +0200
Subject: [PATCH v6 10/28] mtd: spi-nor: swp: Use a pointer for SR instead
 of a single byte
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-10-4092f1419f8f@bootlin.com>
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
X-CRM114-CacheID: sfid-20260526_155724_093921_3CC87963 
X-CRM114-Status: GOOD (  16.00  )
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
index f221d6361b57..61830f18a147 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -55,13 +55,13 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
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
@@ -81,7 +81,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	if (*len > nor->params->size)
 		*len = nor->params->size;
 
-	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
+	if (nor->flags & SNOR_F_HAS_SR_TB && sr[0] & tb_mask)
 		*ofs = 0;
 	else
 		*ofs = nor->params->size - *len;
@@ -92,7 +92,7 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
  * (if @locked is false); false otherwise.
  */
 static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
-					 u64 len, u8 sr, bool locked)
+					 u64 len, const u8 *sr, bool locked)
 {
 	loff_t lock_offs, lock_offs_max, offs_max;
 	u64 lock_len;
@@ -113,13 +113,13 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
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
@@ -160,7 +160,8 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
 static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len;
-	int ret, status_old, status_new;
+	int ret;
+	u8 status_old[1] = {}, status_new[1] = {};
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
@@ -172,7 +173,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	status_old = nor->bouncebuf[0];
+	status_old[0] = nor->bouncebuf[0];
 
 	/* If nothing in our range is unlocked, we don't need to do anything */
 	if (spi_nor_is_locked_sr(nor, ofs, len, status_old))
@@ -217,7 +218,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~tb_mask) | val;
+	status_new[0] = (status_old[0] & ~mask & ~tb_mask) | val;
 
 	/*
 	 * Disallow further writes if WP# pin is neither left floating nor
@@ -225,20 +226,20 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -249,7 +250,8 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	u64 min_prot_len;
-	int ret, status_old, status_new;
+	int ret;
+	u8 status_old[1], status_new[1];
 	u8 mask = spi_nor_get_sr_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
 	u8 pow, val;
@@ -261,7 +263,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	status_old = nor->bouncebuf[0];
+	status_old[0] = nor->bouncebuf[0];
 
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
@@ -310,24 +312,24 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
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
@@ -345,7 +347,7 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	if (ret)
 		return ret;
 
-	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
+	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf);
 }
 
 static const struct spi_nor_locking_ops spi_nor_sr_locking_ops = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
