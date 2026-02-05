Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F142CECD998
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 19:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuSNVqcZeKyJYssoWZIsmN4zIkzZZ53sCbFCGx/2bnc=; b=glOlplwHAukeIF
	3mmWFv3t9szQ3DDNrUkriHM7qRDQRq5T/P0NlOjW9HOnh0Jb8l4i0x3BATtTZORS2Ht2ySh3RjHvd
	14QFQLOJuYpBxT/ICMcBP6LTpMgKz41G0kF/twIfltm7MgNIHpeUKC8t2C73Gbte3sFb/03XDyyMs
	W1EHnMSanKmTgQzELHy9nwl9orWHY6YKrgMsXR/dIUYlriWss6U36QWi4afOY0ZuoTeeMM6YL2teJ
	J6pyclFJ8brZaJSXkxv4QEABG/W4dhTuX170EWiMza3VKC53lQISCDYC5AVK4wbklL6TELLK5xqed
	tJgdQy23kM9k8+HBnlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4hC-0000000APPn-2UIg;
	Thu, 05 Feb 2026 19:07:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo4hA-0000000APNg-03wJ
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 19:07:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 41B381A2C34;
	Thu,  5 Feb 2026 19:07:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18ACA6074D;
	Thu,  5 Feb 2026 19:07:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F7EE119D1750;
	Thu,  5 Feb 2026 20:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770318433; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BpN8z+kIDrZwG5aYIIQwAbhujY/X57BjDOA4OXNNt5U=;
	b=IKjNbScyxiCWSy2AsHFNMEJUi48XhsOcZqxIPvPwn1COX5iJ1z9G5/O5BygSEOUlUC5puN
	ShRwiOqUNxajOf/8BsVnL6rnvbMJksMlGYGS5/2z6zTN1rp/uzYfRBkS2IGDuESKEsc6XM
	dhSz6PiqGjZPNAxSrYzkDYFYMFcNUw80rEK1bHqBXdqEwmPgBVoc6Y2nzTYjW80FIaMWsl
	4f8hC9lTitTbFQ2Thvcb9vGXt0osF5+DRc8uXv1rI8lvcKdi+c52X/7HaZIEQY8sFJRo9n
	+yDyfLk2mMivtIi3EibJ1jTNVF8cfV8J/PasDJXJdKh/sxL8F7Z1NdtKpsVmRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 05 Feb 2026 20:06:59 +0100
Subject: [PATCH RFC 2/4] mtd: spi-nand: Set the DQS spi-mem capability if
 available
MIME-Version: 1.0
Message-Id: <20260205-winbond-nand-next-phy-tuning-v1-2-5e7d3976f0f1@bootlin.com>
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
X-CRM114-CacheID: sfid-20260205_110716_198577_6BEFAE68 
X-CRM114-Status: GOOD (  11.77  )
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

Check whether the NAND is capable of generating a DQS signal and set the
flag accordingly.

Not wiring the DQS signal on a DQS capable chip that will be used at
frequency requiring this signal may be considered a hardware bug, so
let's assume this line will be routed "in most cases". If/when we get
issues with this assumption, a DT property describing the lacking line
in the routing can be created.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 4 ++++
 include/linux/mtd/spinand.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 95df4dd5330d..67270e49c179 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1974,6 +1974,10 @@ static int spinand_probe(struct spi_mem *mem)
 	read_op = *spinand->op_templates->read_cache;
 	write_op = *spinand->op_templates->write_cache;
 
+	/* Assume manufacturer drivers will enable the DQS pin if it is available */
+	if (spinand->flags & SPINAND_HAS_DQS)
+		spi_mem_set_dqs(mem);
+
 	ret = spi_mem_execute_tuning(mem, &read_op, &write_op);
 	if (ret && ret != -EOPNOTSUPP) {
 		dev_warn(&mem->spi->dev, "Failed to execute PHY tuning: %d\n",
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 58abd306ebe3..72babba69c7a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -483,6 +483,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_PROG_PLANE_SELECT_BIT		BIT(2)
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
+#define SPINAND_HAS_DQS					BIT(5)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
