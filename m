Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02A6EDA69D
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqUii3DooWhjVfhAwRdds6NnaDGkpcEFF9htXLeGHi4=; b=BvwWgzFLCjXGP6
	CxneJ/d7f5FoF7iidETaH9y/w0D9xyeusmdyNJFQVblg4ir4Lv946Ho58SJ8nMGnx66Fo3Rc9irQl
	LMTkYrzWu4R2AUqBoEm6/KMLfqhRIARkhHR1Yp9/reTsarLyv80uPKcc+vdG/frEx+cFPY6FlKJZq
	459JBCpTGZcv7e++nTDSrQrfwdP9cx6fEIAYcDQldeYIshF/yDbMsnUhbxalTCliToYXxIXuen3VX
	JquKKCwtEeSoxRczu0dE8fZNsnp3NJ5gRzXy8spJXTS+lR27d1pNoKJGUP0m0FDbO0lFrDjgq43Of
	kOaFKik+vYvyG9XIhkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdL-0000000FZJ5-2VR9;
	Tue, 03 Mar 2026 16:30:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdK-0000000FZIN-3bmK
	for linux-mtd@bombadil.infradead.org;
	Tue, 03 Mar 2026 16:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=n4V326l6j+UN/QUc6C6H7//EMmn8uimk+2KtK4YoNFE=; b=GV0tcyhEcRKnd7yyIWptx44hW7
	rX9/+z5pZzHbb9QkJglIZ6J25DoJZ2tD0/F+9QeWJU554rIchvOqNr2J4HsYZOtwb8vwm+DLqJ0ac
	6qQPEmVmKsdQ4rT8A9j4ETwcfK99qCTJnR2l8/k1etN1UyNTipLDfAWYy0W7t5lkUVdbBIYXLEuLR
	oFo+tSr4F8xRHZC8LocWIdxh5YDns1jrVhT3MDqQp5zExcPlwfLG8e13A9Suyt/0wGb1VcEk74fvN
	NQKsTYCgK3FWasEI2dDCp1JzZeo6rYqs2NHaOzgZsSAekCC3afubp+pc36bWD/WN7nfo3NYxL79g1
	OGOx0dCQ==;
Received: from mail.fris.de ([116.203.77.234])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSdH-0000000Bna7-2bXD
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:30:05 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1772555397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4V326l6j+UN/QUc6C6H7//EMmn8uimk+2KtK4YoNFE=;
	b=Pr5md9R9pPJa1rWI6bCDoa9yT9iO6BLgDEl6wtN5sjCoQ7OLktynCTxAUCIktNmBpgNor7
	i+TCleRAdZL7RW2bTcXgs8AHpK5Kd3oW19FtJ4XfqzNXL/dSkPAMjRs6oeH4Lrp6FTqK1a
	dyBlxXfF8bfrPff26q+heIpY+BBhTmzq8kWv9tNyA6EsikQa7FlRZVuHCjpyB+ZqPWVH+S
	te15eCRncYbcisgU9Byr4U6t4auQo/m2SNpEyE3InOQGdeEcO1gHwEueU4Da/aNPpXTQ+6
	4lFO+jYgGDqJ+euBpvKEQ6TyscBA2p6XFY6QQumVoMlPo3YYUtl5pD/Ld9EYXQ==
Date: Tue, 03 Mar 2026 17:29:25 +0100
Subject: [PATCH RFC 4/7] mtd: spinand: toshiba: Add RX sampling delay
 values
MIME-Version: 1.0
Message-Id: <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
To: Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Han Xu <han.xu@nxp.com>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, imx@lists.linux.dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=8132;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=YS9m+8/VwL0xEzMaavaBPStGEta14s9GR3DcIa/S2T4=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIXM5T9NcLc6rK749PvtjZb989Iwvn8Qi3Is/T3yWyniqQ
 qiYR0Wto5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCJxNYwMJ9dMmLr/6m49VjXb
 h5senFN68zVswfXjGXPeuhU53zzq38TwP/fnogvK9kcnRx5w1RARLT3k/5WzVu3nmuDLvInmjm+
 u8wEA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_163003_859710_747A7C29 
X-CRM114-Status: UNSURE (   7.04  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Add tCLQV (Clock Low to Output Valid) parameter from datasheets
for Toshiba/Kioxia SPI NAND chips. This allows to let the drivers
properly handle high sampling delays at high clock speeds.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/toshiba.c | 48 +++++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/spi/toshiba.c b/drivers/mtd/nand/spi/toshiba.c
index ef649162ee680..7679f3acbae07 100644
--- a/drivers/mtd/nand/spi/toshiba.c
+++ b/drivers/mtd/nand/spi/toshiba.c
@@ -118,7 +118,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 3.3V 2Gb (1st generation) */
 	SPINAND_INFO("TC58CVG1S3HRAIG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xCB),
@@ -129,7 +130,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(8)),
 	/* 3.3V 4Gb (1st generation) */
 	SPINAND_INFO("TC58CVG2S0HRAIG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xCD),
@@ -140,7 +142,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(8)),
 	/* 1.8V 1Gb (1st generation) */
 	SPINAND_INFO("TC58CYG0S3HRAIG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xB2),
@@ -151,7 +154,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(8)),
 	/* 1.8V 2Gb (1st generation) */
 	SPINAND_INFO("TC58CYG1S3HRAIG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xBB),
@@ -162,7 +166,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(8)),
 	/* 1.8V 4Gb (1st generation) */
 	SPINAND_INFO("TC58CYG2S0HRAIG",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xBD),
@@ -173,7 +178,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(8)),
 
 	/*
 	 * 2nd generation serial nand has HOLD_D which is equivalent to
@@ -189,7 +195,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 3.3V 2Gb (2nd generation) */
 	SPINAND_INFO("TC58CVG1S3HRAIJ",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xEB),
@@ -200,7 +207,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 3.3V 4Gb (2nd generation) */
 	SPINAND_INFO("TC58CVG2S0HRAIJ",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xED),
@@ -211,7 +219,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 3.3V 8Gb (2nd generation) */
 	SPINAND_INFO("TH58CVG3S0HRAIJ",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
@@ -222,7 +231,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 1.8V 1Gb (2nd generation) */
 	SPINAND_INFO("TC58CYG0S3HRAIJ",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xD2),
@@ -233,7 +243,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 1.8V 2Gb (2nd generation) */
 	SPINAND_INFO("TC58CYG1S3HRAIJ",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xDB),
@@ -244,7 +255,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 1.8V 4Gb (2nd generation) */
 	SPINAND_INFO("TC58CYG2S0HRAIJ",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xDD),
@@ -255,7 +267,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 1.8V 8Gb (2nd generation) */
 	SPINAND_INFO("TH58CYG3S0HRAIJ",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xD4),
@@ -266,7 +279,8 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 1.8V 1Gb (1st generation) */
 	SPINAND_INFO("TC58NYG0S3HBAI4",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA1),
@@ -277,7 +291,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
 	/* 1.8V 4Gb (1st generation) */
 	SPINAND_INFO("TH58NYG2S3HBAI4",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xAC),
@@ -288,7 +302,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
 	/* 1.8V 8Gb (1st generation) */
 	SPINAND_INFO("TH58NYG3S0HBAI6",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA3),
@@ -299,7 +313,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
 					      &update_cache_x4_variants),
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
-				     tx58cxgxsxraix_ecc_get_status)),
+				     tx58cxgxsxraix_ecc_get_status),
 };
 
 static const struct spinand_manufacturer_ops toshiba_spinand_manuf_ops = {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
