Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABB3CA0ED3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 01:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tQ21QPybt3WFxwDsV0gGX0uAwcq04LuvMY/W6fVj6E=; b=0Y7BznzsCwmv+Q
	isMR931XgvEU7ebszQsXsIpg6JyMy/ovKoKHTLtAdFrw3TAgBvobV2Nm45qcFGQX91lKMnjm2OixP
	wVUp/8S+QGS34rIJ/dG8WuI4ErugwdamY+u878CwLCQxq+eFE0hfp8ngOTOexivBFvCkLVb3BkecS
	/PnfY6N9gc/9O12arEYXE2nLYX3ZlnewJz+u689g/6Q+jYFrqaXkzTBggFu80UELa17P08OwY5tkE
	xdkykDJLkdgZnHZLuOd01WlEdQEjD5RdsGNjU1/IhI0H6RYZ3jFACziNXgyAvrziS1ttxO5cIIg+C
	Xv3O6VOOg527IRVHRObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIVL-0000000Fxab-238s;
	Tue, 03 Sep 2024 01:38:47 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIVI-0000000FxZl-3gjh
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 01:38:46 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2703967b10cso2258828fac.0
        for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2024 18:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725327524; x=1725932324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6E7ALM61L5GXDCpe2fwl5R6dNU8EMojsouVXbwTg9g=;
        b=Npk7gBuOeLjo6IXIGqgaBCQOjDvOKhdZBGIWTlsXMlziB1/V4pFuHNISJnD1Tbs2UR
         5DF54bmMu5hAzT1oBowH77N4h3L61SjXggt7cw+BcHLv8VOVvXsSeoFVjns/COqODNkn
         FRCCzj3E6qqISoQaQmoP/1B6ODlrb+q6wQlcoQNQ+TV8nAqy7gKqUwE2TJhdhRVXkvuL
         c5+i7A1lP4psPtHVdYCEMzdwdo0pjix7YabaMrBcRhEV1YcbaMKHX5aZYdNGZSOdp2Y3
         adE34zReEMnxpElzMLVAEsOQhqU9Fp16zmfaUybiWnPraEbbN6xHjdLZgceRs4la+XXy
         O50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725327524; x=1725932324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6E7ALM61L5GXDCpe2fwl5R6dNU8EMojsouVXbwTg9g=;
        b=bI2/1AAFujMlq6/0KcNu1VeglL9qdLhMpC6hMpLvyZBbpHbN+1iPGvftOaI+cqsPFN
         88ySyMjxFPIkWz4knQQCkXx05ZgfmpM2Cis3os5c/1JvQJzSgcTn+Hzd4JS2KZtx6bhV
         R1QOfdVWUPJtZ/+O24ouwkiOm0s5j1w9q1+TGS36AHdycjTtJ8wJ/vBeiwL6kRznfiH+
         YvOacK0w9duKgddT1ep+jQPb8tDF/B4vHe/OWPvJs0EOdGDF4+dvkVPjRW65NSdltB+0
         XROfqQZgXxaxTYLJUhfTap/xdQ325y8bIDZU1a/ifrho1gfIkmz2cv2HvHqrls09g7yl
         F/NA==
X-Forwarded-Encrypted: i=1; AJvYcCWOAHVwuHswyzRsH7D9JwgrWdVMVvpPVJkwUYnSi4/Qh7HXHw6qQ8YmNnd+cw8VIldi5HAE6ZpOHJw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ5UAbBOxDxtsBKQvZaqEr4C4lNmteLmlu4CKl1LgO4vvwKV3p
	kSMiYSqdedWCzB1ZxFTbezbOafeULrrabzefQ9nQjTz7MCkTu6cN
X-Google-Smtp-Source: AGHT+IFH7BOn7Ydiv3r3QpGrT8jgHuvBDLr4r/TxUf+m57OlNIDZlwFnzLVzLLof2Py7nhd2QdxFSg==
X-Received: by 2002:a05:6870:a7aa:b0:277:e6fc:4a69 with SMTP id 586e51a60fabf-277e6fc4eb8mr6024916fac.2.1725327523444;
        Mon, 02 Sep 2024 18:38:43 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d7804sm7405114b3a.154.2024.09.02.18.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 18:38:41 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id DE1E080526;
	Tue,  3 Sep 2024 09:47:09 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v6 1/2] mtd: spinand: Add support for setting plane select bits
Date: Tue,  3 Sep 2024 09:36:24 +0800
Message-Id: <20240903013625.1658825-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240903013625.1658825-1-linchengming884@gmail.com>
References: <20240903013625.1658825-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_183844_945428_577F432F 
X-CRM114-Status: GOOD (  11.80  )
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
