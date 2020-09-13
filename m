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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C726EC43461
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 16:16:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D1BE221EB
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 16:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VfXV8TTj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyPL2Pql"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1BE221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2cOXsiDNNOaBWjBC6PDzi8NQ6Kl8H00cW4Md7TBaUWA=; b=VfXV8TTjJin+HfhF9eCBIK6pm
	fzmfElcFngCGEqduX6Ce0Dx1gA/+mZiiWCL1EeB2kTCLbownIgRrJgWoZrAXEaG6Yjt3/PdiaOaOW
	zt/knX2Hkn2auEGVHJ3hChsHUpcsMVaxpRU+Hd2PvvundUUo+FGDdEoaWsxcIf4QdksSLAQY5uSjo
	2bgcfcEyqPKEBeuQcZ9aCaag3V2FLtMug4eKPRvyMpQU89kkbjHOZ3TReDdIgiH2RPQceavqObShU
	ry0yc2ERx2UjsUZ/qki8xNYNc3lsWSYBcMrbxcy7tIJ8vmGKl/qe2qCrAiwnFn2etJp3HHZIZ1npO
	cMEfEMt8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHUfO-0004kV-GY; Sun, 13 Sep 2020 16:15:50 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHUfL-0004jV-5D
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 16:15:48 +0000
Received: by mail-pl1-x643.google.com with SMTP id g21so2020618plq.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2020 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=95c6QPsz7bPnVQEayO8hHcHLwY3gkWsLTvnzG7IV4QE=;
 b=JyPL2PqlbFDejFLHfPHBZRJ3A0g45iKSb5MizjskJkzz2pwhCaupLh0WcVNnNSf7J+
 pSxBNIZ+sM/I4tmzqcsjZwyvlPz8zmn3rDILaZ/2bD8Db8wqvaS1/bK2ILewkquiYRtO
 Zy334qin3biNCs588Ynpqfkzr8hsZS6XJQ3WQxKuFxArsa6ZJIPyDtv0OG+S39TTLblx
 DWT1HeNlY9H+uzzdquZ7eFQovmVce3yiFR1ilyMh0OQULp6eC8JpUoFEOrx9zzhdZwXu
 lqQhXHKVmjhFEgLxelpdc2Lv6Fa30i01M5e7X9NDlmwg1m5+KEB40yujPGr9GcwUBS9D
 VDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=95c6QPsz7bPnVQEayO8hHcHLwY3gkWsLTvnzG7IV4QE=;
 b=TLm/B7fCj8zy34Wm1cq4sq0rDkwS77wv1wjDysduFiiTmnEggv/DStstwdrNsXnb29
 UvXMLdz2XOBXH0Y09Js8oXYtUtJnq006LlqIYHeahCXwELCKYV2zvZaD5+uOJk5w2/7b
 66b0GXZLrBCkgvnjkR2kaDs7lFq7ke7+wQhWFbq8ksjPN1oWPubSUeWbxNLz3FNmQ5tg
 kaj2jXpAp0jMLHS5/l8t2nYyixuvUPoa7EpLPGnrEicZj7NlxAbW74k9T26sxF6GGJhJ
 eXYgFPc9GxDxmTWy/Cutci+zhuG3xdkodtFzlJi1zBwL4H8BFDaYT7gXK3C7GhNO5a2u
 vPEQ==
X-Gm-Message-State: AOAM532Q0YBAlPSdRNG4XQumd7TnXgfXQeHIZvNNyMTR4M9hyxfDyFNC
 +TmPvu5QnE5HfsCzOrlNkVk=
X-Google-Smtp-Source: ABdhPJx1r6Cu5JCuNHrhMT9Pw2HGd3WfDv59A0SscaK1bShHv9zwyWcGn56yI4//KftEM+fpFyiryQ==
X-Received: by 2002:a17:902:8c96:b029:d0:ad87:6668 with SMTP id
 t22-20020a1709028c96b02900d0ad876668mr10819429plo.2.1600013745022; 
 Sun, 13 Sep 2020 09:15:45 -0700 (PDT)
