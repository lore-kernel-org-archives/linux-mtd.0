Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85725CA0EC5
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 10:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fr0DdQ6I1G2omtRElxRX2SI9Od1M5qemez6Mw/iZliQ=; b=qSBMFEzpI2bY9T
	y60aCCQVZntebTOikIqVQIQYZDMSxnsdFzfexperHhLPl93K7926NP5u+X9P0R3Z/hsjGwfvjxSM7
	zg3OHAfyf8lMCz1hTfou5fZuWSRZZClXtWEazpo5YPWTr40eIv8iH2L4ioc+cP1GlA7pRpZYZLJ4M
	5YCjiUmFZFLb0OEJKp6JIdF7rvmFm2+KRol0NRVxlXgk4/AP8kUjyDjLhwJ3PInzaLQHXRD2UdIfS
	ob7jC7EAgSro9DDIcKT/omqo4IXt1FnERDLBTQqoP/njuVFRDqqFkDh80oKUyJcl6+amEGfsPnjsQ
	4n1GbyCgSoVCHGCNSCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyW2-00000005iHN-3vfB;
	Fri, 30 Aug 2024 10:06:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyVX-00000005i5d-2dKs
	for linux-mtd@bombadil.infradead.org;
	Fri, 30 Aug 2024 10:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FhQv81jehYoOx+1+pRcsKIRWyPRSJ60CDoR58IZcqF0=; b=QEJ4AjYWjSv5InG6R+xjO+rb7m
	PEtCNarl9lfFsj2Tw8Aio6am7jdxEHFUUPl72hD8i5++ibEDbr2hcjQgsTA09qJznXhZwACmcsrDo
	f1vbNeePxhEAvhA4eomnnchnFMFmYg2rnfJUHEzPxArIz4FdLJVdeh4+hCJcPlwDUEWhsofeelT1R
	KY4udIVr2q14nJ7CuAuFy8ta0FJ2n9JxZ/O/MrDvQKJ6hnpDRhab5zgDY5/ONAqcDEXh+usc7pnzf
	gThCYQDvlanVxBrOXmPOxLpf1UNB9AzthJKFbjYoQhQABmgh4+3PiT8pmW6jhsSbOPxqdBKRg49S2
	y1DcqDiw==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyVU-0000000Be7x-2Fvg
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 10:05:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2023dd9b86aso13310825ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Aug 2024 03:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725012325; x=1725617125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhQv81jehYoOx+1+pRcsKIRWyPRSJ60CDoR58IZcqF0=;
        b=QtJgE1ZaYl4RGvgCwbsfbSi/4Y6Sr+NV9tXljfGUSbZWaCHC8dMRdeaX4hFaiVn6PS
         Td8zt+pJdnZzM0l/f4E/fjIinrLfOIiuwUA8jtU0m5vAeT8/3TOzHrW1pljE+v3IAECm
         SaWLAllAMNbHhg/mj/5Fk9JP5bnfXdldJeY4GVsypKsC9JRI1R+GSKiEjEEYJTKD82ng
         DYSVeJKLJh+GZf5FVRZEJajkYbi3bZKAFUAHdJ4TyZmVBjyATTgEq+D6AmGDuS6dSeSn
         Eep0UdqTy/V0LKuUnGXSC3lozQClhvCXwTNXkLto5kPRZeovVsDPgHvpuAICk0baMaa9
         fSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725012325; x=1725617125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhQv81jehYoOx+1+pRcsKIRWyPRSJ60CDoR58IZcqF0=;
        b=b9TasfYEE7pvxmW/KdOAW8aHM1RHY7Ed3smw2gUK6Rb/VEXXtOyT/uaPwWW94DueS1
         dqh79krOjzRT5A+O0vL5QZJReUKeCIRVYDD8MDgMZPaeSQzrMgSpnqQ41DiQTc5MBY7S
         nFecI1b5Ft26Bd+Xsdm6XFiy7L1vflNm3PWefs3viZbW/2K/61R16GSHZWaGbkk8MLf2
         XCQBddMsEh6NLK7AvAQeOSxPjZvsD+6s95g/Qgd0gAl34P+pkSXxLmIUL7rfsdVnY73E
         17lRtrYXxjWHFYmlo2RZsGjEx+LP3Z4dqdxeW/kQGnqkirfGraq6KmDMo6zzE2XhFD5y
         eqhg==
X-Forwarded-Encrypted: i=1; AJvYcCU6lBNGPZVcAlbiqvVbfXR0cKfZRxSSulVfWK+p3Vt0EPkj/cmooEA+AcE1ZjkmGD94C76C3LJJM4M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwpquAeo75Lw8fxlYDTBuLitx29e+DyMboz/OitCetBXI/4xGht
	c5bnkTDCVnWWv+vHO6ZQM8CzFb1DXJNIkHA9btYsYGzoONXpBsmH
X-Google-Smtp-Source: AGHT+IEEY/dv/vIcB5h62pI0nEUacj3+bS1H10RrD2W04PiglXKVsuq2qH1jtGC+ML7zHnSz5DjaEQ==
X-Received: by 2002:a17:902:da8d:b0:202:18af:2f9d with SMTP id d9443c01a7336-2050c350625mr69836085ad.31.1725012324406;
        Fri, 30 Aug 2024 03:05:24 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515545d91sm23885375ad.223.2024.08.30.03.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 03:05:23 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id EF4FE802C7;
	Fri, 30 Aug 2024 18:13:57 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v5 1/2] mtd: spinand: Add support for setting plane select bits
Date: Fri, 30 Aug 2024 18:03:09 +0800
Message-Id: <20240830100310.1553675-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240830100310.1553675-1-linchengming884@gmail.com>
References: <20240830100310.1553675-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_110528_705087_62C96A20 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Add two flags for inserting the Plane Select bit into the column
address during the write_to_cache and the read_from_cache operation.

Add the SPINAND_HAS_PP_PLANE_SELECT_BIT flag for serial NAND flash
that require inserting the Plane Select bit into the column address
during the write_to_cache operation.

Add the SPINAND_HAS_READ_PLANE_SELECT_BIT flag for serial NAND flash
that require inserting the Plane Select bit into the column address
during the read_from_cache operation.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 6 ++++++
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfe..e7b592cdbb4c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -386,6 +386,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	else
 		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
 
+	if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
+		column |= req->pos.plane << fls(nanddev_page_size(nand));
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
 		if (ret < 0)
@@ -460,6 +463,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	else
 		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
 
+	if (spinand->flags & SPINAND_HAS_PROG_PLANE_SELECT_BIT)
+		column |= req->pos.plane << fls(nanddev_page_size(nand));
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
 		if (ret < 0)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c19ead60499..0e0df620da53 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -312,6 +312,8 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_PROG_PLANE_SELECT_BIT		BIT(2)
+#define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
