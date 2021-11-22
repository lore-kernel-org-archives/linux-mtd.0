Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D835FC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 22:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gcmtqah/H1p/BcdUh2v64JGjjWPr1Bx9LerURnKWXpI=; b=ffx4MQNjq7GBkn
	vgVvMbDpni5EE6hL+NR1hBJxSIkoi9nOb/DjOX1bfzk/LwWicuAaF3zC/SvbBwLDAwml1BMuVrBiM
	TctHqsJPbAy4aqCbjYFsbTHfCuWNWcbhBXKU3pBsgUApZtLsUFdQBANbM58VI4+w9GGtUtyCOkAM5
	Gw7Phz7JQLEC7b3Zt0Qu2rWyV3RxtK1ZHz57PwSq9VSSxyxX3S+xD/3CU15jQcnk/2WlZlPJT7824
	ZqqfurffXNWcHcYPcMm+9pvwp/Mt3yrbhgNzGpuh/xlRNCSW4Lix4/wC3oHL17ytkkOuKi2ghvRvg
	pe4ozgqrD8NlbZKoHKEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpHnj-0009hI-JC; Mon, 22 Nov 2021 22:28:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpHiL-0007hP-I0; Mon, 22 Nov 2021 22:23:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20BEB61028;
 Mon, 22 Nov 2021 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619785;
 bh=d7m5O4/1nyBGt5Kh33p+oJ8bVHRAS2FfC8Aq7HlukD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n9vM5QRuk8fadP59ElpA3ffYUxfRVicrLxNOTf6e03SjGI2V3nsfn8cy3no76jRy2
 RDW8l+sIUSCY6gvdbzO4wQ2AAfKEwEssXaTOKLN8mBgW2oC6rbb8Grgm3zn26NcITl
 4hcTr9aLhkFY3SCxz7WQc70Ko9Jp/B6+EVRTt4cSjOhtxz6FOGr83EAYftKEZg7yZT
 GnYh/33xI6Gx+eRxpaESCR5LoWgmya5WHI/acve3Woxr1X/fjCQRjNzrWaWmJ3p2s3
 Ok01FBgGD/IQQP5RVu8NbnuhF5Z+l0bB0OYW66oZ0UUqp0zstTqsn5/tPu0/YQMz8f
 LRNC3XKm0SL3w==
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
Subject: [PATCH v2 05/11] dmaengine: shdma: remove legacy slave_id parsing
Date: Mon, 22 Nov 2021 23:21:57 +0100
Message-Id: <20211122222203.4103644-6-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_142305_644475_3203700A 
X-CRM114-Status: GOOD (  12.10  )
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

The slave device is picked through either devicetree or a filter
function, and any remaining out-of-tree drivers would have warned
about this usage since 2015.

Stop interpreting the field finally so it can be removed from
the interface.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/sh/shdma-base.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
index 7f72b3f4cd1a..41c6bc650fa3 100644
--- a/drivers/dma/sh/shdma-base.c
+++ b/drivers/dma/sh/shdma-base.c
@@ -786,14 +786,6 @@ static int shdma_config(struct dma_chan *chan,
 	if (!config)
 		return -EINVAL;
 
-	/*
-	 * overriding the slave_id through dma_slave_config is deprecated,
-	 * but possibly some out-of-tree drivers still do it.
-	 */
-	if (WARN_ON_ONCE(config->slave_id &&
-			 config->slave_id != schan->real_slave_id))
-		schan->real_slave_id = config->slave_id;
-
 	/*
 	 * We could lock this, but you shouldn't be configuring the
 	 * channel, while using it...
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
