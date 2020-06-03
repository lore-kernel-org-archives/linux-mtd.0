Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A5FC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 15:08:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2583D206E6
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 15:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yg3/vWa/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2583D206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJrh/C4WbDbotN7KPGhI4q9s8xS6cCtN5ueANLoOIS8=; b=Yg3/vWa/vz95R+
	lX/O03pL5iwzEYBSb4rpRS/YJmuB/G8nJ23age1jF1EdJlfhoamKYIHvagiKoxaNABjWMNew7GTxM
	Ov0pOvcVy7Jh09po5Gc8a/pSyuEqlonSrnSjONuOzJ6+eSLGWrjTm1OHQiDhskkQljCjwLG/7mWR7
	YKYrIdZCZ0asz97G6t4NpkcpZigM/iXoxxHYy+F3/V3PltwQGjn88+2zEGR9SXUCe2KHQXGKPb/Hz
	hVAxiWv0mO0/inChlXEbFtPxtRy3b0Fixsf+N3wdaaNwxHD5Tn+6uublWbzqds5Tri1VvppfGv43t
	Z/fP4XrQclFPXBJmdsKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgV06-0006a6-Pm; Wed, 03 Jun 2020 15:08:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgUzi-0006Aa-Ph
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 15:07:56 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 235DD2A3AAE;
 Wed,  3 Jun 2020 16:07:53 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 2/3] mtd: rawnand: gpio: Implement exec_op()
Date: Wed,  3 Jun 2020 17:07:45 +0200
Message-Id: <20200603150746.1423257-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603150746.1423257-1-boris.brezillon@collabora.com>
References: <20200603150746.1423257-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_080755_095597_2989D612 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: linux-mips@linux-mips.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Ralf Baechle <ralf@linux-mips.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jamie Iles <jamie@jamieiles.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Implement exec_op() so we can get rid of the legacy interface
implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/gpio.c | 104 ++++++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 33828fb20a13..115998011192 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -25,9 +25,11 @@
 #include <linux/mtd/nand-gpio.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/delay.h>
 
 struct gpiomtd {
 	struct nand_controller	base;
+	void __iomem		*io;
 	void __iomem		*io_sync;
 	struct nand_chip	nand_chip;
 	struct gpio_nand_platdata plat;
@@ -98,6 +100,99 @@ static int gpio_nand_devready(struct nand_chip *chip)
 	return gpiod_get_value(gpiomtd->rdy);
 }
 
+static int gpio_nand_exec_instr(struct nand_chip *chip,
+				const struct nand_op_instr *instr)
+{
+	struct gpiomtd *gpiomtd = gpio_nand_getpriv(nand_to_mtd(chip));
+	unsigned int i;
+
+	switch (instr->type) {
+	case NAND_OP_CMD_INSTR:
+		gpio_nand_dosync(gpiomtd);
+		gpiod_set_value(gpiomtd->cle, 1);
+		gpio_nand_dosync(gpiomtd);
+		writeb(instr->ctx.cmd.opcode, gpiomtd->io);
+		gpio_nand_dosync(gpiomtd);
+		gpiod_set_value(gpiomtd->cle, 0);
+		return 0;
+
+	case NAND_OP_ADDR_INSTR:
+		gpio_nand_dosync(gpiomtd);
+		gpiod_set_value(gpiomtd->ale, 1);
+		gpio_nand_dosync(gpiomtd);
+		for (i = 0; i < instr->ctx.addr.naddrs; i++)
+			writeb(instr->ctx.addr.addrs[i], gpiomtd->io);
+		gpio_nand_dosync(gpiomtd);
+		gpiod_set_value(gpiomtd->ale, 0);
+		return 0;
+
+	case NAND_OP_DATA_IN_INSTR:
+		gpio_nand_dosync(gpiomtd);
+		if ((chip->options & NAND_BUSWIDTH_16) &&
+		    !instr->ctx.data.force_8bit)
+			ioread16_rep(gpiomtd->io, instr->ctx.data.buf.in,
+				     instr->ctx.data.len / 2);
+		else
+			ioread8_rep(gpiomtd->io, instr->ctx.data.buf.in,
+				    instr->ctx.data.len);
+		return 0;
+
+	case NAND_OP_DATA_OUT_INSTR:
+		gpio_nand_dosync(gpiomtd);
+		if ((chip->options & NAND_BUSWIDTH_16) &&
+		    !instr->ctx.data.force_8bit)
+			iowrite16_rep(gpiomtd->io, instr->ctx.data.buf.out,
+				      instr->ctx.data.len / 2);
+		else
+			iowrite8_rep(gpiomtd->io, instr->ctx.data.buf.out,
+				     instr->ctx.data.len);
+		return 0;
+
+	case NAND_OP_WAITRDY_INSTR:
+		if (!gpiomtd->rdy)
+			return nand_soft_waitrdy(chip, instr->ctx.waitrdy.timeout_ms);
+
+		return nand_gpio_waitrdy(chip, gpiomtd->rdy,
+					 instr->ctx.waitrdy.timeout_ms);
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int gpio_nand_exec_op(struct nand_chip *chip,
+			     const struct nand_operation *op,
+			     bool check_only)
+{
+	struct gpiomtd *gpiomtd = gpio_nand_getpriv(nand_to_mtd(chip));
+	unsigned int i;
+	int ret = 0;
+
+	if (check_only)
+		return 0;
+
+	gpio_nand_dosync(gpiomtd);
+	gpiod_set_value(gpiomtd->nce, 0);
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = gpio_nand_exec_instr(chip, &op->instrs[i]);
+		if (ret)
+			break;
+
+		if (op->instrs[i].delay_ns)
+			ndelay(op->instrs[i].delay_ns);
+	}
+	gpio_nand_dosync(gpiomtd);
+	gpiod_set_value(gpiomtd->nce, 1);
+
+	return ret;
+}
+
+static const struct nand_controller_ops gpio_nand_ops = {
+	.exec_op = gpio_nand_exec_op,
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id gpio_nand_id_table[] = {
 	{ .compatible = "gpio-control-nand" },
@@ -226,9 +321,9 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	chip = &gpiomtd->nand_chip;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	chip->legacy.IO_ADDR_R = devm_ioremap_resource(dev, res);
-	if (IS_ERR(chip->legacy.IO_ADDR_R))
-		return PTR_ERR(chip->legacy.IO_ADDR_R);
+	gpiomtd->io = devm_ioremap_resource(dev, res);
+	if (IS_ERR(gpiomtd->io))
+		return PTR_ERR(gpiomtd->io);
 
 	res = gpio_nand_get_io_sync(pdev);
 	if (res) {
@@ -275,7 +370,10 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		chip->legacy.dev_ready = gpio_nand_devready;
 
 	nand_controller_init(&gpiomtd->base);
+	gpiomtd->base.ops = &gpio_nand_ops;
+
 	nand_set_flash_node(chip, pdev->dev.of_node);
+	chip->legacy.IO_ADDR_R	= gpiomtd->io;
 	chip->legacy.IO_ADDR_W	= chip->legacy.IO_ADDR_R;
 	chip->ecc.mode		= NAND_ECC_SOFT;
 	chip->ecc.algo		= NAND_ECC_HAMMING;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
