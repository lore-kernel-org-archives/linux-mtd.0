Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C21ECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0S1gp9fUQBOQEM2da+dw/VeE6gJseCnWveZ5ySgP7cQ=; b=4ZRgIaTzGaj5D0
	HZodIKbzxsOBbhMETs8NSr1e9TbtYvnWWAsQGsDGiyFjEJnlCRLm5QOtjBBD2A4pC6Dv9BPd8zd5k
	tpsQro+j7weVLJTXsIC11P5jMtv+zyxtpf89oBxLH+21uduhTbzamys5973fmcD5xEX3BdHORz3oh
	qqDy+5Hzpk0PNcC0vP2hvaJdVz/jMPstNTaaPTOH0I46jgw1aEzdFuZRcMRDAT5lPON+D92M6yDsi
	isI0ugwPdE1btapnedEL3FqR9RCUqh7WHOxETgaBxV1ekyfIi/mRw035xxIF7+l1ksBukyisxypgQ
	usK/DxCoP9yeC7Zs3U7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaho-00000001JPv-27FB;
	Mon, 09 Sep 2024 09:29:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snahk-00000001JNm-3m2W
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 09:29:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-207115e3056so11225225ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725874144; x=1726478944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCfu1gkMkZEEvD27FE8IHnEv5HMGsSiqFHDKtjH/N7I=;
        b=N6pt+ii9Kkhajg5wwy1bfqbAHbexLOhQWf8xA4yi8RhF44dXH0rYjaMphg6/0jiASw
         bIahuXhE/dv9bwa2pJMa7L/wHCOnMeuVMYhdzqSe01BQGdP/+rOroisp1wCP5qHEB0o4
         QAwnQJR14B/B78jDxDFiTMXnlGBu1NhAoCIAb1umHTM2TzYv1zgtasO4+In8527kY+uw
         FhfUM+ojcRNrj9zidYTr18AalMkrlg4BWTvqtIfT+F43JmoX9dQDygyZPLum2yFRBlbs
         wpGsZ63T/CPaKq7o/rwLX12b+e/6htwMyUv5zEE67u4+ewU4ECBf3d8m0bNxReKXTn5x
         Bgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725874144; x=1726478944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCfu1gkMkZEEvD27FE8IHnEv5HMGsSiqFHDKtjH/N7I=;
        b=tpO2HwAfXv+91UT/tNcsnf2r6lSB4qTkNr+krT1jLg4zYMrTYSGhZbrG4qYGOMpIIt
         0CYLfo+5d5jEzhm3Zvjlsia0spoHwG9fQlbEiHAg1+YIohjqBzNGRO6m61LZgIsT6vBe
         iJgEtSuP/CTFpb7/1bAldEs3tjTYYcO/0opEaXSBhAs98wh7gpEilciF2vXHeO03whfO
         47GoDJ2QGSAlWPpkcdx8xrnnms65Y2Gnv9cbgxgx2YL9rrfNaK5PR/HkpeamPqSjcFg0
         nQ1V4gC7gSDx9N3AUpbUWmSYdkuPzrW1Th45P1hMHxMakyeCBu40RTVqjJ2T7hol75ab
         xyyw==
X-Forwarded-Encrypted: i=1; AJvYcCUEol1h97fgCJ1pIr5rXumLHrd8lYkEIhrdYbNBhdfCC1OZ34GK/cReQQfPWpljhCjNajQ4M/2ErS4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxH1ohTRJqAwAMNIrDoD8KqZSwHAJc35uuYzuqHT+9ZyS6VFKGa
	gmiq7x21dG3Ak8OBBeEdCLjECQa+VD2OVNObyT2jnkxj8swGkoZK
X-Google-Smtp-Source: AGHT+IFk8/HueAs518u/SbDnhUiKpdPaHH8sqnL0f6H4XMT9vBVrmGmp2A2fi8EXz5O0/ILeF3DvuQ==
X-Received: by 2002:a17:903:230d:b0:202:2e81:27a3 with SMTP id d9443c01a7336-206f0531120mr98881235ad.29.1725874143701;
        Mon, 09 Sep 2024 02:29:03 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1e99bsm30183995ad.207.2024.09.09.02.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:29:03 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id B28AD80422;
	Mon,  9 Sep 2024 17:37:20 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v7 1/2] mtd: spinand: Add support for setting plane select bits
Date: Mon,  9 Sep 2024 17:26:42 +0800
Message-Id: <20240909092643.2434479-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240909092643.2434479-1-linchengming884@gmail.com>
References: <20240909092643.2434479-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_022904_974699_147736A7 
X-CRM114-Status: GOOD (  10.92  )
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

Add the SPINAND_HAS_PROG_PLANE_SELECT_BIT flag for serial NAND flash
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
index b7518f0f7d71..5e40d6fd258f 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -408,6 +408,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	else
 		rdesc = spinand->dirmaps[req->pos.plane].rdesc_ecc;
 
+	if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
+		column |= req->pos.plane << fls(nanddev_page_size(nand));
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
 		if (ret < 0)
@@ -489,6 +492,9 @@ static int spinand_write_to_cache_op(struct spinand_device *spinand,
 	else
 		wdesc = spinand->dirmaps[req->pos.plane].wdesc_ecc;
 
+	if (spinand->flags & SPINAND_HAS_PROG_PLANE_SELECT_BIT)
+		column |= req->pos.plane << fls(nanddev_page_size(nand));
+
 	while (nbytes) {
 		ret = spi_mem_dirmap_write(wdesc, column, nbytes, buf);
 		if (ret < 0)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 228ffda8b50d..978c399b1784 100644
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
