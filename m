Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4738C3DA49
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2024 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Hje6VQgu9gEQ9VUy8+SxqXE3vasnEfELEsPVHzOdiM=; b=sYk+KCmM6PkGdm
	Y1IDV7AsLDje5fXuoRNM8gGcIOlWpGVx3wqHlo9Uh7nipY4V31kHzp5JA6PyXvDvlJo+PXEuhxoZ1
	EqkHRCNVN6zADdmsm/WFlmF8/v0lAMwHhqjYCCEYxaaVGgNZCgS7r7e4RMsLlHU4YRZrPTi1uPcg3
	v3ryVbfhDJbTGupUru803AYeFDQzmGyksrS9ly9t+krJlncf1NKgUZS9nL2yJ2WQ/2lNdt4TWqtsu
	wLErxucjMEj0c51q3RsJiPjB/uG/uTpTKD1jy8xB8710mvEvVUHgurtfxpVGOB1Aikhm6HM5zTKSn
	U7T+gZxxibRFmbwSrIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULyv-0000000GIkV-3J1M;
	Thu, 18 Jul 2024 07:55:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULyr-0000000GIiJ-2fAW
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jul 2024 07:55:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70af5fbf0d5so324824b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jul 2024 00:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721289312; x=1721894112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=304XxPdIY97QOPQp6+4IYR7ZGs5YizzMEdMpSztbtjU=;
        b=MsBWTvyx228Jmp9HiFzIuGeDpjcAYyCdqsvX/BmC6RQsQsuPMig2XB7SQlzT7Y5Um0
         meaZR8mJVrrSvY5+7ooI22FmIi+hoYZy/T7aG6v6oRll8K764NnuY8S1ZSfuEd/2pyEs
         w4vuTX8EunaEOO9nopCWTZ1+nMEj4Ia5VQrdc2pK7HiRxkxzKFL4DTChYxbp74HBuLp+
         5rRdCzV11KqTvZntL8Z29ibnCEQZk71nXs96QPTRWnjnc/c7qL8xL1L5I4mfGjAPookU
         CJmsib+CWJolFIA9ivzMfbaEWfUeXgS89FhirHazytJWMEzL1VzEM7nc9OUD05ouIWrz
         pVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721289312; x=1721894112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=304XxPdIY97QOPQp6+4IYR7ZGs5YizzMEdMpSztbtjU=;
        b=h6vStfAZC08rW3yHTLoglc+0jSP5mnofDBcc6g0vQ567bbDHFxuY/wGhvcEE7Fhfl8
         rGzrsWwUwmzDn3tQ1kTvawL42KLB6ru1Ng8pCQJU42eEo2eHhFFDF2pmSmUfds6tS340
         QKWX9N5RiIC6sf5RFIIlQs0L/UwFnI5UVTNnsQNnDfrR+AtDToRKaLi+JZidaCd2abEu
         8hEUBsreGzFXNySrkm2kYG8GzVDPIkI06QliP+w9V3xxYLMYApc6LPGK2cID6ZaLMIcL
         KQ+bQjxUqRX0CvqgmBtHtc/wriAcq2TbJgxarjwJZe4uV3atIGUfbcon8llgegFOsui5
         vV0g==
X-Forwarded-Encrypted: i=1; AJvYcCVG80ery/xQC5vcz5o8OW6a83shxTqKhVZSFI7i460Oe8kcprqXPj3l+WHNSJHXs5nV3NJXChYKhQbSwCP/IEgbtbnSCP2x3ry8PZVFfA==
X-Gm-Message-State: AOJu0Yy8vykj1FRQD2b3LeSoJe5cmiD07baaZxKORPRoZfatniUtWFE/
	Q4PjlpPr69UBl5IMSdQQZrTk/i4hTPM6GrycJ65GaP/XVkwvKfcR
X-Google-Smtp-Source: AGHT+IEWxyPiFAAxxPlAPxq+aPk2bH8COQh+m7VS8/MYAxBvVhN9mvGG7OF8ruvsGlqyh01ysR3BMg==
X-Received: by 2002:a05:6a00:78f:b0:70a:ee81:2fa2 with SMTP id d2e1a72fcca58-70ceeaaa6b8mr3052670b3a.2.1721289312447;
        Thu, 18 Jul 2024 00:55:12 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca69f0sm9443573b3a.150.2024.07.18.00.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:55:12 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 7D21580483;
	Thu, 18 Jul 2024 16:04:22 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 1/2] mtd: spinand: Add fixups for spinand
Date: Thu, 18 Jul 2024 15:53:55 +0800
Message-Id: <20240718075356.488253-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718075356.488253-1-linchengming884@gmail.com>
References: <20240718075356.488253-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_005513_706324_5456D82D 
X-CRM114-Status: GOOD (  13.53  )
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
inserted into the column address, add the member
struct spinand_info to struct spinand_device to
ascertain whether the device has fixups.

In the function spinand_read_from_cache_op and
spinand_write_to_cache_op, add an if statement
to determine whether the device has fixups and
their corresponding functions. If so, give the
Plane Select bit to the column address.

In the function spinand_match_and_init, add
spinand_info in spinand_device for determing
whether Plane Select bitg should be inserted.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c |  7 +++++++
 include/linux/mtd/spinand.h | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index e0b6715e5dfe..d6d6f3832f9d 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -386,6 +386,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	else
 		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
 
+	if (spinand->info->fixups && spinand->info->fixups->read_from_cache)
+		column = spinand->info->fixups->read_from_cache(spinand, req, column);
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
 		if (ret < 0)
@@ -460,6 +463,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	else
 		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
 
+	if (spinand->info->fixups && spinand->info->fixups->write_to_cache)
+		column = spinand->info->fixups->write_to_cache(spinand, req, column);
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
 		if (ret < 0)
@@ -1095,6 +1101,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		spinand->flags = table[i].flags;
 		spinand->id.len = 1 + table[i].devid.len;
 		spinand->select_target = table[i].select_target;
+		spinand->info = info;
 
 		op = spinand_select_op_variant(spinand,
 					       info->op_variants.read_cache);
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
