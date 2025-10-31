Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E536ACCF9F8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1VsfYyroGQ40GtH2bfNyrEfHjdOAGfCXs1uOcYpP+E=; b=GCOYsfs8LIsafv
	TNFc1aJvnXDXNk0LqyzksNTwHApZbXxOh/UtCTTNnkygqcTChmmPKLD38o6HDuJ1miiQYU4xR30P3
	I4DQJoF9XJYboPIixjc2RyTDDAtwXY7Lh+mx1te096ypOo0einv0XcHgtGYycTTf6H8kqTjd9dgWU
	ho0GTOVBc9H+/plsWG7SvzLCv5JpNwOf7ATjxHFxJ1nf8QqbDVVFkqtp0yV2Dpk3W76v1dlLzCEtR
	ysOH3zEVcU31IQc7cfai4pj0WE44wBRwW277RDuFLL+QwtTHq2/NRxSBbZyRvgqPfkD4DtcTCG28Y
	2TLaD51T4iTiawzhuruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswR-00000006VaN-0Jdl;
	Fri, 31 Oct 2025 17:29:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvb-00000006UYz-10oE
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9323E1A17C4;
	Fri, 31 Oct 2025 17:28:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A9AB60704;
	Fri, 31 Oct 2025 17:28:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB15C1181800B;
	Fri, 31 Oct 2025 18:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931720; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDe4j5e1a+Bm1K5ZQ2VOjxbCwe35OfOvHUNHbqYEBCM=;
	b=OQU8H40zhHDYyzpyBy35Qe++qVhY8HighZjajGJghAuu4atrS+eNn2O2JBTc4ACXcYTz5/
	2ua93PkmSv17jrw7i9lq/knC8bQtCvkoiLC+MKZq3iCDizD2yzgJz2qgSBG9hoKA8pYMvx
	ZBOQ9gpmwKclyA7hOlCiwQNH9VtXDcfk92oKOnAR87vYXwiyr5VTgFbJ/qmSeYlVZyKC+t
	d79SLWKyIUSEEeOQxF0unF2JMpWGixWuttehktjYeq/xV+ZqButVQtpFIqhGEWESGAUSu9
	kOVMCmKOw76BjYRzH5u8pgcAkKS7Rs7yTBAhPmoRtpX6QDw9Lt2IppeEFllG3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:07 +0100
Subject: [PATCH 23/28] mtd: spinand: Add support for setting a bus
 interface
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-23-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102843_535846_D54A7E5F 
X-CRM114-Status: GOOD (  14.45  )
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

Create a bus interface enumeration, currently only containing the
one we support: SSDR, for single SDR, so any operation whose command is
sent over a single data line in SDR mode, ie. any operation matching
1S-XX-XX.

The main spinand_device structure gets a new parameter to store this
enumeration, for now unused. Of course it is set to SSDR during the SSDR
templates initialization to further clarify the state we are in at the
moment.

This member is subject to be used to know in which bus configuration we
and be updated by the core when we switch to faster mode(s).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c |  1 +
 include/linux/mtd/spinand.h | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index caf549617f369ada2c1712e863e563ae547ca0e6..fc7263fad7afbd084ecf015dd1d764d6683b46a8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1321,6 +1321,7 @@ static void spinand_init_ssdr_templates(struct spinand_device *spinand)
 	tmpl->page_read = (struct spi_mem_op)SPINAND_PAGE_READ_1S_1S_0_OP(0);
 	tmpl->prog_exec = (struct spi_mem_op)SPINAND_PROG_EXEC_1S_1S_0_OP(0);
 	spinand->op_templates = &spinand->ssdr_op_templates;
+	spinand->bus_iface = SSDR;
 }
 
 static int spinand_support_vendor_ops(struct spinand_device *spinand,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 0565cdeb3f7b652699d420a8c05c3fe53fcc2253..7d059956c81a3a6fd337bab43fb4f1130997ab0f 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -480,6 +480,14 @@ struct spinand_user_otp {
 	const struct spinand_user_otp_ops *ops;
 };
 
+/**
+ * enum spinand_bus_interface - SPI NAND bus interface types
+ * @SSDR: Bus configuration supporting all 1S-XX-XX operations, including dual and quad
+ */
+enum spinand_bus_interface {
+	SSDR,
+};
+
 /**
  * struct spinand_info - Structure used to describe SPI NAND chips
  * @model: model name
@@ -642,6 +650,7 @@ struct spinand_mem_ops {
  * @flags: NAND flags
  * @ssdr_op_templates: Templates for all single SDR SPI mem operations
  * @op_templates: Templates for all SPI mem operations
+ * @bus_iface: Current bus interface
  * @select_target: select a specific target/die. Usually called before sending
  *		   a command addressing a page or an eraseblock embedded in
  *		   this die. Only required if your chip exposes several dies
@@ -677,6 +686,7 @@ struct spinand_device {
 
 	struct spinand_mem_ops ssdr_op_templates;
 	struct spinand_mem_ops *op_templates;
+	enum spinand_bus_interface bus_iface;
 
 	struct spinand_dirmap *dirmaps;
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
