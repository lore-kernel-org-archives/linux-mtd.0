Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B38C3F2D2
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 18:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54060246A8
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 18:25:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kjzR/OcJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54060246A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=9VVexgWYYNJ1+QO/zPP4A4B5OPzz6IFAIYRG1bW8bIY=; b=kjz
	R/OcJL63ol87Jl+91aHLAKjYEi05agM9fyZFVPVyzNHJ1mhvxO0M78Nrrfzi6Epc7oZ7cbPhfEMfr
	m7YP3j8gK5jIgfh1oL+XCZ29BiPwXKQy6439hXoJ+IioWUGeJOMSILE2BZr8IezioZVH9T06rOMH1
	uOlCv+Z0jezi0D2iXldgqkp2l3GPMHLL8v4ARHrbKyK9gAS27J8dcH+FaiHC3/yUYvRAzavXbv1TN
	I9XvngH6IRwtYTDkkWTemN7xINUl7Ly9N3ot8Rhr7f1LRo+uYHiFdu4UXdDabw3lvlc6s09QYYjpx
	aDZGrTI1YOi3oQrjH8YHh7uB4BZmstw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7kKL-0004yo-Vb; Fri, 28 Feb 2020 18:25:33 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7kKJ-0004yT-FY
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 18:25:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C84E7FEC;
 Fri, 28 Feb 2020 10:25:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B3703F7B4;
 Fri, 28 Feb 2020 10:25:30 -0800 (PST)
Date: Fri, 28 Feb 2020 18:25:28 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Applied "spi: HiSilicon v3xx: Use DMI quirk to set controller
 buswidth override bits" to the spi tree
In-Reply-To: <1582903131-160033-4-git-send-email-john.garry@huawei.com>
Message-Id: <applied-1582903131-160033-4-git-send-email-john.garry@huawei.com>
X-Patchwork-Hint: ignore
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_102531_609065_B04AFC98 
X-CRM114-Status: GOOD (  16.90  )
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
Cc: linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, andriy.shevchenko@linux.intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   spi: HiSilicon v3xx: Use DMI quirk to set controller buswidth override bits

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 34e608b023e96f51b31274435b49c8ae61e2389f Mon Sep 17 00:00:00 2001
From: John Garry <john.garry@huawei.com>
Date: Fri, 28 Feb 2020 23:18:51 +0800
Subject: [PATCH] spi: HiSilicon v3xx: Use DMI quirk to set controller buswidth
 override bits

The Huawei D06 board (and variants) can support Quad mode of operation.

Since we have no current method in ACPI SPI bus device resource description
to describe this information, use DMI to detect the board, and set the
controller buswidth override bits.

Signed-off-by: John Garry <john.garry@huawei.com>
Link: https://lore.kernel.org/r/1582903131-160033-4-git-send-email-john.garry@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-hisi-sfc-v3xx.c | 56 ++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-hisi-sfc-v3xx.c b/drivers/spi/spi-hisi-sfc-v3xx.c
index 45d906110ed1..e3b57252d075 100644
--- a/drivers/spi/spi-hisi-sfc-v3xx.c
+++ b/drivers/spi/spi-hisi-sfc-v3xx.c
@@ -7,6 +7,7 @@
 
 #include <linux/acpi.h>
 #include <linux/bitops.h>
+#include <linux/dmi.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -250,6 +251,44 @@ static const struct spi_controller_mem_ops hisi_sfc_v3xx_mem_ops = {
 	.exec_op = hisi_sfc_v3xx_exec_op,
 };
 
+static int hisi_sfc_v3xx_buswidth_override_bits;
+
+/*
+ * ACPI FW does not allow us to currently set the device buswidth, so quirk it
+ * depending on the board.
+ */
+static int __init hisi_sfc_v3xx_dmi_quirk(const struct dmi_system_id *d)
+{
+	hisi_sfc_v3xx_buswidth_override_bits = SPI_RX_QUAD | SPI_TX_QUAD;
+
+	return 0;
+}
+
+static const struct dmi_system_id hisi_sfc_v3xx_dmi_quirk_table[]  = {
+	{
+	.callback = hisi_sfc_v3xx_dmi_quirk,
+	.matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Huawei"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "D06"),
+	},
+	},
+	{
+	.callback = hisi_sfc_v3xx_dmi_quirk,
+	.matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Huawei"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "TaiShan 2280 V2"),
+	},
+	},
+	{
+	.callback = hisi_sfc_v3xx_dmi_quirk,
+	.matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Huawei"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "TaiShan 200 (Model 2280)"),
+	},
+	},
+	{}
+};
+
 static int hisi_sfc_v3xx_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -265,6 +304,8 @@ static int hisi_sfc_v3xx_probe(struct platform_device *pdev)
 	ctlr->mode_bits = SPI_RX_DUAL | SPI_RX_QUAD |
 			  SPI_TX_DUAL | SPI_TX_QUAD;
 
+	ctlr->buswidth_override_bits = hisi_sfc_v3xx_buswidth_override_bits;
+
 	host = spi_controller_get_devdata(ctlr);
 	host->dev = dev;
 
@@ -320,7 +361,20 @@ static struct platform_driver hisi_sfc_v3xx_spi_driver = {
 	.probe	= hisi_sfc_v3xx_probe,
 };
 
-module_platform_driver(hisi_sfc_v3xx_spi_driver);
+static int __init hisi_sfc_v3xx_spi_init(void)
+{
+	dmi_check_system(hisi_sfc_v3xx_dmi_quirk_table);
+
+	return platform_driver_register(&hisi_sfc_v3xx_spi_driver);
+}
+
+static void __exit hisi_sfc_v3xx_spi_exit(void)
+{
+	platform_driver_unregister(&hisi_sfc_v3xx_spi_driver);
+}
+
+module_init(hisi_sfc_v3xx_spi_init);
+module_exit(hisi_sfc_v3xx_spi_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("John Garry <john.garry@huawei.com>");
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
