Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abmMI-0001ZW-6i
 for linux-mtd@lists.infradead.org; Fri, 04 Mar 2016 09:49:20 +0000
Received: by mail-wm0-x234.google.com with SMTP id l68so22439496wml.1
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 01:48:57 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux@arm.linux.org.uk, dan.j.williams@intel.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, robert.jarzmik@free.fr,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH v3 1/4] ARM: reintroduce ioremap_cached() for creating cached
 I/O mappings
Date: Fri,  4 Mar 2016 10:48:45 +0100
Message-Id: <1457084928-21179-2-git-send-email-ard.biesheuvel@linaro.org>
In-Reply-To: <1457084928-21179-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1457084928-21179-1-git-send-email-ard.biesheuvel@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The original ARM-only ioremap flavor 'ioremap_cached' has been renamed
to 'ioremap_cache' to align with other architectures, and subsequently
abused in generic code to map things like firmware tables in memory.
For that reason, there is currently an effort underway to deprecate
ioremap_cache, whose semantics are poorly defined, and which is typed
with an __iomem annotation that is inappropriate for mappings of ordinary
memory.

However, original users of ioremap_cached() used it in a context where
the I/O connotation is appropriate, and replacing those instances with
memremap() does not make sense. So let's revive ioremap_cached(), so
that we can change back those original users before we drop ioremap_cache
entirely in favor of memremap.

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm/include/asm/io.h | 6 ++++++
 arch/arm/mm/ioremap.c     | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index 485982084fe9..fb94de290edd 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -395,6 +395,12 @@ void __iomem *ioremap(resource_size_t res_cookie, size_t size);
 void __iomem *ioremap_cache(resource_size_t res_cookie, size_t size);
 #define ioremap_cache ioremap_cache
 
+/*
+ * Do not use ioremap_cached in new code. Provided for the benefit of
+ * the pxa2xx-flash MTD driver only.
+ */
+void __iomem *ioremap_cached(resource_size_t res_cookie, size_t size);
+
 void __iomem *ioremap_wc(resource_size_t res_cookie, size_t size);
 #define ioremap_wc ioremap_wc
 #define ioremap_wt ioremap_wc
diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 66a978d05958..d5350f6af089 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -380,11 +380,15 @@ void __iomem *ioremap(resource_size_t res_cookie, size_t size)
 EXPORT_SYMBOL(ioremap);
 
 void __iomem *ioremap_cache(resource_size_t res_cookie, size_t size)
+	__alias(ioremap_cached);
+
+void __iomem *ioremap_cached(resource_size_t res_cookie, size_t size)
 {
 	return arch_ioremap_caller(res_cookie, size, MT_DEVICE_CACHED,
 				   __builtin_return_address(0));
 }
 EXPORT_SYMBOL(ioremap_cache);
+EXPORT_SYMBOL(ioremap_cached);
 
 void __iomem *ioremap_wc(resource_size_t res_cookie, size_t size)
 {
-- 
2.5.0
