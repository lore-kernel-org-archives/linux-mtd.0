Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E48C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 15:08:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8EB206E6
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 15:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOUMp8RU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8EB206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggTI0nkICs4/LMgV7A8S3/LdogIxkSOqWRSwTUmTbsY=; b=gOUMp8RU37nutw
	3m0+eWRjbdOWc4R8/l+X5sSa6YhzIPn0ECzeLDFUcOF8r/xIp/S0u5z1nLkavtrmIVVeQSkp+NZLi
	qMGveKpseqNB0nedXg+qR0BJYdVP768UvIooZc5aDL2FJ4ZFOiVP1AxnfdplVLdsy7C8p0HlH5la1
	10VxR0nsawhSCOlGZGoekRZB7PK5P3pMRUkOfp7eWAtBmx/5ShnaThR7/l7TIItzViPHr01xpQCun
	iEgYHW22o37kSpbjyRUGUujhuRm3yZ8J86LSP6Yxk3FZDDanLC/CqNd9aR7qIy+3VnHlVhFYDTtQV
	tZqiZDiLr6Yf8N23yWcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgV0O-0006qz-4Z; Wed, 03 Jun 2020 15:08:36 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgUzj-0006Ae-1b
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 15:07:57 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 881862A3ABE;
 Wed,  3 Jun 2020 16:07:53 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 3/3] mtd: rawnand: gpio: Get rid of the legacy interface
 implementation
Date: Wed,  3 Jun 2020 17:07:46 +0200
Message-Id: <20200603150746.1423257-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603150746.1423257-1-boris.brezillon@collabora.com>
References: <20200603150746.1423257-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_080755_215056_3E819933 
X-CRM114-Status: GOOD (  12.84  )
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

Now that exec_op() is implemented, we can get rid of the legacy interface
implementation.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/gpio.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 115998011192..3bd847ccc3f3 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -72,34 +72,6 @@ static void gpio_nand_dosync(struct gpiomtd *gpiomtd)
 static inline void gpio_nand_dosync(struct gpiomtd *gpiomtd) {}
 #endif
 
-static void gpio_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
-			       unsigned int ctrl)
-{
-	struct gpiomtd *gpiomtd = gpio_nand_getpriv(nand_to_mtd(chip));
-
-	gpio_nand_dosync(gpiomtd);
-
-	if (ctrl & NAND_CTRL_CHANGE) {
-		if (gpiomtd->nce)
-			gpiod_set_value(gpiomtd->nce, !(ctrl & NAND_NCE));
-		gpiod_set_value(gpiomtd->cle, !!(ctrl & NAND_CLE));
-		gpiod_set_value(gpiomtd->ale, !!(ctrl & NAND_ALE));
-		gpio_nand_dosync(gpiomtd);
-	}
-	if (cmd == NAND_CMD_NONE)
-		return;
-
-	writeb(cmd, gpiomtd->nand_chip.legacy.IO_ADDR_W);
-	gpio_nand_dosync(gpiomtd);
-}
-
-static int gpio_nand_devready(struct nand_chip *chip)
-{
-	struct gpiomtd *gpiomtd = gpio_nand_getpriv(nand_to_mtd(chip));
-
-	return gpiod_get_value(gpiomtd->rdy);
-}
-
 static int gpio_nand_exec_instr(struct nand_chip *chip,
 				const struct nand_op_instr *instr)
 {
@@ -365,21 +337,14 @@ static int gpio_nand_probe(struct platform_device *pdev)
 		ret = PTR_ERR(gpiomtd->rdy);
 		goto out_ce;
 	}
-	/* Using RDY pin */
-	if (gpiomtd->rdy)
-		chip->legacy.dev_ready = gpio_nand_devready;
 
 	nand_controller_init(&gpiomtd->base);
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
-	chip->legacy.IO_ADDR_R	= gpiomtd->io;
-	chip->legacy.IO_ADDR_W	= chip->legacy.IO_ADDR_R;
 	chip->ecc.mode		= NAND_ECC_SOFT;
 	chip->ecc.algo		= NAND_ECC_HAMMING;
 	chip->options		= gpiomtd->plat.options;
-	chip->legacy.chip_delay	= gpiomtd->plat.chip_delay;
-	chip->legacy.cmd_ctrl	= gpio_nand_cmd_ctrl;
 	chip->controller	= &gpiomtd->base;
 
 	mtd			= nand_to_mtd(chip);
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
