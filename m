Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AC6C32771
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 07:56:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2A2206ED
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 07:56:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fvgzP5fE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROfOd9O+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB2A2206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yfR8e+ZCyu/4Qx1ZwKRlvcav/e5fjP0jHPD2L96SDrU=; b=fvgzP5fEPbGR+p
	IGA5LPzKxvnqSU5Fw18pg+iT1GBWCCKy9pKE66x+m5tx7bPvY8DGgZ1KjfRpDVTU2STMS/YKi/ZSS
	VWi5ovCwpte9w+YS3mGfU172ay8gNI5yQQM3CjMOOks36cfq1/gIcbwrp0cz1wxfLLUhrT+2QuMji
	19fF8YU65a0+Zk7yAe01Z2d0XnLBkz5Eq+35qzKoOTZoMRo9l9Ri1EH7S5RSMP1XO9Il9K+QcXolw
	keetWzIr4X6/YchlazxTgyjbywqGulFKihXA7kCtL0KvQ6laAJAqT4ZYGDyx46DSsekWQ7JE+DAZL
	1iRaPgWmjdYADYQP6RnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipSgN-0003tg-TI; Thu, 09 Jan 2020 07:56:43 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipSgL-0003t9-27
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 07:56:43 +0000
Received: by mail-pj1-x1041.google.com with SMTP id s94so698859pjc.1
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2020 23:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3pvRpAuWuE9pCrIrExvki446by0u+MyiGEBxUOw8PM=;
 b=ROfOd9O+bs1bggmqlSF276LpZUm7lBZQAZ1JParXtj4HFLBg+wZA1e0K4Tml2ZdoU5
 0Xp4yuhH+YHyeilONvxB5YSbsdrcAVfTvpy2ZjGR4FBauSfIFblcoCVuC/oDLMqEdzBU
 iblmQUUuDTEqoC5BeNfQfwFAtW9mqT/C1nE4FUvNQzU8PN3I6A8ByGAFUKlBh8CtUDaU
 0SkZ9ODVQSGS//8+XhQ164A8v+YxAELNfcfhPI7309WvWFzegcZham3d4QeIWdFMvcK7
 Nb/livf6qpp4WrQQLa8S25FONWOK0xfB34zf6M5qrK3PHea5r7o8HHWETKDZD2bCI/18
 2HaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y3pvRpAuWuE9pCrIrExvki446by0u+MyiGEBxUOw8PM=;
 b=F8F4xmx+3BbLRIslucO9H9l6x5rw434DCO6bgxZ+P12M/KNXiv3J59FJT6zXrD3j+p
 3Q3VX6fr6nZ1U1zfrARzbHIF5ezIR7o/xZZoWWF8EiJVQUzOCMKOvM4mPB4xBK7tWtgS
 ywDgYKa6iHR6KjreQ8++UMyr0IOp3o/yjY7P8Dp7mQ0e1Uf106ugrTtnTUscdFKL6P8m
 V08gttt6GjNhUfdn5A5AVJDyvcErma0rgzAZ71ysn329priuPnw3SUWsnM/D0ZBRAT4a
 4A1k1AISuj29RJHiQr50osl8rg75X76u00Q8R/jMG74XHgeXE9xSRZnSFYtCQVk5Q7xX
 ndmA==
X-Gm-Message-State: APjAAAUtwQkdcJJLGJQTStW0Ijp9TYX06e/vs8E3djV44c+/XgADh7kU
 0p4bMtTDToQ1x1Ij7yuR47KooQofap+BbQ==
X-Google-Smtp-Source: APXvYqyRnTjLB7/kto8n2tIpB3/N7RNTMnWOkjYjaIRur4epi7ePHkh0KUn9gbGljk+x7AgrHGMgNA==
X-Received: by 2002:a17:902:d20c:: with SMTP id
 t12mr10485217ply.18.1578556599768; 
 Wed, 08 Jan 2020 23:56:39 -0800 (PST)
Received: from localhost.localdomain ([240e:379:970:fa70::fa3])
 by smtp.gmail.com with ESMTPSA id l8sm1879325pjy.24.2020.01.08.23.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 23:56:38 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: nand: spi: rework detect procedure for different read id
 op
Date: Thu,  9 Jan 2020 15:54:00 +0800
Message-Id: <20200109075551.357179-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_235641_132277_84E5BB53 
X-CRM114-Status: GOOD (  17.39  )
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
Cc: Richard Weinberger <richard@nod.at>, Chuanhong Guo <gch981213@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently there are 3 different variants of read_id implementation:
1. opcode only. Found in GD5FxGQ4xF.
2. opcode + 1 addr byte. Found in GD5GxGQ4xA/E
3. opcode + 1 dummy byte. Found in other currently supported chips.

