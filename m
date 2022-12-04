Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED4DC4332F
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Dec 2022 08:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ypVYOG1JiyrRYu0+ijd8zKwXuX1VRy7ldDJQ9XEPfoc=; b=I+50MAJrU0Ny8U
	YbuoSndzwKEGV/1NWotTuFOrxqwta5cBIWqe0wKFOpK1MPc0DRTafNCRU4bpg0gxy9yPw4vla2TEz
	e+BnxN0oWMMh6y8hwd+yC4wp89LYgr7Xr7q39WLD2xThG2mUiWTiH6+d2NiCOW1iElsWihXOKxtsp
	++s7Aq4UQrig3BGF8j7Vxw6HGb+tRHMmGqo165OcW2Z63Z/5l9pI4vpsgPr/tpJfCZj5OZEI4b4Ft
	ik7+55jdahWoYjOe2uqE3CV9hVO4CZjue4Y4HGBBznLI719NcrHwmUhYayv2DoGdaSG/v+NvoYERN
	yRbo+duR7tvFhO+wnqfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1jvE-006ypj-UD; Sun, 04 Dec 2022 08:00:24 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1jvA-006yoA-GZ
	for linux-mtd@lists.infradead.org; Sun, 04 Dec 2022 08:00:22 +0000
Received: by mail-pj1-x102f.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so766973pjj.4
        for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2022 00:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mDpA1aUK9kbTnFQ/vn/18tjfvP/j6YXDuTY3DifM3hY=;
        b=gEEF5UGgGY4Nko5Y+OnMn0UGTewfNKRBZCIV6q5i0OTTXoOueE396Ddk0L0nAW2U6e
         c9Vj5lAc3tmKuRr2mmdzFZel6qg/xiVttjhCVIbAWu5BY9+7pPCrUoCcl0awjbuTyKXq
         vFzaOIoQuUhYFVYeqdssVvwXwWlmRzudxTz46ucxB/SP3kXCNdejspY/rShiVzd8HaNQ
         25eO4hOQYISd2TX0IsopOl1na0pvUo+5g2s3pAAjPKkQbgkhqA7n+OWucxbNobss0mUK
         U0bGYnKyIAnew7oRtvrc8amd7zzf8pjqBB1F0fR7HXpsJc/UPI/6rQJkQnXW9wzdgRXe
         2m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDpA1aUK9kbTnFQ/vn/18tjfvP/j6YXDuTY3DifM3hY=;
        b=7ViBV+kGNFFJMMQSrFw+smHnUtQbUhE1+3kw5uwceMZK6S/TcSoN9ore0d3LoqTRfh
         zzLIumdGwDC+RMhRirSEy2jqjwE92Ogn0U0/2h3PsZnAcNzWBhZrfBaOptbKB7XhUvOm
         ONqj5uo7307ZNznVVS7vvxk1WmF6UjhHuQ2IOMFGliGjo9YJgosrHdKDpbvKCwZGImZt
         LO5Qcxwp+Roj/4iiVwy1qbXgvjO7/GNdKslzyIB9TLyVWukWXeiWBI53H+AWBCx3EhYh
         QQ177oP2jnfAVZcDd4VpmKvuDUf1/wh6F9g/E9ywH38tvUM5NN/9rB/TEKPkpdTaQO/H
         orQQ==
X-Gm-Message-State: ANoB5pnESM6Y6TCnmSKfbc83oQ0rm7eCxVlwP3MY+bzkNNdbHU/PGnTq
	GgLKIlU456kWbG7XZgfmtXM=
X-Google-Smtp-Source: AA0mqf61HVUWtek+HYPjD3D8kWucWKMejIDRUyHiYMx9w+jvvcimUqC/sBXmNFw0wySzG7rppRTwcg==
X-Received: by 2002:a17:90a:ea04:b0:219:9da1:6088 with SMTP id w4-20020a17090aea0400b002199da16088mr7919367pjy.64.1670140818597;
        Sun, 04 Dec 2022 00:00:18 -0800 (PST)
Received: from victor-17Z990-R-AAC9U1.attlocal.net ([172.58.27.227])
        by smtp.gmail.com with ESMTPSA id k9-20020a63ff09000000b0044046aec036sm6448189pgi.81.2022.12.04.00.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 00:00:18 -0800 (PST)
From: Victor Lim <victorswlim@gmail.com>
X-Google-Original-From: Victor Lim <vlim@gigadevice.com>
To: tudor.ambarus@microchip.com,
	michael@walle.cc,
	p.yadav@ti.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vikhyat.goyal@amd.com,
	amit.kumar-mahapatra@amd.com,
	alejandro.carmona@amd.com
