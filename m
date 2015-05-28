Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxmmF-0000Su-I1
 for linux-mtd@lists.infradead.org; Thu, 28 May 2015 01:38:32 +0000
Received: by pdea3 with SMTP id a3so29592270pde.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2015 18:38:10 -0700 (PDT)
Date: Wed, 27 May 2015 18:38:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: kbuild test robot <fengguang.wu@intel.com>
Subject: Re: [l2-mtd:master 47/48] jedec_probe.c:undefined reference to
 `cfi_build_cmd_addr'
Message-ID: <20150528013805.GN27753@ld-irv-0074>
References: <201505280926.aiYZUlC3%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201505280926.aiYZUlC3%fengguang.wu@intel.com>
Cc: linux-mtd@lists.infradead.org, Denys Vlasenko <dvlasenk@redhat.com>,
 kbuild-all@01.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ linux-mtd

On Thu, May 28, 2015 at 09:31:27AM +0800, kbuild test robot wrote:
> tree:   git://git.infradead.org/users/dedekind/l2-mtd.git master
> head:   636fdbf88efe069f9951d1b7df8d3fd82060dc60
> commit: 4612c715a6ea6b3af2aee0163c0721375b2548d7 [47/48] mtd: cfi: deinline large functions
> config: i386-randconfig-r1 (attached as .config)
> reproduce:
>   git checkout 4612c715a6ea6b3af2aee0163c0721375b2548d7
>   # save the attached .config to linux build tree
>   make ARCH=i386 
> 
> All error/warnings:
> 
>    drivers/built-in.o: In function `jedec_read_id':
> >> jedec_probe.c:(.text+0x187ed8): undefined reference to `cfi_build_cmd_addr'
>    drivers/built-in.o: In function `jedec_read_mfr':
> >> jedec_probe.c:(.text+0x187f4a): undefined reference to `cfi_build_cmd_addr'
>    drivers/built-in.o: In function `jedec_reset':
> >> jedec_probe.c:(.text+0x187fe0): undefined reference to `cfi_send_gen_cmd'
> >> jedec_probe.c:(.text+0x188004): undefined reference to `cfi_send_gen_cmd'
> >> jedec_probe.c:(.text+0x18802b): undefined reference to `cfi_send_gen_cmd'
> >> jedec_probe.c:(.text+0x18804e): undefined reference to `cfi_send_gen_cmd'
>    drivers/built-in.o: In function `jedec_probe_chip':
> >> jedec_probe.c:(.text+0x188130): undefined reference to `cfi_build_cmd_addr'
> >> jedec_probe.c:(.text+0x18814d): undefined reference to `cfi_build_cmd_addr'
> >> jedec_probe.c:(.text+0x1881dc): undefined reference to `cfi_send_gen_cmd'
> >> jedec_probe.c:(.text+0x188203): undefined reference to `cfi_send_gen_cmd'
> >> jedec_probe.c:(.text+0x18822d): undefined reference to `cfi_send_gen_cmd'
> >> jedec_probe.c:(.text+0x1884c0): undefined reference to `cfi_send_gen_cmd'
> >> jedec_probe.c:(.text+0x1884e7): undefined reference to `cfi_send_gen_cmd'
>    drivers/built-in.o:jedec_probe.c:(.text+0x188511): more undefined references to `cfi_send_gen_cmd' follow
>    drivers/built-in.o: In function `jedec_probe_chip':
> >> jedec_probe.c:(.text+0x188618): undefined reference to `cfi_build_cmd'
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

I think this comes down to these two:

> CONFIG_MTD_JEDECPROBE=y
> CONFIG_MTD_CFI_UTIL=m

I'll apply the following if nobody has objections:

Signed-off-by: Brian Norris <computersforpeace@gmail.com>

diff --git a/drivers/mtd/chips/Kconfig b/drivers/mtd/chips/Kconfig
index 9f02c28c0204..54479c481a7a 100644
--- a/drivers/mtd/chips/Kconfig
+++ b/drivers/mtd/chips/Kconfig
@@ -16,6 +16,7 @@ config MTD_CFI
 config MTD_JEDECPROBE
 	tristate "Detect non-CFI AMD/JEDEC-compatible flash chips"
 	select MTD_GEN_PROBE
+	select MTD_CFI_UTIL
 	help
 	  This option enables JEDEC-style probing of flash chips which are not
 	  compatible with the Common Flash Interface, but will use the common
