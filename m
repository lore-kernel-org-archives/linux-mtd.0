Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEA7D185E9
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTF7w8nEEbGZUVq42hd8Ri1mXByDd2wLlrIZMszZ04A=; b=NxmpXcMPanZE7c
	14cSitqPApJoiC3oE/tjRQi9hSA89zMapH/A4Rub0/xEfaF9ObyXuOsxj50CrdTDo28GgrSQZNFtO
	MPLuAlEwP02nbmsExXfzscxln2bD2nApe9M+NvkE6JB7PBToOEUzSVZOGFx9qRQPX0Lmb/QjurTbM
	/O27rT76UDy5KR6hbrUnbZd2c32TPDXFLirnYIsIvA67xj8e4VNrVrM5mOGQWMPB5FjGNi0IKeuOG
	pKFK9j7zVwjtfTSISPIUZod3G1o28YmTru65umwBOWrtY/QpJHC0vqs9YS/MLX8TP/VaB4dXTjrbx
	IBhSf5qiFHqG/Xtst3Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdoud-0000000Gx7L-1SiB;
	Thu, 08 Jan 2026 12:14:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdouX-0000000Gx4w-2dNJ
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 12:14:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7D04A4E41FF7;
	Thu,  8 Jan 2026 12:14:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5227B606B6;
	Thu,  8 Jan 2026 12:14:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFA67103C884A;
	Thu,  8 Jan 2026 13:14:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767874477; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GcnNzhpdPlZ5n1HxgNSnyTR4UedrULIHbNSNIa/dxO0=;
	b=PDtI9oAetiU3mWrrsZci8HdfSYYC1CBJFH7RTeXhigVifYc2HMDi3Q2ETJoD+BKQCSmKQv
	LfdSFa7vAvb34kZlXZCXAd4ZbgXZPpjGLutZsYfAbiu0juuOLodNVjMf2M4B3ECkkhyONh
	W3BTUQXYdaNuPIqBI+mWpzO5iSPTRgCPz+8gWrbmhGdgihBLpJLFLyzFFZ01lwdMFmWaey
	/3bm5ry033UMrq2rhzn4PmBzljDm+8cEvnpex29cBtH/Ab2J4erAAXOfgxTEg5bmuispxI
	NtAvXtpvEcI66BbkQ99R3X8QSEIrVxuR9sktQ0X1GvAK4NJC3oYwxgkemi1eQA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Jakub Czapiga <czapiga@google.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/2] mtd: spi-nor: Rename spi_nor_spimem_check_op()
Date: Thu,  8 Jan 2026 13:14:30 +0100
Message-ID: <20260108121430.1096844-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_041442_218979_23C02569 
X-CRM114-Status: GOOD (  11.20  )
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
page operation oriented, despite its name. It has already been misused
in commit 5008c3ec3f89 ("mtd: spi-nor: core: Check read CR support"), so
rename it to clarify its purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1f2e312feec7..8d91052cc21e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2345,15 +2345,15 @@ int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
 }
 
 /**
- * spi_nor_spimem_check_op - check if the operation is supported
- *                           by controller
+ * spi_nor_spimem_check_page_op - check if a page operation is supported
+ *                                by controller
  *@nor:        pointer to a 'struct spi_nor'
  *@op:         pointer to op template to be checked
  *
  * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
  */
-static int spi_nor_spimem_check_op(struct spi_nor *nor,
-				   struct spi_mem_op *op)
+static int spi_nor_spimem_check_page_op(struct spi_nor *nor,
+					struct spi_mem_op *op)
 {
 	/*
 	 * First test with 4 address bytes. The opcode itself might
@@ -2396,7 +2396,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 	if (spi_nor_protocol_is_dtr(nor->read_proto))
 		op.dummy.nbytes *= 2;
 
-	return spi_nor_spimem_check_op(nor, &op);
+	return spi_nor_spimem_check_page_op(nor, &op);
 }
 
 /**
@@ -2414,7 +2414,7 @@ static int spi_nor_spimem_check_pp(struct spi_nor *nor,
 
 	spi_nor_spimem_setup_op(nor, &op, pp->proto);
 
-	return spi_nor_spimem_check_op(nor, &op);
+	return spi_nor_spimem_check_page_op(nor, &op);
 }
 
 /**
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
