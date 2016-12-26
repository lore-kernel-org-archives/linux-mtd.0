From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux@armlinux.org.uk,
 nicolas.pitre@linaro.org, panand@redhat.com, chris.brandt@renesas.com,
 arnd@arndb.de, jonathan.austin@arm.com, pawel.moll@arm.com,
 vladimir.murzin@arm.com, mark.rutland@arm.com, ard.biesheuvel@linaro.org,
 keescook@chromium.org, matt@codeblueprint.co.uk, labbott@fedoraproject.org,
 kirill.shutemov@linux.intel.com, ben@decadent.org.uk, js07.lee@samsung.com,
 stefan@agner.ch, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, cyrille.pitchen@atmel.com, richard@nod.at,
 boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: [PATCH v4 2/4] ARM: Define KERNEL_START and KERNEL_END
Date: Mon, 26 Dec 2016 12:38:40 -0800
Message-Id: <20161226203842.19457-3-f.fainelli@gmail.com>
In-Reply-To: <20161226203842.19457-1-f.fainelli@gmail.com>
References: <20161209233628.6642-1-f.fainelli@gmail.com>
 <20161226203842.19457-1-f.fainelli@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In preparation for adding CONFIG_DEBUG_VIRTUAL support, define a set of
common constants: KERNEL_START and KERNEL_END which abstract
CONFIG_XIP_KERNEL vs. !CONFIG_XIP_KERNEL. Update the code where
relevant.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/arm/include/asm/memory.h | 7 +++++++
 arch/arm/mm/init.c            | 7 ++-----
 arch/arm/mm/mmu.c             | 6 +-----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
index 76cbd9c674df..bee7511c5098 100644
--- a/arch/arm/include/asm/memory.h
+++ b/arch/arm/include/asm/memory.h
@@ -111,6 +111,13 @@
 
 #endif /* !CONFIG_MMU */
 
+#ifdef CONFIG_XIP_KERNEL
+#define KERNEL_START		_sdata
+#else
+#define KERNEL_START		_stext
+#endif
+#define KERNEL_END		_end
+
 /*
  * We fix the TCM memories max 32 KiB ITCM resp DTCM at these
  * locations
diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
index 370581aeb871..c87d0d5b65f2 100644
--- a/arch/arm/mm/init.c
+++ b/arch/arm/mm/init.c
@@ -230,11 +230,8 @@ phys_addr_t __init arm_memblock_steal(phys_addr_t size, phys_addr_t align)
 void __init arm_memblock_init(const struct machine_desc *mdesc)
 {
 	/* Register the kernel text, kernel data and initrd with memblock. */
-#ifdef CONFIG_XIP_KERNEL
-	memblock_reserve(__pa(_sdata), _end - _sdata);
-#else
-	memblock_reserve(__pa(_stext), _end - _stext);
-#endif
+	memblock_reserve(__pa(KERNEL_START), _end - KERNEL_START);
+
 #ifdef CONFIG_BLK_DEV_INITRD
 	/* FDT scan will populate initrd_start */
 	if (initrd_start && !phys_initrd_size) {
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index 4001dd15818d..f0fd1a2db036 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -1437,11 +1437,7 @@ static void __init kmap_init(void)
 static void __init map_lowmem(void)
 {
 	struct memblock_region *reg;
-#ifdef CONFIG_XIP_KERNEL
-	phys_addr_t kernel_x_start = round_down(__pa(_sdata), SECTION_SIZE);
-#else
-	phys_addr_t kernel_x_start = round_down(__pa(_stext), SECTION_SIZE);
-#endif
+	phys_addr_t kernel_x_start = round_down(__pa(KERNEL_START), SECTION_SIZE);
 	phys_addr_t kernel_x_end = round_up(__pa(__init_end), SECTION_SIZE);
 
 	/* Map all the lowmem memory banks. */
-- 
2.9.3
