Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE2FCD0406
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 21:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KilqmCeUDH9RLl2NgJfgeCvYqrZaOFZy4ax1SiKaAk=; b=4qtfeEuO087X0s
	ae6w0wsFkrp+sxcrZO4cJb5/QIz0IAGgitqGUv302vhI2tqPcfFrfGG+k0UMBsmeYyX1iXPhf38Yh
	2Td6iKJ6OjNSW847fZe94ruwQvzANca5aaEri4ioXTnonxNvs/XU43eVAEuGZ2F4Ga5muPVRLc+Zp
	rhzTKau5je8sVq+6lVQtJpsmzyyfBSH4TsQTVEJIjAyw48ddVPSroiEHh7CvIZL5WK8NQdayJ8VDq
	wt+sJbUTtS3g2qbhoi6K0eBuRhySIY6HsGPijz328vBRhPAxDnyec5Fs5D6sHPaI8tte4Gq8lUAr4
	pnKy8NrWzE1TDcmG624g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrn1-0000000C5r6-0TFK;
	Mon, 05 Jan 2026 21:06:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrmv-0000000C5my-41mA;
	Mon, 05 Jan 2026 21:06:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A5376443EF;
	Mon,  5 Jan 2026 21:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8CEC116D0;
	Mon,  5 Jan 2026 21:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767647213;
	bh=xTzY1wDaAQkjeeTLkTSAa8tj3Kl+yUVQWDNwIYcpXnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YKNTIDH0O5+FY20pBs59xQ4+kewAZwQzpPR3qyIBCNwGsJKZdNQEa4ozqA8kI4zko
	 3pqIpkSLkQ/whkiC4SGn/NWtG01qH0PqBaEF76DyC1hUgMczK0YvRZMiStaaeYfK85
	 wyHLx1Ff6bFVT/asXiHYMTWYx7g/LnUINAQGV/WRO8w30inA8VxcmIesekotm9dlJy
	 jwVgg41CY8n4U9SvdsPJFlDhx82IYGP31TajLDaW4ecpKGEpBiei4TqF5ozLTDBpoK
	 JeO7tXCPFHfSmGTmSQ2Qjt69FmB6Xw+0PgcC+UpiKY/M9M5wdfUS84vnbNCGBedL2q
	 itbizmI/QO2kw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 05 Jan 2026 15:06:45 -0600
Subject: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
MIME-Version: 1.0
Message-Id: <20260105-at91-probe-v3-3-594013ff2965@kernel.org>
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
In-Reply-To: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
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
X-CRM114-CacheID: sfid-20260105_130654_657703_8281F3A8 
X-CRM114-Status: UNSURE (   9.67  )
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

The DT core will call of_platform_default_populate, so it is not
necessary for machine specific code to call it unless there are custom
match entries, auxdata or parent device. Neither of those apply here, so
remove the call.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - Fixup split between patch 2 and 3.

v2:
 - Dust off and rebase to 6.18-rc1
 - Add new platforms added since v1
---
 arch/arm/mach-at91/at91rm9200.c |  9 ---------
 arch/arm/mach-at91/at91sam9.c   |  9 ---------
 arch/arm/mach-at91/sam9x60.c    |  9 ---------
 arch/arm/mach-at91/sam9x7.c     |  9 ---------
 arch/arm/mach-at91/sama5.c      | 16 ----------------
 arch/arm/mach-at91/sama7.c      |  9 ---------
 6 files changed, 61 deletions(-)

diff --git a/arch/arm/mach-at91/at91rm9200.c b/arch/arm/mach-at91/at91rm9200.c
index 2ac564eb8bbb..d15997fff5d7 100644
--- a/arch/arm/mach-at91/at91rm9200.c
+++ b/arch/arm/mach-at91/at91rm9200.c
@@ -7,18 +7,10 @@
  *                2012 Joachim Eastwood <manabian@gmail.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 
 #include "generic.h"
 