Original implementation was for variant 1 and let detect function
of chips with variant 2 and 3 to ignore the first byte. This isn't
robust:

1. For chips of variant 2, if SPI master doesn't keep MOSI low
during read, chip will get a random id offset, and the entire id
buffer will shift by that offset, causing detect failure.

2. For chips of variant 1, if it happens to get a devid that equals
to manufacture id of variant 2 or 3 chips, it'll get incorrectly
detected.

This patch reworks detect procedure to address problems above. New
logic do detection for all variants separatedly, in 1-2-3 order.
Since all current detect methods do exactly the same id matching
procedure, unify them into core.c and remove detect method from
manufacture_ops.

Tested on GD5F1GQ4UAYIG and W25N01GVZEIG.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/mtd/nand/spi/core.c       | 89 +++++++++++++++++++++++--------
 drivers/mtd/nand/spi/gigadevice.c | 46 ++++++----------
 drivers/mtd/nand/spi/macronix.c   | 25 ++-------
 drivers/mtd/nand/spi/micron.c     | 24 ++-------
 drivers/mtd/nand/spi/paragon.c    | 23 ++------
 drivers/mtd/nand/spi/toshiba.c    | 25 ++-------
 drivers/mtd/nand/spi/winbond.c    | 29 ++--------
 include/linux/mtd/spinand.h       | 24 ++++-----
 8 files changed, 110 insertions(+), 175 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 89f6beefb01c..91293cb10b18 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -370,10 +370,11 @@ static int spinand_wait(struct spinand_device *spinand, u8 *s)
 	return status & STATUS_BUSY ? -ETIMEDOUT : 0;
 }
 
