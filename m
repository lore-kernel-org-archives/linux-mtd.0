Return-Path: <SRS0=jzn5=YH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1599EECE587
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 14:13:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD8242083B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 14:13:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AvjYrOSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD8242083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGaPe+RBqZ3y33Ly7rOpCyOJ4pXMX2oI+gVbx7t0IHo=; b=AvjYrOSa50hlsw
	WpLZz9TzN3tCMn4Zglkd/Ygnwt+Qiv3x8+lxvppP6P1gsJ4gX7/jqY42Mo305LhPqYfmGi8bCgF+N
	yA3lF8eWaBZjMR4JbllE0KtfhGfgBm/ec6uMqcv6JwsuJY9FWYujqvDxE2E/Vxb/tnSYZDaJ4ci/1
	6Vqy2cr9pffYsQKntoVye9MPg1x0bZpB4TmXwei19yYoBXG93hmhqf0Jal6trzZDV8VWBNAiY4HGb
	80ssQDN0C+fApTQYiTrmXxKVE+2z//WacOUEIkFVPrjLPUdRpJrUVzmLt2s8qVIMRy+cZY62hj6Vi
	wImFWemDPw2/djtVt1Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iK16d-0000dz-5p; Mon, 14 Oct 2019 14:13:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iK16a-0000dP-1V
 for linux-mtd@lists.infradead.org; Mon, 14 Oct 2019 14:13:49 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1iK16X-00045S-Gq; Mon, 14 Oct 2019 16:13:45 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1iK16W-0003OA-Hl; Mon, 14 Oct 2019 16:13:44 +0200
Date: Mon, 14 Oct 2019 16:13:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: Re: Regression: dmaengine: imx28 with emmc
Message-ID: <20191014141344.uwnzy3j3kxngzv7a@pengutronix.de>
References: <CAH+2xPB7rbeJnOPU10Ss9BhV_2DJV-ToQ3XNOy97+vrGx+ubcg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH+2xPB7rbeJnOPU10Ss9BhV_2DJV-ToQ3XNOy97+vrGx+ubcg@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:11:15 up 98 days, 20:21, 105 users,  load average: 0.18, 0.22,
 0.32
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_071348_086175_9F9631A0 
X-CRM114-Status: GOOD (  21.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bth@kamstrup.com, vkoul@kernel.org, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, miquel.raynal@bootlin.com,
 dmaengine@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Bruno,

On Tue, Oct 08, 2019 at 10:03:16AM +0200, Bruno Thomsen wrote:
> Hi
> 
> I am getting a kernel oops[1] during boot on imx28 with emmc flash right
> around rootfs mounting. Using git bisect I found the cause to be the
> following commit.
> 
> Regression: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
> 
> Reverting the 2 changes in drivers/dma/mxs-dma.c fixes the oops,
> but I am not sure that is the right solution as I don't have the full
> mxs-dma + mtd/mmc overview.
> 
> I did see that the patch isn't a simple rename but also a bit define
> change.
> From: DMA_CTRL_ACK = (1 << 1) = BIT(1)
> To: MXS_DMA_CTRL_WAIT4END = BIT(31)
> 

Damn, I wasn't aware the DMA driver has other users than the GPMI Nand.
Please try the attached patch, it should fix it for MMC/SD. It seems
however, that I2C and AUART and SPI are also affected. Are you able to
test any of these?

Sascha

---------------------------8<---------------------------

From 3f7a1097099c9e57e31a86503edc479f9964bc95 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 14 Oct 2019 16:07:31 +0200
Subject: [PATCH] mmc: mxs: fix flags passed to dmaengine_prep_slave_sg

Since ceeeb99cd821 we no longer abuse the DMA_CTRL_ACK flag for custom
driver use and introduced the MXS_DMA_CTRL_WAIT4END instead. We have not
changed all users to this flag though. This patch fixes it for the
mxs-mmc driver.

Fixes: ceeeb99cd821 ("dmaengine: mxs: rename custom flag")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mmc/host/mxs-mmc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
index 78e7e350655c..4031217d21c3 100644
--- a/drivers/mmc/host/mxs-mmc.c
+++ b/drivers/mmc/host/mxs-mmc.c
@@ -17,6 +17,7 @@
 #include <linux/interrupt.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/dma/mxs-dma.h>
 #include <linux/highmem.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -266,7 +267,7 @@ static void mxs_mmc_bc(struct mxs_mmc_host *host)
 	ssp->ssp_pio_words[2] = cmd1;
 	ssp->dma_dir = DMA_NONE;
 	ssp->slave_dirn = DMA_TRANS_NONE;
-	desc = mxs_mmc_prep_dma(host, DMA_CTRL_ACK);
+	desc = mxs_mmc_prep_dma(host, MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		goto out;
 
@@ -311,7 +312,7 @@ static void mxs_mmc_ac(struct mxs_mmc_host *host)
 	ssp->ssp_pio_words[2] = cmd1;
 	ssp->dma_dir = DMA_NONE;
 	ssp->slave_dirn = DMA_TRANS_NONE;
-	desc = mxs_mmc_prep_dma(host, DMA_CTRL_ACK);
+	desc = mxs_mmc_prep_dma(host, MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		goto out;
 
@@ -441,7 +442,7 @@ static void mxs_mmc_adtc(struct mxs_mmc_host *host)
 	host->data = data;
 	ssp->dma_dir = dma_data_dir;
 	ssp->slave_dirn = slave_dirn;
-	desc = mxs_mmc_prep_dma(host, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+	desc = mxs_mmc_prep_dma(host, DMA_PREP_INTERRUPT | MXS_DMA_CTRL_WAIT4END);
 	if (!desc)
 		goto out;
 
-- 
2.23.0


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
