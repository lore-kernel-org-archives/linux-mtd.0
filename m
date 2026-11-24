Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F1460A2606
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KhISs/Gb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aZuJxikh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AWBRfoxuLG8YJW3xzBEb4q5fmgBaZD/Or1E9vs3VS3A=; b=KhISs/GbsqU0Ym0FPk+QVxWHUb
	tob5unCalkg+REN2ddCcfwJIJWBNeDDsqS0v869uJzX1sj56ceQ+ejL59X9gX0IlgDEJo+lJpiTiC
	ZjWmIPTYTOIQji4ay8c9CA1nGe+h4Yxqpp+WmKL8uH/xd9Yc7TPKFvF5GEcelaLadtqt9jM/3R/JF
	FvGJy6HaN2um2KNYjlUpU3ZIzWdMxYcom/lGXbYGxMhTWxLI2a1319Z06S/VzeSNJfw01VTbdNDJ3
	k243H25YlWLYUlWYbfHkQTmg5VbmCx8GbNGfluzfXdyIASCjO7WgHERsQFPJ+zE8eV1GdUK+2/FFQ
	58ZwxRxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrkI-00000006nMO-2hsk;
	Tue, 24 Nov 2026 14:43:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrk8-00000006nFn-1Yjg
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 14:43:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 83ED34E41764;
	Tue, 24 Nov 2026 14:43:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 593D1601E1;
	Tue, 24 Nov 2026 14:43:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C96C11E6997A;
	Tue, 24 Nov 2026 15:43:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pDDeBaiwg/WpPN6897we0vfFKhysWC2sgbefrfOmhUU=;
	b=aZuJxikh/d6DIgJdWk5XmggCxkHZHGqyy+AdeNpJnF8shjY9SXNYloeIYqxLQYkgUPPs8p
	PSvyOoE4ZJfCCai+/fF4iLNOa2zuSh+/vj1DJDTmV9SXx+OcoBt4AzBap9T8ITuSLwH2Df
	naYvQDHQoIAirMrUaVSrbLVsKG+XCYGPQBSTipFGTALjWRzdG+F1kKMUzkO+zm9d18mw4l
	ZTlkKRuOlBMr3gHLxprZbjvrsBls7+C7zzx96J//9O8R5DIXFeEhcGP6zBlzW2GfyOfEDp
	rHgiCcNpaP0ETiIdIm4p+l7RdqVRMD8fkUgS8s399UduDhPnfYd7Sc2F/B2+LA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:02 +0100
Subject: [PATCH v5 1/6] spi: spi-mem: Rename the DQS setter and pin field
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-1-261e0e712857@bootlin.com>
References: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
In-Reply-To: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_064336_599431_0CCE50B8 
X-CRM114-Status: GOOD (  14.62  )
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

The current approach was a bit too simple. Using the DQS feature
requires:
1- the chip to feature a DQS pin
2- proper wiring between the host and the chip
3- the controller capability to use it

Rename the helper and the field to reflect that we are talking here
about (1) the chip capability.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 10 +++++-----
 include/linux/spi/spi-mem.h |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 8047b7508c8d..65956cf62156 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -546,7 +546,7 @@ const char *spi_mem_get_name(struct spi_mem *mem)
 EXPORT_SYMBOL_GPL(spi_mem_get_name);
 
 /**
- * spi_mem_set_dqs() - Mark DQS as being available
+ * spi_mem_set_dqs_pin_available() - Mark DQS as being available
  * @mem: the SPI memory
  *
  * When reading at high frequencies (> 100MHz), especially when DTR is enabled,
@@ -559,11 +559,11 @@ EXPORT_SYMBOL_GPL(spi_mem_get_name);
  * Set the DQS boolean if the feature is available and configured at the chip
  * level. Controllers may query this value.
  */
-void spi_mem_set_dqs(struct spi_mem *mem)
+void spi_mem_set_dqs_pin_available(struct spi_mem *mem)
 {
-	mem->dqs = true;
+	mem->dqs_pin = true;
 }
-EXPORT_SYMBOL_GPL(spi_mem_set_dqs);
+EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
 
 /**
  * spi_mem_has_dqs() - Query whether the DQS is available or not
@@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(spi_mem_set_dqs);
  */
 bool spi_mem_has_dqs(struct spi_mem *mem)
 {
-	return mem->dqs;
+	return mem->dqs_pin;
 }
 EXPORT_SYMBOL_GPL(spi_mem_has_dqs);
 
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 0cce6b57242a..55de48c277ac 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -275,7 +275,7 @@ struct spi_mem_dirmap_desc {
  * @spi: the underlying SPI device
  * @drvpriv: spi_mem_driver private data
  * @name: name of the SPI memory device
- * @dqs: extra data trobe pin available for high frequency read operations
+ * @dqs_pin: the memory provides a DQS pin
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
@@ -287,7 +287,7 @@ struct spi_mem {
 	struct spi_device *spi;
 	void *drvpriv;
 	const char *name;
-	bool dqs;
+	bool dqs_pin;
 };
 
 /**
@@ -463,7 +463,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 }
 #endif /* CONFIG_SPI_MEM */
 
-void spi_mem_set_dqs(struct spi_mem *mem);
+void spi_mem_set_dqs_pin_available(struct spi_mem *mem);
 bool spi_mem_has_dqs(struct spi_mem *mem);
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
