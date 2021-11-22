Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB37C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYYEWHoFI0LVuqIGpz4Dq8uC4iUXOtz9P4dMwRNKWSc=; b=l4QlVNiTk5lQUh
	hriHMk4QSb2DWDIJRVyxdv+Xe67ZLxPU58sX55WyPUbSazHtTlcV0Qp/K2oEKrDOuisii9l+uJ+ii
	mgNGqjU3M4+86Kq80psDdaYYs+Oz90ESBWszB0G3CL/S35XdtpmAzF0MWRYogSlePA/16ArqkeI+n
	xQOgFeg61/4vw9wg0SuvtbkemE/3iOPGOFBLRfzZnNn4IK9Nm3F0WHgZJ/LTDPQc7EiMKCdPLA1Ji
	AWBYroRWCETbjc0dVzBxAuQnH0Y5Mqn3XrmfvDo1xR5USrAguLVzu9VkJv3gGMtmYiWEbpFqclm33
	AcPMok4gz5/LRbRDJSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpHiW-0007lU-TY; Mon, 22 Nov 2021 22:23:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpHhv-0007YV-Ig; Mon, 22 Nov 2021 22:22:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D11461004;
 Mon, 22 Nov 2021 22:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619759;
 bh=sys9XJFA/dhliBmMopCopzBXwQ5L2mlun1TUrr3vGRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WR3+Blu3IRW2Yhs5zCvf1L9Bs1DK6UlkyNrvuALltf/Cx2Ld4S+RIwoNQP1ZJa8Me
 0k2gQIm+YMLlRt6gZ8S3u+mo/GUMQZG/LQIYg25XUw7m4G5+PnoriFpQxQaiHvkuzg
 /L+0271pMWb8Zv9xbu0UyZJjSWDGu5B/50b1v8edJiwT8VelW0JiKduUh3tFwMrJyc
 n0UsZBridxhTdPjzbsUJzBkQhqYc56e264H2Bsv/99bpTXzZpwFGbUEm8LiG14LSoL
 szfShKk7TCtNrm3icqZwHYOcAQmqiIOUKdmlM+ayHLtOrcSROgx3Zd2luYkcUzlRym
 p9c+BGRLp1lgw==
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
Subject: [PATCH v2 01/11] ASoC: tegra20-spdif: stop setting slave_id
Date: Mon, 22 Nov 2021 23:21:53 +0100
Message-Id: <20211122222203.4103644-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_142239_674041_F25E4A15 
X-CRM114-Status: GOOD (  12.66  )
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

The DMA resource is never set up anywhere, and passing this as slave_id
has not been the proper procedure in a long time.

As a preparation for removing all slave_id references from the ALSA code,
remove this one.

According to Dmitry Osipenko, this driver has never been used and
the mechanism for configuring DMA would not work as it is implemented,
so this part will get rewritten when the driver gets put into use
again in the future.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/tegra/tegra20_spdif.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 9fdc82d58db3..1c3385da6f82 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -284,7 +284,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
