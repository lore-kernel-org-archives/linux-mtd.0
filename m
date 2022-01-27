Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D4FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 09:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilusjzepJxI6NPk8TTCyXK3byGa7eS8W5FzjZ4V0pl8=; b=A+pmWbmTo/Yuci
	yvbJcaKZZnUNbB1jkIARE7qowknh6+aHAI8c3hYllKLFzJxClZzIHh+/++lgEFPjUmPlh6/JjYKrI
	mBIdTiWWsO9s4EdT79pu4BhL1qlmfs5GfcKfzEJhmdLM9UbJr6uFUI0mIO8yc8pleNY8+DxPstYKB
	39stk/VKqkozEwimbd4f6jCczsw914HiOMkbIy8pQ/seoaSW3J8nSfMebnBA1jqE6rMFwMBO353gZ
	uZLsCzkVySlxr6XuroC3W+WuxlPW3Oto2NOQkpevbUB7aCpU6e7//CRC4VGHgitbHNEJx6qDfiV7e
	4DKTlphXaqp7CI3y+uWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD0v5-00EqoS-Aq; Thu, 27 Jan 2022 09:18:19 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD0v1-00EqmY-La
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 09:18:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE2D6100002;
 Thu, 27 Jan 2022 09:18:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v10 01/13] spi: spi-mem: Introduce a capability structure
Date: Thu, 27 Jan 2022 10:17:56 +0100
Message-Id: <20220127091808.1043392-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
References: <20220127091808.1043392-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_011815_876659_3D98CB1B 
X-CRM114-Status: GOOD (  14.44  )
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
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Link: https://lore.kernel.org/linux-mtd/20220104083631.40776-2-miquel.raynal@bootlin.com
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
index 7ab3fed7b804..cf99a1ee0e74 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -23,6 +23,7 @@ struct ptp_system_timestamp;
 struct spi_controller;
 struct spi_transfer;
 struct spi_controller_mem_ops;
+struct spi_controller_mem_caps;
 
 /*
  * INTERFACES between SPI master-side drivers and SPI slave protocol handlers,
@@ -415,6 +416,7 @@ extern struct spi_device *spi_new_ancillary_device(struct spi_device *spi, u8 ch
  * @mem_ops: optimized/dedicated operations for interactions with SPI memory.
  *	     This field is optional and should only be implemented if the
  *	     controller has native support for memory like operations.
+ * @mem_caps: controller capabilities for the handling of memory operations.
  * @unprepare_message: undo any work done by prepare_message().
  * @slave_abort: abort the ongoing transfer request on an SPI slave controller
  * @cs_gpios: LEGACY: array of GPIO descs to use as chip select lines; one per
@@ -639,6 +641,7 @@ struct spi_controller {
 
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
