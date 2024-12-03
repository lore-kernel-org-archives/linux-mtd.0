Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A08FE6C5F1
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 02:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm2YF2ZOWRIwjs/dh+MjNddWJMAYJyO0w4jcju+rw2Y=; b=wQ9ZSsmV8om4NJ
	Gjl8J8p5c3WIQJRPO7kqqQWXB7QZ22ZdqRqnhhfdr5oYTuzF5jMU3PJeOz0UX3btQeVBD2TjtUXNb
	9RZgqDuzfunJRgqhJPxbMGXIvZ93izDoIUZCqvzT0c3gUkt/+RLxAeVNTYI6mesG0GFYTEL3aLMXh
	xnFgWBqFeIPRJEEyFur8Pskf9FKfgjvdbkp7MExqDdNPio4LfPQEa8IpoNl7gQxGLcUb7QjfYZcop
	obil1AbJP0TqvxRbRgFHlyv62NHAil2VK/Q2+t+UU6dt6pHz1ZDr5LgEYHJEMeSWHiP1VuMOYvVFo
	atQU+RdQhkgH67bQ4lxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIxh-000000083lh-1Lye;
	Tue, 03 Dec 2024 02:48:29 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIwU-000000083VE-0zOM
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 02:47:15 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7fbd76941ccso3630832a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2024 18:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733194033; x=1733798833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O7qOAdG7Dgz/dYuEL9fMRAYn/D7fU4D6K1iLRtQxLc=;
        b=dawoYyliw0lL+jtqO+pD/RwgF/7lCTcAtv4RBmcMNsytX3eTDDuizckw4+7yzXCt/T
         ebvMT7bzUyY45f4698hsr4GCxuq6Tj+MaQNwbO37Nz0StC28hf/dAkpJlsT/Kkz1fqrt
         4R0mjkh9ojODDheKmKD4X4+1RX0Bd8JKNrTQvBqzFXl3jQR6myYLuR99VHwUVk8IHq8m
         cqqsKCflTtGJgmxCIqun1RkbrU48Mgki5AvTEJ7t9VnQBwozXBF8Z3ORxjZx3KvWJC3c
         xVWVAltU01xQjZat0Jt/CEeKnoTADkLdAiUmHJtoAtjYnSb2OBQNr6klWofAKg5WM/6k
         x2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733194033; x=1733798833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4O7qOAdG7Dgz/dYuEL9fMRAYn/D7fU4D6K1iLRtQxLc=;
        b=d3Yky7sSARFgKCafzm7oW63vZu0FnFg7FqGYMHfX/S9Uw9ANGpGKPxk01ajj6NZ5pW
         vOnDh233tyN7JqgP3vcfkrIGX2lyxwAv9z4sjUtrhvMoTKfvo6daDWSRBoW4dAaZ1hlW
         w4/xdfYxrkoWdyOXOYwomuAm2RkJWVoOGjmgD1pO0ynibtjPR3c99bgAmvgZwSprTHws
         qZ3cVKZa7k0yTLVtNSz+ctBTAZeyHSPzzskhdvtngfhV/ZgaPeC7xFve48SjAcOz6ebo
         e9RhkDn10aFApDRZGQkjVsut/kVVasPikKMSZocCtbhZUIUeHu4hOvJNFT/uoGzuWuP+
         ybbQ==
X-Gm-Message-State: AOJu0YzdyYOlQQmLOWbHXOenwyzaZtSvZuaqAXuULpXvI3avEl4lG+4x
	zsUfal+V+kC5Eo46VvCXqDawGtMz/yrYfsACww2LCfJp/SJY19SSiyWjQA==
X-Gm-Gg: ASbGncvyGtpk5/3DE/FQQ1qb8LQ+K0pLYktXJ6YN7mkYT9tlBfrNROPT0eq7IbCix5a
	7L6gKQzGbgj1oznRt4tSIzkMAdn0AtDwRA19Q09k7/+79ZI6kcxfoGo2p4CNZQPMxN7WDf8TSUx
	RJXNFsLCTygPfzPmi13DVy9QFPyfIgtiNd++D+DgIE87cY5OkXkiE5+2xV9pNCobCBcRcc2D2BO
	Q5jtgPoJDTBoEcwxpt3IzZ+kiTuM7JqyxLzIrXSX/0pPSniPfYkBT1kGHonrM02e/yejiXIJPyP
	TGEyVNzjayfj1nkg72qyel0f8ICYooLYKDaNqg==
