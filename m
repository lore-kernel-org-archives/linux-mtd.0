Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAEFC388F7
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1A720797
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iRPD9web"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C1A720797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rp4ZqMDp3+1JgveUYufwNiuL68g7WGmeJuhfCTdxDis=; b=iRPD9webyus+Caa/J+0l3VluL
	mSmQYNm56AruEFBCd4tPRpDEyeOdL79dY2l6P6BtmGkGnxsDzeBNooWKRSl2pE3HUoziL/RgHWzpT
	aqRjI+TB0oS/VtaiEBSwIJMU87GxXOS4kjByc2A/L9eWVc2afSMxHumCByVMd2JkwxXobGZNpuahg
	xKKWuyzm0x5a0TUu9IBNUK+axTmLhpdO6xbh3SbeEFSjDgr72zEKP8CcdAqmQNAcpVG1f7wHrzLDI
	Ypu6pBMi/yCVoxt88Sg1T2cxfj/lCkVg9g5l7roiMIq2s63VdFkcetCxJw97iyxyz4T1ah1U0Hewk
	ofaOqo0yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYIX-0008Km-3U; Fri, 13 Nov 2020 12:35:25 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYHk-000824-Gg
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:34:37 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 00A41C0011;
 Fri, 13 Nov 2020 12:34:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/19] mtd: rawnand: orion: Move the ECC initialization to
 ->attach_chip()
Date: Fri, 13 Nov 2020 13:34:17 +0100
Message-Id: <20201113123424.32233-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201113123424.32233-1-miquel.raynal@bootlin.com>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073436_705550_E72FBF29 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
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
this by moving these lines to ->attach_chip().

Fixes: d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing bits")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index df9c0f8e4b4e..e3bb65fd3ab2 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -22,6 +22,7 @@
 #include <linux/platform_data/mtd-orion_nand.h>
 
 struct orion_nand_info {
+	struct nand_controller controller;
 	struct nand_chip chip;
 	struct clk *clk;
 };
@@ -82,6 +83,18 @@ static void orion_nand_read_buf(struct nand_chip *chip, uint8_t *buf, int len)
 		buf[i++] = readb(io_base);
 }
 
+static int orion_nand_attach_chip(struct nand_chip *chip)
+{
+	chip->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
+	chip->ecc.algo = NAND_ECC_ALGO_HAMMING;
+
+	return 0;
+}
+
+static const struct nand_controller_ops orion_nand_ops = {
+	.attach_chip = orion_nand_attach_chip,
+};
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -101,6 +114,10 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
+	nand_controller_init(&info->controller);
+	info->controller.ops = &orion_nand_ops;
+	nc->controller = &info->controller;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	io_base = devm_ioremap_resource(&pdev->dev, res);
 
@@ -139,8 +156,6 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	nc->legacy.IO_ADDR_R = nc->legacy.IO_ADDR_W = io_base;
 	nc->legacy.cmd_ctrl = orion_nand_cmd_ctrl;
 	nc->legacy.read_buf = orion_nand_read_buf;
-	nc->ecc.engine_type = NAND_ECC_ENGINE_TYPE_SOFT;
-	nc->ecc.algo = NAND_ECC_ALGO_HAMMING;
 
 	if (board->chip_delay)
 		nc->legacy.chip_delay = board->chip_delay;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
