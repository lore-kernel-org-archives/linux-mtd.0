Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A7AC761AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 15:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/EURMOzEsBAU0/YxxfLxi+Y8BRJ08ngF8LurZUZ1qs=; b=omya9oeVBXRA34
	HsuYU1PtoH58e6HSsFBzh9t41rA5nF6K03unozVYHEOqUvVExTxrWU7EmIayiOv0M3lSc5cgjSV0b
	cKylqptzyr0JYDBaaKOaRG7vuVzDSTlTDVB3gr1X6lT6U92XEH9dylYWW0XJEzcYDe1W7dgWxmvun
	QK7KOtUdiQeXfyHSRKbyQYX7DUovJDWGrjlO2L06EfVbtIOXUQgyOW0o22THT/F0Z7oJ9TocoLqBz
	yv/9QCgZlYg09Ut9SxuvZff1Plfu2OfXCGQGfcv4s5Wb6einLyGCxExWc0Q/RJEPnkp1sTeSDsVTW
	6ooTA0zpC6pdxBIR8hcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBSw-00EzbG-29;
	Tue, 28 Mar 2023 15:42:30 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRr-00Eyj3-2E;
	Tue, 28 Mar 2023 15:41:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E2CE06000B;
	Tue, 28 Mar 2023 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680018081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SP0ivHMA90jI57HFcK/Xni+WiKFBXiGWUcZv/v7SmU=;
	b=B6KQDZvLsaElZr1WIzkKz2TwwjuXM/4pNahNQbTPp9xApY2wSQZ0wNJvRV1Fz9LsX6ryyy
	nv2HL7aa5LcXV6FCkRxOfvUiWu8f4GBAtn93WFRVgBSWyEC9mgsqcsdt31YB5rvIZYJ6Rp
	tm+XWSbzxWwAP6JqPlxzFqcUIeRdIWtdT0TKxF6ytWOPIJtWYrnnpYaudH4Nw6yHD5z1oN
	CLYvnPSDbMvElH00RqgVI1MddURtC9/ofowcGAPTBh0TBFynqYge9fFNisDW6dvNPhi/Zu
	VMRxUIBeu3tKUpCRFC8E3zcnI+WwnXoTM3K9E0pe237zZmMVIGI5d9kWtQzBPw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michal Simek <monstr@monstr.eu>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 7/8] mtd: spi-nor: Enhance locking to support reads while writes
Date: Tue, 28 Mar 2023 17:41:04 +0200
Message-Id: <20230328154105.448540-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328154105.448540-1-miquel.raynal@bootlin.com>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_084124_085935_FF3B8007 
X-CRM114-Status: GOOD (  29.28  )
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
2#: Only a single program or erase operation can happen on the entire
    chip (common hardware limitation to limit costs)
3#: Reads must remain serialized even though reads crossing bank
    boundaries are allowed.
4#: The I/O bus is unique and thus is the most constrained resource, all
    spi-nor operations requiring access to the spi bus (through the spi
    controller) must be serialized until the bus exchanges are over. So
    we must ensure a single operation can be "sent" at a time.
5#: Any other operation that would not be either a read or a write or an
    erase is considered requiring access to the full chip and cannot be
    parallelized, we then need to ensure the full chip is in the idle
    state when this occurs.

All these constraints can easily be managed with a proper locking model:
1#: Is enforced by a bitfield of the in-use banks, so that only a single
    operation can happen in a specific bank at any time.
2#: Is handled by the ongoing_pe boolean which is set before any write
    or erase, and is released only at the very end of the
    operation. This way, no other destructive operation on the chip can
    start during this time frame.
3#: An ongoing_rd boolean allows to track the ongoing reads, so that
    only one can be performed at a time.
4#: An ongoing_io boolean is introduced in order to capture and serialize
    bus accessed. This is the one being released "sooner" than before,
    because we only need to protect the chip against other SPI accesses
    during the I/O phase, which for the destructive operations is the
    beginning of the operation (when we send the command cycles and
    possibly the data), while the second part of the operation (the
    erase delay or the programmation delay) is when we can do something
    else in another bank.
