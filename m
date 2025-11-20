Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978FCCFA446
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Nov 2025 21:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2yS/ZMxPIcHJukPq9+wMcU95MpUhKdzsK0m9X5EgCg=; b=e2NIeJpgb/hC+Z
	z38BTXZO3FAatuB7jV5MNCtzcQt/2ViJSco2TbH/shNKKs/ILbj4tLxSi9SPZiHOutnrF0WVO1GEv
	IA4lJ1F+elQoG8g8Kl+QTzgoB0xOSjfhwgaYkUqQSQ2XIDNCnzIsCbNrrBN3PRmklvMLOJioCV0P5
	dPaUszOaaqoPzm63dWWKJRW0WMPwg0qiWOJli4GfbvNxz2iawc5kPvUbiGFN7PBlLrunKfdKu/yFt
	Zv4zS/XcTo6PdnY+YeTxKpasyC9flNw0lh+o28YZKzMMfTK7vW4fDtOT6+kxVEFv14x72IE/ThXWc
	VczH3PXXm84F4MNSSLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCM9-00000007TL2-2tDO;
	Thu, 20 Nov 2025 21:38:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCLz-00000007THL-0QgS;
	Thu, 20 Nov 2025 21:38:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5F0D40BFF;
	Thu, 20 Nov 2025 21:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F383C116C6;
	Thu, 20 Nov 2025 21:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763674690;
	bh=p2iRB5gfTfQy7rwmQVb2AFipzBjlvzKpAdPbAlIUpu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cfmjRpXeGlAZDGSFmeIFet3T3R7BeErhUWa8Q2dw6uU3UbqXiytoyyzY4BFDsd9Ez
	 VbC0DZM9/DgTwrI5+E0xPoL5GMu9eQ8N3PQAxRUrsDxT2C8qRV2UQT/TDzWzOoaXzO
	 wR5Qh5fH7dvf6cP9UnZ+2UxzJsCmB3dbC4a+k4RrRnASU31LGBTuLL5RDLYoQ/wo5D
	 wQnlWWic/eQ0c0OLKCEwLHRpomheE6q8xO/qDdWsbCAuqjC6Zrsf7uQ4/hB63QfFeN
	 P9PGNSqOHnkqBPq5ah1D8n3dvpe/wB0P98+l/dDzlfGHmcjfG1N0oSJPAqCuTNCKMP
	 UNjZhq0gYE/TQ==
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Nov 2025 15:37:51 -0600
Subject: [PATCH v2 2/3] ARM: at91: Move PM init functions to .init_late
 hook
MIME-Version: 1.0
Message-Id: <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org>
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
In-Reply-To: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_133811_205550_1398BD7E 
X-CRM114-Status: GOOD (  11.01  )
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

Move the AT91 PM init functions to .init_late hook to ensure driver
dependencies have probed.

Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - new patch
---
 arch/arm/mach-at91/at91rm9200.c | 3 +--
 arch/arm/mach-at91/at91sam9.c   | 3 +--
 arch/arm/mach-at91/sam9x60.c    | 3 +--
 arch/arm/mach-at91/sam9x7.c     | 3 +--
 arch/arm/mach-at91/sama5.c      | 2 +-
 arch/arm/mach-at91/sama7.c      | 3 +--
 6 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-at91/at91rm9200.c b/arch/arm/mach-at91/at91rm9200.c