Cc: Victor Lim <vlim@gigadevice.com>
Subject: [PATCH] Linux: SPI: add Gigadevice part #
Date: Sun,  4 Dec 2022 16:00:00 +0800
Message-Id: <20221204080000.4100-1-vlim@gigadevice.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_000020_585765_9101DE8C 
X-CRM114-Status: UNSURE (   9.59  )
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

Edited gigadevice.c

Signed-off-by: Victor Lim <vlim@gigadevice.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 115 ++++++++++++++++++++++++-------
 1 file changed, 91 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 66c2e75023fc..9309e57407e6 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -154,38 +154,105 @@ static struct spi_nor_fixups gd25q256_fixups = {
 };
 
 static const struct flash_info gigadevice_parts[] = {
-	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25lq32", INFO(0xc86016, 0, 64 * 1024, 64,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128,
-			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25lq128d", INFO(0xc86018, 0, 64 * 1024, 256,
-			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256,
-			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
-	{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
+/* GigaDevice - GD25Q or B series  */
+	{"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |	SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)},
+	{"gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |	SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)},
+	{"gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |	SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)},
+	{"gd25q128", INFO(0xc84018, 0, 64 * 1024, 256,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ	|	SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)},
+		{ "gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
 			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			   SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
 			   SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
-		.fixups = &gd25q256_fixups },
+	.fixups = &gd25q256_fixups },
+	{"gd25b series 512Mbit", INFO(0xc8471A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55b series 1Gbit", INFO(0xc8471B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55b series 2Gbit", INFO(0xc8471C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+/* GigaDevice - GD25F series */
+	{"gd25f series 64Mbit", INFO(0xc84317, 0, 64 * 1024, 128,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25f series 128Mbit", INFO(0xc84318, 0, 64 * 1024, 256,	SECT_4K	|
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25f series 256Mbit", INFO(0xc84319, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55f series 512Mbit", INFO(0xc8431A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+/* GigaDevice - GD25T series */
+	{"gd25t series 512Mbit", INFO(0xc8461A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55t series 1Gbit", INFO(0xc8461B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55t02ge", INFO(0xc8461C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+/* GigaDevice - GD25X series */
+	{"gd25x series 512Mbit", INFO(0xc8481A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd55x series 1Gbit", INFO(0xc8481B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd55x series 2Gbit", INFO(0xc8481C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+/* GigaDevice - GD25LB series */
+	{"gd25lb series 16Mbit", INFO(0xc86015, 0, 64 * 1024, 32,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25lb series 32Mbit", INFO(0xc86016, 0, 64 * 1024, 64,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lb series 64Mbit", INFO(0xc86017, 0, 64 * 1024, 128,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lb series 128Mbit", INFO(0xc86018, 0, 64 * 1024, 256,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25lb series 256Mbit", INFO(0xc86019, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lb series 256Mbit", INFO(0xc86719, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lb series 512Mbit", INFO(0xc8671A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55lb series 1Gbit", INFO(0xc8671B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55lb series 2Gbit", INFO(0xc8671C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+/* GigaDevice - GD25LF series */
+	{"gd25lf series 8Mbit", INFO(0xc86314, 0, 64 * 1024, 16,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25lf series 16Mbit", INFO(0xc86315, 0, 64 * 1024, 32,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)},
+	{"gd25lf series 32Mbit", INFO(0xc86316, 0, 64 * 1024, 64,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lf series 64Mbit", INFO(0xc86317, 0, 64 * 1024, 128,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lf series 128Mbit", INFO(0xc86318, 0, 64 * 1024, 256,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK)	},
+	{"gd25lf series 256Mbit", INFO(0xc86319, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lf series 512Mbit", INFO(0xc8631A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+/* GigaDevice - GD25LT series */
+	{"gd25lt256e", INFO(0xc86619, 0, 64 * 1024, 512,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd25lt512me", INFO(0xc8661A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55lt01ge", INFO(0xc8661B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+	{"gd55lt02ge", INFO(0xc8661C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},
+/* GigaDevice - GD25LX series */
 	{ "gd25lx256e",  INFO(0xc86819, 0, 64 * 1024, 512,
 			      SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
 			      SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
 			      SPI_NOR_OCTAL_DTR_PP |
 			      SPI_NOR_IO_MODE_EN_VOLATILE)
-		.fixups = &gd25lx256e_fixups },
+			      .fixups = &gd25lx256e_fixups },
+	{"gd25lx series 512Mbit", INFO(0xc8681A, 0, 64 * 1024, 1024,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd55lx series 1Gbit", INFO(0xc8681B, 0, 64 * 1024, 2048,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
+	{"gd55lx series 2Gbit", INFO(0xc8681C, 0, 64 * 1024, 4096,	SECT_4K |
+	SPI_NOR_OCTAL_READ | SPI_NOR_4B_OPCODES)},
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
