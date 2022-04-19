Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068E8C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2olDo6jqq8O1YrIG/12YfFtYfKlD28oVQey1YHXPl4=; b=iy52dc6Ams/rpK
	2octG2Gsg6Yn0odYYjsBKwY9OCL2Z2ojIewtJYK4JOgthT7BOtR8tnUKyBkabnpuPdwnLcGkSF280
	OOywUdPCLmdHqltqygDUIpOlKpqv7fQqL/kGqTU72IRpLBXd7OLoVd/EHCcJrVzSwZVfNc9X67p3k
	vnEbDrxL1KUFZQ1TLCoIYTV3gcrIQBTQqAwS8BX5gAZJKuLzik/1igmnVhyfKxqGFW/+8g3np4DGS
	tXcIiIIGr8xKFd7MviSVhYkigp/3SxQPH4CKLv85sFt0Ppi98L4WGZ0unby6KJ25SGviHzIpiUinC
	T4oLp83NAwDo8zSJDv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrUJ-005Egn-Vf; Tue, 19 Apr 2022 17:18:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqwi-004y9w-OK; Tue, 19 Apr 2022 16:43:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 51700B81BF3;
 Tue, 19 Apr 2022 16:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED67C385A9;
 Tue, 19 Apr 2022 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386598;
 bh=v2JXUsT+aPSiyV8AWZ0OLtn99RZRKtVDeuty5M4eG68=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tt/fiI6JfMKScsjC4gupDTlXwIFAYWcsYENflWn5n3kMrbCN+Y2cCr3glEwE1sItJ
 cONsIQQLt01Y/qCAeHUUbJd9TpD27gE/DUc3zMZ7c0U2VwpCWQ+qBf7uwrq/GZGzTX
 3FGOj+knk17r2GSyltkagM0yCF+n9LJkDIwNmtctqNly1C9p720AIevLts/VbLM17G
 O+4nFGEcvsfnWMk8Au/5OQB6coNhg3LP2cgERB8iHAG0NNlBzSNRpU2laCxc90/bD8
 8gZIgUWRqfgnaIv2WyLz/01oqgCe1ixn6EBO/7GUMc0aVvmzyH6K1PsZ1Shk5OoOYF
 /MoVumyBheReg==
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
Subject: [PATCH 34/48] ARM: pxa: pcmcia: move smemc configuration back to arch
Date: Tue, 19 Apr 2022 18:37:56 +0200
Message-Id: <20220419163810.2118169-35-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094321_163724_B6610261 
X-CRM114-Status: GOOD (  22.70  )
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

Rather than poking at the smemc registers directly from the
pcmcia/pxa2xx_base driver, move those bits into machine file
to have a cleaner interface.

Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Link: https://lore.kernel.org/lkml/87d0egjzxk.fsf@belgarion.home/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.c   | 29 ++++++++++++++++++++++
 drivers/pcmcia/pxa2xx_base.c  | 46 ++++++++++++-----------------------
 include/linux/soc/pxa/smemc.h | 10 ++++++++
 3 files changed, 55 insertions(+), 30 deletions(-)
 create mode 100644 include/linux/soc/pxa/smemc.h

diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index f9083c4f0aea..fe1d55d328e5 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -70,6 +70,35 @@ unsigned int get_clk_frequency_khz(int info)
 }
 EXPORT_SYMBOL(get_clk_frequency_khz);
 
