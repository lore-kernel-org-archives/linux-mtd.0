Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAEDC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:17:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 292C0206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:17:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mxBneSoU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFIwqv20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 292C0206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1S0EVOE0QqYBKXEgaOvLdz708QMoSKiwUC6hirsbWOU=; b=mxBneSoUjPvPGr90Mmd7KGMedJ
	TMMQf810UiAaSsTyUHr3qzGdaKzyQHEywHQoliD7+q2RtDVeATqaYD9A4dbb66lwi6tFULnH2InTm
	poQlRRvIEguexDHcrtoGWM51bfWy6INR0jcLdz4AId829F4DfeGuFNOyDxSnvceOzaWmkxy2iUXC/
	/lA+ii1jmgwTZqtMWMowLvjzSuzYwtqlZKfuqUOpelI4ZbFzATPZOYd1r7Bgt8qlEVQsD1draDvIH
	bD9LAB8l1LkLoWtk0mGyrkGVrwDTUcZi5w+gYnInuojqvAKtASRen60CWPn0b1ciTGGo+eFvwLfPp
	njDigT9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jazJp-0000RV-4D; Tue, 19 May 2020 10:17:53 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jazJm-0000P5-Ah
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 10:17:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id m185so2842063wme.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A4qhrGBB7f1ImMUQjw2ZKgOqKWcJqgmHu7USuIdXtmw=;
 b=ZFIwqv20yKDzCtPyp2exuuMOcMWF0mNtTJmydlf57G36GM4+atpCvwqT1yx+ursSPJ
 1csJlGKBRNXrigXzv4JOn5CF9QDQx/WA3ExtqZ4lBqAmivRK07yVMfVIiFkWABDkgA36
 ORvf8ixCH9vBKLk7Hn/eJIf2JYPv8axueI90hFffZg4piIycg+OoERwUxNQYYKRCU050
 qnH6kgfi8IdPGyWr9SJkcgIQi5kHAKjR30nvZw3SBSMR5+p4X7YxL78IgsYf+lNFtKL8
 9xuSR0s4O+T6Ip+tB1643b8qCYl+b3kVovFb10jXoJqsI8sM/1s8kC+RMSlfUa8H+KIr
 NUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A4qhrGBB7f1ImMUQjw2ZKgOqKWcJqgmHu7USuIdXtmw=;
 b=dt5dnvnEUmo1Hu5ISPOfFvYWPmUGBNxzrRC+vnjpPQLmTWHnUAEoWwPogLn98NMcAJ
 mLCgaVg8M2zWSQ4eJcLXOwuSTGcKJ5HyH4E68LVYjdEuYlAbbffo/4aLaGtjyW55b1MG
 wacZgCESGIX8nBSj1ts18vx3t3H+3Wzg6B9kplKehvsyyxaYFCSKUvkce/m4dqgYPgSo
 48VxF2rP5lHN/g86ASnoJqSoH5P0F6O59kwCmSgQ6ZLMJNXAiwwi1x8R54bJxI1xtFvG
 M5Whi2lKv+5UY9WGlwaJ+WZw3pJHGGr8dl1trQ+3AqdgdYWbGt0GzHNHdwsb2x0OUbsK
 0m3Q==
X-Gm-Message-State: AOAM531NhxrFEQJS28hWurfkJ8FRyd8ngnZKXKHVWGI4rqfiTlEI/8f/
 84/jI/ahCjlnyhABG7DxAhc=
X-Google-Smtp-Source: ABdhPJzD7dreTkB1iqFNlipfzmNLk2cSF1FQAAVW4agh3Ea6GgPQWPLfsia3hdGcn9nsH+7/gJ4TSw==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr4607461wmf.8.1589883468999;
 Tue, 19 May 2020 03:17:48 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.86.140])
 by smtp.gmail.com with ESMTPSA id w15sm3062488wmi.35.2020.05.19.03.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:17:48 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [RESET PATCH v5 1/5] mtd: rawnand: group all NAND specific ops into
 new nand_chip_ops
