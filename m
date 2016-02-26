Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZMHs-0007Zn-30
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 17:34:47 +0000
Received: by mail-wm0-x234.google.com with SMTP id g62so81529370wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 09:34:23 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 dan.j.williams@intel.com, linux@arm.linux.org.uk
Cc: robert.jarzmik@free.fr, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH v2 3/3] ARM: memremap: implement arch_memremap_wb()
Date: Fri, 26 Feb 2016 18:34:13 +0100
Message-Id: <1456508053-15015-4-git-send-email-ard.biesheuvel@linaro.org>
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

The generic memremap() falls back to using ioremap_cache() to create
MEMREMAP_WB mappings if the requested region is not already covered
by the linear mapping, unless the architecture provides an implementation
of arch_memremap_wb().

Since ioremap_cache() is not appropriate on ARM to map memory with the
same attributes used for the linear mapping, implement arch_memremap_wb()
which does exactly that. Also, relax the WARN() check to allow MT_MEMORY_RW
mappings of pfn_valid() pages.

Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm/include/asm/io.h |  3 +++
 arch/arm/mm/ioremap.c     | 11 +++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index 485982084fe9..7456638e6b3a 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -402,6 +402,9 @@ void __iomem *ioremap_wc(resource_size_t res_cookie, size_t size);
 void iounmap(volatile void __iomem *iomem_cookie);
 #define iounmap iounmap
 
+void *arch_memremap_wb(phys_addr_t phys_addr, size_t size);
+#define arch_memremap_wb arch_memremap_wb
+
 /*
  * io{read,write}{16,32}be() macros
  */
diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 66a978d05958..d3a2b028c614 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -297,9 +297,10 @@ static void __iomem * __arm_ioremap_pfn_caller(unsigned long pfn,
 	}
 
 	/*
-	 * Don't allow RAM to be mapped - this causes problems with ARMv6+
+	 * Don't allow RAM to be mapped with mismatched attributes - this
+	 * causes problems with ARMv6+
 	 */
-	if (WARN_ON(pfn_valid(pfn)))
+	if (WARN_ON(pfn_valid(pfn) && mtype != MT_MEMORY_RW))
 		return NULL;
 
 	area = get_vm_area_caller(size, VM_IOREMAP, caller);
@@ -414,6 +415,12 @@ __arm_ioremap_exec(phys_addr_t phys_addr, size_t size, bool cached)
 			__builtin_return_address(0));
 }
 
+void *arch_memremap_wb(phys_addr_t phys_addr, size_t size)
+{
+	return __arm_ioremap_caller(phys_addr, size, MT_MEMORY_RW,
+			__builtin_return_address(0));
+}
+
 void __iounmap(volatile void __iomem *io_addr)
 {
 	void *addr = (void *)(PAGE_MASK & (unsigned long)io_addr);
-- 
2.5.0