+void pxa_smemc_set_pcmcia_timing(int sock, u32 mcmem, u32 mcatt, u32 mcio)
+{
+	__raw_writel(mcmem, MCMEM(sock));
+	__raw_writel(mcatt, MCATT(sock));
+	__raw_writel(mcio, MCIO(sock));
+}
+EXPORT_SYMBOL_GPL(pxa_smemc_set_pcmcia_timing);
+
+void pxa_smemc_set_pcmcia_socket(int nr)
+{
+	switch (nr) {
+	case 0:
+		__raw_writel(0, MECR);
+		break;
+	case 1:
+		/*
+		 * We have at least one socket, so set MECR:CIT
+		 * (Card Is There)
+		 */
+		__raw_writel(MECR_CIT, MECR);
+		break;
+	case 2:
+		/* Set CIT and MECR:NOS (Number Of Sockets) */
+		__raw_writel(MECR_CIT | MECR_NOS, MECR);
+		break;
+	}
+}
+EXPORT_SYMBOL_GPL(pxa_smemc_set_pcmcia_socket);
+
 /*
  * Intel PXA2xx internal register mapping.
  *
diff --git a/drivers/pcmcia/pxa2xx_base.c b/drivers/pcmcia/pxa2xx_base.c
index 7cd1375d6087..0ea41f1411e5 100644
--- a/drivers/pcmcia/pxa2xx_base.c
+++ b/drivers/pcmcia/pxa2xx_base.c
@@ -24,11 +24,10 @@
 #include <linux/spinlock.h>
 #include <linux/platform_device.h>
 #include <linux/soc/pxa/cpu.h>
+#include <linux/soc/pxa/smemc.h>
 
-#include <mach/smemc.h>
 #include <asm/io.h>
 #include <asm/irq.h>
-#include <mach/pxa2xx-regs.h>
 #include <asm/mach-types.h>
 
 #include <pcmcia/ss.h>
@@ -113,7 +112,7 @@ static inline u_int pxa2xx_pcmcia_cmd_time(u_int mem_clk_10khz,
 	return (300000 * (pcmcia_mcxx_asst + 1) / mem_clk_10khz);
 }
 
-static int pxa2xx_pcmcia_set_mcmem( int sock, int speed, int clock )
+static uint32_t pxa2xx_pcmcia_mcmem(int sock, int speed, int clock)
 {
 	uint32_t val;
 
@@ -124,12 +123,10 @@ static int pxa2xx_pcmcia_set_mcmem( int sock, int speed, int clock )
 		| ((pxa2xx_mcxx_hold(speed, clock)
 		& MCXX_HOLD_MASK) << MCXX_HOLD_SHIFT);
 
-	__raw_writel(val, MCMEM(sock));
-
-	return 0;
+	return val;
 }
 
-static int pxa2xx_pcmcia_set_mcio( int sock, int speed, int clock )
+static int pxa2xx_pcmcia_mcio(int sock, int speed, int clock)
 {
 	uint32_t val;
 
@@ -140,12 +137,11 @@ static int pxa2xx_pcmcia_set_mcio( int sock, int speed, int clock )
 		| ((pxa2xx_mcxx_hold(speed, clock)
 		& MCXX_HOLD_MASK) << MCXX_HOLD_SHIFT);
 
-	__raw_writel(val, MCIO(sock));
 
-	return 0;
+	return val;
 }
 
-static int pxa2xx_pcmcia_set_mcatt( int sock, int speed, int clock )
+static int pxa2xx_pcmcia_mcatt(int sock, int speed, int clock)
 {
 	uint32_t val;
 
@@ -156,31 +152,26 @@ static int pxa2xx_pcmcia_set_mcatt( int sock, int speed, int clock )
 		| ((pxa2xx_mcxx_hold(speed, clock)
 		& MCXX_HOLD_MASK) << MCXX_HOLD_SHIFT);
 
-	__raw_writel(val, MCATT(sock));
 
-	return 0;
+	return val;
 }
 
-static int pxa2xx_pcmcia_set_mcxx(struct soc_pcmcia_socket *skt, unsigned int clk)
+static int pxa2xx_pcmcia_set_timing(struct soc_pcmcia_socket *skt)
 {
+	unsigned long clk = clk_get_rate(skt->clk) / 10000;
 	struct soc_pcmcia_timing timing;
 	int sock = skt->nr;
 
 	soc_common_pcmcia_get_timing(skt, &timing);
 
-	pxa2xx_pcmcia_set_mcmem(sock, timing.mem, clk);
-	pxa2xx_pcmcia_set_mcatt(sock, timing.attr, clk);
-	pxa2xx_pcmcia_set_mcio(sock, timing.io, clk);
+	pxa_smemc_set_pcmcia_timing(sock,
+		pxa2xx_pcmcia_mcmem(sock, timing.mem, clk),
+		pxa2xx_pcmcia_mcatt(sock, timing.attr, clk),
+		pxa2xx_pcmcia_mcio(sock, timing.io, clk));
 
 	return 0;
 }
 
-static int pxa2xx_pcmcia_set_timing(struct soc_pcmcia_socket *skt)
-{
-	unsigned long clk = clk_get_rate(skt->clk);
-	return pxa2xx_pcmcia_set_mcxx(skt, clk / 10000);
-}
-
 #ifdef CONFIG_CPU_FREQ
 
 static int
@@ -215,18 +206,13 @@ pxa2xx_pcmcia_frequency_change(struct soc_pcmcia_socket *skt,
 
 void pxa2xx_configure_sockets(struct device *dev, struct pcmcia_low_level *ops)
 {
-	/*
-	 * We have at least one socket, so set MECR:CIT
-	 * (Card Is There)
-	 */
-	uint32_t mecr = MECR_CIT;
+	int nr = 1;
 
-	/* Set MECR:NOS (Number Of Sockets) */
 	if ((ops->first + ops->nr) > 1 ||
 	    machine_is_viper() || machine_is_arcom_zeus())
-		mecr |= MECR_NOS;
+		nr = 2;
 
-	__raw_writel(mecr, MECR);
+	pxa_smemc_set_pcmcia_socket(nr);
 }
 EXPORT_SYMBOL(pxa2xx_configure_sockets);
 
diff --git a/include/linux/soc/pxa/smemc.h b/include/linux/soc/pxa/smemc.h
new file mode 100644
index 000000000000..cbf1a2d8af29
--- /dev/null
+++ b/include/linux/soc/pxa/smemc.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __PXA_REGS_H
+#define __PXA_REGS_H
+
+#include <linux/types.h>
+
+void pxa_smemc_set_pcmcia_timing(int sock, u32 mcmem, u32 mcatt, u32 mcio);
+void pxa_smemc_set_pcmcia_socket(int nr);
+
+#endif
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
