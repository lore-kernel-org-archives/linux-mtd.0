Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802CDC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgaCfU3xMHGo+OD8fwERF6KeSy9eFNV9OLIFkzXlkuk=; b=CAMkJi18yWtATK
	cdO8NWZfjhshQto5DGZpJWHgDT/BF7ZmWWztDz8dtntDkpFfmRgWPsUHlsm0Rv/t+cqGY7d42SGeX
	d/AYpEbecI0qVr0U4uovi4+jeRrlqy8yGfeAXw0Ba6Qq/0gZ30DiVlcGqBQIIn6RqyKq9HoW8ap4D
	5P3ld99enzWsVDPgzIGEI6LHvJem05aLy7vbZh5nlX9rtlyI5po0jG4WY5aJugBeGrNhlpnPZC0ay
	G+p3E5PVFXDrlwUkB8rJoz0q/e8p3MUEsEVwbXrLYT4F7NtJn4Piv+fOxMV7ErW4VlJXoi370zFxX
	KOj5WaOhVR6FOxRT/v1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngqug-004wtA-Dv; Tue, 19 Apr 2022 16:41:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqsk-004vmF-Ph; Tue, 19 Apr 2022 16:39:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D8E96183C;
 Tue, 19 Apr 2022 16:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34BBC385A5;
 Tue, 19 Apr 2022 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386354;
 bh=iNfaqPXbxvJ8CzkrujTl+KTX1dXRxdfsCaFm+BFdUkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bfRkXwjMc9oek9+kpE3h7BCEd05AgRXzISzSv39xtx/qe6Q/2hxmd3obXTk9UB36X
 +q4K5dVdjE3QggFgrTvjYnWJW1DdumolThYG/Etv/6l46iOKZpsTRoAEErpmmuzy/U
 lUmHdvOnaZOz3V1CaFwc0LstSClQkNGYSguKhmK3DQNsD7u/0DwgzqR9wbmaqBeb3U
 gj8yt11H4YBBVesxMPSkz9sQGyQQ2mEHodmsWtzBM5xh6K1SJLtjD+piWx4+Ajg4Jr
 LtTB6YXt4UPB2SD8A7KAOdJAvbYsNgQ2Zzg1xKK1Z0QY63UFZvEjMGPJhE0gvn5f2x
 4UMXt0euV9HXA==
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
Subject: [PATCH 03/48] ARM: pxa: make mach/regs-uart.h private
Date: Tue, 19 Apr 2022 18:37:25 +0200
Message-Id: <20220419163810.2118169-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_093915_038079_C987CA0F 
X-CRM114-Status: GOOD (  15.27  )
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

This is not used by any drivers, so make it private to the
platform.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/{include/mach => }/regs-uart.h | 0
 arch/arm/mach-pxa/viper.c                        | 2 +-
 arch/arm/mach-pxa/zeus.c                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/regs-uart.h (100%)

diff --git a/arch/arm/mach-pxa/include/mach/regs-uart.h b/arch/arm/mach-pxa/regs-uart.h
similarity index 100%
rename from arch/arm/mach-pxa/include/mach/regs-uart.h
rename to arch/arm/mach-pxa/regs-uart.h
diff --git a/arch/arm/mach-pxa/viper.c b/arch/arm/mach-pxa/viper.c
index 3aa34e9a15d3..4b81c0117971 100644
--- a/arch/arm/mach-pxa/viper.c
+++ b/arch/arm/mach-pxa/viper.c
@@ -48,7 +48,7 @@
 #include "pxa25x.h"
 #include <mach/audio.h>
 #include <linux/platform_data/video-pxafb.h>
-#include <mach/regs-uart.h>
+#include "regs-uart.h"
 #include <linux/platform_data/pcmcia-pxa2xx_viper.h>
 #include "viper.h"
 
diff --git a/arch/arm/mach-pxa/zeus.c b/arch/arm/mach-pxa/zeus.c
index 97700429633e..5d02f10b5b5a 100644
--- a/arch/arm/mach-pxa/zeus.c
+++ b/arch/arm/mach-pxa/zeus.c
@@ -39,7 +39,7 @@
 
 #include "pxa27x.h"
 #include "devices.h"
-#include <mach/regs-uart.h>
+#include "regs-uart.h"
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include "pxa27x-udc.h"
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
