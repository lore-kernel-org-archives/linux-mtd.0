Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AA5C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 18:55:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24AD620663
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 18:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MBqPdDv1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24AD620663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pu21A+eEclK0g6qctLCWaQnDyUKqBCmtQwqp8FNinTw=; b=MBqPdDv1CQ9yQk
	EPq8QhywPtrqZsg/tytS5dC5q1IKRqaRWY6xS53lnCK/H2l63+KEaWzhe/QCQK6JWBRxbjyzef49D
	u46nOMBeeE2XSbE4cV+yVO6pZWz2EyXeKNCpQSmVGW/IqOVBzwQv6SaIVRMXkW5iOZdaeqC+bb4pf
	JwP6AA+MfQ9aaQWhxiqLF3rN0MKZ4Jq7r7RTxVjdYfEQgplDgbQuBg6UL7c0xt2snbOQLkz7p3SGN
	l9rO2f/kU+yQiJztd9CziAwqtrlsvPSaElQaf4EF0XyYWiD3US3cxCYspWn5GImvNX+V/S6jUogHe
	mBpbLmYTUacD2dNf3tnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGpib-0007Y1-71; Wed, 17 Apr 2019 18:55:37 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGpi6-0005qU-DA
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 18:55:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 8999318030845;
 Wed, 17 Apr 2019 20:54:57 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2 v2] mtd: nandsim: switch to exec_op interface
Date: Wed, 17 Apr 2019 20:54:33 +0200
Message-Id: <20190417185433.29666-2-richard@nod.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190417185433.29666-1-richard@nod.at>
References: <20190417185433.29666-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_115506_999301_CE0CAF43 
X-CRM114-Status: GOOD (  16.27  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 Boris Brezillon <boris.brezillon@collabora.com>, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Stop using the legacy interface.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/nand/raw/nandsim.c | 78 ++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 3d80e2d23b6e..ba38ee70dd64 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -299,6 +299,7 @@ union ns_mem {
  */
 struct nandsim {
 	struct nand_chip chip;
+	struct nand_controller base;
 	struct mtd_partition partitions[CONFIG_NANDSIM_MAX_PARTS];
 	unsigned int nbparts;
 
@@ -645,9 +646,6 @@ static int __init init_nandsim(struct mtd_info *mtd)
 		return -EIO;
 	}
 
-	/* Force mtd to not do delays */
-	chip->legacy.chip_delay = 0;
-
 	/* Initialize the NAND flash parameters */
 	ns->busw = chip->options & NAND_BUSWIDTH_16 ? 16 : 8;
 	ns->geom.totsz    = mtd->size;
@@ -2077,24 +2075,6 @@ static void ns_nand_write_byte(struct nand_chip *chip, u_char byte)
 	return;
 }
 
-static void ns_hwcontrol(struct nand_chip *chip, int cmd, unsigned int bitmask)
-{
-	struct nandsim *ns = nand_get_controller_data(chip);
-
-	ns->lines.cle = bitmask & NAND_CLE ? 1 : 0;
-	ns->lines.ale = bitmask & NAND_ALE ? 1 : 0;
-	ns->lines.ce = bitmask & NAND_NCE ? 1 : 0;
-
-	if (cmd != NAND_CMD_NONE)
-		ns_nand_write_byte(chip, cmd);
-}
-
-static int ns_device_ready(struct nand_chip *chip)
-{
-	NS_DBG("device_ready\n");
-	return 1;
-}
-
 static void ns_nand_write_buf(struct nand_chip *chip, const u_char *buf,
 			      int len)
 {
@@ -2146,7 +2126,7 @@ static void ns_nand_read_buf(struct nand_chip *chip, u_char *buf, int len)
 		int i;
 
 		for (i = 0; i < len; i++)
-			buf[i] = chip->legacy.read_byte(chip);
+			buf[i] = ns_nand_read_byte(chip);
 
 		return;
 	}
@@ -2169,6 +2149,46 @@ static void ns_nand_read_buf(struct nand_chip *chip, u_char *buf, int len)
 	return;
 }
 
+static int ns_exec_op(struct nand_chip *chip, const struct nand_operation *op,
+		      bool check_only)
+{
+	int i;
+	unsigned int op_id;
+	const struct nand_op_instr *instr = NULL;
+	struct nandsim *ns = nand_get_controller_data(chip);
+
+	ns->lines.ce = 1;
+
+	for (op_id = 0; op_id < op->ninstrs; op_id++) {
+		instr = &op->instrs[op_id];
+		ns->lines.cle = 0;
+		ns->lines.ale = 0;
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			ns->lines.cle = 1;
+			ns_nand_write_byte(chip, instr->ctx.cmd.opcode);
+			break;
+		case NAND_OP_ADDR_INSTR:
+			ns->lines.ale = 1;
+			for (i = 0; i < instr->ctx.addr.naddrs; i++)
+				ns_nand_write_byte(chip, instr->ctx.addr.addrs[i]);
+			break;
+		case NAND_OP_DATA_IN_INSTR:
+			ns_nand_read_buf(chip, instr->ctx.data.buf.in, instr->ctx.data.len);
+			break;
+		case NAND_OP_DATA_OUT_INSTR:
+			ns_nand_write_buf(chip, instr->ctx.data.buf.out, instr->ctx.data.len);
+			break;
+		case NAND_OP_WAITRDY_INSTR:
+			/* we are always ready */
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static int ns_attach_chip(struct nand_chip *chip)
 {
 	unsigned int eccsteps, eccbytes;
@@ -2209,6 +2229,7 @@ static int ns_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops ns_controller_ops = {
 	.attach_chip = ns_attach_chip,
+	.exec_op = ns_exec_op,
 };
 
 /*
@@ -2234,14 +2255,6 @@ static int __init ns_init_module(void)
 	nsmtd       = nand_to_mtd(chip);
 	nand_set_controller_data(chip, (void *)ns);
 
-	/*
-	 * Register simulator's callbacks.
-	 */
-	chip->legacy.cmd_ctrl	 = ns_hwcontrol;
-	chip->legacy.read_byte  = ns_nand_read_byte;
-	chip->legacy.dev_ready  = ns_device_ready;
-	chip->legacy.write_buf  = ns_nand_write_buf;
-	chip->legacy.read_buf   = ns_nand_read_buf;
 	chip->ecc.mode   = NAND_ECC_SOFT;
 	chip->ecc.algo   = NAND_ECC_HAMMING;
 	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
@@ -2292,7 +2305,10 @@ static int __init ns_init_module(void)
 	if ((retval = parse_gravepages()) != 0)
 		goto error;
 
-	chip->legacy.dummy_controller.ops = &ns_controller_ops;
+	nand_controller_init(&ns->base);
+	ns->base.ops = &ns_controller_ops;
+	chip->controller = &ns->base;
+
 	retval = nand_scan(chip, 1);
 	if (retval) {
 		NS_ERR("Could not scan NAND Simulator device\n");
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
