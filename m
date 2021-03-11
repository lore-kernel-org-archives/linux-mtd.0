Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC1CC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:19:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D2064FE9
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 17:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D2064FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sBWOS4aPY+An9lc+C1iD9tfP6jWjaxBGH4HDuhfwcXY=; b=B03OC+gIhyjduv45s+RwNbwTpn
	W2ENWAt9tPIcWxGDo+JTXVcFpty2eGYjtIY3LJ8nzHBxiLgk1u58Cm06C8Cqo5TPdmDr2JZz3238T
	5zWZPNDWq5CKaPmupB0cCZp98oJ1cD26P3bRDTZLoUcNdkaSk9J9PMdKrd3PQWPv2fRDglrIGEZ3n
	XA6T96lvpDhEcYwYsD9b2Gee9qZAIM/DZqd6AkGjXZDb+Md3zEhME6yAorzj0KSAXejgRZnmGxY9W
	Ky5uKIflk+kXcVdMMRp7P1J9VPMYrwlwE6S0l6TZ2eRjdhgQSP328q8FcQkzQRLhru9FUx4ubpmW/
	J/qAaTzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKOxl-009hV8-KD; Thu, 11 Mar 2021 17:19:05 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKOtn-009gUh-D9
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 17:15:03 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so3514043pjb.1
 for <linux-mtd@lists.infradead.org>; Thu, 11 Mar 2021 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KSvf4FPCndcLiw/HtonVpqVmpqTSr98Q/VggjfUZvRE=;
 b=bV/l1p/RGI5kUBrPJHMUCcdvfryqpgqsMIMQFzJ0LNuHBWi1CjedW9r31AcXulQ7X3
 Jc5lXpTkShe9jpFEF++9vOz3qhp/bNR12mlMjjdk5s4ivWv8mof5na5dOu0F3P4ska0/
 uGLSrZjkKOgEiweXiv2W7Cpal63OCxaXqSST9Ym3ZisuaLbLY8qmyA0WgUhWV4SVEHEy
 wXzGQTkNgYXIsBL0Ku+jXWYZ/DBU2HVpodgu9N/dQ5eduQtix+mSpVsXbe0Hze/5EV9j
 7LEbG7HMyjaqoOtyWbHLt3cb1b9rjsOv+vODhEZ9QUBieFMwHbQk7fAFVh9EoC3b8qzG
 ySag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KSvf4FPCndcLiw/HtonVpqVmpqTSr98Q/VggjfUZvRE=;
 b=WaEZUSfsW4KPmKKLY0ReJTloNRrBuGdacLIX4f6fYaR1nkS+QATninNIVdQ+ijY25v
 F1WYtFAEdDechQHMQcEtk2EKWB630cyWNXDu0oYiKxOfH8ZZMB6ybNeuJI0n+mbPu/d1
 9JKmtFRbidvLIPAeT9ibPXSTCNTEm4lX0CQJHzJ16OfbnuwOPYsFjuzdJob3UMEnyC8c
 ZYe4Kh7LIBxnhNZ0nc6nXI/NJQ+93hZAS7p3Jc+jK6naSEg7xJ0EWu1lWiBL1vc4yzqq
 wORNwt4R+QSUjw/6KJ75BNaiTvaGIewQud9J0hEGqDNTQMnAn6eDDpSHdrQNR/qSpPfp
 Gwpw==
X-Gm-Message-State: AOAM531DoK2BpVjQvV3vhtVvOSS9i/yHbxvXhswkRZo7D6pN4o7v4hdZ
 59zwuTs+rUjd+6hhm6o1Ckc=
X-Google-Smtp-Source: ABdhPJw7cT40dsHwz6xBc0r7W/HnA7/118Txd3xI7ovUWPUtNpftYq+SAWVS0J/1LVzcjDrRg8BBpw==
X-Received: by 2002:a17:90b:33c7:: with SMTP id
 lk7mr9943931pjb.95.1615482896577; 
 Thu, 11 Mar 2021 09:14:56 -0800 (PST)
