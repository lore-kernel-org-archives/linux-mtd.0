Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FE1C3DA64
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 07:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nHskX7dGFjP+rHIU7vDXWvXCpn3KxkWZ2tuZXsCUSE=; b=PuRnf3mQBMbtEf
	zDJPQJ1UUCl2EgbHKnOyNcWuEywbNLmpmSDMAzJDHNDVrkttT1Nw7UhD8ob45D/U/65B/FTYtBcjT
	vOBYCFyo3Ifd0K4LcPbeztKqFtNB2N/T9LUNhMqA2TjpKsIhYBRWZg7xIBkEd1QUn32IOsbYgYHmM
	NmjZhEu9HOZzEAqF22F8IlbiA5GcAObm+l/q20s1MDa4GvPmpPRexk2Z2aKOD6kKASnLYTn2KlM3S
	a6EFqfh8GY7KR29T6m7vaqfDMympu7DMRYIcCI/o4NmzORTz3WOgZc8e/3/oNAMgp+a+Z3NLn/Unm
	uyP/y78A2ySczo9weGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULyw-0000000GIl2-22vy;
	Thu, 18 Jul 2024 07:55:18 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULyr-0000000GIiN-3pCo
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 07:55:15 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-6e7b121be30so337759a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jul 2024 00:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721289313; x=1721894113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zGrCg8VhTmLD0aLX+w4E73uJbqDmnmbt+ImN796bnI=;
        b=nYnYn5MZ3rkIIRTQDFvV9Qn0e8wMYBEn/gN/J9duSI/8ooJjpu3Fpu0HJtyjQ8AC5e
         E3p8NaSqJBtw2eQsRohVGhAG6RFp5873rdeL2/qyhkI+5bm27SpjmYJl/nFZskC49w6r
         4HnIfR/jhzKNZ4y2/bsyIg+8SeImoVvXfSGiHyNp7CNqWwLEz9UXWpxgSXFveXujUGNP
         9PStF+kN9RlnQVM7SnLqlQaCB2Bm6nKGkYtYWbysoYItzDFtnsEUU922TO+n9ziiskmF
         A7I0NKiDEPEX5uPLXAw1E9YyVMQiPhaLziOUx0Gsgh8jS25koXeMxpP+djBmMh2yc7ed
         3/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721289313; x=1721894113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zGrCg8VhTmLD0aLX+w4E73uJbqDmnmbt+ImN796bnI=;
        b=eH+nWX4yziCtsbkTNYRdXQsC6yki70NLt1f7vIM1DgvdaF7eI2fGpmMhiM9l5rthp9
         MIPnL2lJnAsParRuCCYJiF6UUA9VY7csPGXQZdGAfLSTEpY4nBdSL4DMSlsj9jha7ZfW
         N+R29bI88eLHKi73Q7N+HvCmdm4q1o1rhXeqQW8Z0mqY7e7motgNfAYh3MG6H9S4z0vP
         c+zwPtwlLI0gZnd10ovRvUi7TSMJcUtBTxySUh+50loAgv0q0ac0kBOqhR1vqrEEFWKt
         LZn5ofWYobTzIkM4PaE/2h+WGlPh8CUdGzqY3J2AJeuaEgrGtm7IWG2C8bdJqmqqgoM5
         fFig==
X-Forwarded-Encrypted: i=1; AJvYcCXeK6l4l+iBhwgeHoPszmrr86P7QIk2nxXlW2YeSLx41GF8Pig7sT0Ehi0BF13H05pTGH5Ah502Z2jdqVyktV0M4HrcTlX9Uqe5nXiPGg==
X-Gm-Message-State: AOJu0YyMRCEzZVnAqENl7GNOi1+bixsy36OwURPE97ONWcJ7ZRZZvna4
	qsomMgk2oFUuF6f2edNEIFGChrh6BEVQbwr6TUSlvimBtjWNjO+s
X-Google-Smtp-Source: AGHT+IGKgiWigJXzomZvECnUkql5Cf8v2ttJLEsNwindBn7ewU9Bi5f1BD8oLj7r0N9Dmc1mxbR5Ig==
X-Received: by 2002:a05:6a20:841c:b0:1be:d5e9:b444 with SMTP id adf61e73a8af0-1c3fdb0b9d2mr5070964637.0.1721289312888;
        Thu, 18 Jul 2024 00:55:12 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc392a7sm86526905ad.230.2024.07.18.00.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:55:12 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id F2151805EF;
	Thu, 18 Jul 2024 16:04:23 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 2/2] mtd: spinand: macronix: Fixups for Plane Select bit
Date: Thu, 18 Jul 2024 15:53:56 +0800
Message-Id: <20240718075356.488253-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718075356.488253-1-linchengming884@gmail.com>
References: <20240718075356.488253-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_005514_021309_441131D0 
X-CRM114-Status: GOOD (  11.39  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Macronix serial NAND flash with a two-plane structure
requires insertion of Plane Select bit into the column
address during the write_to_cache operation.

Additionally, for MX35{U,F}2G14AC, insertion of Plane
Select bit into the column address is required during
the read_from_cache operation.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 66 ++++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f9e9c572854..eda67091edc0 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -100,6 +100,54 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+/**
+ * write_plane_select_bit_in_cadd - Write Plane Select bit to the column address
+ * @spinand: SPI NAND device
+ * @req: NAND I/O request object
+ * @column: the column address
+ *
+ * Macronix serial NAND flash with a two-plane structure
+ * should insert Plane Select bit into the column address
+ * during the write_to_cache operation.
+ *
+ * Return: the column address after insertion of Plane Select bit
+ */
+static unsigned int write_plane_select_bit_in_cadd(struct spinand_device *spinand,
+			const struct nand_page_io_req *req, unsigned int column)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	return column | (req->pos.plane << fls(nanddev_page_size(nand)));
+}
+
+/**
+ * read_plane_select_bit_in_cadd - Write Plane Select bit to the column address
+ * @spinand: SPI NAND device
+ * @req: NAND I/O request object
+ * @column: the column address
+ *
+ * MX35{U,F}2G14AC also need to insert Plane Select bit
+ * into the column address during the read_from_cache operation.
+ *
+ * Return: the column address after insertion of Plane Select bit
+ */
+static u16 read_plane_select_bit_in_cadd(struct spinand_device *spinand,
+			const struct nand_page_io_req *req, u16 column)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	return column | (req->pos.plane << fls(nanddev_page_size(nand)));
+}
+
+static const struct spi_nand_fixups write_fixups = {
+	.write_to_cache = write_plane_select_bit_in_cadd,
+};
+
+static const struct spi_nand_fixups read_and_write_fixups = {
+	.write_to_cache = write_plane_select_bit_in_cadd,
+	.read_from_cache = read_plane_select_bit_in_cadd,
+};
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -157,7 +205,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+			 SPINAND_PLANE_SELECT_BIT(&write_fixups)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -175,7 +224,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+			 SPINAND_PLANE_SELECT_BIT(&write_fixups)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -215,7 +265,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+			 SPINAND_PLANE_SELECT_BIT(&read_and_write_fixups)),
 	SPINAND_INFO("MX35UF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -225,7 +276,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+			 SPINAND_PLANE_SELECT_BIT(&write_fixups)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -255,7 +307,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+			 SPINAND_PLANE_SELECT_BIT(&read_and_write_fixups)),
 	SPINAND_INFO("MX35UF2G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -265,7 +318,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+			 SPINAND_PLANE_SELECT_BIT(&write_fixups)),
 	SPINAND_INFO("MX35UF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
