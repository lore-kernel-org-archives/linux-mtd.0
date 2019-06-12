Return-Path: <SRS0=tiqS=UL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF59C31E48
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 10:49:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 625CB2082C
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 10:49:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OmP5WVde";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="m8f8RUS3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 625CB2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iZP7k2rT2y/+c24hqzJHbLRb2Mrbgf2Xat9SIeHHZJY=; b=OmP5WVde+ZCn516Encx5U5eqHp
	q2wNoavtmpUnMFsSI6+eFe9uDAs7aDenrJ3JLBrUa5F/Q+jlC5c70RD5r5Ca6ue2RKMj5ej9pTIOl
	Yn9GMAkum6ftC8IvKcTqJlPRjGfx0jho2rDa4tJIYNPdr5u7tABzv4HZTpC1PfZ2SO1q4kvJUzaRi
	9O/U0hKpL0Uibt62FKiJbi7ubKxGT/07XNMAsFadWw/DBa58NSAlZLBY7VzizuZKFLuHejBXXzc4/
	NcAe+Hboi4DCmGCeNiYivryG5O8I4oOXB5t12Wt0FXF7YLeTAyKtKYBiOe5IVZp+iQXtg1WV3XMqw
	Mmw8KhKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb0pE-0001Wk-Rm; Wed, 12 Jun 2019 10:49:52 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0oj-0000vl-Uz
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2019 10:49:26 +0000
Received: by mail-pf1-x441.google.com with SMTP id i189so9427516pfg.10
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2019 03:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B+jLj9d2GFBQiXewEtLlJA1Uy0gGbUagTzXGUwe+M6o=;
 b=m8f8RUS3KQ/JoGs/doSaK5b8FuWlq6KXG/Ve4OSpIK7tNx3x7U9wklceUYXhrRGBE7
 aHlYW6kkRDX2r8hUB0crhexp/xGzaGsiwzbv5XpbjTFLYtpWFpo6gwJMB13Om3V/7XCq
 DRvEp8JZRmWafb9S8tNk2Nd63lQmYdAokpZyWNQT6xab/a7MA2jFvrWH6Ay57YvXbzUr
 PJrKf7syV6G/f72WQOJBTgrnCo+Lwg2ZbyHCx5m5q9k66n8kdTCLItA9555oa1r4wVo6
 qbJVdkJuZSak8Y+OooWEu3PV047djK6G0pQC0RZ1nfxGnMhoEo5spyjEBJ40EjtrgvIS
 zEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B+jLj9d2GFBQiXewEtLlJA1Uy0gGbUagTzXGUwe+M6o=;
 b=ngg4BaNEkqe3UMfoc45mAbCuE+hGPpRDWIAw7YoTwSF8EMQui3otH05jMNNfKgKSjW
 P4oADOeBXug7MzGnvfLUsPmvT04+zLYU3fLG7fezitidMYv4pS6/zpz5dON3u8gBxqKM
 0/4vbZ+MirHt5cIwdOqtoKhYyS3Kw3Y92KtxiH8R1QWWXKQXpdC6gbS/bNJvRu5zBplR
 +jmpjZsJ0I+rsfEgJO+74IRRlRbJaPhbqNbF+rDP6ebw2b1nm9Xz9WpeVElNLgAHZXJj
 YQOmqQwAQe8NQRoNO5RiGmAm+qrEK/1nh/AiNVPC/FMyK+zitB8Pu0kEjXX6a9vgOgYD
 uvIA==
X-Gm-Message-State: APjAAAXbyNHUFjrKOe5HSzWirnqSF/KB1qhv6G6KvcZRGb2PL/Mc8BfL
 N9zZdJIZjB4QGdZIHrTf0k1vcQ==
X-Google-Smtp-Source: APXvYqyGmSkU0BcgxTghXy0FdP1Uq2LgFnjGJW6Sn8JZGYksVvbD2OpHV+0mZAfeEFMN8QjKBYwkIg==
X-Received: by 2002:a62:2582:: with SMTP id l124mr62840927pfl.43.1560336559375; 
 Wed, 12 Jun 2019 03:49:19 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id y22sm12241561pfm.70.2019.06.12.03.49.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 12 Jun 2019 03:49:18 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/3] mtd: spi-nor: add locking support for is25xxxxx device
