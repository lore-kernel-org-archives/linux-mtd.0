Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF30CCFA03
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f004b5GLdxuSx+Dwam3KqrApuTj3V8bTijsERTjabmA=; b=q7U84C4ioBlvUH
	lWLMr6PU5EP0wiaDHRXVYAP9V5174WALsVR3CBvHOF9ZCykrVRTD6uWj85lktDQFl4rUkl9qn+oGl
	t2kXNWTf2q9tSRy3t4QLr9mkcDnoE5neOD7/bBUPVhWQinYG6f6Ksl2ihiSlmKH3DpPd3KC9cSH8H
	BqdAzLhcYBfWM0Tek1TMDju+B+KbTpFrCX1BJVtMNLXraRFzHdzyxUnKzv7F6gtE2siQ0PlU3Pa0l
	0lH82Cs9Uu5VtxQp/DwRw0M6VrN8np2uSvfgORl+IkNZoHWcI+mSvBzIdtwvNwFARENPL3Of4HeK4
	a6ojzHPbaFdwT+5XgxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsw4-00000006V7y-3xf0;
	Fri, 31 Oct 2025 17:29:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvR-00000006UOG-3LSv
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D28B94E41446;
	Fri, 31 Oct 2025 17:28:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A829160704;
	Fri, 31 Oct 2025 17:28:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 176E21181800A;
	Fri, 31 Oct 2025 18:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SSScNc/ZTYByCMEF9q858dnRFAdSrotGIfTOHWGCemk=;
	b=RD+p5LMiV31QgnitgyjquqxiAyyuIQfYCl7nXRnzvC2LANs0sSmkqRx4xlfjHbGnFZ0CoQ
	/iV0N8qk3ji+C+YXK468xQBh6sXnVJpMJsEIU3QPP6G6jCZCBUMFRA1v9EbC0ct61TXHIr
	NWnq6PAYWI2enYSBP/VuIKLM3mQ9bsvKPN0I6SkLDFAyvXqnvkpMHr5prucSHYrIEbsFjl
	Bghd1fQ93xZu1bLVPijRSg8Qic7GLdmkcVJUC7J8tSybaV5kFibC2wGEypckFk/hR5ULeU
	9K9bTwUGFKJ9zACa22v0DBP2wM0Y4Re9uX46aPd1Bi0mrfJCXeteNAwMcAnkMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:00 +0100
Subject: [PATCH 16/28] mtd: spinand: macronix: Register vendor specific
 operation
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-16-be42de23ebf1@bootlin.com>
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
X-CRM114-CacheID: sfid-20251031_102834_720920_7A8DECCB 
X-CRM114-Status: UNSURE (   7.71  )
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

Provide the Macronix specific "read ECC status register" operation so
that the core can verify if it is supported by the controller before
using it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index a847ea8f49a8a7005405f6083a4aaac942974998..6b7cbcc6e2872d3369b8eb765dede05c7299c896 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -47,6 +47,9 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		   SPI_MEM_OP_DUMMY(1, 1),				\
 		   SPI_MEM_OP_DATA_IN(1, buf, 1))
 
+static SPINAND_OP_VARIANTS(macronix_ops,
+		SPINAND_MACRONIX_READ_ECCSR_1S_0_1S(NULL));
+
 static struct spi_mem_op
 spinand_fill_macronix_read_eccsr_op(struct spinand_device *spinand, void *valptr)
 {
@@ -174,6 +177,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX35LF2GE4AB",
@@ -195,6 +199,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_CONT_READ(macronix_set_cont_read),
@@ -208,6 +213,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_CONT_READ(macronix_set_cont_read),
@@ -278,6 +284,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX31UF1GE4BC",
@@ -288,6 +295,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 
@@ -301,6 +309,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT |
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT |
 		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX35UF4G24AD",
@@ -312,6 +321,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT |
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
@@ -324,6 +334,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
@@ -336,6 +347,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_CONT_READ(macronix_set_cont_read),
@@ -351,6 +363,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT |
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT |
 		     SPINAND_HAS_READ_PLANE_SELECT_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX35UF2G24AD",
@@ -362,6 +375,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT |
 		     SPINAND_HAS_PROG_PLANE_SELECT_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
@@ -374,6 +388,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
@@ -386,6 +401,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_CONT_READ(macronix_set_cont_read),
@@ -399,6 +415,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_CONT_READ(macronix_set_cont_read)),
@@ -410,6 +427,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX35UF1G24AD",
@@ -420,6 +438,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_READ_RETRY(MACRONIX_NUM_READ_RETRY_MODES,
@@ -432,6 +451,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_CONT_READ(macronix_set_cont_read),
@@ -445,6 +465,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status),
 		     SPINAND_CONT_READ(macronix_set_cont_read)),
@@ -456,6 +477,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 	SPINAND_INFO("MX3UF2GE4BC",
@@ -466,6 +488,7 @@ static const struct spinand_info macronix_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     SPINAND_HAS_QE_BIT,
+		     SPINAND_INFO_VENDOR_OPS(&macronix_ops),
 		     SPINAND_ECCINFO(&mx35lfxge4ab_ooblayout,
 				     macronix_ecc_get_status)),
 };

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
