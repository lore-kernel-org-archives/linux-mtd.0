Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E954CCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LkYzM+u+mJSIisjczLh6XPfglv5m9GCvVdOL9AqiGg=; b=4XcR0jPwzs4oNl
	A7u7odtHL/8O6Uy/Otzi7UKOD2BS+PzBiBa2apjbH83WtN8rb3Vfqqk5IFk72E/uU9yAOkMQV3wqe
	zbDmFPCPMFpnb+dhCMvDsfHbR6NZvJdTmYPiFO9eErLOl9m2cjqdEogWmyT4Zwistx60E+5G5ihP6
	jEgi4e8Kli5VmpLj8ahW3K5rdlj/Yqom8AHhDcNn79IvfpM03mgWShFUJag6yjYrJJAtvEFmuN3MK
	cFRTfjhBHrqnuqaTSK/X8t57qz2EFCaX1tyM4iX/u4vd2VG5ohplz3hwHbCXQfnrzVUdP7VoptIz5
	QuapluReCGvAlDUEhXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswf-00000006VuU-054J;
	Fri, 31 Oct 2025 17:29:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvk-00000006Ukx-0jCp
	for linux-mtd@bombadil.infradead.org;
	Fri, 31 Oct 2025 17:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Yqsm5byi+NRPnRhNkd8UBM/Bmv6Ofu8I+HrZRoBLCI0=; b=ZGZL24G2vEbDkBff3ulTds/LYY
	2+ElbkCktE08Nm1BiP+lninawka8omwYTUr8Gw7QGONKQXNxltbnscBuDYXCrKvuX2omhZ8gWwPw9
	ZZ09ixUEYewk0vzNSp2XDW0e0KK3hhsaJ3I5G3h9HZ0cxfOScWvPC7iI5agG2nKdZyo0KgI+eU8m6
	a9zrb0sHOmxiFiAkXenG8hLcVhNN+nUr+38PH65knuOhjEBLEM4Ze871g8VvcIObZ9ZypraPWJT/B
	EbWTx31+2ILHpGfoPVEtGWKv2pHoGEQ+yfC01Gka8wp4i6prb/Ko2EL0FLBb9pXS4cbCvZQcPB/u2
	Gq7s9oXg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEs3x-0000000Bkhk-3l2c
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 16:33:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD4061A17C5;
	Fri, 31 Oct 2025 17:28:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F16360704;
	Fri, 31 Oct 2025 17:28:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D1F011818007;
	Fri, 31 Oct 2025 18:28:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yqsm5byi+NRPnRhNkd8UBM/Bmv6Ofu8I+HrZRoBLCI0=;
	b=Vncpdjk72ik/OAK7vIr+QdHzNB7KIZeweosE6fE9DJRk/oLB1X2XDCYOzOdCCSK7hpuIJS
	6pbUX//afKCvZVnkDCtmN480fbGITJFS/X2fVGGEDckMaE+2dntQvo+l9D3s74DEZf7AzJ
	KCm76pLqqO3+GxlXoCczI+Sf1Qp4sKr75ZGhRqGgSw5A5aXNHanWDRuxmbJgTjeBEG4PZb
	3pVYOMO95HZOL2m+R+dAgC8w/0EkYOpZnRlQ+qN64e2R/OgqmN7xwAc22vQ48pKZm8EYke
	1LePAD795uNNNyBM64E7koiaGE23wn5NwasJkrKAqBJKA0V9vW1QPU9f90vg/g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:12 +0100
Subject: [PATCH 28/28] mtd: spinand: winbond: W35N octal DTR support
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-28-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_163318_070075_7EB84CF3 
X-CRM114-Status: GOOD (  11.53  )
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

Extend the support for the W35N chip family by supporting the ODTR bus
interface. The chip is capable to run in this mode, which brings a
significant performance improvement.

1S-8S-8S:

   # flash_speed /dev/mtd0 -c1 -d
   eraseblock write speed is 7529 KiB/s
   eraseblock read speed is 15058 KiB/s

8D-8D-8D:

   # flash_speed /dev/mtd0 -c1 -d
   eraseblock write speed is 9481 KiB/s
   eraseblock read speed is 23272 KiB/s

This is +55% read speed and +26% write speed with the same hardware.

Tests have been conducted with a TI AM62A7 using the Cadence quad SPI
controller.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 90e4ece00cf5e727df87cb2367d9f85a2a6759bb..8430ae307be0fefded8e27109403a59b9b17b089 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -36,6 +36,8 @@
  */
 
 static SPINAND_OP_VARIANTS(read_cache_octal_variants,
+		SPINAND_PAGE_READ_FROM_CACHE_8D_8D_8D_OP(0, 24, NULL, 0, 120 * HZ_PER_MHZ),
+		SPINAND_PAGE_READ_FROM_CACHE_8D_8D_8D_OP(0, 16, NULL, 0, 86 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP(0, 3, NULL, 0, 120 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1D_8D_OP(0, 2, NULL, 0, 105 * HZ_PER_MHZ),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_8S_8S_OP(0, 20, NULL, 0, 0),
@@ -48,11 +50,13 @@ static SPINAND_OP_VARIANTS(read_cache_octal_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
 
 static SPINAND_OP_VARIANTS(write_cache_octal_variants,
+		SPINAND_PROG_LOAD_8D_8D_8D_OP(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_8S_8S_OP(true, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_8S_OP(0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
 
 static SPINAND_OP_VARIANTS(update_cache_octal_variants,
+		SPINAND_PROG_LOAD_8D_8D_8D_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_8S_8S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
@@ -93,13 +97,22 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 1))
 
+#define SPINAND_WINBOND_WRITE_VCR_8D_8D_8D(reg, buf)			\
+	SPI_MEM_OP(SPI_MEM_DTR_OP_RPT_CMD(0x81, 8),			\
+		   SPI_MEM_DTR_OP_ADDR(4, reg, 8),			\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_DTR_OP_DATA_OUT(2, buf, 8))
+
 static SPINAND_OP_VARIANTS(winbond_w35_ops,
-		SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(0, NULL));
+		SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(0, NULL),
+		SPINAND_WINBOND_WRITE_VCR_8D_8D_8D(0, NULL));
 
 static struct spi_mem_op
 spinand_fill_winbond_write_vcr_op(struct spinand_device *spinand, u8 reg, void *valptr)
 {
-	return (struct spi_mem_op)SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(reg, valptr);
+	return (spinand->bus_iface == SSDR) ?
+		(struct spi_mem_op)SPINAND_WINBOND_WRITE_VCR_1S_1S_1S(reg, valptr) :
+		(struct spi_mem_op)SPINAND_WINBOND_WRITE_VCR_8D_8D_8D(reg, valptr);
 }
 
 #define SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(buf)			\
@@ -390,6 +403,9 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand,
 	case SSDR:
 		ref_op = spinand->ssdr_op_templates.read_cache;
 		break;
+	case ODTR:
+		ref_op = spinand->odtr_op_templates.read_cache;
+		break;
 	default:
 		return -EOPNOTSUPP;
 	};

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
