Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A3EC677F1
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRTPTYnhCK/U5e/K1eWVqdvzV7x58ETa7KFsn15TKgc=; b=Kw9Aw6uoCaxH9j
	9hPY9uEWXZgI85S6M/+P8ngF5ldUxM8h9jxUYxIDyyb4IH3q+gM2w/Rt/R6gnj4cJU6AiwF0vfWpu
	V/DDMdUTtB8YeOeQiFj5DDRkGCtyIr8JghgJL2MjotNgp2g7L1/h9o52gYPvNf9tQn9gvwJ9PT37G
	JpVvEYtn2KlBvpzl1UiNyfcYzCR86x/VVorKh0gLhp842seQ2lzYNEzkBjctaeCd1IG3KRXizeoGF
	2k+dcFMzWHjymAhT7wFhWoO8Xh90o6lyQay5d2zWM08eibNmteIiF2v7rVroJGnkKP4d7PcgtxNV4
	xjGE2FYzFfRju5PVO6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDUt-000mDL-Ge; Fri, 13 Jan 2023 06:25:03 +0000
Received: from [2001:4bb8:181:656b:9509:7d20:8d39:f895] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDU1-000lXq-5b; Fri, 13 Jan 2023 06:24:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 07/22] cpufreq: remove the sh-cpufreq driver
Date: Fri, 13 Jan 2023 07:23:24 +0100
Message-Id: <20230113062339.1909087-8-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
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

Now that arch/sh is removed this driver is dead code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/cpufreq/Kconfig      |  14 ---
 drivers/cpufreq/Makefile     |   1 -
 drivers/cpufreq/sh-cpufreq.c | 175 -----------------------------------
 3 files changed, 190 deletions(-)
 delete mode 100644 drivers/cpufreq/sh-cpufreq.c

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 2a84fc63371e2e..75a7a486308d8c 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -298,20 +298,6 @@ config SPARC_US2E_CPUFREQ
 	  If in doubt, say N.
 endif
 
-if SUPERH
-config SH_CPU_FREQ
-	tristate "SuperH CPU Frequency driver"
-	help
-	  This adds the cpufreq driver for SuperH. Any CPU that supports
-	  clock rate rounding through the clock framework can use this
-	  driver. While it will make the kernel slightly larger, this is
-	  harmless for CPUs that don't support rate rounding. The driver
-	  will also generate a notice in the boot log before disabling
-	  itself if the CPU in question is not capable of rate rounding.
-
-	  If unsure, say N.
-endif
-
 config QORIQ_CPUFREQ
 	tristate "CPU frequency scaling driver for Freescale QorIQ SoCs"
 	depends on OF && COMMON_CLK
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 32a7029e25ed81..9c16e77e3e87c0 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -112,6 +112,5 @@ obj-$(CONFIG_BMIPS_CPUFREQ)		+= bmips-cpufreq.o
 obj-$(CONFIG_IA64_ACPI_CPUFREQ)		+= ia64-acpi-cpufreq.o
 obj-$(CONFIG_LOONGSON2_CPUFREQ)		+= loongson2_cpufreq.o
 obj-$(CONFIG_LOONGSON1_CPUFREQ)		+= loongson1-cpufreq.o
-obj-$(CONFIG_SH_CPU_FREQ)		+= sh-cpufreq.o
 obj-$(CONFIG_SPARC_US2E_CPUFREQ)	+= sparc-us2e-cpufreq.o
 obj-$(CONFIG_SPARC_US3_CPUFREQ)		+= sparc-us3-cpufreq.o
