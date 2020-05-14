Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E81DC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 21:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E45B206F1
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 21:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTG5VXiQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzutnI/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E45B206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4HUFImthBXjIV92t0TJz7cxOEXRAKnb1RsY4H6vlCk4=; b=iTG5VXiQeFAoSR2MXzLLytKiYG
	rSct5oPrlYuSUJc2LgSyVLwcaJIrU6gPFUdV6COMOr2R1fGb00EwqvanGBc3wdD5evRggO3GO6e4/
	0SJKLWIBPbVbQHGNerR7cblCKnpe4HxohfUcPAPRAo4OcZPSN3TtnkfCNbd5V6QaKkjEpMi72tG8U
	zrsuPrtGf6yYvw94BJxs6jm/nNfvV8rAle/EKHDwCTvDyccWSPeC3yDvlX2i0NGpWXR05yilLCm/B
	mJeN6F4RHAXS6PZWypYHn6p/yJbmRxjVQX8q1ZUE3b5CmbYE+CphOdorQ/oEpKY1bIxcbntT03Ehn
	PQQmZsuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZLKl-0007W3-Oq; Thu, 14 May 2020 21:24:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZLKZ-0007KE-GW
 for linux-mtd@lists.infradead.org; Thu, 14 May 2020 21:23:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id v12so584053wrp.12
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2020 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ulHZ8558oeGMXwN9zdwrz0Ew9CJYldL2ZMK9Dx5VWrQ=;
 b=OzutnI/gEkUrQeDxIkXg5Sh1P9b7R7bDv+rwX1sYdGERPwb42BA/lUxkmVg6VQpcgS
 WJgD0PIWmVRHW5MMWWS9HiMbKv385L+QcvPEhWPYSf/LPsJv+RPDwyj53c6pYkkPVGh6
 q1Iqah4r/63nHSWW2ljhEfvFS0CLZPVI6UAFy4//IYKvvHANDFox5UIsY/tfaqwlORnl
 O1upu2yY6pQVjnjtuRMWORK7hIxvihJQaK9NvUyBuG6QbzOHJzE9oRuHIBytC+JzREE8
 WEP02y8abtdsI7udtpe3kB3cvTZau83hYwA1vgXIvdn91N7lLyzqRfXmmRvJVBwbEMHu
 Rl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ulHZ8558oeGMXwN9zdwrz0Ew9CJYldL2ZMK9Dx5VWrQ=;
 b=kbNX7lVMpUaPfJbH7TNPCw0pqCNBS3IEX4QzjAXt3+ZCZwzBwHdDZNuoxfIPw5zBCK
 bWUyduOWKiLG/HzFdKkb22Pq/zr10n36tvE+R6ufedZL9RdU4y5bKdgQij2hcLgVHEa0
 Ql/W41+6jSqnsL0lz6tW5Rd7zx22nSkGMc0Qe0mToxgD4LkoPI/6y0aMhswNoZgHMB8S
 NrvD63sjztHuSLV7sB3UM1y6Pb65A/vHpQX2qsJ1HIp9QYtuqzORG8Q83k4kYiQQ3rtF
 IVZMXGrYRL5Imox79qP001e8288evEihAwh9GIVwZmpparPtR3zaxaz2rFwwYscFAlk9
 P0Kw==
X-Gm-Message-State: AOAM532hoYlxTaUXArkrqHVVg1aAi8izm/nBeDI+OVSZseNlMUmGRPQq
 B/d/yISxmIKNwnIjbHOLXWU=
X-Google-Smtp-Source: ABdhPJyx5kNffekMfSCU3XOff4N/HkBYexfK/7k57F07WY0JzydsqwyHHMLte+TVwGSp/sPcAr4NOQ==
X-Received: by 2002:adf:e905:: with SMTP id f5mr397637wrm.409.1589491428973;
 Thu, 14 May 2020 14:23:48 -0700 (PDT)
Received: from localhost.localdomain (ip5f5bfcc8.dynamic.kabel-deutschland.de.
 [95.91.252.200])
 by smtp.gmail.com with ESMTPSA id 128sm491210wme.39.2020.05.14.14.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:23:48 -0700 (PDT)
From: huobean@gmail.com
X-Google-Original-From: beanhuo@micron.com
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v3 1/5] mtd: rawnand: group all NAND specific ops into new
 nand_chip_ops
