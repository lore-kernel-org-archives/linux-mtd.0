Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDAFFE5207
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2026 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so8hUCISPoG3kvO6sBLwh8fCldHWetwAYeZD0ov6XgA=; b=m4pY5/Yxa2pB6e
	qpRx/goBdCDDbE3YMNiPQMx00dq/EWMQOUX2ipPX3/AZwx/IUVKsahpAL8jG7aE88g7N6fXsfojs+
	EG+Ts/pGpYDLNQbfapv40tu1FID4+1SP3/be3fJjRiXG6sruSFUmMVX7RlEwxx56g3IaznKrxQ4k2
	+NUihtFZO7f1RCEIYqeprCv84qOXN4UYU0P7LG9X/yxMpz86PIR/J4izQuRYOyp9zTNRJv6Zmqv71
	BXhSZ4XzRyBbYaoYPVbrg6iq/X5jeQD2JaAVxcnZvs6BawF1GgoSsmkN2uqpcaoWXWsG6ivCIbKo7
	hDXcu/dX6amDgjd+dMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEDH-0000000D3je-3sDZ;
	Fri, 24 Apr 2026 10:56:47 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGEDC-0000000D3j8-36eo;
	Fri, 24 Apr 2026 10:56:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 931E61483893;
	Fri, 24 Apr 2026 12:56:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1777028195;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=Cqwv1Na13IUrlFyPHE7CHse1r1pE3rZND/iW4FcYezw=;
	b=jFKNhVJMbJyYrRya5j9mS/320/tzhYTratnedsHvymSJZrvioZNJIBcpujPGR6MXXGOZOD
	TtZcuu5XZwM1MgrOaqK135S6yMa9i2f8UzM7RGfPIru4nGrBg593jmFvw7Jy1jy0B3rYLG
	A2d8QrYhSD/UQPgv3jNYYG0auTaewWsjEjEJCt8Gfv5pi5qJOLgucbJtMraCz66RUjER1E
	gdSin2HQtfoRtQI8aXopgsGbRMwUjkOMJH5ggbbkIIL+ZHxrA8X6JZP5Z+Gc4igjDV0lR6
	AU5KRRmAZg3MtTBukGnJC0RJNxmvwoHv4N674l5rEpDrAeqj7/qNUoVXqBz1mg==
Date: Fri, 24 Apr 2026 12:56:27 +0200
From: Alexander Dahl <ada@thorsis.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
Message-ID: <20260424-worried-renewal-924d34ed945c@thorsis.com>
Mail-Followup-To: "Rob Herring (Arm)" <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Russell King <linux@armlinux.org.uk>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260105-at91-probe-v3-0-594013ff2965@kernel.org>
 <20260105-at91-probe-v3-3-594013ff2965@kernel.org>
 <20260423-stoke-ocean-139dbe306256@thorsis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260423-stoke-ocean-139dbe306256@thorsis.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_035643_413312_74EAB0F0 
X-CRM114-Status: GOOD (  44.33  )
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

Hei hei,

after few hints in IRC yesterday, I tried to understand why neither
the ebi driver nor the nand driver are probed, but I failed.  See below.

Am Thu, Apr 23, 2026 at 10:24:46AM +0200 schrieb Alexander Dahl:
> Hello everyone,
> 
> I'm afraid this patch breaks finding rootfs on raw nand on sam9x60,
> see below:
> 
> Am Mon, Jan 05, 2026 at 03:06:45PM -0600 schrieb Rob Herring (Arm):
> > The DT core will call of_platform_default_populate, so it is not
> > necessary for machine specific code to call it unless there are custom
> > match entries, auxdata or parent device. Neither of those apply here, so
> > remove the call.
> > 
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Not sure what was actually tested, but this change breaks booting from
> raw NAND flash on our sam9x60 based board.  I bisected the boot
> failure to this exact change.  Before the change I see the nand
> controller messages in the kernel log like this:
> 
>     atmel-nand-controller 10000000.ebi:nand-controller: using dma0chan5 for DMA transfers
>     nand: device found, Manufacturer ID: 0x01, Chip ID: 0xda
>     nand: AMD/Spansion S34ML02G1
>     nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> 
> After the change, there are no kernel log messages related to nand at
> all, the driver does not seem to load.  This of course leads to no mtd
> and ubi devices created, no ubi volumes found, no rootfs, and
> eventually this message:
> 
>     VFS: Cannot open root device "ubi0:rootfs2" or unknown-block(0,253): error -19
> 
> I tried to understand the whole patch series, and to my understanding
> the intend was the device nodes still get populated, and the drivers
> loaded, right?  Patch 1/3 is related to the atmel nand controller, and
> that one is not in the tree yet when bisecting to the end.  However it
> is present in v7.0-rc1 (and later) and trying to boot that kernel (or
> 7.0 or todays master) fails, too.  (Also I don't see those probe defer
> messages related to SRAM on v7.0-rc1, so I assume that's not the
> problem?)
> 
> Now the strange thing is: on a different hardware based on sama5d2
> v7.0-rc1 boots fine from raw nand flash.  I wonder what's the
> difference which makes it work on one atmel platform and not work on
> the other?
> 
> I compared kernel .config of both boards, no obvious pieces missing.
> Looking at the dts (and included dtsi) files of both boards I could
> spot no mistake.  Also no obvious flaws in sama5d2.dtsi or
> sam9x60.dtsi.
> 
> Note: raw NAND flash is the only storage for rootfs on our platforms,
> we can not simply put rootfs to a different storage.  I could try
> setting up NFS boot for further investigation, but that will take a
> while.

