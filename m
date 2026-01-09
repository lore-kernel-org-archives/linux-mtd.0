Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA92D26D7A
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2caZNi+mRmCvuRN5OPYjpM626HNsSL69n3IxwkshbtQ=; b=LWufznxevoo6GD
	vuvWbeAjQX60pAws3Tbm6H0ZcS2bNq0kNCAHCO77M4am3ABHJvC4B8G7UPbbTpmAFGZJQGW1XBBBW
	wBdiOAEDGRFoE7ZbPyxLAQWbLd4FegElh1hMwyU8spxQSHhq9CT6SzVi14zf9BRYE2lGVIXAwuJJF
	o4hHnWtcGYh5QYUW1BNfP+1ndrKYqk00sxGy733hn0JPqBzSCNyhtNcsupiTn+vD/DIvOUo1GlhBR
	iHCMaXx/UjeLjfhT7TlwC8IA+OvdXfyHx29cp8z89T/k5GHHh7URVbMdpn7jOnNSs2J6QkE0AEwK1
	jNVlYeDxonoa9ibHKelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGEW-00000002o5q-2k35;
	Fri, 09 Jan 2026 17:25:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGES-00000002o2H-02zv
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:25:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1DDC94E42027;
	Fri,  9 Jan 2026 17:18:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1D25606C6;
	Fri,  9 Jan 2026 17:18:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E61B103C89AB;
	Fri,  9 Jan 2026 18:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=B1lJ7HTagSCXQak24k+E5wMJF7OUHHqDYZn/cpX8YLs=;
	b=qFAxyJAMLb9dmFmKXyEEX6aOVWiaZsvLf/JgV8Nu5MS2v0FWtQj5sUmWamEm8tqYjjdeDG
	RKPO/cdOiIdLVV/tFca8S+hzonDigZUasYPfCMo1egKvLX0DkeaaInf2k8OgCrS9jWZfeg
	yAqqMnmkWfo5UJHHhgR1ov+2Tm8VWKjPCNWpDLwHDrxx/jHzM8Ija3m5epByh+dkY5pytf
	2seIAYysMfVNLj0vPPSmzakb3OZ3EMfyGxm+AY8mZIjexLb3o2Sy/PZyyuiXqByl2O3lt9
	Y+2Ma7V+ixBNl2rQefpZ2A5U1lBaB9gHGCCj0mjDZruhLQbo+WW2b02UGwS2eg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:20 +0100
Subject: [PATCH v2 22/27] mtd: spinand: Add support for setting a bus
 interface
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-22-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092504_236358_974D86B7 
X-CRM114-Status: GOOD (  14.96  )
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
index 54a32cea3755..a5166b49020c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1406,6 +1406,7 @@ static void spinand_init_ssdr_templates(struct spinand_device *spinand)
 	tmpl->page_read = (struct spi_mem_op)SPINAND_PAGE_READ_1S_1S_0_OP(0);
 	tmpl->prog_exec = (struct spi_mem_op)SPINAND_PROG_EXEC_1S_1S_0_OP(0);
 	spinand->op_templates = &spinand->ssdr_op_templates;
+	spinand->bus_iface = SSDR;
 }
 
 static int spinand_support_vendor_ops(struct spinand_device *spinand,
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 88871287c739..027923841bba 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -481,6 +481,14 @@ struct spinand_user_otp {
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
@@ -643,6 +651,7 @@ struct spinand_mem_ops {
  * @flags: NAND flags
  * @ssdr_op_templates: Templates for all single SDR SPI mem operations
  * @op_templates: Templates for all SPI mem operations
+ * @bus_iface: Current bus interface
  * @select_target: select a specific target/die. Usually called before sending
  *		   a command addressing a page or an eraseblock embedded in
  *		   this die. Only required if your chip exposes several dies
@@ -678,6 +687,7 @@ struct spinand_device {
 
 	struct spinand_mem_ops ssdr_op_templates;
 	struct spinand_mem_ops *op_templates;
+	enum spinand_bus_interface bus_iface;
 
 	struct spinand_dirmap *dirmaps;
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
