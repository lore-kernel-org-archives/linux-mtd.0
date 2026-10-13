Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97D5CC6B08
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uzPOvg5+if5mm/pX0YTopEQlHZ+5/PivF604bT3BOI=; b=bdMr1/Lfkb3Fd+
	5CrgpAXRIUTazVrvPRKbqJ/c8GCQQKBVzaNEWN+QPifz0npRkLHQTsL39mO/HdLGL6Tw5NXaPQWo8
	udZPqDHvGLbof/Ag6u8ARmgIbqjLAIhxA3k0ZYi83A+eGYJ+QYWWf4DBqUwHXmsLvD+CU9LcMW59K
	ivIU5iB/1g0GVbZSkIfv3+mFROVX5rE4YeApQqHRF1NLY/bZG5+FOkCoWOJTeCOH+YRucF4cx7x0D
	ddN95M1ALAnxNtiDtIOE+3aneysI00sRTrzkU8Qo9qPy7THceHUpRCE3py3lbzr7PGgZH9+Kx+tx6
	oReYFbpMi10/FbKrgwYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdHg-0000000D3b9-0tXG;
	Tue, 13 Oct 2026 14:15:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdHc-0000000D3X7-2d1A
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:15:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78DFCC653ED;
	Tue, 13 Oct 2026 14:16:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E4DC460362;
	Tue, 13 Oct 2026 14:15:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10A9E11D7168A;
	Tue, 13 Oct 2026 16:15:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791900905; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DbMcF7nPUkKCE7tusReBZfg8Jor+3MFZ32JZ5UBeaTc=;
	b=K7vLtxSw7WHU+7LF6ztfUZu5RVuJdj/d4hk8HovUJ+V1lOfw9I6gTeQ992Oifnop3+mjm9
	ajqOTGGrI/73NIWnqnZJlPzEnWXyacPFjLFVDk2Y2ltrq2elCHmKiJI7t4oaVHNG/5mvOm
	Y241dQiWVDYc2eDspi3TslKjr+J7ZBlCEfRHevK1ngwiS8h7cGBEDOWhvywyiFtw4Ug22j
	YxhM3/tIx7e9cWdRvMe1qQzD343Q3r2Sgof3sLuqMudFkuo2cREeKJxDQJE4gTDoCnCfJ4
	Jto8uyykxicgejNXd79rJ3ZoLM8ER3sKhN6USWz1Syojxta2yaXgs1XYzTSC1g==
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
	Bharat Bhushan <bbhushan2@marvell.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 6/7] spi: cadence-xspi: Add support for panic writes
Date: Tue, 13 Oct 2026 16:13:49 +0200
Message-ID: <20261013141350.189996-7-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013141350.189996-1-paul.cercueil@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_071512_851582_27CAD389 
X-CRM114-Status: GOOD (  16.43  )
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

Advertise support for panic writes. When a memory op is received with
the 'panic' flag set, the driver will then work without relying on
interrupts and without sleeping.

Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

Notes:
    v2: - Don't enable interrupts if doing a panic write
        - Use a new cdns_readl_poll() macro that will resolve to calling
          readl_relaxed_poll_timeout_atomic() when doing a panic write, or
          readl_relaxed_poll_timeout() otherwise.
        - Drop cdns_xspi->panic_write. We don't actually need to check it in
          cdns_xspi_is_dll_locked(), because this code is never called in
          the kernel panic path.

 drivers/spi/spi-cadence-xspi.c | 53 ++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 185dffda54bb..6310d0aa2d21 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -287,6 +287,11 @@
 #define GENERIC_CMD_REG_3_NEEDED(len)		(len > 7)
 #define GENERIC_CMD_REG_2_NEEDED(len)		(len > 3)
 
