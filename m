Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86105C282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 18:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7WYcSDEccX1LUOX9Wv85Rd2+6YR+rHD/TKMlIxvcLNE=; b=GO0KEzUVPJlHQ/
	WiaCG4lzGoi4UcRR5Sqaon+cO9TO6vtiAgIMyBMq7HnekUq2dMS/VXDU1UTifVt/040AYoJY+rQRX
	v9Oz8FxNGmadJ/UAmioxZtCKy5QsjcBCjnlBqXkbdSImeNrg+Q3iF/k6Zdg9NNG+edLNwFHQGrBcK
	jXpTfqyjWMmUcHHty4+7MZvYFjn/ae+YO5MCt+azg1W3ODKUsAFnvW4o+C6ZBzqwXn/kByASod0zk
	cIEA6v2AJbB9U8u1gcz4amhqc9tlCUk9c06JfyfpliCvaJUoCeZ7jkRoba14Vbb6brQhMDYLOqpqe
	WVa1jZD/s55TbWBSNEvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF4a-00000003feC-2AJn;
	Mon, 17 Mar 2025 18:20:24 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF4Y-00000003fdi-34R8
	for linux-mtd@lists.infradead.org;
	Mon, 17 Mar 2025 18:20:23 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-ac29ae0b2fbso477501666b.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 11:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742235620; x=1742840420; darn=lists.infradead.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/7NZ7peIlm0yG+Cn7UyH1yowKXkfRqsYGiOXYDLW9yw=;
        b=MtJWl656ohbsYGlS43lY3BhmPLf5XOpayWpFdKbOGJI5N5gVA8nRpzxxPcZcWwm403
         eFB/Z1ZZBRp9JyAFN7vsskZeYTXGlgQBEfQyPK6P6D+xMq8NrKLw64j20wVbyVWHIxMR
         lUvV9PkH1DR5roGdtrhcfh9ekO9aRZJB2QdVEZ858/C8e20w9jmWqoYplxiF4Hs5PM6u
         ljSzlfSRC0MF3mAhqN5wOGLSF2MkD5+69d3CempsV0LI1wmSf7SqGg2Ic9kS+yNrECT9
         DQMlGmwANxaqINuMTJZBQxTRBQtb5G0S+aT0WUTVNlHApwjSn6DwzyeczUTK6e5skpsk
         z/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235620; x=1742840420;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/7NZ7peIlm0yG+Cn7UyH1yowKXkfRqsYGiOXYDLW9yw=;
        b=va93R0588FPJef36GK94jF7kMyLWd5UKh5+iRv5Ho37JzoBy04O+kJSCbFiWUAOf4Q
         TgHxdx7Kj2DnrVNcEIfs3SsuJK44YW1Ei1oijoiy/ywk0onsRpgwZPIDG/dTAwxD9g7/
         m7DE2Xpd3ExH5V7o10JanhnZcC382xnfIt6ohFtmbSv3zz+SZtORcXBSoNJQu52YLpgc
         aW7ZkixXAAcBhJ6quUcTOUf1xL5VinMdh2J9aOzYctNpMymbvbv/R7aOidZCRVik4xfQ
         1ZOlHuQ15tnoB4w+7mztnPR1J6w/mMRN2/77ukCvb3O2HW7sBhwRZk1nW8dXSsQUMTMg
         VORQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe29+dS77w6Hqgn1vgnC61ZpwbPTwgp1gap+ZEM+dbxl/dAnhJnBM+PngGxiZdJBCJjzq0zc3IYNs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa08i8nCqwStrV+FpG+ZoqmdqdQdcjY5D9UMw1ln+9AchJGxjd
	+LEYMcvN4bXvz7wLQt4IuqHjBBagyZkC6aZWRRfUWmBvoKKn6scwMf9VGdTlbD58RUFnHNSyQFW
	F4WX9og==
X-Google-Smtp-Source: AGHT+IE84F2eM4gDbNKOPL/wvEHNq3+GiqxIQtJuObp+x01KaqbBtyapAgs6XaomjtlNda8x+qKPNMx0IHSC
X-Received: from ejpl10.prod.google.com ([2002:a17:906:7d4a:b0:ac1:fe6f:8a88])
 (user=czapiga job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:368a:b0:ac1:f162:fb0d
 with SMTP id a640c23a62f3a-ac38d514eebmr71247366b.37.1742235620357; Mon, 17
 Mar 2025 11:20:20 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:18:51 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250317181856.2059536-1-czapiga@google.com>
Subject: [PATCH] mtd: spi-nor: eon: fix lock and non-SFDP flags
From: Jakub Czapiga <czapiga@google.com>
Cc: Jakub Czapiga <czapiga@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_112022_771882_D1B26C93 
X-CRM114-Status: UNSURE (   9.44  )
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

Set appropriate FLASH lock feature flags for chips that support it.
Set top-bottom protection bit flag for chips that support it.
Add no-SFDP flags for chips with missing SFDP or without clear
SFDP description regarding 4K sectors, dual and quad read support.
Remove no-SFDP flags for chips which documentation states that this
information can be extracted from SFDP.

Modified chips:
- EN25Q32 (+lock)
- EN25Q64 (+lock)
- EN25Q32B (+lock, +tb, +4k, +dual, +quad)
- EN25Q64 (+lock, +tb, +dual, +quad)
- EN25F32 (+lock, +tb)
- EN25S64 (+lock, +tb, +4k, +dual, +quad)
- EN25QH16 (+lock, +tb, -4k, -dual)
- EN25QH32 (+lock, +tb)
- EN25QH64 (+lock, +tb, -4k, -dual)
- EN25QH128 (+lock, +tb)
- EN25QH256 (+lock, +tb)

Signed-off-by: Jakub Czapiga <czapiga@google.com>
---
 drivers/mtd/spi-nor/eon.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
index c1ddf662f782..10ed06022a76 100644
--- a/drivers/mtd/spi-nor/eon.c
+++ b/drivers/mtd/spi-nor/eon.c
@@ -13,10 +13,12 @@ static const struct flash_info eon_nor_parts[] = {
 		.id = SNOR_ID(0x1c, 0x20, 0x16),
 		.name = "en25p32",
 		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK,
 	}, {
 		.id = SNOR_ID(0x1c, 0x20, 0x17),
 		.name = "en25p64",
 		.size = SZ_8M,
+		.flags = SPI_NOR_HAS_LOCK,
 	}, {
 		.id = SNOR_ID(0x1c, 0x30, 0x14),
 		.name = "en25q80a",
@@ -26,42 +28,51 @@ static const struct flash_info eon_nor_parts[] = {
 		.id = SNOR_ID(0x1c, 0x30, 0x16),
 		.name = "en25q32b",
 		.size = SZ_4M,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		.id = SNOR_ID(0x1c, 0x30, 0x17),
 		.name = "en25q64",
 		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		.id = SNOR_ID(0x1c, 0x31, 0x16),
 		.name = "en25f32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		.name = "en25s64",
 		.id = SNOR_ID(0x1c, 0x38, 0x17),
 		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x15),
 		.name = "en25qh16",
 		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x16),
 		.name = "en25qh32",
 		.size = SZ_4M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x17),
 		.name = "en25qh64",
 		.size = SZ_8M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x18),
 		.name = "en25qh128",
 		.size = SZ_16M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		.id = SNOR_ID(0x1c, 0x70, 0x19),
 		.name = "en25qh256",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	},
 };
 
-- 
2.49.0.rc1.451.g8f38331e32-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
