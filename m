Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A545BC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 22:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9YNaE/m9TUbF6rzGaNRowxh2YwznZqb22639GYTezao=; b=w1GbSuFq3mR2HT
	O2oAco2BGoV+b6eIaNCsuctxFXucXtvLez/sdQ4maoirp/V+/ZHgUppWtoywYCIOOGArMQUkQNMse
	dCYWrfPY7YWLRNmYRvfA4foJTUyqaXpwWLKq0q3P6qMqxIAgzwzmocwUumglW3hWvz9gba5cb0mfA
	FDZUyydRHluqofJ1nJSorVtwH0/YkhDv7uHMJcI68WRpLFNZ8lWy+OLjRcd08XWdfhW/by+tPCAnr
	nRNNG0Dbdr6HRna1zESPtR+lopsDNvA91LfPcbZzP/3tzfpYCHdIIvaUMcZMbHEt/67o+y40taBLX
	WMNpUPjJmxDT48i6VyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpHsk-000Ayy-Hb; Mon, 22 Nov 2021 22:33:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpHiY-0007mF-GS; Mon, 22 Nov 2021 22:23:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1651060FE6;
 Mon, 22 Nov 2021 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619798;
 bh=McpWp/4AcEZeBd39ynQN6eTYVALGVNvs8cD8tBGVm+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rpP6eKOrl9dj0+CGG0X5A92xrHnDtIWKLHyPyGZsCeDj6+Y3LlX4ce9t+tYu5Utwc
 GAD/Dm5Ge6oMPjFnQSe7UC4zsOfp19LJfRk9htLP7pl58RZUdw4odqBlhALUfyEkPP
 qLyhySmSJtoWdnOXs2KUJIGAxo1Y++knYawaZrSKgfizR+WGB/R0Co73Hc2RCgB+E0
 SnKiJkIj+uf0eSIppmJ/1Qu+fX8RKmW186XR2XxbrB1rlTFDwIKlQBRQYQBOkHt4mL
 PvQ4jmOgipvUVh2E0J+xZnDuaSHyDWJVEg2FeTDb2h+g2D3rOu3i4dwNJrZUZKWxqT
 E58/3dIDp/niw==
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
Subject: [PATCH v2 07/11] dmaengine: sprd: stop referencing config->slave_id
Date: Mon, 22 Nov 2021 23:21:59 +0100
Message-Id: <20211122222203.4103644-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_142318_615425_0532CCBD 
X-CRM114-Status: UNSURE (   8.98  )
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

It appears that the code that reads the slave_id from the channel config
was copied incorrectly from other drivers. Nothing ever sets this field
on platforms that use this driver, so remove the reference.

Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/sprd-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 4357d2395e6b..7f158ef5672d 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -795,9 +795,6 @@ static int sprd_dma_fill_desc(struct dma_chan *chan,
 		return dst_datawidth;
 	}
 
-	if (slave_cfg->slave_id)
-		schan->dev_id = slave_cfg->slave_id;
-
 	hw->cfg = SPRD_DMA_DONOT_WAIT_BDONE << SPRD_DMA_WAIT_BDONE_OFFSET;
 
 	/*
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
