Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA89EC636D3
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O0aSrgqarxPl1d73HdOpyqq3UV6FPvWNH/CtcQwPDZ4=; b=wihvzdRiBKCEbQ
	e2rrYT5QUvOLZpUw0+xvgDJySlidyZKo4tokKY0krlLqGhav1lQF1rjATIqdentJ0FUPg98eQmxyg
	DmDDIsT4DQZymEWiE2G3vL7ID4XkBPDmtX8+ya9Kw4MNPeu28ASAGOKYzP+zdYlOQONWnFW4OTCLy
	JYLJh0VV4oP8QWcm9Y+DQik/zFkJBVaTSXxMclgu1lbwgl3+oeTbTxLBJj35bdqdZ4z5hkuVYF5/U
	uYQcuioDt6HLqi2vSQOxAGWWkKcskq9F6VNBWDFbmyg8UGX2I2lPYSmm2LVSZJcZ6c3XJZ+P981Ig
	BV3O12SISIXfOcuJsf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBUh-00BYIR-Rc; Wed, 01 Feb 2023 11:41:40 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBPZ-00BVKS-2W; Wed, 01 Feb 2023 11:36:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C26ED240002;
	Wed,  1 Feb 2023 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675251379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tu4nw7Uv38LpG2Kv/txydNA9SJ+TdX4lVbF1uCZHcxU=;
	b=dC12awp+mkl5jeV3AvDksVguu4DMAKErkLyOCCM689g6Mc6nm34vjpTXGFuFoLbRyVf3y4
	59BZixLApSogtImlz7+p9igJD0YU8to1nA/1ORsShS8xLngx1Cne2MBMFPWdLSocJMC31V
	YVRaao02b20qRycb5gPc1pk4GKnBJLDT6JEw7NTDuCr7n+wTjmaXRi/2NA/Vb0+kh3xGqd
	CcmC67LPbVHQPy/6BItcseEPOo2nPhhMum5E11F4Kr/xkUdXeVuYkMO7kE81n/ZxKZhO+1
	73tPyU1HI+TAdqgBvoTjYOO+h3giHqbI1yzzOWxp3J2Eu74iW9BkjHTDRqWOZA==
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
Subject: [PATCH v4 7/8] mtd: spi-nor: Enhance locking to support reads while writes
Date: Wed,  1 Feb 2023 12:36:02 +0100
Message-Id: <20230201113603.293758-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201113603.293758-1-miquel.raynal@bootlin.com>
References: <20230201113603.293758-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_033621_497210_03BB7F60 
X-CRM114-Status: GOOD (  29.77  )
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
3#: Reads must remain serialized even though reads on different banks
    might occur at the same time.
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
 drivers/mtd/spi-nor/core.c  | 319 ++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h |  13 ++
 2 files changed, 317 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac4627e0d6c2..ad2436e3688f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -589,6 +589,66 @@ int spi_nor_sr_ready(struct spi_nor *nor)
 	return !(nor->bouncebuf[0] & SR_WIP);
 }
 
+/**
+ * spi_nor_parallel_locking() - Checks if the RWW locking scheme shall be used
+ * @nor:	pointer to 'struct spi_nor'.
+ *
+ * Return: true if parallel locking is enabled, false otherwise.
+ */
+static bool spi_nor_parallel_locking(struct spi_nor *nor)
+{
+	if (nor->controller_ops &&
+	    (nor->controller_ops->prepare || nor->controller_ops->unprepare))
+		return false;
+
+	return nor->info->n_banks > 1 && nor->info->no_sfdp_flags & SPI_NOR_RWW;
+}
+
+/* Locking helpers for status read operations */
+static int spi_nor_rww_start_rdst(struct spi_nor *nor)
+{
+	int ret = -EAGAIN;
+
+	mutex_lock(&nor->lock);
+
+	if (nor->rww.ongoing_io || nor->rww.ongoing_rd)
+		goto busy;
+
+	nor->rww.ongoing_io = true;
+	nor->rww.ongoing_rd = true;
+	ret = 0;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return ret;
+}
+
+static void spi_nor_rww_end_rdst(struct spi_nor *nor)
+{
+	mutex_lock(&nor->lock);
+
+	nor->rww.ongoing_io = false;
+	nor->rww.ongoing_rd = false;
+
+	mutex_unlock(&nor->lock);
+}
+
+static int spi_nor_lock_rdst(struct spi_nor *nor)
+{
+	if (spi_nor_parallel_locking(nor))
+		return spi_nor_rww_start_rdst(nor);
+
+	return 0;
+}
+
+static void spi_nor_unlock_rdst(struct spi_nor *nor)
+{
+	if (spi_nor_parallel_locking(nor)) {
+		spi_nor_rww_end_rdst(nor);
+		wake_up(&nor->rww.wait);
+	}
+}
+
 /**
  * spi_nor_ready() - Query the flash to see if it is ready for new commands.
  * @nor:	pointer to 'struct spi_nor'.
@@ -597,11 +657,21 @@ int spi_nor_sr_ready(struct spi_nor *nor)
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
@@ -1087,7 +1157,81 @@ static void spi_nor_unprep(struct spi_nor *nor)
 		nor->controller_ops->unprepare(nor);
 }
 
+static void spi_nor_offset_to_banks(struct spi_nor *nor, loff_t start, size_t len,
+				    unsigned int *first, unsigned int *last)
+{
+	*first = DIV_ROUND_DOWN_ULL(start, nor->params->bank_size);
+	*last = DIV_ROUND_DOWN_ULL(start + len - 1, nor->params->bank_size);
+}
+
 /* Generic helpers for internal locking and serialization */
