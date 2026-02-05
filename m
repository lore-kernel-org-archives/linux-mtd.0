Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF21CECD995
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 19:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tbLcp834IIln1sJ0CqmDjXDKCNc8OtFa2NgJHVAIo+Q=; b=T+rN0FNMA+DIuz
	GQIuSdNQsc3VrM71sdas5zoR3oQ+fZhIl2f8XIyrZrNO+gSxLmrRujCsKcpAwY9zdqCNJ5cqOoVb1
	+qtQ4rAHU4hdPnhjmNWPdEvOkQWU0EHJPvrzWy22gu8l5UWyGhPqe5Fqx1DnWXr1GnNEVMpkxpyXT
	4+1EADEtC0KFCY7bGf9cfqDX40anHW/IJYJ4FRzzMYp26o30xiIr5uitwcpI9f+iyvozL0dMlRqUM
	i1g7kZQ3+9F+2Nb5ysn2W5mXKH8qemyCKsLQCMbzgbPGc6pJqvZhlDxnWn8tWY75zZ9hOe4+CSxc2
	aoz/ONKy3VObClKb8AYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4hB-0000000APOj-1E8n;
	Thu, 05 Feb 2026 19:07:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4h8-0000000APMs-3BOI
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 19:07:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1E3EEC243B3;
	Thu,  5 Feb 2026 19:07:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D311B6074D;
	Thu,  5 Feb 2026 19:07:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7685D119D1700;
	Thu,  5 Feb 2026 20:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770318431; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6dF/17CA4aFWIO+80ewE32jYEzEuuauKlwQf6WYBUQo=;
	b=zrZK+CkoK6bofm8eBAttaZNEVv+aghn2O+YH3IE6CEniuKxy+0xH+AvY2yoOupOC89/1Qw
	8q/dYNe0ot67DvC/Mez8n2kC2kKlzFarAChTp9UmekqBWSuDuNwG+Y4coLudRK7GaR4XS1
	YvMNZFM3SBioejL93oslTNqneiXuPlKdWjh3L46AZ9AMiEnxsVQFWncmdX5ndE0J8xVgnv
	zziGK0E7pFSYwi8bAe6fY0vNYgJ2g6npvTUBTXFd1b5SYh7bcan2wKGWQAlP/PHHebLMS3
	XoYCOs9CSJy0SDjs+OPL5DYA2sOgi/5RoHoWKdu9JCL6VzEFQlI9pXm+qqE0ZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 05 Feb 2026 20:06:58 +0100
Subject: [PATCH RFC 1/4] spi: spi-mem: Flag DQS capability
MIME-Version: 1.0
Message-Id: <20260205-winbond-nand-next-phy-tuning-v1-1-5e7d3976f0f1@bootlin.com>
References: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
In-Reply-To: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_110714_946196_FD978A42 
X-CRM114-Status: GOOD (  14.31  )
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
---
 drivers/spi/spi-mem.c       | 32 ++++++++++++++++++++++++++++++++
 include/linux/spi/spi-mem.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 444bd8ec34f5..b746a821c984 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -534,6 +534,38 @@ const char *spi_mem_get_name(struct spi_mem *mem)
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
index a0543ca09da4..b58963242ba6 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -259,6 +259,7 @@ struct spi_mem_dirmap_desc {
  * @spi: the underlying SPI device
  * @drvpriv: spi_mem_driver private data
  * @name: name of the SPI memory device
+ * @dqs: extra data trobe pin available for high frequency read operations
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
@@ -270,6 +271,7 @@ struct spi_mem {
 	struct spi_device *spi;
 	void *drvpriv;
 	const char *name;
+	bool dqs;
 };
 
 /**
@@ -440,6 +442,8 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 }
 #endif /* CONFIG_SPI_MEM */
 
+void spi_mem_set_dqs(struct spi_mem *mem);
+bool spi_mem_has_dqs(struct spi_mem *mem);
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
 u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
