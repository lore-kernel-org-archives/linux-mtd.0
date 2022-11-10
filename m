Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A8DC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Nov 2022 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dshif5YqP9feMzqya8MuMhtCls2Baa/6nc/Qu9Fh39o=; b=ro+u8pOyCJxkqO
	EIxfIHsobNT0uU51JEZ6XMo5jYw4ziIiRX5SL+3Wyn7vSKNsHE7bWPFoxksb+ZOXLHrUPRzquQj01
	J65PNtxtRcgHampDCPiKPoO5Elm74jV1J8pRU+WXfW3+N/5hVkMKDrqQVcCY7DfqwaVdelMJGZhwR
	2OxSoQI3tE2hQZTzicoPilSK78L6oejVGSYKKqiBNgjguV4FuGN+OLxAxiDO4IqcV5ACEro0hvOzs
	pfc0dBjt9wlUmDEpSEZZUSbMODB+FF+Oe51Gt4jp4dvpxKmZM07eXG/ckIumBBHq9XFoBzXEe6bOr
	rmxml4Xnl+oQZCRt0X8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9uv-006xjH-5j; Thu, 10 Nov 2022 15:56:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot9to-006wtY-22
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2022 15:55:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D40FB2001E;
	Thu, 10 Nov 2022 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668095726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpUbMxPzLvawE78O8/n7QuT327R+I3sfO6s3ymA1ioU=;
	b=paPInCw3Lu8wCH2c0GMZoW0y3LoOXWlzM6mmuFmGjX+35m8IoqRDrdqRXrgavnrLKv6rbX
	qj51lW8P8cA5DjDEvSGBmdnaWohQ3ZhcQjIS9tftUaDWlxcXCR/4wbmIP3ewwzyxTmB/aP
	TIMkqLE2H37CUseVBkH70497mK7RDKdct17BJKM4hoss2/V41YB+6yp10/3rmN3aGRJJyC
	mg70fUEENi3zsOdlzawkCNhYYfLM2zk233e9kWzuEN5b9KrzCYfSiw7vEKKPAyVh9ZJeBf
	dIObCw5Roscn9CIQDr1NDjvVL/iFVQzHjPHIh72cIKPG7UKOIpcnJarBXDPqEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 8/9] mtd: spi-nor: Enhance locking to support reads while writes
Date: Thu, 10 Nov 2022 16:55:12 +0100
Message-Id: <20221110155513.819798-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_075528_435965_A16495B7 
X-CRM114-Status: GOOD (  30.82  )
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

On devices featuring several banks, the Read While Write (RWW) feature
is here to improve the overall performance when performing parallel
reads and writes at different locations (different banks). The following
constraints have to be taken into account:
1#: A single operation can be performed in a given bank.
2#: Only a single program or erase operation can happen on the entire chip.
3#: The I/O bus is unique and thus is the most constrained resource, all
    spi-nor operations requiring access to the spi bus (through the spi
    controller) must be serialized until the bus exchanges are over. So
    we must ensure a single operation can be "sent" at a time.
4#: Any other operation that would not be either a read or a write or an
    erase is considered requiring access to the full chip and cannot be
    parallelized, we then need to ensure the full chip is in the idle
    state when this occurs.

All these constraints can easily be managed with a proper locking model:
1#: Is protected by a per-bank mutex. Only a single operation can happen
    in a specific bank at any times. If the bank mutex is not available,
    the operation cannot start.
2#: Is handled by the pe_mode mutex which is acquired before any write
    or erase, and is released only at the very end of the
    operation. This way, no other destructive operation on the chip can
    start during this time frame.
3#: A device-wide mutex is introduced in order to capture and serialize
    bus accessed. This is the one being released "sooner" than before,
    because we only need to protect the chip against other SPI accesses
    during the I/O phase, which for the destructive operations is the
    beginning of the operation (when we send the command cycles and
    eventually the data), while the second part of the operation (the
    erase delay or the programmation delay) is when we can do something
    else with another bank.
4#: Is handled by the "generic" helpers which existed before, where
    basically all the locks are taken before the operation can start,
    and all locks are released once done.

