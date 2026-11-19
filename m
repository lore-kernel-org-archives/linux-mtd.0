Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2996606A333
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nRgDAck7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ejJJG9h+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3NggFKn2MSjR9XT3vi4xwELcvFYlYjhO8qjuKvPkkV0=; b=nRgDAck76Bh3X/vBXJ90QIEB1M
	FIWe9jvq47nQHms1a3qESv82DHH+9Mvl4KnJP6GuSaRyOyX7VZMOOLBUzMw6bGX1y3bqBtmUrlJTM
	Uzy3sdMCNnjOpRrsxbEdfdpJ99O2XEF7ajP4NH9Tgh7WqfANcIUKnQkVTkmLRQX6e3b83Pi6XdONR
	BFYmzgXsnx+rKdK3TQsfCWd64eK/XF2KzPi2hGL76SUEjv+Tg/gL8xiorusc3tE04m1HEYypoANVi
	ORLuzOuqWREJlSLA1kFDAGgERx5i6S42o4EP+mBU2hMwHf4kZHgghKYnSZ4maisllPJUNUWSYrspO
	8CmaGlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAc1-0000000DZLK-2kLr;
	Thu, 19 Nov 2026 22:28:13 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAbz-0000000DZJr-1TX2
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:28:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id ABE18C2F4C7;
	Thu, 19 Nov 2026 22:28:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44ADC6035B;
	Thu, 19 Nov 2026 22:28:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 755CD11BC0F19;
	Thu, 19 Nov 2026 23:28:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795127284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OCZOn+cqE7e8uuH9fPsFEjtoD65VvfhvTdGx7l8MCeE=;
	b=ejJJG9h+HwUK1ruKz7msG2z2+KZiCuHu+/LuJRCDjTxiG+ln/m1h7zzMAr/l5m6cm7g8v3
	9pWW1sOHtVfpbL53NT8N5s75EmLycspO3iuooUJy12AKgqkhPe0MpHZShlVqdbv5sYx+qZ
	vhNYoHCDgFUP8BvcmaB+aKXG7N/o9xbA3x1Yx7dtLCPBz8VcANS2KZVEdU5ISPq9JrtIzz
	axCioZR/BJM+rGSRnsQIIH3wbGoYDcm31hYJN/mTCX5n/WHSOWKf0Ts00akWpiCoXouxDs
	tx4Eeq9Yuc9G517J2l800omstzX6YcpL1njtoPJo18OJDKxqnW0EfBU7lW9pQA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:27:56 +0100
Subject: [PATCH 1/2] mtd: rawnand: cadence: Fix DMA device dereference when
 DMA is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-perso-upstreaming-rawnand-fixes-v1-1-0c95641b550c@bootlin.com>
References: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
In-Reply-To: <20261119-perso-upstreaming-rawnand-fixes-v1-0-0c95641b550c@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_142811_549190_5AAA6972 
X-CRM114-Status: GOOD (  11.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move the DMA resource mapping into the has_dma branch and only unmap the
resource when a DMA channel was actually acquired.

Fixes: 5c56bf214af8 ("mtd: rawnand: cadence: fix DMA device NULL pointer dereference")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202603252339.fQzI6oc8-lkp@intel.com/
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/202609010758.3N8tYZdG-lkp@intel.com/
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index e19ceb2d5dfc..42cc62b36457 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -3168,17 +3168,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 					    "%d: Failed to get a DMA channel\n", ret);
 			goto disable_irq;
 		}
-	}
 
-	dma_dev = cdns_ctrl->dmac->device;
-	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
-						  cdns_ctrl->io.size,
-						  DMA_BIDIRECTIONAL, 0);
+		dma_dev = cdns_ctrl->dmac->device;
+		cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
+							  cdns_ctrl->io.size,
+							  DMA_BIDIRECTIONAL, 0);
 
-	ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
-	if (ret) {
-		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
-		goto dma_release_chnl;
+		ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
+		if (ret) {
+			dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
+			goto dma_release_chnl;
+		}
 	}
 
 	nand_controller_init(&cdns_ctrl->controller);
@@ -3204,8 +3204,9 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 	return 0;
 
 unmap_dma_resource:
-	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
-			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
+	if (cdns_ctrl->dmac)
+		dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
+				   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
 dma_release_chnl:
 	if (cdns_ctrl->dmac)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
