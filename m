Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743E9C0044D
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E162520737
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 17:59:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JofDAvYC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJzM0OhX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E162520737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x0WNeSSrbsNrdn5Ffry3QcyRMs26UAr/d5hQD7g/f5Q=; b=JofDAvYCIGzTf8mczBL1+6FLt8
	hyuSJkVFEBnf9+GfZ+TJ4zGKggKZLWKjj8RfZY8AVeLdA06ESc2of8WtWhdAqO5bVXMWN5zTMvMSi
	i6HgjJtIfyfOaPkG/ESD5PhLYee7JJ0bhPetJ04n1jIvzJZdyp3dAJ/vrLOxUL/vKcFINLC4SdBty
	rGmy35KhfnT+5j5P56DXXVnY44wiDkEWPT+kHKMzLBSl4CYhmK2sjLewN9gtzamnEtBDY9LmsY2+1
	76RdyE2JM9Un76gbZaBM07Pr6Vua7xu8tHhRkMdYs1n9TE6t8Fyj7tZAaaoguAGzyLP44+sH5kJXY
	DgPyjqpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC5d8-0006Pr-Cj; Wed, 11 Mar 2020 17:58:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC5d4-0006OJ-R7
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 17:58:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id a5so3109766wmb.0
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2020 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=knKxmw0pxQ5Najb1qdtFuNgnhs0cDNgJ5XYCxXVgosg=;
 b=qJzM0OhX0JFdbqgPq5YWJpiEvMDEeOdVcpY4Up0cRcPOkDWU3qp8g8X7Q2pzFFPWFs
 xAFzXZP6wP1MWEAjwZKsNxUhvS5DQgwfY8Ivt+KKmBgqY4tzXyCjKkhuNrlWqVAaqlMi
 OC/dDCFbt33H4Ek9vKHZBB52zMKJhQ62v41XHRVTqINLNdxfRDiwSYUclya2ULd5e8lm
 WTguo+IYaYdeTUfNmZzW32+acdg1RPW82iU6WD8krr59hmYEIa6rkvBkmg1XR9Df482n
 sCrbKvZUZJDIhlkK4KQHn6iL2o0afM9zinwMqLn1dlI7THR5EQzByGvnOW27YXWb4q4k
 XRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=knKxmw0pxQ5Najb1qdtFuNgnhs0cDNgJ5XYCxXVgosg=;
 b=udZ7dghqqWzN6GAMqM3m52twNwk2nBswtWH4xSMM6gJ5/BzmRGXTH8byN4420hiC2E
 pHxNgETReiW2djvh2aLBYsE4JpZLPC1vDTrsFC5PzZJJF+eJAxRS9pFJQtZAtS9FjAVt
 zrILDp+lXeaSqGXLuxMHHj/xqpTg/wvMBTgw4F99bYc8GzGcbPWNdkmyPRe2V2XdCaRK
 zP0yQVkiO9hggtucfR779hRXrbK4RWm3sfAiC+i4PtOasKLusJzF4x5O7q/B40a9AJFe
 MqKzX1TuVCzk+1cl0woLfIN2VpdVSbkE7Oqb/hObM8F8j8DaeHqUU4U6fK9g1nzdcOcS
 QLjQ==
X-Gm-Message-State: ANhLgQ3w/c840q8rXAkUB7nEe9z03PFZuMYp3aVs0N0ZIapQMWVdgIdt
 Kds7XTLU+WGjwbpWYmOkgGU=
X-Google-Smtp-Source: ADFU+vsAurwdyvOqykM4WDWKZJGNJb2HwFTrxFtjtMDFjzs0DO5Fess9MLyMeRSaS+sQDoa0WBfQLA==
X-Received: by 2002:a1c:196:: with SMTP id 144mr4940965wmb.100.1583949528592; 
 Wed, 11 Mar 2020 10:58:48 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id l18sm1502107wrr.17.2020.03.11.10.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 10:58:47 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] mtd: spinand: micron: Generalize the OOB layout
 structure and function names
Date: Wed, 11 Mar 2020 18:57:30 +0100
Message-Id: <20200311175735.2007-2-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311175735.2007-1-sshivamurthy@micron.com>
References: <20200311175735.2007-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_105850_878702_D1F63CCC 
X-CRM114-Status: GOOD (  11.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

In order to add new Micron SPI NAND devices, we generalized the OOB
layout structure and function names.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/spi/micron.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index f56f81325e10..cc1ee68421c8 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -34,38 +34,38 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
-static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, int section,
-					struct mtd_oob_region *region)
+static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
 {
 	if (section)
 		return -ERANGE;
 
-	region->offset = 64;
-	region->length = 64;
+	region->offset = mtd->oobsize / 2;
+	region->length = mtd->oobsize / 2;
 
 	return 0;
 }
 
-static int mt29f2g01abagd_ooblayout_free(struct mtd_info *mtd, int section,
-					 struct mtd_oob_region *region)
+static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
 {
 	if (section)
 		return -ERANGE;
 
 	/* Reserve 2 bytes for the BBM. */
 	region->offset = 2;
-	region->length = 62;
+	region->length = (mtd->oobsize / 2) - 2;
 
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops mt29f2g01abagd_ooblayout = {
-	.ecc = mt29f2g01abagd_ooblayout_ecc,
-	.free = mt29f2g01abagd_ooblayout_free,
+static const struct mtd_ooblayout_ops micron_8_ooblayout = {
+	.ecc = micron_8_ooblayout_ecc,
+	.free = micron_8_ooblayout_free,
 };
 
-static int mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
-					 u8 status)
+static int micron_8_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
 {
 	switch (status & MICRON_STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
@@ -99,8 +99,8 @@ static const struct spinand_info micron_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&mt29f2g01abagd_ooblayout,
-				     mt29f2g01abagd_ecc_get_status)),
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops micron_spinand_manuf_ops = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