+static bool spi_nor_rww_start_io(struct spi_nor *nor)
+{
+	bool start = false;
+
+	mutex_lock(&nor->lock);
+
+	if (nor->rww.ongoing_io)
+		goto busy;
+
+	nor->rww.ongoing_io = true;
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
+	if (!spi_nor_parallel_locking(nor))
+		return 0;
+
+	return wait_event_killable(nor->rww.wait, spi_nor_rww_start_io(nor));
+}
+
+static void spi_nor_unlock_device(struct spi_nor *nor)
+{
+	if (spi_nor_parallel_locking(nor))
+		spi_nor_rww_end_io(nor);
+}
+
+/* Generic helpers for internal locking and serialization */
+static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
+{
+	bool start = false;
+
+	mutex_lock(&nor->lock);
+
+	if (nor->rww.ongoing_io || nor->rww.ongoing_rd || nor->rww.ongoing_pe)
+		goto busy;
+
+	nor->rww.ongoing_io = true;
+	nor->rww.ongoing_rd = true;
+	nor->rww.ongoing_pe = true;
+	start = true;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return start;
+}
+
+static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
+{
+	mutex_lock(&nor->lock);
+	nor->rww.ongoing_io = false;
+	nor->rww.ongoing_rd = false;
+	nor->rww.ongoing_pe = false;
+	mutex_unlock(&nor->lock);
+}
+
 int spi_nor_prep_and_lock(struct spi_nor *nor)
 {
 	int ret;
@@ -1096,19 +1240,71 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor))
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
+	if (!spi_nor_parallel_locking(nor)) {
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
+	unsigned int first, last;
+	bool started = false;
+	int bank;
+
+	mutex_lock(&nor->lock);
+
+	if (nor->rww.ongoing_io || nor->rww.ongoing_rd || nor->rww.ongoing_pe)
+		goto busy;
+
+	spi_nor_offset_to_banks(nor, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++)
+		if (nor->rww.used_banks & BIT(bank))
+			goto busy;
+
+	for (bank = first; bank <= last; bank++)
+		nor->rww.used_banks |= BIT(bank);
+
+	nor->rww.ongoing_pe = true;
+	started = true;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return started;
+}
+
+static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
+{
+	unsigned int first, last;
+	int bank;
+
+	mutex_lock(&nor->lock);
+
+	spi_nor_offset_to_banks(nor, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++)
+		nor->rww.used_banks &= ~BIT(bank);
+
+	nor->rww.ongoing_pe = false;
+
+	mutex_unlock(&nor->lock);
+}
+
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	int ret;
@@ -1117,19 +1313,73 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor))
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
+	if (!spi_nor_parallel_locking(nor)) {
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
+	unsigned int first, last;
+	bool started = false;
+	int bank;
+
+	mutex_lock(&nor->lock);
+
+	if (nor->rww.ongoing_io || nor->rww.ongoing_rd)
+		goto busy;
+
+	spi_nor_offset_to_banks(nor, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++)
+		if (nor->rww.used_banks & BIT(bank))
+			goto busy;
+
+	for (bank = first; bank <= last; bank++)
+		nor->rww.used_banks |= BIT(bank);
+
+	nor->rww.ongoing_io = true;
+	nor->rww.ongoing_rd = true;
+	started = true;
+
+busy:
+	mutex_unlock(&nor->lock);
+	return started;
+}
+
+static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
+{
+	unsigned int first, last;
+	int bank;
+
+	mutex_lock(&nor->lock);
+
+	spi_nor_offset_to_banks(nor, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++)
+		nor->rww.used_banks &= ~BIT(bank);
+
+	nor->rww.ongoing_io = false;
+	nor->rww.ongoing_rd = false;
+
+	mutex_unlock(&nor->lock);
+}
+
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	int ret;
@@ -1138,14 +1388,23 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	mutex_lock(&nor->lock);
+	if (!spi_nor_parallel_locking(nor))
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
+	if (!spi_nor_parallel_locking(nor)) {
+		mutex_unlock(&nor->lock);
+	} else {
+		spi_nor_rww_end_rd(nor, start, len);
+		wake_up(&nor->rww.wait);
+	}
 
 	spi_nor_unprep(nor);
 }
@@ -1454,11 +1713,18 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
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
 
@@ -1511,11 +1777,18 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
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
 
@@ -1540,11 +1813,18 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
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
 
@@ -1837,11 +2117,18 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
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
@@ -3111,6 +3398,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	nor->info = info;
 
 	mutex_init(&nor->lock);
+	if (spi_nor_parallel_locking(nor))
+		init_waitqueue_head(&nor->rww.wait);
 
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 25765556223a..ec338463d563 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -344,6 +344,12 @@ struct spi_nor_flash_parameter;
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
@@ -377,6 +383,13 @@ struct spi_nor_flash_parameter;
 struct spi_nor {
 	struct mtd_info		mtd;
 	struct mutex		lock;
+	struct {
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