X-Google-Smtp-Source: AGHT+IFNjdf4bGx9+adSGAD6WVi5epzVEkqdNeXiWukbo3gS6lokv5PeMQ+UvGS6nCRhqzux+fNF0g==
X-Received: by 2002:a05:6a21:99a8:b0:1e0:c7cf:bc2d with SMTP id adf61e73a8af0-1e1653a06b1mr1708237637.3.1733194033297;
        Mon, 02 Dec 2024 18:47:13 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-220-81.msd.spmode.ne.jp. [49.98.220.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d634asm8605693a12.8.2024.12.02.18.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 18:47:12 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v3 2/3] mtd: spinand: Introduce a way to avoid raw access
Date: Tue,  3 Dec 2024 11:46:49 +0900
Message-Id: <15a64f75cc88c90fe746422280ebd1c8c3fa34bf.1733193264.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
References: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_184714_280040_47C11A81 
X-CRM114-Status: GOOD (  17.69  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

SkyHigh spinand device has ECC enable bit in configuration register but
it must be always enabled. If ECC is disabled, read and write ops
results in undetermined state. For such devices, a way to avoid raw
access is needed.

Introduce SPINAND_NO_RAW_ACCESS flag to advertise the device does not
support raw access. In such devices, the on-die ECC engine ops returns
error to I/O request in raw mode.

Checking and marking BBM need to be cared as special case, by adding
fallback mechanism that tries read/write OOB with ECC enabled.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/nand/spi/core.c | 22 ++++++++++++++++++++--
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 47c369f2925d..2ff3c32d46d3 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -294,6 +294,9 @@ static int spinand_ondie_ecc_prepare_io_req(struct nand_device *nand,
 	struct spinand_device *spinand = nand_to_spinand(nand);
 	bool enable = (req->mode != MTD_OPS_RAW);
 
+	if (!enable && spinand->flags & SPINAND_NO_RAW_ACCESS)
+		return -EOPNOTSUPP;
+
 	memset(spinand->oobbuf, 0xff, nanddev_per_page_oobsize(nand));
 
 	/* Only enable or disable the engine */
@@ -901,9 +904,17 @@ static bool spinand_isbad(struct nand_device *nand, const struct nand_pos *pos)
 		.oobbuf.in = marker,
 		.mode = MTD_OPS_RAW,
 	};
+	int ret;
 
 	spinand_select_target(spinand, pos->target);
-	spinand_read_page(spinand, &req);
+
+	ret = spinand_read_page(spinand, &req);
+	if (ret == -EOPNOTSUPP) {
+		/* Retry with ECC in case raw access is not supported */
+		req.mode = MTD_OPS_PLACE_OOB;
+		spinand_read_page(spinand, &req);
+	}
+
 	if (marker[0] != 0xff || marker[1] != 0xff)
 		return true;
 
@@ -942,7 +953,14 @@ static int spinand_markbad(struct nand_device *nand, const struct nand_pos *pos)
 	if (ret)
 		return ret;
 
-	return spinand_write_page(spinand, &req);
+	ret = spinand_write_page(spinand, &req);
+	if (ret == -EOPNOTSUPP) {
+		/* Retry with ECC in case raw access is not supported */
+		req.mode = MTD_OPS_PLACE_OOB;
+		ret = spinand_write_page(spinand, &req);
+	}
+
+	return ret;
 }
 
 static int spinand_mtd_block_markbad(struct mtd_info *mtd, loff_t offs)
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 702e5fb13dae..5cf11005b41a 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -314,6 +314,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
 #define SPINAND_HAS_PROG_PLANE_SELECT_BIT		BIT(2)
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
+#define SPINAND_NO_RAW_ACCESS				BIT(4)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
