Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D71C2A09B
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIJy7qe+BmVHgNI37sF8UPMQK3e2iJa0GI/kboxPktc=; b=Xmq6TaNmRMhssX
	/mSqOtQcsmJcgH6ax4ReD5J5ObV9p739EHjFJncrQ2sf00d0kU4xAPv6RrEW/Q0k0AnUv2WfJFU5N
	MDdKkyQz7hOsp4wfcdY2yf38d8iFY/EHWzNUy7MuepUGfyqsd4KZmZtZ6oJHQA7c/n04gjtDeIqnn
	ic8VvNXSYQVZtafrSBocX/JHh5gXIJjx+XgM1B5kzonadrSB+xP2LzHsynyipF3GImEVDTjZRf0pQ
	3/tekxzF/pvyG9ChWRAG35SfsyE9/g3PCTOR80bM9GQ5N1mV9ScJhvZaEKyY9XB+XPZUa0qqIjj24
	+aVDXJR2XfqYbEUajPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLqg-00000008Hv7-0xU6;
	Fri, 07 Aug 2026 14:47:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLqd-00000008HuM-0MlM
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:47:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7AC4E1A14B2;
	Fri,  7 Aug 2026 14:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 505BC603F0;
	Fri,  7 Aug 2026 14:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3BC711C37A5C;
	Fri,  7 Aug 2026 16:46:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786114015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iyEhVWiiJcMafyU2wvE/rdUOzD3sdnM9u1y11KR3HLs=;
	b=dwyPBSkORIwBhtcXMH3U1Tl8HmDDkGLV6ErCoTW7EAuvYbTM6A59mxFohdz+KBGaCrx+Yv
	MrqA0FqFHCmjHfI2DU+LNiIHeZsaRgG5tEL46l9ZQ8cFjpk+3Hv8xg8PLSycj9ZwOEnJGk
	rN8qN7E7VOvfLXKTD8oJH8GjB2lkffn7Llx4FAKiq+lmnZJw9Wuap2AufWPgD1OEfIi1HK
	7mhPGayFIdDPORQJBCmzPTfzj4ts3N00PIsVrbkmv9aTCOkidJ0mfuDGM0OohY2nQSyBZA
	R4dvWvKKoDvJIRHXcxPgSOU0ycOGv16Z+GVrij6ZiisC7k4iP54ckkoGRRS8zQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 16:46:47 +0200
Subject: [PATCH v2 1/3] spi: spi-mem: Flag DQS capability
MIME-Version: 1.0
Message-Id: <20260807-winbond-nand-next-phy-tuning-v2-1-73595e89d6e3@bootlin.com>
References: <20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com>
In-Reply-To: <20260807-winbond-nand-next-phy-tuning-v2-0-73595e89d6e3@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_074659_275053_90488134 
X-CRM114-Status: GOOD (  12.82  )
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

DQS is a typical SPI memory signal used to help with reading the data on
the bus at high speeds (especially in DTR mode) by avoiding clock
skews. The chip generates a clock signal synchronized with its data
output fronts, also called data strobe.

SPI NOR and SPI NAND cores must set this flag in order to indicate to
other layers that DQS is available.

Create a getter and a setter to reach this capability.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-mem.c       | 32 ++++++++++++++++++++++++++++++++
 include/linux/spi/spi-mem.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 1816d9d2712a..cb5ec486f494 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -541,6 +541,38 @@ const char *spi_mem_get_name(struct spi_mem *mem)
 }
 EXPORT_SYMBOL_GPL(spi_mem_get_name);
 
+/**
+ * spi_mem_set_dqs() - Mark DQS as being available
+ * @mem: the SPI memory
+ *
+ * When reading at high frequencies (> 100MHz), especially when DTR is enabled,
+ * transfer speed is limited due to clock skews. In particular, the controller
+ * does not know the board propagation delay nor the memory chip internal delay
+ * (clock in to data out) and thus cannot optimize its sampling points.
+ * Mitigating this limitation is possible with the addition of a data strobe
+ * signal, commonly named DQS.
+ *
+ * Set the DQS boolean if the feature is available and configured at the chip
+ * level. Controllers may query this value.
+ */
+void spi_mem_set_dqs(struct spi_mem *mem)
+{
+	mem->dqs = true;
+}
+EXPORT_SYMBOL_GPL(spi_mem_set_dqs);
+
+/**
+ * spi_mem_has_dqs() - Query whether the DQS is available or not
+ * @mem: the SPI memory
+ *
+ * Return: a boolean indicating whether the DQS signal is available or not.
+ */
+bool spi_mem_has_dqs(struct spi_mem *mem)
+{
+	return mem->dqs;
+}
+EXPORT_SYMBOL_GPL(spi_mem_has_dqs);
+
 /**
  * spi_mem_adjust_op_size() - Adjust the data size of a SPI mem operation to
  *			      match controller limitations
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index c4e7ebafdf0e..89d3f0218cc9 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -275,6 +275,7 @@ struct spi_mem_dirmap_desc {
  * @spi: the underlying SPI device
  * @drvpriv: spi_mem_driver private data
  * @name: name of the SPI memory device
+ * @dqs: extra data trobe pin available for high frequency read operations
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
@@ -286,6 +287,7 @@ struct spi_mem {
 	struct spi_device *spi;
 	void *drvpriv;
 	const char *name;
+	bool dqs;
 };
 
 /**
@@ -463,6 +465,8 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 }
 #endif /* CONFIG_SPI_MEM */
 
+void spi_mem_set_dqs(struct spi_mem *mem);
+bool spi_mem_has_dqs(struct spi_mem *mem);
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
 u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
