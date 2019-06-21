Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA7EC43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:15:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D83AF2070B
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 17:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WTi+gdFH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="deqvvp7a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D83AF2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PxJXRoh33xZgGHqJAFXeHr4ql7sTTzb9WdNRO6nNJ5I=; b=WTi+gdFHmEmeCr0Nk6+TuJS9Y9
	P/2Sl7zBHGriQiK/8ab4kRoVlDtXcjfCPxHtf/4hv+nWK46uxKwsZ4ulft7LL9XLkLJWz0qO0yuLT
	ebea++9MTuoC1QnYls+YRf1jSW3l+2SI9PbjQCLEM216dhR9rZK5+Xg5wb5b0mihHV/9eMqWfnea8
	HhqEGUhP9sHLDLs0oGMysbots86MkllaKr7Kft1/ya28fPpSpHX5TJTIPOIWS9yH09rLpl7LJFfgg
	ris82/ZjkZOkzsxLZhX91eqrUkUZGU30r8Y3pgncVCNa4dbaIsiqvhFdp5F+uo4MBgmk6zGF5xt9U
	GYCSim+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heN7g-0001cE-Vf; Fri, 21 Jun 2019 17:14:49 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heN7D-0001BC-L8
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 17:14:24 +0000
Received: by mail-pf1-x441.google.com with SMTP id c85so3945559pfc.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2019 10:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ku8QnbMtFcYKt/zj7cpu4Iyd9a5LptZEnqxsCGXICoo=;
 b=deqvvp7aht0DThaSwSY5WaL3UNW8qusUdcI8N9IUZSJPQsT/lZRKdjj/LTJ6ZRqZPT
 vBsLH+E27Vy+xp97XwxrkqYACvZqNRCtdBfLGNvEZkInZyXdqC3XrhwaFVIMmK9Gaduw
 Izq0IisA+HfQic7iOJ5WTZGqqRCqJ3P+7nX5b0ocmxBK8Yxi9M6xZoN+l2qgS5G18vuE
 D549smNF3aQB0kDD0cLsw3yi0AwbAgG4nCNgy/EumuHp+LTKmKob/AOt/ceR6aF81IEy
 T0cNCZ8d8XrpBxeRScD6V54lZku+tsH5PQIA6Qff5tJ92Lv6trf5hCP/ttjbNdSKBqTQ
 98vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ku8QnbMtFcYKt/zj7cpu4Iyd9a5LptZEnqxsCGXICoo=;
 b=MsRaKI+j8CrE3UOFdX+kiHQaPwMX+XOWcGtxZGN61SfXZtaLK8fS85pMBeQG4WDfFw
 fVrTI+AEwv+bCCSgTy47Uy/jnqj8dSeinBOpiujbzPKnHfWiPWV8jY3yQPXhryo3zMh/
 4/Pj3ve97WJW4f9TxMYguvHmxL0gSIQ+NsiQjNCH7zZIl0x7HcVwHuVHsfC2vhGMRTUL
 b81GaxgA//E16BY2/tNNEQhUzr+U0N2Sj1u7fD1y8u+StFI1Rev09l05eU6c+iGTs5te
 8mUuR3l53CGmKIZrcQO+xYXg1UkCqkh+1Q0iCMJ+V+Wr8j1GDXJ7CCW3Zi8TkSIwDA6E
 p+Yw==
X-Gm-Message-State: APjAAAV9wwaaMUvJgQPHDGrVyZDKmIV02i1T0O1MDJrjdANed7QsHfL2
 vy+OVpybtcsw02+a0hg/Q2//3A==
X-Google-Smtp-Source: APXvYqxH5q7g/Aps1V8Ztp5/ZigG2ZdQrKhDnluuydpv1Uvvk0scA5Xq2X+F38c54XMA7PDIY2SDzg==
X-Received: by 2002:a63:4d50:: with SMTP id n16mr19707540pgl.146.1561137258845; 
 Fri, 21 Jun 2019 10:14:18 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id t5sm3496190pgh.46.2019.06.21.10.14.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 10:14:18 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: [PATCH v6 3/3] mtd: spi-nor: add locking support for is25xxxxx device
