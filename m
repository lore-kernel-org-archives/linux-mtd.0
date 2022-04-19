Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C0CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8XW1lot1YacbPvsBpBIh7IR+4Lc1NMDlZMQmfLS9ws=; b=zX2vlF3P/tDu4y
	dEW6VOlAgIRbxYJ87aPozisA8OzDF8x6cC5utDBvsQKI/Wa1Fs1Akac0iCgDl0Nc7gt+dT/DrDNIw
	aU3xqezryEsJEH+HZnOBYL4Qud8JBF8197vEhV5QEDmmlXQVQbAPGBt5GCi+aqOPoCEFX42wJdnJx
	iTSl4RoFCPUfXz1BaLejbKtuKiuaiYaW7Hu8iCqIlaUZRLOhfKc+O8sU/tQYrWl3a/Wt3az0eIcej
	ALXs0aydPKWhVJDZGJRq+dfBG6ZiTqPFl7ynSgMFGa6dyku41H2bns9FhXhp6xB5cbU5kYfdNesFO
	R/o6L2YFOC+l5Tz2jWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrj2-005LPc-Mi; Tue, 19 Apr 2022 17:33:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqyM-004z1t-3n; Tue, 19 Apr 2022 16:45:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8343FB81BDE;
 Tue, 19 Apr 2022 16:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEE24C385A5;
 Tue, 19 Apr 2022 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386699;
 bh=TQPO8Eb4DXbuBVjH4snBze/CPXLx8hYfj8F7j3GxU9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PkE+S9qLLt/uVvjmX7SVYzOD8H0A2jnCwpUediQL9CiEFuo2XQ7+fzVe5orFR/j+B
 1Kn0644vK/CRT07rVNiayly/tbCE5RPqmVa3sV7YLFN50VR4KOu5kwLyvCKy7UdWrd
 PpC3+mfHHUpdHO2H25Am/SucJvYtHlNwTKkTuKmcMj5yZ3LlaeFsGLmcsHCxsrNU/J
 cXPXnNTaI9aPH1OycStlSzavEF+2HEuf5KBubApJxMqmt5vWDdLpCukXObZY00wvyD
 QUu8InZhgmCtgAChwTU5DZn/0HRUIttBKkcHuZWOka//Ki7ysvaMnLhCuX+trrjXmv
 KfputJ5rHCapw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>,
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, patches@opensource.cirrus.com,
 linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
Subject: [PATCH 47/48] ARM: pxa: remove support for MTD_XIP
Date: Tue, 19 Apr 2022 18:38:09 +0200
Message-Id: <20220419163810.2118169-48-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094502_550072_2DFA8B0C 
X-CRM114-Status: GOOD (  19.89  )
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

From: Arnd Bergmann <arnd@arndb.de>

Using MTD-XIP does not work on multiplatform kernels because
it requires SoC specific register accesses to be done from
low-level flash handling functions in RAM while the rest of the
kernel sits in flash.

I found no evidence of anyone still actually using this feature,
so remove it from PXA to avoid spending a lot of time on
actually making it work.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                         |  1 -
 arch/arm/mach-pxa/include/mach/mtd-xip.h | 36 ------------------------
 2 files changed, 37 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/include/mach/mtd-xip.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index eef8cbf20045..ace6c08c8ae2 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -413,7 +413,6 @@ config ARCH_DOVE
 
 config ARCH_PXA
 	bool "PXA2xx/PXA3xx-based"
-	select ARCH_MTD_XIP
 	select ARM_CPU_SUSPEND if PM
 	select AUTO_ZRELADDR
 	select COMMON_CLK
diff --git a/arch/arm/mach-pxa/include/mach/mtd-xip.h b/arch/arm/mach-pxa/include/mach/mtd-xip.h
deleted file mode 100644
index 4b31bef9e50a..000000000000
--- a/arch/arm/mach-pxa/include/mach/mtd-xip.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * MTD primitives for XIP support. Architecture specific functions
- *
- * Do not include this file directly. It's included from linux/mtd/xip.h
- * 
- * Author:	Nicolas Pitre
- * Created:	Nov 2, 2004
- * Copyright:	(C) 2004 MontaVista Software, Inc.
- */
-
-#ifndef __ARCH_PXA_MTD_XIP_H__
-#define __ARCH_PXA_MTD_XIP_H__
-
-#include <mach/regs-ost.h>
-
-/* restored July 2017, this did not build since 2011! */
-
-#define ICIP			io_p2v(0x40d00000)
-#define ICMR			io_p2v(0x40d00004)
-#define xip_irqpending()	(readl(ICIP) & readl(ICMR))
-
-/* we sample OSCR and convert desired delta to usec (1/4 ~= 1000000/3686400) */
-#define xip_currtime()		readl(OSCR)
-#define xip_elapsed_since(x)	(signed)((readl(OSCR) - (x)) / 4)
-
-/*
- * xip_cpu_idle() is used when waiting for a delay equal or larger than
- * the system timer tick period.  This should put the CPU into idle mode
- * to save power and to be woken up only when some interrupts are pending.
- * As above, this should not rely upon standard kernel code.
- */
-
-#define xip_cpu_idle()  asm volatile ("mcr p14, 0, %0, c7, c0, 0" :: "r" (1))
-
-#endif /* __ARCH_PXA_MTD_XIP_H__ */
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
