Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865D0C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVZ2Logqjq49TJbdMJA0B4JfGqrInOflwQR9BJMWVaA=; b=JC1GsHjk6pOmb8
	ZrRT5SE847M0lGQ7c9baP151MdXhv5yefe314YRDkUs+AfYSMucqCaImF2f5HBGPqVkbRo9c6Qy9d
	YlSCckBkM1CEHXi0Y3Zvk6c01tgGWaVosHnAV0p8bF9eN+IyNCaeyYaNtw/WdAQv8lvaHpYzHwaa+
	dVGdGdjCcxwU4U/2Hq+TsWBEMGJGNHOvnD4lQMVMBtPoZxL6CAQaMGNsxOWMOfPjMqm1Yw55KfWE5
	UORcqTF0CFxAMm/M8BfNNUj0BokV/5ZzXU1F/lZ3URsOFA7xobbaI7TlUx5ofahsuW7x52vllXa3u
	qnivZ97ghGHA/lCbbSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqxE-0007fT-OS; Wed, 23 Nov 2022 14:42:24 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqwR-0007Vz-Mb
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 14:41:38 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:881b:815b:474d:c3fd])
	by michel.telenet-ops.be with bizsmtp
	id nqhS2800P49U0Rd06qhSXE; Wed, 23 Nov 2022 15:41:30 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwH-001Rql-Rb; Wed, 23 Nov 2022 15:41:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1oxqwH-0012Ho-7B; Wed, 23 Nov 2022 15:41:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 6/6] memory: renesas-rpc-if: Remove Runtime PM wrappers
Date: Wed, 23 Nov 2022 15:41:22 +0100
Message-Id: <d87aa5d7e4a39b18f7e2e0649fee0a45b45d371f.1669213027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669213027.git.geert+renesas@glider.be>
References: <cover.1669213027.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_064135_928976_2A932417 
X-CRM114-Status: GOOD (  12.90  )
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

Now the rpcif_{en,dis}able_rpm() wrappers just take a pointer to a
device structure, there is no point in keeping them.  Remove them, and
update the callers to call Runtime PM directly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This could be split in three patches for three different subsystems,
with the changes to <memory/renesas-rpc-if.h> postponed, to relax
dependencies, but the previous patch already touches all three
subsystems anyway.

v2:
  - New.
---
 drivers/mtd/hyperbus/rpc-if.c   |  6 +++---
 drivers/spi/spi-rpc-if.c        |  6 +++---
 include/memory/renesas-rpc-if.h | 10 ----------
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index 41734e337ac00e40..ef32fca5f785e376 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -130,7 +130,7 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, hyperbus);
 
-	rpcif_enable_rpm(hyperbus->rpc.dev);
+	pm_runtime_enable(hyperbus->rpc.dev);
 
 	error = rpcif_hw_init(hyperbus->rpc.dev, true);
 	if (error)
@@ -150,7 +150,7 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 	return 0;
 
 out_disable_rpm:
-	rpcif_disable_rpm(hyperbus->rpc.dev);
+	pm_runtime_disable(hyperbus->rpc.dev);
 	return error;
 }
 
@@ -160,7 +160,7 @@ static int rpcif_hb_remove(struct platform_device *pdev)
 
 	hyperbus_unregister_device(&hyperbus->hbdev);
 
-	rpcif_disable_rpm(hyperbus->rpc.dev);
+	pm_runtime_disable(hyperbus->rpc.dev);
 
 	return 0;
 }
diff --git a/drivers/spi/spi-rpc-if.c b/drivers/spi/spi-rpc-if.c
index 5063587d2c724c7c..ec0904faf3a10bd0 100644
--- a/drivers/spi/spi-rpc-if.c
+++ b/drivers/spi/spi-rpc-if.c
@@ -147,7 +147,7 @@ static int rpcif_spi_probe(struct platform_device *pdev)
 
 	ctlr->dev.of_node = parent->of_node;
 
-	rpcif_enable_rpm(rpc->dev);
+	pm_runtime_enable(rpc->dev);
 
 	ctlr->num_chipselect = 1;
 	ctlr->mem_ops = &rpcif_spi_mem_ops;
@@ -169,7 +169,7 @@ static int rpcif_spi_probe(struct platform_device *pdev)
 	return 0;
 
 out_disable_rpm:
-	rpcif_disable_rpm(rpc->dev);
+	pm_runtime_disable(rpc->dev);
 	return error;
 }
 
@@ -179,7 +179,7 @@ static int rpcif_spi_remove(struct platform_device *pdev)
 	struct rpcif *rpc = spi_controller_get_devdata(ctlr);
 
 	spi_unregister_controller(ctlr);
-	rpcif_disable_rpm(rpc->dev);
+	pm_runtime_disable(rpc->dev);
 
 	return 0;
 }
diff --git a/include/memory/renesas-rpc-if.h b/include/memory/renesas-rpc-if.h
index 86a26ea78221a204..b8fa30fd6b500c73 100644
--- a/include/memory/renesas-rpc-if.h
+++ b/include/memory/renesas-rpc-if.h
@@ -76,14 +76,4 @@ void rpcif_prepare(struct device *dev, const struct rpcif_op *op, u64 *offs,
 int rpcif_manual_xfer(struct device *dev);
 ssize_t rpcif_dirmap_read(struct device *dev, u64 offs, size_t len, void *buf);
 
-static inline void rpcif_enable_rpm(struct device *dev)
-{
-	pm_runtime_enable(dev);
-}
-
-static inline void rpcif_disable_rpm(struct device *dev)
-{
-	pm_runtime_disable(dev);
-}
-
 #endif // __RENESAS_RPC_IF_H
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
