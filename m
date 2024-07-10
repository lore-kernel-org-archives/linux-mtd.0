Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187C0C3DA47
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jul 2024 01:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4S4XgBfeMv4+Tpu/pJGEZVCscd+ITajsT7DLac5m5k=; b=cLjUmcVOBnHQF0
	D3EfX4JGt0OyjhFbSy/pYdIal/YubxPiDg0tWw+1LqbBGox+YxCD141B57xMcP6ps0CfcHEOYfNBr
	JRY2nQf8FNh1+9R3akpFOsrFTTz8vU/MBZEW9b+kXDcbwPPZjdYwiCskO9YAgteCDME7hBUXTLJiJ
	w5z23Jn34WwFevoz2puwNCB8AhbGzS9sxuKNy18A3d5pvRZMxJYUWedtaAyFMKB9cjCEBHcMA7F7B
	RoCzqV0sm5TOHtMbrG41wPJs0Pz1TtOv7iJSHtSUyiIQlUXYOu4C8TyZpkDVfr+TZ+BtCChng+h0p
	qsZf2KmNxLBrmWYAaYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRLxD-000000093Rk-1PXM;
	Wed, 10 Jul 2024 01:17:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRLx9-000000093Pp-2oZ5
	for linux-mtd@lists.infradead.org;
	Wed, 10 Jul 2024 01:17:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1fb8781ef1bso19105755ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jul 2024 18:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720574223; x=1721179023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf0ReuyQOi5SXQsUOQzTmoOvTe5c8o2DFeqT2/r8W4I=;
        b=YpqEBpD69sC8LauXB/0a8nTGL/fBB8TxJ1gf+uo7WYfH411+q3i0xLImzNq5ifBA9h
         0Mw7cBwyg+mfYieOo5hFW52SQyPAe9sVUTS16piK8LKmev1qygi9cRrVV96d7HvI1aN1
         wRToy+JarikkvoKyiOf0r+Gp1gtXfSZ2QjCD6LrzUkHeVJ2SQclnI5qERsYzOTFtd1fX
         PcU2AO0ZKWsVXCKlgSGUMUGXuYymdCcuYE2qJopp4BD71lLEqZosluUNSAHWpmbKuXwX
         zZ7JjJePLmNkYmKHDfYImtA/1WDtytxlt2gwkwI+xmNlmNTv5QlDnuOi2QtyLSw9hCDL
         xCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720574223; x=1721179023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lf0ReuyQOi5SXQsUOQzTmoOvTe5c8o2DFeqT2/r8W4I=;
        b=kzx0x+JdYySLXaV1QzfHwyeP2gFnRjYQwRIx3wHskPODKhP9ruw+rayu6OOixX7ohY
         j5GRCjZX7V5TToS3B/OeC4c0rlvITm2txPENfDs+67MfHqoOo7sWYa5mgxCVcyJ4anvR
         oiWtuKgkm/7H2PtV4LUT1qScOioM+dKpUqFVoIji+F461F6mgZKJnw7E/dcgFLcc3fAd
         JYKtxN4hct0lhdQ6vizu+37E0H6zmS+Vi/vtev9wUjmcvUZza2gpCuwK2ICGCSSw5DNH
         zxOqPDrSlTc2CEeYofH4rPgAWo+11kTxxyx0cV5B7Pj2Fbbx3n+8yp3y+snxqxB5ilIX
         Px9g==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZW98qJBNks1PqQmL5wjS1TaKSjjWMK/ZGq0E4Iqj7KMg03s0mvmGy2Nf1WUeqSJuTFj6PlDSy1hsYM+T5vQXL6P1vdH+t4vzFg+OXQ==
X-Gm-Message-State: AOJu0YwctCvzpHcNymJ2NQFFCCWBAcFZPThJ/4KQ8YZSfJ26/rf6oUB1
	dV3C786pvtYRL+QW3eCe/r6PozTINbFBEvBjEFTrzGH5Lui/12LT
X-Google-Smtp-Source: AGHT+IEgKzUS2C58JGutlZ0YXRBY+FjMO0+UJyNyABmzG1f2vpoCM4JuCsrJpw5PgmaB9SqS74yOZQ==
X-Received: by 2002:a17:902:e54c:b0:1fb:5c3d:b8c3 with SMTP id d9443c01a7336-1fbb6cdab3amr35816045ad.4.1720574222520;
        Tue, 09 Jul 2024 18:17:02 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad4bc9sm22010445ad.286.2024.07.09.18.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 18:17:02 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 9157880B36;
	Wed, 10 Jul 2024 09:26:27 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 1/3] include/linux/mtd/spinand.h: Add fixups for spinand
Date: Wed, 10 Jul 2024 09:15:39 +0800
Message-Id: <20240710011541.342682-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240710011541.342682-1-linchengming884@gmail.com>
References: <20240710011541.342682-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_181703_778940_224B2223 
X-CRM114-Status: GOOD (  11.51  )
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

Add struct spi_nand_fixups as SPI NAND fixup hooks.

To determine whether the Plane Select bit should be
inserted into the column address in core.c, add the
member struct spinand_info to struct spinand_device
to ascertain whether the device has fixups.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 include/linux/mtd/spinand.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5c19ead60499..c079c6ac1541 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -354,6 +354,7 @@ struct spinand_info {
 	} op_variants;
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
+	const struct spi_nand_fixups *fixups;
 };
 
 #define SPINAND_ID(__method, ...)					\
@@ -379,6 +380,9 @@ struct spinand_info {
 #define SPINAND_SELECT_TARGET(__func)					\
 	.select_target = __func,
 
+#define SPINAND_PLANE_SELECT_BIT(__func)					\
+	.fixups = __func,
+
 #define SPINAND_INFO(__model, __id, __memorg, __eccreq, __op_variants,	\
 		     __flags, ...)					\
 	{								\
@@ -398,6 +402,18 @@ struct spinand_dirmap {
 	struct spi_mem_dirmap_desc *rdesc_ecc;
 };
 
+/**
+ * struct spi_nand_fixups - SPI NAND fixup hooks
+ * @write_to_cache: program load requires Plane Select bit in CADD.
+ * @read_from_cache: read from cache requires Plane Select bit in CADD.
+ */
+struct spi_nand_fixups {
+	unsigned int (*write_to_cache)(struct spinand_device *spinand,
+				const struct nand_page_io_req *req, unsigned int column);
+	u16 (*read_from_cache)(struct spinand_device *spinand,
+				const struct nand_page_io_req *req, u16 column);
+};
+
 /**
  * struct spinand_device - SPI NAND device instance
  * @base: NAND device instance
@@ -449,6 +465,7 @@ struct spinand_device {
 	u8 *databuf;
 	u8 *oobbuf;
 	u8 *scratchbuf;
+	const struct spinand_info *info;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