diff --git a/drivers/cpufreq/sh-cpufreq.c b/drivers/cpufreq/sh-cpufreq.c
deleted file mode 100644
index b8704232c27b24..00000000000000
--- a/drivers/cpufreq/sh-cpufreq.c
+++ /dev/null
@@ -1,175 +0,0 @@
-/*
- * cpufreq driver for the SuperH processors.
- *
- * Copyright (C) 2002 - 2012 Paul Mundt
- * Copyright (C) 2002 M. R. Brown
- *
- * Clock framework bits from arch/avr32/mach-at32ap/cpufreq.c
- *
- *   Copyright (C) 2004-2007 Atmel Corporation
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- */
-#define pr_fmt(fmt) "cpufreq: " fmt
-
-#include <linux/types.h>
-#include <linux/cpufreq.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/err.h>
-#include <linux/cpumask.h>
-#include <linux/cpu.h>
-#include <linux/smp.h>
-#include <linux/clk.h>
-#include <linux/percpu.h>
-#include <linux/sh_clk.h>
-
-static DEFINE_PER_CPU(struct clk, sh_cpuclk);
-
-struct cpufreq_target {
-	struct cpufreq_policy	*policy;
-	unsigned int		freq;
-};
-
-static unsigned int sh_cpufreq_get(unsigned int cpu)
-{
-	return (clk_get_rate(&per_cpu(sh_cpuclk, cpu)) + 500) / 1000;
-}
-
-static long __sh_cpufreq_target(void *arg)
-{
-	struct cpufreq_target *target = arg;
-	struct cpufreq_policy *policy = target->policy;
-	int cpu = policy->cpu;
-	struct clk *cpuclk = &per_cpu(sh_cpuclk, cpu);
-	struct cpufreq_freqs freqs;
-	struct device *dev;
-	long freq;
-
-	if (smp_processor_id() != cpu)
-		return -ENODEV;
-
-	dev = get_cpu_device(cpu);
-
-	/* Convert target_freq from kHz to Hz */
-	freq = clk_round_rate(cpuclk, target->freq * 1000);
-
-	if (freq < (policy->min * 1000) || freq > (policy->max * 1000))
-		return -EINVAL;
-
-	dev_dbg(dev, "requested frequency %u Hz\n", target->freq * 1000);
-
-	freqs.old	= sh_cpufreq_get(cpu);
-	freqs.new	= (freq + 500) / 1000;
-	freqs.flags	= 0;
-
-	cpufreq_freq_transition_begin(target->policy, &freqs);
-	clk_set_rate(cpuclk, freq);
-	cpufreq_freq_transition_end(target->policy, &freqs, 0);
-
-	dev_dbg(dev, "set frequency %lu Hz\n", freq);
-	return 0;
-}
-
-/*
- * Here we notify other drivers of the proposed change and the final change.
- */
-static int sh_cpufreq_target(struct cpufreq_policy *policy,
-			     unsigned int target_freq,
-			     unsigned int relation)
-{
-	struct cpufreq_target data = { .policy = policy, .freq = target_freq };
-
-	return work_on_cpu(policy->cpu, __sh_cpufreq_target, &data);
-}
-
-static int sh_cpufreq_verify(struct cpufreq_policy_data *policy)
-{
-	struct clk *cpuclk = &per_cpu(sh_cpuclk, policy->cpu);
-	struct cpufreq_frequency_table *freq_table;
-
-	freq_table = cpuclk->nr_freqs ? cpuclk->freq_table : NULL;
-	if (freq_table)
-		return cpufreq_frequency_table_verify(policy, freq_table);
-
-	cpufreq_verify_within_cpu_limits(policy);
-
-	policy->min = (clk_round_rate(cpuclk, 1) + 500) / 1000;
-	policy->max = (clk_round_rate(cpuclk, ~0UL) + 500) / 1000;
-
-	cpufreq_verify_within_cpu_limits(policy);
-	return 0;
-}
-
-static int sh_cpufreq_cpu_init(struct cpufreq_policy *policy)
-{
-	unsigned int cpu = policy->cpu;
-	struct clk *cpuclk = &per_cpu(sh_cpuclk, cpu);
-	struct cpufreq_frequency_table *freq_table;
-	struct device *dev;
-
-	dev = get_cpu_device(cpu);
-
-	cpuclk = clk_get(dev, "cpu_clk");
-	if (IS_ERR(cpuclk)) {
-		dev_err(dev, "couldn't get CPU clk\n");
-		return PTR_ERR(cpuclk);
-	}
-
-	freq_table = cpuclk->nr_freqs ? cpuclk->freq_table : NULL;
-	if (freq_table) {
-		policy->freq_table = freq_table;
-	} else {
-		dev_notice(dev, "no frequency table found, falling back "
-			   "to rate rounding.\n");
-
-		policy->min = policy->cpuinfo.min_freq =
-			(clk_round_rate(cpuclk, 1) + 500) / 1000;
-		policy->max = policy->cpuinfo.max_freq =
-			(clk_round_rate(cpuclk, ~0UL) + 500) / 1000;
-	}
-
-	return 0;
-}
-
-static int sh_cpufreq_cpu_exit(struct cpufreq_policy *policy)
-{
-	unsigned int cpu = policy->cpu;
-	struct clk *cpuclk = &per_cpu(sh_cpuclk, cpu);
-
-	clk_put(cpuclk);
-
-	return 0;
-}
-
-static struct cpufreq_driver sh_cpufreq_driver = {
-	.name		= "sh",
-	.flags		= CPUFREQ_NO_AUTO_DYNAMIC_SWITCHING,
-	.get		= sh_cpufreq_get,
-	.target		= sh_cpufreq_target,
-	.verify		= sh_cpufreq_verify,
-	.init		= sh_cpufreq_cpu_init,
-	.exit		= sh_cpufreq_cpu_exit,
-	.attr		= cpufreq_generic_attr,
-};
-
-static int __init sh_cpufreq_module_init(void)
-{
-	pr_notice("SuperH CPU frequency driver.\n");
-	return cpufreq_register_driver(&sh_cpufreq_driver);
-}
-
-static void __exit sh_cpufreq_module_exit(void)
-{
-	cpufreq_unregister_driver(&sh_cpufreq_driver);
-}
-
-module_init(sh_cpufreq_module_init);
-module_exit(sh_cpufreq_module_exit);
-
-MODULE_AUTHOR("Paul Mundt <lethal@linux-sh.org>");
-MODULE_DESCRIPTION("cpufreq driver for SuperH");
-MODULE_LICENSE("GPL");
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