Meanwhile I got to boot the device over NFS and did some
instrumentation of the atmel-ebi driver and the atmel rawnand driver.

Can confirm, that the probe functions of those drivers are not called
(still v7.0-rc1 on sam9x60).  The atmel-pmecc driver however actually
is probed/loaded, but that device node sits in a different area of the
device tree.

> Does anyone have an idea how to make booting from raw NAND flash work
> on sam9x60 again (despite the obviously not desired revert)?  What can
> I try?  What information would be interesting for debugging?

Tried booting with cmdline option 'fw_devlink=off' but that did not
change anything.

When mounting debugfs, the file /sys/kernel/debug/devices_deferred is
empty, so deferred devices waiting on something seems not the cause.

Strange thing is /sys/bus/platform/devices/ has an entry
'10000000.ebi' but none for the child node of the nand-controller.
And /sys/bus/platform/drivers has an entry for 'atmel-nand-controller'
but 'atmel-ebi' is missing (it is not on the sama5d2 system).

I don't get what the key difference between those systems is and
what's necessary so the atmel-ebi probe function gets called?

The fw_devlink stuff also does not really make sense to me.  FWIW,
from the sam9x60 system:

    $ ls -1 /sys/class/devlink/
    platform:ahb:apb:pinctrl@fffff400--platform:10000000.ebi
    platform:ahb:apb:pinctrl@fffff400--platform:f0014000.spi
    platform:ahb:apb:pinctrl@fffff400--platform:f802c000.ethernet
    platform:ahb:apb:pinctrl@fffff400--platform:fffff200.serial
    platform:ahb:apb:pinctrl@fffff400--platform:gpio-keys
    platform:ahb:apb:pinctrl@fffff400--platform:led-controller-0
    platform:ahb:apb:pinctrl@fffff400--platform:spi-gpio-1
    platform:fffff400.gpio--platform:spi-gpio-1
    platform:fffff600.gpio--mdio_bus:f802c000.ethernet-ffffffff:03
    platform:fffff600.gpio--spi:spi1.0
    platform:fffffa00.gpio--platform:10000000.ebi

The sama5d2 system (which successfully loads the nand-controller
driver) has this:

    $ ls -1 /sys/class/devlink/
    platform:ahb:apb--platform:f8034200.serial
    platform:f802c000.pwm--platform:led-controller-1
    platform:fc038000.pinctrl--platform:10000000.ebi
    platform:fc038000.pinctrl--platform:f8000000.spi
    platform:fc038000.pinctrl--platform:f8008000.ethernet
    platform:fc038000.pinctrl--platform:f8020000.serial
    platform:fc038000.pinctrl--platform:f802c000.pwm
    platform:fc038000.pinctrl--platform:f8034000.flexcom
    platform:fc038000.pinctrl--platform:gpio-keys
    platform:fc038000.pinctrl--spi:spi0.0

So both platforms use different pinctrl drivers (pinctrl-at91-pio4.c
vs. pinctrl-at91.c) but can that be the issue?

I know not many people use raw nand on at91, but any ideas welcome.
Also where I should look in sysfs, debugfs, or code?

Greets
Alex

