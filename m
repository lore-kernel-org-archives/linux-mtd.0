Message-ID: <4FC85D20.6020905@snapgear.com>
Date: Fri, 1 Jun 2012 16:11:44 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: [uClinux-dev] [PATCH/RFC] mtd/uclinux: Use generic __bss_stop
 instead of _ebss
References: <1338497739-2852-1-git-send-email-geert@linux-m68k.org>
In-Reply-To: <1338497739-2852-1-git-send-email-geert@linux-m68k.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Michal Simek <monstr@monstr.eu>, Mike Frysinger <vapier@gentoo.org>,
 Paul Mundt <lethal@linux-sh.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Geert,

On 01/06/12 06:55, Geert Uytterhoeven wrote:
> The standard (see BSS_SECTION() in<asm-generic/vmlinux.lds.h>  and
> <asm-generic/sections.h>) symbol for the end of BSS is __bss_stop.
> This allows to remove all local declarations that have been added to
> several architectures just to please CONFIG_MTD_UCLINUX.

Looks good to me. Compile and run tested uclinux.c changes on
ColdFire, no problems.

Acked-by: Greg Ungerer <gerg@uclinux.org>

Regards
Greg



> Not-Yet-Signed-off-by: Geert Uytterhoeven<geert@linux-m68k.org>
> ---
> This is a prerequisite for some future m68k changes:
>    - replacing the m68k-specific _[se]bss by the generic __bss_{start,stop},
>    - using the asm-generic version of<asm/sections.h>.
> ---
>   arch/blackfin/kernel/setup.c              |    1 -
>   arch/microblaze/include/asm/sections.h    |    4 ----
>   arch/microblaze/kernel/microblaze_ksyms.c |    3 ---
>   arch/microblaze/kernel/setup.c            |    4 ++--
>   arch/microblaze/kernel/vmlinux.lds.S      |    1 -
>   arch/sh/include/asm/sections.h            |    1 -
>   arch/sh/kernel/setup.c                    |    2 +-
>   arch/sh/kernel/sh_ksyms_32.c              |    1 -
>   arch/sh/kernel/vmlinux.lds.S              |    1 -
>   arch/sh/lib/mcount.S                      |    8 +++-----
>   drivers/mtd/maps/uclinux.c                |    5 ++---
>   11 files changed, 8 insertions(+), 23 deletions(-)
>
> diff --git a/arch/blackfin/kernel/setup.c b/arch/blackfin/kernel/setup.c
> index ada8f0f..fb96e60 100644
> --- a/arch/blackfin/kernel/setup.c
> +++ b/arch/blackfin/kernel/setup.c
> @@ -52,7 +52,6 @@ EXPORT_SYMBOL(reserved_mem_dcache_on);
>   #ifdef CONFIG_MTD_UCLINUX
>   extern struct map_info uclinux_ram_map;
>   unsigned long memory_mtd_end, memory_mtd_start, mtd_size;
> -unsigned long _ebss;
>   EXPORT_SYMBOL(memory_mtd_end);
>   EXPORT_SYMBOL(memory_mtd_start);
>   EXPORT_SYMBOL(mtd_size);
> diff --git a/arch/microblaze/include/asm/sections.h b/arch/microblaze/include/asm/sections.h
> index 4487e15..c07ed5d 100644
> --- a/arch/microblaze/include/asm/sections.h
> +++ b/arch/microblaze/include/asm/sections.h
> @@ -18,10 +18,6 @@ extern char _ssbss[], _esbss[];
>   extern unsigned long __ivt_start[], __ivt_end[];
>   extern char _etext[], _stext[];
>
> -#  ifdef CONFIG_MTD_UCLINUX
> -extern char *_ebss;
> -#  endif
> -
>   extern u32 _fdt_start[], _fdt_end[];
>
>   # endif /* !__ASSEMBLY__ */
> diff --git a/arch/microblaze/kernel/microblaze_ksyms.c b/arch/microblaze/kernel/microblaze_ksyms.c
> index bb4907c..2b25bcf 100644
> --- a/arch/microblaze/kernel/microblaze_ksyms.c
> +++ b/arch/microblaze/kernel/microblaze_ksyms.c
> @@ -21,9 +21,6 @@
>   #include<linux/ftrace.h>
>   #include<linux/uaccess.h>
>
> -extern char *_ebss;
> -EXPORT_SYMBOL_GPL(_ebss);
> -
>   #ifdef CONFIG_FUNCTION_TRACER
>   extern void _mcount(void);
>   EXPORT_SYMBOL(_mcount);
> diff --git a/arch/microblaze/kernel/setup.c b/arch/microblaze/kernel/setup.c
> index 16d8dfd..4da971d 100644
> --- a/arch/microblaze/kernel/setup.c
> +++ b/arch/microblaze/kernel/setup.c
> @@ -121,7 +121,7 @@ void __init machine_early_init(const char *cmdline, unsigned int ram,
>
>   	/* Move ROMFS out of BSS before clearing it */
>   	if (romfs_size>  0) {
> -		memmove(&_ebss, (int *)romfs_base, romfs_size);
> +		memmove(&__bss_stop, (int *)romfs_base, romfs_size);
>   		klimit += romfs_size;
>   	}
>   #endif
> @@ -165,7 +165,7 @@ void __init machine_early_init(const char *cmdline, unsigned int ram,
>   	BUG_ON(romfs_size<  0); /* What else can we do? */
>
>   	printk("Moved 0x%08x bytes from 0x%08x to 0x%08x\n",
> -			romfs_size, romfs_base, (unsigned)&_ebss);
> +			romfs_size, romfs_base, (unsigned)&__bss_stop);
>
>   	printk("New klimit: 0x%08x\n", (unsigned)klimit);
>   #endif
> diff --git a/arch/microblaze/kernel/vmlinux.lds.S b/arch/microblaze/kernel/vmlinux.lds.S
> index 109e9d8..936d01a 100644
> --- a/arch/microblaze/kernel/vmlinux.lds.S
> +++ b/arch/microblaze/kernel/vmlinux.lds.S
> @@ -131,7 +131,6 @@ SECTIONS {
>   			*(COMMON)
>   		. = ALIGN (4) ;
>   		__bss_stop = . ;
> -		_ebss = . ;
>   	}
>   	. = ALIGN(PAGE_SIZE);
>   	_end = .;
> diff --git a/arch/sh/include/asm/sections.h b/arch/sh/include/asm/sections.h
> index 4a53500..1b61997 100644
> --- a/arch/sh/include/asm/sections.h
> +++ b/arch/sh/include/asm/sections.h
> @@ -6,7 +6,6 @@
>   extern long __nosave_begin, __nosave_end;
>   extern long __machvec_start, __machvec_end;
>   extern char __uncached_start, __uncached_end;
> -extern char _ebss[];
>   extern char __start_eh_frame[], __stop_eh_frame[];
>
>   #endif /* __ASM_SH_SECTIONS_H */
> diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
> index 7b57bf1..ebe7a7d 100644
> --- a/arch/sh/kernel/setup.c
> +++ b/arch/sh/kernel/setup.c
> @@ -273,7 +273,7 @@ void __init setup_arch(char **cmdline_p)
>   	data_resource.start = virt_to_phys(_etext);
>   	data_resource.end = virt_to_phys(_edata)-1;
>   	bss_resource.start = virt_to_phys(__bss_start);
> -	bss_resource.end = virt_to_phys(_ebss)-1;
> +	bss_resource.end = virt_to_phys(__bss_stop)-1;
>
>   #ifdef CONFIG_CMDLINE_OVERWRITE
>   	strlcpy(command_line, CONFIG_CMDLINE, sizeof(command_line));
> diff --git a/arch/sh/kernel/sh_ksyms_32.c b/arch/sh/kernel/sh_ksyms_32.c
> index 3896f26..2a0a596 100644
> --- a/arch/sh/kernel/sh_ksyms_32.c
> +++ b/arch/sh/kernel/sh_ksyms_32.c
> @@ -19,7 +19,6 @@ EXPORT_SYMBOL(csum_partial);
>   EXPORT_SYMBOL(csum_partial_copy_generic);
>   EXPORT_SYMBOL(copy_page);
>   EXPORT_SYMBOL(__clear_user);
> -EXPORT_SYMBOL(_ebss);
>   EXPORT_SYMBOL(empty_zero_page);
>
>   #define DECLARE_EXPORT(name)		\
> diff --git a/arch/sh/kernel/vmlinux.lds.S b/arch/sh/kernel/vmlinux.lds.S
> index c98905f..db88cbf 100644
> --- a/arch/sh/kernel/vmlinux.lds.S
> +++ b/arch/sh/kernel/vmlinux.lds.S
> @@ -78,7 +78,6 @@ SECTIONS
>   	. = ALIGN(PAGE_SIZE);
>   	__init_end = .;
>   	BSS_SECTION(0, PAGE_SIZE, 4)
> -	_ebss = .;			/* uClinux MTD sucks */
>   	_end = . ;
>
>   	STABS_DEBUG
> diff --git a/arch/sh/lib/mcount.S b/arch/sh/lib/mcount.S
> index 84a5776..60164e6 100644
> --- a/arch/sh/lib/mcount.S
> +++ b/arch/sh/lib/mcount.S
> @@ -39,7 +39,7 @@
>    *
>    * Make sure the stack pointer contains a valid address. Valid
>    * addresses for kernel stacks are anywhere after the bss
> - * (after _ebss) and anywhere in init_thread_union (init_stack).
> + * (after __bss_stop) and anywhere in init_thread_union (init_stack).
>    */
>   #define STACK_CHECK()					\
>   	mov	#(THREAD_SIZE>>  10), r0;		\
> @@ -60,7 +60,7 @@
>   	cmp/hi	r2, r1;					\
>   	bf	stack_panic;				\
>   							\
> -	/* If sp>  _ebss then we're OK. */		\
> +	/* If sp>  __bss_stop then we're OK. */		\
>   	mov.l	.L_ebss, r1;				\
>   	cmp/hi	r1, r15;				\
>   	bt	1f;					\
> @@ -70,7 +70,7 @@
>   	cmp/hs	r1, r15;				\
>   	bf	stack_panic;				\
>   							\
> -	/* If sp>  init_stack&&  sp<  _ebss, not OK. */	\
> +	/* If sp>  init_stack&&  sp<  __bss_stop, not OK. */	\
>   	add	r0, r1;					\
>   	cmp/hs	r1, r15;				\
>   	bt	stack_panic;				\
> @@ -292,8 +292,6 @@ stack_panic:
>   	 nop
>
>   	.align 2
> -.L_ebss:
> -	.long	_ebss
>   .L_init_thread_union:
>   	.long	init_thread_union
>   .Lpanic:
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index cfff454..c3bb304 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -19,14 +19,13 @@
>   #include<linux/mtd/map.h>
>   #include<linux/mtd/partitions.h>
>   #include<asm/io.h>
> +#include<asm/sections.h>
>
>   /****************************************************************************/
>
> -extern char _ebss;
> -
>   struct map_info uclinux_ram_map = {
>   	.name = "RAM",
> -	.phys = (unsigned long)&_ebss,
> +	.phys = (unsigned long)__bss_stop,
>   	.size = 0,
>   };
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