Date: Wed, 12 Jun 2019 16:17:56 +0530
Message-Id: <1560336476-31763-4-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
References: <1560336476-31763-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_034922_147192_E72ABB5C 
X-CRM114-Status: GOOD (  25.00  )
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
Cc: wesley@sifive.com, palmer@sifive.com,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Implement a locking scheme for ISSI devices based on stm_lock mechanism.
The is25xxxxx  devices have 4 bits for selecting the range of blocks to
be locked/protected from erase/write operations and function register
gives feasibility to select TOP / Bottom area for protection.
Added opcodes to read and write function registers.

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
 drivers/mtd/spi-nor/spi-nor.c | 291 ++++++++++++++++++++++++++++++++++--------
 include/linux/mtd/spi-nor.h   |   5 +
 2 files changed, 245 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b7c6261..9281ec0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -288,6 +288,45 @@ struct flash_info {
 
 #define JEDEC_MFR(info)	((info)->id[0])
 
+/**
+ * read_fr() -read function register
+ * @nor: pointer to a 'struct spi_nor'.
+ *
+ * ISSI devices have top/bottom area protection bits selection into function
+ * reg.The bits in FR are OTP.So once it's written, it cannot be changed.
+ *
+ * Return: Value in function register or Negative if error.
+ */
+static int read_fr(struct spi_nor *nor)
+{
+	int ret;
+	u8 val;
+
+	ret = nor->read_reg(nor, SPINOR_OP_RDFR, &val, 1);
+	if (ret < 0) {
+		pr_err("error %d reading FR\n", (int) ret);
+		return ret;
+	}
+
+	return val;
+}
+
+/**
+ * write_fr() -Write function register
+ * @nor: pointer to a 'struct spi_nor'.
+ *
+ * ISSI devices have top/bottom area selection protection bits into function
+ * reg whereas other devices have the TBS bit into Status Register.
+ * The bits in FR are OTP.So once it's written, it cannot be changed.
+ *
+ * Return: Negative if error
+ */
+static int write_fr(struct spi_nor *nor, u8 val)
+{
+	nor->cmd_buf[0] = val;
+	return nor->write_reg(nor, SPINOR_OP_WRFR, nor->cmd_buf, 1);
+}
+
 /*
  * Read the status register, returning its value in the location
  * Return the status register value.
@@ -1088,10 +1127,17 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 				 uint64_t *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
-	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	int shift = ffs(mask) - 1;
+	u8 mask = 0;
+	int shift = 0;
 	int pow;
 
+	if (JEDEC_MFR(nor->info) == SNOR_MFR_ISSI)
+		mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
+	else
+		mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	shift = ffs(mask) - 1;
+
 	if (!(sr & mask)) {
 		/* No protection */
 		*ofs = 0;
@@ -1099,10 +1145,19 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
-			*ofs = 0;
-		else
-			*ofs = mtd->size - *len;
+
+		if (JEDEC_MFR(nor->info) == SNOR_MFR_ISSI) {
+			if (nor->flags & SNOR_F_HAS_SR_TB &&
+					(read_fsr(nor) & FR_TB))
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
 
@@ -1129,18 +1184,108 @@ static int stm_check_lock_status_sr(struct spi_nor *nor, loff_t ofs, uint64_t le
 		return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
 }
 
-static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+/*
+ * check if memory region is locked
+ *
+ * Returns false if region is locked 0 otherwise.
+ */
+static int fl_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 			    u8 sr)
 {
 	return stm_check_lock_status_sr(nor, ofs, len, sr, true);
 }
 
-static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+/*
+ * check if memory region is unlocked
+ *
+ * Returns false if region is locked 0 otherwise.
+ */
+static int fl_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 			      u8 sr)
 {
 	return stm_check_lock_status_sr(nor, ofs, len, sr, false);
 }
 