Received: from mail.broadcom.net ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id e190sm3007121pfe.3.2021.03.11.09.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:14:56 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: f.fainelli@gmail.com, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: rawnand: brcmnand: read/write oob during EDU transfer
Date: Thu, 11 Mar 2021 12:09:08 -0500
Message-Id: <20210311170909.9031-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_171501_211859_B360C585 
X-CRM114-Status: GOOD (  15.67  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Added support to read/write oob during EDU transfers.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 59 +++++++++++++++++++++---
 1 file changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 659eaa6f0980..1c95b21aa63b 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -242,6 +242,9 @@ struct brcmnand_controller {
 	u32                     edu_ext_addr;
 	u32                     edu_cmd;
 	u32                     edu_config;
+	int			sas; /* spare area size, per flash cache */
+	int			sector_size_1k;
+	u8			*oob;
 
 	/* flash_dma reg */
 	const u16		*flash_dma_offsets;
@@ -249,7 +252,7 @@ struct brcmnand_controller {
 	dma_addr_t		dma_pa;
 
 	int (*dma_trans)(struct brcmnand_host *host, u64 addr, u32 *buf,
-			 u32 len, u8 dma_cmd);
+			 u8 *oob, u32 len, u8 dma_cmd);
 
 	/* in-memory cache of the FLASH_CACHE, used only for some commands */
 	u8			flash_cache[FC_BYTES];
@@ -1479,6 +1482,23 @@ static irqreturn_t brcmnand_edu_irq(int irq, void *data)
 		edu_writel(ctrl, EDU_EXT_ADDR, ctrl->edu_ext_addr);
 		edu_readl(ctrl, EDU_EXT_ADDR);
 
+		if (ctrl->oob) {
+			if (ctrl->edu_cmd == EDU_CMD_READ) {
+				ctrl->oob += read_oob_from_regs(ctrl,
+							ctrl->edu_count + 1,
+							ctrl->oob, ctrl->sas,
+							ctrl->sector_size_1k);
+			} else {
+				brcmnand_write_reg(ctrl, BRCMNAND_CMD_ADDRESS,
+						   ctrl->edu_ext_addr);
+				brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
+				ctrl->oob += write_oob_to_regs(ctrl,
+							       ctrl->edu_count,
+							       ctrl->oob, ctrl->sas,
+							       ctrl->sector_size_1k);
+			}
+		}
+
 		mb(); /* flush previous writes */
 		edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
 		edu_readl(ctrl, EDU_CMD);
@@ -1850,9 +1870,10 @@ static void brcmnand_write_buf(struct nand_chip *chip, const uint8_t *buf,
  *  Kick EDU engine
  */
 static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
-			      u32 len, u8 cmd)
+			      u8 *oob, u32 len, u8 cmd)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
+	struct brcmnand_cfg *cfg = &host->hwcfg;
 	unsigned long timeo = msecs_to_jiffies(200);
 	int ret = 0;
 	int dir = (cmd == CMD_PAGE_READ ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
@@ -1860,6 +1881,9 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 	unsigned int trans = len >> FC_SHIFT;
 	dma_addr_t pa;
 
+	dev_dbg(ctrl->dev, "EDU %s %p:%p\n", ((edu_cmd == EDU_CMD_READ) ?
+					      "read" : "write"), buf, oob);
+
 	pa = dma_map_single(ctrl->dev, buf, len, dir);
 	if (dma_mapping_error(ctrl->dev, pa)) {
 		dev_err(ctrl->dev, "unable to map buffer for EDU DMA\n");
@@ -1871,6 +1895,8 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 	ctrl->edu_ext_addr = addr;
 	ctrl->edu_cmd = edu_cmd;
 	ctrl->edu_count = trans;
+	ctrl->sas = cfg->spare_area_size;
+	ctrl->oob = oob;
 
 	edu_writel(ctrl, EDU_DRAM_ADDR, (u32)ctrl->edu_dram_addr);
 	edu_readl(ctrl,  EDU_DRAM_ADDR);
@@ -1879,6 +1905,16 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 	edu_writel(ctrl, EDU_LENGTH, FC_BYTES);
 	edu_readl(ctrl, EDU_LENGTH);
 
+	if (ctrl->oob && (ctrl->edu_cmd == EDU_CMD_WRITE)) {
+		brcmnand_write_reg(ctrl, BRCMNAND_CMD_ADDRESS,
+				   ctrl->edu_ext_addr);
+		brcmnand_read_reg(ctrl, BRCMNAND_CMD_ADDRESS);
+		ctrl->oob += write_oob_to_regs(ctrl,
+					       1,
+					       ctrl->oob, ctrl->sas,
+					       ctrl->sector_size_1k);
+	}
+
 	/* Start edu engine */
 	mb(); /* flush previous writes */
 	edu_writel(ctrl, EDU_CMD, ctrl->edu_cmd);
@@ -1893,6 +1929,14 @@ static int brcmnand_edu_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 
 	dma_unmap_single(ctrl->dev, pa, len, dir);
 
+	/* read last subpage oob */
+	if (ctrl->oob && (ctrl->edu_cmd == EDU_CMD_READ)) {
+		ctrl->oob += read_oob_from_regs(ctrl,
+						1,
+						ctrl->oob, ctrl->sas,
+						ctrl->sector_size_1k);
+	}
+
 	/* for program page check NAND status */
 	if (((brcmnand_read_reg(ctrl, BRCMNAND_INTFC_STATUS) &
 	      INTFC_FLASH_STATUS) & NAND_STATUS_FAIL) &&
@@ -2002,7 +2046,7 @@ static void brcmnand_dma_run(struct brcmnand_host *host, dma_addr_t desc)
 }
 
 static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
-			      u32 len, u8 dma_cmd)
+			      u8 *oob, u32 len, u8 dma_cmd)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
 	dma_addr_t buf_pa;
@@ -2147,8 +2191,9 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 try_dmaread:
 	brcmnand_clear_ecc_addr(ctrl);
 
-	if (ctrl->dma_trans && !oob && flash_dma_buf_ok(buf)) {
-		err = ctrl->dma_trans(host, addr, buf,
+	if (ctrl->dma_trans && (has_edu(ctrl) || !oob) &&
+	    flash_dma_buf_ok(buf)) {
+		err = ctrl->dma_trans(host, addr, buf, oob,
 				      trans * FC_BYTES,
 				      CMD_PAGE_READ);
 
@@ -2296,8 +2341,8 @@ static int brcmnand_write(struct mtd_info *mtd, struct nand_chip *chip,
 	for (i = 0; i < ctrl->max_oob; i += 4)
 		oob_reg_write(ctrl, i, 0xffffffff);
 
-	if (use_dma(ctrl) && !oob && flash_dma_buf_ok(buf)) {
-		if (ctrl->dma_trans(host, addr, (u32 *)buf, mtd->writesize,
+	if (use_dma(ctrl) && (has_edu(ctrl) || !oob) && flash_dma_buf_ok(buf)) {
+		if (ctrl->dma_trans(host, addr, (u32 *)buf, oob, mtd->writesize,
 				    CMD_PROGRAM_PAGE))
 
 			ret = -EIO;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
