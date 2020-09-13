Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1731EC433E2
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 16:16:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6875022204
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 16:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UrZaDWl5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpJ2LY7D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6875022204
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UZiG5G9FoK797OcunLnSsMWbVJejUFG4vJNXS6ArEU4=; b=UrZaDWl5bFOgzbUAS5mXGQ0LK
	oWvraxpszou7ggRtdA4JqJcIu5HQxZlGpyZHBT4saUPRkqWgxyyIwgm/pvONPRuGQFbqAF1Zt9gzB
	Cvt6T8r1wMCzYtK8KNK4gq+3KW+xgFmOKKjybwxC3JOhzaSTcXg/DUa6G3JGonTsDbTGpeOkN4uye
	MKho55Ab/YsbehJodjCnaufsdEUTjPKbbxWGIOY0UKZHSPvQ04bBUaWNO2lpLp2RwHGXGMU9zY43a
	+uQ2MAu6bgF4YPG3H39IYarqJT8pph+PtM5PQ4HN5aZLDsx7na+8+Pbsv5ylZPbtODhtukM8hiA5h
	5re+PYFTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHUfQ-0004kw-Sf; Sun, 13 Sep 2020 16:15:52 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHUfN-0004k5-Rf
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 16:15:50 +0000
Received: by mail-pf1-x444.google.com with SMTP id x123so10499578pfc.7
 for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2020 09:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KwZK3cynzlKs4fDm6cpdhaPJl7Rn30I8P2QHQetryVE=;
 b=jpJ2LY7DRgcUiKFMO8Y4KMDyC0lbaQYduYjpnt+fP5Bim8bTzxhH8Ex4Wy0iKo2e27
 pt9JxY8NAMXQvLffRT477rhzGcNxhovFdexnc030KOgSJQRMODRHsc8Sd4z6wIKYgUG8
 4heSQTBewf1ce7l0IOL7x1QFwKOHBDVLsVjAxMqV6ajkL0Ac+jsCythA2kXSALDAfZE0
 lJBql1yDeR8x9dcA8t815TYqLH5G/enKWuGmEhJjLdza7jqZVrQ2o+e1mamJq1o/v51d
 cCY4ieRaxCklTZaYrKyNisSsHtFGBDGwN6jbuhnfIq2zElJ5NuoJLFj9jYkUkS3mqAcK
 QO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KwZK3cynzlKs4fDm6cpdhaPJl7Rn30I8P2QHQetryVE=;
 b=i0loNO84W9N3OrjMjIZRZEERIzmBQlN6fmiG6oWulg7I2cAeUfJ8KV6e7tDxaoNxoZ
 FelPWjc9BT1tPivSKQJYgD1YALaX2AMx7z70Wh1QLEd2uyy8p74L+bbiQr8cNrrfZ7we
 wt30ErVpKMZTW5YnAV5kUrFajczHeCT2HagN7xHwPLXOlNfecf8oc7/FdA9DXb6UB6cG
 PukpOTAZrnylvQ2yBwdJ24dSd6KB2g5pJCV17S1CTHJhYM7drRYy0ABMYN00H0SwcGQK
 Dv+aFfheOylx8pC0n2z74aEfaHDjjdYmCqP5JREXiODLY1qzpYSVNWvBUrw88HiEbq8T
 KsQg==
X-Gm-Message-State: AOAM531JJtg9ZdWoegtX6Dzfds/7K62Wb57lFllJuuW4gJFN0psW/WEB
 XblPhedAIGDp5lk0u/1iwxEhNWPerpeslA==
X-Google-Smtp-Source: ABdhPJyAzttJgtBOiaVhGFDYmCSgIOJsaHRKVzXqP07zpGCZOHyZvdNB88neUBHUg9D1hThHOQUvhg==
X-Received: by 2002:a62:1984:: with SMTP id 126mr10112286pfz.17.1600013747817; 
 Sun, 13 Sep 2020 09:15:47 -0700 (PDT)
Received: from Thiru.localdomain ([27.104.143.83])
 by smtp.gmail.com with ESMTPSA id c202sm7833953pfc.15.2020.09.13.09.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 09:15:47 -0700 (PDT)
From: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] mtd: spinand: micron: add support for MT29F2G01AAAED
Date: Mon, 14 Sep 2020 00:15:33 +0800
Message-Id: <20200913161533.10655-3-nthirumalesha7@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200913161533.10655-1-nthirumalesha7@gmail.com>
References: <20200913161533.10655-1-nthirumalesha7@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_121549_923373_049B0EFA 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The MT29F2G01AAAED is a single die, 2Gb Micron SPI NAND Flash with 4-bit
ECC

Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
---
 drivers/mtd/nand/spi/micron.c | 64 +++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index d1b1073d1a55..dae3f7189880 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -44,6 +44,19 @@ static SPINAND_OP_VARIANTS(x4_update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
+/* Micron  MT29F2G01AAAED Device */
+static SPINAND_OP_VARIANTS(x4_read_cache_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(x1_write_cache_variants,
+			   SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(x1_update_cache_variants,
+			   SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
 static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -74,6 +87,47 @@ static const struct mtd_ooblayout_ops micron_grouped_ooblayout = {
 	.free = micron_8_ooblayout_free,
 };
 
+static int micron_4_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+
+	if (section >= spinand->base.memorg.pagesize /
+			mtd->ecc_step_size)
+		return -ERANGE;
+
+	region->offset = (section * 16) + 8;
+	region->length = 8;
+
+	return 0;
+}
+
+static int micron_4_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+
+	if (section >= spinand->base.memorg.pagesize /
+			mtd->ecc_step_size)
+		return -ERANGE;
+
+	if (section) {
+		region->offset = 16 * section;
+		region->length = 8;
+	} else {
+		/* section 0 has two bytes reserved for the BBM */
+		region->offset = 2;
+		region->length = 6;
+	}
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops micron_interleaved_ooblayout = {
+	.ecc = micron_4_ooblayout_ecc,
+	.free = micron_4_ooblayout_free,
+};
+
 static int micron_select_target(struct spinand_device *spinand,
 				unsigned int target)
 {
@@ -217,6 +271,16 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status),
 		     SPINAND_SELECT_TARGET(micron_select_target)),
+	/* M69A 2Gb 3.3V */
+	SPINAND_INFO("MT29F2G01AAAED",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x9F),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 80, 2, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&x4_read_cache_variants,
+					      &x1_write_cache_variants,
+					      &x1_update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_interleaved_ooblayout, NULL)),
 };
 
 static int micron_spinand_init(struct spinand_device *spinand)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
