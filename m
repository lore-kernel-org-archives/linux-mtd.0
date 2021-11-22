Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DD6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EViIFOIIClDVtoWrP8iWV8x0rA29brJQm5Lixp/NREs=; b=ZMvBMon7rPcpw+
	nj3dRqeZHun3czh8FGkbH7dYTe/VEt66DNhykdcRWX6fRDgcp/JurZLk/Cn7SdZEjq6bRidP75rg4
	njQLeP0TZjIifRSn78H99kOz2d8SJRCM0r8QwfVl497lXYG5W/CdveI6pr+ieFS9pcgpWJmhh9APe
	92GMNaViA2oQ3SpasN9tDE/jTd2xU5Kfuu7KdZWfX3JHNTbeSJWsmn5nS+eX7UN5aec9p4TL9Q+Nn
	SiCc637eGtmHLH96At4IJshj0N5PiROW05KWeFPzoy6yp38EamM+sdtro+iHcqa6KBOOPiwMmWPin
	cPyceDc0rOC4F7m4wjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpI2i-000DKZ-PI; Mon, 22 Nov 2021 22:44:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpHis-0007vX-0I; Mon, 22 Nov 2021 22:23:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8354861078;
 Mon, 22 Nov 2021 22:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619817;
 bh=efjqB8lclC/CTZtvxidalnRW6k3GNlgXbza8zFiCoZM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U8NP1Zc1gLJF725LnCrWHgavWOnwK2Ly1UnDTKcbTcdYbgu+miYfDh7Q5MZ9ByoyK
 GvjVX6mKNAxeCgehUkVbusSV4QnRfJUYbwPUXViEyL36MN8wB2u6OmqubcsatL9+Mq
 yeV+rIZkvLJeCdnf9o9aNwg+uxPfN+v8kmtNfC7MLTzE2itRKsloRWob2HCygsanXX
 VTKTLI7mi+52T1tblQaF6Ba0ZDdU3kkLWFXoKX2E3e7ejJJSpfWQ0xjrJeJKfQB24g
 xd90ghdcOKTXQirzhVKhiK98fux08E5EopBbXH5f2PC+N20hBxkQSuiFisX18MW7Gu
 qmf6Z6dWyCwbA==
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
Subject: [PATCH v2 10/11] dmaengine: tegra20-apb: stop checking
 config->slave_id
Date: Mon, 22 Nov 2021 23:22:02 +0100
Message-Id: <20211122222203.4103644-11-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_142338_104698_26C4762E 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Nothing sets the slave_id field any more, so stop accessing
it to allow the removal of this field.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/tegra20-apb-dma.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index b7260749e8ee..eaafcbe4ca94 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -343,12 +343,6 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
 	}
 
 	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
-	if (tdc->slave_id == TEGRA_APBDMA_SLAVE_ID_INVALID &&
-	    sconfig->device_fc) {
-		if (sconfig->slave_id > TEGRA_APBDMA_CSR_REQ_SEL_MASK)
-			return -EINVAL;
-		tdc->slave_id = sconfig->slave_id;
-	}
 	tdc->config_init = true;
 
 	return 0;
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
