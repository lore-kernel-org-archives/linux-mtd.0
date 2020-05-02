Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795A5C3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 16:35:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404C821775
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 16:35:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cYfJB43x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 404C821775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FW3I/Cdr4nmYVP2UW6VThFZO+2VPxAnK+URpr7xcIj4=; b=cYfJB43xOilqTD
	laA3GM1bg6nfNTI2b2U97ehQE+jH30M3vS/Cc9e257NwYEhZDvWFQLUj4qDH4rqvQ6HMomsRMFe2p
	qDnilAV7Emwubxnzo+QA8hdJShIRXYTDte1q4WRFGFpLRryM/xwbzQZ2GaOG/aYAzxwbzHz0lFleK
	Os1tpj6fILUMyjo3Rtc460gJ94b/Ui+JGed66bTyScQOY1/rJKCKlcdbW8XqGu2emJwBqqcB8JqQf
	7JSAvWmPGODJo6qRl9S4EfPCMoRhsCeguFFE6lhMHUlMEwLxBNInjctMC0Myj6+bmfMDxKyCJ+Xor
	ejAuA1GQUhXFY5rciRaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUv6M-0000vG-Ti; Sat, 02 May 2020 16:34:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUv68-0000kS-4I; Sat, 02 May 2020 16:34:41 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 29BB72A0C07;
 Sat,  2 May 2020 17:34:37 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: rawnand: bcrmnand: Add exec_op() support
Date: Sat,  2 May 2020 18:34:31 +0200
Message-Id: <20200502163432.1543243-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.3
In-Reply-To: <20200502163432.1543243-1-boris.brezillon@collabora.com>
References: <20200502163432.1543243-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_093440_302271_62328D34 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Scott Branden <sbranden@broadcom.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This implementation of exec_op() relies on low-level operations only. We
could add support for high-level operations too through an op parser,
but the gain is likely to be negligible since read/write page operations
already have a fast path ({readwrite}_page[raw]() implementations).

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index e4e3ceeac38f..e70117146755 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -1599,6 +1599,77 @@ static int brcmnand_low_level_op(struct brcmnand_host *host,
 	return brcmnand_waitfunc(chip);
 }
 
+static void brcmnand_exec_instr(struct brcmnand_host *host,
+				const struct nand_op_instr *instr,
+				bool last_op)
+{
+	unsigned int i;
+	const u8 *out;
+	u8 *in;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		brcmnand_low_level_op(host, LL_OP_CMD,
+				      instr->ctx.cmd.opcode, last_op);
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++)
+			brcmnand_low_level_op(host, LL_OP_ADDR,
+					      instr->ctx.addr.addrs[i],
+					      last_op);
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		in = instr->ctx.data.buf.in;
+		for (i = 0; i < instr->ctx.data.len; i++) {
+			brcmnand_low_level_op(host, LL_OP_RD, 0, last_op);
+			in[i] = brcmnand_read_reg(host->ctrl,
+						  BRCMNAND_LL_RDATA);
+		}
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		out = instr->ctx.data.buf.out;
+		for (i = 0; i < instr->ctx.data.len; i++)
+			brcmnand_low_level_op(host, LL_OP_WR, out[i], last_op);
+		break;
+
+	case NAND_OP_WAITRDY_INSTR:
+		/*
+		 * Nothing to do here, brcmnand_low_level_op() already waits on
+		 * FLASH_READY every time it's called.
+		 */
+		break;
+
+	default:
+		break;
+	}
+}
+
+static int brcmnand_exec_op(struct nand_chip *chip,
+			    const struct nand_operation *op,
+			    bool check_only)
+{
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	unsigned int i;
+
+	if (check_only)
+		return 0;
+
+	if (op->deassert_wp)
+		brcmnand_wp(mtd, 0);
+
+	for (i = 0; i < op->ninstrs; i++)
+		brcmnand_exec_instr(host, &op->instrs[i], i == op->ninstrs - 1);
+
+	if (op->deassert_wp)
+		brcmnand_wp(mtd, 1);
+
+	return 0;
+}
+
 static void brcmnand_cmdfunc(struct nand_chip *chip, unsigned command,
 			     int column, int page_addr)
 {
@@ -2597,6 +2668,7 @@ static int brcmnand_attach_chip(struct nand_chip *chip)
 
 static const struct nand_controller_ops brcmnand_controller_ops = {
 	.attach_chip = brcmnand_attach_chip,
+	.exec_op = brcmnand_exec_op,
 };
 
 static int brcmnand_init_cs(struct brcmnand_host *host, struct device_node *dn)
-- 
2.25.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