Received: from Thiru.localdomain ([27.104.143.83])
 by smtp.gmail.com with ESMTPSA id c202sm7833953pfc.15.2020.09.13.09.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 09:15:44 -0700 (PDT)
From: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] mtd: spinand: micron: Generalize the function and
 structure names
Date: Mon, 14 Sep 2020 00:15:32 +0800
Message-Id: <20200913161533.10655-2-nthirumalesha7@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200913161533.10655-1-nthirumalesha7@gmail.com>
References: <20200913161533.10655-1-nthirumalesha7@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_121547_421033_D29A5AA7 
X-CRM114-Status: GOOD (  12.13  )
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

Rename the oob structure and read/write/update function names to
a generic names

Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
---
 drivers/mtd/nand/spi/micron.c | 80 +++++++++++++++++------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 5d370cfcdaaa..d1b1073d1a55 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -28,7 +28,7 @@
 
 #define MICRON_SELECT_DIE(x)	((x) << 6)
 
-static SPINAND_OP_VARIANTS(read_cache_variants,
+static SPINAND_OP_VARIANTS(quadio_read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_DUALIO_OP(0, 1, NULL, 0),
@@ -36,11 +36,11 @@ static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
 
-static SPINAND_OP_VARIANTS(write_cache_variants,
+static SPINAND_OP_VARIANTS(x4_write_cache_variants,
 		SPINAND_PROG_LOAD_X4(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD(true, 0, NULL, 0));
 
-static SPINAND_OP_VARIANTS(update_cache_variants,
+static SPINAND_OP_VARIANTS(x4_update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
@@ -69,7 +69,7 @@ static int micron_8_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
-static const struct mtd_ooblayout_ops micron_8_ooblayout = {
+static const struct mtd_ooblayout_ops micron_grouped_ooblayout = {
 	.ecc = micron_8_ooblayout_ecc,
 	.free = micron_8_ooblayout_free,
 };
@@ -120,55 +120,55 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x24),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status)),
 	/* M79A 2Gb 1.8V */
 	SPINAND_INFO("MT29F2G01ABBGD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 2, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status)),
 	/* M78A 1Gb 3.3V */
 	SPINAND_INFO("MT29F1G01ABAFD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x14),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status)),
 	/* M78A 1Gb 1.8V */
 	SPINAND_INFO("MT29F1G01ABAFD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x15),
 		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status)),
 	/* M79A 4Gb 3.3V */
 	SPINAND_INFO("MT29F4G01ADAGD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x36),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 80, 2, 1, 2),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status),
 		     SPINAND_SELECT_TARGET(micron_select_target)),
 	/* M70A 4Gb 3.3V */
@@ -176,33 +176,33 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x34),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     SPINAND_HAS_CR_FEAT_BIT,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status)),
 	/* M70A 4Gb 1.8V */
 	SPINAND_INFO("MT29F4G01ABBFD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     SPINAND_HAS_CR_FEAT_BIT,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status)),
 	/* M70A 8Gb 3.3V */
 	SPINAND_INFO("MT29F8G01ADAFD",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x46),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 2),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     SPINAND_HAS_CR_FEAT_BIT,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status),
 		     SPINAND_SELECT_TARGET(micron_select_target)),
 	/* M70A 8Gb 1.8V */
@@ -210,11 +210,11 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x47),
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 2),
 		     NAND_ECCREQ(8, 512),
-		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-					      &write_cache_variants,
-					      &update_cache_variants),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
 		     SPINAND_HAS_CR_FEAT_BIT,
-		     SPINAND_ECCINFO(&micron_8_ooblayout,
+		     SPINAND_ECCINFO(&micron_grouped_ooblayout,
 				     micron_8_ecc_get_status),
 		     SPINAND_SELECT_TARGET(micron_select_target)),
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
