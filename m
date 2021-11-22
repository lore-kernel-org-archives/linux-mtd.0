Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70204C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpY6FB0Re3D1O8wVckj6+pdyqmy5+IKkR8jSNWqBYVM=; b=M/YVgFlf56Q8Je
	LZ8/T0tU0yrUaGEUGMznkeJGZxR/v5qhCVFEbGGTxMccN3jSaPEY2dK+4gQ7z1L01kbmbI8rNY6W9
	/O/sRMU5S5PmK6/m/UJMdNasSmhgObG9324m9QUyn1cquEMKZxo3gLw5DRjLoQlidbeN/DMzlKQDj
	QJv3pLn7aoegtSB8IzRrr7qYi3Eru13ZeX0AsWOOep9HIaoFATmYOKfjSamMXqYXWcNzsEa+zxGKj
	+gctws5wTBluIaG6hK78bNJpml7msACOAhtrclvTqVx4QwRspEb2x4Hts6IYP1jrNCFowlxRB96MP
	phoA/V/zBOkxQs8/biIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6aV-00Fqm6-UJ; Mon, 22 Nov 2021 10:30:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5yb-00FguM-2x; Mon, 22 Nov 2021 09:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574664; x=1669110664;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G++AZegXG6OJFxY33wkZV7lC2nsSie4mebL61LveTYg=;
 b=E4Sjo4a+EXMv5cAr0GOmdx98mq5Pom1JTKk2AGFfZQVB3/zB0En/ETk9
 dM9zxW/0RsXLAJCiNl9nXHVXrGLhkL7GATg1+9SsGIMIJN9dIKIwtEh1L
 nPuinK6vFb+ftJePX9eJAC6fm9D/M5olrchNiQC8gotxYPit/EQ7kGfIT
 gAIVyH1uDjhZOqVRMazy2z3IsLFSPJtzXkllINFTO4arUk19V/Ab5XF4L
 kVkucVeZ0MymYSqswYufUIvkh+v0g2e4aZcyBo12VfoImthiAoArf1yrx
 DPbfmUOXJhEEEc90qWRoLpzJboNIZAGhFZe6e/ujcJA5phk+XlcN+plBV A==;
IronPort-SDR: TrDXZwC6yvhRq1b1+umN8cRD4+hYc3CNzYBl7+zQhQ5eqj5f1KvHjFrg+EQipu1x4jpEvmBF1m
 HfJTSqEFFkvWR6QKDlInhC9wMyVnW5Tus1g8O9xxM4aMHiXDFF01kBTMVWa1gSTWU5xg9+QRiv
 J7Z5oS5GZJvfi3ttjGpz5cxSpbBcogimEwdAIo1gNGehVE5HsPGiZC81y7+coVSTZQENdo1IqL
 AIg9pmYKcK/BocLqeJwwXyJRkGmhb5Riu/Bei7tUWUFnZbJ3iKA3nt0SAPDz6rCRmKM5DiBn2Y
 DvEubHI8vnO9oe4ZX/ubRkTF
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="152761267"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:51:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:51:03 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:50:58 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 07/13] mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
Date: Mon, 22 Nov 2021 11:50:14 +0200
Message-ID: <20211122095020.393346-8-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122095020.393346-1-tudor.ambarus@microchip.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015105_200551_2033338A 
X-CRM114-Status: GOOD (  13.71  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Group NOR flags initialization. Introduce a dedicated function for
setting the fixup_flags and emphasise when those flash_info flags
should be set: when the SNOR_F_4B_OPCODES/SNOR_F_IO_MODE_EN_VOLATILE
setttings can not be discovered by SFDP for this particular flash
because the SFDP table that indicates this support is not defined
in the flash.
In case the table for his support is defined but has wrong values,
one should instead use a post_sfdp() hook to set the SNOR_F equivalent
flag.

No functional change intended in this patch.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
v4: no changes

 drivers/mtd/spi-nor/core.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 14f92d105878..43668978ca5e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2692,6 +2692,25 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 }
 
+/**
+ * spi_nor_init_fixup_flags() - Initialize NOR flags for settings that can not
+ * be discovered by SFDP for this particular flash because the SFDP table that
+ * indicates this support is not defined in the flash. In case the table for
+ * this support is defined but has wrong values, one should instead use a
+ * post_sfdp() hook to set the SNOR_F equivalent flag.
+ * @nor:       pointer to a 'struct spi_nor'
+ */
+static void spi_nor_init_fixup_flags(struct spi_nor *nor)
+{
+	const u8 fixup_flags = nor->info->fixup_flags;
+
+	if (fixup_flags & SPI_NOR_4B_OPCODES)
+		nor->flags |= SNOR_F_4B_OPCODES;
+
+	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
+		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
+}
+
 /**
  * spi_nor_late_init_params() - Late initialization of default flash parameters.
  * @nor:	pointer to a 'struct spi_nor'
@@ -2710,6 +2729,7 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
 		nor->info->fixups->late_init(nor);
 
 	spi_nor_init_flags(nor);
+	spi_nor_init_fixup_flags(nor);
 
 	/*
 	 * NOR protection support. When locking_ops are not provided, we pick
@@ -3147,7 +3167,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	struct mtd_info *mtd = &nor->mtd;
 	int ret;
 	int i;
-	u8 fixup_flags;
 
 	ret = spi_nor_check(nor);
 	if (ret)
@@ -3197,13 +3216,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	fixup_flags = info->fixup_flags;
-	if (fixup_flags & SPI_NOR_4B_OPCODES)
-		nor->flags |= SNOR_F_4B_OPCODES;
-
-	if (fixup_flags & SPI_NOR_IO_MODE_EN_VOLATILE)
-		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
-
 	ret = spi_nor_set_addr_width(nor);
 	if (ret)
 		return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