Date: Fri, 21 Jun 2019 22:43:31 +0530
Message-Id: <1561137211-12406-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561137211-12406-1-git-send-email-sagar.kadam@sifive.com>
References: <1561137211-12406-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190621_101419_731792_C2C8879F 
X-CRM114-Status: GOOD (  23.72  )
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
Cc: aou@eecs.berkeley.edu, palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Implement a locking scheme for ISSI devices based on stm_lock mechanism.
The is25xxxxx  devices have 4 bits for selecting the range of blocks to
be locked/protected from erase/write operations and function register
gives feasibility to select TOP / Bottom area for protection.
Added opcode to read and write function registers.

The current implementation enables block protection as per the table
defined into datasheet for is25wp256 device having erase size of 0x1000.
ISSI and stm devices differ in terms of TBS (Top/Bottom area protection)
bits. In case of issi this is in Function register and is OTP memory, so
once FR bits are programmed  cannot be modified.

Some common code from stm_lock/unlock implementation is extracted so that
it can be re-used for issi devices. The locking scheme has been tested on
HiFive Unleashed board, having is25wp256 flash memory.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 261 ++++++++++++++++++++++++++++++++++--------
 include/linux/mtd/spi-nor.h   |   6 +
 2 files changed, 217 insertions(+), 50 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d165fcd..16735fc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -295,6 +295,29 @@ struct flash_info {
 
 #define JEDEC_MFR(info)	((info)->id[0])
 
+/**
+ * spi_nor_read_fr() -read function register
+ * @nor: pointer to a 'struct spi_nor'.
+ *
+ * ISSI devices have top/bottom area protection bits selection into function
+ * reg. The bits in FR are OTP. So once it's written, it cannot be changed.
+ *
+ * Return: Value in function register or negative if error.
+ */
+static int spi_nor_read_fr(struct spi_nor *nor)
+{
+	int ret;
+	u8 val;
+
+	ret = nor->read_reg(nor, SPINOR_OP_RDFR, &val, 1);
+	if (ret < 0) {
+		pr_err("error %d reading FR\n", ret);
+		return ret;
+	}
+
+	return val;
+}
+
 /*
  * Read the status register, returning its value in the location
  * Return the status register value.
@@ -1095,10 +1118,18 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	int shift = ffs(mask) - 1;
+	u8 mask = 0;
+	u8 fr = 0;
+	int shift = 0;
 	int pow;
 
+	if (nor->flags & SNOR_F_HAS_BP3)
+		mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	shift = ffs(mask) - 1;
+
 	if (!(sr & mask)) {
 		/* No protection */
 		*ofs = 0;
@@ -1106,10 +1137,19 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
-			*ofs = 0;
-		else
-			*ofs = mtd->size - *len;
+		/* ISSI device's have top/bottom select bit in func reg */
+		if (JEDEC_MFR(nor->info) == SNOR_MFR_ISSI) {
+			fr = spi_nor_read_fr(nor);
+			if (nor->flags & SNOR_F_HAS_SR_TB && fr & FR_TB)
+				*ofs = 0;
+			else
+				*ofs = mtd->size - *len;
+		} else {
+			if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
+				*ofs = 0;
+			else
+				*ofs = mtd->size - *len;
+		}
 	}
 }
 
@@ -1136,18 +1176,108 @@ static int stm_check_lock_status_sr(struct spi_nor *nor, loff_t ofs, uint64_t le
 		return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
 }
 
-static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-			    u8 sr)
+/*
+ * check if memory region is locked
+ *
+ * Returns false if region is locked 0 otherwise.
+ */
+static int spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+				u8 sr)
 {
 	return stm_check_lock_status_sr(nor, ofs, len, sr, true);
 }
 
-static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-			      u8 sr)
+/*
+ * check if memory region is unlocked
+ *
+ * Returns false if region is locked 0 otherwise.
+ */
+static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+				  u8 sr)
 {
 	return stm_check_lock_status_sr(nor, ofs, len, sr, false);
 }
 