5#: Is handled by the three booleans presented above, if any of them is
    set, the chip is not yet ready for the operation and must wait.

All these internal variables are protected by the existing lock, so that
changes in this structure are atomic. The serialization is handled with
a wait queue.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c  | 337 ++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h |  13 ++
 2 files changed, 334 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 75ec7a3d0b43..9e6a0730cdb8 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -588,6 +588,65 @@ int spi_nor_sr_ready(struct spi_nor *nor)
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
+/**
+ * spi_nor_use_parallel_locking() - Checks if RWW locking scheme shall be used
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: true if parallel locking is enabled, false otherwise.
+ */
+static bool spi_nor_use_parallel_locking(struct spi_nor *nor)
+{
+	return nor->flags & SNOR_F_RWW;
+}
+
+/* Locking helpers for status read operations */
+static int spi_nor_rww_start_rdst(struct spi_nor *nor)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+	int ret = -EAGAIN;
+
+	mutex_lock(&nor->lock);
+
+	if (rww->ongoing_io || rww->ongoing_rd)
+		goto busy;
+
+	rww->ongoing_io = true;
+	rww->ongoing_rd = true;
+	ret = 0;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return ret;
+}
+
+static void spi_nor_rww_end_rdst(struct spi_nor *nor)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+
+	mutex_lock(&nor->lock);
+
+	rww->ongoing_io = false;
+	rww->ongoing_rd = false;
+
+	mutex_unlock(&nor->lock);
+}
+
+static int spi_nor_lock_rdst(struct spi_nor *nor)
+{
+	if (spi_nor_use_parallel_locking(nor))
+		return spi_nor_rww_start_rdst(nor);
+
+	return 0;
+}
+
+static void spi_nor_unlock_rdst(struct spi_nor *nor)
+{
+	if (spi_nor_use_parallel_locking(nor)) {
+		spi_nor_rww_end_rdst(nor);
+		wake_up(&nor->rww.wait);
+	}
+}
+
 /**
  * spi_nor_ready() - Query the flash to see if it is ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
@@ -596,11 +655,21 @@ int spi_nor_sr_ready(struct spi_nor *nor)
  */
 static int spi_nor_ready(struct spi_nor *nor)
 {
+	int ret;
+
+	ret = spi_nor_lock_rdst(nor);
+	if (ret)
+		return 0;
+
 	/* Flashes might override the standard routine. */
 	if (nor->params->ready)
-		return nor->params->ready(nor);
+		ret = nor->params->ready(nor);
+	else
+		ret = spi_nor_sr_ready(nor);
 
-	return spi_nor_sr_ready(nor);
+	spi_nor_unlock_rdst(nor);
+
+	return ret;
 }
 
 /**
@@ -1086,7 +1155,88 @@ static void spi_nor_unprep(struct spi_nor *nor)
 		nor->controller_ops->unprepare(nor);
 }
 
+static void spi_nor_offset_to_banks(u64 bank_size, loff_t start, size_t len,
+				    u8 *first, u8 *last)
+{
+	/* This is currently safe, the number of banks being very small */
+	*first = DIV_ROUND_DOWN_ULL(start, bank_size);
+	*last = DIV_ROUND_DOWN_ULL(start + len - 1, bank_size);
+}
+
 /* Generic helpers for internal locking and serialization */
