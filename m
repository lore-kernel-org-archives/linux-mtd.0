Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73B6C433DF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B99206A2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:52:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H57EvNrz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B99206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06B7+1JXEwnn2mB7+HDBRT3I0jbZi5DTUirExDx1cRs=; b=H57EvNrzgMB7+c
	E5Z6KvYtlDPMzkT4FuG/Y3zaTdv4VN4xoabqbi6XcSqRx8snY+d9oqDV0jhM5TD4j455OVfgD0wTG
	oT6VpJzYpVNDj543XE80YEkRHC17GyPIuYvJUugvPLgg9GU9ppf24v7s5/dmUPmhxeRBLbU9zrUr7
	llj6/iDhDLwcdpF+DEEopHXLNNujPLDp3MjsTSm5ZtdNRp+WvyXbekv8Ar/3mpEZdReknOB1SAG1s
	H/PnWDDSY+Qdhoob981FpL9+60taz9QlvFRyId/70OFkqov50l7qT6SrL/mrYY9UfJgFQ9cm+IprU
	/4EiGK/3MQRG6P6wPHfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgToQ-0006Tp-Bf; Wed, 03 Jun 2020 13:52:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTlr-0001lO-La
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 13:49:35 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4CEC42A3D7C;
 Wed,  3 Jun 2020 14:49:29 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 09/10] mtd: rawnand: fsl_upm: Get rid of the legacy interface
 implementation
Date: Wed,  3 Jun 2020 15:49:21 +0200
Message-Id: <20200603134922.1352340-10-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603134922.1352340-1-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_064931_995638_2FF7FED8 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that the driver implements exec_op(), we can get rid of the legacy
interface implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 133 ---------------------------------
 1 file changed, 133 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 03ca20930274..197850aeb261 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -19,15 +19,10 @@
 #include <linux/slab.h>
 #include <asm/fsl_lbc.h>
 
-#define FSL_UPM_WAIT_RUN_PATTERN  0x1
-#define FSL_UPM_WAIT_WRITE_BYTE   0x2
-#define FSL_UPM_WAIT_WRITE_BUFFER 0x4
-
 struct fsl_upm_nand {
 	struct nand_controller base;
 	struct device *dev;
 	struct nand_chip chip;
-	int last_ctrl;
 	struct fsl_upm upm;
 	uint8_t upm_addr_offset;
 	uint8_t upm_cmd_offset;
@@ -36,8 +31,6 @@ struct fsl_upm_nand {
 	uint32_t mchip_offsets[NAND_MAX_CHIPS];
 	uint32_t mchip_count;
 	uint32_t mchip_number;
-	int chip_delay;
-	uint32_t wait_flags;
 };
 
 static inline struct fsl_upm_nand *to_fsl_upm_nand(struct mtd_info *mtdinfo)
@@ -46,105 +39,6 @@ static inline struct fsl_upm_nand *to_fsl_upm_nand(struct mtd_info *mtdinfo)
 			    chip);
 }
 
