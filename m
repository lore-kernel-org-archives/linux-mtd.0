Return-Path: <SRS0=+6Wf=EO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A8AC55ABD
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 11:38:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62A5C206ED
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 11:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v3brjMu2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvCLndGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62A5C206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tT/dug7dJHuF8tZTuQtzd7SXbDausvrDk8qYJKPlg7M=; b=v3brjMu2wcatXPa+ddo4txkDd
	ou8f6dDxv1faiNZ4XTs4dxFrP7fw7dyP/2mFYAB2Gj2sTKGWVSansn8abXvzL6Jg37JQfmqDP/kY3
	lAwBq/jkqvgwtr+r+Z2T6snqo6EjfDEzzgVAV4jqibeap4YzDBoAuuHPYiQvl1XQmCtly5wwWomaA
	OHkeABtvgAPBuoQxbbO6iI3VEKotE6njJxlGoX+5g6Y+P/MVgvQIsFhxnebsrNP88qB+CnXAW8oaa
	hzSoa6/iyCWMFslYwty+sG2sfw+AyeZExvz2qde2XVTASvYFfr98MzAcQbE1r+MhLjku8r9F877qE
	gvpNheF6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbj14-0001EP-JR; Sun, 08 Nov 2020 11:37:50 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbj12-0001DK-90
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2020 11:37:49 +0000
Received: by mail-pj1-x1044.google.com with SMTP id w20so1780726pjh.1
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2020 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aB4WwGKR70yONlWJx+YO2+K1cBRtMLw1WCeTBhf6I0Y=;
 b=QvCLndGPBskmluRDXVJVH/4aVlyTBBXO2Cb8OC9H5LJtz93CAepMfhZ9A2tf+LYy00
 XshJRhVtCQj3SjC1PtafbSsHqVTxVdsnGn/2vmMhcUSjMyWXRsQG2ROaX2CY67E1/egD
 hPw1Tg8h2o1kSqTAvo062LuVC6z7fBtnqBrGEd2CQ9wfeXIKH6fK4gNyUGlSUCx4Mih2
 l1WbRK2s6lnl5ESpJrvc3UPMMRjGAmMMg7VOi/wXAi34z5zofM1z5/N+Ye0/QK2zKrGq
 0cpP8YgO9YQGOcUlYEehWpvsCD/1CEtOf0DvhR/1b0jdfEWrXUdIuIlHeu4KFANQz3X0
 gcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aB4WwGKR70yONlWJx+YO2+K1cBRtMLw1WCeTBhf6I0Y=;
 b=bUWSy4VYfA4ZJhvd5ODdjiLyNNVSbgowCoD/zfspVRJHnl7r+cdHaLEBMRMd/ltmG9
 BOCfnyH1k64y544fD7BnK/xVJV2GHmcjgF8jwj+Bx+zxoeaIPBAf/nLDsn4LTh6g+rSl
 of8OU0WeIPV8TQBMZYVFPpf18dnsmjUGvU6mpPapG2fXDeaUwQxYtz+zCpfTMYdf6rAd
 VPN85fuuYqIK7bZ9xxEoy2qDu68m3tiW/2UwW1CmGOSodJEvDM3FJKFByC4ZeHntdJXf
 +R1QH6yKZRxAlgxHgIP4z8+y6wF1ow+GIpf+cNf+d5wtIqxM5vpViZq8dMvhiuD1eJEI
 s26g==
X-Gm-Message-State: AOAM531x9FYETND06fLbHqlCwCK4jBPL3dcqmPlNmSQfHQ14yvksXElV
 24OGvyHtvao2CW/CtlUcHQQ=
X-Google-Smtp-Source: ABdhPJzbM4MA4FD2yAry7JUysEifKKcn5JtRKbXjn3IBP/9Qc0MMYfROsn94OmltghFJVjf1q0nL/A==
X-Received: by 2002:a17:902:728f:b029:d6:fcbe:99c5 with SMTP id
 d15-20020a170902728fb02900d6fcbe99c5mr8682167pll.20.1604835466003; 
 Sun, 08 Nov 2020 03:37:46 -0800 (PST)
Received: from IGL6397W.cw01.contiwan.com ([27.104.143.83])
 by smtp.gmail.com with ESMTPSA id t85sm7230263pgb.29.2020.11.08.03.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 03:37:45 -0800 (PST)
From: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] mtd: spinand: micron: Generalize the structure names
Date: Sun,  8 Nov 2020 19:37:34 +0800
Message-Id: <20201108113735.2533-2-nthirumalesha7@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201108113735.2533-1-nthirumalesha7@gmail.com>
References: <20201108113735.2533-1-nthirumalesha7@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_063748_325199_42E0056A 
X-CRM114-Status: GOOD (  11.31  )
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

Rename the read/write/update of SPINAND_OP_VARIANTS() to a generic names

Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
---
 drivers/mtd/nand/spi/micron.c | 60 +++++++++++++++++------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 5d370cfcdaaa..afe3ba37dcfb 100644
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
 
@@ -120,9 +120,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
@@ -131,9 +131,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
@@ -142,9 +142,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
@@ -153,9 +153,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
@@ -164,9 +164,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status),
@@ -176,9 +176,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
@@ -187,9 +187,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
@@ -198,9 +198,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status),
@@ -210,9 +210,9 @@ static const struct spinand_info micron_spinand_table[] = {
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
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status),
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
