Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51317C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4YW6eRVdfwj7KjbfRF3n+FXtnD9hmd0DZGa+WGGQYs4=; b=T7GtoDnI+d+WUd
	W14PA8zOnFljovCpL0hH2q/deFMFfWc4r5AvDJ8TwxTUu6FLAi+DOoBNldk4fNPtcG0o49i9/mTpP
	M1OPtVNyQZm/qNikXryXItQxvrytyV7UqtsuXHfIE3ewKqsZu0LbSKu+HAy0hQmeKLEtExV+s7Rhk
	Bc0jADBj8ejfGSkBdI+GKIjt8SnTPtvUERmkEtDG2HnsVESE42d36qg23BPSlchaiKVkfV3zWQDe5
	fgZV4cmgUcLaFinMsfxFcRClAhNHUHviEwApgtA2VNSO1dAfKt2OxtRxvdUL0uCYRGYsxhSxAHYgG
	Pj/99joZqLPjx5j5oDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttvV-00Bq1o-FZ; Wed, 25 May 2022 16:32:01 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttus-00BphC-93
	for linux-mtd@lists.infradead.org; Wed, 25 May 2022 16:31:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C31EBE0009;
	Wed, 25 May 2022 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653496280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UdW2h279F2CgooOxuJhjtKHFu4krkpE8XufK54bFY80=;
	b=ECWvPZroO7OaHNUwz1Vl56v1cj6VA2yMDFSPvS2YWYL6jk7DamNCXpMOgVx+yIAQBmkUnx
	7FKSSnGJzbquB9AYJ3r1Rdmy4zmZarHko3TjtEgor9TFEz+Y2BkHNGbaZrCu1UaOyv37m4
	ZXZtPH7qss5nlIFWn2ou0XJ1632RSs55wfJlP/Sq1xun6MEUhavmReqxJdgOFrhZrjR4tM
	3YbWaU7w41M6Rouog1UyAWQHVKD1gsrQP6x4Zwg66v0PDVjqptH6o5u/ZPjeqshExOWkiy
	dZ+k1DTiDyPBWlYf0v8WlDTyv69gln+239AdzCTy36wb1psz+3oJgb7/VI5U5g==
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
Subject: [RFC PATCH 8/8] mtd: spi-nor: Enhance locking to support reads while writes
Date: Wed, 25 May 2022 18:31:08 +0200
Message-Id: <20220525163108.266705-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220525163108.266705-1-miquel.raynal@bootlin.com>
References: <20220525163108.266705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_093122_644893_A9E17C21 
X-CRM114-Status: GOOD (  30.99  )
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
 drivers/mtd/spi-nor/core.c  | 134 +++++++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h |  12 +++-
 2 files changed, 134 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3d8e5f9961b9..872a3934f9a6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1081,6 +1081,61 @@ static void spi_nor_unprep(struct spi_nor *nor)
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
+	for (i = 0; i < nor->info->n_banks; i++)
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
+	for (i = first; i < last; i++)
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
+	for (i = first; i < last; i++)
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
@@ -1090,14 +1145,26 @@ int spi_nor_lock_and_prep(struct spi_nor *nor)
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
@@ -1111,14 +1178,24 @@ static int spi_nor_lock_and_prep_pe(struct spi_nor *nor, loff_t start, size_t le
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
@@ -1132,14 +1209,20 @@ static int spi_nor_lock_and_prep_rd(struct spi_nor *nor, loff_t start, size_t le
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
@@ -1448,11 +1531,16 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
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
 
@@ -1505,11 +1593,16 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
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
 
@@ -1534,11 +1627,16 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
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
 
@@ -1756,7 +1854,9 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 		addr = spi_nor_convert_addr(nor, addr);
 
+		spi_nor_lock_device(nor);
 		ret = spi_nor_read_data(nor, addr, len, buf);
+		spi_nor_unlock_device(nor);
 		if (ret == 0) {
 			/* We shouldn't see 0-length reads */
 			ret = -EIO;
@@ -1819,11 +1919,16 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 
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
@@ -3060,7 +3165,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 
 	nor->info = info;
 
-	mutex_init(&nor->lock);
+	if (!spi_nor_parallel_locking(nor)) {
+		mutex_init(&nor->lock);
+	} else {
+		mutex_init(&nor->locks.device);
+		mutex_init(&nor->locks.pe_mode);
+		for (i = 0; i < nor->info->n_banks; i++)
+			mutex_init(&nor->locks.bank[i]);
+	}
 
 	/* Init flash parameters based on flash_info struct and SFDP */
 	ret = spi_nor_init_params(nor);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5e25a7b75ae2..772da9b074d9 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -346,6 +346,9 @@ struct spi_nor_flash_parameter;
  * struct spi_nor - Structure for defining the SPI NOR layer
  * @mtd:		an mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
+ * @locks.device:	the lock for the I/O bus
+ * @locks.pe_mode:	the lock for the program/erase mode for RWW operations
+ * @locks.bank:		the lock for every available bank
  * @dev:		pointer to an SPI device or an SPI NOR controller device
  * @spimem:		pointer to the SPI memory device
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
@@ -375,7 +378,14 @@ struct spi_nor_flash_parameter;
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
