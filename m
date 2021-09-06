Return-Path: <SRS0=TNsO=N4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96345C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 13:30:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4302260F43
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Sep 2021 13:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4302260F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UljSWGDiX/hK6MDl/mg5arubH7ywsidqjnQ79peY8XI=; b=MDabalytzgKq0S
	nbIQBS7XYKFdQmXvden99AmgI7SPmvvUTtfN3rOFRWxkgrrwWMzNWdAXCuS+g11mm+BncMN1cmE3b
	b/c6mPGOMqIXN57NIFEKsAiKwPFhX4Wj7wZjntE/Y+jQ0PiJe6E7RB51Yyz6+0bF7Qf/jV4Jf2nHC
	PLAyTDfV2t/4ltTCTG7wuffu/l6o2387xLWth0PgFnuOtgoOM6Rztlxi+aa1hmDzOEWMn8yMnh014
	+3ZxZs95gW+m29uCC0M9oPZTfKK5xnpdffstLEFbP0FgJwqllZjW1J3uV3ha6+4VSmlzn//0GqPlm
	bFIWibR9DiYzzAq8hIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNEhK-000umJ-V3; Mon, 06 Sep 2021 13:30:06 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNEh5-000ukZ-9a
 for linux-mtd@lists.infradead.org; Mon, 06 Sep 2021 13:29:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 79E48240011;
 Mon,  6 Sep 2021 13:29:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] mtd: rawnand: arasan: Provide an additional ->exec_op()
 check
Date: Mon,  6 Sep 2021 15:29:42 +0200
Message-Id: <20210906132942.36972-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210906132942.36972-1-miquel.raynal@bootlin.com>
References: <20210906132942.36972-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_062951_515887_BE9EF327 
X-CRM114-Status: GOOD (  14.94  )
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

The controller only supports data payload requests which are multiple of
4. Rounding up will not work if we reached the end of the device and the
controller will just refuse the request. Hence any unaligned data request
that ends at the device boundary should be refused.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/arasan-nand-controller.c | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
index 9cbcc698c64d..8377994f3c49 100644
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -891,6 +891,7 @@ static const struct nand_op_parser anfc_op_parser = NAND_OP_PARSER(
 static int anfc_check_op(struct nand_chip *chip,
 			 const struct nand_operation *op)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	const struct nand_op_instr *instr;
 	int op_id;
 
@@ -940,6 +941,35 @@ static int anfc_check_op(struct nand_chip *chip,
 	    op->instrs[1].type == NAND_OP_DATA_IN_INSTR)
 		return -ENOTSUPP;
 
+	/*
+	 * The controller only supports data payload requests which are a
+	 * multiple of 4. This may confuse the core as the core could request a
+	 * given number of bytes and then another number of bytes without
+	 * re-synchronizing the pointer. In practice, most data accesses are
+	 * 4-byte aligned and thus this is not an issue in practice. However,
+	 * rounding up will not work if we reached the end of the device. Any
+	 * unaligned data request that ends at the device boundary would confuse
+	 * the controller and cannot be performed.
+	 *
+	 * TODO: The nand_op_parser framework should be extended to
+	 * support custom checks on DATA instructions.
+	 */
+	if (op->ninstrs == 4 &&
+	    op->instrs[0].type == NAND_OP_CMD_INSTR &&
+	    op->instrs[1].type == NAND_OP_ADDR_INSTR &&
+	    op->instrs[1].ctx.addr.naddrs == 2 &&
+	    op->instrs[2].type == NAND_OP_CMD_INSTR &&
+	    op->instrs[3].type == NAND_OP_DATA_IN_INSTR) {
+		unsigned int start_off, end_off;
+
+		start_off = (op->instrs[1].ctx.addr.addrs[1] << 8) +
+			    op->instrs[1].ctx.addr.addrs[0];
+		end_off = start_off + round_up(op->instrs[3].ctx.data.len, 4);
+
+		if (end_off >= mtd->writesize + mtd->oobsize)
+			return -ENOTSUPP;
+	}
+
 	return nand_op_parser_exec_op(chip, &anfc_op_parser, op, true);
 }
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
