Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DF7C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 08:57:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C941D63215
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 08:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C941D63215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=81FzMqqlpjcc+Ca83qVA/8WdMZE5+VONQnziwzE7TrM=; b=XwOeb1XgH3Qccj
	cxNQPwWPsXPxEtk86iUWyibxbgb8XBJj59N6DShe3kfcRnoa5COdhIzUkIP5iTLiOF9NLGB/ey9ih
	0Gd5EKtTjYOczijBVyJu22hiBx7qQ2ekcQnVT0VUn5OH2xb6fjRuAf7GL+m0EJXigw2SdpGK+fEbD
	V7nZ/gdQzjgNYPoDhzuNGjjMw0XlOQ+izOF/FRsHJW1ko8ccPlGm/tnBRJbzrJDLzzxMHV/fQC3my
	XWl0d8+gbuCOsVXAC2VVToTblDQGgmcKopx1lmmxPPQPy43abrkBi1b3Gzc+UPQe9pJHMSbx1Nptc
	/o7WY0Pe0KlCaGz9XFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmXnk-00En68-30; Mon, 15 Nov 2021 08:57:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmXlN-00EmA7-Gl; Mon, 15 Nov 2021 08:54:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F29161BF5;
 Mon, 15 Nov 2021 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966493;
 bh=wn57j1S+OVDPjchxqdayqaIicCxtINUEg6GRzjIlw5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YpPwnQ+ZywWiftbIGbvSME2DSkHoKYPFuU4+pHFPnVCL6fAFGd6mYmtgljVBSkmRJ
 pW1JZbsvnPgbWG3BIB1WxilpINGEKjCw9qhXl3qcYTQJs2ryMXJDzUYFTmV+bJ9clv
 93VV93b94yY9B4TxZ7B7hXK8AU350k/nQ0LP+ecDwB1REeriP9jE3UDWkfZnuLaeVM
 cjhwo1GJ6NlZbpRmqItwSJjTxt9iFUH4XKy1kf5swVCl5yYiAgReOUL0BXKR3AN91G
 tnDG8UAkjd/mH7+NAsriu0rVVog9i3scmEbYwpdOQPUe3HixNhQXEB6g/mtLNh/erJ
 SzxSnZNolHWtg==
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
Subject: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
Date: Mon, 15 Nov 2021 09:53:53 +0100
Message-Id: <20211115085403.360194-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_005453_642230_5DFCEC61 
X-CRM114-Status: GOOD (  15.98  )
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

This field is never set, and serves no purpose, so remove it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/dmaengine_pcm.h   | 2 --
 sound/core/pcm_dmaengine.c      | 5 ++---
 sound/soc/tegra/tegra20_spdif.c | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 9144bd547851..7403870c28bd 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -58,7 +58,6 @@ struct dma_chan *snd_dmaengine_pcm_get_chan(struct snd_pcm_substream *substream)
  * @maxburst: Maximum number of words(note: words, as in units of the
  * src_addr_width member, not bytes) that can be send to or received from the
  * DAI in one burst.
- * @slave_id: Slave requester id for the DMA channel.
  * @filter_data: Custom DMA channel filter data, this will usually be used when
  * requesting the DMA channel.
  * @chan_name: Custom channel name to use when requesting DMA channel.
@@ -72,7 +71,6 @@ struct snd_dmaengine_dai_dma_data {
 	dma_addr_t addr;
 	enum dma_slave_buswidth addr_width;
 	u32 maxburst;
-	unsigned int slave_id;
 	void *filter_data;
 	const char *chan_name;
 	unsigned int fifo_size;
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index af08bb4bf578..6762fb2083e1 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -91,8 +91,8 @@ EXPORT_SYMBOL_GPL(snd_hwparams_to_dma_slave_config);
  * @dma_data: DAI DMA data
  * @slave_config: DMA slave configuration
  *
- * Initializes the {dst,src}_addr, {dst,src}_maxburst, {dst,src}_addr_width and
- * slave_id fields of the DMA slave config from the same fields of the DAI DMA
+ * Initializes the {dst,src}_addr, {dst,src}_maxburst, {dst,src}_addr_width
+ * fields of the DMA slave config from the same fields of the DAI DMA
  * data struct. The src and dst fields will be initialized depending on the
  * direction of the substream. If the substream is a playback stream the dst
  * fields will be initialized, if it is a capture stream the src fields will be
@@ -124,7 +124,6 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
 			slave_config->src_addr_width = dma_data->addr_width;
 	}
 
-	slave_config->slave_id = dma_data->slave_id;
 	slave_config->peripheral_config = dma_data->peripheral_config;
 	slave_config->peripheral_size = dma_data->peripheral_size;
 }
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
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