+static bool spi_nor_rww_start_io(struct spi_nor *nor)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+	bool start = false;
+
+	mutex_lock(&nor->lock);
+
+	if (rww->ongoing_io)
+		goto busy;
+
+	rww->ongoing_io = true;
+	start = true;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return start;
+}
+
+static void spi_nor_rww_end_io(struct spi_nor *nor)
+{
+	mutex_lock(&nor->lock);
+	nor->rww.ongoing_io = false;
+	mutex_unlock(&nor->lock);
+}
+
+static int spi_nor_lock_device(struct spi_nor *nor)
+{
+	if (!spi_nor_use_parallel_locking(nor))
+		return 0;
+
+	return wait_event_killable(nor->rww.wait, spi_nor_rww_start_io(nor));
+}
+
+static void spi_nor_unlock_device(struct spi_nor *nor)
+{
+	if (spi_nor_use_parallel_locking(nor)) {
+		spi_nor_rww_end_io(nor);
+		wake_up(&nor->rww.wait);
+	}
+}
+
+/* Generic helpers for internal locking and serialization */
+static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+	bool start = false;
+
+	mutex_lock(&nor->lock);
+
+	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
+		goto busy;
+
+	rww->ongoing_io = true;
+	rww->ongoing_rd = true;
+	rww->ongoing_pe = true;
+	start = true;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return start;
+}
+
+static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+
+	mutex_lock(&nor->lock);
+	rww->ongoing_io = false;
+	rww->ongoing_rd = false;
+	rww->ongoing_pe = false;
+	mutex_unlock(&nor->lock);
+}
+
 int spi_nor_prep_and_lock(struct spi_nor *nor)
 {
 	int ret;
@@ -1095,19 +1245,75 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_use_parallel_locking(nor))
+		mutex_lock(&nor->lock);
+	else
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_start_exclusive(nor));
 
-	return 0;
+	return ret;
 }
 
 void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 {
-	mutex_unlock(&nor->lock);
+	if (!spi_nor_use_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_exclusive(nor);
+		wake_up(&nor->rww.wait);
+	}
 
 	spi_nor_unprep(nor);
 }
 
 /* Internal locking helpers for program and erase operations */
+static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+	unsigned int used_banks = 0;
+	bool started = false;
+	u8 first, last;
+	int bank;
+
+	mutex_lock(&nor->lock);
+
+	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
+		goto busy;
+
+	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++) {
+		if (rww->used_banks & BIT(bank))
+			goto busy;
+
+		used_banks |= BIT(bank);
+	}
+
+	rww->used_banks |= used_banks;
+	rww->ongoing_pe = true;
+	started = true;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return started;
+}
+
+static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+	u8 first, last;
+	int bank;
+
+	mutex_lock(&nor->lock);
+
+	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++)
+		rww->used_banks &= ~BIT(bank);
+
+	rww->ongoing_pe = false;
+
+	mutex_unlock(&nor->lock);
+}
+
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	int ret;
@@ -1116,19 +1322,77 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_use_parallel_locking(nor))
+		mutex_lock(&nor->lock);
+	else
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_start_pe(nor, start, len));
 
-	return 0;
+	return ret;
 }
 
 static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
-	mutex_unlock(&nor->lock);
+	if (!spi_nor_use_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_pe(nor, start, len);
+		wake_up(&nor->rww.wait);
+	}
 
 	spi_nor_unprep(nor);
 }
 
 /* Internal locking helpers for read operations */
+static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+	unsigned int used_banks = 0;
+	bool started = false;
+	u8 first, last;
+	int bank;
+
+	mutex_lock(&nor->lock);
+
+	if (rww->ongoing_io || rww->ongoing_rd)
+		goto busy;
+
+	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++) {
+		if (rww->used_banks & BIT(bank))
+			goto busy;
+
+		used_banks |= BIT(bank);
+	}
+
+	rww->used_banks |= used_banks;
+	rww->ongoing_io = true;
+	rww->ongoing_rd = true;
+	started = true;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return started;
+}
+
+static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+	u8 first, last;
+	int bank;
+
+	mutex_lock(&nor->lock);
+
+	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++)
+		nor->rww.used_banks &= ~BIT(bank);
+
+	rww->ongoing_io = false;
+	rww->ongoing_rd = false;
+
+	mutex_unlock(&nor->lock);
+}
+
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	int ret;
@@ -1137,14 +1401,23 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_use_parallel_locking(nor))
+		mutex_lock(&nor->lock);
+	else
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_start_rd(nor, start, len));
 
-	return 0;
+	return ret;
 }
 
 static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
-	mutex_unlock(&nor->lock);
+	if (!spi_nor_use_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_rd(nor, start, len);
+		wake_up(&nor->rww.wait);
+	}
 
 	spi_nor_unprep(nor);
 }
@@ -1453,11 +1726,18 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 			dev_vdbg(nor->dev, "erase_cmd->size = 0x%08x, erase_cmd->opcode = 0x%02x, erase_cmd->count = %u\n",
 				 cmd->size, cmd->opcode, cmd->count);
 
