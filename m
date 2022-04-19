Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5B4C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 16:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6QDwZSRwfmHrnf9pauVjihbj5Kxp2GJ3sl8lZ2J0Wg=; b=pVTSBN3yBn40u2
	/UKu3dyIEdzJQmdWg0AM9mKWo5oyDKWEcvz1Wq2sbx6eq26aIiToxy/IyUr6/HHw8UyttYbkJ9JV2
	wF0dg3bkHEnP8jlQYNSBE0AB1pNd4Lx/VRk5NTDlVARwt5RNf7uDamQ0um3p9KKVMWxazEMVHtmAW
	H45Wxqluv4DGP8007aHRRZy2CBiGAjw71sDG2O+6kzHAAluKURJypuG9iAdvBEtpInRn51KNKzMsE
	MU8JUBlwiZGSJBMz9gHFQ7q4vmg0UujBMj/P4gc6LuNROll6HJiOz81r7ihCCe8W2H9LFZrr5bsGc
	Ykw7b7xFKDTQrwtp0h3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngqt9-004w1a-Tr; Tue, 19 Apr 2022 16:39:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqsW-004vdh-4M; Tue, 19 Apr 2022 16:39:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B7B116182A;
 Tue, 19 Apr 2022 16:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39045C385AD;
 Tue, 19 Apr 2022 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386338;
 bh=KbcdSb50IQLQ5D4tI3ok5xmRy9ObZ3/EmRI64VTM1Ss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QdhTX8pdRbp03NZ9vJpKvlEH0f/LQ43kdIDE3RiWKCHCHI1TeOSV/h2lIhOb318AW
 qWgSeA57UjCVL2jEug5iXpiU3mmK/354NQ7BZZIb9uPi9MiVkVOeUEGuZsTOgD41GY
 JfVGfCCTpEMKv6X6RuFhSjWrhsQPeXXxyjFo/OdB8ASzElshH+x6UD5qpMCTWmAYC7
 AXB9H/drECTb92IRbZrdKrOOpeSOW8QoqDJbS5crGpQ7xd/widOORb3SdNeLR9EN9S
 ElsaYiojOripJNV5hRBJsghB+2VBpHBksg2eN/ab95uYvn/xZ0GoVDa0g9fnVVshoW
 6HGGo/JgU6q3A==
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
Subject: [PATCH 01/48] ARM: pxa: split mach/generic.h
Date: Tue, 19 Apr 2022 18:37:23 +0200
Message-Id: <20220419163810.2118169-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_093900_299230_92FA5239 
X-CRM114-Status: GOOD (  14.19  )
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

Only one declaration from this header is actually used in drivers,
so move that one into the global location and leave everything else
private.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.h              | 6 +-----
 arch/arm/mach-pxa/include/mach/generic.h | 6 +++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-pxa/generic.h b/arch/arm/mach-pxa/generic.h
index 3b7873f8e1f8..67925d3ea026 100644
--- a/arch/arm/mach-pxa/generic.h
+++ b/arch/arm/mach-pxa/generic.h
@@ -7,6 +7,7 @@
  */
 
 #include <linux/reboot.h>
+#include <mach/generic.h>
 
 struct irq_data;
 
@@ -71,8 +72,3 @@ extern unsigned pxa25x_get_clk_frequency_khz(int);
 #define pxa27x_get_clk_frequency_khz(x)		(0)
 #endif
 
-#ifdef CONFIG_PXA3xx
-extern unsigned	pxa3xx_get_clk_frequency_khz(int);
-#else
-#define pxa3xx_get_clk_frequency_khz(x)		(0)
-#endif
diff --git a/arch/arm/mach-pxa/include/mach/generic.h b/arch/arm/mach-pxa/include/mach/generic.h
index 665542e0c9e2..613f6a299d0d 100644
--- a/arch/arm/mach-pxa/include/mach/generic.h
+++ b/arch/arm/mach-pxa/include/mach/generic.h
@@ -1 +1,5 @@
-#include "../../generic.h"
+#ifdef CONFIG_PXA3xx
+extern unsigned	pxa3xx_get_clk_frequency_khz(int);
+#else
+#define pxa3xx_get_clk_frequency_khz(x)		(0)
+#endif
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