index 4f8186211619..2ac564eb8bbb 100644
--- a/arch/arm/mach-at91/at91rm9200.c
+++ b/arch/arm/mach-at91/at91rm9200.c
@@ -17,8 +17,6 @@
 static void __init at91rm9200_dt_device_init(void)
 {
 	of_platform_default_populate(NULL, NULL, NULL);
-
-	at91rm9200_pm_init();
 }
 
 static const char *const at91rm9200_dt_board_compat[] __initconst = {
@@ -27,6 +25,7 @@ static const char *const at91rm9200_dt_board_compat[] __initconst = {
 };
 
 DT_MACHINE_START(at91rm9200_dt, "Atmel AT91RM9200")
+	.init_late	= at91rm9200_pm_init,
 	.init_machine	= at91rm9200_dt_device_init,
 	.dt_compat	= at91rm9200_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/at91sam9.c b/arch/arm/mach-at91/at91sam9.c
index 7e572189a5eb..cf07cba4ee5d 100644
--- a/arch/arm/mach-at91/at91sam9.c
+++ b/arch/arm/mach-at91/at91sam9.c
@@ -17,8 +17,6 @@
 static void __init at91sam9_init(void)
 {
 	of_platform_default_populate(NULL, NULL, NULL);
-
-	at91sam9_pm_init();
 }
 
 static const char *const at91_dt_board_compat[] __initconst = {
@@ -28,6 +26,7 @@ static const char *const at91_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM9")
 	/* Maintainer: Atmel */
+	.init_late	= at91sam9_pm_init,
 	.init_machine	= at91sam9_init,
 	.dt_compat	= at91_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sam9x60.c b/arch/arm/mach-at91/sam9x60.c
index d8c739d25458..a31beaaeffcd 100644
--- a/arch/arm/mach-at91/sam9x60.c
+++ b/arch/arm/mach-at91/sam9x60.c
@@ -18,8 +18,6 @@
 static void __init sam9x60_init(void)
 {
 	of_platform_default_populate(NULL, NULL, NULL);
-
-	sam9x60_pm_init();
 }
 
 static const char *const sam9x60_dt_board_compat[] __initconst = {
@@ -29,6 +27,7 @@ static const char *const sam9x60_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sam9x60_dt, "Microchip SAM9X60")
 	/* Maintainer: Microchip */
+	.init_late	= sam9x60_pm_init,
 	.init_machine	= sam9x60_init,
 	.dt_compat	= sam9x60_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sam9x7.c b/arch/arm/mach-at91/sam9x7.c
index e1ff30b5b09b..0c73f7fefd4f 100644
--- a/arch/arm/mach-at91/sam9x7.c
+++ b/arch/arm/mach-at91/sam9x7.c
@@ -17,8 +17,6 @@
 static void __init sam9x7_init(void)
 {
 	of_platform_default_populate(NULL, NULL, NULL);
-
-	sam9x7_pm_init();
 }
 
 static const char * const sam9x7_dt_board_compat[] __initconst = {
@@ -28,6 +26,7 @@ static const char * const sam9x7_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sam9x7_dt, "Microchip SAM9X7")
 	/* Maintainer: Microchip */
+	.init_late	= sam9x7_pm_init,
 	.init_machine	= sam9x7_init,
 	.dt_compat	= sam9x7_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
index bf2b5c6a18c6..efae697ce29c 100644
--- a/arch/arm/mach-at91/sama5.c
+++ b/arch/arm/mach-at91/sama5.c
@@ -33,7 +33,6 @@ static void __init sama5_secure_cache_init(void)
 static void __init sama5_dt_device_init(void)
 {
 	of_platform_default_populate(NULL, NULL, NULL);
-	sama5_pm_init();
 }
 
 static const char *const sama5_dt_board_compat[] __initconst = {
@@ -43,6 +42,7 @@ static const char *const sama5_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sama5_dt, "Atmel SAMA5")
 	/* Maintainer: Atmel */
+	.init_late	= sama5_pm_init,
 	.init_machine	= sama5_dt_device_init,
 	.dt_compat	= sama5_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sama7.c b/arch/arm/mach-at91/sama7.c
index bd43733ede18..3e28727f2a8e 100644
--- a/arch/arm/mach-at91/sama7.c
+++ b/arch/arm/mach-at91/sama7.c
@@ -17,8 +17,6 @@
 static void __init sama7_dt_device_init(void)
 {
 	of_platform_default_populate(NULL, NULL, NULL);
-	sama7_pm_init();
-}
 
 static const char *const sama7_dt_board_compat[] __initconst = {
 	"microchip,sama7",
@@ -27,6 +25,7 @@ static const char *const sama7_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sama7_dt, "Microchip SAMA7")
 	/* Maintainer: Microchip */
+	.init_late	= sama7_pm_init,
 	.init_machine	= sama7_dt_device_init,
 	.dt_compat	= sama7_dt_board_compat,
 MACHINE_END

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