+/**
+ * spi_nor_select_zone() - Select top area or bottom area to lock/unlock
+ * @nor: pointer to a 'struct spi_nor'.
+ * @ofs: offset from which to lock memory.
+ * @len: number of bytes to unlock.
+ * @sr: status register
+ * @tb: pointer to top/bottom bool used in caller function
+ * @op: zone selection is for lock/unlock operation. 1: lock 0:unlock
+ *
+ * Select the top area / bottom area pattern to protect memory blocks.
+ *
+ * Returns negative on errors, 0 on success.
+ */
+static int spi_nor_select_zone(struct spi_nor *nor, loff_t ofs, uint64_t len,
+			       u8 sr, bool *tb, bool op)
+{
+	int retval;
+	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
+
+	if (op) {
+		/* Select for lock zone operation */
+
+		/*
+		 * If nothing in our range is unlocked, we don't need
+		 * to do anything.
+		 */
+		if (spi_nor_is_locked_sr(nor, ofs, len, sr))
+			return 0;
+
+		/*
+		 * If anything below us is unlocked, we can't use 'bottom'
+		 * protection.
+		 */
+		if (!spi_nor_is_locked_sr(nor, 0, ofs, sr))
+			can_be_bottom = false;
+
+		/*
+		 * If anything above us is unlocked, we can't use 'top'
+		 * protection.
+		 */
+		if (!spi_nor_is_locked_sr(nor, ofs + len,
+					  nor->mtd.size - (ofs + len), sr))
+			can_be_top = false;
+	} else {
+		/* Select unlock zone */
+
+		/*
+		 * If nothing in our range is locked, we don't need to
+		 * do anything.
+		 */
+		if (spi_nor_is_unlocked_sr(nor, ofs, len, sr))
+			return 0;
+
+		/*
+		 * If anything below us is locked, we can't use 'top'
+		 * protection
+		 */
+		if (!spi_nor_is_unlocked_sr(nor, 0, ofs, sr))
+			can_be_top = false;
+
+		/*
+		 * If anything above us is locked, we can't use 'bottom'
+		 * protection
+		 */
+		if (!spi_nor_is_unlocked_sr(nor, ofs + len,
+					    nor->mtd.size - (ofs + len), sr))
+			can_be_bottom = false;
+	}
+
+	if (!can_be_bottom && !can_be_top) {
+		retval = -EINVAL;
+	} else {
+		/* Prefer top, if both are valid */
+		*tb = can_be_top;
+		retval = 1;
+	}
+
+	return retval;
+}
+
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
  * Supports the block protection bits BP{0,1,2} in the status register
@@ -1185,33 +1315,19 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 shift = ffs(mask) - 1, pow, val, ret;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
 
-	/* If nothing in our range is unlocked, we don't need to do anything */
-	if (stm_is_locked_sr(nor, ofs, len, status_old))
+	ret = spi_nor_select_zone(nor, ofs, len, status_old, &use_top, 1);
+	if (!ret)
 		return 0;
-
-	/* If anything below us is unlocked, we can't use 'bottom' protection */
-	if (!stm_is_locked_sr(nor, 0, ofs, status_old))
-		can_be_bottom = false;
-
-	/* If anything above us is unlocked, we can't use 'top' protection */
-	if (!stm_is_locked_sr(nor, ofs + len, mtd->size - (ofs + len),
-				status_old))
-		can_be_top = false;
-
-	if (!can_be_bottom && !can_be_top)
-		return -EINVAL;
-
-	/* Prefer top, if both are valid */
-	use_top = can_be_top;
+	else if (ret < 0)
+		return ret;
 
 	/* lock_len: length of region that should end up locked */
 	if (use_top)
@@ -1265,33 +1381,19 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 shift = ffs(mask) - 1, pow, val, ret;
 	loff_t lock_len;
-	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
 
 	status_old = read_sr(nor);
 	if (status_old < 0)
 		return status_old;
 
-	/* If nothing in our range is locked, we don't need to do anything */
-	if (stm_is_unlocked_sr(nor, ofs, len, status_old))
+	ret = spi_nor_select_zone(nor, ofs, len, status_old, &use_top, 0);
+	if (!ret)
 		return 0;
-
-	/* If anything below us is locked, we can't use 'top' protection */
-	if (!stm_is_unlocked_sr(nor, 0, ofs, status_old))
-		can_be_top = false;
-
-	/* If anything above us is locked, we can't use 'bottom' protection */
-	if (!stm_is_unlocked_sr(nor, ofs + len, mtd->size - (ofs + len),
-				status_old))
-		can_be_bottom = false;
-
-	if (!can_be_bottom && !can_be_top)
-		return -EINVAL;
-
-	/* Prefer top, if both are valid */
-	use_top = can_be_top;
+	else if (ret < 0)
+		return ret;
 
 	/* lock_len: length of region that should remain locked */
 	if (use_top)
