Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D2DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HvREmw98PlvgUIQdanb5hKd7KymhGed47lWGEUPlMw=; b=MIRkYGZWH+LKL+
	F1dPzvw7BRb6uRYRNWSPSTkwyym2SP69ueKEKxi3TnVRn9JviWi1thKj59NfJeaiKpFsAlOhtrQOU
	yJLgXnOqLgfCoxq5xn+L6kZ4gVdYHbvR00hK8EBrm6j/creAy/3zGUxu6PxR97GbsbETO5d33h3lF
	hohR1X3yxaFAQhAh/0m9Y1qFBd0taDQTSgKzO9/Tn0Z+6kKD/ux25lu5fCTLIBRG21aZpED32m3fT
	JmcPBzCn4IsJiTV8yED8sGK3m4vOO+UJB+zOgFmiExdUd/6SafbhbxwkBCmXKPSSugNmcQE9lLEP4
	rhvFpa8M56HTdtoEWtLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngqu5-004wXN-Nw; Tue, 19 Apr 2022 16:40:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqsc-004vhH-RX; Tue, 19 Apr 2022 16:39:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 714FA617D1;
 Tue, 19 Apr 2022 16:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23EEC385AB;
 Tue, 19 Apr 2022 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386346;
 bh=/w2/TuJUuh8aAeAb2m2RYQ0ha5XDa7wX5MqtonXBziw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JSa8soCOWoHbvEvEMCJM5/utpcask8B1DWr5x2vp91tbyaynmX0rTSsEKOTeoQHXR
 xSRS3Xno7rnCUQ3pMwm4mb0C5Nn4Un3kthir4lze9lCf7arGoOqvJyX6s9isYF1BTg
 81xrpPmbsNyOwda4gry9Su9QAWOc6aLDIvSCivZ6D7ALqa5hnnFk8qqp6WGo4H0jz/
 n3cmV2yg+Hsqp/2KBOQWv4OG8fsDhuMeF3RquJVsVmQ3r03jGQ5Jb/kE9Eg+MfTnPV
 0fhh0N+QRSE/UK4kqmfvj+oYMYiI2cyul44m5sN6XHaZpuap2KcE/Ox9+lUvfY7liW
 OcEgijUbKxbQQ==
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
Subject: [PATCH 02/48] ARM: pxa: make mainstone.h private
Date: Tue, 19 Apr 2022 18:37:24 +0200
Message-Id: <20220419163810.2118169-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_093907_028154_665607B5 
X-CRM114-Status: GOOD (  14.74  )
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

No driver includes this any more, so don't expose it globally.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/mainstone.c                    | 2 +-
 arch/arm/mach-pxa/{include/mach => }/mainstone.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/mainstone.h (99%)

diff --git a/arch/arm/mach-pxa/mainstone.c b/arch/arm/mach-pxa/mainstone.c
index d237bd030238..997f6e502201 100644
--- a/arch/arm/mach-pxa/mainstone.c
+++ b/arch/arm/mach-pxa/mainstone.c
@@ -45,7 +45,7 @@
 #include <asm/mach/flash.h>
 
 #include "pxa27x.h"
-#include <mach/mainstone.h>
+#include "mainstone.h"
 #include <mach/audio.h>
 #include <linux/platform_data/video-pxafb.h>
 #include <linux/platform_data/mmc-pxamci.h>
diff --git a/arch/arm/mach-pxa/include/mach/mainstone.h b/arch/arm/mach-pxa/mainstone.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/mainstone.h
rename to arch/arm/mach-pxa/mainstone.h
index 1698f2ffd7c7..ba003742e003 100644
--- a/arch/arm/mach-pxa/include/mach/mainstone.h
+++ b/arch/arm/mach-pxa/mainstone.h
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- *  arch/arm/mach-pxa/include/mach/mainstone.h
- *
  *  Author:	Nicolas Pitre
  *  Created:	Nov 14, 2002
  *  Copyright:	MontaVista Software Inc.
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
