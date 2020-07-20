Return-Path: <SRS0=lrxf=A7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5B8C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D2A207DD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2020 04:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mgyM1pgV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bZaFC1c4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D2A207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1t1wqen0rgsH6dFhOlJuJ9MpVqb8UNC4rbGvu8InJQE=; b=mgyM1pgVBVLg6WWMrZxk2eIAI
	+k0brNeteYpgtH2KWB6CVJZa4IuXYSC/G3978Wl7CM5OMfgIXZn8zMFzkSUQzRNC4w/I3+Dtw+F8/
	qjv8duh/G5C8T4Sh0RvW4dd22ndtqmq6Ztb6R4oGIEM6oty1NyEFfRLiM/BfNUejFtFe2wosvldRt
	xc5bdHh6WbYm1h1wkpqkjSYVlWJJUY5glnWcGOUrMu4Lui6ivCGl+xRk4ySLKktJbcAFHM+aEmEYO
	96P8+KI9/DcE1h8CsGe13oGfs6+9k+u3fc++FcuPx33JCykfNKwNop4VQqxEgYsbkV8omOlDaouSH
	AqNsJiEoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxNPe-0006Ou-EM; Mon, 20 Jul 2020 04:28:26 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxNPZ-0006NK-Pc
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2020 04:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595219301; x=1626755301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=touMEG0HvILUTF/hDdT+OGo/5hUr31vijL29hN/rU9Y=;
 b=bZaFC1c4E7EillNr+3/l+XSUr5eBtiTK/+YcTF9580NMZBmRgb12NUOF
 uqhZbGXpUbZqXolEpEUff7pVFObx/1JWNq7P0Cmde+kXclpBuCNJerbsf
 exMfxMDNo1dqif6f3LXfaHFI2yNM6joNDJ1G/ly/ak3xaufc62iRAsabr
 q3tZN3MJl74ydn7iaLR03CTnMjHvMLXdBrlxjuhQ460j/JW4pOwvZ1G6x
 LNl2bo+lalV580avQyc3YvAE+40cSvwkqkMQsXjHWv6mJ00u9LhWD3wpe
 KLwSg3mSof0Lu2SYlFWPdo8dWbNz2G2VyZov4lidmfM/3RD+rcAG4tj6X g==;
IronPort-SDR: iAYXtoniR25G0T71Qlnvu3TFZRVj2db6rl/Jr6IeHQ5O6okhStv2rmkS/H69cOW3pBNv1zV+jP
 FaWo7gaUjmU7pKYlntC8LsiGB0WfAX9bxusb/pB+ZlALTyMipu0GnX/WVQ5iex8uOY1kfNUOHf
 2U0na8XaUCMWW6OjeHLHR9kwCF9HEpb1qqWMZY8HhQz/I5TMkJvMFJbnJoNdLKFGSVJDtB4ZhG
 Awaz0qSZL+OQCzok7+wYuhRDqmsiS/vI6axephqXZMgdDdN0ZWQpJ4QCtEP0xPXIZgDOiSMAg1
 hMA=
X-IronPort-AV: E=Sophos;i="5.75,373,1589266800"; d="scan'208";a="88262750"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Jul 2020 21:28:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 19 Jul 2020 21:27:39 -0700
Received: from atudor-ThinkPad-T470p.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Sun, 19 Jul 2020 21:27:40 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>
Subject: [PATCH v4 6/6] mtd: rawnand: atmel: Get rid of the legacy interface
 implementation
Date: Mon, 20 Jul 2020 07:27:59 +0300
Message-ID: <20200720042759.1482341-7-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
References: <20200720042759.1482341-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_002822_026195_5D0C355F 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>

Now that exec_op() is implemented, we can get rid of all the legacy
hooks.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 198 +------------------
 1 file changed, 1 insertion(+), 197 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index ffeda6a1d1b3..e660d442fcca 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -417,133 +417,6 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
 	return -EIO;
 }
 
