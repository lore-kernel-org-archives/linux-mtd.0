Return-Path: <SRS0=/21v=2X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAC5C2D0DC
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 17:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307C920866
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 17:10:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ML0WvemA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhOh/oE8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307C920866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A4NlZgzNqDxGH+o3aArRZ7EwvgTGkljehXsEm5wGAPs=; b=ML0WvemAO78s8t
	OmqbBr12lIptO5agr+Ls/Jf5DAjZWFPilMcUdDN1hLxWw55ftLwLUfioS6Bn7957jFCITY68J+1aY
	S1nPeVnuP+nEDgqpY6zw9O+ptnh1rm2XSku6krufMgNS/b2XGaW8Rnw4I/x0HMEJMHUc6okyk8raK
	YEhErSCHmy2d0VPwLHxyz8a7YTQAlmsmjg3Fa1ExsmpSnm3bVfg5DdDpkopTZcsNfB87sTFiTO0jd
	cGvo8yCU8gOZnEDInggZfjsPzY1SA6e/wdtbdXCU1ZsV1ezMN/9ncjZv5VaI0kr2t/NAlMRvQp019
	kjesxNfwiSe6D16x+wVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in3zL-0002MC-HC; Thu, 02 Jan 2020 17:10:23 +0000
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in3zF-0002Hr-Np
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2020 17:10:21 +0000
Received: by mail-yw1-xc44.google.com with SMTP id v126so17447314ywc.10
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jan 2020 09:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=ICz0O08t3a/RBlQWCudjBOmlSFab7Caoxuic86MaXF4=;
 b=RhOh/oE8j3iq3lY4LyVvlnQs7jG3jFueKDDZlLUK33eQu/R0nr639qp3UgEvKk6iSx
 j9Pls8wvdcyXJebToFEogu2fq8G2mG4EKEXfts8GX0PNk6X4sj3Mgm1Lpiw21GyuwxHA
 kbDoFF1ZLgLHQpUz2DNSK51PZY0w4DfJh8K9MG2aOeUGEoOKRP3jiHKsAEbLn+2zgLwm
 reyFZc34fBBBkx7VMM8K2rGaH+NpxUG05HYaQ+EtIjDRBwWDpr81ZDS0V4kTDPiBm/Fk
 +K8wLHRuc8D8oCrEX9S+wViTP7cOofwPZz//Hgi3QO4B1CWA3XcLEXiRtqoz0fgFQARV
 McOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=ICz0O08t3a/RBlQWCudjBOmlSFab7Caoxuic86MaXF4=;
 b=aRDsioKtg+jEe0Vy5iFF5FxjYwkjhCLtgHVKOgdHi9lNuDk5ixUtaut9XZun+tPTIL
 lpXPpOBpIOFmeLsUypyrqPM1Lb1xnNlWlVQ+eSzSnb44GC12K/l2J1XAl7PUYSjvtv87
 aRfRkC6hhbMgYPE388qH0RQpZZT3Dx+CcmyU67ZnA+4Pmm0t8HtDC5Q8h0RBSjmiDek5
 aJP5QhL/noMw/l09Pild2atJectlSs8oAgdw9bhXYuij/JR+PAHM4edsKy6lbmmbfb0l
 AOvdg7F7VW0TSYAZiR3dCh8HIvlYjnu5qKd1rVCSxiU69i6g7X5FBHJa23xW/ifRofoz
 aD7g==
X-Gm-Message-State: APjAAAXR3RTSncTlLIiZKFe1HyQAGJ7vl6HF9/KE220cWcep9Llcd5BK
 O4pVn3DbbWPmTfruQ2ZY9aw=
X-Google-Smtp-Source: APXvYqyFP3Xyv6/igro5FdVIhb7NJIoBlArsJUFZZBHxW1/oFaTxbOQeAV+4eMn42OIJmufakICLgQ==
X-Received: by 2002:a81:72c3:: with SMTP id
 n186mr62008253ywc.342.1577985015967; 
 Thu, 02 Jan 2020 09:10:15 -0800 (PST)
Received: from user-ThinkPad-X230 ([2601:cd:4005:d680:940e:5f6e:348a:1ff0])
 by smtp.gmail.com with ESMTPSA id d137sm20471827ywd.86.2020.01.02.09.10.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jan 2020 09:10:15 -0800 (PST)
