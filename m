Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDD3C388F7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 229EA20797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0te0mbP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 229EA20797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CUmgMeBfBHrC04Lxe4Cxwy6G5Sr8UzD5a6g4NYmcysc=; b=b0te0mbPIhTYMdFf+IeSrD6My
	i/NKBYvq4IUFfCx+GHYeG82kgJwOs2Fb9GIsNAKG2i/2jBRBxyM/Yv+VnL9QohprisdBR/SKQ5sw5
	FUDjuRemwuK6Tenpa+JMCXiAiTIUIHIUV7C2S0QqDYyl4hZkVvHYtJ03Fy+AYVpWT0RlxA9WGZ5Yw
	TcYyLf7esI8mjAE8cUuaZ27z5tWEucW80c1wMFYciqbIPmfjxRk1ZnP3GuKHLLxh8HnAVCpa0UeTH
	mpQnhlfSR0aGgGw1c4oJ2FvsMSWlv+LcYbfxlYGhZc2D6EKEe1D1RwicI6QFxZFfArcZDBFWxZQ0o
	uin1TtY1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYI1-00087w-BX; Fri, 13 Nov 2020 12:34:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHe-0007xy-Sv
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:32 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D6D4AC000D;
 Fri, 13 Nov 2020 12:34:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/19] mtd: rawnand: gpio: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:06 +0100
Message-Id: <20201113123424.32233-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073431_088678_2ABD368B 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The probe function is only supposed to initialize the controller
hardware but not the ECC engine. Indeed, we don't know anything about
the NAND chip(s) at this stage. Let's move the logic initializing the
ECC engine, even pretty simple, to the ->attach_chip() hook which gets
called during nand_scan() routine, after the NAND chip discovery. As
the previously mentioned logic is supposed to parse the DT for us, it
is likely that the chip->ecc.* entries be overwritten. So let's avoid
this by moving these lines to ->attach_chip(), a NAND controller
hook.

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/mtd/nand/raw/gpio.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index 4ec0a1e10867..eb03b8cea1cb 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -161,8 +161,17 @@ static int gpio_nand_exec_op(struct nand_chip *chip,
 	return ret;
 }
 
+static int gpio_nand_attach_chip(struct nand_chip *chip)
+{
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+
+	return 0;
+}
+
 static const struct nand_controller_ops gpio_nand_ops = {
 	.exec_op = gpio_nand_exec_op,
+	.attach_chip = gpio_nand_attach_chip,
 };
 
 #ifdef CONFIG_OF
@@ -342,8 +351,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
-	chip->ecc.engine_type	= NAND_ECC_ENGINE_TYPE_SOFT;
-	chip->ecc.algo		= NAND_ECC_ALGO_HAMMING;
 	chip->options		= gpiomtd->plat.options;
 	chip->controller	= &gpiomtd->base;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