-static u8 atmel_nand_read_byte(struct nand_chip *chip)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-
-	return ioread8(nand->activecs->io.virt);
-}
-
-static void atmel_nand_write_byte(struct nand_chip *chip, u8 byte)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-
-	if (chip->options & NAND_BUSWIDTH_16)
-		iowrite16(byte | (byte << 8), nand->activecs->io.virt);
-	else
-		iowrite8(byte, nand->activecs->io.virt);
-}
-
-static void atmel_nand_read_buf(struct nand_chip *chip, u8 *buf, int len)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-	struct atmel_nand_controller *nc;
-
-	nc = to_nand_controller(chip->controller);
-
-	/*
-	 * If the controller supports DMA, the buffer address is DMA-able and
-	 * len is long enough to make DMA transfers profitable, let's trigger
-	 * a DMA transfer. If it fails, fallback to PIO mode.
-	 */
-	if (nc->dmac && virt_addr_valid(buf) &&
-	    len >= MIN_DMA_LEN &&
-	    !atmel_nand_dma_transfer(nc, buf, nand->activecs->io.dma, len,
-				     DMA_FROM_DEVICE))
-		return;
-
-	if (chip->options & NAND_BUSWIDTH_16)
-		ioread16_rep(nand->activecs->io.virt, buf, len / 2);
-	else
-		ioread8_rep(nand->activecs->io.virt, buf, len);
-}
-
-static void atmel_nand_write_buf(struct nand_chip *chip, const u8 *buf, int len)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-	struct atmel_nand_controller *nc;
-
-	nc = to_nand_controller(chip->controller);
-
-	/*
-	 * If the controller supports DMA, the buffer address is DMA-able and
-	 * len is long enough to make DMA transfers profitable, let's trigger
-	 * a DMA transfer. If it fails, fallback to PIO mode.
-	 */
-	if (nc->dmac && virt_addr_valid(buf) &&
-	    len >= MIN_DMA_LEN &&
-	    !atmel_nand_dma_transfer(nc, (void *)buf, nand->activecs->io.dma,
-				     len, DMA_TO_DEVICE))
-		return;
-
-	if (chip->options & NAND_BUSWIDTH_16)
-		iowrite16_rep(nand->activecs->io.virt, buf, len / 2);
-	else
-		iowrite8_rep(nand->activecs->io.virt, buf, len);
-}
-
-static int atmel_nand_dev_ready(struct nand_chip *chip)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-
-	return gpiod_get_value(nand->activecs->rb.gpio);
-}
-
-static void atmel_nand_select_chip(struct nand_chip *chip, int cs)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-
-	if (cs < 0 || cs >= nand->numcs) {
-		nand->activecs = NULL;
-		chip->legacy.dev_ready = NULL;
-		return;
-	}
-
-	nand->activecs = &nand->cs[cs];
-
-	if (nand->activecs->rb.type == ATMEL_NAND_GPIO_RB)
-		chip->legacy.dev_ready = atmel_nand_dev_ready;
-}
-
-static int atmel_hsmc_nand_dev_ready(struct nand_chip *chip)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-	struct atmel_hsmc_nand_controller *nc;
-	u32 status;
-
-	nc = to_hsmc_nand_controller(chip->controller);
-
-	regmap_read(nc->base.smc, ATMEL_HSMC_NFC_SR, &status);
-
-	return status & ATMEL_HSMC_NFC_SR_RBEDGE(nand->activecs->rb.id);
-}
-
-static void atmel_hsmc_nand_select_chip(struct nand_chip *chip, int cs)
-{
-	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct atmel_nand *nand = to_atmel_nand(chip);
-	struct atmel_hsmc_nand_controller *nc;
-
-	nc = to_hsmc_nand_controller(chip->controller);
-
-	atmel_nand_select_chip(chip, cs);
-
-	if (!nand->activecs)
-		return;
-
-	if (nand->activecs->rb.type == ATMEL_NAND_NATIVE_RB)
-		chip->legacy.dev_ready = atmel_hsmc_nand_dev_ready;
-
-	regmap_update_bits(nc->base.smc, ATMEL_HSMC_NFC_CFG,
-			   ATMEL_HSMC_NFC_CFG_PAGESIZE_MASK |
-			   ATMEL_HSMC_NFC_CFG_SPARESIZE_MASK |
-			   ATMEL_HSMC_NFC_CFG_RSPARE |
-			   ATMEL_HSMC_NFC_CFG_WSPARE,
-			   ATMEL_HSMC_NFC_CFG_PAGESIZE(mtd->writesize) |
-			   ATMEL_HSMC_NFC_CFG_SPARESIZE(mtd->oobsize) |
-			   ATMEL_HSMC_NFC_CFG_RSPARE);
-}
-
 static int atmel_nfc_exec_op(struct atmel_hsmc_nand_controller *nc, bool poll)
 {
 	u8 *addrs = nc->op.addrs;
@@ -594,53 +467,6 @@ static int atmel_nfc_exec_op(struct atmel_hsmc_nand_controller *nc, bool poll)
 	return ret;
 }
 