Date: Thu, 14 May 2020 23:23:29 +0200
Message-Id: <20200514212333.28692-2-beanhuo@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514212333.28692-1-beanhuo@micron.com>
References: <20200514212333.28692-1-beanhuo@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_142351_547943_99F41B28 
X-CRM114-Status: GOOD (  18.19  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bean Huo <beanhuo@micron.com>

This patch is to create a new structure nand_chip_ops, and take all NAND
specific functions out from nand_chip and put them in this new structure.

Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/nand/raw/nand_base.c     | 20 +++++++++---------
 drivers/mtd/nand/raw/nand_hynix.c    |  2 +-
 drivers/mtd/nand/raw/nand_macronix.c | 10 ++++-----
 drivers/mtd/nand/raw/nand_micron.c   |  2 +-
 include/linux/mtd/rawnand.h          | 31 +++++++++++++++++-----------
 5 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c24e5e2ba130..a9432e9abf82 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3130,10 +3130,10 @@ static int nand_setup_read_retry(struct nand_chip *chip, int retry_mode)
 	if (retry_mode >= chip->read_retries)
 		return -EINVAL;
 
-	if (!chip->setup_read_retry)
+	if (!chip->ops.setup_read_retry)
 		return -EOPNOTSUPP;
 
-	return chip->setup_read_retry(chip, retry_mode);
+	return chip->ops.setup_read_retry(chip, retry_mode);
 }
 
 static void nand_wait_readrdy(struct nand_chip *chip)
@@ -4335,8 +4335,8 @@ static int nand_suspend(struct mtd_info *mtd)
 	int ret = 0;
 
 	mutex_lock(&chip->lock);
-	if (chip->suspend)
-		ret = chip->suspend(chip);
+	if (chip->ops.suspend)
+		ret = chip->ops.suspend(chip);
 	if (!ret)
 		chip->suspended = 1;
 	mutex_unlock(&chip->lock);
