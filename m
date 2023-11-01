Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F37C0018C
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 09:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bhf2VlcXJVAxVZQG+UAWLVgE2gIKDgR/nJQ2yWmFPfc=; b=cBKNmLv1H9Zgxr
	Ik7EtZ4OFrf7RUroYLbhSVUTGR2POKAFy99f0e/wqHuniQeXrD8BbFEYgy5gOKtTGeDZwrzuRP6X+
	pAz+Mm2CtaGTzsstMdteSjMEsWfv5y+He76bRC97fSqXz7lV1kyzNPLc59T8Bv89Q8P65Zxdhjrl8
	71vMP2Lna9d263Lk66xBiG4PKICAyR39pTcuXMCV1FNIbAwQUrk8sGwOfTNaUg9OPenz6rzhGy7Xh
	aRMDUnTPqtjTfXQhNhewgTJjrgrV9F7Y/2l9kDpQ8IT12RFhO4AWQq2fej7YNZv92/k90VKE1Bc8c
	7MdrYvUw/eIgLxC5UdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lI-006yBM-0i;
	Wed, 01 Nov 2023 09:43:44 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lB-006y6f-06
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 09:43:41 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9d8d3b65a67so46455066b.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698831812; x=1699436612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+QpeP9wZK2Tu8on49bqFT4NyaoS/8DKC9ZKmM+/qRM=;
        b=DWYENk49/NTEIx3jZwKTtqNT269u7jApU/jHYE3MiVweYptQ0OVvnRfUScMGSmbmWc
         tvJB0uZTQTv/qCb6yTUcvxbmQPqc8L8iTXi8gwNt/5uGbM5d4Fnjf6xizzb6+54DiRda
         Q/Uts6CIlBNDcZF/bE6jUKO/ywVTZZH0QMtWH/8BObK7uv87giK3dEbGLS8L6l5IHuGb
         JJX7nUuSpTd6YXbFj+gzo8uugj2rsv57oBMHIaI1ySeOhoEVnm3Cx/L8/4kgChTDWFqg
         XYLmE39Ee6Jf9aZPowou/JLSdKufrlaBoll7KdROA/5R9sjOEhQzjeVrrSGDr+3yXBs7
         JTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698831812; x=1699436612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+QpeP9wZK2Tu8on49bqFT4NyaoS/8DKC9ZKmM+/qRM=;
        b=O7TTBzfqpsNd04fydaqa1jHD0RmZjfy32UoZQ5b73mBTEWgsikLD5rNdC+qoosvEmC
         HUARBTReWD34oG5FgTi5d2pJbZJDrmCS5J2Xva7/n3zuKP90zgpWlGpwKz+04z1vGR8d
         sPm5UBcKI4hWw9YYW8GOtrx5J8ckjTuyukkm4aJTpWEQN3CyAEv7SibMw91S+sO6huzf
         xevard+oBlCxbfrSxLUnlvcJtP7hD6Xd1yI/JzBfVlAnpUjembef1XFghjZ0Hw94iypj
         TSRvqUSUrJQoKiD8EUJe2aaj7remOLAaqfPKfP8PtT9I32m8u3SqjPt3etfu1b2cbj6y
         T+Ag==
X-Gm-Message-State: AOJu0YwKe2ANCG+X5tXtXtrekIpWmZDqOGTOn9EyNfZwL3i+c7K3f0v9
	ln/BidKSgHtnrniuFi0HHqiwaTQjZMBGnIenENc=
X-Google-Smtp-Source: AGHT+IHKtM9MiFfWrM5b1k9NxXFHfnpI8L2gLxw3VEQ1D5Be3jxeVDZ7rNBzcfoaghGoLkwUoH52bA==
X-Received: by 2002:a17:906:da8a:b0:9ae:46c7:90fe with SMTP id xh10-20020a170906da8a00b009ae46c790femr1391718ejb.72.1698831811612;
        Wed, 01 Nov 2023 02:43:31 -0700 (PDT)
Received: from 1.. ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b0099e12a49c8fsm2206415ejb.173.2023.11.01.02.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:43:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/6] mtd: spi-nor: use kernel sized types instead of c99 types
Date: Wed,  1 Nov 2023 11:43:20 +0200
Message-Id: <20231101094325.95851-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231101094325.95851-1-tudor.ambarus@linaro.org>
References: <20231101094325.95851-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8738; i=tudor.ambarus@linaro.org; h=from:subject; bh=YuRCpKSiSJk/EOlzNGel/XPp8w1Cwhl7XINE3qqXZ9I=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBlQh28CLWp1IHIWBQ3cwRLqn7MPaoNOajDH80EM kj7yykLg4aJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZUIdvAAKCRBLVU9HpY0U 6Y+KB/sEmGM2O+enoI4DA0KqiMgXdufVWO4BTosKi/zp+3aKxBa5MzvcrGEdyoK/khjdo3tGr35 5ih/L5xeRojzyzRWuvmEQ22gx6DnKfvgFjtVahw9HV1GlLwHrgA028v1pwyud/T4QCN8geR/0u0 wt7W0c8tJEAuRSMoFtGHDIUneXM+sfNGuuFW2EFBU+37/hqf4xAe/Hct/6ThCJ3g3fC2BJP8X6x MP6iXqHSpRcDGBvwKtSpkbo1kI9Tfq4QiSdI+9JAJtzZKuW6z5fqhjTqp/B1oDYmz9j+pMku3h7 Ekk8tZAia7N4Z3IslajH8V0wg3LQUd2z9UyHbBDJXL1BK+Ns
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_024337_087990_6C395B95 
X-CRM114-Status: GOOD (  19.06  )
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
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