-static void __init at91rm9200_dt_device_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-}
-
 static const char *const at91rm9200_dt_board_compat[] __initconst = {
 	"atmel,at91rm9200",
 	NULL
@@ -26,6 +18,5 @@ static const char *const at91rm9200_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(at91rm9200_dt, "Atmel AT91RM9200")
 	.init_late	= at91rm9200_pm_init,
-	.init_machine	= at91rm9200_dt_device_init,
 	.dt_compat	= at91rm9200_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/at91sam9.c b/arch/arm/mach-at91/at91sam9.c
index cf07cba4ee5d..b9d2909d1b65 100644
--- a/arch/arm/mach-at91/at91sam9.c
+++ b/arch/arm/mach-at91/at91sam9.c
@@ -6,19 +6,11 @@
  *                2011 Nicolas Ferre <nicolas.ferre@atmel.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 #include <asm/system_misc.h>
 
 #include "generic.h"
 
-static void __init at91sam9_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-}
-
 static const char *const at91_dt_board_compat[] __initconst = {
 	"atmel,at91sam9",
 	NULL
@@ -27,6 +19,5 @@ static const char *const at91_dt_board_compat[] __initconst = {
 DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM9")
 	/* Maintainer: Atmel */
 	.init_late	= at91sam9_pm_init,
-	.init_machine	= at91sam9_init,
 	.dt_compat	= at91_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sam9x60.c b/arch/arm/mach-at91/sam9x60.c
index a31beaaeffcd..744bab2cbb92 100644
--- a/arch/arm/mach-at91/sam9x60.c
+++ b/arch/arm/mach-at91/sam9x60.c
@@ -7,19 +7,11 @@
  * Author: Claudiu Beznea <claudiu.beznea@microchip.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 #include <asm/system_misc.h>
 
 #include "generic.h"
 
-static void __init sam9x60_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-}
-
 static const char *const sam9x60_dt_board_compat[] __initconst = {
 	"microchip,sam9x60",
 	NULL
@@ -28,6 +20,5 @@ static const char *const sam9x60_dt_board_compat[] __initconst = {
 DT_MACHINE_START(sam9x60_dt, "Microchip SAM9X60")
 	/* Maintainer: Microchip */
 	.init_late	= sam9x60_pm_init,
-	.init_machine	= sam9x60_init,
 	.dt_compat	= sam9x60_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sam9x7.c b/arch/arm/mach-at91/sam9x7.c
index 0c73f7fefd4f..166c8625509d 100644
--- a/arch/arm/mach-at91/sam9x7.c
+++ b/arch/arm/mach-at91/sam9x7.c
@@ -7,18 +7,10 @@
  * Author: Varshini Rajendran <varshini.rajendran@microchip.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 
 #include "generic.h"
 
-static void __init sam9x7_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-}
-
 static const char * const sam9x7_dt_board_compat[] __initconst = {
 	"microchip,sam9x7",
 	NULL
@@ -27,6 +19,5 @@ static const char * const sam9x7_dt_board_compat[] __initconst = {
 DT_MACHINE_START(sam9x7_dt, "Microchip SAM9X7")
 	/* Maintainer: Microchip */
 	.init_late	= sam9x7_pm_init,
-	.init_machine	= sam9x7_init,
 	.dt_compat	= sam9x7_dt_board_compat,
 MACHINE_END
diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
index 576654cba82d..e56022f00800 100644
--- a/arch/arm/mach-at91/sama5.c
+++ b/arch/arm/mach-at91/sama5.c
@@ -6,9 +6,6 @@
  *                2013 Ludovic Desroches <ludovic.desroches@atmel.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -30,11 +27,6 @@ static void __init sama5_secure_cache_init(void)
 		outer_cache.write_sec = sama5_l2c310_write_sec;
 }
 
-static void __init sama5_dt_device_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-}
-
 static const char *const sama5_dt_board_compat[] __initconst = {
 	"atmel,sama5",
 	NULL
@@ -43,7 +35,6 @@ static const char *const sama5_dt_board_compat[] __initconst = {
 DT_MACHINE_START(sama5_dt, "Atmel SAMA5")
 	/* Maintainer: Atmel */
 	.init_late	= sama5_pm_init,
-	.init_machine	= sama5_dt_device_init,
 	.dt_compat	= sama5_dt_board_compat,
 MACHINE_END
 
@@ -54,17 +45,11 @@ static const char *const sama5_alt_dt_board_compat[] __initconst = {
 
 DT_MACHINE_START(sama5_alt_dt, "Atmel SAMA5")
 	/* Maintainer: Atmel */
-	.init_machine	= sama5_dt_device_init,
 	.init_late	= sama5_pm_init,
 	.dt_compat	= sama5_alt_dt_board_compat,
 	.l2c_aux_mask	= ~0UL,
 MACHINE_END
 
-static void __init sama5d2_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-}
-
 static const char *const sama5d2_compat[] __initconst = {
 	"atmel,sama5d2",
 	NULL
@@ -72,7 +57,6 @@ static const char *const sama5d2_compat[] __initconst = {
 
 DT_MACHINE_START(sama5d2, "Atmel SAMA5")
 	/* Maintainer: Atmel */
-	.init_machine	= sama5d2_init,
 	.init_early	= sama5_secure_cache_init,
 	.init_late	= sama5d2_pm_init,
 	.dt_compat	= sama5d2_compat,
diff --git a/arch/arm/mach-at91/sama7.c b/arch/arm/mach-at91/sama7.c
index 8bf57a020f1c..f56828d61199 100644
--- a/arch/arm/mach-at91/sama7.c
+++ b/arch/arm/mach-at91/sama7.c
@@ -6,19 +6,11 @@
  *
  */
 
-#include <linux/of.h>
-#include <linux/of_platform.h>
-
 #include <asm/mach/arch.h>
 #include <asm/system_misc.h>
 
 #include "generic.h"
 
-static void __init sama7_dt_device_init(void)
-{
-	of_platform_default_populate(NULL, NULL, NULL);
-}
-
 static const char *const sama7_dt_board_compat[] __initconst = {
 	"microchip,sama7",
 	NULL
@@ -27,7 +19,6 @@ static const char *const sama7_dt_board_compat[] __initconst = {
 DT_MACHINE_START(sama7_dt, "Microchip SAMA7")
 	/* Maintainer: Microchip */
 	.init_late	= sama7_pm_init,
-	.init_machine	= sama7_dt_device_init,
 	.dt_compat	= sama7_dt_board_compat,
 MACHINE_END
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
