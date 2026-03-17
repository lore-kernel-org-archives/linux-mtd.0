Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562A1FD7072
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 10:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B0VYika/XRuUm4AOqI/lI5Fxp4YIDQgqG6MXKlh8bMA=; b=CtEOulY3qhYVmf
	x+8O2MNgdfZ2VMcrP9eU4Ja7jgCinm8c6j3Je7b37vLLssly8v9mfsS5WIyKw/JrJCaLcJtJe9rkY
	2Na5MGuMqbSmpQ4TxajJkiGbVnBgIghX5vkzAen2qaUgqoMeZFJCBwP98N8n4oYLuVXxxy5cGFPkY
	DX9dz1ntCJs9E91kaewerahma+JB6j0lBrGcs6NIPJxERAy7xvS+tOusVorTH/agjrgsuW+eC6G/v
	Pq3FI/lyCott5nkDW6s8VKUO2kGXlBELUEW08vwDnaRHBEnlXGuhLBPNGR2B4MYTP9/aU6zejB0El
	A4ynOxJXv3KqzJgnvumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RYL-00000005ymu-0Z7n;
	Tue, 17 Mar 2026 10:21:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RYH-00000005ykX-2McY
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 10:21:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F262E4E42572;
	Tue, 17 Mar 2026 10:21:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C76E45FC9A;
	Tue, 17 Mar 2026 10:21:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00AC0104503AE;
	Tue, 17 Mar 2026 11:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773742885; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LjZb7xXljjrbNpez1xJJok5pk9sa+1dEs6IiIbKk5hk=;
	b=vvuwWNFUw9wIr2dStbm7XzPt7wn+ot0V+Pt1z8P0Kv6bzjqTfIY3NV4hO4OLtVU5gLMM4A
	ybDdxx3RSlPmkz9zgBaY499HsIF4Esqata914jvGcT4t1WNOXGeYje1F3iQwAOWG5DvEFy
	5+fgsEdW2pDNiI4fikCg6711tkKPWAjc4TtWJqcPhyodvtFX/MmWgmmOD+qpZS0eQNqglp
	LBgK+yenwdXSHzH3zNuJZDiZDzk1a+PQWKKIjh3Z83YVuUTZebUKtgWqLCN4PXg3KuD3yp
	C2AW0AFwFme5C9mtp5lgMgJi07jzSC1I+hl3X2aBJS0v2W6BJ2VRb/+5V6yNUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
Date: Tue, 17 Mar 2026 11:21:15 +0100
Message-ID: <20260317102115.321807-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_032129_739934_70C59CBF 
X-CRM114-Status: GOOD (  12.20  )
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

This helper really is just a little helper for internal purposes, and is
I/O operation oriented, despite its name. It has already been misused
in commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support"), so
rename it to clarify its purpose: it is only useful for reads and page
programs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Propose a new helper name, not including "page" in it.
---
 drivers/mtd/spi-nor/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 13201908a69f..4ba5943cdd2f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2345,15 +2345,15 @@ int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
 }
 
 /**
- * spi_nor_spimem_check_op - check if the operation is supported
- *                           by controller
+ * spi_nor_spimem_check_io_op - check if a read or a page program operation is
+ *                              supported by controller
  *@nor:        pointer to a 'struct spi_nor'
  *@op:         pointer to op template to be checked
  *
  * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
  */
-static int spi_nor_spimem_check_op(struct spi_nor *nor,
-				   struct spi_mem_op *op)
+static int spi_nor_spimem_check_io_op(struct spi_nor *nor,
+				      struct spi_mem_op *op)
 {
 	/*
 	 * First test with 4 address bytes. The opcode itself might
@@ -2396,7 +2396,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 	if (spi_nor_protocol_is_dtr(nor->read_proto))
 		op.dummy.nbytes *= 2;
 
-	return spi_nor_spimem_check_op(nor, &op);
+	return spi_nor_spimem_check_io_op(nor, &op);
 }
 
 /**
@@ -2414,7 +2414,7 @@ static int spi_nor_spimem_check_pp(struct spi_nor *nor,
 
 	spi_nor_spimem_setup_op(nor, &op, pp->proto);
 
-	return spi_nor_spimem_check_op(nor, &op);
+	return spi_nor_spimem_check_io_op(nor, &op);
 }
 
 /**
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