Date: Thu, 2 Jan 2020 12:10:08 -0500
From: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
To: kyungmin.park@samsung.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: checkpatch.pl cleanup - fix errors and checks
Message-ID: <20200102171008.GA15268@user-ThinkPad-X230>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_091017_818401_FD1E891E 
X-CRM114-Status: GOOD (  12.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Correct mispelling, spacing, and coding style flaws caught by
checkpatch.pl script.

Signed-off-by: Amir Mahdi Ghorbanian <indigoomega021@gmail.com>
---
 drivers/mtd/nand/onenand/omap2.c        | 11 ++++++-----
 drivers/mtd/nand/onenand/onenand_base.c | 14 +++++++-------
 include/linux/mtd/flashchip.h           |  2 +-
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/onenand/omap2.c b/drivers/mtd/nand/onenand/omap2.c
index edf94ee54ec7..8cb2294bc837 100644
--- a/drivers/mtd/nand/onenand/omap2.c
+++ b/drivers/mtd/nand/onenand/omap2.c
@@ -148,13 +148,13 @@ static int omap2_onenand_wait(struct mtd_info *mtd, int state)
 	unsigned long timeout;
 	u32 syscfg;
 
-	if (state == FL_RESETING || state == FL_PREPARING_ERASE ||
+	if (state == FL_RESETTING || state == FL_PREPARING_ERASE ||
 	    state == FL_VERIFYING_ERASE) {
 		int i = 21;
 		unsigned int intr_flags = ONENAND_INT_MASTER;
 
 		switch (state) {
-		case FL_RESETING:
+		case FL_RESETTING:
 			intr_flags |= ONENAND_INT_RESET;
 			break;
 		case FL_PREPARING_ERASE:
@@ -375,7 +375,7 @@ static int omap2_onenand_read_bufferram(struct mtd_info *mtd, int area,
 	 * context fallback to PIO mode.
 	 */
 	if (!virt_addr_valid(buf) || bram_offset & 3 || (size_t)buf & 3 ||
-	    count < 384 || in_interrupt() || oops_in_progress )
+	    count < 384 || in_interrupt() || oops_in_progress)
 		goto out_copy;
 
 	xtra = count & 3;
@@ -422,7 +422,7 @@ static int omap2_onenand_write_bufferram(struct mtd_info *mtd, int area,
 	 * context fallback to PIO mode.
 	 */
 	if (!virt_addr_valid(buf) || bram_offset & 3 || (size_t)buf & 3 ||
-	    count < 384 || in_interrupt() || oops_in_progress )
+	    count < 384 || in_interrupt() || oops_in_progress)
 		goto out_copy;
 
 	dma_src = dma_map_single(dev, buf, count, DMA_TO_DEVICE);
@@ -528,7 +528,8 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 		 c->gpmc_cs, c->phys_base, c->onenand.base,
 		 c->dma_chan ? "DMA" : "PIO");
 
-	if ((r = onenand_scan(&c->mtd, 1)) < 0)
+	r = onenand_scan(&c->mtd, 1);
+	if (r < 0)
 		goto err_release_dma;
 
 	freq = omap2_onenand_get_freq(c->onenand.version_id);
diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index 77bd32a683e1..85640ee11c86 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -2853,7 +2853,7 @@ static int onenand_otp_write_oob_nolock(struct mtd_info *mtd, loff_t to,
 
 		/* Exit OTP access mode */
 		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-		this->wait(mtd, FL_RESETING);
+		this->wait(mtd, FL_RESETTING);
 
 		status = this->read_word(this->base + ONENAND_REG_CTRL_STATUS);
 		status &= 0x60;
@@ -2924,7 +2924,7 @@ static int do_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-	this->wait(mtd, FL_RESETING);
+	this->wait(mtd, FL_RESETTING);
 
 	return ret;
 }
@@ -2968,7 +2968,7 @@ static int do_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	/* Exit OTP access mode */
 	this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-	this->wait(mtd, FL_RESETING);
+	this->wait(mtd, FL_RESETTING);
 
 	return ret;
 }
@@ -3008,7 +3008,7 @@ static int do_otp_lock(struct mtd_info *mtd, loff_t from, size_t len,
 
 		/* Exit OTP access mode */
 		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-		this->wait(mtd, FL_RESETING);
+		this->wait(mtd, FL_RESETTING);
 	} else {
 		ops.mode = MTD_OPS_PLACE_OOB;
 		ops.ooblen = len;
@@ -3413,7 +3413,7 @@ static int flexonenand_get_boundary(struct mtd_info *mtd)
 		this->boundary[die] = bdry & FLEXONENAND_PI_MASK;
 
 		this->command(mtd, ONENAND_CMD_RESET, 0, 0);
-		this->wait(mtd, FL_RESETING);
+		this->wait(mtd, FL_RESETTING);
 
 		printk(KERN_INFO "Die %d boundary: %d%s\n", die,
 		       this->boundary[die], locked ? "(Locked)" : "(Unlocked)");
@@ -3635,7 +3635,7 @@ static int flexonenand_set_boundary(struct mtd_info *mtd, int die,
 	ret = this->wait(mtd, FL_WRITING);
 out:
 	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_REG_COMMAND);
-	this->wait(mtd, FL_RESETING);
+	this->wait(mtd, FL_RESETTING);
 	if (!ret)
 		/* Recalculate device size on boundary change*/
 		flexonenand_get_size(mtd);
@@ -3671,7 +3671,7 @@ static int onenand_chip_probe(struct mtd_info *mtd)
 	/* Reset OneNAND to read default register values */
 	this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_BOOTRAM);
 	/* Wait reset */
-	this->wait(mtd, FL_RESETING);
+	this->wait(mtd, FL_RESETTING);
 
 	/* Restore system configuration 1 */
 	this->write_word(syscfg, this->base + ONENAND_REG_SYS_CFG1);
diff --git a/include/linux/mtd/flashchip.h b/include/linux/mtd/flashchip.h
index ecc88a41792a..c04f690871ca 100644
--- a/include/linux/mtd/flashchip.h
+++ b/include/linux/mtd/flashchip.h
@@ -40,7 +40,7 @@ typedef enum {
 	FL_READING,
 	FL_CACHEDPRG,
 	/* These 4 come from onenand_state_t, which has been unified here */
-	FL_RESETING,
+	FL_RESETTING,
 	FL_OTPING,
 	FL_PREPARING_ERASE,
 	FL_VERIFYING_ERASE,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
