Return-Path: <SRS0=DnUc=AX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D72C433E1
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jul 2020 13:59:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3103D20674
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jul 2020 13:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gcfrDVNP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZUYXIBZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3103D20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yCveEeOTcbeiQiKSNS3p81LVzvXrxTfT2w7bDEFwntA=; b=gcfrDVNPgZrVqtTdEiXZyBvP7e
	Gxu3f4qSj3piER+36DhPxWN22cB60kGE7vnNe3hfFAyxtvUTOUzbdos3HFpmA+ghJD0v7y7uV3z/L
	X8dRDnYmF/x0PlZc13tF6w1FYSIG22tGO0DfBidO2CoY3g9posHDZizDxtAlfnHepaXN/B8kboOSm
	OsPefIf1sAkwleQmouM/KMkf5SAso1+SgN0mwMmC0FCalf0YFJBwd0MWoOtST7EIuiQX+5VvU19B2
	4xQXSHC9+GlY5E9MfN5pu7VDOd5dVXTKLY5GR1nQ+PmZywfm3WZEhojF+6aokNoFzIYGuLmKBRrAu
	UeBHI4HQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jucUV-0004OJ-AJ; Sun, 12 Jul 2020 13:58:03 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jucUO-0004Nn-Rf
 for linux-mtd@lists.infradead.org; Sun, 12 Jul 2020 13:57:57 +0000
Received: by mail-pf1-x442.google.com with SMTP id i14so4797450pfu.13
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jul 2020 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=t1DD21hpudIl7FcxmIGxgkbZcJ2yGSiWAAezO5F79aU=;
 b=CZUYXIBZoVXVChixa0O/K3kXm7Ewilu0RFQ7/4JPxQxJaX8gN28WnJm5kSrLnTpUsN
 2KJbBZCFQ0tzbK1A/DjuWDwic1QLIYXrOpN19GqYSE4/k0C8Kada89vUPDEGb3Ik2opQ
 RGauVFFXSonL5FOtD6hPw/SXjSbEtD6NkRjRcXYRBrhYLOrFQuJKRNlFSSHGyM/xtMnU
 etnecfT2zZSfIaVJQqJnTymtuLYpBxi+dSoGcB5c5hemrNtV4j1S+qlL3LxA+70gDUKn
 RIwGsPyQLjvqFEKa6IOStVyD04Ejj456//Ut7v7lyQ3FvjeBWYEeUDm1OQtfdrBDHGsT
 zE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=t1DD21hpudIl7FcxmIGxgkbZcJ2yGSiWAAezO5F79aU=;
 b=l1fdwsCOunbx3dea7267Ddea0fjffIZIHQtqxLrZHt3T1RDuAZkvQeCb+8QOxsGVqn
 abTmlVo/zibnkZj5lYa3avmdMjsnbuZ+49OXJocZOpTtV+WlRCDzgu7BzkgVm/nBmVce
 uC7SUjzVnElvgNALuTK1Nxmh8epzE9vd+8DfHqTrXWWmIUm2hdAHxzBDLRbkAyaLjTED
 /EIodaoVnrgYBoP/CU1BTlKOWCKaD0wmb9keqKw2Q4NMb1rADQOqO7dceNn5snhfdGVT
 Rd4XkkaYZTKHfLgmClnah4UBuH4CGbMTjApbatgtnTW7R/ObpxdO2jqEQYxF77VaD1kw
 2iIQ==
X-Gm-Message-State: AOAM531/2orXySDthct//rOeFNOhMAC1xiGRWjp/sRzVCr2pWWIxIEtH
 BLd7H0u+hnmofD8QP06TEHU=
X-Google-Smtp-Source: ABdhPJw7BzcwvU8d0O+5AuIwLNw0BQrrJ8O1PDi9wenGTXVIm6dEfVg1zNrbKn7/ozhP/RJYPCcM0w==
X-Received: by 2002:a63:b546:: with SMTP id u6mr28953675pgo.381.1594562271696; 
 Sun, 12 Jul 2020 06:57:51 -0700 (PDT)
