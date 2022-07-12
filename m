Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33619C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jul 2022 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oR//XrUNM7ulR4vZxgnw4gejKy777rMsgIPpS6wlbXc=; b=l7KotdSANWGGys
	ifkg0HDAy+/1pSjv0iS2I4kKDSA4FbmKPzLsMW5lWGLQyfPjrU0DFfvI7c2/idlWBYYjQ2VUa2yCu
	080GE4wkOLUR/lNy0APxarM/XIYiJCeRuHsxdJUMR6Xg1f22aA6Qm9bDvGESntUlnaILY7spi1S1r
	UGhNLTxRrvhkQgXvXC6mPeY2tiTRAE/50znIBjQYn6BLm3QAJvOEq1HYk2YossAUsFoOx3EuAc1U0
	qZi5gxQdC6Trqjm5LT8gDqGOOoiUetGa8DiaId3IS9a2WjdtsPqqjM3S5TDYxT9EE/jYUvqjPEOLY
	HUXj41CMGOwL2u2t9Yuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIvH-00CusT-MN; Tue, 12 Jul 2022 16:39:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIuF-00CuCT-8Q
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2022 16:38:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id d16so11931585wrv.10
        for <linux-mtd@lists.infradead.org>; Tue, 12 Jul 2022 09:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bsQn2grPS7xgXNrR8QS8Z/js+pIZTD+IK94HxJFk+rM=;
        b=Vc3tXNm7QiJjXb2PTQiQlCHYyKSpT4cw3gmMIXMXtLLDSS5+msg5QkSbx8OcZgwJWB
         3sJNkhjVy3ykyph+owYKFX0NI7pd7Bshi6xOaJOKQjJSDOGAPkPDtiXBz7Oh7CPy99bf
         ckoBPbv0Jvu8rNIk/yiiPqlsOQViRLUEfEi3D6ecNMA90ETZK1V4dLgnEztbxQJxOiWy
         FVadpwlMlqMSvkfJEteuERDldYZRwrBuWgsKqcRriOp5P6eKeSVPQ+FJD8kOYqKlUiGE
         rbG2mpLuhM11eKznY/j1BC7Ep8pCGcjE/G025iFI8857+aIGwVIzj7KZ/1ZV4T2zVm0d
         DqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bsQn2grPS7xgXNrR8QS8Z/js+pIZTD+IK94HxJFk+rM=;
        b=B+LABV3+gDxm3tI0PQPKuIokaDmCws6zhVbyPDGozVaGKdyU6n/Fqzbk6ygcgeFk8T
         r5pAaduDHD7sCMJEtZGjpjC21EcR+NIriNqVTEw/KhxL/1ebdG3wX+ymU+doI7j0ShxH
         M0OZtRHHmcx4DCLz2CQBi2CZOzCFJvRy50N9OQcQ/FClLE4gZRAopcPvBIVOEEvHTtyA
         VfHaHO1YgNLNSbds3u9XVMSbIdgJpoTNPYtRenjkh8f0NUQWkl+JVQxJiZq9xE/E+I3W
         ehwg/hxFgKhAxXrxf7lySORU1Q+O1VV+Pi68OZKZFJckgcbp9Ko6iXXvcr5gRaZNFCgk
         kVog==
X-Gm-Message-State: AJIora9FuYs4Unl/NiOt38PO0/x6klqqjZHqj5vJkZTf6LE0WaW+Q2R1
	elxBY6JPTMqnSzeMwWvTwzhVQw==
X-Google-Smtp-Source: AGRyM1vnzhRsv1t/YSN1aTRxG2Afz1YPqX0pdQKi6vtLJh2KgUD2dcowzt9rE3HD+p/L7p/Z8YYmmQ==
X-Received: by 2002:a5d:4889:0:b0:21b:293e:9e43 with SMTP id g9-20020a5d4889000000b0021b293e9e43mr22404241wrq.705.1657643912132;
        Tue, 12 Jul 2022 09:38:32 -0700 (PDT)
Received: from localhost.localdomain (host-78-150-47-22.as13285.net. [78.150.47.22])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d424e000000b0021d4d6355efsm8623751wrr.109.2022.07.12.09.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:38:31 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH 2/3] mtd: spi-nor: add support for Quad Page Program to no_sfdp_flags
Date: Tue, 12 Jul 2022 17:38:22 +0100
Message-Id: <20220712163823.428126-3-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
References: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_093839_364116_4C418B2B 
X-CRM114-Status: GOOD (  13.18  )
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

Some flash chips which does not have a SFDP table can support Quad
Input Page Program. Enable it in hwcaps if defined.

Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
---
 drivers/mtd/spi-nor/core.c | 5 +++++
 drivers/mtd/spi-nor/core.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e5f7691c5bd40..e299fc8fdd3d4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2375,6 +2375,11 @@ static void spi_nor_no_sfdp_init_params(struct spi_nor *nor)
 		spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_8_8_8_DTR],
 					SPINOR_OP_PP, SNOR_PROTO_8_8_8_DTR);
 	}
+	if (no_sfdp_flags & SPI_NOR_QUAD_PP) {
+		params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+		spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+					SPINOR_OP_PP_1_1_4, SNOR_PROTO_1_1_4);
+	}
 
 	/*
 	 * Sector Erase settings. Sort Erase Types in ascending order, with the
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 58fbedc94080f..dde636bdb1a7c 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -462,6 +462,7 @@ struct spi_nor_fixups {
  *   SPI_NOR_OCTAL_READ:      flash supports Octal Read.
  *   SPI_NOR_OCTAL_DTR_READ:  flash supports octal DTR Read.
  *   SPI_NOR_OCTAL_DTR_PP:    flash supports Octal DTR Page Program.
+ *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
  *
  * @fixup_flags:    flags that indicate support that can be discovered via SFDP
  *                  ideally, but can not be discovered for this particular flash
@@ -509,6 +510,7 @@ struct flash_info {
 #define SPI_NOR_OCTAL_READ		BIT(5)
 #define SPI_NOR_OCTAL_DTR_READ		BIT(6)
 #define SPI_NOR_OCTAL_DTR_PP		BIT(7)
+#define SPI_NOR_QUAD_PP			BIT(8)
 
 	u8 fixup_flags;
 #define SPI_NOR_4B_OPCODES		BIT(0)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
