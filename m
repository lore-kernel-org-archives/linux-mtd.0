Return-Path: <SRS0=IJeB=HA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30DAC433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:16:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70BDC64E06
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jan 2021 08:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70BDC64E06
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSV4aWGu7vFPFbQ3kG2sqWB/OaByQU9f/2HMIhZLi4w=; b=IGRow7+WtkSldzu0am+sXRCSG9
	bykLETjdo/gwU63D7fkkSAYLffcwGCNhqhS4wDoYTQ2B18cJCZnvHKZkboXLAb40mFWgJgpTKk0ym
	PNJVtK9n1wbQ6jNV+Fn4JZTmubKgpNerHryZ59eaeUkau54gcAvYI/PxwfYqrQ3bfRQAEs5q5A2bh
	9MAm6UMhMJZSrY+k+FYkjoPXJSkrDoG64XaXcGopYY1VzG04vGlx8WOxnnmL3u97pYdTvoUt2c+js
	N8f5LbvQKnFiLbGgig1MQ/NC+RZBbpGGPi/LC2k8zNMd8TKKddaXNZiNJomF5xCQMuHhP2elnivp3
	SERUGxaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5OwY-0002Cy-J8; Fri, 29 Jan 2021 08:15:50 +0000
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5OwR-00029j-8t
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2021 08:15:44 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG4.macronix.com with ESMTP id 10T8FEbD076586;
 Fri, 29 Jan 2021 16:15:18 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: zhengxunli <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Subject: [PATCH 3/3] spi: mxic: add maximum speed of spi host
Date: Fri, 29 Jan 2021 16:13:38 +0800
Message-Id: <1611908018-29937-4-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
References: <1611908018-29937-1-git-send-email-zhengxunli@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com 10T8FEbD076586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_031543_725282_0F00332B 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 zhengxunli <zhengxunli@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the maximum speed of the host to avoid over-speed
operation of the device.

Signed-off-by: zhengxunli <zhengxunli@mxic.com.tw>
---
 Documentation/devicetree/bindings/spi/spi-mxic.txt | 4 ++++
 drivers/spi/spi-mxic.c                             | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-mxic.txt b/Documentation/devicetree/bindings/spi/spi-mxic.txt
index 529f2da..ff6937c 100644
--- a/Documentation/devicetree/bindings/spi/spi-mxic.txt
+++ b/Documentation/devicetree/bindings/spi/spi-mxic.txt
@@ -13,6 +13,9 @@ Required properties:
 - clocks: should contain 3 entries for the "ps_clk", "send_clk" and
 	  "send_dly_clk" clocks
 
+Recommended properties:
+- spi-max-frequency: Maximum SPI clocking speed of the device in Hz.
+
 Example:
 
 	spi@43c30000 {
@@ -21,6 +24,7 @@ Example:
 		reg-names = "regs", "dirmap";
 		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 18>;
 		clock-names = "send_clk", "send_dly_clk", "ps_clk";
+		spi-max-frequency = <200000000>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 821328a..7786d33 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
@@ -536,7 +537,9 @@ static int mxic_spi_probe(struct platform_device *pdev)
 {
 	struct spi_master *master;
 	struct resource *res;
+	struct device_node *np = pdev->dev.of_node;
 	struct mxic_spi *mxic;
+	u32 max_freq;
 	int ret;
 
 	master = devm_spi_alloc_master(&pdev->dev, sizeof(struct mxic_spi));
@@ -580,6 +583,10 @@ static int mxic_spi_probe(struct platform_device *pdev)
 			SPI_RX_QUAD | SPI_TX_QUAD |
 			SPI_RX_OCTAL | SPI_TX_OCTAL;
 
+	if (of_property_read_u32(np, "spi-max-frequency",
+				 &master->max_speed_hz))
+		master->max_speed_hz = 25000000; /* 25MHz */
+
 	mxic_spi_hw_init(mxic);
 
 	ret = spi_register_master(master);
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
