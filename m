Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F7AC282EC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Mar 2025 18:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CJa9Zun3XKCCaho8cEW0VwZDp15gGGi40vrFVocCOX8=; b=iqNj0hdcYa6Cu0
	FsZ2DOiC7OUE9AYY5k+pIkO4IpH6IrNfRhyAtz8ACw+xKQWGls1uXy4vt+1j2scywSTn3QrVr5tEy
	Y6BpQ+5VhsPDm7o+Kr6yW2MQa2gSqHcvN+a/wtebmGI4yUwKMIs5QemiIHc1avhHBfhdSgOsOSvTC
	ypnZbzfPrfmRPSjGvtfsVpUGDooC6Bnd+LUlCyLbVnXwBv9NFeC1HkPBLKAAfneHW+5WNf2Un+qXg
	Tkl4/Y1hlodKEdaPhgV8+IzJE7d/l3eMvEms1LKQ5jld6wtUj/fonS4FbPjuZESQBIJ4RGnIhxx7x
	NzcQwH0cUGC8JMbdKLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF5K-00000003ft4-2tAO;
	Mon, 17 Mar 2025 18:21:10 +0000
Received: from mail-ej1-f73.google.com ([209.85.218.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuF5I-00000003fqN-3V6U
	for linux-mtd@lists.infradead.org;
	Mon, 17 Mar 2025 18:21:09 +0000
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ac297c79dabso467826066b.0
        for <linux-mtd@lists.infradead.org>; Mon, 17 Mar 2025 11:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742235666; x=1742840466; darn=lists.infradead.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aEJdtqNjODGZ3ZX8sSDy8Zo80L0HCxWOwxmMOMmUXvM=;
        b=kIPt0guO97quwqNZFdZON+JCuK7jDwUtXiC7ip/jeQVweKV29aAtZRF8+OcVwnCkNj
         v3gMj0Bb0P5TgLbUZYtUN4i24gzhn0KRB2bD1WoOQ4Hz5m/K5ebZrM3AQoILEXr6+gS2
         dUWslOCOD52K65BKv1A6+ThtFMUGOnc5EqV3x0pKYkuXo5mIgWaTpC4DEk0yh4wyflXE
         sloMm44/rzojbJtgzzZh2lg0cqdLFnDCbK1qWoKFcMkIhh7xTEt9FVlhqE/MPQjLYNd4
         Iq1/TEGQgS9TtTQlJiHR4xY3h6bPjzXGMLnpLqRURR+OQGPnEfRrOQM9ppsaTYNg9Itv
         v+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742235666; x=1742840466;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aEJdtqNjODGZ3ZX8sSDy8Zo80L0HCxWOwxmMOMmUXvM=;
        b=C5E+K6rx+L7Vw8oE5HXOS13I5SOjkOz9DxTfzmlVqYzVmCf28xlv34DkshwyjYaYgm
         ckRh1Yj9VNrEXluF571uf/ocjpwvS5iceYlZPLyC0wodNNgyzUzv/QSN8BZfA1OYQSYy
         4evapqKEK3EUOLkkS1SMLxCvuG23+x0fC0fnB2ji9Hz8yOTkQK3wpIxE3Q8Q8yvZ5YMC
         6OyIg063tiaULA4Lq4CHF3gSMdWCGBXyLIW7MCknTa0l4IGI6S5/W2TrTVF7HSWKykRM
         x1xW6DHJ8QBduX1hrwbn5sMhx+l2ytfPNKFu9mupa78VbKDqCQWYiPz/g2HNJ/r9MrL/
         v1MA==
X-Forwarded-Encrypted: i=1; AJvYcCV9RPSEL7iEG8yXjyLGolLC/pbD7UaBU9X7XrFa7Y8bGaB+NRcR7kSHOQOPdGcd5HJzkZ40OI6D9d8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEBLkXrQclUkZu7k83F2aVsBA7ms5+tp9IshgCzPkikchh5Eo2
	gkOLYDOEc0tNT/GkM9sFF/XkrCprMlOmNIILGJ19VWlBIQEhAfRTSrctV3JSFxc/DR4e1zkKi8A
	rFkZvKg==
X-Google-Smtp-Source: AGHT+IG62DU4FaPgOOjSsVcgGi6Fs8/7pGDekBp9Bu2Wa+gKLvgqybFgjFcRqZMrNlNjOBn0Ix90T12g2Uni
X-Received: from edsq20.prod.google.com ([2002:aa7:da94:0:b0:5d8:476d:1082])
 (user=czapiga job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:e88c:b0:ac3:8794:21c9
 with SMTP id a640c23a62f3a-ac3879427camr170140766b.21.1742235666136; Mon, 17
 Mar 2025 11:21:06 -0700 (PDT)
Date: Mon, 17 Mar 2025 18:21:01 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250317182103.2060524-1-czapiga@google.com>
Subject: [PATCH] mtd: spi-nor: winbond: fix W25Q256 and W25Q512 chips configuration
From: Jakub Czapiga <czapiga@google.com>
Cc: Jakub Czapiga <czapiga@google.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_112108_879511_7146AC56 
X-CRM114-Status: GOOD (  10.20  )
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

Fill and fix configuration of Winbond chips:
- W25Q512JVQ (+lock, +tb)
- W25Q256JW (+lock, +tb)
- W25Q256JVM (+lock, +tb, +4k, +dual, +quad)
- W25Q512JWM (+lock, +tb)

Top-Bottom selection bit is SR(6). All mentioned chips have 4-bit long
Block-Protection field.

Signed-off-by: Jakub Czapiga <czapiga@google.com>
---
 drivers/mtd/spi-nor/winbond.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8d0a00d69e12..8ebb1461a4e9 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -145,6 +145,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x40, 0x20),
 		.name = "w25q512jvq",
 		.size = SZ_64M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),
@@ -190,6 +191,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x60, 0x19),
 		.name = "w25q256jw",
 		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x60, 0x20),
@@ -221,6 +223,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
+		.size = SZ_32M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x71, 0x19),
 		.name = "w25m512jv",
@@ -249,7 +254,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x80, 0x19),
 		.name = "w25q256jwm",
 		.size = SZ_32M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
 		.id = SNOR_ID(0xef, 0x80, 0x20),
-- 
2.49.0.rc1.451.g8f38331e32-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
