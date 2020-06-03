Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCB0C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA5BA206A2
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 13:51:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uXZwN+wp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA5BA206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVOncYfc/8uxxZ/nV9InskB5uxzoYQ6/e9OsMT5yhbw=; b=uXZwN+wpU+J7c9
	+Bvi9NvQDbGTJx0u1lw4G25T210F2n49sNdiCYqTskmE83Ysm+cptp42ZRUUh+yTzAfHq9XGMQSBC
	nMehCqwxBfbgOlFRUjhNEwl9qv2O8/iA1B/C9vP89LRMlPMhmSTYWKQTYoGVy66Y38Jv3To29R8gC
	5iyqnRTl3Y3JOZM874z3IFveFkoHzFD+k1p55ESwbsC+TyCZJ9BqjtNRHxVYOfrXQgbsCNvDYxwry
	IPMq4TIXpG8jAHeMDvVPVHeudyr3MrUFVpauxE+0KB1tcWOVy7bNPO9U7j1PiSS/Iw8FOhG6k3m2v
	PptwqedL3NsYZuhxWWlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTnT-0005ZE-QP; Wed, 03 Jun 2020 13:51:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTlq-0001jm-C1
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 13:49:33 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D1C272A3D70;
 Wed,  3 Jun 2020 14:49:27 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Anton Vorontsov <anton@enomsg.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 05/10] mtd: rawnand: fsl_upm: Use platform_get_resource() +
 devm_ioremap_resource()
Date: Wed,  3 Jun 2020 15:49:17 +0200
Message-Id: <20200603134922.1352340-6-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200603134922.1352340-1-boris.brezillon@collabora.com>
References: <20200603134922.1352340-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_064930_576857_8F4AEC4E 
X-CRM114-Status: GOOD (  12.37  )
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

Replace the of_address_to_resource() + devm_ioremap() calls by
platform_get_resource() + devm_ioremap_resource() ones which allows us
to get rid of one error message since devm_ioremap_resource() already
takes care of that.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/raw/fsl_upm.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_upm.c b/drivers/mtd/nand/raw/fsl_upm.c
index a3e3a968891d..54851e9ea784 100644
--- a/drivers/mtd/nand/raw/fsl_upm.c
+++ b/drivers/mtd/nand/raw/fsl_upm.c
@@ -14,7 +14,6 @@
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/mtd.h>
-#include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/io.h>
@@ -197,7 +196,7 @@ static int fun_chip_init(struct fsl_upm_nand *fun,
 static int fun_probe(struct platform_device *ofdev)
 {
 	struct fsl_upm_nand *fun;
-	struct resource io_res;
+	struct resource *io_res;
 	const __be32 *prop;
 	int rnb_gpio;
 	int ret;
@@ -208,13 +207,12 @@ static int fun_probe(struct platform_device *ofdev)
 	if (!fun)
 		return -ENOMEM;
 
-	ret = of_address_to_resource(ofdev->dev.of_node, 0, &io_res);
-	if (ret) {
-		dev_err(&ofdev->dev, "can't get IO base\n");
-		return ret;
-	}
+	io_res = platform_get_resource(ofdev, IORESOURCE_MEM, 0);
+	fun->io_base = devm_ioremap_resource(&ofdev->dev, io_res);
+	if (IS_ERR(fun->io_base))
+		return PTR_ERR(fun->io_base);
 
-	ret = fsl_upm_find(io_res.start, &fun->upm);
+	ret = fsl_upm_find(io_res->start, &fun->upm);
 	if (ret) {
 		dev_err(&ofdev->dev, "can't find UPM\n");
 		return ret;
@@ -280,17 +278,10 @@ static int fun_probe(struct platform_device *ofdev)
 		fun->wait_flags = FSL_UPM_WAIT_RUN_PATTERN |
 				  FSL_UPM_WAIT_WRITE_BYTE;
 
-	fun->io_base = devm_ioremap(&ofdev->dev, io_res.start,
-					    resource_size(&io_res));
-	if (!fun->io_base) {
-		ret = -ENOMEM;
-		goto err2;
-	}
-
 	fun->dev = &ofdev->dev;
 	fun->last_ctrl = NAND_CLE;
 
-	ret = fun_chip_init(fun, ofdev->dev.of_node, &io_res);
+	ret = fun_chip_init(fun, ofdev->dev.of_node, io_res);
 	if (ret)
 		goto err2;
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
