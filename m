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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B228C388F9
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 11:38:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D59206ED
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2020 11:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HdXGRdfK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXBR5JZW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5D59206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jt30Dz9qlViPSHDzW6wUSIC+veka7EpRWgaufxOOybw=; b=HdXGRdfKICG+S0pSeRQ6X+v9H
	7oKCh9tZ5HeyruGzOsNwYOist0oaaGGTiORn3wrb/5cQtqKmrNIQWR4Y4XWcXygqi9ztA9+WveKpe
	SGRJ9J+oiAHrgjIeEPJfPgYMqhYafKUh9oGY9O+XZMYyCrdUTxQyKZ0IXStJhTEy74qpYF5WEibHb
	sDTyivlTmN4cSn/LbX9Q2jFAHs79V5+dJyDrnyj9+4eIT2Y0GFzAy4kLKhjMv5//vw68npK8RAcQF
	tX1T4WcHgjhbV8aIQiRBXRG3PJNg76A43BYvvroHeoj0yUPUgPUhpdeFiMIXfWnOAz+au8I1dmc5Q
	o9DFFZ9dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbj17-0001FG-7N; Sun, 08 Nov 2020 11:37:53 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbj14-0001EE-JG
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2020 11:37:51 +0000
Received: by mail-pf1-x444.google.com with SMTP id x13so5376616pfa.9
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2020 03:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYoHiYlx9UghIDvWrFDWg6JDwlt3tel+kK4HoN87nLs=;
 b=mXBR5JZWrLpB6s9IP3POfkZPiNL2RodeHAfwmcZ39R9c9TAjUpA8NFIUVgrarqYfhn
 FAR4AWzw6//Y/tJ7cLm537fadvazKncdlcLowV/nCv86IRscZi+y1VbYWBoiYPvDc4Qq
 KG6uzrOe8Owd6C7qB+uEYQ1/ooFSDc2VBgRcM35muX2VbHq3dfcrjbicIasl/p0e6TTR
 kQAFuCSJxVhgoRlLeAvYL2Iclz331bMEWSA85fv9YkoGGteFHUL8qLVONbn1E1+ltaC7
 Hzw5vfxahPKRgekxyxJ8mtWfcLLuQj6M0RybVBjwB4XgWLI9UJ0otQt8TVB7tAxAuXxU
 ZSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GYoHiYlx9UghIDvWrFDWg6JDwlt3tel+kK4HoN87nLs=;
 b=XWkPEkIU6FFHcly16LlYrH9rgFomRC3N0UD1GOVbrYhJ/XXlR7jpSHBgSQT9yqP0s+
 QKRVZxavHmaWGjLBUbilPoC5glEu9g+6XhvXaQIsL9spX/GzW/OKSKssPo5lXE1qxoIz
 os/tTRJ9YtRqZh1aQBKzhTq+kU7dwquk7mHDm7sTVyVP45KSfRAdHeYCDeJYRR+KeQfQ
 SQ9DkGF+PSY63kTJKexB6ZHqrXz+nQC4z/ME5bPV0zYyJt2W13BVv8Oea76lQ/Z0iayI
 Vw1otIQ1CXhkdFLDL4W+fRqfaeLUfBNFz2Fn2O3HCUyWZNeqkPd1mBNILbzJrnZljgnA
 qR3A==
X-Gm-Message-State: AOAM5313d/Rm0GAWRzYnHcfbRN88kWRjuSxfl5KI5xo1bcyC09hjBuu3
 v0I+qiPg6I6vlnkpeoPMMUU=
X-Google-Smtp-Source: ABdhPJxNVydSoGufRXWP4lE8LLTfBLbDGDWVtkbCaiP3lNn0L6tmduj8/hYHvJi0/BLHzDxmovWN7g==
X-Received: by 2002:a63:ea0f:: with SMTP id c15mr9007599pgi.367.1604835468798; 
 Sun, 08 Nov 2020 03:37:48 -0800 (PST)
Received: from IGL6397W.cw01.contiwan.com ([27.104.143.83])
 by smtp.gmail.com with ESMTPSA id t85sm7230263pgb.29.2020.11.08.03.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 03:37:48 -0800 (PST)
From: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/2] mtd: spinand: micron: Add support for MT29F2G01AAAED
Date: Sun,  8 Nov 2020 19:37:35 +0800
Message-Id: <20201108113735.2533-3-nthirumalesha7@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201108113735.2533-1-nthirumalesha7@gmail.com>
References: <20201108113735.2533-1-nthirumalesha7@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_063750_704900_43055AF0 
X-CRM114-Status: GOOD (  16.09  )
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
index afe3ba37dcfb..50b7295bc922 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -44,6 +44,19 @@ static SPINAND_OP_VARIANTS(x4_update_cache_variants,
 		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD(false, 0, NULL, 0));
 
+/* Micron  MT29F2G01AAAED Device */
+static SPINAND_OP_VARIANTS(x4_read_cache_variants,
+			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0),
+			   SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, 0));
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
@@ -74,6 +87,47 @@ static const struct mtd_ooblayout_ops micron_8_ooblayout = {
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
+static const struct mtd_ooblayout_ops micron_4_ooblayout = {
+	.ecc = micron_4_ooblayout_ecc,
+	.free = micron_4_ooblayout_free,
+};
+
 static int micron_select_target(struct spinand_device *spinand,
 				unsigned int target)
 {
@@ -217,6 +271,16 @@ static const struct spinand_info micron_spinand_table[] = {
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
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
+		     SPINAND_ECCINFO(&micron_4_ooblayout, NULL)),
 };
 
 static int micron_spinand_init(struct spinand_device *spinand)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
