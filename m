Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C882BC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 02:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/b2XpDI1Ixo/dYUdnv1wEuyGV516bbCtJd9zy07aDw=; b=Y8b7ID5di6dNbV
	MvyDhu43lIh3tNIsDgKKjHGrKFxfAHHu6O8chQihhOEZzIc0++cYdBndTaRpQscFhGttnNXvYU3LV
	AOvgqRiPZdPhGNNTfnJM6pwc9d+YCQ7G9MQztGMOmRbjBeqnSUATWpp9J3loQ7uMAJfy+QEDj9Gbk
	USesSCXBka2MgOAhmqSlyLTSoAJAoCvGLtdWnpdH5aFuudsKiskqi2my9C783UHNGoH14BLFA8yc7
	Nk7ACXtnmFOxahaCs/ePj8cmh8450hocilc4kKeggCwy4rGyutksMS0RxNYyIiY1MHFr9K9u4wR+3
	ZdBJG9960j8r4PR9QQMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWTz0-009g4P-48; Tue, 22 Mar 2022 02:10:50 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWTym-009g33-FE
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 02:10:42 +0000
Received: by mail-pg1-x535.google.com with SMTP id i184so790392pgc.1
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 19:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/nPaaSxMF+oMbJ1b8ycGXIGlnF01X/wLsUX+PxH/BTQ=;
 b=XU1lEQ7TZLgF3nAZHks7VkUw8lAS7RgclLJMf3fwfXGGL9f7zjPOD7qDZyj0cJRZLj
 xuzzALFw4aeGiI2R2aW09yAystRB/T9CX9Fn6y0W86/kaTp2d34dT41tY+i6ghD/7lEs
 4TM306WmvGQS3gMsBaViF3AKwFwtnAa5Tkbo4ybUl5zOQRuhwDT7yJMBVu5lz37mA52e
 6mGjCdYefVSsUB76KkCNtIRWTB+d7pVRjr1MuzF7VNx+7RlqWyQsq6cVmBrvos+LIepC
 hxbtIKwFA/dj9PWJqEa+Gzm5KkM6RKN4tLTsZkjwywHCLfxr3mMeNe1Lcu92y5TGU5Ek
 apIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/nPaaSxMF+oMbJ1b8ycGXIGlnF01X/wLsUX+PxH/BTQ=;
 b=44GLDV1nGzThMqWn69DxuuNLP61Xa5RgD65eaoFNt5yajk3g/q+zReRXGEnx6/5l5I
 g+bUmCEBqi+TY2LvCMqnFlS6LSZqkExYydBNvQn6vhy+W3xvVMPEZgrjvaixGO33Fjpi
 T4t6xT+UQVGNaiLzPXNsbN+nIMmJhvaHY4L/cgTGkJLG+sowDqwSlhwnzB7boFXfSN74
 GJbpuOLJkfwDfzv7Ssmb/Me3qpyUxuty1q/xHZV5zrShhkmY1Gmd+fPBsR4lpcji8zXS
 Yntv2jMOYHB+khVskTmD/oLRxZFVuMyNmC/VdFpfl3/Ne7XLXfK73f8UerKO3sZztBZQ
 sC7g==
X-Gm-Message-State: AOAM531sORVx1niHLOKpmP2+Op3llMTAZMw98pijT5KLblqMWpSf94Tc
 DlXOqt5OHIF0CaPwlIzYpXk=
X-Google-Smtp-Source: ABdhPJxPY/12O1oqJ9jx+qVTe4LKuDuwHTSVMP4zvZ2k1dzoQhEGszwCPqTUAZGs0gWkDODnZg9xZA==
X-Received: by 2002:a05:6a00:174d:b0:4f6:67e3:965 with SMTP id
 j13-20020a056a00174d00b004f667e30965mr26481777pfc.39.1647915035388; 
 Mon, 21 Mar 2022 19:10:35 -0700 (PDT)
Received: from tokunori-desktop.flets-east.jp
 ([240b:10:2720:5500:1847:b4dd:1227:a1f6])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a655bc5000000b00372f7ecfcecsm15673579pgr.37.2022.03.21.19.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 19:10:34 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami.t@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH v5 1/3] mtd: cfi_cmdset_0002: Move and rename
 chip_check/chip_ready/chip_good_for_write