-static void atmel_hsmc_nand_cmd_ctrl(struct nand_chip *chip, int dat,
-				     unsigned int ctrl)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-	struct atmel_hsmc_nand_controller *nc;
-
-	nc = to_hsmc_nand_controller(chip->controller);
-
-	if (ctrl & NAND_ALE) {
-		if (nc->op.naddrs == ATMEL_NFC_MAX_ADDR_CYCLES)
-			return;
-
-		nc->op.addrs[nc->op.naddrs++] = dat;
-	} else if (ctrl & NAND_CLE) {
-		if (nc->op.ncmds > 1)
-			return;
-
-		nc->op.cmds[nc->op.ncmds++] = dat;
-	}
-
-	if (dat == NAND_CMD_NONE) {
-		nc->op.cs = nand->activecs->id;
-		atmel_nfc_exec_op(nc, true);
-	}
-}
-
-static void atmel_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
-				unsigned int ctrl)
-{
-	struct atmel_nand *nand = to_atmel_nand(chip);
-	struct atmel_nand_controller *nc;
-
-	nc = to_nand_controller(chip->controller);
-
-	if ((ctrl & NAND_CTRL_CHANGE) && nand->activecs->csgpio) {
-		if (ctrl & NAND_NCE)
-			gpiod_set_value(nand->activecs->csgpio, 0);
-		else
-			gpiod_set_value(nand->activecs->csgpio, 1);
-	}
-
-	if (ctrl & NAND_ALE)
-		writeb(cmd, nand->activecs->io.virt + nc->caps->ale_offs);
-	else if (ctrl & NAND_CLE)
-		writeb(cmd, nand->activecs->io.virt + nc->caps->cle_offs);
-}
-
 static void atmel_nand_data_in(struct atmel_nand *nand, void *buf,
 			       unsigned int len, bool force_8bit)
 {
@@ -1721,19 +1547,9 @@ static void atmel_nand_init(struct atmel_nand_controller *nc,
 	mtd->dev.parent = nc->dev;
 	nand->base.controller = &nc->base;
 
-	chip->legacy.cmd_ctrl = atmel_nand_cmd_ctrl;
-	chip->legacy.read_byte = atmel_nand_read_byte;
-	chip->legacy.write_byte = atmel_nand_write_byte;
-	chip->legacy.read_buf = atmel_nand_read_buf;
-	chip->legacy.write_buf = atmel_nand_write_buf;
-	chip->legacy.select_chip = atmel_nand_select_chip;
-
 	if (!nc->mck || !nc->caps->ops->setup_interface)
 		chip->options |= NAND_KEEP_TIMINGS;
 
-	/* Some NANDs require a longer delay than the default one (20us). */
-	chip->legacy.chip_delay = 40;
-
 	/*
 	 * Use a bounce buffer when the buffer passed by the MTD user is not
 	 * suitable for DMA.
@@ -1772,18 +1588,6 @@ static void atmel_smc_nand_init(struct atmel_nand_controller *nc,
 				   smc_nc->ebi_csa->nfd0_on_d16);
 }
 
-static void atmel_hsmc_nand_init(struct atmel_nand_controller *nc,
-				 struct atmel_nand *nand)
-{
-	struct nand_chip *chip = &nand->base;
-
-	atmel_nand_init(nc, nand);
-
-	/* Overload some methods for the HSMC controller. */
-	chip->legacy.cmd_ctrl = atmel_hsmc_nand_cmd_ctrl;
-	chip->legacy.select_chip = atmel_hsmc_nand_select_chip;
-}
-
 static int atmel_nand_controller_remove_nand(struct atmel_nand *nand)
 {
 	struct nand_chip *chip = &nand->base;
@@ -2568,7 +2372,7 @@ static const struct atmel_nand_controller_ops atmel_hsmc_nc_ops = {
 	.probe = atmel_hsmc_nand_controller_probe,
 	.remove = atmel_hsmc_nand_controller_remove,
 	.ecc_init = atmel_hsmc_nand_ecc_init,
-	.nand_init = atmel_hsmc_nand_init,
+	.nand_init = atmel_nand_init,
 	.setup_interface = atmel_hsmc_nand_setup_interface,
 	.exec_op = atmel_hsmc_nand_exec_op,
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
