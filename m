Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3595CC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmtMxDAAO+8P3WhYC6guV1ukg7FnE+BH50OaR6fqcx4=; b=jFpBZ1K5iBgZrD
	96FBtWtHoKpYDMrW7Mdi+M/2d5RdfNb9CVfOGBvDP3COShTSI7ECnLZw/3XC6ZQlXoxJHgkh24vsn
	WRDn+O9+Fc9dA1wb40nE3KNcJheJpsozoo3b6MW+5UPVEsD0xPiqYhj2ZCpq0Rr+uc5aJm1Gxp71E
	C/xBcvWHianFkRumXxLcEazHYIQov/AV3+xmyysRDa3oAd28YWCeCCB46lzqIJz4e3T7305AM0/ml
	X6F+yqNkspf3hXZshbGSZzCvSWecplda3U94Wgeacqr0xWywtQ3QSmWYMWPyTppfpSpc2VEHRw/K6
	oo4a60U55PyOMGgbSCAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4fJW-00Ako8-8S; Tue, 04 Jan 2022 08:37:02 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fJ8-00AkeG-DU
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 08:36:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 852B21C0004;
 Tue,  4 Jan 2022 08:36:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>
Cc: Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v9 01/13] spi: spi-mem: Introduce a capability structure
Date: Tue,  4 Jan 2022 09:36:19 +0100
Message-Id: <20220104083631.40776-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220104083631.40776-1-miquel.raynal@bootlin.com>
References: <20220104083631.40776-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_003638_633647_06A22DCE 
X-CRM114-Status: GOOD (  14.65  )
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

Create a spi_controller_mem_caps structure and put it within the
spi_controller structure close to the spi_controller_mem_ops
strucure. So far the only field in this structure is the support for dtr
operations, but soon we will add another parameter.

Also create a helper to parse the capabilities and check if the
requested capability has been set or not.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 11 +++++++++++
 include/linux/spi/spi.h     |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 85e2ff7b840d..38e5d45c9842 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -285,6 +285,17 @@ struct spi_controller_mem_ops {
 			   unsigned long timeout_ms);
 };
 
+/**
+ * struct spi_controller_mem_caps - SPI memory controller capabilities
+ * @dtr: Supports DTR operations
+ */
+struct spi_controller_mem_caps {
+	bool dtr;
+};
+
+#define spi_mem_controller_is_capable(ctlr, cap)	\
+	((ctlr)->mem_caps && (ctlr)->mem_caps->cap)
+
 /**
  * struct spi_mem_driver - SPI memory driver
  * @spidrv: inherit from a SPI driver
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 8371bca13729..7ec6450142e0 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -23,6 +23,7 @@ struct software_node;
 struct spi_controller;
 struct spi_transfer;
 struct spi_controller_mem_ops;
+struct spi_controller_mem_caps;
 
 /*
  * INTERFACES between SPI master-side drivers and SPI slave protocol handlers,
@@ -419,6 +420,7 @@ extern struct spi_device *spi_new_ancillary_device(struct spi_device *spi, u8 ch
  * @mem_ops: optimized/dedicated operations for interactions with SPI memory.
  *	     This field is optional and should only be implemented if the
  *	     controller has native support for memory like operations.
+ * @mem_caps: controller capabilities for the handling of memory operations.
  * @unprepare_message: undo any work done by prepare_message().
  * @slave_abort: abort the ongoing transfer request on an SPI slave controller
  * @cs_gpios: LEGACY: array of GPIO descs to use as chip select lines; one per
@@ -640,6 +642,7 @@ struct spi_controller {
 
 	/* Optimized handlers for SPI memory-like operations. */
 	const struct spi_controller_mem_ops *mem_ops;
+	const struct spi_controller_mem_caps *mem_caps;
 
 	/* gpio chip select */
 	int			*cs_gpios;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