-static int spinand_read_id_op(struct spinand_device *spinand, u8 *buf)
+static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
+			      u8 ndummy, u8 *buf)
 {
-	struct spi_mem_op op = SPINAND_READID_OP(0, spinand->scratchbuf,
-						 SPINAND_MAX_ID_LEN);
+	struct spi_mem_op op = SPINAND_READID_OP(
+		naddr, ndummy, spinand->scratchbuf, SPINAND_MAX_ID_LEN);
 	int ret;
 
 	ret = spi_mem_exec_op(spinand->spimem, &op);
@@ -753,33 +754,85 @@ static const struct nand_ops spinand_ops = {
 	.isbad = spinand_isbad,
 };
 
-static const struct spinand_manufacturer *spinand_manufacturers[] = {
+static const struct spinand_manufacturer *spinand_manufacturers_op_id[] = {
 	&gigadevice_spinand_manufacturer,
+	NULL
+};
+
+static const struct spinand_manufacturer *spinand_manufacturers_op_1a_id[] = {
+	&gigadevice_spinand_manufacturer_1a_id,
+	NULL
+};
+
+static const struct spinand_manufacturer *spinand_manufacturers_op_1d_id[] = {
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
 	&toshiba_spinand_manufacturer,
 	&winbond_spinand_manufacturer,
+	NULL
 };
 
-static int spinand_manufacturer_detect(struct spinand_device *spinand)
+static int
+spinand_manufacturer_match_id(struct spinand_device *spinand,
+			      const struct spinand_manufacturer **manufacturers)
 {
-	unsigned int i;
+	u8 *id = spinand->id.data;
+	unsigned int i, j;
+	u16 devid;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(spinand_manufacturers); i++) {
-		ret = spinand_manufacturers[i]->ops->detect(spinand);
-		if (ret > 0) {
-			spinand->manufacturer = spinand_manufacturers[i];
-			return 0;
-		} else if (ret < 0) {
-			return ret;
-		}
-	}
+	for (i = 0; manufacturers[i]; i++) {
+		if (id[0] != manufacturers[i]->id)
+			continue;
 
+		devid = 0;
+		for (j = 0; j < manufacturers[i]->devid_len; j++)
+			devid = devid << 8 | id[j + 1];
+
+		ret = spinand_match_and_init(spinand,
+					     manufacturers[i]->spinand_table,
+					     manufacturers[i]->nchips, devid);
+		if (ret < 0)
+			continue;
+
+		spinand->manufacturer = manufacturers[i];
+		spinand->id.len = 1 + manufacturers[i]->devid_len;
+		return 0;
+	}
 	return -ENOTSUPP;
 }
 
+static int spinand_manufacturer_detect(struct spinand_device *spinand)
+{
+	u8 *id = spinand->id.data;
+	int ret;
+
+	ret = spinand_read_id_op(spinand, 0, 0, id);
+	if (ret)
+		return ret;
+	ret = spinand_manufacturer_match_id(spinand,
+					    spinand_manufacturers_op_id);
+	if (!ret)
+		return 0;
+
+	ret = spinand_read_id_op(spinand, 1, 0, id);
+	if (ret)
+		return ret;
+	ret = spinand_manufacturer_match_id(spinand,
+					    spinand_manufacturers_op_1a_id);
+	if (!ret)
+		return 0;
+
+	ret = spinand_read_id_op(spinand, 0, 1, id);
+	if (ret)
+		return ret;
+	ret = spinand_manufacturer_match_id(spinand,
+					    spinand_manufacturers_op_1d_id);
+
+	return ret;
+}
+
 static int spinand_manufacturer_init(struct spinand_device *spinand)
 {
 	if (spinand->manufacturer->ops->init)
@@ -898,12 +951,6 @@ static int spinand_detect(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
-	ret = spinand_read_id_op(spinand, spinand->id.data);
-	if (ret)
-		return ret;
-
-	spinand->id.len = SPINAND_MAX_ID_LEN;
-
 	ret = spinand_manufacturer_detect(spinand);
 	if (ret) {
 		dev_err(dev, "unknown raw ID %*phN\n", SPINAND_MAX_ID_LEN,
diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index e99d425aa93f..363a1ad41dfa 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -194,7 +194,7 @@ static int gd5fxgq4ufxxg_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
-static const struct spinand_info gigadevice_spinand_table[] = {
+static const struct spinand_info gigadevice_spinand_table_id1[] = {
 	SPINAND_INFO("GD5F1GQ4xA", 0xF1,
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
@@ -231,6 +231,9 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&gd5fxgq4_variant2_ooblayout,
 				     gd5fxgq4uexxg_ecc_get_status)),
+};
+
+static const struct spinand_info gigadevice_spinand_table_id2[] = {
 	SPINAND_INFO("GD5F1GQ4UFxxG", 0xb148,
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
@@ -242,39 +245,24 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 				     gd5fxgq4ufxxg_ecc_get_status)),
 };
 
-static int gigadevice_spinand_detect(struct spinand_device *spinand)
-{
-	u8 *id = spinand->id.data;
-	u16 did;
-	int ret;
-
-	/*
-	 * Earlier GDF5-series devices (A,E) return [0][MID][DID]
-	 * Later (F) devices return [MID][DID1][DID2]
-	 */
-
-	if (id[0] == SPINAND_MFR_GIGADEVICE)
-		did = (id[1] << 8) + id[2];
-	else if (id[0] == 0 && id[1] == SPINAND_MFR_GIGADEVICE)
-		did = id[2];
-	else
-		return 0;
-
-	ret = spinand_match_and_init(spinand, gigadevice_spinand_table,
-				     ARRAY_SIZE(gigadevice_spinand_table),
-				     did);
-	if (ret)
-		return ret;
-
-	return 1;
-}
-
 static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {
-	.detect = gigadevice_spinand_detect,
+};
+
+/* These chips need 1 addr byte in read_id op */
+const struct spinand_manufacturer gigadevice_spinand_manufacturer_1a_id = {
+	.id = SPINAND_MFR_GIGADEVICE,
+	.name = "GigaDevice",
+	.devid_len = 1,
+	.spinand_table = gigadevice_spinand_table_id1,
+	.nchips = ARRAY_SIZE(gigadevice_spinand_table_id1),
+	.ops = &gigadevice_spinand_manuf_ops,
 };
 
 const struct spinand_manufacturer gigadevice_spinand_manufacturer = {
 	.id = SPINAND_MFR_GIGADEVICE,
 	.name = "GigaDevice",
+	.devid_len = 2,
+	.spinand_table = gigadevice_spinand_table_id2,
+	.nchips = ARRAY_SIZE(gigadevice_spinand_table_id2),
 	.ops = &gigadevice_spinand_manuf_ops,
 };
diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 21def3f8fb36..7b384ce86d80 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -118,33 +118,14 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 };
 
-static int macronix_spinand_detect(struct spinand_device *spinand)
-{
-	u8 *id = spinand->id.data;
-	int ret;
-
-	/*
-	 * Macronix SPI NAND read ID needs a dummy byte, so the first byte in
-	 * raw_id is garbage.
-	 */
-	if (id[1] != SPINAND_MFR_MACRONIX)
-		return 0;
-
-	ret = spinand_match_and_init(spinand, macronix_spinand_table,
-				     ARRAY_SIZE(macronix_spinand_table),
-				     id[2]);
-	if (ret)
-		return ret;
-
-	return 1;
-}
-
 static const struct spinand_manufacturer_ops macronix_spinand_manuf_ops = {
-	.detect = macronix_spinand_detect,
 };
 
 const struct spinand_manufacturer macronix_spinand_manufacturer = {
 	.id = SPINAND_MFR_MACRONIX,
 	.name = "Macronix",
+	.devid_len = 1,
+	.spinand_table = macronix_spinand_table,
+	.nchips = ARRAY_SIZE(macronix_spinand_table),
 	.ops = &macronix_spinand_manuf_ops,
 };
diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 7d7b1f7fcf71..0ad7d2eb1920 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -102,32 +102,14 @@ static const struct spinand_info micron_spinand_table[] = {
 				     mt29f2g01abagd_ecc_get_status)),
 };
 
-static int micron_spinand_detect(struct spinand_device *spinand)
-{
-	u8 *id = spinand->id.data;
-	int ret;
-
-	/*
-	 * Micron SPI NAND read ID need a dummy byte,
-	 * so the first byte in raw_id is dummy.
-	 */
-	if (id[1] != SPINAND_MFR_MICRON)
-		return 0;
-
-	ret = spinand_match_and_init(spinand, micron_spinand_table,
-				     ARRAY_SIZE(micron_spinand_table), id[2]);
-	if (ret)
-		return ret;
-
-	return 1;
-}
-
 static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
-	.detect = micron_spinand_detect,
 };
 
 const struct spinand_manufacturer micron_spinand_manufacturer = {
 	.id = SPINAND_MFR_MICRON,
 	.name = "Micron",
+	.devid_len = 1,
+	.spinand_table = micron_spinand_table,
+	.nchips = ARRAY_SIZE(micron_spinand_table),
 	.ops = &micron_spinand_manuf_ops,
 };
