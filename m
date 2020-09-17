Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230E0C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE82821973
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 07:49:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jvw2ap5m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WfO9b84a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE82821973
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iCWqmaQLIcNyzdcld4rWfCvCLuKus9NbJt2PyZs1Lo4=; b=Jvw2ap5mP2wPIUUNIGYbTpG/D
	okJvOA40AeA6vAIN0BrdbM2e/TD+JaIxfE3+VXNdbAIZete5dDFP5OMrl/36dyQ9a4YTa8xskJkRa
	Zz2uEdfVjEEcFGvvZ58CJiuSybi0crVBU5OBeWBEfDCe4DCRBfTX720gYKFPPZCGOoEUkHzIeVfwd
	gEOhvUVLFakWg6ESamR9CO5bCr8McAgwU6q4v+3JHdD1q4/3EXHqLtn0pKy4yFtdHjBzqtJpTiZ+e
	QFtk+lg2+dLG5xKyzhENo1xcFBTHLiWJBM15hEMlPcz3U1xQnZciojov3RTKxzYtroiC67sD58/q8
	fDPeXWlNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoew-0000gJ-MX; Thu, 17 Sep 2020 07:48:50 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoed-0000ZE-S5
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2020 07:48:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mRGD124425;
 Thu, 17 Sep 2020 02:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600328907;
 bh=B649ih1ZgoNc/QhvwLRUtA7XYmEjlZKwZVP3xeo7/Cg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=WfO9b84aTVKL/yYtG5aJYtxInPc4+tsq2YeSIYOBSWgEAmkb9/L/H2IsLcTjMsQen
 pWg5kzC7G2dVOTI0ZzNTb8AnkGdyVflrLm3rhxs0dAjv2zKpCPsbn4/gcS70Zv11Wi
 GYh1EJrdSxdtAwBlC3YG6CBOrad8lqrxydaxkbYM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08H7mR7R085472
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Sep 2020 02:48:27 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 02:48:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 02:48:26 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08H7mEdv100359;
 Thu, 17 Sep 2020 02:48:24 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH 4/4] mtd: hyperbus: hbmc-am654: Add DMA support for reads
