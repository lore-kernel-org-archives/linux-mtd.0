Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE584C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:51:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 914E9206A2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:51:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BssdkQ6a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 914E9206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jd7AMSWB7Fcff45CtJ4hQs/ToNmZ/ArtZZzQRzX8IkA=; b=BssdkQ6aNgzxL1
	aMAC2+kYmVKAlWn/9mS/bAtPUtSkPsVW36YuLTn18uXK4SMx9lQ4kKwF//e0w9TU1KUPFonJ8uAQM
	yPkdNryobo/HuRIBcLS0KdEfgVHyqd238/FHNA7RYJgTFBNnwZVofCzgE5W2Bu/9kyJVas1urbdh3
	41mlpN/OemUxkUpp/xcecDq/pSxem7ymKNJP/nER7mEVEhSqLnTdqVKm8F+vagdhk6A9SsT7oUjN7
	ySvNMdmgob6lOY7uYYUUXRxMAzlZUsYLMKkas0r8HfHU9B8Hixsj9OIdssLf+AGjw+wGmQ2EfFA+M
	GC2lbUoEsUO5hpsJkC5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTnD-0005Ju-Df; Wed, 03 Jun 2020 13:50:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTlq-0001jo-D9
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 13:49:33 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E57BA2A3D7A;
 Wed,  3 Jun 2020 14:49:28 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 08/10] mtd: rawnand: fsl_upm: Implement exec_op()
Date: Wed,  3 Jun 2020 15:49:20 +0200
Message-Id: <20200603134922.1352340-9-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603134922.1352340-1-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_064930_602091_6BFB01F8 
X-CRM114-Status: GOOD (  12.44  )
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

Implement exec_op() so we can get rid of the legacy interface
implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 86 ++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index 9a63e36825d8..03ca20930274 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -194,6 +194,91 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 	return ret;
 }
 
+static int func_exec_instr(struct nand_chip *chip,
+			   const struct nand_op_instr *instr)
+{
+	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
+	u32 mar, reg_offs = fun->mchip_offsets[fun->mchip_number];
+	unsigned int i;
+	const u8 *out;
+	u8 *in;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		fsl_upm_start_pattern(&fun->upm, fun->upm_cmd_offset);
+		mar = (instr->ctx.cmd.opcode << (32 - fun->upm.width)) |
+		      reg_offs;
+		fsl_upm_run_pattern(&fun->upm, fun->io_base + reg_offs, mar);
+		fsl_upm_end_pattern(&fun->upm);
+		return 0;
+
+	case NAND_OP_ADDR_INSTR:
+		fsl_upm_start_pattern(&fun->upm, fun->upm_addr_offset);
+		for (i = 0; i < instr->ctx.addr.naddrs; i++) {
+			mar = (instr->ctx.addr.addrs[i] << (32 - fun->upm.width)) |
+			      reg_offs;
+			fsl_upm_run_pattern(&fun->upm, fun->io_base + reg_offs, mar);
+		}
+		fsl_upm_end_pattern(&fun->upm);
+		return 0;
+
+	case NAND_OP_DATA_IN_INSTR:
+		in = instr->ctx.data.buf.in;
+		for (i = 0; i < instr->ctx.data.len; i++)
+			in[i] = in_8(fun->io_base + reg_offs);
+		return 0;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		out = instr->ctx.data.buf.out;
+		for (i = 0; i < instr->ctx.data.len; i++)
+			out_8(fun->io_base + reg_offs, out[i]);
+		return 0;
+
+	case NAND_OP_WAITRDY_INSTR:
+		if (!fun->rnb_gpio[fun->mchip_number])
+			return nand_soft_waitrdy(chip, instr->ctx.waitrdy.timeout_ms);
+
+		return nand_gpio_waitrdy(chip, fun->rnb_gpio[fun->mchip_number],
+					 instr->ctx.waitrdy.timeout_ms);
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fun_exec_op(struct nand_chip *chip, const struct nand_operation *op,
+		       bool check_only)
+{
+	struct fsl_upm_nand *fun = to_fsl_upm_nand(nand_to_mtd(chip));
+	unsigned int i;
+	int ret;
+
+	if (op->cs > NAND_MAX_CHIPS)
+		return -EINVAL;
+
+	if (check_only)
+		return 0;
+
+	fun->mchip_number = op->cs;
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = func_exec_instr(chip, &op->instrs[i]);
+		if (ret)
+			return ret;
+
+		if (op->instrs[i].delay_ns)
+			ndelay(op->instrs[i].delay_ns);
+	}
+
+	return 0;
+}
+
+static const struct nand_controller_ops fun_ops = {
+	.exec_op = fun_exec_op,
+};
+
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
@@ -271,6 +356,7 @@ static int fun_probe(struct platform_device *ofdev)
 				  FSL_UPM_WAIT_WRITE_BYTE;
 
 	nand_controller_init(&fun->base);
+	fun->base.ops = &fun_ops;
 	fun->dev = &ofdev->dev;
 	fun->last_ctrl = NAND_CLE;
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