diff --git a/drivers/mtd/nand/spi/paragon.c b/drivers/mtd/nand/spi/paragon.c
index 52307681cbd0..19f6f4269d47 100644
--- a/drivers/mtd/nand/spi/paragon.c
+++ b/drivers/mtd/nand/spi/paragon.c
@@ -117,31 +117,14 @@ static const struct spinand_info paragon_spinand_table[] = {
 				     pn26g0xa_ecc_get_status)),
 };
 
-static int paragon_spinand_detect(struct spinand_device *spinand)
-{
-	u8 *id = spinand->id.data;
-	int ret;
-
-	/* Read ID returns [0][MID][DID] */
-
-	if (id[1] != SPINAND_MFR_PARAGON)
-		return 0;
-
-	ret = spinand_match_and_init(spinand, paragon_spinand_table,
-				     ARRAY_SIZE(paragon_spinand_table),
-				     id[2]);
-	if (ret)
-		return ret;
-
-	return 1;
-}
-
 static const struct spinand_manufacturer_ops paragon_spinand_manuf_ops = {
-	.detect = paragon_spinand_detect,
 };
 
 const struct spinand_manufacturer paragon_spinand_manufacturer = {
 	.id = SPINAND_MFR_PARAGON,
 	.name = "Paragon",
+	.devid_len = 1,
+	.spinand_table = paragon_spinand_table,
+	.nchips = ARRAY_SIZE(paragon_spinand_table),
 	.ops = &paragon_spinand_manuf_ops,
 };
diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index 1cb3760ff779..5724f6ca70c0 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -156,33 +156,14 @@ static const struct spinand_info toshiba_spinand_table[] = {
 				     tc58cxgxsx_ecc_get_status)),
 };
 
-static int toshiba_spinand_detect(struct spinand_device *spinand)
-{
-	u8 *id = spinand->id.data;
-	int ret;
-
-	/*
-	 * Toshiba SPI NAND read ID needs a dummy byte,
-	 * so the first byte in id is garbage.
-	 */
-	if (id[1] != SPINAND_MFR_TOSHIBA)
-		return 0;
-
-	ret = spinand_match_and_init(spinand, toshiba_spinand_table,
-				     ARRAY_SIZE(toshiba_spinand_table),
-				     id[2]);
-	if (ret)
-		return ret;
-
-	return 1;
-}
-
 static const struct spinand_manufacturer_ops toshiba_spinand_manuf_ops = {
-	.detect = toshiba_spinand_detect,
 };
 
 const struct spinand_manufacturer toshiba_spinand_manufacturer = {
 	.id = SPINAND_MFR_TOSHIBA,
 	.name = "Toshiba",
+	.devid_len = 1,
+	.spinand_table = toshiba_spinand_table,
+	.nchips = ARRAY_SIZE(toshiba_spinand_table),
 	.ops = &toshiba_spinand_manuf_ops,
 };
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index a6c17e0cace8..489bfe6be2f1 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -94,31 +94,6 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
 };
 
