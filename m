Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2BDEDA694
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5NKCB73dk9mDWnl3Jrrm8lJauocbMCjYMCnsVwXeJo=; b=nJCwVVDkYsGRsP
	3zhAMQXlCATuGYmlrOcSo6ueRUWq2s9ha0prkHPWSpb+G6wQ5NgAn8ZXrW5bSm562+NxI9CKUA2jp
	TDSYMttWKe9os+Zv9AGARu5uHa2iR+IWh1WTsQHuLRWlU8gnGOvpa7/Pz4F3jqC97lMKO0Or+YMYd
	72TKpnwBkVVQ0Ad53GHQEunDPey6dCZIm7myy1x7KL0Sz8UjXp7bs1+cExM/2xz8LGhH3FeNIWU5a
	TdYRvuHtQV6ILGYIjYOAg42qc1DiH51S0URqz20fb6G4oY+mR72nePbFMF3nlfArNq+chvy8ZlSRp
	JRX7+T3WwOhINuWr7xkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdJ-0000000FZI1-0FFd;
	Tue, 03 Mar 2026 16:30:05 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdF-0000000FZFi-1CY8
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:30:03 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1772555396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQpGPSsrmt5iFf8ycx5AlTFs3GDIIi8/v45rG7lvG9E=;
	b=RJ7ZVyJG+KcCDsqtEKVaft96gFljbG0QnrDqcEaQhES+7duAAfX9XINpkZukPWPpxkQAiT
	ObisQQAu7sFaBTTgu0IgG9BsNECNUic/ml4yyp0cjs2sr+vTF6boKHhnZ167h4+WexxYRc
	qXpCUxRKwiKqJ8ftvhF5jIjwC3MaO94llQMZ1JZOEbjKRwG7Z63eTESJFx9jxEr/p0LfRL
	xw0t/xF5P+4PsdGnOkw3Ed8B2ZQC1+FPr3dxDyIdqixE2tuKRjfHMgW/0pZ3WkNtBz2tX/
	y/ijtE6uisHrTzbbHXhx7leBJv2D3sEarAbLex26HU8x+n2r7ahL7pUogiwnZQ==
Date: Tue, 03 Mar 2026 17:29:22 +0100
Subject: [PATCH RFC 1/7] spi: Add 'rx_sampling_delay_ns' parameter for
 clock to RX delay
MIME-Version: 1.0
Message-Id: <20260303-fsl-qspi-rx-sampling-delay-v1-1-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
To: Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Han Xu <han.xu@nxp.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, imx@lists.linux.dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2060;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=XlqBJm6qGT+yufD3x6JPfqlL1/qFkwpILnGBWgECzFk=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIXM5T9OFDXvSpisb72j5uznvPbPw02vpJ/ZntCx4pCG9w
 v3sRnaPjlIWBjEuBlkxRRYpfovXtmaxPvLHqqNg5rAygQxh4OIUgImcfsbwPzT+ugjrrn1B97v9
 9zXN3j/Rr5G/wptL/tuMrt+SLF8vXWJk2Hr1cm7jOe9JRpKBu2ecjPu7OXmiaPC77y1v1MQDEn5
 N4gUA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_083001_797710_3F5B72D7 
X-CRM114-Status: GOOD (  14.19  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Some high speed SPI devices require a delay between the controller
clock and the sampling point of the client device. This 'clock to
receive data delay' value is often referenced as tCLQV in SPI device
data sheets.

Not respecting this can lead to data being sampled too early when
the client doesn't yet reflect the correct level at the data out
pin(s).

There are two ways to handle the situation:

1. Reduce the controller clock to the amount where the sampling
   point requirement of the client is still met, meaning the
   clock period being greater than two times tCLQV.

2. If the host controller supports it, compensate by delaying the
   sampling point to meet the tCLQV requirement of the client.

Add a parameter 'rx_sampling_delay_ns' in struct spi_device to enable
setting the clock to RX data delay for each SPI device, so drivers
can check and act upon this timing requirement.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 include/linux/spi/spi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index af7cfee7b8f60..4f8a0c28e1d46 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -181,6 +181,7 @@ extern void spi_transfer_cs_change_delay_exec(struct spi_message *msg,
  * @num_tx_lanes: Number of transmit lanes wired up.
  * @rx_lane_map: Map of peripheral lanes (index) to controller lanes (value).
  * @num_rx_lanes: Number of receive lanes wired up.
+ * @rx_sampling_delay_ns: spi clk to spi rx data delay
  *
  * A @spi_device is used to interchange data between an SPI target device
  * (usually a discrete chip) and CPU memory.
@@ -235,6 +236,8 @@ struct spi_device {
 	struct spi_delay	cs_setup;
 	struct spi_delay	cs_hold;
 	struct spi_delay	cs_inactive;
+	/* Transfer characteristics */
+	u32			rx_sampling_delay_ns; /* clk to rx data delay */
 
 	u8			chip_select[SPI_DEVICE_CS_CNT_MAX];
 	u8			num_chipselect;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
