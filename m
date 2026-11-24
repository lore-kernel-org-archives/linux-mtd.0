Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8E60A2608
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQ03ZBJs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2Q5aO5hJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MzPhMLGN0aS6FQ48xcHS5JM/wpsZCvPbXF88Pe7SXWU=; b=nQ03ZBJsyDJAuM2S7E3xN/4GpK
	AD4v392H+5jOL7eYxCtWlzlpMgwAigy4si0Tj5H2/Z1UpBVhdaLsSOR3+cBM1XRycp+ALdA8r1PPa
	X3khL+JK7YuYxf8JH501yPwckoc47sOptENyloH3giN1hL1e4v9tJFSDqDX44KdKIaG8m0PWemeyI
	WZ6h7OdjUqkgrcadYD/wGquZAUg8OBEKGnzmDIx5YVbyY5AjlrgX0nqZz0x6urR4+8hGizvGHvwwc
	yi0/H05pRET0/+9HfwgUy/wcIXpqrzl44QbXHIQHqDev0flk5iRJAN/9H8PB8xYTicI0h/mPDYCvF
	0E+FTz5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrkJ-00000006nMt-1Llg;
	Tue, 24 Nov 2026 14:43:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrkF-00000006nKI-2B3A
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 14:43:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D4E5B1A17C6;
	Tue, 24 Nov 2026 14:43:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2903601E1;
	Tue, 24 Nov 2026 14:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2368311E6998F;
	Tue, 24 Nov 2026 15:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rsSEC3YMSOYTdSlx2oUUkC2uE8Ycw6TWa+yYdC0gjCk=;
	b=2Q5aO5hJ5+SN9asIz5WDsyYJxyxD74MgXS0GLwv5PFHifYgtWbwzN9brjfMZMyFxM3g8qD
	h+GT+NL9y6pNEnPvCGEDGtffLrpTgyA1A9sEtebBkzEpfd/PsXXEcaD3ep3O0T763j0XwX
	qKjDSrOj4L6gzQ/XSSsL9CWpvWONE1JqImCVi1JdeR6dknbJMLR6Mw/fCRGMyMAOJiflX+
	WKozlbUjK8JpPSkscMiEWb9IOAxQ3aCzlhJJAWMMklCTkpszggFKJUNaa80UVgXs42tozX
	5b99EfzCn8xLRAVLTVC+QcZti4c7DXvTtZthztdUOjCNhu62HazsjIM7A01H9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:05 +0100
Subject: [PATCH v5 4/6] spi: spi-mem: Take the DQS wiring into account
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-4-261e0e712857@bootlin.com>
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
X-CRM114-CacheID: sfid-20261124_064343_936681_E24CAA9E 
X-CRM114-Status: GOOD (  16.76  )
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

The DQS line may not be routed between the memory and the controller.
Parse the spi-dqs-not-wired property when the SPI memory device is
created and only report DQS as available when the memory supports it and
the line is wired.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 7 +++++--
 include/linux/spi/spi-mem.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 76674750237e..9537756e5afc 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -8,6 +8,7 @@
 #include <linux/dmaengine.h>
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/sched/task_stack.h>
@@ -569,11 +570,11 @@ EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
  * @mem: the SPI memory
  *
  * Return: a boolean indicating whether the DQS signal is usable or not. DQS is
- * usable when the memory supports it.
+ * usable when the memory supports it and the line is wired.
  */
 bool spi_mem_dqs_is_usable(struct spi_mem *mem)
 {
-	return mem->dqs_pin;
+	return mem->dqs_pin && mem->dqs_wired;
 }
 EXPORT_SYMBOL_GPL(spi_mem_dqs_is_usable);
 
@@ -1089,6 +1090,8 @@ static int spi_mem_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	mem->spi = spi;
+	mem->dqs_wired = !device_property_read_bool(&spi->dev,
+						    "spi-dqs-not-wired");
 
 	if (ctlr->mem_ops && ctlr->mem_ops->get_name)
 		mem->name = ctlr->mem_ops->get_name(mem);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 82c417a661e0..ed581a4d4e9a 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -276,6 +276,7 @@ struct spi_mem_dirmap_desc {
  * @drvpriv: spi_mem_driver private data
  * @name: name of the SPI memory device
  * @dqs_pin: the memory provides a DQS pin
+ * @dqs_wired: the DQS line is routed to the controller
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
@@ -288,6 +289,7 @@ struct spi_mem {
 	void *drvpriv;
 	const char *name;
 	bool dqs_pin;
+	bool dqs_wired;
 };
 
 /**

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
