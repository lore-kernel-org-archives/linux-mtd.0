Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCD1C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 14:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQzbT9YMuFWsncf0TOI9CaXvJmMy1g89n8yWHqIMVqk=; b=xn7je0J91zAL3i
	Qf5h1b/X5NRHTUR3UHaoGAzqy9BEPpDr7PIzRLtK1x+Y/NPHlBMQBtLSRIOu4eS25jYxnc0VEM9P7
	1QSJeu1c9bM5LHgZKcw/IFLX9q1IFzBRcGV1bfBGNt+cm3cxpjsi1mnKC3yHGCgZBcLzMKXqRyonr
	eVYWRUDTsbBQ1n/ciHkGTXf4j5Rb7HZ8KFZ1SQQ6Yxzjo1PiNkwgUYAg2LOKAopKXlOHaM8Ekosm6
	aI3iqLPTgrJiYIxSfvFmczqInrDiCZ2ae6YJcVHSX7CxBxMR6frEoHrfWdTAiN7Ca+YmZtTphS55N
	fsk4IbdQHaMizc+uCkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCga-007gij-1x;
	Wed, 01 Nov 2023 14:59:12 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyCgR-007gd4-2w
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 14:59:11 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5437d60fb7aso2961160a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 07:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698850739; x=1699455539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftD45+94BE7lGnnuN8b0M61zwN6yhXdQsDaemRaqwM4=;
        b=nNPNoCvgzZN0XbYu9/1jtqakNqQw0PHvkpG0ekTF54EMjKJHiVzCIliby7OwVJg340
         QVzf+CbHH+wlzsbrNtENMc/S21T0zxp2ctIWbFAZItMGW5t8yjE2DKQ3lEk7fB1z36Qz
         5ak213x17jtTHp7Dwag9t2hVXIZqd6QyJM6lvwlu8NOOQXcF2Fccw6RUgwktykAY+GBk
         52io2XAKkVDmUmhb8okhAhP1XJTzWQOAKinPdy089vXI1Gk0aSl0mLfs3jep6sWaoaiC
         66TXtauhPsnTo2MVEVJkliYM6rxQ4ORqK5RTN/IReBgef5qNuB4SJKzOG9TV2p8HfrVy
         1VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698850739; x=1699455539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftD45+94BE7lGnnuN8b0M61zwN6yhXdQsDaemRaqwM4=;
        b=xKXdHM1hx4i7k7nZOPndyv6KLqBz9M9UOJjwwqe701JZT1K204g6jd3EttTSKKvb9U
         6lH0Kn+k4vdrAIIljWQq1lo+1Xt2ThAaEWJAZGlP6wgIGH3HsP8vSU6Rg3Ak6wL8Abs2
         +B1nCCtK9a3NCzwbFo+hKH97YFUa5YUw7z78D/lLkumkD0C8rvI6w+aqSYK5cfjJjkHi
         ZIHuDRVjgVMJo0lG/Ve4e0wAmssvyXJVZQiDDXiO72xX5d1X7Y4A9QGf4jK5EJCi6UE4
         csQrr8XXquAYWZQmgsf4puukO7cHKTkozuLI5fDec+3qS5Posxxpx9r5FM414vGBzjnJ
         wfBA==
X-Gm-Message-State: AOJu0YyM3v857kfvFhJv0LUNbaTTlWUDq0fGybNMO1W9d07TbFvqDHiV
	P2KrXN7Jpc2IaHbT7m2mWPsKzw==
X-Google-Smtp-Source: AGHT+IF6oznjB9sjYq+mm/3VckJ2AhbXYtNHqWTUI31WItTpPA0dINfCOkgnCLucoMuKRjaAdk/bRA==
X-Received: by 2002:a17:907:3181:b0:9bf:b5bc:6c4b with SMTP id xe1-20020a170907318100b009bfb5bc6c4bmr2444624ejb.62.1698850739253;
        Wed, 01 Nov 2023 07:58:59 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id i18-20020a170906115200b009ad8acac02asm20448eja.172.2023.11.01.07.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:58:58 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 1/6] mtd: spi-nor: use kernel sized types instead of c99 types
Date: Wed,  1 Nov 2023 14:58:48 +0000
Message-ID: <20231101145853.524045-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231101145853.524045-1-tudor.ambarus@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_075903_972081_C0DA9EA4 
X-CRM114-Status: GOOD (  18.74  )
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

The kernel offers and prefers the kernel sized types instead of the c99
types when not in the uapi directory, use them.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/atmel.c | 16 +++++++---------
 drivers/mtd/spi-nor/core.c  |  5 ++---
 drivers/mtd/spi-nor/core.h  |  6 +++---
 drivers/mtd/spi-nor/sst.c   |  6 +++---
 drivers/mtd/spi-nor/swp.c   | 25 ++++++++++++-------------
 5 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index e13b8d2dd50a..45d1153a04a0 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -16,12 +16,12 @@
  * is to unlock the whole flash array on startup. Therefore, we have to support
  * exactly this operation.
  */
-static int at25fs_nor_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int at25fs_nor_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	return -EOPNOTSUPP;
 }
 
