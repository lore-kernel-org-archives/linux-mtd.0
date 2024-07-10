Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CF7C2BD09
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 01:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLtG8melpOl+z1NB0keSuOwQZDy17s5XYTfvOFr2v/8=; b=HVZpIs2i3ri1OL
	lWYpNC2DeNSFmCzvVdDp7lrWNbJ3saqRIdHwbEAGbPC/K0W5pAwBLERTqA+r3fWdm6hNDtoaohLPI
	e1JUi02L4Rfxtv+pOEVuSEEFErT46SuH7RxfCNjTQLHku8ra6CWtvNtLelsPc1FrVbNi+qNM/6IrC
	OQxFDzKzb+OTU4wK14lQ+vhpPSpsXW1aOhzbWyEVoz5hmaiAFpzV4hbEhPaZgQJlPxWcGGxLjRUvf
	tie3aMNpvROBgCp6tJMzt1Jpc6YuNLXmlVzknU4ji+9kzpDFhtDtzNUM/eZxWIY7uaRpugnZ0L92T
	7H+e5r/kPpTMuGq+VB+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRLxI-000000093Tf-2Ywr;
	Wed, 10 Jul 2024 01:17:12 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRLxG-000000093RV-04wU
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 01:17:11 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70b4a8a5587so794544b3a.2
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2024 18:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720574224; x=1721179024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GEYUgRgAX3U4wZonxbVp1RvGhxBw1XYv1pj8Gg2uytQ=;
        b=Ej3yMpxs7gNgN4vDLzZc7aVBisjg/0GXk8+QbtJ8OmXkWul5PgRTxnWoVGIHGibNfd
         PrKJo7g4GO65SLonKfqp2FyDDuWU4Pnbu3tc8FPDw1F3RPospcw6w+qDwKg41XMM5m2w
         DN+5i79e7zINIoeZe55B55ZQd3RYKGQVd5YY6kgWuW3SyyuYZTswe1nRTfLjBoeEqGRv
         YRRtqIrG/2veAhaDw8qw/imNdADP7qj8iLJl9Bi2ZJlOGgSHr2AyyP+bRZ+mnxvDBenp
         EL0pTmqKj2B2qdlHVJtfXNN4nHjgRFqYoxe00UkNAIJFYE32jx0qZ2ROpXP5SAvearQJ
         C1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720574224; x=1721179024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEYUgRgAX3U4wZonxbVp1RvGhxBw1XYv1pj8Gg2uytQ=;
        b=btp/zkSUCclAK//JHguTaBI+GDNKv5QISrL3uKIZ5OBCHyeqWITEXHCW50+AWdrqYq
         L7zmlJciKVcK/eIvlYGkpbsaPB1jwpx1Yww4v9ZJwvjWDxsZf3aUi9mt97ifIzUVO6uR
         IhO7n7H+0sRg9xKoWSA2/9D3Hj77J/REKL48hEAduqAHb8TvaXmUTckJA/tUkmhAUwEy
         XqMqlEzEq/0RHB2ZC7dcyMb+qKGsM3luyWNlqvFxdiYUwov1opf0sjlTM4hIUBa8o6ZQ
         TWdyDOt6lekYTrRAo8yg5xYYWRDHNozmovKvSXFok631vjH0MTtWsPD4BInUj1vbVpJQ
         rK9A==
X-Forwarded-Encrypted: i=1; AJvYcCVyrRQ8y2mvb1fqK3/Dnpb4EJ0AqIrCHIFrJzeBWUyv4VuR5v97hKEhbquyRBP5nl2Uds/hscVbASjI8nnMVNODl9cibF/6hs47KCg+Hw==
X-Gm-Message-State: AOJu0Yy96+1ziEyqkElSYtkphPDF0pJ/G9/YDeynhlHnb70VK3H4X+NO
	Rkv3zNvWhRgcUZ5y3IdiGfI4NPczBfkEocMvolzy+2uNDmDGq81d
X-Google-Smtp-Source: AGHT+IHmS97jexThoPIwIyD6WHVucBTTOKtk03NW9U9PP/pL/Peaar9imzg5L17ydYUIhYovDsgw0A==
X-Received: by 2002:a05:6a20:da8a:b0:1c2:8d3f:793 with SMTP id adf61e73a8af0-1c2984cda76mr4332546637.46.1720574224311;
        Tue, 09 Jul 2024 18:17:04 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c99a95624dsm10689540a91.20.2024.07.09.18.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 18:17:03 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 5526B80D2B;
	Wed, 10 Jul 2024 09:26:28 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 2/3] mtd: spinand: macronix: Fixups for PLANE_SELECT_BIT
Date: Wed, 10 Jul 2024 09:15:40 +0800
Message-Id: <20240710011541.342682-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240710011541.342682-1-linchengming884@gmail.com>
References: <20240710011541.342682-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_181710_345856_B36B7109 
X-CRM114-Status: GOOD (  11.44  )
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
 drivers/mtd/nand/spi/macronix.c | 51 +++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 3f9e9c572854..c61f1ba31f0c 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -100,6 +100,39 @@ static int mx35lf1ge4ab_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+/**
+ * Macronix serial NAND flash with a two-plane structure
+ * should insert Plane Select bit into the column address
+ * during the write_to_cache operation.
+ * Additionally, MX35{U,F}2G14AC also need to insert Plane
+ * Select bit into the column address during the read_from_cache
+ * operation.
+ */
+static unsigned int write_Plane_Select_bit_in_cadd(struct spinand_device *spinand,
+			const struct nand_page_io_req *req, unsigned int column)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	return column | (req->pos.plane << fls(nanddev_page_size(nand)));
+}
+
+static u16 read_Plane_Select_bit_in_cadd(struct spinand_device *spinand,
+			const struct nand_page_io_req *req, u16 column)
+{
+	struct nand_device *nand = spinand_to_nand(spinand);
+
+	return column | (req->pos.plane << fls(nanddev_page_size(nand)));
+}
+
+static const struct spi_nand_fixups write_fixups = {
+	.write_to_cache = write_Plane_Select_bit_in_cadd,
+};
+
+static const struct spi_nand_fixups read_and_write_fixups = {
+	.write_to_cache = write_Plane_Select_bit_in_cadd,
+	.read_from_cache = read_Plane_Select_bit_in_cadd,
+};
+
 static const struct spinand_info macronix_spinand_table[] = {
 	SPINAND_INFO("MX35LF1GE4AB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x12),
@@ -157,7 +190,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+			 SPINAND_PLANE_SELECT_BIT(&write_fixups)),
 	SPINAND_INFO("MX35LF2G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -175,7 +209,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
-		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL),
+			 SPINAND_PLANE_SELECT_BIT(&write_fixups)),
 	SPINAND_INFO("MX35LF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -215,7 +250,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+			 SPINAND_PLANE_SELECT_BIT(&read_and_write_fixups)),
 	SPINAND_INFO("MX35UF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -225,7 +261,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+			 SPINAND_PLANE_SELECT_BIT(&write_fixups)),
 	SPINAND_INFO("MX35UF4G24AD-Z4I8",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -255,7 +292,8 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
-				     mx35lf1ge4ab_ecc_get_status)),
+				     mx35lf1ge4ab_ecc_get_status),
+			 SPINAND_PLANE_SELECT_BIT(&read_and_write_fixups)),
 	SPINAND_INFO("MX35UF2G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa4, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
@@ -265,7 +303,8 @@ static const struct spinand_info macronix_spinand_table[] = {
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
