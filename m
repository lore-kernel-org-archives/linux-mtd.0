Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NTik-0003TI-On
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 09:34:10 +0100
Received: from localhost
	([127.0.0.1] helo=localhost.localdomain ident=dwmw2)
	by passion.cambridge.redhat.com with esmtp (Exim 4.14)
	id 19NTjO-0001Xy-2v
	for linux-mtd@lists.infradead.org; Wed, 04 Jun 2003 09:34:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Message-Id: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 04 Jun 2003 09:34:50 +0100
Content-Type: multipart/mixed; boundary="=-FlnMBrKDg49LyRQ4BH5F"
Subject: Execute in place.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FlnMBrKDg49LyRQ4BH5F
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've done some work on kernel XIP. The basic principle of operation is
that we copy any code which may need to run while the flash chips are in
anything but 'read' mode into RAM, and we disable interrupts while the
chips are busy. During erases, we poll not only for erase completion but
also for pending IRQs. If an IRQ is pending, we suspend the erase
operation, re-enable IRQs and call cond_resched().

The flash driver code is fairly simple, although it wants a little bit
of cleanup and I want to be convinced that the arch-specific bits are
done right before committing it. 

The arch-specific parts are implemented for XScale only so far, but
should be relatively simple to do for new architectures. You need to
ensure that parts of kernel code can be loaded into RAM instead of ROM,
when marked with the '__xipram' attribute, that the udelay() function is
in that section, and also your software TLB handlers if you have them --
or indeed anything else which may be needed in the critical sections of
the flash chip driver. I've reintroduced the get_unaligned() macro to
potentially-unaligned data loads in the critical region, so alignment
fixups do _not_ need to be in RAM. 

You also need to provide suitable xip_cli(), xip_sti(), and
xip_irqpending() functions or macros in include/linux/mtd/xip.h. I
suspect that wants moving to include/asm-$(ARCH)/xip.h or similar.

It's implemented for Intel command set chips only so far; adding similar
support to the other command sets is left as an exercise for the reader.
Two patches attached -- the arch-specific patch to 2.4.19-rmk7-pxa1 to
provide the generic .xipram support, and the patch against MTD CVS to
add the chip support.

Comments welcome.

-- 
dwmw2

--=-FlnMBrKDg49LyRQ4BH5F
Content-Disposition: inline; filename=02-xscale-xipram.patch
Content-Type: text/x-patch; name=02-xscale-xipram.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

diff -uNrp --exclude CVS linux-stage2-cramfs/arch/arm/Makefile linux-stage3-pxaxip/arch/arm/Makefile
--- linux-stage2-cramfs/arch/arm/Makefile	Thu May 15 16:58:44 2003
+++ linux-stage3-pxaxip/arch/arm/Makefile	Fri May 16 22:50:01 2003
@@ -19,7 +19,7 @@ endif
 #CFLAGS		:=$(CFLAGS:-O2=-Os)
 
 ifeq ($(CONFIG_DEBUG_INFO),y)
-CFLAGS		+=-g
+CFLAGS		+=-g -mapcs-frame
 endif
 
 # Select CPU dependent flags.  Note that order of declaration is important;
@@ -278,7 +278,8 @@ vmlinux: arch/arm/vmlinux.lds
 arch/arm/vmlinux.lds: arch/arm/Makefile $(LDSCRIPT) \
 	$(wildcard include/config/cpu/32.h) \
 	$(wildcard include/config/cpu/26.h) \
