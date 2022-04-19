Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2963C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmMi3nShf8yXGSYm8LwS+JjiY7yRk9TgH5bmq4gWl48=; b=E2XGM40V3NZxsY
	fgzzq+OZw4OscB2+mMgifxsz2l79SEMYJLKaPymorafRQhPq9Bc7AmqN6C2Xk/U3lZ3aB1VKchkU9
	+4xt/iXjV6AJPaQ+NM7QC9+q8D05My5t2tPV+xtO6jY5q9XGt6O+KlFWWrqLY2ohG002+RdP0fJqR
	rJ9UVT7XW1y4S2Nw4aFDtp9m/88XN4reHHljXL2z06FO69c0OPOReqrn1Yjte3ZuLtG4RsD5Jg5DF
	21PG70npvJ95zNpEDOVa0gHyRx+UFQBEdP/MhiHT/5flWcGYRglrLyldjbeWalACJcg8wnBgTNTfq
	ggDv0K1OXRDrIW+DVOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrV9-005F50-5c; Tue, 19 Apr 2022 17:18:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqwp-004yEP-6G; Tue, 19 Apr 2022 16:43:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A12661874;
 Tue, 19 Apr 2022 16:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A3AC385AE;
 Tue, 19 Apr 2022 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386605;
 bh=jVLr/dnEKwuj3c1vrZ91YoCk9HDGqp70ixnIySjnCzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mWT14rZK6S8SuCBdSeUZzPrc9E19Tfk5z+4e9Xxz5EV84KlZjRCrsV4OOzxS7dHS6
 4iexBwIyE7R2Bpu6+i2RCf1afkBlvNseI9hOFpc1KtSAzBYh231hgSqMVDhA681sMd
 tSc90K1WjgKGfBNbN2rCf9UAT41xofayQcYjRr5RlfcxKZzE9DwCXzhkkSatqU7rJA
 Txl8iVGB3rULKEKOFMBXqDJviTOWOEw+/wfcvwIbK1jtrAzCoSC461ZPz5HedxyzbB
 zEfwanqzKNV6A15RBOC7RVLcka+KDcF2taZlmtRD7tt/hSaNrcpYJnLCOHouG9UN5P
 xWRdDk2j4rGQQ==
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
Subject: [PATCH 35/48] ARM: pxa: remove get_clk_frequency_khz()
Date: Tue, 19 Apr 2022 18:37:57 +0200
Message-Id: <20220419163810.2118169-36-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094327_375674_6FC10050 
X-CRM114-Status: GOOD (  19.47  )
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

get_clk_frequency_khz() is not a proper name for a global function,
and there is only one caller.

Convert viper to use the properly namespaced
pxa25x_get_clk_frequency_khz() and remove the other references.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.c      | 15 ---------------
 arch/arm/mach-pxa/generic.h      |  1 -
 arch/arm/mach-pxa/viper.c        |  2 +-
 drivers/cpufreq/pxa2xx-cpufreq.c |  2 --
 4 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/arch/arm/mach-pxa/generic.c b/arch/arm/mach-pxa/generic.c
index fe1d55d328e5..2c2c82fcf9cb 100644
--- a/arch/arm/mach-pxa/generic.c
+++ b/arch/arm/mach-pxa/generic.c
@@ -55,21 +55,6 @@ void __init pxa_timer_init(void)
 	pxa_timer_nodt_init(IRQ_OST0, io_p2v(0x40a00000));
 }
 
-/*
- * Get the clock frequency as reflected by CCCR and the turbo flag.
- * We assume these values have been applied via a fcs.
- * If info is not 0 we also display the current settings.
- */
-unsigned int get_clk_frequency_khz(int info)
-{
-	if (cpu_is_pxa25x())
-		return pxa25x_get_clk_frequency_khz(info);
-	else if (cpu_is_pxa27x())
-		return pxa27x_get_clk_frequency_khz(info);
-	return 0;
-}
-EXPORT_SYMBOL(get_clk_frequency_khz);
-
 void pxa_smemc_set_pcmcia_timing(int sock, u32 mcmem, u32 mcatt, u32 mcio)
 {
 	__raw_writel(mcmem, MCMEM(sock));
diff --git a/arch/arm/mach-pxa/generic.h b/arch/arm/mach-pxa/generic.h
index 67925d3ea026..2f706ef97357 100644
--- a/arch/arm/mach-pxa/generic.h
+++ b/arch/arm/mach-pxa/generic.h
@@ -11,7 +11,6 @@
 
 struct irq_data;
 
-extern unsigned int get_clk_frequency_khz(int info);
 extern void __init pxa_dt_irq_init(int (*fn)(struct irq_data *,
 					     unsigned int));
 extern void __init pxa_map_io(void);
diff --git a/arch/arm/mach-pxa/viper.c b/arch/arm/mach-pxa/viper.c
index 600d9e80b00c..0782f0ed5a6e 100644
--- a/arch/arm/mach-pxa/viper.c
+++ b/arch/arm/mach-pxa/viper.c
@@ -851,7 +851,7 @@ static void __init viper_init_vcore_gpios(void)
 		goto err_dir;
 
 	/* c/should assume redboot set the correct level ??? */
-	viper_set_core_cpu_voltage(get_clk_frequency_khz(0), 1);
+	viper_set_core_cpu_voltage(pxa25x_get_clk_frequency_khz(0), 1);
 
 	return;
 
diff --git a/drivers/cpufreq/pxa2xx-cpufreq.c b/drivers/cpufreq/pxa2xx-cpufreq.c
index 0f0e676ff781..e74d36d6f78d 100644
--- a/drivers/cpufreq/pxa2xx-cpufreq.c
+++ b/drivers/cpufreq/pxa2xx-cpufreq.c
@@ -107,8 +107,6 @@ static struct pxa_freqs pxa27x_freqs[] = {
 static struct cpufreq_frequency_table
 	pxa27x_freq_table[NUM_PXA27x_FREQS+1];
 
-extern unsigned get_clk_frequency_khz(int info);
-
 #ifdef CONFIG_REGULATOR
 
 static int pxa_cpufreq_change_voltage(const struct pxa_freqs *pxa_freq)
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