-/**
- * winbond_spinand_detect - initialize device related part in spinand_device
- * struct if it is a Winbond device.
- * @spinand: SPI NAND device structure
- */
-static int winbond_spinand_detect(struct spinand_device *spinand)
-{
-	u8 *id = spinand->id.data;
-	int ret;
-
-	/*
-	 * Winbond SPI NAND read ID need a dummy byte,
-	 * so the first byte in raw_id is dummy.
-	 */
-	if (id[1] != SPINAND_MFR_WINBOND)
-		return 0;
-
-	ret = spinand_match_and_init(spinand, winbond_spinand_table,
-				     ARRAY_SIZE(winbond_spinand_table), id[2]);
-	if (ret)
-		return ret;
-
-	return 1;
-}
-
 static int winbond_spinand_init(struct spinand_device *spinand)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -138,12 +113,14 @@ static int winbond_spinand_init(struct spinand_device *spinand)
 }
 
 static const struct spinand_manufacturer_ops winbond_spinand_manuf_ops = {
-	.detect = winbond_spinand_detect,
 	.init = winbond_spinand_init,
 };
 
 const struct spinand_manufacturer winbond_spinand_manufacturer = {
 	.id = SPINAND_MFR_WINBOND,
 	.name = "Winbond",
+	.devid_len = 1,
+	.spinand_table = winbond_spinand_table,
+	.nchips = ARRAY_SIZE(winbond_spinand_table),
 	.ops = &winbond_spinand_manuf_ops,
 };
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 4ea558bd3c46..9e7968c6fdbf 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -32,9 +32,9 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPINAND_READID_OP(ndummy, buf, len)				\
+#define SPINAND_READID_OP(naddr, ndummy, buf, len)			\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(0x9f, 1),				\
-		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_ADDR(naddr, 0, 1),			\
 		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
 		   SPI_MEM_OP_DATA_IN(len, buf, 1))
 
@@ -189,24 +189,13 @@ struct spinand_id {
 
 /**
  * struct manufacurer_ops - SPI NAND manufacturer specific operations
- * @detect: detect a SPI NAND device. Every time a SPI NAND device is probed
- *	    the core calls the struct_manufacurer_ops->detect() hook of each
- *	    registered manufacturer until one of them return 1. Note that
- *	    the first thing to check in this hook is that the manufacturer ID
- *	    in struct_spinand_device->id matches the manufacturer whose
- *	    ->detect() hook has been called. Should return 1 if there's a
- *	    match, 0 if the manufacturer ID does not match and a negative
- *	    error code otherwise. When true is returned, the core assumes
- *	    that properties of the NAND chip (spinand->base.memorg and
- *	    spinand->base.eccreq) have been filled
  * @init: initialize a SPI NAND device
  * @cleanup: cleanup a SPI NAND device
  *
  * Each SPI NAND manufacturer driver should implement this interface so that
- * NAND chips coming from this vendor can be detected and initialized properly.
+ * NAND chips coming from this vendor can be initialized properly.
  */
 struct spinand_manufacturer_ops {
-	int (*detect)(struct spinand_device *spinand);
 	int (*init)(struct spinand_device *spinand);
 	void (*cleanup)(struct spinand_device *spinand);
 };
@@ -215,15 +204,22 @@ struct spinand_manufacturer_ops {
  * struct spinand_manufacturer - SPI NAND manufacturer instance
  * @id: manufacturer ID
  * @name: manufacturer name
+ * @devid_len: number of bytes in device ID
+ * @spinand_table: array with info for spi nands under current manufacturer
+ * @nchips: number of chips available in spinand_table
  * @ops: manufacturer operations
  */
 struct spinand_manufacturer {
 	u8 id;
 	char *name;
+	u8 devid_len;
+	const struct spinand_info *spinand_table;
+	size_t nchips;
 	const struct spinand_manufacturer_ops *ops;
 };
 
 /* SPI NAND manufacturers */
+extern const struct spinand_manufacturer gigadevice_spinand_manufacturer_1a_id;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
