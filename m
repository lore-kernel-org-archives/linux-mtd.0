Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CABACCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FT+Sc2bmuv0Zdhf/h5UH7EuVZsg7u8QcgBoaZ+EGpRE=; b=RQ1FOpaqm6xnxB
	YZiCo9LKwyWRTb/nVaK/waGmEi8n3W7C7QPYRhuxJsWOmeqyrboGaDY2HhhsOoEg9HWuwGJX2HXSp
	133nN2tw4mjvZzuRCwGZzcrA/oL6Klx5+AmH97C9eVy3gNv/S7SypJfKsddBvNgHcD5mTMbtGH+js
	/4AyON2u/utrBbvK4iJEO4CixwpMYhOyadq/nmjLBqW2DJfRRafo86sNUBv7YA+jc5+P7zRQtlSky
	++1HzSotDU/BPW1S0gfVbEzrCXUfxfeskU/xTfaXntLQglySpFW/T4xp6Jjgx4nDCaYsf8nuIeGbV
	4ntrLFPV08UzieztHQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvr-00000006Utm-2k1J;
	Fri, 31 Oct 2025 17:29:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvK-00000006UEN-37np
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D3D3C0E958;
	Fri, 31 Oct 2025 17:28:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0DE4660704;
	Fri, 31 Oct 2025 17:28:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79E221181800B;
	Fri, 31 Oct 2025 18:28:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931704; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=De7gBmjTI9KAJwGNKuzLWU3Oj2vrG8Kq519OwAayKsY=;
	b=Bpj7xOTEWd3bCrNKkoYBh3dnBIrJ1WALpYpR0/E4fonag/pfwZAEx6K5DTbK01TOwnIY8/
	Ze6R+ubl0CZ+TuP0kjj47OuSl86v0emsefdn2Ot2EzPDbluXT+2Lu5eJ8OY0/sHZTnYQUS
	Fo6+++0JBIhn9xp9tz8FmguCKSk7ja0VFA/SR9jB0ljb6LN5tuaJDw490C8ymDX1vsGoSJ
	CUq9SlbUqQH3fg+sWnrfLxi2huY7Qpj5xZXigmcIvkgth0z4KNdreFbEwbKlJustNIor6h
	0mYVuSFDoc1I5oJUr73/+hX/5Qh6lbJnBHLEPKGOtQsrAfKIBga3Qe8S4Ti5TA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:26:55 +0100
Subject: [PATCH 11/28] mtd: spinand: Convert vendor drivers to SPINAND_OP()
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-11-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102827_132794_66D81BEE 
X-CRM114-Status: GOOD (  11.57  )
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

This macro allows to silently switch bus interfaces, use it outside of
the core in all places that can be trivially converted.

At this stage there is no functional change expected, until octal DTR
support gets added.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/esmt.c       | 4 ++--
 drivers/mtd/nand/spi/gigadevice.c | 8 ++++----
 drivers/mtd/nand/spi/macronix.c   | 4 ++--
 drivers/mtd/nand/spi/micron.c     | 8 ++++----
 drivers/mtd/nand/spi/toshiba.c    | 3 ++-
 5 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index f880c3b15ceab14676ab65f3d9e8530c713528c8..ba95e589e12fb4d934a0cd3746c7b286897ffe92 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -137,8 +137,8 @@ static int f50l1g41lb_user_otp_info(struct spinand_device *spinand, size_t len,
 static int f50l1g41lb_otp_lock(struct spinand_device *spinand, loff_t from,
 			       size_t len)
 {
-	struct spi_mem_op write_op = SPINAND_WR_EN_1S_0_0_OP;
-	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
+	struct spi_mem_op write_op = SPINAND_OP(spinand, wr_en);
+	struct spi_mem_op exec_op = SPINAND_OP(spinand, prog_exec, 0);
 	u8 status;
 	int ret;
 
diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 72ad36c9a12693caf863b0d172d4a1f2ac4d5ecd..e4380208edd09445c44a29bb7dd2012a0bb1a1b0 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -266,8 +266,8 @@ static int gd5fxgq4uexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
 	u8 status2;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(GD5FXGQXXEXXG_REG_STATUS2,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  GD5FXGQXXEXXG_REG_STATUS2, spinand->scratchbuf);
 	int ret;
 
 	switch (status & STATUS_ECC_MASK) {
@@ -309,8 +309,8 @@ static int gd5fxgq5xexxg_ecc_get_status(struct spinand_device *spinand,
 					u8 status)
 {
 	u8 status2;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(GD5FXGQXXEXXG_REG_STATUS2,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  GD5FXGQXXEXXG_REG_STATUS2, spinand->scratchbuf);
 	int ret;
 
 	switch (status & STATUS_ECC_MASK) {
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index edf63b9996cf029fffa4948566c7afda77d97cee..143cc120bdec1300f8fe60e951c4da9174668677 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -148,8 +148,8 @@ static int macronix_set_cont_read(struct spinand_device *spinand, bool enable)
 static int macronix_set_read_retry(struct spinand_device *spinand,
 					     unsigned int retry_mode)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_1S_1S_1S_OP(MACRONIX_FEATURE_ADDR_READ_RETRY,
-							       spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, set_feature,
+					  MACRONIX_FEATURE_ADDR_READ_RETRY, spinand->scratchbuf);
 
 	*spinand->scratchbuf = retry_mode;
 	return spi_mem_exec_op(spinand->spimem, &op);
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index b8130e04e8e798519ad38c58b5569935c1a447a2..36f6cbbd7462c0c5c208a28acae6e64e1af954da 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -137,8 +137,8 @@ static const struct mtd_ooblayout_ops micron_4_ooblayout = {
 static int micron_select_target(struct spinand_device *spinand,
 				unsigned int target)
 {
-	struct spi_mem_op op = SPINAND_SET_FEATURE_1S_1S_1S_OP(MICRON_DIE_SELECT_REG,
-						      spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, set_feature,
+					  MICRON_DIE_SELECT_REG, spinand->scratchbuf);
 
 	if (target > 1)
 		return -EINVAL;
@@ -251,8 +251,8 @@ static int mt29f2g01abagd_user_otp_info(struct spinand_device *spinand,
 static int mt29f2g01abagd_otp_lock(struct spinand_device *spinand, loff_t from,
 				   size_t len)
 {
-	struct spi_mem_op write_op = SPINAND_WR_EN_1S_0_0_OP;
-	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_1S_1S_0_OP(0);
+	struct spi_mem_op write_op = SPINAND_OP(spinand, wr_en);
+	struct spi_mem_op exec_op = SPINAND_OP(spinand, prog_exec, 0);
 	u8 status;
 	int ret;
 
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 6530257ac0beddf8b9e5a9591c5f5ccc4803c003..ef649162ee680c2d7db9dc9332e705265bc8f234 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -73,7 +73,8 @@ static int tx58cxgxsxraix_ecc_get_status(struct spinand_device *spinand,
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	u8 mbf = 0;
-	struct spi_mem_op op = SPINAND_GET_FEATURE_1S_1S_1S_OP(0x30, spinand->scratchbuf);
+	struct spi_mem_op op = SPINAND_OP(spinand, get_feature,
+					  0x30, spinand->scratchbuf);
 
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
