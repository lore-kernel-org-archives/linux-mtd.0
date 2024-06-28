Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E3FC41513
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66T2cpMwclDtGMw609RB6aeGDV19KQr2Th+2izZbavU=; b=yO47ejcj5DLh+Q
	mkOQruQn0dr31AAV+NOqN6i06Vlmik0OEK8uh49CNoJvDwr+RnhhEYWrtUVRtbvmX7tU153+PaRak
	bypYdLeCxe7e2fD+hiXh/3UnRxA+gls/MjRfNZ8OXeL1JCo5s8CaANnb6o9hcBY5O2vXjTfpCkQBJ
	VMriou+uXQ3FNKogYaTNJSlF3dg8GmzenLfq2RTEnXe98vY27Kr8yajN0M23UygU/5khkpoKr4SrK
	trCqyH/Ee3SOrdfIOptXoxboDRl0ldLHDVN5tW2JJmSUnKhCevym1yIJKWstKLTeXBWxi79HIGeYF
	v68bTrbMES91Jaod26aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7ZE-0000000DC8m-1WRi;
	Fri, 28 Jun 2024 09:06:52 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN7Z8-0000000DC6j-3n1h
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 09:06:48 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7041053c0fdso214909b3a.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 02:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719565606; x=1720170406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE+GAHekiqQQ+6g1wyBk2AinFm8Z+Wz7HeNtPOPPiPc=;
        b=i2arh9wvraOLKMiIT7NX27yxT28VmJutN+scFLX3x3zVaolhASs2Xbi/G/wVnZQdSn
         YIq+0mapo479IazQREmF5ckkN+yZuUF2bSCXhdzW6hwml60FtWOQBEV17B+5p5C71OeG
         1ZUQme5WAQNluQhDIEy5nEw9OKeEAxusNiES2EL3K5b9CuPMl3/SzoWoOwWXAQAyQtiw
         Zh3kvpBvxAKbJ0F3+TAKmCzWUGc34eUjCaPUsK+0DojyO6336iGsAjGnz5K2LF7nGNrh
         afzLdVYk9U7HKAc69LRUA+lBVWf/wPi1dw+0ex3BQek9Blm6GD6U9dWfug5GgJYUAM9G
         lUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719565606; x=1720170406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KE+GAHekiqQQ+6g1wyBk2AinFm8Z+Wz7HeNtPOPPiPc=;
        b=UnsUlvB9ugh1KF6p9jNVNxSTr9ETt0kNKdiWFI4iQfyz0SX8A4t9p0msPfncZm25YP
         35lbh2Vlt9TiK8fcNgxf0Yse5+aDF4ubrPZ8nOJTZX+Z4DAaBxfZ/Bk48msQwAZAj8k+
         YZjRyLnx8sl+ZDiYBOz31aUPWt5+7xYpmqmO/o27WiXNmDEkwxlFgzQH1Zmg6qu56yYs
         6HXWTG7uWPsauGJ0MHk4xwIEa80Eyv8tr3kGIfXevw2ya2f1TOdkt/Dt7NbzX/myk2rT
         2yxH50ImGhAMDRxQsLtzWE/HsBhrMf46t7qaRj7BuqFUAfqBzYEZCFewbv8UY+SWb0Qa
         fPwA==
X-Forwarded-Encrypted: i=1; AJvYcCU1VFn+RxlyG4Iaqv78DMvzf6Fr7QpK9yJFqHXTsepZBooArAU6O7oijfenf1v9qDwBiMY6xzhpTXNnJUqOeb2ggDkLUUsWWj4OtTW9Fw==
X-Gm-Message-State: AOJu0YwFHw7DOwrG1pJB+9zUawpZwEPO3ljI2OwCFJAG74ElC37ursk9
	3n6yoO1OI8olTET/TfYrJeWAFjH9H4OaS+HBHbhQKsv3ikONMi20
X-Google-Smtp-Source: AGHT+IH7O3ceew/tSG3NDVJpYlbtMuwR5IFLdkA8b8eK+PcdH6NneHqE1C+XNacGpenvZxl/Ayl5vA==
X-Received: by 2002:a05:6a00:2d93:b0:706:8066:5cd6 with SMTP id d2e1a72fcca58-70680665df3mr17761645b3a.32.1719565605922;
        Fri, 28 Jun 2024 02:06:45 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e63250sm1086981b3a.29.2024.06.28.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:06:45 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 3A8A180570;
	Fri, 28 Jun 2024 17:09:00 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 2/2] mtd: spinand: macronix: Add support for serial NAND flash
Date: Fri, 28 Jun 2024 16:54:44 +0800
Message-Id: <20240628085444.132714-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240628085444.132714-1-linchengming884@gmail.com>
References: <20240628085444.132714-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_020646_991595_35E52AD1 
X-CRM114-Status: UNSURE (   9.19  )
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

MX35{U,L}F{2,4}G24AD-Z4I8 are Macronix serial NAND flashes.

Their main difference from MX35{U,L}F{2,4}G24AD lies in
the plane number. The plane number for those with the
postfix Z4I8 is 1.

These flashes have been validated on Xilinx zynq-picozed
board which include Macronix SPI Host.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/nand/spi/macronix.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index ffcaf1a6947e..ae33bdca94e0 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -158,6 +158,15 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX35LF2G24AD-Z4I8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x64, 0x03),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX35LF4G24AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 2, 1, 1),
@@ -167,6 +176,15 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
+	SPINAND_INFO("MX35LF4G24AD-Z4I8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x75, 0x03),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout, NULL)),
 	SPINAND_INFO("MX31LF1GE4BC",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x1e),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -207,6 +225,16 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF4G24AD-Z4I8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xf5, 0x03),
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF4GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xb7, 0x03),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -237,6 +265,16 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX35UF2G24AD-Z4I8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xe4, 0x03),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 	SPINAND_INFO("MX35UF2GE4AD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa6, 0x03),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
