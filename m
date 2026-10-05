Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121B9CA5FFC
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 08:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qcQ2yqQW+vRpRoPZit+BRWirYFrpu6JyTLZJewN6FQ=; b=VrjQ5CU+G9+UOj
	il/2sOC3a3Bm0xZN2uo50mXJOENhA1X4TR5Xu7iKTL0cUUJB7Y3W8zv5PidsR32hJGEmPno69PsCB
	30YTPdQLE4xbbuH9Ii5SMEugbYT0M93leCaluOaq/AOcQt7qQbF6YzN9xwVxA48c9Qfdwohiu6P/J
	fA+Xyg8Q2mvT2WRLx4F6LdK+XFXjC6QvVEe2Ok/SlWke8+nq2mX/TVPyVO24lR6WSVVtVf5tb4BAQ
	MeICPwIoFqWzRzZjQD6e0xz/ApNmjYoyzojF8bwb4r0vb9KqWxlRV9Ds9tsVILTM7oi1PXrsDGRV8
	Edn00smdUHv6tcKK9+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdoI-0000000FqlY-3YEe;
	Mon, 05 Oct 2026 08:12:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdoF-0000000FqjX-1ZTo
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 08:12:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E16501A10DE;
	Mon,  5 Oct 2026 08:12:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6EFA604FE;
	Mon,  5 Oct 2026 08:12:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0451103306F7;
	Mon,  5 Oct 2026 10:12:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791187948; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=U6QL65H8I16JQp4vzHrSCIrRwP4W1C0oM5+bneLh3Z4=;
	b=lqstMYD92u7sl4Xh+jVAF3OoD/iMp18+ubKQH8zw2DQ4+jsgtPHC4d77I0BCAXc60RVX9d
	4/LdXmwUpwYIHUYP3U+pFE2LxzdjOdDdvgPRdPY8wNUtMLLuXQ9pziSrlgldcZP9p0HLvt
	hQtlBQGlVMD4a1Uujfj+Bj7cfPBjVFn6eyfRz295QduhsCbqzTOsL9f26uxkHPxNsqFFDO
	7gBRbupdhItSxQowO1N7/xg8DcAs+PYqPxtRPwKTY8qwHlvUe9MqhYdTXypf5hWxEYgTzD
	Xy7MSWHqmHKiDXW5SXbpgImT9QhF7aTwqeTlkD0UF//l0ufCZuJLlPhWcsmm3g==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH 3/5] spi: cadence-xspi: Add irq-less support
Date: Mon,  5 Oct 2026 10:11:38 +0200
Message-ID: <20261005081141.33688-4-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005081141.33688-1-paul.cercueil@bootlin.com>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_011231_560170_CC8E8FAE 
X-CRM114-Status: GOOD (  14.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tanmay Jagdale <tanmay@marvell.com>

Make the interrupt line optional. If not provided, the driver will
instead resort to polling registers.

This can be useful in itself, but will be used later to support write on
kernel panic.

Note the cdns_xspi_is_{sdma,stig}_ready() seem to have moved for no
reason; they were actually moved out of a conditional compilation block
(#ifdef CONFIG_64BIT), as they are needed in conf-independent paths now.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---
 drivers/spi/spi-cadence-xspi.c | 85 +++++++++++++++++++---------------
 1 file changed, 48 insertions(+), 37 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 39c868a5b171..7cf52bcb05df 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -365,6 +365,30 @@ static int cdns_xspi_wait_for_controller_idle(struct cdns_xspi_dev *cdns_xspi)
 					  100, 1000);
 }
 
