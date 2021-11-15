Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F46C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5335361B2B
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 09:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5335361B2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIVzuNc4isbrGQ5yiN1HONL2pE/yr0eB3whDx/e3PA8=; b=O7dAI6DJ5k9biN
	jl6KsnmFJNk66Ilv2LM0eGDr1+L73vX/FMTWG77UyDgBGlkpoHvVfLxCNjmmdeMIdIN2G2YUKzZiP
	0AhU8w8v1O+Jp8kCqEiSYQHlZ9QTBsYbadFaD/KiSx3/nnowTXgMTOpimoa4l3g1kqRDcMUXcW3Yn
	CXOi0miBEZlPBQQhwZg/r13ndxoTTw+7D68nwrvmtQ/ThWVkBcJIPOEzED9sXpt7VWpT7plY0+eOm
	X+Y3wNyrpNBd/tLV3rDGQQr63PPmtF2rjiQE0hRdC0j0dvcBWhDEEPyVj6KbwAjgyVw9cKUgNXyb/
	jI5Y+Q7Y9Bsy5blg22Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmY9o-00EtVC-Em; Mon, 15 Nov 2021 09:20:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmXmK-00Emab-32; Mon, 15 Nov 2021 08:55:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97B2063227;
 Mon, 15 Nov 2021 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966551;
 bh=t+sujmlGUVrYtWCA2Iqgm4qzwcVm4cE+7MUCYHiTmt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E3hAwHAFBi1veWTZ9KC3LUqplVBzvhHkJdmHwzLmUaxHGxHQt/Uao9jUuL7+wYtM1
 t5/KCd2DhDnIMvpS1fzLHld+q6AChRUElQMbmbJgDaTpHm5vW1Uyudi7cSpoV3wALW
 3+TEcRqIWccqr7FIxw+On4njyPKMPuD/VUQ+uBZMxLJI2xjFiVqAFgV6Ym1M8MXblp
 H3AtGfulWPCW1XQE3Nvr6vFEwAXxjhfbUBy3AmIdd5/EjenYc84yhK4dgbFVtzWJe/
 uGxVZ0BY9bYvtABbO19Hw4xqxf+bkbhZDmO0g57I7eSW+8dnN8ZNhH3IrlxeCNnqJt
 h19+P/ZGx52Ig==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, alsa-devel@alsa-project.org,
 bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
Date: Mon, 15 Nov 2021 09:54:02 +0100
Message-Id: <20211115085403.360194-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_005552_223602_1E01D2E3 
X-CRM114-Status: GOOD (  16.00  )
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

From: Arnd Bergmann <arnd@arndb.de>

Picking the connection between a DMA controller and its attached device
is done through devicetree using the "dmas" property, which is implemented
by the gdma driver, but it also allows overriding the "req" configuration
with the slave_id field, as it was done in some linux-2.6 era drivers.

There is no driver in the tree that sets these values, so stop
interpreting them before anything accidentally starts relying on it.
Rename the field in the channel from "slave_id" to "req" to better match
the purpose and the naming in the hardware.

If any driver actually starts using this DMA engine, it may be necessary
to implement a .xlate callback that sets this field at probe time.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/ralink-gdma/ralink-gdma.c b/drivers/staging/ralink-gdma/ralink-gdma.c
index b5229bc6eae5..f00240e62e1b 100644
--- a/drivers/staging/ralink-gdma/ralink-gdma.c
+++ b/drivers/staging/ralink-gdma/ralink-gdma.c
@@ -106,7 +106,7 @@ struct gdma_dma_desc {
 struct gdma_dmaengine_chan {
 	struct virt_dma_chan vchan;
 	unsigned int id;
-	unsigned int slave_id;
+	unsigned int req;
 
 	dma_addr_t fifo_addr;
 	enum gdma_dma_transfer_size burst_size;
@@ -194,7 +194,6 @@ static int gdma_dma_config(struct dma_chan *c,
 			dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
 			return -EINVAL;
 		}
-		chan->slave_id = config->slave_id;
 		chan->fifo_addr = config->dst_addr;
 		chan->burst_size = gdma_dma_maxburst(config->dst_maxburst);
 		break;
@@ -203,7 +202,6 @@ static int gdma_dma_config(struct dma_chan *c,
 			dev_err(dma_dev->ddev.dev, "only support 4 byte buswidth\n");
 			return -EINVAL;
 		}
-		chan->slave_id = config->slave_id;
 		chan->fifo_addr = config->src_addr;
 		chan->burst_size = gdma_dma_maxburst(config->src_maxburst);
 		break;
@@ -288,12 +286,12 @@ static int rt305x_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
 		dst_addr = chan->fifo_addr;
 		ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED |
 			(8 << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
-			(chan->slave_id << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
+			(chan->req << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
 	} else if (chan->desc->direction == DMA_DEV_TO_MEM) {
 		src_addr = chan->fifo_addr;
 		dst_addr = sg->dst_addr;
 		ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED |
-			(chan->slave_id << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
+			(chan->req << GDMA_RT305X_CTRL0_SRC_REQ_SHIFT) |
 			(8 << GDMA_RT305X_CTRL0_DST_REQ_SHIFT);
 	} else if (chan->desc->direction == DMA_MEM_TO_MEM) {
 		/*
@@ -365,12 +363,12 @@ static int rt3883_gdma_start_transfer(struct gdma_dmaengine_chan *chan)
 		dst_addr = chan->fifo_addr;
 		ctrl0 = GDMA_REG_CTRL0_DST_ADDR_FIXED;
 		ctrl1 = (32 << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
-			(chan->slave_id << GDMA_REG_CTRL1_DST_REQ_SHIFT);
+			(chan->req << GDMA_REG_CTRL1_DST_REQ_SHIFT);
 	} else if (chan->desc->direction == DMA_DEV_TO_MEM) {
 		src_addr = chan->fifo_addr;
 		dst_addr = sg->dst_addr;
 		ctrl0 = GDMA_REG_CTRL0_SRC_ADDR_FIXED;
-		ctrl1 = (chan->slave_id << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
+		ctrl1 = (chan->req << GDMA_REG_CTRL1_SRC_REQ_SHIFT) |
 			(32 << GDMA_REG_CTRL1_DST_REQ_SHIFT) |
 			GDMA_REG_CTRL1_COHERENT;
 	} else if (chan->desc->direction == DMA_MEM_TO_MEM) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
