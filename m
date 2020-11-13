Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AD6C388F7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 14:15:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 169FF22226
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 14:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2Aox1S7/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wa8ps131";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sYcb1QVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 169FF22226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+3thRMpANhT18ZW62AltPAU8031QYC6Z+XuNtEO6tU=; b=2Aox1S7/PC7zgBgzFq2R38FHIt
	ejvapa/au5of7r9wDk1x6toafPLhsUZAfA1U63L55kTQhOtdDkW+x3uBjiMbffrcordUB/wlUh1o4
	KdZliPumLnSzPFnkUWoyc51aRdoJhflTqPuPiDpgTHlXSePdkJLY4kprOHKg81Dovod9fQXgO76eD
	l19ygXV+9KZhVGRr/kVMc1x6MS0jxc1o59wpfcUsWFR88SfTzok02QkoKFdwWItRpfhdMHH0B5lne
	0vLCsNDcu0wlLsu0/Ps9r8T7NoSIL9ywS/ikPsrWi1rV8060Tf+Xgzo6OTsnSWE5zrLuDi7hQSKOS
	p6xscUxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdZqW-0004Xi-DU; Fri, 13 Nov 2020 14:14:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdZqT-0004WD-Tu
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 14:14:34 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1605276870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=H/ED3woGKafKJQ2xgc+/vv2OH2Gum4sWEk7Qc03Srhs=;
 b=wa8ps131KEmS6ys0QDY3ydOdoOdkLcFBpAXS/lu1mUJzElmcvfhYFQPM+Bm9cmXhnSRs/L
 HTLVPDYb8j9H+JmsOGHDFI/mgwlhOvCcN9AE0BCAhqmy9PVZ71HcsCrvb08KDlqk0RDAmu
 9AC0QMQopG4ll1KyrlOl6wiUz6tt4PVVhxjhy3nw4gZtMxogrhDbsQYupECU5mgqapCAOV
 XWhgzB+NcX3/wZbVj+C7f4Oa3zSmGFMA9RCgeJ4AOpiISnSH6XoN7WI5AYJwDePkiMD4BB
 JcDDmj/LNkqHnZKJR0W2Polhdy81NSE7Pf3MGSwEF/ZzRIhVPhPxBt6IvDgNMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1605276870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=H/ED3woGKafKJQ2xgc+/vv2OH2Gum4sWEk7Qc03Srhs=;
 b=sYcb1QVh5nuII806sFBV448ak3gL2XLbPP+JiyclMsiLkciHSsiPgLVQ/giK/l2/6W/H2W
 Bn9FpxKPbg+qAXAA==
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/nand: Use mtd->oops_panic_write as condition
Date: Fri, 13 Nov 2020 15:14:22 +0100
Message-Id: <20201113141422.2214771-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_091434_191102_5BC997B6 
X-CRM114-Status: GOOD (  16.59  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Thomas Gleixner <tglx@linutronix.de>

struct mtd_info has a flag oops_panic_write which is set when the write
operation is issued via the panic_write() callback. That allows controller
drivers to distinguish the panic write from a regular write.

Replace the open coded 'in_interrupt() | oops_in_progress' checks with a
check for that flag. in_interrupt() is an unrealiable indicator anyway as
it covers all sorts of atomic contexts not only hard and soft interrupt
service routines.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/onenand/onenand_omap2.c | 16 ++++++++--------
 drivers/mtd/nand/raw/nand_legacy.c       |  9 +++++----
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index d8c0bd002c2b4..12825eb97938b 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -371,12 +371,12 @@ static int omap2_onenand_read_bufferram(struct mtd_info *mtd, int area,
 
 	bram_offset = omap2_onenand_bufferram_offset(mtd, area) + area + offset;
 	/*
-	 * If the buffer address is not DMA-able, len is not long enough to make
-	 * DMA transfers profitable or panic_write() may be in an interrupt
-	 * context fallback to PIO mode.
+	 * If the buffer address is not DMA-able, len is not long enough to
+	 * make DMA transfers profitable or if invoked from panic_write()
+	 * fallback to PIO mode.
 	 */
 	if (!virt_addr_valid(buf) || bram_offset & 3 || (size_t)buf & 3 ||
-	    count < 384 || in_interrupt() || oops_in_progress)
+	    count < 384 || mtd->oops_panic_write)
 		goto out_copy;
 
 	xtra = count & 3;
@@ -418,12 +418,12 @@ static int omap2_onenand_write_bufferram(struct mtd_info *mtd, int area,
 
 	bram_offset = omap2_onenand_bufferram_offset(mtd, area) + area + offset;
 	/*
-	 * If the buffer address is not DMA-able, len is not long enough to make
-	 * DMA transfers profitable or panic_write() may be in an interrupt
-	 * context fallback to PIO mode.
+	 * If the buffer address is not DMA-able, len is not long enough to
+	 * make DMA transfers profitable or if invoked from panic_write()
+	 * fallback to PIO mode.
 	 */
 	if (!virt_addr_valid(buf) || bram_offset & 3 || (size_t)buf & 3 ||
-	    count < 384 || in_interrupt() || oops_in_progress)
+	    count < 384 || mtd->oops_panic_write)
 		goto out_copy;
 
 	dma_src = dma_map_single(dev, buf, count, DMA_TO_DEVICE);
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index 2bcc03714432b..eccc18b266d5f 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -192,9 +192,10 @@ static void panic_nand_wait_ready(struct nand_chip *chip, unsigned long timeo)
  */
 void nand_wait_ready(struct nand_chip *chip)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	unsigned long timeo = 400;
 
-	if (in_interrupt() || oops_in_progress)
+	if (mtd->oops_panic_write)
 		return panic_nand_wait_ready(chip, timeo);
 
 	/* Wait until command is processed or timeout occurs */
@@ -531,7 +532,7 @@ EXPORT_SYMBOL(nand_get_set_features_notsupp);
  */
 static int nand_wait(struct nand_chip *chip)
 {
-
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	unsigned long timeo = 400;
 	u8 status;
 	int ret;
@@ -546,9 +547,9 @@ static int nand_wait(struct nand_chip *chip)
 	if (ret)
 		return ret;
 
-	if (in_interrupt() || oops_in_progress)
+	if (mtd->oops_panic_write) {
 		panic_nand_wait(chip, timeo);
-	else {
+	} else {
 		timeo = jiffies + msecs_to_jiffies(timeo);
 		do {
 			if (chip->legacy.dev_ready) {
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
