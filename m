Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZMHq-0007YX-M0
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 17:34:46 +0000
Received: by mail-wm0-x22e.google.com with SMTP id g62so79596717wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 09:34:22 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 dan.j.williams@intel.com, linux@arm.linux.org.uk
Cc: robert.jarzmik@free.fr,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH v2 2/3] memremap: add arch specific hook for MEMREMAP_WB
 mappings
Date: Fri, 26 Feb 2016 18:34:12 +0100
Message-Id: <1456508053-15015-3-git-send-email-ard.biesheuvel@linaro.org>
In-Reply-To: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
References: <1456508053-15015-1-git-send-email-ard.biesheuvel@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, the memremap code serves MEMREMAP_WB mappings directly from
the kernel direct mapping, unless the region is in high memory, in which
case it falls back to using ioremap_cache(). However, the semantics of
ioremap_cache() are not unambiguously defined, and on ARM, it will
actually result in a mapping type that differs from the attributes used
for the linear mapping, and for this reason, the ioremap_cache() call
fails if the region is part of the memory managed by the kernel.

So instead, implement an optional hook 'arch_memremap_wb' whose default
implementation calls ioremap_cache() as before, but which can be
overridden by the architecture to do what is appropriate for it.

Acked-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 kernel/memremap.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/kernel/memremap.c b/kernel/memremap.c
index 7a1b5c3ef14e..77c41648ba16 100644
--- a/kernel/memremap.c
+++ b/kernel/memremap.c
@@ -27,6 +27,13 @@ __weak void __iomem *ioremap_cache(resource_size_t offset, unsigned long size)
 }
 #endif
 
+#ifndef arch_memremap_wb
+static void *arch_memremap_wb(resource_size_t offset, unsigned long size)
+{
+	return (__force void *)ioremap_cache(offset, size);
+}
+#endif
+
 static void *try_ram_remap(resource_size_t offset, size_t size)
 {
 	struct page *page = pfn_to_page(offset >> PAGE_SHIFT);
@@ -34,7 +41,7 @@ static void *try_ram_remap(resource_size_t offset, size_t size)
 	/* In the simple case just return the existing linear address */
 	if (!PageHighMem(page))
 		return __va(offset);
-	return NULL; /* fallback to ioremap_cache */
+	return arch_memremap_wb(offset, size);
 }
 
 /**
@@ -80,8 +87,6 @@ void *memremap(resource_size_t offset, size_t size, unsigned long flags)
 		 */
 		if (is_ram == REGION_INTERSECTS)
 			addr = try_ram_remap(offset, size);
-		if (!addr)
-			addr = ioremap_cache(offset, size);
 	}
 
 	/*
-- 
2.5.0
