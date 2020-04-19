Return-Path: <SRS0=gdbt=6D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1A4C38A30
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 19:31:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BC2E2075E
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Apr 2020 19:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CbUwnLwf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BC2E2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZOi17sqT4KC+88I1n9WBJckATFfGSaLgijXHTCxaRM=; b=CbUwnLwfHjrvs5
	xiELMetcBJpHs3vT4S3WXI2IqWzysHqtXRfTFX4W6BpdwoxquDHxh66nOsXMN2g4Jh6eHlADq6rJw
	o4HUy1qM/+k7NrTiMcJuuWAqFENZd0uCJmJkdzRcYtFdNmYDslU4N6sT2uY+XbDDdo9ESvHP5h5oo
	Y9DwdMeeBPNsalJsEE3Y7r9tpQfQABvZ1F6XOq2ck5/iXRRwvI3AUBowoHzx3BsOhqS1j30zCwBji
	PInjVMjXUJA6z+4TdCM5BPrr6LVRuDYDM63oAx4kQfWPpKEmi9WzIb2xWB5VxWY5NtiYHXlps+0+k
	1fDQDJuzDMaozEQWwpFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQFf7-0004uA-Vw; Sun, 19 Apr 2020 19:31:29 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQFeN-0004Cl-PY
 for linux-mtd@lists.infradead.org; Sun, 19 Apr 2020 19:30:46 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 615852A0562;
 Sun, 19 Apr 2020 20:30:42 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/4] mtd: rawnand: au1550nd: Implement exec_op()
Date: Sun, 19 Apr 2020 21:30:35 +0200
Message-Id: <20200419193037.1544035-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200419193037.1544035-1-boris.brezillon@collabora.com>
References: <20200419193037.1544035-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_123043_956907_86515086 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

So we can later get rid of the legacy interface implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/au1550nd.c | 110 ++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/mtd/nand/raw/au1550nd.c b/drivers/mtd/nand/raw/au1550nd.c
index 2f8004f20349..79bf9fbeeb22 100644
--- a/drivers/mtd/nand/raw/au1550nd.c
+++ b/drivers/mtd/nand/raw/au1550nd.c
@@ -16,6 +16,7 @@
 
 
 struct au1550nd_ctx {
+	struct nand_controller controller;
 	struct nand_chip chip;
 
 	int cs;
@@ -382,6 +383,112 @@ static int find_nand_cs(unsigned long nand_base)
 	return -ENODEV;
 }
 
+static int au1550nd_waitrdy(struct nand_chip *this, unsigned int timeout_ms)
+{
+	unsigned long timeout_jiffies = jiffies;
+
+	timeout_jiffies += msecs_to_jiffies(timeout_ms) + 1;
+	do {
+		if (alchemy_rdsmem(AU1000_MEM_STSTAT) & 0x1)
+			return 0;
+
+		usleep_range(10, 100);
+	} while (time_before(jiffies, timeout_jiffies));
+
+	return -ETIMEDOUT;
+}
+
+static int au1550nd_exec_instr(struct nand_chip *this,
+			       const struct nand_op_instr *instr)
+{
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
+	unsigned int i;
+	int ret = 0;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		writeb(instr->ctx.cmd.opcode,
+		       ctx->base + MEM_STNAND_CMD);
+		/* Drain the writebuffer */
+		wmb();
+		break;
+
+	case NAND_OP_ADDR_INSTR:
+		for (i = 0; i < instr->ctx.addr.naddrs; i++) {
+			writeb(instr->ctx.addr.addrs[i],
+			       ctx->base + MEM_STNAND_ADDR);
+			/* Drain the writebuffer */
+			wmb();
+		}
+		break;
+
+	case NAND_OP_DATA_IN_INSTR:
+		if ((this->options & NAND_BUSWIDTH_16) &&
+		    !instr->ctx.data.force_8bit)
+			au_read_buf16(this, instr->ctx.data.buf.in,
+				      instr->ctx.data.len);
+		else
+			au_read_buf(this, instr->ctx.data.buf.in,
+				    instr->ctx.data.len);
+		break;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		if ((this->options & NAND_BUSWIDTH_16) &&
+		    !instr->ctx.data.force_8bit)
+			au_write_buf16(this, instr->ctx.data.buf.out,
+				       instr->ctx.data.len);
+		else
+			au_write_buf(this, instr->ctx.data.buf.out,
+				     instr->ctx.data.len);
+		break;
+
+	case NAND_OP_WAITRDY_INSTR:
+		ret = au1550nd_waitrdy(this, instr->ctx.waitrdy.timeout_ms);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (instr->delay_ns)
+		ndelay(instr->delay_ns);
+
+	return ret;
+}
+
+static int au1550nd_exec_op(struct nand_chip *this,
+			    const struct nand_operation *op,
+			    bool check_only)
+{
+	struct au1550nd_ctx *ctx = chip_to_au_ctx(this);
+	unsigned int i;
+	int ret;
+
+	if (check_only)
+		return 0;
+
+	/* assert (force assert) chip enable */
+	alchemy_wrsmem((1 << (4 + ctx->cs)), AU1000_MEM_STNDCTL);
+	/* Drain the writebuffer */
+	wmb();
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = au1550nd_exec_instr(this, &op->instrs[i]);
+		if (ret)
+			break;
+	}
+
+	/* deassert chip enable */
+	alchemy_wrsmem(0, AU1000_MEM_STNDCTL);
+	/* Drain the writebuffer */
+	wmb();
+
+	return ret;
+}
+
+static const struct nand_controller_ops au1550nd_ops = {
+	.exec_op = au1550nd_exec_op,
+};
+
 static int au1550nd_probe(struct platform_device *pdev)
 {
 	struct au1550nd_platdata *pd;
@@ -439,6 +546,9 @@ static int au1550nd_probe(struct platform_device *pdev)
 
 	/* 30 us command delay time */
 	this->legacy.chip_delay = 30;
+	nand_controller_init(&ctx->controller);
+	ctx->controller.ops = &au1550nd_ops;
+	this->controller = &ctx->controller;
 	this->ecc.mode = NAND_ECC_SOFT;
 	this->ecc.algo = NAND_ECC_HAMMING;
 
-- 
2.25.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
