Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FCAC47074
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jan 2024 14:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E3yzNenzR3ZBfzmZTf6+ePwRvLqbTrmMD7OS/Z5za7E=; b=rr75EsHam6ObW4
	zRrqcWZy4P1rAGwpM7IftdRTHPBy3tksyQIP7rtVh30myZDIY5z75mFV6kNg/cVfffK4TyqZ1qqrO
	eBNTsBtTMak9shsrZwHQZwZI8j4MsNtZgJC/7/AWIKwpsiVQZHCR+WK+vslmobVbiIB7t4wbRxU91
	AXVENqgywQGCW6EN2ipXmPjpmdHpTnES/DQins1dVNcv5JfJWt4uJ6PhQOuUBLvW8/AkHWqXWkY4d
	ibLbzJQb2Dci7lj2H6NGLB9RLOTrbwRiwvT4Iw8MHEooqgF3amYFEmIZdJGU7k4TBRJ0+cO5o8wTg
	NovdzQa2m+jyKmSJ0D9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMUMO-0038r2-1L;
	Sun, 07 Jan 2024 14:42:44 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMUMM-0038q6-06
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jan 2024 14:42:43 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-36074b286d8so7889285ab.1
        for <linux-mtd@lists.infradead.org>; Sun, 07 Jan 2024 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704638559; x=1705243359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dvigx7Xd9v1hP219sxX3eYFqvUkyHmTLjMlO5CznBg=;
        b=cJ/A3z6tONLA2h/R9NP0LYypuEz1oam/gTzrVX5i9tcVmWSuStwzQ9vvi8HiEpcjdf
         EbvZWQItCZvvjiHvDdSoC1zrdmDw7aui63BVnCJWmbnExiYRMqTe0sI5gOQfEN7YteHu
         Kmmrsl+lABPzoqgoObhbwIcQ/9xu0nue83lTNlpG3vIvR9jUUM1WMwNO0mYGn82b+gZF
         DXKxpyqfJKzqwXPw3ItIouj63axNIWQ8sLdJU4OK3c7wXwYYmlGMBFGjrOk1BgAYDLs6
         uONixZ9TaRDwFD7sQlPpSomM76kqUGOgppq/sMuEtFLHOyiykwuENXJvdw1/0ZDOxMMt
         dzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704638559; x=1705243359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dvigx7Xd9v1hP219sxX3eYFqvUkyHmTLjMlO5CznBg=;
        b=c+RZ6pQLpenscux/jjkLNdF1/G9al6687uK0F97JE4FCeJQ7qURrajTEsJF38XdmR1
         r7MiiLIdVSmjk3Iqg1DsPeVUoKNZe6uyc492DAyER5iAieA1wdn7nKZQ2o9mTWKN79YK
         MILTOyh0PR1LHWukLDYJujELX4dQdlHu9chQlgEj7q89ZLSUsQljtW9XYBCnIt0MpTFS
         A12dMQceCx+xsFuvRPSUQFaGuX5G7NP86ILMbmhLtfLGucIM4zknpFdBCJUjjrqobBhm
         8ZDzZjilTWRNcbgHN4YrhKt3QoH+3lu6wQwHDoYb1wFn6oQEfncWtFv3BeYYj4SyHnL6
         aNRA==
X-Gm-Message-State: AOJu0YwMdPdGU7uMA+Jpnc90QbHTlOmLYF1xQjCM1mcx3eqUeOB+lM+I
	LsGgOc9hUeMrfAHpGRY/YIWtjVZDsa2A5A==
X-Google-Smtp-Source: AGHT+IFcUARrONH00uDvClFTYezLHMwZAWtE4lemo/FoFLu01BBa9wSBk62+LtR8rM4t2J7VDlydCA==
X-Received: by 2002:a05:6e02:308d:b0:360:88ff:51d with SMTP id bf13-20020a056e02308d00b0036088ff051dmr2815172ilb.56.1704638559626;
        Sun, 07 Jan 2024 06:42:39 -0800 (PST)
Received: from localhost.localdomain ([182.234.152.214])
        by smtp.gmail.com with ESMTPSA id r15-20020a63e50f000000b005c66e25497dsm4331443pgh.83.2024.01.07.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 06:42:39 -0800 (PST)
From: Zhi-Jun You <hujy652@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH v2] mtd: spinand: winbond: add support for W25N04KV
Date: Sun,  7 Jan 2024 14:41:20 +0000
Message-Id: <20240107144120.532-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_064242_096169_C1DCE408 
X-CRM114-Status: GOOD (  10.23  )
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

Add support for W25N04KV.

W25N04KV has 8-bit on-die ECC.

Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v2
 - Rebase
---
 drivers/mtd/nand/spi/winbond.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 1a473021cca5..ba7c813b9542 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -15,6 +15,8 @@
 
 #define WINBOND_CFG_BUF_READ		BIT(3)
 
+#define W25N04KV_STATUS_ECC_5_8_BITFLIPS	(3 << 4)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -118,6 +120,7 @@ static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 		return -EBADMSG;
 
 	case STATUS_ECC_HAS_BITFLIPS:
+	case W25N04KV_STATUS_ECC_5_8_BITFLIPS:
 		/*
 		 * Let's try to retrieve the real maximum number of bitflips
 		 * in order to avoid forcing the wear-leveling layer to move
@@ -214,6 +217,15 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25n02kv_ecc_get_status)),
+	SPINAND_INFO("W25N04KV",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x23),
+		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 2, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