Received: from rapsodo.Rapsodo.com ([101.100.171.87])
 by smtp.gmail.com with ESMTPSA id o4sm11682022pjo.16.2020.07.12.06.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 06:57:50 -0700 (PDT)
From: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: micron: add support for MT29F2G01AAAED
Date: Sun, 12 Jul 2020 21:59:42 +0800
Message-Id: <20200712135942.10904-1-nthirumalesha7@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_095756_940578_F7CEC797 
X-CRM114-Status: GOOD (  13.49  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The MT29F2G01AAAED is a single die, 2Gb Micron SPI NAND Flash with 4-bit
ECC

Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
---
 drivers/mtd/nand/spi/micron.c | 77 +++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 5d370cfcdaaa..7e0b61d7b90f 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -17,6 +17,7 @@
 #define MICRON_STATUS_ECC_1TO3_BITFLIPS	(1 << 4)
 #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
 #define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
+#define MICRON_STATUS_ECC_1TO4_BITFLIPS	(1 << 4)
 
 #define MICRON_CFG_CR			BIT(0)
 
@@ -44,6 +45,19 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
+/* Micron  MT29F2G01AAAED Device */
+static SPINAND_OP_VARIANTS(read_cache_variants_mt29f2g01aaaed,
+		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
+
+static SPINAND_OP_VARIANTS(write_cache_variants_mt29f2g01aaaed,
+		SPINAND_PROG_LOAD(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(update_cache_variants_mt29f2g01aaaed,
+		SPINAND_PROG_LOAD(false, 0, NULL, 0));
+
 static int micron_8_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -69,11 +83,41 @@ static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static int mt29f2g01aaaed_ooblayout_ecc(struct mtd_info *mtd, int section,
+					struct mtd_oob_region *region)
+{
+	if (section >= 4)
+		return -ERANGE;
+
+	region->offset = (section * 16) + 8;
+	region->length = 8;
+
+	return 0;
+}
+
+static int mt29f2g01aaaed_ooblayout_free(struct mtd_info *mtd, int section,
+					 struct mtd_oob_region *region)
+{
+	if (section >= 4)
+		return -ERANGE;
+
+	/* Reserve 2 bytes for the BBM. */
+	region->offset = (section * 16) + 2;
+	region->length = 6;
+
+	return 0;
+}
+
 static const struct mtd_ooblayout_ops micron_8_ooblayout = {
 	.ecc = micron_8_ooblayout_ecc,
 	.free = micron_8_ooblayout_free,
 };
 
+static const struct mtd_ooblayout_ops mt29f2g01aaaed_ooblayout = {
+	.ecc = mt29f2g01aaaed_ooblayout_ecc,
+	.free = mt29f2g01aaaed_ooblayout_free,
+};
+
 static int micron_select_target(struct spinand_device *spinand,
 				unsigned int target)
 {
@@ -114,6 +158,27 @@ static int micron_8_ecc_get_status(struct spinand_device *spinand,
 	return -EINVAL;
 }
 
+static int mt29f2g01aaaed_ecc_get_status(struct spinand_device *spinand,
+					 u8 status)
+{
+	switch (status & MICRON_STATUS_ECC_MASK) {
+	case STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	/* 1 to 4-bit error detected and corrected */
+	case MICRON_STATUS_ECC_1TO4_BITFLIPS:
+		return 4;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static const struct spinand_info micron_spinand_table[] = {
 	/* M79A 2Gb 3.3V */
 	SPINAND_INFO("MT29F2G01ABAGD",
@@ -217,6 +282,18 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status),
 		     SPINAND_SELECT_TARGET(micron_select_target)),
+	/* M70A 2Gb 3.3V */
+	SPINAND_INFO("MT29F2G01AAAED",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x9F),
+		     NAND_MEMORG(1, 2048, 256, 64, 2048, 80, 2, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_mt29f2g01aaaed,
+					      &write_cache_variants_mt29f2g01aaaed,
+					      &update_cache_variants_mt29f2g01aaaed),
+		     0,
+		     SPINAND_ECCINFO(&mt29f2g01aaaed_ooblayout,
+				     mt29f2g01aaaed_ecc_get_status),
+		     SPINAND_SELECT_TARGET(micron_select_target)),
 };
 
 static int micron_spinand_init(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
