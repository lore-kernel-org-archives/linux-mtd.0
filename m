Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6D8C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 18:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D851D2147C
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 18:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KqmXtK3X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D851D2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zj0hdP6R8HZVtnk8S1xSVfoZY8HgO92ZUXTF3xa6oMQ=; b=Kqm
	XtK3X5p9JAgJJef2Mz524CWjDGmR6rxZdhKVwK6D2UTGC+tA7GUiqFmh4Hk8IrPwiqpbHsVF4F3ak
	U5WHtbQMau/hAh22aAfsn8nYkMQZ9u9r/mF5f5cHh90RdAi/kvifRwhWAvndn2PK0/EGVoYRbO5+O
	2q7LGRXHmXelfSq/L0QG3TWBzh+EYaZxoKLSNiqzhmTrzc6a+c2W6Zn1qdlTkERdMdh4uk4cGnHQs
	Hmq6Z23hoXybrCh8h0zjuMhUaDvVp7y/cqX0HVUgPI2yW1E/v9y+4FdcJ2lvdfOV3A177LjCtiZNn
	0QP0i4s2XhVa0f2NeJlb95vtDTcotmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3mNT-0001hy-1B; Tue, 12 Mar 2019 18:43:51 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3mNK-0001Ww-BT
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 18:43:44 +0000
Received: from ramsan ([84.194.111.163]) by laurent.telenet-ops.be with bizsmtp
 id n6ja1z00D3XaVaC016jaGz; Tue, 12 Mar 2019 19:43:34 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1h3mNC-0004TT-4c; Tue, 12 Mar 2019 19:43:34 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1h3mNC-0003aa-2Z; Tue, 12 Mar 2019 19:43:34 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] spi: rspi: Fix register initialization while runtime-suspended
Date: Tue, 12 Mar 2019 19:43:31 +0100
Message-Id: <20190312184331.13755-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_114342_547097_7D58FC1E 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Renesas RSPI/QSPI driver performs SPI controller register
initialization in its spi_operations.setup() callback, without calling
pm_runtime_get_sync() first, which may cause spurious failures.

So far this went unnoticed, as this SPI controller is typically used
with a single SPI NOR FLASH containing the boot loader:
  1. If the device's module clock is still enabled (left enabled by the
     bootloader, and not yet disabled by the clk_disable_unused() late
     initcall), register initialization succeeds,
  2. If the device's module clock is disabled, register writes don't
     seem to cause lock-ups or crashes.
     Data received in the first SPI message may be corrupted, though.
     Subsequent SPI messages seem to be OK.
     E.g. on r8a7791/koelsch, one bit is lost while receiving the 6th
     byte of the JEDEC ID for the s25fl512s FLASH, corrupting that byte
     and all later bytes.  But until commit a2126b0a010905e5 ("mtd:
     spi-nor: refine Spansion S25FL512S ID"), the 6th byte was not
     considered for FLASH identification.

Fix this by moving all initialization from the .setup() to the
.prepare_message() callback.  The latter is always called after the
device has been runtime-resumed by the SPI core.

This also makes the driver follow the rule that .setup() must not change
global driver state or register values, as that might break a transfer
in progress.

Fixes: 490c97747d5dc77d ("spi: rspi: Add runtime PM support, using spi core auto_runtime_pm")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a fix for v5.1-rc1, as a2126b0a010905e5 will be in v5.1-rc1.
---
 drivers/spi/spi-rspi.c | 39 ++++++++++++++++-----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 556870dcdf7995f8..b30fed824e6643a2 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -868,28 +868,6 @@ static int qspi_transfer_one(struct spi_controller *ctlr,
 	}
 }
 
-static int rspi_setup(struct spi_device *spi)
-{
-	struct rspi_data *rspi = spi_controller_get_devdata(spi->controller);
-
-	rspi->max_speed_hz = spi->max_speed_hz;
-
-	rspi->spcmd = SPCMD_SSLKP;
-	if (spi->mode & SPI_CPOL)
-		rspi->spcmd |= SPCMD_CPOL;
-	if (spi->mode & SPI_CPHA)
-		rspi->spcmd |= SPCMD_CPHA;
-
-	/* CMOS output mode and MOSI signal from previous transfer */
-	rspi->sppcr = 0;
-	if (spi->mode & SPI_LOOP)
-		rspi->sppcr |= SPPCR_SPLP;
-
-	set_config_register(rspi, 8);
-
-	return 0;
-}
-
 static u16 qspi_transfer_mode(const struct spi_transfer *xfer)
 {
 	if (xfer->tx_buf)
@@ -959,8 +937,24 @@ static int rspi_prepare_message(struct spi_controller *ctlr,
 				struct spi_message *msg)
 {
 	struct rspi_data *rspi = spi_controller_get_devdata(ctlr);
+	struct spi_device *spi = msg->spi;
 	int ret;
 
+	rspi->max_speed_hz = spi->max_speed_hz;
+
+	rspi->spcmd = SPCMD_SSLKP;
+	if (spi->mode & SPI_CPOL)
+		rspi->spcmd |= SPCMD_CPOL;
+	if (spi->mode & SPI_CPHA)
+		rspi->spcmd |= SPCMD_CPHA;
+
+	/* CMOS output mode and MOSI signal from previous transfer */
+	rspi->sppcr = 0;
+	if (spi->mode & SPI_LOOP)
+		rspi->sppcr |= SPPCR_SPLP;
+
+	set_config_register(rspi, 8);
+
 	if (msg->spi->mode &
 	    (SPI_TX_DUAL | SPI_TX_QUAD | SPI_RX_DUAL | SPI_RX_QUAD)) {
 		/* Setup sequencer for messages with multiple transfer modes */
@@ -1267,7 +1261,6 @@ static int rspi_probe(struct platform_device *pdev)
 	init_waitqueue_head(&rspi->wait);
 
 	ctlr->bus_num = pdev->id;
-	ctlr->setup = rspi_setup;
 	ctlr->auto_runtime_pm = true;
 	ctlr->transfer_one = ops->transfer_one;
 	ctlr->prepare_message = rspi_prepare_message;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