-static int at25fs_nor_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int at25fs_nor_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	int ret;
 
@@ -37,7 +37,7 @@ static int at25fs_nor_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-static int at25fs_nor_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int at25fs_nor_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	return -EOPNOTSUPP;
 }
@@ -69,7 +69,7 @@ static const struct spi_nor_fixups at25fs_nor_fixups = {
  * Return: 0 on success, -error otherwise.
  */
 static int atmel_nor_set_global_protection(struct spi_nor *nor, loff_t ofs,
-					   uint64_t len, bool is_protect)
+					   u64 len, bool is_protect)
 {
 	int ret;
 	u8 sr;
@@ -118,20 +118,18 @@ static int atmel_nor_set_global_protection(struct spi_nor *nor, loff_t ofs,
 	return spi_nor_write_sr(nor, nor->bouncebuf, 1);
 }
 
-static int atmel_nor_global_protect(struct spi_nor *nor, loff_t ofs,
-				    uint64_t len)
+static int atmel_nor_global_protect(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	return atmel_nor_set_global_protection(nor, ofs, len, true);
 }
 
-static int atmel_nor_global_unprotect(struct spi_nor *nor, loff_t ofs,
-				      uint64_t len)
+static int atmel_nor_global_unprotect(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	return atmel_nor_set_global_protection(nor, ofs, len, false);
 }
 
 static int atmel_nor_is_global_protected(struct spi_nor *nor, loff_t ofs,
-					 uint64_t len)
+					 u64 len)
 {
 	int ret;
 
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..25a64c65717d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1799,8 +1799,7 @@ static int spi_nor_erase_multi_sectors(struct spi_nor *nor, u64 addr, u32 len)
 static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
-	u32 addr, len;
-	uint32_t rem;
+	u32 addr, len, rem;
 	int ret;
 
 	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
@@ -2146,7 +2145,7 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
 		if (is_power_of_2(page_size)) {
 			page_offset = addr & (page_size - 1);
 		} else {
-			uint64_t aux = addr;
+			u64 aux = addr;
 
 			page_offset = do_div(aux, page_size);
 		}
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 93cd2fc3606d..a456042379ee 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -293,9 +293,9 @@ struct spi_nor_erase_map {
  * @is_locked:	check if a region of the SPI NOR is completely locked
  */
 struct spi_nor_locking_ops {
-	int (*lock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*unlock)(struct spi_nor *nor, loff_t ofs, uint64_t len);
-	int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
+	int (*lock)(struct spi_nor *nor, loff_t ofs, u64 len);
+	int (*unlock)(struct spi_nor *nor, loff_t ofs, u64 len);
+	int (*is_locked)(struct spi_nor *nor, loff_t ofs, u64 len);
 };
 
 /**
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index 44d2a546bf17..180b7390690c 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -13,12 +13,12 @@
 
 #define SST26VF_CR_BPNV		BIT(3)
 
-static int sst26vf_nor_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sst26vf_nor_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	return -EOPNOTSUPP;
 }
 
-static int sst26vf_nor_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sst26vf_nor_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	int ret;
 
@@ -38,7 +38,7 @@ static int sst26vf_nor_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	return spi_nor_global_block_unlock(nor);
 }
 
-static int sst26vf_nor_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int sst26vf_nor_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 585813310ee1..e48c3cff247a 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -53,7 +53,7 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
 }
 
 static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
-					uint64_t *len)
+					u64 *len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
@@ -90,10 +90,10 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
  * (if @locked is false); false otherwise.
  */
 static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
-					 uint64_t len, u8 sr, bool locked)
+					 u64 len, u8 sr, bool locked)
 {
 	loff_t lock_offs, lock_offs_max, offs_max;
-	uint64_t lock_len;
+	u64 lock_len;
 
 	if (!len)
 		return true;
@@ -111,14 +111,13 @@ static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 		return (ofs >= lock_offs_max) || (offs_max <= lock_offs);
 }
 
-static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-				 u8 sr)
+static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, u8 sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
 }
 
-static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs,
-				   uint64_t len, u8 sr)
+static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
+				   u8 sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
 }
@@ -156,7 +155,7 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs,
  *
  * Returns negative on errors, 0 on success.
  */
-static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
@@ -246,7 +245,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
  *
  * Returns negative on errors, 0 on success.
  */
-static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u64 min_prot_len;
@@ -331,7 +330,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
  * Returns 1 if entire region is locked, 0 if any portion is unlocked, and
  * negative on errors.
  */
-static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, uint64_t len)
+static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	int ret;
 
@@ -353,7 +352,7 @@ void spi_nor_init_default_locking_ops(struct spi_nor *nor)
 	nor->params->locking_ops = &spi_nor_sr_locking_ops;
 }
 
-static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, u64 len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
@@ -368,7 +367,7 @@ static int spi_nor_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, u64 len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
@@ -383,7 +382,7 @@ static int spi_nor_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
-static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, u64 len)
 {
 	struct spi_nor *nor = mtd_to_spi_nor(mtd);
 	int ret;
-- 
2.42.0.820.g83a721a137-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
