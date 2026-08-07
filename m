Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73010C5ACC2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7a9XmvrLHWQJEofEKq/JSkI3NegEHXuNnExeWu9VHM=; b=Ui69qf79JCI19o
	FgA22PJICw90BS5oB5t4q7oPhSwkWj2vkzupmvvObd+x8o0YMrNs4UjGScLR7hjuS6XQJcnQ6Dk3X
	ndiwyhqhPfOf0tGj/hTFWVYctbatJM/Vc3TG03aVSffzsgBi9QmX4rC3NwqSFpF18/fokUSe3CI1S
	6xdqb/EIWs7gwXNwtXKQCThDSWcAe05T73pGBNPFJlRRwC/VoKHg2+vRn7N+bzjnGT7eoBhzwLD/W
	UmzlOfgq7Kcoc5Hh5nWIN07ZrRXuWqv9ZyLMiCfoA1S1REWcTquRJ4uewAtQkcFzmRhfLjovGw59w
	RH9l0ZWH5G996PG+mCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLqj-00000008HwN-1xAR;
	Fri, 07 Aug 2026 14:47:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsLqh-00000008Hv8-2U0j
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 14:47:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D3AFE4E4113F;
	Fri,  7 Aug 2026 14:47:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9437603F0;
	Fri,  7 Aug 2026 14:47:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A104B11C37A59;
	Fri,  7 Aug 2026 16:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786114016; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M+D8sTjzVeFMznbG6m+gAmQtgf1q7jLi1PF5q/MQlyA=;
	b=dbn8EtWfYv/MAAIJ3KDIGu2iZLV/pM0le0UcoLRVTdzkM5z1P5T7D1MWEAkvN9iDwkujfb
	ujsHB1D55R92/EVoLf/nC3QEXpDteFqE7rvR0Ps/FiEbPyHc3I+pkO/0mDOrrPGb+TrpUF
	Fuo7llqRrXHju0neRccFhOR5JeDuh3oEaU3e4pOBpDYB42vYaILTvOgKRq6bWrcSxNUO39
	cwyOP+ZvIzfuHcATZh5BRGagicZ/P9AqfjwxSKgZQJ2QahH0gvbBEEGmhpNdPh723isM0V
	ia624UYu0fsqTfrPran4scan5IAre5OTXtZ4oFkfEjwr0iUS38qoizsUI3cqKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 16:46:48 +0200
Subject: [PATCH v2 2/3] mtd: spi-nand: Set the DQS spi-mem capability if
 available
MIME-Version: 1.0
Message-Id: <20260807-winbond-nand-next-phy-tuning-v2-2-73595e89d6e3@bootlin.com>
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
X-CRM114-CacheID: sfid-20260807_074703_774561_012846C2 
X-CRM114-Status: GOOD (  10.29  )
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
index 72a630b266f8..6ffd0f1b9c26 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -2057,6 +2057,10 @@ static int spinand_probe(struct spi_mem *mem)
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
index ec6efcfeef83..fe05b477afef 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -490,6 +490,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
 #define SPINAND_ODTR_PACKED_PAGE_READ			BIT(5)
+#define SPINAND_HAS_DQS					BIT(6)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