Date: Tue, 22 Mar 2022 11:09:59 +0900
Message-Id: <20220322021001.138206-2-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220322021001.138206-1-ikegami.t@gmail.com>
References: <20220322021001.138206-1-ikegami.t@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_191036_614557_51F1BACC 
X-CRM114-Status: GOOD (  21.76  )
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

This is a preparation patch for the S29GL064N buffer writes fix. There
is no functional change.

Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 95 ++++++++++-------------------
 1 file changed, 32 insertions(+), 63 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a761134fd3be..9ccde90dc180 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -802,21 +802,25 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 }
 
 /*
- * Return true if the chip is ready.
+ * Return true if the chip is ready and has the correct value.
  *
  * Ready is one of: read mode, query mode, erase-suspend-read mode (in any
  * non-suspended sector) and is indicated by no toggle bits toggling.
  *
+ * Error are indicated by toggling bits or bits held with the wrong value,
+ * or with bits toggling.
+ *
  * Note that anything more complicated than checking if no bits are toggling
  * (including checking DQ5 for an error status) is tricky to get working
  * correctly and is therefore not done	(particularly with interleaved chips
  * as each chip must be checked independently of the others).
  */
 static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
-			       unsigned long addr)
+			       unsigned long addr, map_word *expected)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	map_word d, t;
+	int ret;
 
 	if (cfi_use_status_reg(cfi)) {
 		map_word ready = CMD(CFI_SR_DRB);
@@ -826,57 +830,20 @@ static int __xipram chip_ready(struct map_info *map, struct flchip *chip,
 		 */
 		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
 				 cfi->device_type, NULL);
-		d = map_read(map, addr);
+		t = map_read(map, addr);
 
-		return map_word_andequal(map, d, ready, ready);
+		return map_word_andequal(map, t, ready, ready);
 	}
 
 	d = map_read(map, addr);
 	t = map_read(map, addr);
 