As many devices still do not support this feature, the original lock is
also kept in a union: either the feature is available and we initialize
and use the new locks, or it is not and we keep using the previous
logic.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c  | 145 ++++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nor.h |  12 ++-
 2 files changed, 143 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index dfda350d5056..b467d5bf0f2a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1086,6 +1086,61 @@ static void spi_nor_unprep(struct spi_nor *nor)
 		nor->controller_ops->unprepare(nor);
 }
 
+static bool spi_nor_parallel_locking(struct spi_nor *nor)
+{
+	return nor->info->n_banks > 1 && nor->info->no_sfdp_flags & SPI_NOR_RWW;
+}
+
+static void spi_nor_lock_all_banks(struct spi_nor *nor)
+{
+	int i;
+
+	for (i = 0; i < nor->info->n_banks; i++)
+		mutex_lock(&nor->locks.bank[i]);
+}
+
+static void spi_nor_unlock_all_banks(struct spi_nor *nor)
+{
+	int i;
+
+	for (i = nor->info->n_banks; i >= 0; i--)
+		mutex_unlock(&nor->locks.bank[i]);
+}
+
+static void spi_nor_lock_banks(struct spi_nor *nor, loff_t start, size_t len)
+{
+	int first, last, i;
+
+	first = DIV_ROUND_DOWN_ULL(start, nor->params->bank_size);
+	last = DIV_ROUND_DOWN_ULL(start + len - 1, nor->params->bank_size);
+
+	for (i = first; i <= last; i++)
+		mutex_lock(&nor->locks.bank[i]);
+}
+
+static void spi_nor_unlock_banks(struct spi_nor *nor, loff_t start, size_t len)
+{
+	int first, last, i;
+
+	first = DIV_ROUND_DOWN_ULL(start, nor->params->bank_size);
+	last = DIV_ROUND_DOWN_ULL(start + len - 1, nor->params->bank_size);
+
+	for (i = last; i >= first; i--)
+		mutex_unlock(&nor->locks.bank[i]);
+}
+
+static void spi_nor_lock_device(struct spi_nor *nor)
+{
+	if (spi_nor_parallel_locking(nor))
+		mutex_lock(&nor->locks.device);
+}
+
+static void spi_nor_unlock_device(struct spi_nor *nor)
+{
+	if (spi_nor_parallel_locking(nor))
+		mutex_unlock(&nor->locks.device);
+}
+
 /* Generic helpers for internal locking and serialization */
 int spi_nor_lock_and_prep(struct spi_nor *nor)
 {
@@ -1095,14 +1150,26 @@ int spi_nor_lock_and_prep(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor)) {
+		mutex_lock(&nor->lock);
+	} else {
+		spi_nor_lock_all_banks(nor);
+		mutex_lock(&nor->locks.pe_mode);
+		mutex_lock(&nor->locks.device);
+	}
 
 	return 0;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
-	mutex_unlock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		mutex_unlock(&nor->locks.device);
+		mutex_unlock(&nor->locks.pe_mode);
+		spi_nor_unlock_all_banks(nor);
+	}
 
 	spi_nor_unprep(nor);
 }
@@ -1116,14 +1183,24 @@ static int spi_nor_lock_and_prep_pe(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor)) {
+		mutex_lock(&nor->lock);
+	} else {
+		spi_nor_lock_banks(nor, start, len);
+		mutex_lock(&nor->locks.pe_mode);
+	}
 
 	return 0;
 }
 
 static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
-	mutex_unlock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		mutex_unlock(&nor->locks.pe_mode);
+		spi_nor_unlock_banks(nor, start, len);
+	}
 
 	spi_nor_unprep(nor);
 }
@@ -1137,14 +1214,20 @@ static int spi_nor_lock_and_prep_rd(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor))
+		mutex_lock(&nor->lock);
+	else
+		spi_nor_lock_banks(nor, start, len);
 
 	return 0;
 }
 
 static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
-	mutex_unlock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor))
+		mutex_unlock(&nor->lock);
+	else
+		spi_nor_unlock_banks(nor, start, len);
 
 	spi_nor_unprep(nor);
 }
@@ -1451,11 +1534,16 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 			dev_vdbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %u\n",
 				 cmd->size, cmd->opcode, cmd->count);
 
+			spi_nor_lock_device(nor);
+
 			ret = spi_nor_write_enable(nor);
-			if (ret)
+			if (ret) {
+				spi_nor_unlock_device(nor);
 				goto destroy_erase_cmd_list;
+			}
 
 			ret = spi_nor_erase_sector(nor, addr);
