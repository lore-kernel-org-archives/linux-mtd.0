Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6857EC7EE37
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jun 2023 05:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rjD0YanU9aq7cE7SXl4Fl5Zf/0xjRDbYRVXf1aATmzs=; b=NT+uoaWMnCHdDr
	sFgk09Waiutes2ZLh2+tpfVyy3aQK5zTtO4zGDSRh7riL6tFYSHfpZWoIy8bgzmWlVisnB1z2Sagq
	JvqPJ6iPWzfWIVx9yp8m7pqf5ZAdbKDOyfRCELGblitFRgiPqBLe+UfuDwjs/UpOZx54YZj4vFfEW
	1ObZwRQoxqN5u577uuVy9nW4ANhwjO3fmODB6swSBzdv/IGFH/S4ZLnUKT86MyBfaLdlr3Eu+N20t
	NN/jTa3VzOE3F65y9SfzKvuEa8fyDzi9rNe5VqeZwawa+S3BD+8Aa+zB+YKDSuTFRhZVKlGERqrLZ
	my2pSwq5nEdfRaH+DSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q785O-0088UH-0r;
	Thu, 08 Jun 2023 05:21:26 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q785K-0088TC-2K
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jun 2023 05:21:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-53f70f7c2d2so33297a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 22:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686201677; x=1688793677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rUt8NeEe6LR4t38IyDncRwhCYXLB8ru0FVYCy7O9E7U=;
        b=AOS1Ho4lL7CsMPbFTvOWwgwM2YRekgSBXFNXlVvpkLEB1D4mY/pCK+Ho+YQ+xoJMzF
         NAkOXqaJJxWjG4yn6gVtqaF14jNUCIQqD5MsV/uHZLYTp+S2hDMa9xOmOyjtCQQoBUXj
         3XoY3UnMEfSH1MiVbjt9G1ZE58weMfT02RcurTycg6b4/0eebR7KAYzWIjHjYU4lgRlJ
         VM3bXewsIK09kAcUsaWirPGBQQb6KbgOcYVZ8VkrN1WFMsHxisntAI1gWCU57lO3x6qg
         aKy1FX7YoP8bembafixPsrI66THucHArlbOrXn8XHCRNN8b60bcQB//x82pfuClXFo/+
         cOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686201677; x=1688793677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUt8NeEe6LR4t38IyDncRwhCYXLB8ru0FVYCy7O9E7U=;
        b=lwimYUodpjL7uIJsIRHWjnoOdwXHlet7JOzI2BBYiBRMsDCetm7LsUF2eoJHiB2ObV
         BGCbr7HD3OjU/pK8tgxlMkV//btyeASBvdnKbtuyQuIA7n/OyZ118Y+f+I9I+R6v96Pk
         Lli8HGhNnKJ2BjmjbEFJsBpuyxUc07pQAJQDLk8vnceHP5s3TJisGoGjpe3an8jD82ZD
         bmWYAf7c18nzg1XXFpmG4HPzr5GjIuLmG88WDNQAwRe1l/o+viZTD9gMjOAa5ihy1GCv
         JUVvBYs/55r04YQvs1gE2yYrI+HZ8gcZjyXxdCuGb8bEVH1ZPwBMmYumQTuGPqWuEQvU
         ZCkg==
X-Gm-Message-State: AC+VfDxQEPCHgHemPQVzl/UOlDU6MpkjwNeykongKKorJjuZaPoMDlEf
	xPzL3KXgJEfaLXNS0l4R+tC/03Ph1TA=
X-Google-Smtp-Source: ACHHUZ4D7YwKnL/7L64iFGB18blymWVSjJB/qgNuUDz1zDwwoAb+w05x46mtB/NlP2Sig3xWLr/DUg==
X-Received: by 2002:a05:6a20:9189:b0:10b:9dc1:c5e5 with SMTP id v9-20020a056a20918900b0010b9dc1c5e5mr2916331pzd.34.1686201676878;
        Wed, 07 Jun 2023 22:21:16 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id jg1-20020a17090326c100b001ab0b2dad2fsm415679plb.211.2023.06.07.22.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 22:21:16 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 7D11A80671;
	Thu,  8 Jun 2023 13:21:38 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org
Cc: alvinzhou@mxic.com.tw,
	juliensu@mxic.com.tw,
	liangyanyu13@gmail.com,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH] mtd: spinand: macronix: Add support for serial NAND flash
Date: Thu,  8 Jun 2023 13:21:14 +0800
Message-Id: <20230608052114.20454-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_222122_762125_B07A0E7F 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

From: JaimeLiao <jaimeliao.tw@gmail.com>

MX31LF2GE4BC and MX31UF2GE4BC are Macroninx SPI NAND flash
with 8-bit on-die ECC.

Validated via normal(default) and QUAD mode by read ,read back,
on Xilinx Zynq PicoZed FPGA which include Macronix
SPI Host(drivers/spi/spi-mxic.c)

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/macronix.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 722a9738ba37..3dfc7e1e5241 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -299,6 +299,26 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     mx35lf1ge4ab_ecc_get_status)),
 
+	SPINAND_INFO("MX31LF2GE4BC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x2e),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
+	SPINAND_INFO("MX3UF2GE4BC",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
+				     mx35lf1ge4ab_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops macronix_spinand_manuf_ops = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
