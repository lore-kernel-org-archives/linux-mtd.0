Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D55CC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNd4+tYKrQCwQTW7nV6bqK2Y19DG9Y6zH0FNx8Jnb0w=; b=npm18kjfL6FtEw
	x3c5vTA7qXbU+JWxQdkE3dfFLNC/dXA4nxrBLt2dMPT6FOELPpxrYchJZfVHwUsewS1XmtDCmWjov
	de/gFoqDrCRs2TMngTdgiR48WDhUXyyoSKyScmZZ2rWtvtTMHOQwG7ZBBKlputsoUzqZhTrcgZcrY
	z5YNrwSmXhOGMMKbOrhpQ2OsgIXVErUdr3dwJQflr1TbMtQoB8jKp810ktG1s5kmmSozVfxIXNNAl
	b09kUJPPtts0BmDl4KN8fVprz1X8h27LE9bzBNyFSVzP3hwhiaWasSUXZscv6eqf/1ukWFbeEvQ1n
	BTe9It1t0K35wXwXdZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdHT-0000000D3R8-3r3J;
	Tue, 13 Oct 2026 14:15:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdHO-0000000D3NC-1e20
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:14:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EAFB31A11FE;
	Tue, 13 Oct 2026 14:14:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEC4E60362;
	Tue, 13 Oct 2026 14:14:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D7AA11D716A0;
	Tue, 13 Oct 2026 16:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791900891; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=CyGU6d7OI09akB0dO5wo6D/vikIohPnXs+OHMj6aMGs=;
	b=2RTKA2s4Y5VC+WZWwByNfIDbOJS84c+C8+rSgFlElQOhYQvAa+yRnbZ2ny3tDgOfNiSeD6
	igmyKjV2lnWXXFxle4W9TKKsFA1DtmOmUmGSbOs3ZQxVNDWqdwz9O2JXtnj7C7CU7diq5w
	iwFK3S9i/wfyrKUv1rvdNsPqnD8AwNUJ1atb6W+KYe918FqAO+4k80LERQ7wHWWgZygaRA
	3DecKKwJ4SjZ89TiU6Krp5pjmsu18RjCbk/D9oaD4L1qAMRaqF6lOKrjc/PiC4pzjAYq5W
	QLgeRe+kdosxlRUa29xBgNYgSrRDDbJ5UbKEUevxOpdWOj/OR5Irxs/UtlWkvQ==
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
	stable@vger.kernel.org,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v2 4/7] spi: cadence-xspi: Clear "SDMA ready" IRQ flag after polling
Date: Tue, 13 Oct 2026 16:13:47 +0200
Message-ID: <20261013141350.189996-5-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013141350.189996-1-paul.cercueil@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_071458_580114_005CF54F 
X-CRM114-Status: GOOD (  10.46  )
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

When polling for the "SDMA ready" event, once the corresponding bit is
set in the CDNS_XSPI_SDMA_TRIGGER we should reset it to zero. Otherwise,
any subsequent call to cdns_xspi_is_sdma_ready() will just return early.

Fixes: 931e389ded0f ("spi: cadence: Add Marvell xfer operation support")
Cc: stable@vger.kernel.org
Signed-off-by: Tanmay Jagdale <tanmay@marvell.com>
Co-developed-by: Paul Cercueil <paul.cercueil@bootlin.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

Notes:
    v2: New patch

 drivers/spi/spi-cadence-xspi.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-cadence-xspi.c b/drivers/spi/spi-cadence-xspi.c
index 39c868a5b171..095bf640b379 100644
--- a/drivers/spi/spi-cadence-xspi.c
+++ b/drivers/spi/spi-cadence-xspi.c
@@ -1068,12 +1068,20 @@ static bool cdns_xspi_is_sdma_ready(struct cdns_xspi_dev *cdns_xspi, bool sleep)
 {
 	u32 ctrl_stat;
 
-	return !readl_relaxed_poll_timeout
-		(cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG,
-		ctrl_stat,
-		(ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
-		sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
-		sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0);
+	if (readl_relaxed_poll_timeout
+	    (cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG,
+	     ctrl_stat,
+	     (ctrl_stat & CDNS_XSPI_SDMA_TRIGGER),
+	     sleep ? MRVL_XSPI_POLL_DELAY_US : 0,
+	     sleep ? MRVL_XSPI_POLL_TIMEOUT_US : 0)) {
+		return false;
+	}
+
+	/* Clear the flag */
+	writel(CDNS_XSPI_SDMA_TRIGGER,
+	       cdns_xspi->iobase + CDNS_XSPI_INTR_STATUS_REG);
+
+	return true;
 }
 
 static int cdns_xspi_transfer_one_message_b0(struct spi_controller *controller,
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
