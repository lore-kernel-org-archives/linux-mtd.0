Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E479AC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 15:08:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E2B0206E6
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 15:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gsvxjyBe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E2B0206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e06XHpds9rkwAcFTXnRLm+THWefPeZS4FsWx59fhjxk=; b=gsvxjyBeeTe2pO
	oRkELQ+JiSyCJTyQBY2tqafdnghQmR4lPc0laGy1157LmPEdoj6jlh0oIyUmEeFBuCpUyDkquX5pE
	TVmH5i0sRLViD9mNz8vZXv2hxaRm7+DTefMAeJIGlzEnbZ2Rayzusv3+CJ/IP1uanRg20s8XgX67A
	4udCsZIVNnI0HFK8sCKj0hnoExDBY6q2f60bMkP1fRYhQ+v8fuD3ibEfaPgf82Z+CxTJkzoLZ0a9m
	PgN/6jcIg6S+sOZN0fgUW/1EPt/Uf0p12PaLgbDfjdJwciMkrTf7ixNjUhzQXA9TARxd7xIAN/9Lk
	y5PEwCrFzGCOByZa401w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgUzm-0006Cp-3f; Wed, 03 Jun 2020 15:07:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgUzi-0006AJ-KR
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 15:07:56 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B27202A3A8A;
 Wed,  3 Jun 2020 16:07:52 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 1/3] mtd: rawnand: gpio: Inherit from nand_controller
Date: Wed,  3 Jun 2020 17:07:44 +0200
Message-Id: <20200603150746.1423257-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603150746.1423257-1-boris.brezillon@collabora.com>
References: <20200603150746.1423257-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_080754_799861_0878DFC1 
X-CRM114-Status: GOOD (  11.52  )
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

Inherit from nand_controller so we don't rely on the
nand_chip.legacy.dummy_controller field.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/gpio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 938077e5c6a9..33828fb20a13 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -27,6 +27,7 @@
 #include <linux/of_address.h>
 
 struct gpiomtd {
+	struct nand_controller	base;
 	void __iomem		*io_sync;
 	struct nand_chip	nand_chip;
 	struct gpio_nand_platdata plat;
@@ -273,6 +274,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (gpiomtd->rdy)
 		chip->legacy.dev_ready = gpio_nand_devready;
 
+	nand_controller_init(&gpiomtd->base);
 	nand_set_flash_node(chip, pdev->dev.of_node);
 	chip->legacy.IO_ADDR_W	= chip->legacy.IO_ADDR_R;
 	chip->ecc.mode		= NAND_ECC_SOFT;
@@ -280,6 +282,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	chip->options		= gpiomtd->plat.options;
 	chip->legacy.chip_delay	= gpiomtd->plat.chip_delay;
 	chip->legacy.cmd_ctrl	= gpio_nand_cmd_ctrl;
+	chip->controller	= &gpiomtd->base;
 
 	mtd			= nand_to_mtd(chip);
 	mtd->dev.parent		= dev;
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