-static int fun_chip_ready(struct nand_chip *chip)
-{
-	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
-
-	if (gpiod_get_value(fun->rnb_gpio[fun->mchip_number]))
-		return 1;
-
-	dev_vdbg(fun->dev, "busy\n");
-	return 0;
-}
-
-static void fun_wait_rnb(struct fsl_upm_nand *fun)
-{
-	if (fun->rnb_gpio[fun->mchip_number] >= 0) {
-		int cnt = 1000000;
-
-		while (--cnt && !fun_chip_ready(&fun->chip))
-			cpu_relax();
-		if (!cnt)
-			dev_err(fun->dev, "tired waiting for RNB\n");
-	} else {
-		ndelay(100);
-	}
-}
-
-static void fun_cmd_ctrl(struct nand_chip *chip, int cmd, unsigned int ctrl)
-{
-	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
-	u32 mar;
-
-	if (!(ctrl & fun->last_ctrl)) {
-		fsl_upm_end_pattern(&fun->upm);
-
-		if (cmd == NAND_CMD_NONE)
-			return;
-
-		fun->last_ctrl = ctrl & (NAND_ALE | NAND_CLE);
-	}
-
-	if (ctrl & NAND_CTRL_CHANGE) {
-		if (ctrl & NAND_ALE)
-			fsl_upm_start_pattern(&fun->upm, fun->upm_addr_offset);
-		else if (ctrl & NAND_CLE)
-			fsl_upm_start_pattern(&fun->upm, fun->upm_cmd_offset);
-	}
-
-	mar = (cmd << (32 - fun->upm.width)) |
-		fun->mchip_offsets[fun->mchip_number];
-	fsl_upm_run_pattern(&fun->upm, chip->legacy.IO_ADDR_R, mar);
-
-	if (fun->wait_flags & FSL_UPM_WAIT_RUN_PATTERN)
-		fun_wait_rnb(fun);
-}
-
-static void fun_select_chip(struct nand_chip *chip, int mchip_nr)
-{
-	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
-
-	if (mchip_nr == -1) {
-		chip->legacy.cmd_ctrl(chip, NAND_CMD_NONE, 0 | NAND_CTRL_CHANGE);
-	} else if (mchip_nr >= 0 && mchip_nr < NAND_MAX_CHIPS) {
-		fun->mchip_number = mchip_nr;
-		chip->legacy.IO_ADDR_R = fun->io_base + fun->mchip_offsets[mchip_nr];
-		chip->legacy.IO_ADDR_W = chip->legacy.IO_ADDR_R;
-	} else {
-		BUG();
-	}
-}
-
-static uint8_t fun_read_byte(struct nand_chip *chip)
-{
-	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
-
-	return in_8(fun->chip.legacy.IO_ADDR_R);
-}
-
-static void fun_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
-{
-	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
-	int i;
-
-	for (i = 0; i < len; i++)
-		buf[i] = in_8(fun->chip.legacy.IO_ADDR_R);
-}
-
-static void fun_write_buf(struct nand_chip *chip, const uint8_t *buf, int len)
-{
-	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
-	int i;
-
-	for (i = 0; i < len; i++) {
-		out_8(fun->chip.legacy.IO_ADDR_W, buf[i]);
-		if (fun->wait_flags & FSL_UPM_WAIT_WRITE_BYTE)
-			fun_wait_rnb(fun);
-	}
-	if (fun->wait_flags & FSL_UPM_WAIT_WRITE_BUFFER)
-		fun_wait_rnb(fun);
-}
-
 static int fun_chip_init(struct fsl_upm_nand *fun,
 			 const struct device_node *upm_np,
 			 const struct resource *io_res)
@@ -153,21 +47,8 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	int ret;
 	struct device_node *flash_np;
 
-	fun->chip.legacy.IO_ADDR_R = fun->io_base;
-	fun->chip.legacy.IO_ADDR_W = fun->io_base;
-	fun->chip.legacy.cmd_ctrl = fun_cmd_ctrl;
-	fun->chip.legacy.chip_delay = fun->chip_delay;
-	fun->chip.legacy.read_byte = fun_read_byte;
-	fun->chip.legacy.read_buf = fun_read_buf;
-	fun->chip.legacy.write_buf = fun_write_buf;
 	fun->chip.ecc.mode = NAND_ECC_SOFT;
 	fun->chip.ecc.algo = NAND_ECC_HAMMING;
-	if (fun->mchip_count > 1)
-		fun->chip.legacy.select_chip = fun_select_chip;
-
-	if (!fun->rnb_gpio[0])
-		fun->chip.legacy.dev_ready = fun_chip_ready;
-
 	fun->chip.controller = &fun->base;
 	mtd->dev.parent = fun->dev;
 
@@ -342,23 +223,9 @@ static int fun_probe(struct platform_device *ofdev)
 		}
 	}
 
-	prop = of_get_property(ofdev->dev.of_node, "chip-delay", NULL);
-	if (prop)
-		fun->chip_delay = be32_to_cpup(prop);
-	else
-		fun->chip_delay = 50;
-
-	prop = of_get_property(ofdev->dev.of_node, "fsl,upm-wait-flags", &size);
-	if (prop && size == sizeof(uint32_t))
-		fun->wait_flags = be32_to_cpup(prop);
-	else
-		fun->wait_flags = FSL_UPM_WAIT_RUN_PATTERN |
-				  FSL_UPM_WAIT_WRITE_BYTE;
-
 	nand_controller_init(&fun->base);
 	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
-	fun->last_ctrl = NAND_CLE;
 
 	ret = fun_chip_init(fun, ofdev->dev.of_node, io_res);
 	if (ret)
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
