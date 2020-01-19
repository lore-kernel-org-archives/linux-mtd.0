Return-Path: <SRS0=Efe6=3I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279DAC33CB1
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 14:57:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC807206D7
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 14:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qGcPNNzJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpeZZ6L5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC807206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fghWQslrd6YbMMBr4GygVzOjYV1xcc/X4zIakTJ2dd4=; b=qGcPNNzJDf7gCr7RoMKgVpX5IE
	I6Pyk9Jg1CErk65BIQpOUgrF7TjWngrf1nFswpOZXNR1B3NjzE9DnLVSHFrpvAfilhQw70dS5A01C
	XLpntzV4Wg6OwKYzVx2J2O4AChBp8tgqLuk/I1oX5T0CjHCn4xhQDMYn0BWiNG/QGx/a4z+KFVPo9
	RFxwTZ15qtw1TNX6J/ca1/hkvnBfpqM73PPwvMGpnfudya4uY1jiwCvC1iCg6S5LGeV/o4MWDuM82
	t16scPD2lH6/mX+1ilou+Vtp7/jX0tvcbfYRhjb8z5trHu/6xgOSVJ87xL4YACxwtVj3iVFa6t41T
	5LUm/s0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itC1H-00022r-Bx; Sun, 19 Jan 2020 14:57:43 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itC0b-0001GQ-MR
 for linux-mtd@lists.infradead.org; Sun, 19 Jan 2020 14:57:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id w5so12940426wmi.1
 for <linux-mtd@lists.infradead.org>; Sun, 19 Jan 2020 06:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9CMukmm383ZbRg41KDwagKi6+XBBa8RTph8WtX5WX4U=;
 b=jpeZZ6L5e/I8FoMqQz4hyNtTSq4qBK5DDib3wtqclp6SN9gu+2vD2X69Hqqf7f2QsF
 AScwKQo78kBRx/coXiW+Bjpb+mW617Ca2zrqgPC/E7Zfzyng/i2XgDjNvcr8fG6ge3bY
 f9k5peccBCksty4y/8shMPHz7lecCCjjdO2qI+UP0by9fcMC6+9GKwUrRPmCPEMyq3UE
 dvMEwXJpIJN2ZZRn1hDAaStm3ToC9goUnVxpswKfbCeAmI6xnoQuY8S3iKfS1RYEaD07
 fCbrx9hiAloZH0Hxi6alGcKJCM6Zp9M6zscleNolR3WGuD318svg2YbwL8xxlYkaa09V
 YGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9CMukmm383ZbRg41KDwagKi6+XBBa8RTph8WtX5WX4U=;
 b=Si7S6fB1B8PFZuM+nBKSn7PoJVOlA3uDgZFYBvLT2d1QCpxpFx7fN68KsRtUq5SBAo
 4dCyvAioOrRgMdYnlMyy56WUs5ZYdiYenWNpKk5pKR6VaN2gxucbIP6cvW0WUdl/tQmd
 DhgO1HioWJK+ehXX1FQrndjMpzcdAMtbVwXwF0Dz3ffHTzgumkEPaU31gpgGDlplA26n
 peT89V446SDAoo6lrlSXPRR41tg0bDjJmOsZuokG+JSCKwZTypj2u8U3W/t0tvSxoQke
 0Hwbe0LO3fzuER8s34VE6z+aW5fmoedfkUI3woFh+ND2s49fIj5thGfAS4axPnVyCWko
 ZQng==
X-Gm-Message-State: APjAAAWWIRQ7kt0Rjz39QvDYPBRPzTMDlLXsg1RaUUQdziroNC6bG9SL
 rl7SG2qKJIG58ZYoWZnOipM=
X-Google-Smtp-Source: APXvYqxJDn2VK4pNd82pnezUbcecnBMOI1AfXgTJS7x92jCDab+m0tAoZ6nJieP/AGcG+DbbV3AHEA==
X-Received: by 2002:a1c:9e15:: with SMTP id h21mr14834897wme.95.1579445820059; 
 Sun, 19 Jan 2020 06:57:00 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id p17sm43347877wrx.20.2020.01.19.06.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 06:56:59 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] mtd: spinand: Add new Micron SPI NAND devices with
 multiple dies
Date: Sun, 19 Jan 2020 15:54:32 +0100
Message-Id: <20200119145432.10405-5-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119145432.10405-1-sshivamurthy@micron.com>
References: <20200119145432.10405-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_065701_805181_0EE68434 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Add device table for new Micron SPI NAND devices, which have multiple
dies. While at it, add support to select the die.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/micron.c | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index 45fc37c58f8a..03b486843210 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -18,6 +18,8 @@
 #define MICRON_STATUS_ECC_4TO6_BITFLIPS	(3 << 4)
 #define MICRON_STATUS_ECC_7TO8_BITFLIPS	(5 << 4)
 
+#define MICRON_DIE_SELECTION_BIT	6
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_QUADIO_OP(0, 2, NULL, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
@@ -64,6 +66,21 @@ static const struct mtd_ooblayout_ops micron_8_ooblayout = {
 	.free = micron_8_ooblayout_free,
 };
 
+static int micron_select_target(struct spinand_device *spinand,
+				unsigned int target)
+{
+	struct spi_mem_op op = SPINAND_SET_FEATURE_OP(0xd0,
+						      spinand->scratchbuf);
+
+	/*
+	 * As per datasheet, die selection is done by the 6th bit of Die
+	 * Select Register (Address 0xD0).
+	 */
+	*spinand->scratchbuf = target << MICRON_DIE_SELECTION_BIT;
+
+	return spi_mem_exec_op(spinand->spimem, &op);
+}
+
 static int micron_8_ecc_get_status(struct spinand_device *spinand,
 				   u8 status)
 {
@@ -131,6 +148,17 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M79A 4Gb 3.3V */
+	SPINAND_INFO("MT29F4G01ADAGD", 0x36,
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 80, 2, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(micron_select_target)),
 	/* M70A 4Gb 3.3V */
 	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
 		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
@@ -151,6 +179,28 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M70A 8Gb 3.3V */
+	SPINAND_INFO("MT29F8G01ADAFD", 0x46,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(micron_select_target)),
+	/* M70A 8Gb 1.8V */
+	SPINAND_INFO("MT29F8G01ADBFD", 0x47,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(micron_select_target)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
