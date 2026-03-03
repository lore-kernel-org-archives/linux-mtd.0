Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59519EDA698
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+hAbpm80XIEFLMBV5h1csEvmh/ArSBo+kb20IuRE8Ww=; b=ITu4K9eXlPs1XD
	FlLeRMQZdRPKToyYGucaoYvDDWND70xhRO+XSRL6r7+xJnDHna79JR5qef/Fl3OsiUu+iS2bBHigu
	VPax7oUxM1jWxPtv65tXtfM2t784KQc/Cxq8kJRDPDHUdMq7xxLbUvCbaO0r5i+ohDgnr3ouQJsAy
	tF+vrCTxCfYUuzoOQeeAkMFEQ7Lgpip971SdZOtATyjy+ljkhooqAGP340zZPBTPqcR2bfM4CQJjy
	DnVtgfqkVwa7QlUOX/Zz+Kir12Qf3GrAiZogbUq/exohyR9PxHAIX4AtgmN1Eb6/xNNrXzGa4ZtTb
	AdBBZiLaTVhow7seiXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSkF-0000000FafH-0I1H;
	Tue, 03 Mar 2026 16:37:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSkD-0000000Faeg-3Nku
	for linux-mtd@bombadil.infradead.org;
	Tue, 03 Mar 2026 16:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2+skttbdyrA8Trf6AOYgOJnf/VuyEM70c9jGuM4BuX0=; b=H1uFHC4w4opvvdNsIEG+0hrit5
	XGyqGFyL062+ksxax/zNyRPeyOeJWs7L7//T4TGpEtaPN8vmfjKgEkLIypww1MAd+Gtqeg/fHwU7f
	5ufILBex4W5p+2zTK8ZSRfJrZIuDZhZROmiesIDm9IqycyFPl+40NAzNAptgN14+vpnMJHTTDcqkY
	w0UMd4JZF0IXezhltC3h+11oO0fQ4zzx6+5uyN8g9tYOGCDbv5vR/neOR0J0vo1BLoXC+9zbFgLl8
	hneSGdoTcvoB2xXDTlzMDOTf1OI6TwSnvPSUNQioI1NRiEqStFwKfq4ijQy44XIk/Mh1r6I8v55ef
	rF2CMNQA==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSkA-00000002uzI-3EeJ
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:37:12 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1772555397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2+skttbdyrA8Trf6AOYgOJnf/VuyEM70c9jGuM4BuX0=;
	b=GtRhefMyG/e2ydTOzhaZXw17Gur7lx/Fkm3pW3bz8MjGnlbMC7hACU2+3bysb15phxT/9p
	Azdb25sbCcYaVt+IurGic7rF7Z+ZO+jNEDmq4QVIssHtCiGhUW7PLvRLf6Q4CZfshVbNeP
	VEEbwm9kkatEU5/4PBow1jXnC3xxbrutzJeiRTDjqRCCS/bgdsls/iTyGGM2Sks74e275K
	NFB691brGGJHNkhPFN60eze4tixdZPcbR84wBVbWU8W5o/hZ65sneHg54NAmWXZlJkzeso
	zyJuTrfEMBkv5uaSypDL9EV8B+wq5B5fGIA4M1ImhUaInH3J4+ZHe1tZWs7Z5Q==
Date: Tue, 03 Mar 2026 17:29:24 +0100
Subject: [PATCH RFC 3/7] mtd: spinand: winbond: Add RX sampling delay
 values
MIME-Version: 1.0
Message-Id: <20260303-fsl-qspi-rx-sampling-delay-v1-3-9326bbc492d6@kontron.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7571;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=1iBTtmlkMnqLSBaVo3JQ8I4m6OqPWy8zqvU+a/8yVOk=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIXM5T9NjlS+XJllv2L+kKMag/btF7VrLZTVzm9xzjx15k
 HZmXtyHjlIWBjEuBlkxRRYpfovXtmaxPvLHqqNg5rAygQxh4OIUgIk0JzEyHMnoWfN0gefloDMP
 teLMZKd5qH+qcpSS6xFn4gs/tLbWipHhhYD/Hnd/GYkqzeTDLZyzl6yZeSEpqyxR44e8rbV+YCY
 /AA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_163710_996844_70CC4648 
X-CRM114-Status: UNSURE (   8.43  )
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

From: Eberhard Stoll <eberhard.stoll@kontron.de>

Add tCLQV (Clock Low to Output Valid) parameter from datasheets
for Winbond SPI NAND chips. This allows to let the drivers
properly handle high sampling delays at high clock speeds.

Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/nand/spi/winbond.c | 42 ++++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6dfd0dcc8ee7a..ec223e6d695a7 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -458,7 +458,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 1G-bit densities */
 	SPINAND_INFO("W25N01GV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x21),
@@ -468,7 +469,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
+		     SPINAND_RX_SAMPLING_DELAY(7)),
 	SPINAND_INFO("W25N01GW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -477,7 +479,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
+		     SPINAND_RX_SAMPLING_DELAY(8)),
 	SPINAND_INFO("W25N01JW", /* high-speed 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbc, 0x21),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
@@ -487,7 +490,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg)),
+		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	SPINAND_INFO("W25N01KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae, 0x21),
 		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
@@ -496,7 +500,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n01kv_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(7)),
 	SPINAND_INFO("W35N01JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdc, 0x21),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 1, 1),
@@ -507,7 +512,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     0,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
+		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	SPINAND_INFO("W35N02JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x22),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 2, 1),
@@ -518,7 +524,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     0,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
+		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	SPINAND_INFO("W35N04JW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xdf, 0x23),
 		     NAND_MEMORG(1, 4096, 128, 64, 512, 10, 1, 4, 1),
@@ -529,7 +536,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     0,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg)),
+		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
+		     SPINAND_RX_SAMPLING_DELAY(6)),
 	/* 2G-bit densities */
 	SPINAND_INFO("W25M02GV", /* 2x1G-bit 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xab, 0x21),
@@ -541,7 +549,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 		     0,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w25_ops),
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
-		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
+		     SPINAND_SELECT_TARGET(w25m02gv_select_target),
+		     SPINAND_RX_SAMPLING_DELAY(7)),
 	SPINAND_INFO("W25N02JW", /* high-speed 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xbf, 0x22),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 2, 1),
@@ -551,7 +560,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
-		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg)),
+		     SPINAND_CONFIGURE_CHIP(w25n0xjw_hs_cfg),
+		     SPINAND_RX_SAMPLING_DELAY(7)),
 	SPINAND_INFO("W25N02KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -560,7 +570,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(7)),
 	SPINAND_INFO("W25N02KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
@@ -569,7 +580,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(8)),
 	/* 4G-bit densities */
 	SPINAND_INFO("W25N04KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xaa, 0x23),
@@ -579,7 +591,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(7)),
 	SPINAND_INFO("W25N04KW", /* 1.8V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x23),
 		     NAND_MEMORG(1, 2048, 128, 64, 4096, 40, 1, 1, 1),
@@ -588,7 +601,8 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status),
+		     SPINAND_RX_SAMPLING_DELAY(8)),
 };
 
 static int winbond_spinand_init(struct spinand_device *spinand)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
