Received: from nbd.name ([46.4.11.11])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5xYg-0000V1-AS
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 11:00:27 +0000
Message-ID: <4F59E29B.50402@openwrt.org>
Date: Fri, 09 Mar 2012 11:59:39 +0100
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] MTD: MIPS: lantiq: reintroduce support for cmdline
 partitions
References: <1330016389-20973-1-git-send-email-blogic@openwrt.org>	
 <1331282453.22872.29.camel@sauron.fi.intel.com>	
 <4F59C630.3060501@openwrt.org>
 <1331284134.22872.34.camel@sauron.fi.intel.com>
In-Reply-To: <1331284134.22872.34.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
 Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
 David Woodhouse <dwmw2@infradead.org>, Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/03/12 09:40, Artem Bityutskiy wrote:
> I would like to compile-test this patch. I've got this error when
> compiling with mips-linux-gcc-4.6.0 and the attached defconfig:
>
>                  from include/linux/sched.h:55,
>                  from arch/mips/kernel/asm-offsets.c:13:
> include/linux/bitops.h: In function 'hweight_long':
> include/linux/bitops.h:55:26: warning: signed and unsigned type in conditional expression [-Wsign-compare]
> arch/mips/kernel/asm-offsets.c: At top level:
> arch/mips/kernel/asm-offsets.c:21:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
> arch/mips/kernel/asm-offsets.c:76:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
> arch/mips/kernel/asm-offsets.c:88:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
> arch/mips/kernel/asm-offsets.c:105:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
> arch/mips/kernel/asm-offsets.c:136:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
> arch/mips/kernel/asm-offsets.c:175:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
> arch/mips/kernel/asm-offsets.c:211:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
> arch/mips/kernel/asm-offsets.c:257:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
> arch/mips/kernel/asm-offsets.c:295:6: warning: no previous prototype for 'output_irq_cpustat_t_defines' [-Wmissing-prototypes]
> In file included from include/linux/kernel.h:17:0,
>                  from arch/mips/kernel/cpu-probe.c:15:
> include/linux/bitops.h: In function 'hweight_long':
> include/linux/bitops.h:55:26: error: signed and unsigned type in conditional expression [-Werror=sign-compare]
> arch/mips/kernel/cpu-probe.c: At top level:
> arch/mips/kernel/cpu-probe.c:64:6: error: no previous prototype for 'r4k_wait_irqoff' [-Werror=missing-prototypes]
> arch/mips/kernel/cpu-probe.c:154:13: error: no previous prototype for 'check_wait' [-Werror=missing-prototypes]
> cc1: all warnings being treated as errors
>
> I use W=1 when compiling. Any suggestions?

Hi,

just tried 4.5 where the same happens. The errors don't seem to have
been introduced by 4.6.

apart from that the -Werror is set by arch/mips/ as follows
bcm63xx/boards/Makefile:ccflags-y := -Werror
fw/arc/Makefile:ccflags-y                       := -Werror
jz4740/Makefile:ccflags-y := -Werror -Wall
Kbuild:subdir-ccflags-y := -Werror
oprofile/Makefile:ccflags-y := -Werror
pmc-sierra/yosemite/Makefile:ccflags-y := -Werror
powertv/asic/Makefile:ccflags-y := -Wall -Werror
powertv/pci/Makefile:ccflags-y := -Wall -Werror

There seems to be some need to clean this up.
I guess for now you will need to drop the W=1 to build an image.

I will talk to Ralf about this.

Thanks,
John