-	$(wildcard include/config/arch/*.h)
+	$(wildcard include/config/arch/*.h) \
+	$(wildcard include/config/xip/kernel.h)
 	@echo '  Generating $@'
 	@sed 's/TEXTADDR/$(TEXTADDR)/;s/DATAADDR/$(DATAADDR)/' $(LDSCRIPT) >$@
 
diff -uNrp --exclude CVS linux-stage2-cramfs/arch/arm/boot/Makefile linux-stage3-pxaxip/arch/arm/boot/Makefile
--- linux-stage2-cramfs/arch/arm/boot/Makefile	Thu May 15 16:58:44 2003
+++ linux-stage3-pxaxip/arch/arm/boot/Makefile	Fri May 16 22:50:01 2003
@@ -146,10 +146,11 @@ zImage:	compressed/vmlinux
 
 ifeq ($(CONFIG_XIP_KERNEL),y)
 xipImage: $(CONFIGURE) $(SYSTEM)
-	$(OBJCOPY) -S -O binary -R .data $(SYSTEM) vmlinux-text.bin
-	$(OBJCOPY) -S -O binary -R .init -R .text -R __ex_table -R __ksymtab $(SYSTEM) vmlinux-data.bin
-	cat vmlinux-text.bin vmlinux-data.bin > $@
-	$(RM) -f vmlinux-text.bin vmlinux-data.bin
+	$(OBJCOPY) -S -O binary -R .data -R .xipram $(SYSTEM) vmlinux-text.bin
+	$(OBJCOPY) -S -O binary -j .xipram $(SYSTEM) vmlinux-xipram.bin
+	$(OBJCOPY) -S -O binary -j .data $(SYSTEM) vmlinux-data.bin
+	cat vmlinux-text.bin vmlinux-xipram.bin vmlinux-data.bin > $@
+	$(RM) -f vmlinux-text.bin vmlinux-xipram.bin vmlinux-data.bin
 endif
 
 bootpImage: bootp/bootp
diff -uNrp --exclude CVS linux-stage2-cramfs/arch/arm/kernel/head-armv.S linux-stage3-pxaxip/arch/arm/kernel/head-armv.S
--- linux-stage2-cramfs/arch/arm/kernel/head-armv.S	Thu May 15 16:58:44 2003
+++ linux-stage3-pxaxip/arch/arm/kernel/head-armv.S	Fri May 16 22:50:01 2003
@@ -227,7 +227,7 @@ __ret:		ldr	lr, __switch_data
 		.align	5
 __mmap_switched:
 #ifdef CONFIG_XIP_KERNEL
-		ldr	r3, ETEXT			@ data section copy
+		ldr	r3, EXIP			@ data section copy
 		ldr	r4, SDATA
 		ldr	r5, EDATA
 1:
@@ -337,15 +337,29 @@ __create_page_tables:
 
 		mov	r0, #TEXTADDR & 0xff000000
 		add	r0, r0, #TEXTADDR & 0x00f00000	@ virt kernel start
-		add	r0, r4, r0, lsr #18
-		add	r2, r3, #4 << 20		@ kernel + 4MB
 
+		ldr	r2, SXIP
+		sub	r2, r2, #1
+		mov	r2, r2, lsr #20
+		mov	r2, r2, lsl #20
+		sub	r2, r2, r0			@ length of XIP text
+		
+		add	r2, r2, r3
+		add	r0, r4, r0, lsr #18
 1:
 		str	r3, [r0], #4
 		add	r3, r3, #1 << 20
 		cmp	r3, r2
 		bne	1b
 
+		add	r2, r2, #0x300000		@ xipram and .data
+		sub	r3, r3, #1 << 20		@ one overlapping pgdir
+1:	
+		str	r3, [r0], #4
+		add	r3, r3, #1 << 20
+		cmp	r3, r2
+		bne	1b
+	
 		bic	r3, r4, #0x000ff000		@ ram start
 		add	r0, r4, r3, lsr #18
 		orr	r3, r3, r8
@@ -530,8 +544,8 @@ __lookup_architecture_type:
 
 PGTBL:		.long	SYMBOL_NAME(swapper_pg_dir)
 
-ETEXT:		.long	SYMBOL_NAME(_endtext)
 SDATA:		.long	SYMBOL_NAME(_sdata)
 EDATA:		.long	SYMBOL_NAME(__bss_start)
-
+SXIP:		.long	SYMBOL_NAME(_xipram_start)
+EXIP:		.long	SYMBOL_NAME(_xipram_end)
 #endif
diff -uNrp --exclude CVS linux-stage2-cramfs/arch/arm/kernel/setup.c linux-stage3-pxaxip/arch/arm/kernel/setup.c
--- linux-stage2-cramfs/arch/arm/kernel/setup.c	Thu May 15 16:58:44 2003
+++ linux-stage3-pxaxip/arch/arm/kernel/setup.c	Fri May 16 22:50:01 2003
@@ -56,7 +56,8 @@ extern void reboot_setup(char *str);
 extern int root_mountflags;
 extern int _stext, _text, _etext, _edata, _end;
 #ifdef CONFIG_XIP_KERNEL
-extern int _endtext, _sdata;
+extern int _sdata;
+extern char _xipram_start, _xipram_end, _romend;
 #endif
 
 
@@ -371,6 +372,24 @@ void __init setup_initrd(unsigned int st
 #endif
 }
 
+#ifdef CONFIG_XIP_KERNEL
+extern char _xipram_start, xipram_end;
+char *xipram_copy;
+
+static void __init setup_xipram(void)
+{
+	unsigned long xipram_len = &_xipram_end-&_xipram_start;
+	xipram_copy = alloc_bootmem_pages(xipram_len);
+
+	memcpy(xipram_copy, &_romend, &_xipram_end-&_xipram_start);
+
+	init_mm.start_code = (unsigned long) xipram_copy;
+	init_mm.end_code   = (unsigned long) xipram_copy + xipram_len;
+	init_mm.start_data   = (unsigned long) &_sdata;
+
+}
+#endif
+
 static void __init
 request_standard_resources(struct meminfo *mi, struct machine_desc *mdesc)
 {
@@ -379,11 +398,7 @@ request_standard_resources(struct meminf
 
 	kernel_code.start  = __virt_to_phys(init_mm.start_code);
 	kernel_code.end    = __virt_to_phys(init_mm.end_code - 1);
-#ifndef CONFIG_XIP_KERNEL
-	kernel_data.start  = __virt_to_phys(init_mm.end_code);
-#else
 	kernel_data.start  = __virt_to_phys(init_mm.start_data);
-#endif
 	kernel_data.end    = __virt_to_phys(init_mm.brk - 1);
 
 	for (i = 0; i < mi->nr_banks; i++) {
@@ -641,13 +656,11 @@ void __init setup_arch(char **cmdline_p)
 		meminfo.bank[0].size  = MEM_SIZE;
 	}
 
+	/* These three get overwritten by setup_xipram() if appropriate */
 	init_mm.start_code = (unsigned long) &_text;
-#ifndef CONFIG_XIP_KERNEL
 	init_mm.end_code   = (unsigned long) &_etext;
-#else
-	init_mm.end_code   = (unsigned long) &_endtext;
-	init_mm.start_data   = (unsigned long) &_sdata;
-#endif
+	init_mm.start_data = (unsigned long) &_etext;
+	
 	init_mm.end_data   = (unsigned long) &_edata;
 	init_mm.brk	   = (unsigned long) &_end;
 
@@ -655,6 +668,9 @@ void __init setup_arch(char **cmdline_p)
 	saved_command_line[COMMAND_LINE_SIZE-1] = '\0';
 	parse_cmdline(&meminfo, cmdline_p, from);
 	bootmem_init(&meminfo);
+#ifdef CONFIG_XIP_KERNEL
+	setup_xipram();
+#endif
 	paging_init(&meminfo, mdesc);
 	request_standard_resources(&meminfo, mdesc);
 
diff -uNrp --exclude CVS linux-stage2-cramfs/arch/arm/lib/delay.S linux-stage3-pxaxip/arch/arm/lib/delay.S
--- linux-stage2-cramfs/arch/arm/lib/delay.S	Mon May  5 21:39:59 2003
+++ linux-stage3-pxaxip/arch/arm/lib/delay.S	Fri May 16 22:50:01 2003
@@ -9,7 +9,13 @@
  */
 #include <linux/linkage.h>
 #include <asm/assembler.h>
+#include <linux/config.h>
+
+#ifndef CONFIG_XIP_KERNEL
 		.text
+#else
+		.section ".text.xipram","ax",%progbits
+#endif		
 
 LC0:		.word	SYMBOL_NAME(loops_per_jiffy)
 
diff -uNrp --exclude CVS linux-stage2-cramfs/arch/arm/mm/init.c linux-stage3-pxaxip/arch/arm/mm/init.c
--- linux-stage2-cramfs/arch/arm/mm/init.c	Thu May 15 16:58:44 2003
+++ linux-stage3-pxaxip/arch/arm/mm/init.c	Fri May 16 22:50:01 2003
@@ -52,7 +52,7 @@ static unsigned long totalram_pages;
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 extern char _stext, _text, _etext, _end, __init_begin, __init_end;
 #ifdef CONFIG_XIP_KERNEL
-extern char _endtext, _sdata;
+extern char _endtext, _sdata, _xipram_start, _xipram_end;
 #endif
 extern unsigned long phys_initrd_start;
 extern unsigned long phys_initrd_size;
@@ -612,11 +612,12 @@ void __init mem_init(void)
 #ifndef CONFIG_XIP_KERNEL
 	codepages = &_etext - &_text;
 	datapages = &_end - &_etext;
+	initpages = &__init_end - &__init_begin;
 #else
-	codepages = &_endtext - &_text;
+	codepages = &_xipram_end - &_xipram_start;
 	datapages = &_end - &_sdata;
+	initpages = &_xipram_start - 0x100000 - &_stext;
 #endif
-	initpages = &__init_end - &__init_begin;
 
 	high_memory = (void *)__va(meminfo.end);
 	max_mapnr   = virt_to_page(high_memory) - mem_map;
@@ -653,11 +654,17 @@ void __init mem_init(void)
 	}
 
 	printk(" = %luMB total\n", num_physpages >> (20 - PAGE_SHIFT));