Date: Tue, 19 May 2020 12:17:30 +0200
Message-Id: <20200519101734.19927-2-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519101734.19927-1-huobean@gmail.com>
References: <20200519101734.19927-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_031750_390727_502C964F 
X-CRM114-Status: GOOD (  17.75  )
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
Cc: huobean@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bean Huo <beanhuo@micron.com>
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
index 2d2a216af120..7af21cf49290 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -3234,10 +3234,10 @@ static int nand_setup_read_retry(struct nand_chip *chip, int retry_mode)
 	if (retry_mode >= chip->read_retries)
 		return -EINVAL;
 
-	if (!chip->setup_read_retry)
+	if (!chip->ops.setup_read_retry)
 		return -EOPNOTSUPP;
 
-	return chip->setup_read_retry(chip, retry_mode);
+	return chip->ops.setup_read_retry(chip, retry_mode);
 }
 
 static void nand_wait_readrdy(struct nand_chip *chip)
@@ -4481,8 +4481,8 @@ static int nand_suspend(struct mtd_info *mtd)
 	int ret = 0;
 
 	mutex_lock(&chip->lock);
-	if (chip->suspend)
-		ret = chip->suspend(chip);
+	if (chip->ops.suspend)
+		ret = chip->ops.suspend(chip);
 	if (!ret)
 		chip->suspended = 1;
 	mutex_unlock(&chip->lock);
@@ -4500,8 +4500,8 @@ static void nand_resume(struct mtd_info *mtd)
 
 	mutex_lock(&chip->lock);
 	if (chip->suspended) {
-		if (chip->resume)
-			chip->resume(chip);
+		if (chip->ops.resume)
+			chip->ops.resume(chip);
 		chip->suspended = 0;
 	} else {
 		pr_err("%s called for a chip which is not in suspended state\n",
@@ -4530,10 +4530,10 @@ static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
-	if (!chip->lock_area)
+	if (!chip->ops.lock_area)
 		return -ENOTSUPP;
 
-	return chip->lock_area(chip, ofs, len);
+	return chip->ops.lock_area(chip, ofs, len);
 }
 
 /**
@@ -4546,10 +4546,10 @@ static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
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
index b2b047b245f4..b3485b0995ad 100644
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
index 0f45b6984ad1..62932cc3ed8d 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1025,6 +1025,23 @@ struct nand_legacy {
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
@@ -1033,8 +1050,6 @@ struct nand_legacy {
  *			you're modifying an existing driver that is using those
  *			fields/hooks, you should consider reworking the driver
  *			avoid using them.
- * @setup_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
- *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buf_align:		minimum buffer alignment required by a platform
  * @oob_poi:		"poison value buffer," used for laying out OOB data
@@ -1079,8 +1094,6 @@ struct nand_legacy {
  * @lock:		lock protecting the suspended field. Also used to
  *			serialize accesses to the NAND device.
  * @suspended:		set to 1 when the device is suspended, 0 when it's not.
- * @suspend:		[REPLACEABLE] specific NAND device suspend operation
- * @resume:		[REPLACEABLE] specific NAND device resume operation
  * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
@@ -1094,8 +1107,7 @@ struct nand_legacy {
  * @manufacturer:	[INTERN] Contains manufacturer information
  * @manufacturer.desc:	[INTERN] Contains manufacturer's description
  * @manufacturer.priv:	[INTERN] Contains manufacturer private information
- * @lock_area:		[REPLACEABLE] specific NAND chip lock operation
- * @unlock_area:	[REPLACEABLE] specific NAND chip unlock operation
+ * @ops:		NAND-specific operations description structure
  */
 
 struct nand_chip {
@@ -1103,8 +1115,6 @@ struct nand_chip {
 
 	struct nand_legacy legacy;
 
-	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
-
 	unsigned int options;
 	unsigned int bbt_options;
 
@@ -1136,8 +1146,6 @@ struct nand_chip {
 
 	struct mutex lock;
 	unsigned int suspended : 1;
-	int (*suspend)(struct nand_chip *chip);
-	void (*resume)(struct nand_chip *chip);
 
 	uint8_t *oob_poi;
 	struct nand_controller *controller;
@@ -1158,8 +1166,7 @@ struct nand_chip {
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
