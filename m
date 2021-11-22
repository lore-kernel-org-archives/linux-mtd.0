Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2753C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w9xOt3oUAcOMeMPVD5j0gtyyqOwzlslDDdJ9ZgVIOMA=; b=qU1BKojkDpN4ft
	Dxsz2O9Zepv5KlXJYjxMKhkd03T4lRovYwnMjuqafm1tbERHV/0y0G93hlqaqQhxm1QdwQmORT/Fw
	HKC1cROfAxZagtiK9YCZLi+wFITpCWw0/8p0tRn3sqLOdwHBLsn9HO+jYnKAv5iel4m+2t6gMX+x7
	DUGNhUpwkMRukUfaob49Lnl1DgNSZmxnFrAN+zgtXk56MZh72e9lh9zypl9ek/QkrDIORMYmOBCRp
	ZNrXBkB2UP0qg7w8ROm0uCwgBFP//linQnhLyW8qo7wvrrrr73mGPmG3NxOXdc3VzlG6XIptw9R2n
	UjeIl1kwgeGPdsO/RVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpHi5-0007bC-I8; Mon, 22 Nov 2021 22:22:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpHhr-0007Wc-QF; Mon, 22 Nov 2021 22:22:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A713E60FE6;
 Mon, 22 Nov 2021 22:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619752;
 bh=a7SGmbp4mEcF+/rXpw1vFw4ipurQPrcKJnXyHa0ukDM=;
 h=From:To:Cc:Subject:Date:From;
 b=Y67FYaIGdT2PZzTNUoTVEiI4EIJPVahTTQcFkaMGkwj/kK6uvHtBIMmdnqBLhf7HT
 hBItQMZWP+6NOepRrZvm3Ew9ZZ8/FZ3O0KYYGjwKHK5rlPz4VxNp0GiabJQN8Y/GAu
 cpYxFgQ1c0u7D2HYV2H6tcPpfPDjp0wzO7HYKAfO+trFUsv2MhTcWOSKf3o8dyelB4
 DrmZQlB9Ek6HLLgk3MWFfNjOVttzg9ihxIXogQBkQ99M72KwZFnb0oN9Lw8EEWgIo9
 HeySd0yRe7BQd7PNPcJ0oegk/rngezgRJBGsN7YW07wkfLzE47GG8mpWgwpy/vxG8C
 +w2C+aEIfRe5A==
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
Subject: [PATCH v2 00/11] dmaengine: kill off dma_slave_config->slave_id
Date: Mon, 22 Nov 2021 23:21:52 +0100
Message-Id: <20211122222203.4103644-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_142235_923110_3E41D517 
X-CRM114-Status: GOOD (  14.84  )
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

I recently came across some new uses of the 'slave_id' field that
I had (almost) removed a few years ago. There are no legitimate
uses of this field in the kernel, only a few stale references and
two drivers that abuse the field as a side-channel between the
dmaengine driver and its client.

Let's change the xilinx and qualcomm drivers to use the documented
side-channel (peripheral_data) instead, and remove the remnants of
it to prevent new users from coming in.

I think I got all the necessary Acks on v1 already, so if there are
no further concerns, please merge this through the dmaengine tree
for v5.17, or pull from

git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/dma-slave-id-removal

       Arnd

Arnd Bergmann (13):
  ASoC: tegra20-spdif: stop setting slave_id
  ASoC: dai_dma: remove slave_id field
  spi: pic32: stop setting dma_config->slave_id
  mmc: bcm2835: stop setting chan_config->slave_id
  dmaengine: shdma: remove legacy slave_id parsing
  dmaengine: pxa/mmp: stop referencing config->slave_id
  dmaengine: sprd: stop referencing config->slave_id
  dmaengine: qcom-adm: stop abusing slave_id config
  dmaengine: xilinx_dpdma: stop using slave_id field
  dmaengine: tegra20-apb: stop checking config->slave_id
  dmaengine: remove slave_id config field

---
Changes in v2:

 - drop obsolete drivers/staging/patch
 - split tegra change into a separate patch
 - improve some patch descriptions.

 drivers/dma/mmp_pdma.c                 |  6 ---
 drivers/dma/pxa_dma.c                  |  7 ----
 drivers/dma/qcom/qcom_adm.c            | 56 ++++++++++++++++++++++----
 drivers/dma/sh/shdma-base.c            |  8 ----
 drivers/dma/sprd-dma.c                 |  3 --
 drivers/dma/tegra20-apb-dma.c          |  6 ---
 drivers/dma/xilinx/xilinx_dpdma.c      | 17 +++++---
 drivers/gpu/drm/xlnx/zynqmp_disp.c     |  9 ++++-
 drivers/mmc/host/bcm2835.c             |  2 -
 drivers/mtd/nand/raw/qcom_nandc.c      | 14 ++++++-
 drivers/spi/spi-pic32.c                |  2 -
 drivers/tty/serial/msm_serial.c        | 15 ++++++-
 include/linux/dma/qcom_adm.h           | 12 ++++++
 include/linux/dma/xilinx_dpdma.h       | 11 +++++
 include/linux/dmaengine.h              |  4 --
 include/linux/platform_data/asoc-s3c.h |  6 ---
 include/sound/dmaengine_pcm.h          |  4 --
 sound/core/pcm_dmaengine.c             | 26 +-----------
 sound/soc/tegra/tegra20_spdif.c        |  1 -
 27 files changed, 134 insertions(+), 146 deletions(-)
 create mode 100644 include/linux/dma/qcom_adm.h
 create mode 100644 include/linux/dma/xilinx_dpdma.h

-- 
2.29.2

Cc: Andy Gross <agross@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: dmaengine@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-serial@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