-			ret = spi_nor_write_enable(nor);
+			ret = spi_nor_lock_device(nor);
 			if (ret)
 				goto destroy_erase_cmd_list;
 
+			ret = spi_nor_write_enable(nor);
+			if (ret) {
+				spi_nor_unlock_device(nor);
+				goto destroy_erase_cmd_list;
+			}
+
 			ret = spi_nor_erase_sector(nor, addr);
+			spi_nor_unlock_device(nor);
 			if (ret)
 				goto destroy_erase_cmd_list;
 
@@ -1510,11 +1790,18 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	if (len == mtd->size && !(nor->flags & SNOR_F_NO_OP_CHIP_ERASE)) {
 		unsigned long timeout;
 
-		ret = spi_nor_write_enable(nor);
+		ret = spi_nor_lock_device(nor);
 		if (ret)
 			goto erase_err;
 
+		ret = spi_nor_write_enable(nor);
+		if (ret) {
+			spi_nor_unlock_device(nor);
+			goto erase_err;
+		}
+
 		ret = spi_nor_erase_chip(nor);
+		spi_nor_unlock_device(nor);
 		if (ret)
 			goto erase_err;
 
@@ -1539,11 +1826,18 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* "sector"-at-a-time erase */
 	} else if (spi_nor_has_uniform_erase(nor)) {
 		while (len) {
-			ret = spi_nor_write_enable(nor);
+			ret = spi_nor_lock_device(nor);
 			if (ret)
 				goto erase_err;
 
+			ret = spi_nor_write_enable(nor);
+			if (ret) {
+				spi_nor_unlock_device(nor);
+				goto erase_err;
+			}
+
 			ret = spi_nor_erase_sector(nor, addr);
+			spi_nor_unlock_device(nor);
 			if (ret)
 				goto erase_err;
 
@@ -1836,11 +2130,18 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 		addr = spi_nor_convert_addr(nor, addr);
 
-		ret = spi_nor_write_enable(nor);
+		ret = spi_nor_lock_device(nor);
 		if (ret)
 			goto write_err;
 
+		ret = spi_nor_write_enable(nor);
+		if (ret) {
+			spi_nor_unlock_device(nor);
+			goto write_err;
+		}
+
 		ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
+		spi_nor_unlock_device(nor);
 		if (ret < 0)
 			goto write_err;
 		written = ret;
@@ -2531,7 +2832,8 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (flags & NO_CHIP_ERASE)
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 
-	if (flags & SPI_NOR_RWW)
+	if (flags & SPI_NOR_RWW && nor->info->n_banks > 1 &&
+	    !nor->controller_ops)
 		nor->flags |= SNOR_F_RWW;
 }
 
@@ -3128,6 +3430,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
+	if (spi_nor_use_parallel_locking(nor))
+		init_waitqueue_head(&nor->rww.wait);
+
 	/*
 	 * Configure the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a3f8cdca90c8..82547b4b3708 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -343,6 +343,12 @@ struct spi_nor_flash_parameter;
  * struct spi_nor - Structure for defining the SPI NOR layer
  * @mtd:		an mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
+ * @rww:		Read-While-Write (RWW) sync lock
+ * @rww.wait:		wait queue for the RWW sync
+ * @rww.ongoing_io:	the bus is busy
+ * @rww.ongoing_rd:	a read is ongoing on the chip
+ * @rww.ongoing_pe:	a program/erase is ongoing on the chip
+ * @rww.used_banks:	bitmap of the banks in use
  * @dev:		pointer to an SPI device or an SPI NOR controller device
  * @spimem:		pointer to the SPI memory device
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
@@ -376,6 +382,13 @@ struct spi_nor_flash_parameter;
 struct spi_nor {
 	struct mtd_info		mtd;
 	struct mutex		lock;
+	struct spi_nor_rww {
+		wait_queue_head_t wait;
+		bool		ongoing_io;
+		bool		ongoing_rd;
+		bool		ongoing_pe;
+		unsigned int	used_banks;
+	} rww;
 	struct device		*dev;
 	struct spi_mem		*spimem;
 	u8			*bouncebuf;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