@@ -1353,7 +1455,7 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (status < 0)
 		return status;
 
-	return stm_is_locked_sr(nor, ofs, len, status);
+	return spi_nor_is_locked_sr(nor, ofs, len, status);
 }
 
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
@@ -1468,6 +1570,63 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
 
 /**
+ * issi_lock() - set BP[0123] write-protection.
+ * @nor: pointer to a 'struct spi_nor'.
+ * @ofs: offset from which to lock memory.
+ * @len: number of bytes to unlock.
+ *
+ * Lock a region of the flash.Implementation is based on stm_lock
+ * Supports the block protection bits BP{0,1,2,3} in status register
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int issi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	int status_old, status_new, blk_prot;
+	u8 mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
+	u8 shift = ffs(mask) - 1;
+	u8 pow, ret, func_reg;
+	bool use_top;
+	loff_t lock_len;
+
+	status_old = read_sr(nor);
+
+	/* if status reg is Write protected don't update bit protection */
+	if (status_old & SR_SRWD) {
+		dev_err(nor->dev,
+			"SR is write protected, can't update BP bits...\n");
+		return -EINVAL;
+	}
+
+	ret = spi_nor_select_zone(nor, ofs, len, status_old, &use_top, 1);
+	if (!ret)
+		/* Older protected blocks include the new requested block's */
+		return 0;
+	else if (ret < 0)
+		return ret;
+
+	func_reg = spi_nor_read_fr(nor);
+	/* lock_len: length of region that should end up locked */
+	if (use_top)
+		lock_len = nor->mtd.size - ofs;
+	else
+		lock_len = ofs + len;
+
+	pow = order_base_2(lock_len);
+	blk_prot = mask & (((pow + 1) & 0xf) << shift);
+	if (lock_len <= 0) {
+		dev_err(nor->dev, "invalid Length to protect");
+		return -EINVAL;
+	}
+
+	status_new = status_old | blk_prot;
+	if (status_old == status_new)
+		return 0;
+
+	return write_sr_and_check(nor, status_new, mask);
+}
+
+/**
  * issi_unlock() - clear BP[0123] write-protection.
  * @nor: pointer to a 'struct spi_nor'.
  * @ofs: offset from which to unlock memory.
@@ -4135,6 +4294,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (JEDEC_MFR(info) == SNOR_MFR_ISSI &&
 	    info->flags & SPI_NOR_HAS_LOCK &&
 	    info->flags & SPI_NOR_HAS_BP3) {
+		nor->flash_lock = issi_lock;
 		nor->flash_unlock = issi_unlock;
 	}
 
@@ -4158,7 +4318,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
-
+	if (info->flags & SPI_NOR_HAS_BP3)
+		nor->flags |= SNOR_F_HAS_BP3;
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 256a8b6..6933fa7 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -40,6 +40,8 @@
 #define SPINOR_OP_RDSR		0x05	/* Read status register */
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
 #define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
+#define SPINOR_OP_RDFR		0x48	/* Read Function register */
+#define SPINOR_OP_WRFR		0x42	/* Write Function register 1 byte */
 #define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
 #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
 #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
@@ -139,6 +141,9 @@
 /* Enhanced Volatile Configuration Register bits */
 #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
 
+/*Function register bit */
+#define FR_TB			BIT(1)	/*ISSI: Top/Bottom protect */
+
 /* Flag Status Register bits */
 #define FSR_READY		BIT(7)	/* Device status, 0 = Busy, 1 = Ready */
 #define FSR_E_ERR		BIT(5)	/* Erase operation status */
@@ -245,6 +250,7 @@ enum spi_nor_option_flags {
 	SNOR_F_BROKEN_RESET	= BIT(6),
 	SNOR_F_4B_OPCODES	= BIT(7),
 	SNOR_F_HAS_4BAIT	= BIT(8),
+	SNOR_F_HAS_BP3		= BIT(9),
 };
 
 /**
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