> Greets
> Alex
> 
> > ---
> > v3:
> >  - Fixup split between patch 2 and 3.
> > 
> > v2:
> >  - Dust off and rebase to 6.18-rc1
> >  - Add new platforms added since v1
> > ---
> >  arch/arm/mach-at91/at91rm9200.c |  9 ---------
> >  arch/arm/mach-at91/at91sam9.c   |  9 ---------
> >  arch/arm/mach-at91/sam9x60.c    |  9 ---------
> >  arch/arm/mach-at91/sam9x7.c     |  9 ---------
> >  arch/arm/mach-at91/sama5.c      | 16 ----------------
> >  arch/arm/mach-at91/sama7.c      |  9 ---------
> >  6 files changed, 61 deletions(-)
> > 
> > diff --git a/arch/arm/mach-at91/at91rm9200.c b/arch/arm/mach-at91/at91rm9200.c
> > index 2ac564eb8bbb..d15997fff5d7 100644
> > --- a/arch/arm/mach-at91/at91rm9200.c
> > +++ b/arch/arm/mach-at91/at91rm9200.c
> > @@ -7,18 +7,10 @@
> >   *                2012 Joachim Eastwood <manabian@gmail.com>
> >   */
> >  
> > -#include <linux/of.h>
> > -#include <linux/of_platform.h>
> > -
> >  #include <asm/mach/arch.h>
> >  
> >  #include "generic.h"
> >  
> > -static void __init at91rm9200_dt_device_init(void)
> > -{
> > -	of_platform_default_populate(NULL, NULL, NULL);
> > -}
> > -
> >  static const char *const at91rm9200_dt_board_compat[] __initconst = {
> >  	"atmel,at91rm9200",
> >  	NULL
> > @@ -26,6 +18,5 @@ static const char *const at91rm9200_dt_board_compat[] __initconst = {
> >  
> >  DT_MACHINE_START(at91rm9200_dt, "Atmel AT91RM9200")
> >  	.init_late	= at91rm9200_pm_init,
> > -	.init_machine	= at91rm9200_dt_device_init,
> >  	.dt_compat	= at91rm9200_dt_board_compat,
> >  MACHINE_END
> > diff --git a/arch/arm/mach-at91/at91sam9.c b/arch/arm/mach-at91/at91sam9.c
> > index cf07cba4ee5d..b9d2909d1b65 100644
> > --- a/arch/arm/mach-at91/at91sam9.c
> > +++ b/arch/arm/mach-at91/at91sam9.c
> > @@ -6,19 +6,11 @@
> >   *                2011 Nicolas Ferre <nicolas.ferre@atmel.com>
> >   */
> >  
> > -#include <linux/of.h>
> > -#include <linux/of_platform.h>
> > -
> >  #include <asm/mach/arch.h>
> >  #include <asm/system_misc.h>
> >  
> >  #include "generic.h"
> >  
> > -static void __init at91sam9_init(void)
> > -{
> > -	of_platform_default_populate(NULL, NULL, NULL);
> > -}
> > -
> >  static const char *const at91_dt_board_compat[] __initconst = {
> >  	"atmel,at91sam9",
> >  	NULL
> > @@ -27,6 +19,5 @@ static const char *const at91_dt_board_compat[] __initconst = {
> >  DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM9")
> >  	/* Maintainer: Atmel */
> >  	.init_late	= at91sam9_pm_init,
> > -	.init_machine	= at91sam9_init,
> >  	.dt_compat	= at91_dt_board_compat,
> >  MACHINE_END
> > diff --git a/arch/arm/mach-at91/sam9x60.c b/arch/arm/mach-at91/sam9x60.c
> > index a31beaaeffcd..744bab2cbb92 100644
> > --- a/arch/arm/mach-at91/sam9x60.c
> > +++ b/arch/arm/mach-at91/sam9x60.c
> > @@ -7,19 +7,11 @@
> >   * Author: Claudiu Beznea <claudiu.beznea@microchip.com>
> >   */
> >  
> > -#include <linux/of.h>
> > -#include <linux/of_platform.h>
> > -
> >  #include <asm/mach/arch.h>
> >  #include <asm/system_misc.h>
> >  
> >  #include "generic.h"
> >  
> > -static void __init sam9x60_init(void)
> > -{
> > -	of_platform_default_populate(NULL, NULL, NULL);
> > -}
> > -
> >  static const char *const sam9x60_dt_board_compat[] __initconst = {
> >  	"microchip,sam9x60",
> >  	NULL
> > @@ -28,6 +20,5 @@ static const char *const sam9x60_dt_board_compat[] __initconst = {
> >  DT_MACHINE_START(sam9x60_dt, "Microchip SAM9X60")
> >  	/* Maintainer: Microchip */
> >  	.init_late	= sam9x60_pm_init,
> > -	.init_machine	= sam9x60_init,
> >  	.dt_compat	= sam9x60_dt_board_compat,
> >  MACHINE_END
> > diff --git a/arch/arm/mach-at91/sam9x7.c b/arch/arm/mach-at91/sam9x7.c
> > index 0c73f7fefd4f..166c8625509d 100644
> > --- a/arch/arm/mach-at91/sam9x7.c
> > +++ b/arch/arm/mach-at91/sam9x7.c
> > @@ -7,18 +7,10 @@
> >   * Author: Varshini Rajendran <varshini.rajendran@microchip.com>
> >   */
> >  
> > -#include <linux/of.h>
> > -#include <linux/of_platform.h>
> > -
> >  #include <asm/mach/arch.h>
> >  
> >  #include "generic.h"
> >  
> > -static void __init sam9x7_init(void)
> > -{
> > -	of_platform_default_populate(NULL, NULL, NULL);
> > -}
> > -
> >  static const char * const sam9x7_dt_board_compat[] __initconst = {
> >  	"microchip,sam9x7",
> >  	NULL
> > @@ -27,6 +19,5 @@ static const char * const sam9x7_dt_board_compat[] __initconst = {
> >  DT_MACHINE_START(sam9x7_dt, "Microchip SAM9X7")
> >  	/* Maintainer: Microchip */
> >  	.init_late	= sam9x7_pm_init,
> > -	.init_machine	= sam9x7_init,
> >  	.dt_compat	= sam9x7_dt_board_compat,
> >  MACHINE_END
> > diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
> > index 576654cba82d..e56022f00800 100644
> > --- a/arch/arm/mach-at91/sama5.c
> > +++ b/arch/arm/mach-at91/sama5.c
> > @@ -6,9 +6,6 @@
> >   *                2013 Ludovic Desroches <ludovic.desroches@atmel.com>
> >   */
> >  
> > -#include <linux/of.h>
> > -#include <linux/of_platform.h>
> > -
> >  #include <asm/hardware/cache-l2x0.h>
> >  #include <asm/mach/arch.h>
> >  #include <asm/mach/map.h>
> > @@ -30,11 +27,6 @@ static void __init sama5_secure_cache_init(void)
> >  		outer_cache.write_sec = sama5_l2c310_write_sec;
> >  }
> >  
> > -static void __init sama5_dt_device_init(void)
> > -{
> > -	of_platform_default_populate(NULL, NULL, NULL);
> > -}
> > -
> >  static const char *const sama5_dt_board_compat[] __initconst = {
> >  	"atmel,sama5",
> >  	NULL
> > @@ -43,7 +35,6 @@ static const char *const sama5_dt_board_compat[] __initconst = {
> >  DT_MACHINE_START(sama5_dt, "Atmel SAMA5")
> >  	/* Maintainer: Atmel */
> >  	.init_late	= sama5_pm_init,
> > -	.init_machine	= sama5_dt_device_init,
> >  	.dt_compat	= sama5_dt_board_compat,
> >  MACHINE_END
> >  
> > @@ -54,17 +45,11 @@ static const char *const sama5_alt_dt_board_compat[] __initconst = {
> >  
> >  DT_MACHINE_START(sama5_alt_dt, "Atmel SAMA5")
> >  	/* Maintainer: Atmel */
> > -	.init_machine	= sama5_dt_device_init,
> >  	.init_late	= sama5_pm_init,
> >  	.dt_compat	= sama5_alt_dt_board_compat,
> >  	.l2c_aux_mask	= ~0UL,
> >  MACHINE_END
> >  
> > -static void __init sama5d2_init(void)
> > -{
> > -	of_platform_default_populate(NULL, NULL, NULL);
> > -}
> > -
> >  static const char *const sama5d2_compat[] __initconst = {
> >  	"atmel,sama5d2",
> >  	NULL
> > @@ -72,7 +57,6 @@ static const char *const sama5d2_compat[] __initconst = {
> >  
> >  DT_MACHINE_START(sama5d2, "Atmel SAMA5")
> >  	/* Maintainer: Atmel */
> > -	.init_machine	= sama5d2_init,
> >  	.init_early	= sama5_secure_cache_init,
> >  	.init_late	= sama5d2_pm_init,
> >  	.dt_compat	= sama5d2_compat,
> > diff --git a/arch/arm/mach-at91/sama7.c b/arch/arm/mach-at91/sama7.c
> > index 8bf57a020f1c..f56828d61199 100644
> > --- a/arch/arm/mach-at91/sama7.c
> > +++ b/arch/arm/mach-at91/sama7.c
> > @@ -6,19 +6,11 @@
> >   *
> >   */
> >  
> > -#include <linux/of.h>
> > -#include <linux/of_platform.h>
> > -
> >  #include <asm/mach/arch.h>
> >  #include <asm/system_misc.h>
> >  
> >  #include "generic.h"
> >  
> > -static void __init sama7_dt_device_init(void)
> > -{
> > -	of_platform_default_populate(NULL, NULL, NULL);
> > -}
> > -
> >  static const char *const sama7_dt_board_compat[] __initconst = {
> >  	"microchip,sama7",
> >  	NULL
> > @@ -27,7 +19,6 @@ static const char *const sama7_dt_board_compat[] __initconst = {
> >  DT_MACHINE_START(sama7_dt, "Microchip SAMA7")
> >  	/* Maintainer: Microchip */
> >  	.init_late	= sama7_pm_init,
> > -	.init_machine	= sama7_dt_device_init,
> >  	.dt_compat	= sama7_dt_board_compat,
> >  MACHINE_END
> >  
> > 
> > -- 
> > 2.51.0
> > 
> > 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
