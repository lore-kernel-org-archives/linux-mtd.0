Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BC1C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G14q8cH2XCJwT/1dbcA6Q2NQvEGBvq7Ux6bEpNJYxGo=; b=1E/h8muO0vU23L
	WaFTN41xwB09mrp40UEPXKwchvdUpa9dtVzO2aTVizAU4QsH6GwXfjPRGfg4lO/Yxxlv9aO9Aev2j
	awZLEKnlgwYoM+VLwAjD4X9/pZ5bIn4KudhwY86Lspt7OVekI1BsCqndGOwB4ofzUwnvEMJF5+Wk8
	nhS07fi2sJ3nXpnW+G6eh6JWR5IS9SaWZ+MBOkzuXU0rWpNx5L0InwQP79D1nm4ICvOGadzE70YX0
	qsDvHwGlyboHt5ShH9E1AoTaIoxtqaqZTDXrkV2iIPkKoECMJ56HzeMuKOZrgXzSnefgbLq9k8zR0
	OFYc3RHDBMvM80c9b5Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngqvu-004xdp-6j; Tue, 19 Apr 2022 16:42:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqsu-004vsr-8Z; Tue, 19 Apr 2022 16:39:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D27C9B81BE7;
 Tue, 19 Apr 2022 16:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBC5C385A7;
 Tue, 19 Apr 2022 16:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386361;
 bh=8eNcQvPL/qwAHe1cyIDldIcvo4EcdfaIYnGqLI1GMk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LVWCBec3TOUY0aiyOISATFg6pS9jumUzky+Ehfz7G3cgxF1rj0HVil0+pa2jkeAex
 +I/kMAz7NPdj5SvpkunSAFKIAEk8QSgdWx+SIEumBcrPnXonnU4eEXHczTJyAamIGW
 Fqx5TRqKxYXqZIi3auuy03GYtQb1udlODQ45EdRJtZzlua4YntfSSfjlKnwxqVPTK7
 Sam1zQZYtyCqFeU+De7N+gO0nzM6BEX233RRdS5AuCXB25Nncz35spe45uNkA9vaey
 log5jNFTz3afoWInaxRTj1U0qhJDCMqiOZM7huV6OxJSkNIfGwYjRhB8fCNmUgag4C
 qK0Gc9ZA81juQ==
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
Subject: [PATCH 04/48] ARM: pxa: remove mach/dma.h
Date: Tue, 19 Apr 2022 18:37:26 +0200
Message-Id: <20220419163810.2118169-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_093924_652242_BD615874 
X-CRM114-Status: GOOD (  15.13  )
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

The file no longer contains anything useful, so remove it.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/include/mach/dma.h | 17 -----------------
 arch/arm/mach-pxa/pxa25x.c           |  1 -
 arch/arm/mach-pxa/pxa27x.c           |  1 -
 arch/arm/mach-pxa/pxa3xx.c           |  1 -
 4 files changed, 20 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/include/mach/dma.h

diff --git a/arch/arm/mach-pxa/include/mach/dma.h b/arch/arm/mach-pxa/include/mach/dma.h
deleted file mode 100644
index 79f9842a7e1c..000000000000
--- a/arch/arm/mach-pxa/include/mach/dma.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- *  arch/arm/mach-pxa/include/mach/dma.h
- *
- *  Author:	Nicolas Pitre
- *  Created:	Jun 15, 2001
- *  Copyright:	MontaVista Software, Inc.
- */
-#ifndef __ASM_ARCH_DMA_H
-#define __ASM_ARCH_DMA_H
-
-#include <mach/hardware.h>
-
-/* DMA Controller Registers Definitions */
-#define DMAC_REGS_VIRT	io_p2v(0x40000000)
-
-#endif /* _ASM_ARCH_DMA_H */
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 678641ab46e5..0d25cc45f825 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -34,7 +34,6 @@
 #include "pxa25x.h"
 #include <mach/reset.h>
 #include "pm.h"
-#include <mach/dma.h>
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index f0ba7ed24cb6..f7e89831e85b 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -33,7 +33,6 @@
 #include <mach/reset.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pm.h"
-#include <mach/dma.h>
 #include <mach/smemc.h>
 
 #include "generic.h"
diff --git a/arch/arm/mach-pxa/pxa3xx.c b/arch/arm/mach-pxa/pxa3xx.c
index 560160682df6..6eb1c24d7395 100644
--- a/arch/arm/mach-pxa/pxa3xx.c
+++ b/arch/arm/mach-pxa/pxa3xx.c
@@ -32,7 +32,6 @@
 #include <mach/reset.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include "pm.h"
-#include <mach/dma.h>
 #include <mach/smemc.h>
 #include <mach/irqs.h>
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