+static bool cdns_xspi_is_stig_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
+{
+	u32 ctrl_stat;
+
+	return !readl_relaxed_poll_timeout
+		(cdns_xspi->iobase + CDNS_XSPI_CTRL_STATUS_REG,
+		ctrl_stat,
+		((ctrl_stat & BIT(3)) == 0),
+		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
+		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
+}
+
+static bool cdns_xspi_is_sdma_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
+{
+	u32 ctrl_stat;
+
+	return !readl_relaxed_poll_timeout
+		(cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG,
+		ctrl_stat,
+		(ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
+		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
+		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
+}
+
 static void cdns_xspi_trigger_command(struct cdns_xspi_dev *cdns_xspi,
 				      u32 cmd_regs[6])
 {
@@ -562,16 +586,25 @@ static int cdns_xspi_send_stig_command(struct cdns_xspi_dev *cdns_xspi,
 
 		cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
 
-		wait_for_completion(&cdns_xspi->sdma_complete);
-		if (cdns_xspi->sdma_error) {
-			cdns_xspi->set_interrupts_handler(cdns_xspi, false);
+		if (cdns_xspi->irq >= 0) {
+			wait_for_completion(&cdns_xspi->sdma_complete);
+			if (cdns_xspi->sdma_error) {
+				cdns_xspi->set_interrupts_handler(cdns_xspi, false);
+				return -EIO;
+			}
+		} else if (!cdns_xspi_is_sdma_ready(cdns_xspi, true)) {
 			return -EIO;
 		}
+
 		cdns_xspi->sdma_handler(cdns_xspi);
 	}
 
-	wait_for_completion(&cdns_xspi->cmd_complete);
-	cdns_xspi->set_interrupts_handler(cdns_xspi, false);
+	if (cdns_xspi->irq >= 0) {
+		wait_for_completion(&cdns_xspi->cmd_complete);
+		cdns_xspi->set_interrupts_handler(cdns_xspi, false);
+	} else if (!cdns_xspi_is_stig_ready(cdns_xspi, true)) {
+		return -EIO;
+	}
 
 	cmd_status = cdns_xspi_check_command_status(cdns_xspi);
 	if (cmd_status)
@@ -1052,30 +1085,6 @@ static int cdns_xspi_prepare_transfer(int cs, int dir, int len, u32 *cmd_regs)
 	return 0;
 }
 
-static bool cdns_xspi_is_stig_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
-{
-	u32 ctrl_stat;
-
-	return !readl_relaxed_poll_timeout
-		(cdns_xspi->iobase + CDNS_XSPI_CTRL_STATUS_REG,
-		ctrl_stat,
-		((ctrl_stat & BIT(3)) == 0),
-		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
-		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
-}
-
-static bool cdns_xspi_is_sdma_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
-{
-	u32 ctrl_stat;
-
-	return !readl_relaxed_poll_timeout
-		(cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG,
-		ctrl_stat,
-		(ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
-		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
-		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
-}
-
 static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
 					   struct spi_message *m)
 {
@@ -1268,15 +1277,17 @@ static int cdns_xspi_probe(struct platform_device *pdev)
 	}
 #endif
 
-	cdns_xspi->irq = platform_get_irq(pdev, 0);
-	if (cdns_xspi->irq < 0)
-		return -ENXIO;
+	cdns_xspi->irq = platform_get_irq_optional(pdev, 0);
+	if (cdns_xspi->irq < 0 && cdns_xspi->irq != -ENXIO)
+		return cdns_xspi->irq;
 
-	ret = devm_request_irq(dev, cdns_xspi->irq, cdns_xspi_irq_handler,
-			       IRQF_SHARED, pdev->name, cdns_xspi);
-	if (ret) {
-		dev_err(dev, "Failed to request IRQ: %d\n", cdns_xspi->irq);
-		return ret;
+	if (cdns_xspi->irq >= 0) {
+		ret = devm_request_irq(dev, cdns_xspi->irq, cdns_xspi_irq_handler,
+				       IRQF_SHARED, pdev->name, cdns_xspi);
+		if (ret) {
+			dev_err(dev, "Failed to request IRQ: %d\n", cdns_xspi->irq);
+			return ret;
+		}
 	}
 
 #ifdef CONFIG_64BIT
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