@@ -4354,8 +4354,8 @@ static void nand_resume(struct mtd_info *mtd)
 
 	mutex_lock(&chip->lock);
 	if (chip->suspended) {
-		if (chip->resume)
-			chip->resume(chip);
+		if (chip->ops.resume)
+			chip->ops.resume(chip);
 		chip->suspended = 0;
 	} else {
 		pr_err("%s called for a chip which is not in suspended state\n",
@@ -4384,10 +4384,10 @@ static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
-	if (!chip->lock_area)
+	if (!chip->ops.lock_area)
 		return -ENOTSUPP;
 
-	return chip->lock_area(chip, ofs, len);
+	return chip->ops.lock_area(chip, ofs, len);
 }
 
 /**
@@ -4400,10 +4400,10 @@ static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
-	if (!chip->unlock_area)
+	if (!chip->ops.unlock_area)
 		return -ENOTSUPP;
 
-	return chip->unlock_area(chip, ofs, len);
+	return chip->ops.unlock_area(chip, ofs, len);
 }
 
 /* Set default functions */
diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
index 7caedaa5b9e5..7d1be53f27f3 100644
--- a/drivers/mtd/nand/raw/nand_hynix.c
+++ b/drivers/mtd/nand/raw/nand_hynix.c
@@ -337,7 +337,7 @@ static int hynix_mlc_1xnm_rr_init(struct nand_chip *chip,
 	rr->nregs = nregs;
 	rr->regs = hynix_1xnm_mlc_read_retry_regs;
 	hynix->read_retry = rr;
-	chip->setup_read_retry = hynix_nand_setup_read_retry;
+	chip->ops.setup_read_retry = hynix_nand_setup_read_retry;
 	chip->read_retries = nmodes;
 
 out:
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 09c254c97b5c..1472f925f386 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -130,7 +130,7 @@ static void macronix_nand_onfi_init(struct nand_chip *chip)
 		return;
 
 	chip->read_retries = MACRONIX_NUM_READ_RETRY_MODES;
-	chip->setup_read_retry = macronix_nand_setup_read_retry;
+	chip->ops.setup_read_retry = macronix_nand_setup_read_retry;
 
 	if (p->supports_set_get_features) {
 		bitmap_set(p->set_feature_list,
@@ -242,8 +242,8 @@ static void macronix_nand_block_protection_support(struct nand_chip *chip)
 	bitmap_set(chip->parameters.set_feature_list,
 		   ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
 
-	chip->lock_area = mxic_nand_lock;
-	chip->unlock_area = mxic_nand_unlock;
+	chip->ops.lock_area = mxic_nand_lock;
+	chip->ops.unlock_area = mxic_nand_unlock;
 }
 
 static int nand_power_down_op(struct nand_chip *chip)
@@ -312,8 +312,8 @@ static void macronix_nand_deep_power_down_support(struct nand_chip *chip)
 	if (i < 0)
 		return;
 
-	chip->suspend = mxic_nand_suspend;
-	chip->resume = mxic_nand_resume;
+	chip->ops.suspend = mxic_nand_suspend;
+	chip->ops.resume = mxic_nand_resume;
 }
 
 static int macronix_nand_init(struct nand_chip *chip)
diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index 56654030ec7f..d30bc944f729 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -84,7 +84,7 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
 		struct nand_onfi_vendor_micron *micron = (void *)p->onfi->vendor;
 
 		chip->read_retries = micron->read_retry_options;
-		chip->setup_read_retry = micron_nand_setup_read_retry;
+		chip->ops.setup_read_retry = micron_nand_setup_read_retry;
 	}
 
 	if (p->supports_set_get_features) {
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 1e76196f9829..8f5871cf2542 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1010,6 +1010,23 @@ struct nand_legacy {
 	struct nand_controller dummy_controller;
 };
 
+/**
+ * struct nand_chip_ops - NAND Chip specific operations
+ * @suspend:           [REPLACEABLE] specific NAND device suspend operation
+ * @resume:            [REPLACEABLE] specific NAND device resume operation
+ * @lock_area:         [REPLACEABLE] specific NAND chip lock operation
+ * @unlock_area:       [REPLACEABLE] specific NAND chip unlock operation
+ * @setup_read_retry:  [FLASHSPECIFIC] flash (vendor) specific function for
+ *                     setting the read-retry mode. Mostly needed for MLC NAND.
+ */
+struct nand_chip_ops {
+	int (*suspend)(struct nand_chip *chip);
+	void (*resume)(struct nand_chip *chip);
+	int (*lock_area)(struct nand_chip *chip, loff_t ofs, u64 len);
+	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, u64 len);
+	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
+};
+
 /**
  * struct nand_chip - NAND Private Flash Chip Data
  * @base:		Inherit from the generic NAND device
@@ -1018,8 +1035,6 @@ struct nand_legacy {
  *			you're modifying an existing driver that is using those
  *			fields/hooks, you should consider reworking the driver
  *			avoid using them.
- * @setup_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
- *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buf_align:		minimum buffer alignment required by a platform
  * @oob_poi:		"poison value buffer," used for laying out OOB data
@@ -1064,8 +1079,6 @@ struct nand_legacy {
  * @lock:		lock protecting the suspended field. Also used to
  *			serialize accesses to the NAND device.
  * @suspended:		set to 1 when the device is suspended, 0 when it's not.
- * @suspend:		[REPLACEABLE] specific NAND device suspend operation
- * @resume:		[REPLACEABLE] specific NAND device resume operation
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
@@ -1079,8 +1092,7 @@ struct nand_legacy {
  * @manufacturer:	[INTERN] Contains manufacturer information
  * @manufacturer.desc:	[INTERN] Contains manufacturer's description
  * @manufacturer.priv:	[INTERN] Contains manufacturer private information
- * @lock_area:		[REPLACEABLE] specific NAND chip lock operation
- * @unlock_area:	[REPLACEABLE] specific NAND chip unlock operation
+ * @ops:		NAND-specific operations description structure
  */
 
 struct nand_chip {
@@ -1088,8 +1100,6 @@ struct nand_chip {
 
 	struct nand_legacy legacy;
 
-	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
-
 	unsigned int options;
 	unsigned int bbt_options;
 
@@ -1121,8 +1131,6 @@ struct nand_chip {
 
 	struct mutex lock;
 	unsigned int suspended : 1;
-	int (*suspend)(struct nand_chip *chip);
-	void (*resume)(struct nand_chip *chip);
 
 	uint8_t *oob_poi;
 	struct nand_controller *controller;
@@ -1143,8 +1151,7 @@ struct nand_chip {
 		void *priv;
 	} manufacturer;
 
-	int (*lock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
-	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
+	struct nand_chip_ops ops;
 };
 
 extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
