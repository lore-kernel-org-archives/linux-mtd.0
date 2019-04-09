Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17999C10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 15:38:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D901F2133D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 15:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NcWgMEZx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfILR6dY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D901F2133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bu4hkS4sV4yAXyi7w2mIoQAEA4f5WIiG5r05aUL8IKQ=; b=NcWgMEZxMcmrnp
	Sjk9RAWjLVk/2uQxJKSySmWo6wvKXEt9y+y5tJ4H4XdHZznSzJYCHD1aIU3YcGmMc2NCBPNLqZosB
	WgctOevi2qgTg5PrOIT963jlRizc4qBaS38S1hgvbUBD97E3EJyvjtOi9mukbct9Q9nfGRu27dlVF
	tXoq6nx1s/3ttkp1ErREGTED0dIIyvUYoAtYL6kJfcKF2O2HRtUIdxzbCYGeZlk5b5NsuQsmCBWP3
	6gZx/6pRZopGRYkTRoDMZgdZlXNxNmEDiyoTe7zZ8ksJZDpfiodklYYeMk4vW86KTSuxSaPeyXPdy
	4+x4Q2Ikw7pnIY1yS3Tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDspE-00050z-PV; Tue, 09 Apr 2019 15:38:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDspB-00050A-MZ
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 15:38:14 +0000
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com
 [70.114.128.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DCF320883;
 Tue,  9 Apr 2019 15:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554824292;
 bh=n3oVS0RGbjjZsrRYWn3vaYYlmTt0k55e3PTjUh0A4Dg=;
 h=From:To:Cc:Subject:Date:From;
 b=lfILR6dYprpWXuEMrFtFDySwJdS/HYg1K5by6jxyCu2SKbpXdzElpUCTXq8cccvrX
 1DZ9MU8rYb1xMqZQGDHbz2IJ7X5258nEnzg8sAnxDzM/XvnKrgLaPsoScBomRAILbu
 FAnu6GQUIIqHQvrj1T2C7Yq62NRx55ebtm7I7/Z0=
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2] mtd: spi-nor: cadence-quadspi: add reset control
Date: Tue,  9 Apr 2019 10:38:01 -0500
Message-Id: <20190409153801.6941-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_083813_753985_A9EB2830 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
Cc: marex@denx.de, Tien-Fong Chee <tien.fong.chee@intel.com>, vigneshr@ti.com,
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
v2: use devm_reset_control_get_optional_exclusive
    print an error message
    return -EPROBE_DEFER
---
 drivers/mtd/spi-nor/cadence-quadspi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
index 792628750eec..c548567adcf0 100644
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
@@ -1362,6 +1364,18 @@ static int cqspi_probe(struct platform_device *pdev)
 		return PTR_ERR(cqspi->clk);
 	}
 
+	/* Obtain QSPI reset control */
+	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(rstc)) {
+		dev_err(dev, "Cannot get QSPI reset.\n");
+		if (PTR_ERR(rstc) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	} else {
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