+			spi_nor_unlock_device(nor);
 			if (ret)
 				goto destroy_erase_cmd_list;
 
@@ -1508,11 +1596,16 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		unsigned long timeout;
 
+		spi_nor_lock_device(nor);
+
 		ret = spi_nor_write_enable(nor);
-		if (ret)
+		if (ret) {
+			spi_nor_unlock_device(nor);
 			goto erase_err;
+		}
 
 		ret = spi_nor_erase_chip(nor);
+		spi_nor_unlock_device(nor);
 		if (ret)
 			goto erase_err;
 
@@ -1537,11 +1630,16 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* "sector"-at-a-time erase */
 	} else if (spi_nor_has_uniform_erase(nor)) {
 		while (len) {
+			spi_nor_lock_device(nor);
+
 			ret = spi_nor_write_enable(nor);
-			if (ret)
+			if (ret) {
+				spi_nor_unlock_device(nor);
 				goto erase_err;
+			}
 
 			ret = spi_nor_erase_sector(nor, addr);
+			spi_nor_unlock_device(nor);
 			if (ret)
 				goto erase_err;
 
@@ -1733,11 +1831,13 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+	loff_t from_lock = from;
+	size_t len_lock = len;
 	ssize_t ret;
 
 	dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
 
-	ret = spi_nor_lock_and_prep_rd(nor, from, len);
+	ret = spi_nor_lock_and_prep_rd(nor, from_lock, len_lock);
 	if (ret)
 		return ret;
 
@@ -1746,7 +1846,9 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 		addr = spi_nor_convert_addr(nor, addr);
 
+		spi_nor_lock_device(nor);
 		ret = spi_nor_read_data(nor, addr, len, buf);
+		spi_nor_unlock_device(nor);
 		if (ret == 0) {
 			/* We shouldn't see 0-length reads */
 			ret = -EIO;
@@ -1764,7 +1866,7 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	ret = 0;
 
 read_err:
-	spi_nor_unlock_and_unprep_rd(nor, from, len);
+	spi_nor_unlock_and_unprep_rd(nor, from_lock, len_lock);
 
 	return ret;
 }
@@ -1809,11 +1911,16 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		addr = spi_nor_convert_addr(nor, addr);
 
+		spi_nor_lock_device(nor);
+
 		ret = spi_nor_write_enable(nor);
-		if (ret)
+		if (ret) {
+			spi_nor_unlock_device(nor);
 			goto write_err;
+		}
 
 		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
+		spi_nor_unlock_device(nor);
 		if (ret < 0)
 			goto write_err;
 		written = ret;
@@ -3030,7 +3137,19 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	nor->info = info;
 
-	mutex_init(&nor->lock);
+	if (!spi_nor_parallel_locking(nor)) {
+		mutex_init(&nor->lock);
+	} else {
+		mutex_init(&nor->locks.device);
+		mutex_init(&nor->locks.pe_mode);
+		nor->locks.bank = kmalloc(sizeof(struct mutex) * nor->info->n_banks,
+					  GFP_KERNEL);
+		if (!nor->locks.bank)
+			return -ENOMEM;
+
+		for (i = 0; i < nor->info->n_banks; i++)
+			mutex_init(&nor->locks.bank[i]);
+	}
 
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 42218a1164f6..02c9a3cf924e 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -344,6 +344,9 @@ struct spi_nor_flash_parameter;
  * struct spi_nor - Structure for defining the SPI NOR layer
  * @mtd:		an mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
+ * @locks.device:	the lock for the I/O bus
+ * @locks.pe_mode:	the lock for the program/erase mode for RWW operations
+ * @locks.bank:		the lock for every available bank
  * @dev:		pointer to an SPI device or an SPI NOR controller device
  * @spimem:		pointer to the SPI memory device
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
@@ -374,7 +377,14 @@ struct spi_nor_flash_parameter;
  */
 struct spi_nor {
 	struct mtd_info		mtd;
-	struct mutex		lock;
+	union {
+		struct mutex	lock;
+		struct {
+			struct mutex device;
+			struct mutex pe_mode;
+			struct mutex *bank;
+		} locks;
+	};
 	struct device		*dev;
 	struct spi_mem		*spimem;
 	u8			*bouncebuf;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
