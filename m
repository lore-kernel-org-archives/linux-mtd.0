Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1483C10F13
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 16:51:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 939EB20880
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 16:51:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SdtYgxWu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6EglcSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 939EB20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QDFhUvSZHTmT+8x09o4BeeOSiZ3ddOn7nYrBEd6+2TM=; b=SdtYgxWu3dtFK7
	wdV6ge/JiGIjcP4V5X7ezAfIdoWCSqBjMpPcwpik9O05jMvS90IPAQPnfk7NkMGwU6AL7PIcUxt8F
	BDi2GyNK1Xc6sGN8xBEIYNyamHdrSoXiSs1xbBIfW8WF5cF/Qdu2ZiaVeQyI0dC4aju2Q8iEg5FbA
	Dkkvty6DlezzGkogmKGSaMtcZpYo1zVq6Fv26OO9fKGo7vBfjjdnZP1QBV0RUH8MGRjX0VIppTJMP
	ZDMaP5xMU86oNKylP8k+bqZrqt6Pi4g2jgTZb9nCiKzZxt9BH97WRy7McW0ysw+oJxTmDm5wxzens
	X2j+YRWIrJqLn4Y0hHOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDXU4-0001sr-9l; Mon, 08 Apr 2019 16:51:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDXU0-0001rA-79
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 16:50:58 +0000
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com
 [70.114.128.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8948920880;
 Mon,  8 Apr 2019 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554742255;
 bh=pHC/AwkjOPNisFX3IuXHq91c+27lrqDTnL/1cap6HOM=;
 h=From:To:Cc:Subject:Date:From;
 b=u6EglcSfxklpNii9D2siCrz7B03R9a17JmwVO8588RS+J5z8n3sD7lfv5YaY8OJI5
 uYlcBNXiSQAs7ctD3DyJ/SxrtqFPiONqOYwGNKyVOILXUi4zNc5AgfG3KdHQyFI2Ab
 rkSsjxxkdNpPj+fDbQig15bUNzMG9zeApmcpQUos=
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: cadence-quadspi: add reset control
Date: Mon,  8 Apr 2019 11:50:46 -0500
Message-Id: <20190408165046.24310-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_095056_282089_153BD025 
X-CRM114-Status: GOOD (  10.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marex@denx.de, Tien-Fong Chee <tien.fong.chee@intel.com>,
 bbrezillon@kernel.org, tudor.ambarus@microchip.com,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Get the reset control for the QSPI controller and bring it out of reset.

Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 792628750eec..710a853f9d13 100644
--- a/drivers/mtd/spi-nor/cadence-quadspi.c
+++ b/drivers/mtd/spi-nor/cadence-quadspi.c
@@ -34,6 +34,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/sched.h>
 #include <linux/spi/spi.h>
 #include <linux/timer.h>
@@ -1336,6 +1337,7 @@ static int cqspi_probe(struct platform_device *pdev)
 	struct cqspi_st *cqspi;
 	struct resource *res;
 	struct resource *res_ahb;
+	struct reset_control *rstc;
 	const struct cqspi_driver_platdata *ddata;
 	int ret;
 	int irq;
@@ -1362,6 +1364,14 @@ static int cqspi_probe(struct platform_device *pdev)
 		return PTR_ERR(cqspi->clk);
 	}
 
+	/* Obtain QSPI reset control */
+	rstc = devm_reset_control_get_exclusive(dev, NULL);
+	if (!IS_ERR(rstc)) {
+		reset_control_assert(rstc);
+		udelay(1);
+		reset_control_deassert(rstc);
+	}
+
 	/* Obtain and remap controller address. */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	cqspi->iobase = devm_ioremap_resource(dev, res);
-- 
2.20.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