+/**
+ * flash_select_zone() - Select TOP area or bottom area to lock/unlock
+ * @nor: pointer to a 'struct spi_nor'.
+ * @ofs: offset from which to lock memory.
+ * @len: number of bytes to unlock.
+ * @sr: status register
+ * @tb: pointer to top/bottom bool used in caller function
+ * @op: zone selection is for lock/unlock operation. 1: lock 0:unlock
+ *
+ * Select the top area / bottom area paattern to protect memory blocks.
+ *
+ * Returns negative on errors, 0 on success.
+ */
+static int fl_select_zone(struct spi_nor *nor, loff_t ofs, uint64_t len,
+				u8 sr, bool *tb, bool op)
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
+		if (fl_is_locked_sr(nor, ofs, len, sr))
+			return 0;
+
+		/*
+		 * If anything below us is unlocked, we can't use 'bottom'
+		 * protection.
+		 */
+		if (!fl_is_locked_sr(nor, 0, ofs, sr))
+			can_be_bottom = false;
+
+		/*
+		 * If anything above us is unlocked, we can't use 'top'
+		 * protection.
+		 */
+		if (!fl_is_locked_sr(nor, ofs + len,
+					nor->mtd.size - (ofs + len), sr))
+			can_be_top = false;
+	} else {
+		/* Select unlock zone */
+
+		/*
+		 * If nothing in our range is locked, we don't need to
+		 * do anything.
+		 */
+		if (fl_is_unlocked_sr(nor, ofs, len, sr))
+			return 0;
+
+		/*
+		 * If anything below us is locked, we can't use 'top'
+		 * protection
+		 */
+		if (!fl_is_unlocked_sr(nor, 0, ofs, sr))
+			can_be_top = false;
+
+		/*
+		 * If anything above us is locked, we can't use 'bottom'
+		 * protection
+		 */
+		if (!fl_is_unlocked_sr(nor, ofs + len,
+					nor->mtd.size - (ofs + len), sr))
+			can_be_bottom = false;
+	}
+
+	if (!can_be_bottom && !can_be_top)
+		retval = -EINVAL;
+	else {
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
@@ -1178,33 +1323,19 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
+	ret = fl_select_zone(nor, ofs, len, status_old, &use_top, 1);
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
@@ -1258,35 +1389,21 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
+	ret = fl_select_zone(nor, ofs, len, status_old, &use_top, 0);
+	if (!ret)
 		return 0;
+	else if (ret < 0)
+		return ret;
 
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
-
-	/* lock_len: length of region that should remain locked */
+	/* lock_len: length of region that should end up locked */
 	if (use_top)
 		lock_len = mtd->size - (ofs + len);
 	else
@@ -1338,7 +1455,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
  * Returns 1 if entire region is locked, 0 if any portion is unlocked, and
  * negative on errors.
  */
-static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int fl_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 {
 	int status;
 
@@ -1346,7 +1463,7 @@ static int stm_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (status < 0)
 		return status;
 
-	return stm_is_locked_sr(nor, ofs, len, status);
+	return fl_is_locked_sr(nor, ofs, len, status);
 }
 
 static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
@@ -1461,6 +1578,77 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
 
 /**
+ * issi_lock() - set BP[0123] write-protection.
+ * @nor: pointer to a 'struct spi_nor'.
+ * @ofs: offset from which to lock memory.
+ * @len: number of bytes to unlock.
+ *
+ * Lock a region of the flash.Implementation is based on stm_lock
+ * Supports the block protection bits BP{0,1,2,3} in the status register
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
+			"SR is Write Protected,can't update BP bits...\n");
+		return -EINVAL;
+	}
+
+	ret = fl_select_zone(nor, ofs, len, status_old, &use_top, 1);
+	if (!ret)
+		/* Older protected blocks include the new requested block's */
+		return 0;
+	else if (ret < 0)
+		return ret;
+
+	func_reg = read_fr(nor);
+	/* lock_len: length of region that should end up locked */
+	if (use_top) {
+		/* Update Function register to use TOP area */
+		if ((func_reg >> 1) & 0x1) {
+			/* Currently bootom selected change to top */
+			func_reg ^= FR_TB;
+			write_fr(nor, func_reg);
+		}
+		lock_len = nor->mtd.size - ofs;
+	} else {
+
+		/* Update Function register to use bottom area */
+		if (!((func_reg >> 1) & 0x1)) {
+			/*Currently top is selected, change to bottom */
+			func_reg ^= FR_TB;
+			write_fr(nor, func_reg);
+		}
+		lock_len = ofs + len;
+	}
+
+	pow = order_base_2(lock_len);
+	blk_prot = mask & (((pow+1) & 0xf)<<shift);
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
@@ -1879,7 +2067,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 1024,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK)
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 
 	/* Macronix */
@@ -4120,12 +4308,13 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	    info->flags & SPI_NOR_HAS_LOCK) {
 		nor->flash_lock = stm_lock;
 		nor->flash_unlock = stm_unlock;
-		nor->flash_is_locked = stm_is_locked;
+		nor->flash_is_locked = fl_is_locked;
 	}
 
 	/* NOR protection support for ISSI chips */
 	if (JEDEC_MFR(info) == SNOR_MFR_ISSI ||
 	    info->flags & SPI_NOR_HAS_LOCK) {
+		nor->flash_lock = issi_lock;
 		nor->flash_unlock = issi_unlock;
 
 	}
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 9a7d719..a15d012 100644
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
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
