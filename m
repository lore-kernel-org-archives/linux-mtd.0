Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA99C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 17:19:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52FAA218D0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 17:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dUDOy1In";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="BY+euD8J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52FAA218D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=Vt+c3G2oX8pqK/DxWMWbklsgaU5y+Zhx3CCX+wwJ7+c=; b=dUD
	Oy1InSY0dC1qS3YxG08+7gBCum1TzniUtPnaw01OzSQcGjI8aQjcAcHTu8Rn4oIwOxeBaG2yKwGN+
	mN/nDAAuYQdOrHATARPGJ7spc9JywOUjKxlZ+8PQ04jR0aobuG5zHVDRhiLJ1wzoRyvVtH3j6przV
	frEjfmk4/ShhLakxsz0gKIt5cV9I291RX+JcZTIbmi6VuzuYGSlj+kuVKgZCZKYKhg+ZySJqkZGxj
	0AqokIquaUeIKsLZ4Tp8LotcJvAW2lR/cMqsxfg0bxwV2onPYyM0evo39sw28NpIHLUL8vTSwV79a
	LfvUbnyyaGXJK23fOsEAn84MSh4vJoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4qUs-0003Dg-Ni; Fri, 15 Mar 2019 17:19:54 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4qUg-00033q-BQ; Fri, 15 Mar 2019 17:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YasJb9Hm7d92E6b0vwVihsgJvFEIP72f+5mowRHbS5c=; b=BY+euD8Jq4V2
 bd+ytk/dmRcS8FwYOBtJwgiD/LH8i5TE7AQPHAip9hfRBYDuqtpzD+WRWobEcM5F9xqhd//cVdfO9
 fiwYTGEE608lMKEeKK481JlSsL2ZebVUcZJibE0B04ayw5KZov43nG8MXybiMnrPvMAxqLyfnDlSc
 uCzn4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1h4qUZ-0002fD-6N; Fri, 15 Mar 2019 17:19:35 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 8C7B61126E81; Fri, 15 Mar 2019 17:19:34 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Ludovic Barre <ludovic.barre@st.com>
Subject: Applied "spi: spi-mem: stm32-qspi: add suspend/resume support" to the
 spi tree
In-Reply-To: <1552050741-27739-3-git-send-email-ludovic.Barre@st.com>
X-Patchwork-Hint: ignore
Message-Id: <20190315171934.8C7B61126E81@debutante.sirena.org.uk>
Date: Fri, 15 Mar 2019 17:19:34 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_101942_539357_A43719CC 
X-CRM114-Status: GOOD (  15.54  )
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
Cc: devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The patch

   spi: spi-mem: stm32-qspi: add suspend/resume support

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

From 2e541b64ee5269278fde5c87953a9963a8219ed4 Mon Sep 17 00:00:00 2001
From: Ludovic Barre <ludovic.barre@st.com>
Date: Fri, 8 Mar 2019 14:12:21 +0100
Subject: [PATCH] spi: spi-mem: stm32-qspi: add suspend/resume support

This patch adds suspend and resume support for spi-stm32-qspi
drivers.

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-stm32-qspi.c | 39 ++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
index 7354f9d68dba..3e8ca10011cc 100644
--- a/drivers/spi/spi-stm32-qspi.c
+++ b/drivers/spi/spi-stm32-qspi.c
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/sizes.h>
@@ -101,6 +102,9 @@ struct stm32_qspi {
 	struct completion data_completion;
 	u32 fmode;
 
+	u32 cr_reg;
+	u32 dcr_reg;
+
 	/*
 	 * to protect device configuration, could be different between
 	 * 2 flash access (bk1, bk2)
@@ -355,7 +359,7 @@ static int stm32_qspi_setup(struct spi_device *spi)
 	struct spi_controller *ctrl = spi->master;
 	struct stm32_qspi *qspi = spi_controller_get_devdata(ctrl);
 	struct stm32_qspi_flash *flash;
-	u32 cr, presc;
+	u32 presc;
 
 	if (ctrl->busy)
 		return -EBUSY;
@@ -371,11 +375,12 @@ static int stm32_qspi_setup(struct spi_device *spi)
 	flash->presc = presc;
 
 	mutex_lock(&qspi->lock);
-	cr = FIELD_PREP(CR_FTHRES_MASK, 3) | CR_SSHIFT | CR_EN;
-	writel_relaxed(cr, qspi->io_base + QSPI_CR);
+	qspi->cr_reg = FIELD_PREP(CR_FTHRES_MASK, 3) | CR_SSHIFT | CR_EN;
+	writel_relaxed(qspi->cr_reg, qspi->io_base + QSPI_CR);
 
 	/* set dcr fsize to max address */
-	writel_relaxed(DCR_FSIZE_MASK, qspi->io_base + QSPI_DCR);
+	qspi->dcr_reg = DCR_FSIZE_MASK;
+	writel_relaxed(qspi->dcr_reg, qspi->io_base + QSPI_DCR);
 	mutex_unlock(&qspi->lock);
 
 	return 0;
@@ -489,6 +494,31 @@ static int stm32_qspi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused stm32_qspi_suspend(struct device *dev)
+{
+	struct stm32_qspi *qspi = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(qspi->clk);
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int __maybe_unused stm32_qspi_resume(struct device *dev)
+{
+	struct stm32_qspi *qspi = dev_get_drvdata(dev);
+
+	pinctrl_pm_select_default_state(dev);
+	clk_prepare_enable(qspi->clk);
+
+	writel_relaxed(qspi->cr_reg, qspi->io_base + QSPI_CR);
+	writel_relaxed(qspi->dcr_reg, qspi->io_base + QSPI_DCR);
+
+	return 0;
+}
+
+SIMPLE_DEV_PM_OPS(stm32_qspi_pm_ops, stm32_qspi_suspend, stm32_qspi_resume);
+
 static const struct of_device_id stm32_qspi_match[] = {
 	{.compatible = "st,stm32f469-qspi"},
 	{}
@@ -501,6 +531,7 @@ static struct platform_driver stm32_qspi_driver = {
 	.driver	= {
 		.name = "stm32-qspi",
 		.of_match_table = stm32_qspi_match,
+		.pm = &stm32_qspi_pm_ops,
 	},
 };
 module_platform_driver(stm32_qspi_driver);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
