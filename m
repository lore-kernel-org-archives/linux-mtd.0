Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BC3C636D7
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Feb 2023 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8zGHUbuvGVM6Gl9C4NA2B9mJvUHrDHKNV3voDmmAXU=; b=HAKhJwtphggHbU
	PVVv0bDlzr3cNY0MWno0OGEypgMeYy8t8zaB5sUEIzYQLsU08cpKxbrhihaCzprzvdLFFDziOnYYS
	Ot7u6+cX3FXUIBAKjq4S89kA/bX+rjqqLcOnF66pU2By6L3/nGX5ZgvIKNKtUMQvWJ8UE2bcvwsiq
	D5g7UZfbVjY7t27DzOEJRqlUnlxn1+m0lbhtQQ2EZ5xO7A60RttRWBC1jiG5G3jSFL1N+Z6lbpXg/
	eLQeJTKioAaRb9fBVJRf8cZyd6/J/Glaye9A2bb0kLl4Sq3VffkXufjAb5KiHt58L91NoNs4ol1Ls
	u25/TA7DVx5fKJIhSuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jk-001SLK-6M; Thu, 09 Feb 2023 12:09:12 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5je-001SHl-LL
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2023 12:09:07 +0000
Received: by mail-pl1-x636.google.com with SMTP id k13so2640198plg.0
        for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2023 04:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnX6vF6BvhazK7OGCboJF5Oyb2BqK+59aOcLmIX7UeY=;
        b=BVWJiUtpZh1ecXp9OaRs27Ez1A8qjk2klgf+F6T+5zJKAQKek8SGt2YYcJEkuLcLYq
         fOb0YqZabAAmuPvrAiqEyp4JbD6VuT2QiLqW+VECHgHEd8g/e8zlCrR3xH7Xhm8m0kFI
         4SSjBuDe3fsyA1HkM3E++kNsdtJf1rtMG1pRQrtA1vKCo86k81N12hSDFUSxA2d3ePcH
         attDAxDPck2XKlw4YuV4lwXA8F+0qavlfITke74+BXANfF27Rg41wu/RVTbbDEwvJJEZ
         oZxAwJUoa5GdDibsxH6lRMoOOBgbvOnbWSX8z7KZBD0v7pxSPMTOniPDGTE7gKHZgG9p
         12SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnX6vF6BvhazK7OGCboJF5Oyb2BqK+59aOcLmIX7UeY=;
        b=Rs9wd+JxDj53EHiozNRyDu15topnUPeJnLhKkg3AklNlp3Au46ogAx2iPiSrcVGnPk
         6a4OODECqXQIJ/GTvUriBYgP3hyiuBgE0vCvFcz00OIMCLh+hxS4Saa0skN+u6p6+0o8
         QhelhaHZSaqqgCyVAzXrOVgqNT/vSR4WHeTi+fFS5uLf6uT+IxewJZo/FPWbGObepc+j
         xXMFkHfWWnoiix0D/XaT0eEFcaWvkiIxGiOxm+GMsSPGMnJ+ITJCv0C1U6466cJr2qZr
         ZIKcH/2B9QUP7Ofir8UPXrPFqilymUDC5TRH1e1Q8nF6mLG3Zp7oizJ7nZr9V93cljKa
         4q1w==
X-Gm-Message-State: AO0yUKVj+l1HX7shkWhR5dE2I7XwTQjQPXrXv39/IvJ/6Qge5C+puyLG
	piM3emlb9mU4yOrrJbmNHDTOJOKIj10=
X-Google-Smtp-Source: AK7set8nnFYoqmRNf7wDmt+jA2dEc6EkRtRLhQdeY7mD25kHH/AWLAlHzQIy56JuahIpdAINtKmrtA==
X-Received: by 2002:a17:90b:1809:b0:22b:e8bc:7f32 with SMTP id lw9-20020a17090b180900b0022be8bc7f32mr11799245pjb.49.1675944544703;
        Thu, 09 Feb 2023 04:09:04 -0800 (PST)
Received: from mp600-ThinkCentre-M710t.. ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id ms15-20020a17090b234f00b00233217fa85esm449746pjb.28.2023.02.09.04.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:09:04 -0800 (PST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com
Subject: [PATCH v2 2/4] mtd: spinand: Add continuous read state
Date: Thu,  9 Feb 2023 20:08:51 +0800
Message-Id: <20230209120853.660564-3-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
References: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_040906_720472_ABF0042A 
X-CRM114-Status: GOOD (  10.52  )
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

Add continuous read state and initialize state to
default false.

Signed-off-by: Jaime Liao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 8 ++++++++
 include/linux/mtd/spinand.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index c13374933372..aa57d5b0a3dc 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -193,6 +193,11 @@ static int spinand_init_quad_enable(struct spinand_device *spinand)
 			       enable ? CFG_QUAD_ENABLE : 0);
 }
 
+static void spinand_init_continuous_read(struct spinand_device *spinand)
+{
+	spinand->use_continuous_read = false;
+}
+
 static int spinand_continuous_read_enable(struct spinand_device *spinand)
 {
 	return spinand_upd_cfg(spinand, CFG_CONT_READ_ENABLE,
@@ -1304,6 +1309,9 @@ static int spinand_init(struct spinand_device *spinand)
 		goto err_cleanup_ecc_engine;
 	}
 
+	/* Init continuous read */
+	spinand_init_continuous_read(spinand);
+
 	return 0;
 
 err_cleanup_ecc_engine:
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index e98d770173dc..f598a0c5a376 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -419,6 +419,7 @@ struct spinand_dirmap {
  *		because the spi-mem interface explicitly requests that buffers
  *		passed in spi_mem_op be DMA-able, so we can't based the bufs on
  *		the stack
+ * @use_continuous_read: record the continuous read status
  * @manufacturer: SPI NAND manufacturer information
  * @priv: manufacturer private data
  */
@@ -447,6 +448,7 @@ struct spinand_device {
 	u8 *databuf;
 	u8 *oobbuf;
 	u8 *scratchbuf;
+	bool use_continuous_read;
 	const struct spinand_manufacturer *manufacturer;
 	void *priv;
 };
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