Date: Thu, 17 Sep 2020 13:17:49 +0530
Message-ID: <20200917074749.8957-5-vigneshr@ti.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200917074749.8957-1-vigneshr@ti.com>
References: <20200917074749.8957-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_034832_034360_6E2013AE 
X-CRM114-Status: GOOD (  20.35  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

AM654 HyperBus controller provides MMIO interface to read data from
flash. So add DMA memcpy support for reading data over MMIO interface.
This provides 5x improvement in throughput and reduces CPU usage as
well.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/hyperbus/hbmc-am654.c | 130 +++++++++++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/hbmc-am654.c b/drivers/mtd/hyperbus/hbmc-am654.c
index b6a2400fcaa9..b6ab55560089 100644
--- a/drivers/mtd/hyperbus/hbmc-am654.c
+++ b/drivers/mtd/hyperbus/hbmc-am654.c
@@ -3,6 +3,10 @@
 // Copyright (C) 2019 Texas Instruments Incorporated - https://www.ti.com/
 // Author: Vignesh Raghavendra <vigneshr@ti.com>
 
+#include <linux/completion.h>
+#include <linux/dma-direction.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -13,10 +17,18 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/sched/task_stack.h>
 #include <linux/types.h>
 
 #define AM654_HBMC_CALIB_COUNT 25
 
+struct am654_hbmc_device_priv {
+	struct completion rx_dma_complete;
+	phys_addr_t device_base;
+	struct hyperbus_ctlr *ctlr;
+	struct dma_chan *rx_chan;
+};
+
 struct am654_hbmc_priv {
 	struct hyperbus_ctlr ctlr;
 	struct hyperbus_device hbdev;
@@ -51,13 +63,107 @@ static int am654_hbmc_calibrate(struct hyperbus_device *hbdev)
 	return ret;
 }
 
+static void am654_hbmc_dma_callback(void *param)
+{
+	struct am654_hbmc_device_priv *priv = param;
+
+	complete(&priv->rx_dma_complete);
+}
+
+static int am654_hbmc_dma_read(struct am654_hbmc_device_priv *priv, void *to,
+			       unsigned long from, ssize_t len)
+
+{
+	enum dma_ctrl_flags flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
+	struct dma_chan *rx_chan = priv->rx_chan;
+	struct dma_async_tx_descriptor *tx;
+	dma_addr_t dma_dst, dma_src;
+	dma_cookie_t cookie;
+	int ret;
+
+	if (!priv->rx_chan || !virt_addr_valid(to) || object_is_on_stack(to))
+		return -EINVAL;
+
+	dma_dst = dma_map_single(rx_chan->device->dev, to, len, DMA_FROM_DEVICE);
+	if (dma_mapping_error(rx_chan->device->dev, dma_dst)) {
+		dev_dbg(priv->ctlr->dev, "DMA mapping failed\n");
+		return -EIO;
+	}
+
+	dma_src = priv->device_base + from;
+	tx = dmaengine_prep_dma_memcpy(rx_chan, dma_dst, dma_src, len, flags);
+	if (!tx) {
+		dev_err(priv->ctlr->dev, "device_prep_dma_memcpy error\n");
+		ret = -EIO;
+		goto unmap_dma;
+	}
+
+	reinit_completion(&priv->rx_dma_complete);
+	tx->callback = am654_hbmc_dma_callback;
+	tx->callback_param = priv;
+	cookie = tx->tx_submit(tx);
+
+	ret = dma_submit_error(cookie);
+	if (ret) {
+		dev_err(priv->ctlr->dev, "dma_submit_error %d\n", cookie);
+		ret = -EIO;
+		goto unmap_dma;
+	}
+
+	dma_async_issue_pending(rx_chan);
+	ret = wait_for_completion_timeout(&priv->rx_dma_complete,
+					  msecs_to_jiffies(len + 1000));
+	if (ret <= 0) {
+		dmaengine_terminate_sync(rx_chan);
+		dev_err(priv->ctlr->dev, "DMA wait_for_completion_timeout\n");
+		ret = -ETIMEDOUT;
+		goto unmap_dma;
+	}
+	ret = 0;
+
+unmap_dma:
+	dma_unmap_single(rx_chan->device->dev, dma_dst, len, DMA_FROM_DEVICE);
+	return ret;
+}
+
+static void am654_hbmc_read(struct hyperbus_device *hbdev, void *to,
+			    unsigned long from, ssize_t len)
+{
+	struct am654_hbmc_device_priv *priv = hbdev->priv;
+
+	if (len < SZ_1K || am654_hbmc_dma_read(priv, to, from, len))
+		memcpy_fromio(to, hbdev->map.virt + from, len);
+}
+
 static const struct hyperbus_ops am654_hbmc_ops = {
 	.calibrate = am654_hbmc_calibrate,
+	.copy_from = am654_hbmc_read,
 };
 
+static int am654_hbmc_request_mmap_dma(struct am654_hbmc_device_priv *priv)
+{
+	struct dma_chan *rx_chan;
+	dma_cap_mask_t mask;
+
+	dma_cap_zero(mask);
+	dma_cap_set(DMA_MEMCPY, mask);
+
+	rx_chan = dma_request_chan_by_mask(&mask);
+	if (IS_ERR(rx_chan)) {
+		if (PTR_ERR(rx_chan) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		return 0;
+	}
+	priv->rx_chan = rx_chan;
+	init_completion(&priv->rx_dma_complete);
+
+	return 0;
+}
+
 static int am654_hbmc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct am654_hbmc_device_priv *dev_priv;
 	struct device *dev = &pdev->dev;
 	struct am654_hbmc_priv *priv;
 	struct resource res;
@@ -96,13 +202,31 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 	priv->ctlr.dev = dev;
 	priv->ctlr.ops = &am654_hbmc_ops;
 	priv->hbdev.ctlr = &priv->ctlr;
+
+	dev_priv = devm_kzalloc(dev, sizeof(*dev_priv), GFP_KERNEL);
+	if (!dev_priv) {
+		ret = -ENOMEM;
+		goto disable_mux;
+	}
+
+	priv->hbdev.priv = dev_priv;
+	dev_priv->device_base = res.start;
+	dev_priv->ctlr = &priv->ctlr;
+
+	ret = am654_hbmc_request_mmap_dma(dev_priv);
+	if (ret == -EPROBE_DEFER)
+		goto disable_mux;
+
 	ret = hyperbus_register_device(&priv->hbdev);
 	if (ret) {
 		dev_err(dev, "failed to register controller\n");
-		goto disable_mux;
+		goto release_dma;
 	}
 
 	return 0;
+release_dma:
+	if (dev_priv->rx_chan)
+		dma_release_channel(dev_priv->rx_chan);
 disable_mux:
 	if (priv->mux_ctrl)
 		mux_control_deselect(priv->mux_ctrl);
@@ -112,12 +236,16 @@ static int am654_hbmc_probe(struct platform_device *pdev)
 static int am654_hbmc_remove(struct platform_device *pdev)
 {
 	struct am654_hbmc_priv *priv = platform_get_drvdata(pdev);
+	struct am654_hbmc_device_priv *dev_priv = priv->hbdev.priv;
 	int ret;
 
 	ret = hyperbus_unregister_device(&priv->hbdev);
 	if (priv->mux_ctrl)
 		mux_control_deselect(priv->mux_ctrl);
 
+	if (dev_priv->rx_chan)
+		dma_release_channel(dev_priv->rx_chan);
+
 	return ret;
 }
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
