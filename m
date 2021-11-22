Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FC9C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 22:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aUX+N91hMngT3psYH7AdfXRocjDMpn7II9RnEuZiJ4=; b=uAtBMvnf1MZISa
	OHfku9GjzARlqruIlYhH7boDRt3xBGUgaI7U7pOLMZtF6M4nCNnCFUaEYaGl2GJ/P4Aj6XMQ60R+J
	4VQ2BXr6srbaBUCRloUc3wOq797vKSKPwuuzpnlL99ufPJ6so0LrkAWz8gRATM8Ckxr2piKzPWOhB
	2kol4nEwFvn0hkW5aYdUSW6eM/SQjcjIZ9WZ/JCTT/csDmhii4XO53h/0n26WxT+7fryigQA3ONwb
	wPC3Rym/uy8boqQ1MIKNXtvTuEMm7rwY0eaRZa5HHfYD5YT89DOIT/vawR6MGTGgicYvHYLHIbYJi
	Ih5DpsxuzXP82yv8hpQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpI6R-000E8f-48; Mon, 22 Nov 2021 22:47:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpHiy-0007yv-FD; Mon, 22 Nov 2021 22:23:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 064F96103C;
 Mon, 22 Nov 2021 22:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619824;
 bh=kK/0hn3Tn2Fi1LQ6SeIagL/0lsO2CrpknZyQZAqq6H8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D2/yNDzBENZCV3sSIl45F//FfTAukYJn/aB/UGh8I2KaOy7hp22Bp+4Hk7x39Hi7u
 6e+dm5/YqhRogLXgrZ4AGc43mg64vHlOq1gIn5GVeiq9ATMgMjPD8mxPFDFaQ3aa+j
 MQv7bncgFO5dExmwoX3s7KxgzNmRdjAvJ8L8yiSvS5qic4CJs5WDTicWXy2EK3Rvgg
 cAaYtYpjbFTPUW/LIgaSPH1XVukM1CNyFl/il1Z3hpw7wYnUGTRu2xxQu7y1304Q4O
 DqXPeJwj0DSwecC7x7qSXRZYQTTmspHVwU6Jw3E235yowtMHJ5mtFd1BPBQlG3mqm6
 Syi2DD+et8CSw==
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
Subject: [PATCH v2 11/11] dmaengine: remove slave_id config field
Date: Mon, 22 Nov 2021 23:22:03 +0100
Message-Id: <20211122222203.4103644-12-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_142344_757145_576473DD 
X-CRM114-Status: GOOD (  11.55  )
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

All references to the slave_id field have been removed, so remove the
field as well to prevent new references from creeping in again.

Originally this allowed slave DMA drivers to configure which device
is accessed with the dmaengine_slave_config() call, but this was
inconsistent, as the same information is also passed while requesting
a channel, and never changes in practice.

In modern kernels, the device is always selected when requesting
the channel, so the .slave_id field is no longer useful.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/dmaengine.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 9000f3ffce8b..0349b35235e6 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -418,9 +418,6 @@ enum dma_slave_buswidth {
  * @device_fc: Flow Controller Settings. Only valid for slave channels. Fill
  * with 'true' if peripheral should be flow controller. Direction will be
  * selected at Runtime.
- * @slave_id: Slave requester id. Only valid for slave channels. The dma
- * slave peripheral will have unique id as dma requester which need to be
- * pass as slave config.
  * @peripheral_config: peripheral configuration for programming peripheral
  * for dmaengine transfer
  * @peripheral_size: peripheral configuration buffer size
@@ -448,7 +445,6 @@ struct dma_slave_config {
 	u32 src_port_window_size;
 	u32 dst_port_window_size;
 	bool device_fc;
-	unsigned int slave_id;
 	void *peripheral_config;
 	size_t peripheral_size;
 };
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