+
+#define cdns_readl_poll(addr, val, cond, delay_us, timeout_us, can_sleep) \
+	((can_sleep) ? readl_relaxed_poll_timeout(addr, val, cond, delay_us, timeout_us) \
+		     : readl_relaxed_poll_timeout_atomic(addr, val, cond, delay_us, timeout_us))
+
 enum cdns_xspi_stig_instr_type {
 	CDNS_XSPI_STIG_INSTR_TYPE_0,
 	CDNS_XSPI_STIG_INSTR_TYPE_1,
@@ -353,40 +358,33 @@ struct cdns_xspi_dev {
 	int current_xfer_qword;
 };
 
-static int cdns_xspi_wait_for_controller_idle(struct cdns_xspi_dev *cdns_xspi)
+static int cdns_xspi_wait_for_controller_idle(struct cdns_xspi_dev *cdns_xspi, bool sleep)
 {
 	u32 ctrl_stat;
 
-	return readl_relaxed_poll_timeout(cdns_xspi->iobase +
-					  CDNS_XSPI_CTRL_STATUS_REG,
-					  ctrl_stat,
-					  ((ctrl_stat &
-					    CDNS_XSPI_CTRL_BUSY) == 0),
-					  100, 1000);
+	return cdns_readl_poll(cdns_xspi->iobase + CDNS_XSPI_CTRL_STATUS_REG,
+			       ctrl_stat, !(ctrl_stat & CDNS_XSPI_CTRL_BUSY),
+			       100, 1000, sleep);
 }
 
 static bool cdns_xspi_is_stig_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
 {
 	u32 ctrl_stat;
 
-	return !readl_relaxed_poll_timeout
-		(cdns_xspi->iobase + CDNS_XSPI_CTRL_STATUS_REG,
-		ctrl_stat,
-		((ctrl_stat & BIT(3)) == 0),
-		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
-		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
+	return !cdns_readl_poll(cdns_xspi->iobase + CDNS_XSPI_CTRL_STATUS_REG,
+				ctrl_stat, !(ctrl_stat & BIT(3)),
+				MRVL_XSPI_POLL_DELAY_US,
+				MRVL_XSPI_POLL_TIMEOUT_US, sleep);
 }
 
 static bool cdns_xspi_is_sdma_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
 {
 	u32 ctrl_stat;
 
-	if (readl_relaxed_poll_timeout
-	    (cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG,
-	     ctrl_stat,
-	     (ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
-	     sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
-	     sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0)) {
+	if (cdns_readl_poll(cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG,
+			    ctrl_stat, (ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
+			    MRVL_XSPI_POLL_DELAY_US, MRVL_XSPI_POLL_TIMEOUT_US,
+			    sleep)) {
 		return false;
 	}
 
@@ -558,14 +556,14 @@ static int cdns_xspi_send_stig_command(struct cdns_xspi_dev *cdns_xspi,
 	int ret;
 	int dummybytes = op->dummy.nbytes;
 
-	ret = cdns_xspi_wait_for_controller_idle(cdns_xspi);
+	ret = cdns_xspi_wait_for_controller_idle(cdns_xspi, !op->panic_write);
 	if (ret < 0)
 		return -EIO;
 
 	writel(FIELD_PREP(CDNS_XSPI_CTRL_WORK_MODE, CDNS_XSPI_WORK_MODE_STIG),
 	       cdns_xspi->iobase + CDNS_XSPI_CTRL_CONFIG_REG);
 
-	if (cdns_xspi->irq >= 0)
+	if (cdns_xspi->irq >= 0 && !op->panic_write)
 		cdns_xspi->set_interrupts_handler(cdns_xspi, true);
 	cdns_xspi->sdma_error = false;
 
@@ -596,23 +594,23 @@ static int cdns_xspi_send_stig_command(struct cdns_xspi_dev *cdns_xspi,
 
 		cdns_xspi_trigger_command(cdns_xspi, cmd_regs);
 
-		if (cdns_xspi->irq >= 0) {
+		if (cdns_xspi->irq >= 0 && !op->panic_write) {
 			wait_for_completion(&cdns_xspi->sdma_complete);
 			if (cdns_xspi->sdma_error) {
 				cdns_xspi->set_interrupts_handler(cdns_xspi, false);
 				return -EIO;
 			}
-		} else if (!cdns_xspi_is_sdma_ready(cdns_xspi, true)) {
+		} else if (!cdns_xspi_is_sdma_ready(cdns_xspi, !op->panic_write)) {
 			return -EIO;
 		}
 
 		cdns_xspi->sdma_handler(cdns_xspi);
 	}
 
-	if (cdns_xspi->irq >= 0) {
+	if (cdns_xspi->irq >= 0 && !op->panic_write) {
 		wait_for_completion(&cdns_xspi->cmd_complete);
 		cdns_xspi->set_interrupts_handler(cdns_xspi, false);
-	} else if (!cdns_xspi_is_stig_ready(cdns_xspi, true)) {
+	} else if (!cdns_xspi_is_stig_ready(cdns_xspi, !op->panic_write)) {
 		return -EIO;
 	}
 
@@ -1196,6 +1194,10 @@ static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
 }
 #endif
 
+static const struct spi_controller_mem_caps cdns_xspi_mem_caps = {
+	.panic_write = true,
+};
+
 static int cdns_xspi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1316,6 +1318,7 @@ static int cdns_xspi_probe(struct platform_device *pdev)
 	}
 
 	host->num_chipselect = 1 << cdns_xspi->hw_num_banks;
+	host->mem_caps = &cdns_xspi_mem_caps;
 
 	ret = devm_spi_register_controller(dev, host);
 	if (ret) {
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