+#ifndef CONFIG_XIP_KERNEL
 	printk(KERN_NOTICE "Memory: %luKB available (%dK code, "
 		"%dK data, %dK init)\n",
 		(unsigned long) nr_free_pages() << (PAGE_SHIFT-10),
 		codepages >> 10, datapages >> 10, initpages >> 10);
-
+#else
+	printk(KERN_NOTICE "Memory: %luKB available (%dK code, "
+		"%dK data, %dK ROM)\n",
+		(unsigned long) nr_free_pages() << (PAGE_SHIFT-10),
+		codepages >> 10, datapages >> 10, initpages >> 10);
+#endif
 	if (PAGE_SIZE >= 16384 && num_physpages <= 128) {
 		extern int sysctl_overcommit_memory;
 		/*
diff -uNrp --exclude CVS linux-stage2-cramfs/arch/arm/mm/mm-armv.c linux-stage3-pxaxip/arch/arm/mm/mm-armv.c
--- linux-stage2-cramfs/arch/arm/mm/mm-armv.c	Thu May 15 16:58:44 2003
+++ linux-stage3-pxaxip/arch/arm/mm/mm-armv.c	Fri May 16 22:50:01 2003
@@ -62,8 +62,9 @@ __setup("nowb", nowrite_setup);
 
 #define clean_cache_area(start,size) \
 	cpu_cache_clean_invalidate_range((unsigned long)start, ((unsigned long)start) + size, 0);
-
-
+#ifdef CONFIG_XIP_KERNEL
+extern char _xipram_start, _xipram_end;
+#endif
 /*
  * need to get a 16k page for level 1
  */
@@ -358,7 +359,7 @@ void __init memtable_init(struct meminfo
 #ifdef CONFIG_XIP_KERNEL
 	p->physical   = KERNEL_XIP_BASE_PHYS;
 	p->virtual    = KERNEL_XIP_BASE_VIRT;
-	p->length     = PGDIR_SIZE * 8;
+	p->length     = (((unsigned long)(&_xipram_end)) & ~(PGDIR_SIZE-1)) - KERNEL_XIP_BASE_VIRT;
 	p->domain     = DOMAIN_KERNEL;
 	p->prot_read  = 0;	/* r=0, b=0 --> read-only for kernel mode */
 	p->prot_write = 0;
@@ -366,7 +367,22 @@ void __init memtable_init(struct meminfo
 	p->bufferable = 1;
 
 	p ++;
-#endif
+
+	if (&_xipram_start != (&_xipram_end)) {
+		extern char *xipram_copy;
+	
+		p->physical   = virt_to_phys(xipram_copy);
+		p->virtual    = &_xipram_start;
+		p->length     = ((&_xipram_end-&_xipram_start) +PAGE_SIZE-1) & PAGE_MASK;
+		p->domain     = DOMAIN_KERNEL;
+		p->prot_read  = 0;	/* r=0, b=0 --> read-only for kernel mode */
+		p->prot_write = 0;
+		p->cacheable  = 1;
+		p->bufferable = 1;
+
+		p ++;
+	}
+#endif /* CONFIG_XIP_KERNEL */
 
 	/*
 	 * Go through the initial mappings, but clear out any
diff -uNrp --exclude CVS linux-stage2-cramfs/arch/arm/vmlinux-armv-xip.lds.in linux-stage3-pxaxip/arch/arm/vmlinux-armv-xip.lds.in
--- linux-stage2-cramfs/arch/arm/vmlinux-armv-xip.lds.in	Thu May 15 16:58:44 2003
+++ linux-stage3-pxaxip/arch/arm/vmlinux-armv-xip.lds.in	Fri May 16 22:50:01 2003
@@ -74,9 +74,23 @@ SECTIONS
 		__start___ksymtab = .;
 			*(__ksymtab)
 		__stop___ksymtab = .;
+
+		. = ALIGN(4096);
 	}
 
-	_endtext = .;
+	_romend = .;
+
+	/* Add 1MiB so that the .xipram functions can be accessed
+	   through a section mapping to start with. */
+	. = . + 0x100000;
+
+	.xipram : {
+		_xipram_start = .;
+
+		*(.text.xipram)
+
+		_xipram_end = .;
+	}
 
 	. = DATAADDR;
 

--=-FlnMBrKDg49LyRQ4BH5F
Content-Disposition: inline; filename=06a-mtdcvs-xip.patch
Content-Type: text/x-patch; name=06a-mtdcvs-xip.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

Index: drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0001.c,v
retrieving revision 1.123
diff -u -p -r1.123 cfi_cmdset_0001.c
--- drivers/mtd/chips/cfi_cmdset_0001.c	28 May 2003 12:51:48 -0000	1.123
+++ drivers/mtd/chips/cfi_cmdset_0001.c	4 Jun 2003 08:11:47 -0000
@@ -24,6 +24,7 @@
 #include <linux/init.h>
 #include <asm/io.h>
 #include <asm/byteorder.h>
+#include <asm/unaligned.h>
 
 #include <linux/errno.h>
 #include <linux/slab.h>
@@ -33,6 +34,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/compatmac.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/xip.h>
 
 // debugging, turns off buffer write mode if set to 1
 #define FORCE_WORD_WRITE 0
@@ -124,7 +126,7 @@ static void cfi_tell_features(struct cfi
  * this module is non-zero, i.e. between inter_module_get and
  * inter_module_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
  */
-struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
+struct mtd_info * __xipram cfi_cmdset_0001(struct map_info *map, int primary)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	int i;
@@ -144,21 +146,25 @@ struct mtd_info *cfi_cmdset_0001(struct 
 		if (!adr)
 			return NULL;
 
-		/* Switch it into Query Mode */
-		cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
-
 		extp = kmalloc(sizeof(*extp), GFP_KERNEL);
 		if (!extp) {
 			printk(KERN_ERR "Failed to allocate memory\n");
 			return NULL;
 		}
+
+		/* Switch it into Query Mode */
+		xip_cli();
+		cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
 		
 		/* Read in the Extended Query Table */
 		for (i=0; i<sizeof(*extp); i++) {
 			((unsigned char *)extp)[i] = 
 				cfi_read_query(map, (base+((adr+i)*ofs_factor)));
 		}
-		
+
+		cfi_send_gen_cmd(0xff, 0x55, base, map, cfi, cfi->device_type, NULL);
+		xip_sti();
+
 		if (extp->MajorVersion != '1' || 
 		    (extp->MinorVersion < '0' || extp->MinorVersion > '3')) {
 			printk(KERN_WARNING "  Unknown IntelExt Extended Query "
@@ -207,7 +213,7 @@ struct mtd_info *cfi_cmdset_0001(struct 
 	return cfi_intelext_setup(map);
 }
 
-static struct mtd_info *cfi_intelext_setup(struct map_info *map)
+static struct mtd_info * cfi_intelext_setup(struct map_info *map)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct mtd_info *mtd;
@@ -308,6 +314,36 @@ static struct mtd_info *cfi_intelext_set
 /*
  *  *********** CHIP ACCESS FUNCTIONS ***********
  */
+#ifdef CONFIG_XIP_KERNEL
+static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
+{
+	while (chip->state != FL_READY) {
+		DECLARE_WAITQUEUE(wait, current);
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&chip->wq, &wait);
+		spin_unlock(chip->mutex);
+		schedule();
+		remove_wait_queue(&chip->wq, &wait);
+		spin_lock(chip->mutex);
+	}
+	/* We _know_ the chip is in FL_READY mode, or we wouldn't be here */
+	return 0;
+}
+
+static void __xipram put_chip(struct map_info *map, struct flchip *chip, unsigned long adr)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	/* We also know there wasn't a command suspended without its 
+	   controlling process knowing about it. */
+	if (chip->state != FL_READY && chip->state != FL_POINT) {
+		cfi_write(map, CMD(0xff), adr);
+		chip->state = FL_READY;
+	}
+	wake_up(&chip->wq);
+}
+
+#else /* !CONFIG_XIP_KERNEL */
 
 static int get_chip(struct map_info *map, struct flchip *chip, unsigned long adr, int mode)
 {
@@ -406,6 +442,7 @@ static int get_chip(struct map_info *map
 		spin_lock(chip->mutex);
 		goto resettime;
 	}
+	/* Not reached */
 }
 
 static void put_chip(struct map_info *map, struct flchip *chip, unsigned long adr)
@@ -439,6 +476,7 @@ static void put_chip(struct map_info *ma
 	}
 	wake_up(&chip->wq);
 }
+#endif /* !CONFIG_XIP_KERNEL */
 
 static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
 {
@@ -627,7 +665,7 @@ static int cfi_intelext_read (struct mtd
 	return ret;
 }
 
-static int cfi_intelext_read_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf, int base_offst, int reg_sz)
+static int __xipram cfi_intelext_read_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf, int base_offst, int reg_sz)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -656,6 +694,7 @@ static int cfi_intelext_read_prot_reg (s
 			return (len-count)?:ret;
 		}
 
+		xip_cli();
 		if (chip->state != FL_JEDEC_QUERY) {
 			cfi_write(map, CMD(0x90), chip->start);
 			chip->state = FL_JEDEC_QUERY;
@@ -669,6 +708,7 @@ static int cfi_intelext_read_prot_reg (s
 		}
 
 		put_chip(map, chip, chip->start);
+		xip_sti();
 		spin_unlock(chip->mutex);
 
 		/* Move on to the next chip */
@@ -719,7 +759,7 @@ static int cfi_intelext_read_fact_prot_r
 }
 
 
-static int do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, cfi_word datum)
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, cfi_word datum)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	cfi_word status, status_OK;
@@ -739,6 +779,7 @@ static int do_write_oneword(struct map_i
 	}
 
 	ENABLE_VPP(map);
+	xip_cli();
 	cfi_write(map, CMD(0x40), adr);
 	cfi_write(map, datum, adr);
 	chip->state = FL_WRITING;
@@ -750,6 +791,7 @@ static int do_write_oneword(struct map_i
 	timeo = jiffies + (HZ/2);
 	z = 0;
 	for (;;) {
+#ifndef CONFIG_XIP_KERNEL
 		if (chip->state != FL_WRITING) {
 			/* Someone's suspended the write. Sleep */
 			DECLARE_WAITQUEUE(wait, current);
@@ -763,11 +805,12 @@ static int do_write_oneword(struct map_i
 			spin_lock(chip->mutex);
 			continue;
 		}
-
+#endif
 		status = cfi_read(map, adr);
 		if ((status & status_OK) == status_OK)
 			break;
 		
+#ifndef CONFIG_XIP_KERNEL
 		/* OK Still waiting */
 		if (time_after(jiffies, timeo)) {
 			chip->state = FL_STATUS;
@@ -775,7 +818,7 @@ static int do_write_oneword(struct map_i
 			ret = -EIO;
 			goto out;
 		}
-
+#endif
 		/* Latency issues. Drop the lock, wait a while and retry */
 		spin_unlock(chip->mutex);
 		z++;
@@ -802,6 +845,7 @@ static int do_write_oneword(struct map_i
 	}
  out:
 	put_chip(map, chip, adr);
+	xip_sti();
 	spin_unlock(chip->mutex);
 
 	return ret;
@@ -930,7 +974,7 @@ static int cfi_intelext_write_words (str
 }
 
 
-static inline int do_write_buffer(struct map_info *map, struct flchip *chip, 
+static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip, 
 				  unsigned long adr, const u_char *buf, int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
@@ -952,6 +996,8 @@ static inline int do_write_buffer(struct
 		return ret;
 	}
 
+	ENABLE_VPP(map);
+	xip_cli();
 	if (chip->state != FL_STATUS)
 		cfi_write(map, CMD(0x70), cmd_adr);
 
@@ -962,11 +1008,14 @@ static inline int do_write_buffer(struct
 	   So we must check here and reset those bits if they're set. Otherwise
 	   we're just pissing in the wind */
 	if (status & CMD(0x30)) {
+#ifdef CONFIG_XIP_KERNEL
+		cfi_write(map, CMD(0xFF), cmd_adr);
+#endif
 		printk(KERN_WARNING "SR.4 or SR.5 bits set in buffer write (status %x). Clearing.\n", status);
 		cfi_write(map, CMD(0x50), cmd_adr);
 		cfi_write(map, CMD(0x70), cmd_adr);
 	}
-	ENABLE_VPP(map);
+
 	chip->state = FL_WRITING_TO_BUFFER;
 
 	z = 0;
@@ -982,10 +1031,13 @@ static inline int do_write_buffer(struct
 		spin_lock(chip->mutex);
 
 		if (++z > 20) {
+			cfi_word status2;
 			/* Argh. Not ready for write to buffer */
 			cfi_write(map, CMD(0x70), cmd_adr);
-			chip->state = FL_STATUS;
-			printk(KERN_ERR "Chip not ready for buffer write. Xstatus = %llx, status = %llx\n", (__u64)status, (__u64)cfi_read(map, cmd_adr));
+			status2 = cfi_read(map, cmd_adr);
+			cfi_write(map, CMD(0xFF), cmd_adr);
+			chip->state = FL_READY;
+			printk(KERN_ERR "Chip not ready for buffer write. Xstatus = %llx, status = %llx\n", (__u64)status, (__u64)status2);
 			/* Odd. Clear status bits */
 			cfi_write(map, CMD(0x50), cmd_adr);
 			cfi_write(map, CMD(0x70), cmd_adr);
@@ -1002,11 +1054,11 @@ static inline int do_write_buffer(struct
 		if (cfi_buswidth_is_1()) {
 			map_write8 (map, *((__u8*)buf)++, adr+z);
 		} else if (cfi_buswidth_is_2()) {
-			map_write16 (map, *((__u16*)buf)++, adr+z);
+			map_write16 (map, get_unaligned(((__u16*)buf)++), adr+z);
 		} else if (cfi_buswidth_is_4()) {
-			map_write32 (map, *((__u32*)buf)++, adr+z);
+			map_write32 (map, get_unaligned(((__u32*)buf)++), adr+z);
 		} else if (cfi_buswidth_is_8()) {
-			map_write64 (map, *((__u64*)buf)++, adr+z);
+			map_write64 (map, get_unaligned(((__u64*)buf)++), adr+z);
 		} else {
 			ret = -EINVAL;
 			goto out;
@@ -1023,6 +1075,7 @@ static inline int do_write_buffer(struct
 	timeo = jiffies + (HZ/2);
 	z = 0;
 	for (;;) {
+#ifndef CONFIG_XIP_KERNEL
 		if (chip->state != FL_WRITING) {
 			/* Someone's suspended the write. Sleep */
 			DECLARE_WAITQUEUE(wait, current);
@@ -1035,11 +1088,12 @@ static inline int do_write_buffer(struct
 			spin_lock(chip->mutex);
 			continue;
 		}
-
+#endif
 		status = cfi_read(map, cmd_adr);
 		if ((status & status_OK) == status_OK)
 			break;
 
+#ifndef CONFIG_XIP_KERNEL
 		/* OK Still waiting */
 		if (time_after(jiffies, timeo)) {
 			chip->state = FL_STATUS;
@@ -1047,7 +1101,7 @@ static inline int do_write_buffer(struct
 			ret = -EIO;
 			goto out;
 		}
-		
+#endif
 		/* Latency issues. Drop the lock, wait a while and retry */
 		spin_unlock(chip->mutex);
 		cfi_udelay(1);
@@ -1076,6 +1130,7 @@ static inline int do_write_buffer(struct
 
  out:
 	put_chip(map, chip, cmd_adr);
+	xip_sti();
 	spin_unlock(chip->mutex);
 	return ret;
 }
@@ -1248,13 +1303,12 @@ static int cfi_intelext_varsize_frob(str
 }
 
 
-static int do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, void *thunk)
+static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	cfi_word status, status_OK;
 	unsigned long timeo;
 	int retries = 3;
-	DECLARE_WAITQUEUE(wait, current);
 	int ret = 0;
 
 	adr += chip->start;
@@ -1271,6 +1325,7 @@ static int do_erase_oneblock(struct map_
 	}
 
 	ENABLE_VPP(map);
+	xip_cli();
 	/* Clear the status register first */
 	cfi_write(map, CMD(0x50), adr);
 
@@ -1280,17 +1335,20 @@ static int do_erase_oneblock(struct map_
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
 
+#ifndef CONFIG_XIP_KERNEL
 	spin_unlock(chip->mutex);
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	schedule_timeout((chip->erase_time*HZ)/(2*1000));
 	spin_lock(chip->mutex);
-
+#endif
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
 
 	timeo = jiffies + (HZ*20);
 	for (;;) {
+#ifndef CONFIG_XIP_KERNEL
 		if (chip->state != FL_ERASING) {
+			DECLARE_WAITQUEUE(wait, current);
 			/* Someone's suspended the erase. Sleep */
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
@@ -1306,11 +1364,12 @@ static int do_erase_oneblock(struct map_
 			timeo = jiffies + (HZ*20); /* FIXME */
 			chip->erase_suspended = 0;
 		}
-
+#endif
 		status = cfi_read(map, adr);
 		if ((status & status_OK) == status_OK)
 			break;
-		
+
+#ifndef CONFIG_XIP_KERNEL		
 		/* OK Still waiting */
 		if (time_after(jiffies, timeo)) {
 			cfi_write(map, CMD(0x70), adr);
@@ -1324,12 +1383,29 @@ static int do_erase_oneblock(struct map_
 			spin_unlock(chip->mutex);
 			return -EIO;
 		}
-		
 		/* Latency issues. Drop the lock, wait a while and retry */
 		spin_unlock(chip->mutex);
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		schedule_timeout(1);
 		spin_lock(chip->mutex);
+#else /* XIP */
+		if (xip_irqpending()) {
+			cfi_write(map, CMD(0xB0), adr);
+			cfi_write(map, CMD(0x70), adr);
+			for (;;) {
+				status = cfi_read(map, adr);
+				if ((status & status_OK) == status_OK)
+					break;
+			}
+			cfi_write(map, CMD(0xFF), adr);
+			xip_sti();
+//			printk("IRQ was pending. Erase suspended\n");
+			cond_resched();
+			xip_cli();
+			cfi_write(map, CMD(0xd0), adr);
+			cfi_write(map, CMD(0x70), adr);
+		}
+#endif /* XIP */
 	}
 	
 	DISABLE_VPP(map);
@@ -1340,6 +1416,9 @@ static int do_erase_oneblock(struct map_
 	chip->state = FL_STATUS;
 	status = cfi_read(map, adr);
 
+#ifdef CONFIG_XIP_KERNEL
+	cfi_write(map, CMD(0xFF), adr);
+#endif
 	/* check for lock bit */
 	if (status & CMD(0x3a)) {
 		unsigned char chipstatus = status;
@@ -1377,8 +1456,10 @@ static int do_erase_oneblock(struct map_
 		}
 	}
 
-	wake_up(&chip->wq);
+	put_chip(map, chip, adr);
 	spin_unlock(chip->mutex);
+	xip_sti();
+	DISABLE_VPP(map);
 	return ret;
 }
 
@@ -1445,11 +1526,17 @@ static int do_printlockstatus_oneblock(s
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	int ofs_factor = cfi->interleave * cfi->device_type;
+	int d;
 
+	xip_cli();
 	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
-	printk(KERN_DEBUG "block status register for 0x%08lx is %x\n",
-	       adr, cfi_read_query(map, adr+(2*ofs_factor)));
+	d = cfi_read_query(map, adr+(2*ofs_factor));
+
 	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	xip_sti();
+
+	printk(KERN_DEBUG "block status register for 0x%08lx is %x\n",
+	       adr, d);
 	
 	return 0;
 }
@@ -1478,6 +1565,7 @@ static int do_xxlock_oneblock(struct map
 	}
 
 	ENABLE_VPP(map);
+	xip_cli();
 	cfi_write(map, CMD(0x60), adr);
 
 	if (thunk == DO_XXLOCK_ONEBLOCK_LOCK) {
@@ -1489,10 +1577,11 @@ static int do_xxlock_oneblock(struct map
 	} else
 		BUG();
 
+#ifndef CONFIG_XIP_KERNEL
 	spin_unlock(chip->mutex);
 	schedule_timeout(HZ);
 	spin_lock(chip->mutex);
-
+#endif
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
 
@@ -1502,7 +1591,8 @@ static int do_xxlock_oneblock(struct map
 		status = cfi_read(map, adr);
 		if ((status & status_OK) == status_OK)
 			break;
-		
+
+#ifndef CONFIG_XIP_KERNEL		
 		/* OK Still waiting */
 		if (time_after(jiffies, timeo)) {
 			cfi_write(map, CMD(0x70), adr);
@@ -1512,7 +1602,7 @@ static int do_xxlock_oneblock(struct map
 			spin_unlock(chip->mutex);
 			return -EIO;
 		}
-		
+#endif		
 		/* Latency issues. Drop the lock, wait a while and retry */
 		spin_unlock(chip->mutex);
 		cfi_udelay(1);
@@ -1523,6 +1613,7 @@ static int do_xxlock_oneblock(struct map
 	chip->state = FL_STATUS;
 	put_chip(map, chip, adr);
 	spin_unlock(chip->mutex);
+	xip_sti();
 	return 0;
 }
 
Index: drivers/mtd/chips/cfi_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_probe.c,v
retrieving revision 1.71
diff -u -p -r1.71 cfi_probe.c
--- drivers/mtd/chips/cfi_probe.c	28 May 2003 12:51:48 -0000	1.71
+++ drivers/mtd/chips/cfi_probe.c	4 Jun 2003 08:11:47 -0000
@@ -17,6 +17,7 @@
 
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/xip.h>
 #include <linux/mtd/gen_probe.h>
 
 //#define DEBUG_CFI 
@@ -25,9 +26,9 @@
 static void print_cfi_ident(struct cfi_ident *);
 #endif
 
-static int cfi_probe_chip(struct map_info *map, __u32 base,
+static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 			  struct flchip *chips, struct cfi_private *cfi);
-static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
+static int __xipram cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
 
 struct mtd_info *cfi_probe(struct map_info *map);
 
@@ -35,7 +36,7 @@ struct mtd_info *cfi_probe(struct map_in
    in: interleave,type,mode
    ret: table index, <0 for error
  */
-static inline int qry_present(struct map_info *map, __u32 base,
+static inline int __xipram qry_present(struct map_info *map, __u32 base,
 				struct cfi_private *cfi)
 {
 	int osf = cfi->interleave * cfi->device_type;	// scale factor
@@ -48,7 +49,7 @@ static inline int qry_present(struct map
 	return 0; 	// nothing found
 }
 
-static int cfi_probe_chip(struct map_info *map, __u32 base,
+static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 			  struct flchip *chips, struct cfi_private *cfi)
 {
 	int i;
@@ -66,10 +67,13 @@ static int cfi_probe_chip(struct map_inf
 		return 0;
 	}
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+	xip_cli();
 	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
 
-	if (!qry_present(map,base,cfi))
+	if (!qry_present(map,base,cfi)) {
+		xip_sti();
 		return 0;
+	}
 
 	if (!cfi->numchips) {
 		/* This is the first time we're called. Set up the CFI 
@@ -88,6 +92,7 @@ static int cfi_probe_chip(struct map_inf
 
 			/* If the QRY marker goes away, it's an alias */
 			if (!qry_present(map, chips[i].start, cfi)) {
+				xip_sti();
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
 				       map->name, base, chips[i].start);
 				return 0;
@@ -99,26 +104,27 @@ static int cfi_probe_chip(struct map_inf
 			cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 			
 			if (qry_present(map, base, cfi)) {
+				xip_sti();
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
 				       map->name, base, chips[i].start);
 				return 0;
 			}
 		}
-	}
+	}	
 	
+	/* Put it back into Read Mode */
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+	xip_sti();
+
 	/* OK, if we got to here, then none of the previous chips appear to
 	   be aliases for the current one. */
 	if (cfi->numchips == MAX_CFI_CHIPS) {
 		printk(KERN_WARNING"%s: Too many flash chips detected. Increase MAX_CFI_CHIPS from %d.\n", map->name, MAX_CFI_CHIPS);
-		/* Doesn't matter about resetting it to Read Mode - we're not going to talk to it anyway */
 		return -1;
 	}
 	chips[cfi->numchips].start = base;
 	chips[cfi->numchips].state = FL_READY;
 	cfi->numchips++;
-	
-	/* Put it back into Read Mode */
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 
 	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit mode\n",
 	       map->name, cfi->interleave, cfi->device_type*8, base,
@@ -127,36 +133,50 @@ static int cfi_probe_chip(struct map_inf
 	return 1;
 }
 
-static int cfi_chip_setup(struct map_info *map, 
+/* Called with IRQs already disabled, in the XIP case */
+static int __xipram cfi_chip_setup(struct map_info *map, 
 		   struct cfi_private *cfi)
 {
 	int ofs_factor = cfi->interleave*cfi->device_type;
 	__u32 base = 0;
 	int num_erase_regions = cfi_read_query(map, base + (0x10 + 28)*ofs_factor);
 	int i;
+	unsigned char cfi_copy[sizeof(struct cfi_ident) + 32];
+
+	if (!num_erase_regions) {
+		/* Put it back into Read Mode */
+		cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+		xip_sti();
+		return 0;
+	}
+
+	cfi->cfi_mode = CFI_MODE_CFI;
+	cfi->fast_prog=1;		/* CFI supports fast programming */
+	
+	memset(cfi_copy,0,sizeof(cfi_copy));
+	
+	if (num_erase_regions)
+	/* Read the CFI info structure */
+	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++) {
+		cfi_copy[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
+	}
+
+	/* Put it back into Read Mode */
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+	xip_sti();
 
 #ifdef DEBUG_CFI
 	printk("Number of erase regions: %d\n", num_erase_regions);
 #endif
-	if (!num_erase_regions)
-		return 0;
 
 	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
 	if (!cfi->cfiq) {
 		printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
 		return 0;
 	}
-	
-	memset(cfi->cfiq,0,sizeof(struct cfi_ident));	
-	
-	cfi->cfi_mode = CFI_MODE_CFI;
-	cfi->fast_prog=1;		/* CFI supports fast programming */
-	
-	/* Read the CFI info structure */
-	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++) {
-		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
-	}
-	
+
+	memcpy(cfi->cfiq, cfi_copy, sizeof(struct cfi_ident) + num_erase_regions * 4);
+
 	/* Do any necessary byteswapping */
 	cfi->cfiq->P_ID = le16_to_cpu(cfi->cfiq->P_ID);
 	
@@ -166,6 +186,7 @@ static int cfi_chip_setup(struct map_inf
 	cfi->cfiq->InterfaceDesc = le16_to_cpu(cfi->cfiq->InterfaceDesc);
 	cfi->cfiq->MaxBufWriteSize = le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
 
+
 #ifdef DEBUG_CFI
 	/* Dump the information therein */
 	print_cfi_ident(cfi->cfiq);
@@ -180,8 +201,6 @@ static int cfi_chip_setup(struct map_inf
 		       (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1);
 #endif
 	}
-	/* Put it back into Read Mode */
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 
 	return 1;
 }
Index: include/linux/mtd/cfi.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi.h,v
retrieving revision 1.35
diff -u -p -r1.35 cfi.h
--- include/linux/mtd/cfi.h	28 May 2003 15:37:32 -0000	1.35
+++ include/linux/mtd/cfi.h	4 Jun 2003 08:11:48 -0000
@@ -458,7 +458,7 @@ static inline __u8 cfi_read_query(struct
 
 static inline void cfi_udelay(int us)
 {
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0) && !defined (CONFIG_XIP_KERNEL)
 	unsigned long t = us * HZ / 1000000;
 	if (t) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
@@ -467,7 +467,9 @@ static inline void cfi_udelay(int us)
 	}
 #endif
 	udelay(us);
+#ifndef CONFIG_XIP_KERNEL
 	cond_resched();
+#endif
 }
 
 static inline void cfi_spin_lock(spinlock_t *mutex)
--- /dev/null	Thu Jan 30 10:24:37 2003
+++ include/linux/mtd/xip.h	Wed Jun  4 09:10:34 2003
@@ -0,0 +1,31 @@
+/*
+ * $Id$
+ */
+
+#ifndef __LINUX_MTD_XIP_H__
+#define __LINUX_MTD_XIP_H__
+
+
+
+#ifdef CONFIG_XIP_KERNEL
+#ifdef CONFIG_ARCH_PXA
+#include <asm/arch/pxa-regs.h>
+#define xip_irqpending() (ICIP & ICMR)
+#else
+#warning "No known way to check for IRQ pending on this arch"
+#define xip_irqpending() (0)
+#endif /* ARCH */
+
+
+#define xip_cli() do { cli(); } while(0)
+#define xip_sti() do { sti(); } while(0)
+
+#define __xipram __attribute__ ((__section__ (".text.xipram")))
+#else /* !CONFIG_XIP_KERNEL */
+#define xip_cli() do { } while(0)
+#define xip_sti() do { } while(0)
+#define xip_irqpending() (0)
+#define __xipram
+#endif /* CONFIG_XIP_KERNEL */
+
+#endif /* __LINUX_MTD_XIP_H__ */

--=-FlnMBrKDg49LyRQ4BH5F--