-	return map_word_equal(map, d, t);
-}
-
-/*
- * Return true if the chip is ready and has the correct value.
- *
- * Ready is one of: read mode, query mode, erase-suspend-read mode (in any
- * non-suspended sector) and it is indicated by no bits toggling.
- *
- * Error are indicated by toggling bits or bits held with the wrong value,
- * or with bits toggling.
- *
- * Note that anything more complicated than checking if no bits are toggling
- * (including checking DQ5 for an error status) is tricky to get working
- * correctly and is therefore not done	(particularly with interleaved chips
- * as each chip must be checked independently of the others).
- *
- */
-static int __xipram chip_good(struct map_info *map, struct flchip *chip,
-			      unsigned long addr, map_word expected)
-{
-	struct cfi_private *cfi = map->fldrv_priv;
-	map_word oldd, curd;
-
-	if (cfi_use_status_reg(cfi)) {
-		map_word ready = CMD(CFI_SR_DRB);
-
-		/*
-		 * For chips that support status register, check device
-		 * ready bit
-		 */
-		cfi_send_gen_cmd(0x70, cfi->addr_unlock1, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		curd = map_read(map, addr);
-
-		return map_word_andequal(map, curd, ready, ready);
-	}
+	ret = map_word_equal(map, d, t);
 
-	oldd = map_read(map, addr);
-	curd = map_read(map, addr);
+	if (!ret || !expected)
+		return ret;
 
-	return	map_word_equal(map, oldd, curd) &&
-		map_word_equal(map, curd, expected);
+	return map_word_equal(map, t, *expected);
 }
 
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
@@ -893,7 +860,7 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 
 	case FL_STATUS:
 		for (;;) {
-			if (chip_ready(map, chip, adr))
+			if (chip_ready(map, chip, adr, NULL))
 				break;
 
 			if (time_after(jiffies, timeo)) {
@@ -932,7 +899,7 @@ static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
 		for (;;) {
-			if (chip_ready(map, chip, adr))
+			if (chip_ready(map, chip, adr, NULL))
 				break;
 
 			if (time_after(jiffies, timeo)) {
@@ -1463,7 +1430,7 @@ static int do_otp_lock(struct map_info *map, struct flchip *chip, loff_t adr,
 	/* wait for chip to become ready */
 	timeo = jiffies + msecs_to_jiffies(2);
 	for (;;) {
-		if (chip_ready(map, chip, adr))
+		if (chip_ready(map, chip, adr, NULL))
 			break;
 
 		if (time_after(jiffies, timeo)) {
@@ -1695,11 +1662,11 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 		}
 
 		/*
-		 * We check "time_after" and "!chip_good" before checking
-		 * "chip_good" to avoid the failure due to scheduling.
+		 * We check "time_after" and "!chip_ready" before checking
+		 * "chip_ready" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_good(map, chip, adr, datum)) {
+		    !chip_ready(map, chip, adr, &datum)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
@@ -1707,7 +1674,7 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum)) {
+		if (chip_ready(map, chip, adr, &datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
@@ -1975,18 +1942,18 @@ static int __xipram do_write_buffer_wait(struct map_info *map,
 		}
 
 		/*
-		 * We check "time_after" and "!chip_good" before checking
-		 * "chip_good" to avoid the failure due to scheduling.
+		 * We check "time_after" and "!chip_ready" before checking
+		 * "chip_ready" to avoid the failure due to scheduling.
 		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_good(map, chip, adr, datum)) {
+		    !chip_ready(map, chip, adr, &datum)) {
 			pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
 			       __func__, adr);
 			ret = -EIO;
 			break;
 		}
 
-		if (chip_good(map, chip, adr, datum)) {
+		if (chip_ready(map, chip, adr, &datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
@@ -2195,7 +2162,7 @@ static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
 	 * If the driver thinks the chip is idle, and no toggle bits
 	 * are changing, then the chip is actually idle for sure.
 	 */
-	if (chip->state == FL_READY && chip_ready(map, chip, adr))
+	if (chip->state == FL_READY && chip_ready(map, chip, adr, NULL))
 		return 0;
 
 	/*
@@ -2212,7 +2179,7 @@ static int cfi_amdstd_panic_wait(struct map_info *map, struct flchip *chip,
 
 		/* wait for the chip to become ready */
 		for (i = 0; i < jiffies_to_usecs(timeo); i++) {
-			if (chip_ready(map, chip, adr))
+			if (chip_ready(map, chip, adr, NULL))
 				return 0;
 
 			udelay(1);
@@ -2276,13 +2243,13 @@ static int do_panic_write_oneword(struct map_info *map, struct flchip *chip,
 	map_write(map, datum, adr);
 
 	for (i = 0; i < jiffies_to_usecs(uWriteTimeout); i++) {
-		if (chip_ready(map, chip, adr))
+		if (chip_ready(map, chip, adr, NULL))
 			break;
 
 		udelay(1);
 	}
 
-	if (!chip_good(map, chip, adr, datum) ||
+	if (!chip_ready(map, chip, adr, &datum) ||
 	    cfi_check_err_status(map, chip, adr)) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
@@ -2424,6 +2391,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 	DECLARE_WAITQUEUE(wait, current);
 	int ret;
 	int retry_cnt = 0;
+	map_word datum = map_word_ff(map);
 
 	adr = cfi->addr_unlock1;
 
@@ -2478,7 +2446,7 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_good(map, chip, adr, map_word_ff(map))) {
+		if (chip_ready(map, chip, adr, &datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
@@ -2523,6 +2491,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	DECLARE_WAITQUEUE(wait, current);
 	int ret;
 	int retry_cnt = 0;
+	map_word datum = map_word_ff(map);
 
 	adr += chip->start;
 
@@ -2577,7 +2546,7 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_good(map, chip, adr, map_word_ff(map))) {
+		if (chip_ready(map, chip, adr, &datum)) {
 			if (cfi_check_err_status(map, chip, adr))
 				ret = -EIO;
 			break;
@@ -2771,7 +2740,7 @@ static int __maybe_unused do_ppb_xxlock(struct map_info *map,
 	 */
 	timeo = jiffies + msecs_to_jiffies(2000);	/* 2s max (un)locking */
 	for (;;) {
-		if (chip_ready(map, chip, adr))
+		if (chip_ready(map, chip, adr, NULL))
 			break;
 
 		if (time_after(jiffies, timeo)) {
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
