Received: from smtp1.pochta.ru ([81.211.64.6])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Er8ZQ-0001qq-KI
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2005 06:44:36 +0000
Message-ID: <43B0E2B4.6050309@ru.mvista.com>
Date: Tue, 27 Dec 2005 09:44:04 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Dirk Behme <dirk.behme@de.bosch.com>
References: <43B031A7.1030504@de.bosch.com>
In-Reply-To: <43B031A7.1030504@de.bosch.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Oops using cfi_cmdset_0002.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dirk,

I assume you have a custom OMAP board? I don't recall seeing AMD NOR 
flash on any OMAP I've ever seen...
The wait queue is normally initialized in drivers/mtd/chips/gen_probe.c. 
cfi_cmdset_0001's case is a special one.
Interesting is 1) whether the flash chip is determined correctly 2) 
whether you've tried flash_eraseall w/o '-j' option.

Anyway, this looks like either a misconfiguration or a result of an 
write access past the allocated space.
Trying DEBUG_SLAB might also help.

Vitaly


Dirk Behme wrote:

> Hi,
>
> I encountered the same problem already reported in "Crash while
> accessing Intel 28F128 flash" in November:
>
> http://lists.infradead.org/pipermail/linux-mtd/2005-November/014361.html
>
> However, I use slightly different configuration. I use an embedded ARM
> system with kernel 2.6.15-rc4 and I try to establish a jffs2 filesystem
>  on a SPANSION S29GL512. Calling flash_eraseall crashes with an Ooops.
> System crashes while calling wake_up(&chip->wq); in put_chip().
>
> Please find kernel configuration, boot output and Ooops below. I enabled
>
> #define DEBUG_CFI_FEATURES
>
> in cfi_cmdset_0002.c.
>
> The issue seems to be in __wake_up_common:
>
> ...
> PC is at __wake_up_common+0x28/0x7c
> LR is at __init_begin+0x3fff8000/0x38
> pc : [<c00384d4>]    lr : [<00000000>]    Not tainted
> ...
>
> which is called by wake_up(). At PC address c00384d4 disassembly shows:
>
> c00384ac <__wake_up_common>:
> c00384ac:    e1a0c00d     mov    ip, sp
> c00384b0:    e92ddff0     stmdb    sp!, {r4, r5, r6, r7, r8, r9, sl, 
> fp, ip, lr, pc}
> c00384b4:    e24cb004     sub    fp, ip, #4    ; 0x4
> c00384b8:    e590e000     ldr    lr, [r0]    ; <====!!!!
> c00384bc:    e1a05000     mov    r5, r0
> c00384c0:    e15e0000     cmp    lr, r0
> c00384c4:    e1a0a001     mov    sl, r1
> c00384c8:    e1a04002     mov    r4, r2
> c00384cc:    e1a08003     mov    r8, r3
> c00384d0:    e59b9004     ldr    r9, [fp, #4]
> c00384d4:    e59e7000     ldr    r7, [lr]    ; <====!!!!
> ...
>
> If LR is zero, it is clear that this last command results in an Ooops.
> LR is loaded with content of r0, and r0 is the first parameter of
> __wake_up_common(). In __wake_up_common() the first parameter is
> wait_queue_head_t as passed by put_chip() & wake_up(&chip->wq):
>
> static void __wake_up_common(wait_queue_head_t *q, unsigned int mode,
>                  int nr_exclusive, int sync, void *key)
> {
>     struct list_head *tmp, *next;
>
>     list_for_each_safe(tmp, next, &q->task_list) {
>         wait_queue_t *curr;
>        ...
>
> with
>
> #define list_for_each_safe(pos, n, head) \
>     for (pos = (head)->next, n = pos->next; pos != (head); \
>         pos = n, n = pos->next)
>
> So, seems to me, that the access (&q->task_list)->next fails? May be the
> waitqueue isn't initialized correctly in cfi_cmdset_0002.c?
>
> Is
>
> init_waitqueue_head(&chip->wq);
> spin_lock_init(&chip->_spinlock);
>
> missing in cfi_cmdset_0002.c? In cfi_cmdset_0001.c it is done?
>
> Or any other ideas?
>
> Many thanks
>
> Dirk
>
> Kernel configuration:
>
> -- cut --
> ...
> #
> # Memory Technology Devices (MTD)
> #
> CONFIG_MTD=y
> CONFIG_MTD_DEBUG=y
> CONFIG_MTD_DEBUG_VERBOSE=3
> CONFIG_MTD_CONCAT=y
> CONFIG_MTD_PARTITIONS=y
> # CONFIG_MTD_REDBOOT_PARTS is not set
> CONFIG_MTD_CMDLINE_PARTS=y
> # CONFIG_MTD_AFS_PARTS is not set
>
> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_CHAR=y
> CONFIG_MTD_BLOCK=y
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set
> # CONFIG_INFTL is not set
> # CONFIG_RFD_FTL is not set
>
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=y
> CONFIG_MTD_JEDECPROBE=y
> CONFIG_MTD_GEN_PROBE=y
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> # CONFIG_MTD_CFI_NOSWAP is not set
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=y
> CONFIG_MTD_MAP_BANK_WIDTH_2=y
> CONFIG_MTD_MAP_BANK_WIDTH_4=y
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=y
> CONFIG_MTD_CFI_I2=y
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> # CONFIG_MTD_CFI_INTELEXT is not set
> CONFIG_MTD_CFI_AMDSTD=y
> CONFIG_MTD_CFI_AMDSTD_RETRY=3
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=y
> # CONFIG_MTD_RAM is not set
> # CONFIG_MTD_ROM is not set
> # CONFIG_MTD_ABSENT is not set
> # CONFIG_MTD_XIP is not set
>
> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=y
> # CONFIG_MTD_PHYSMAP is not set
> # CONFIG_MTD_ARM_INTEGRATOR is not set
> # CONFIG_MTD_IMPA7 is not set
> CONFIG_MTD_OMAP_NOR=y
> # CONFIG_MTD_PLATRAM is not set
> ...
> -- cut --
>
> Boot messages:
>
> -- cut --
> ...
> omapflash.0: Found 1 x16 devices at 0x0 in 16-bit bank
>  Amd/Fujitsu Extended Query Table at 0x0040
> Using buffer write method
>   Silicon revision: 8
>   Address sensitive unlock: Required
>   Erase Suspend: Read/write
>   Block protection: 1 sectors per group
>   Temporary block unprotect: Not supported
>   Block protect/unprotect scheme: 8
>   Number of simultaneous operations: 0
>   Burst mode: Not supported
>   Page mode: 8 word page
>   Vpp Supply Minimum Program/Erase Voltage: 11.5 V
>   Vpp Supply Maximum Program/Erase Voltage: 12.5 V
>   Top/Bottom Boot Block: Uniform, Top WP
> omapflash.0: CFI does not contain boot bank location. Assuming top.
> number of CFI chips: 1
> cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
> Creating 4 MTD partitions on "omapflash.0":
> 0x00000000-0x00020000 : "bootloader"
> mtd: Giving out device 0 to bootloader
> 0x00020000-0x00040000 : "params"
> mtd: Giving out device 1 to params
> 0x00040000-0x00440000 : "kernel"
> mtd: Giving out device 2 to kernel
> 0x00440000-0x04000000 : "filesystem"
> mtd: Giving out device 3 to filesystem
> ...
> -- cut --
>
> Kernel Oops:
>
> -- cut --
> ...
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00020000 00020000 "bootloader"
> mtd1: 00020000 00020000 "params"
> mtd2: 00400000 00020000 "kernel"
> mtd3: 03bc0000 00020000 "filesystem"
> # flash_eraseall -j /dev/mtd3
> MTD_open
> MTD_ioctl
> Erasing 128 Kibyte @ 0 --  0 % MTD_ioctl
> complete.MTD do_erase_oneblock(): ERASE 0x00440000
> Unable to handle kernel NULL pointer dereference at virtual address 
> 00000000
> pgd = c7898000
> [00000000] *pgd=1788d031, *pte=00000000, *ppte=00000000
> Internal error: Oops: 17 [#1]
> Modules linked in:
> CPU: 0
> PC is at __wake_up_common+0x28/0x7c
> LR is at __init_begin+0x3fff8000/0x38
> pc : [<c00384d4>]    lr : [<00000000>]    Not tainted
> sp : c765fd18  ip : c765fd44  fp : c765fd40
> r10: 00000003  r9 : 00000000  r8 : 00000000
> r7 : c0b52118  r6 : ffffb8b2  r5 : c0b52134  r4 : 00000001
> r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c0b52134
> Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
> Control: 5317F  Table: 17898000  DAC: 00000015
> Process flash_eraseall (pid: 715, stack limit = 0xc765e194)
> Stack: (0xc765fd18 to 0xc7660000)
> fd00:                                                       c765e000
> 60000013
> fd20: ffffb8b2 c0b52118 c0801f88 c765e000 c0b52118 c765fd5c c765fd44
> c00445ec
> fd40: c0044540 00000000 00000002 00000001 c765fd84 c765fd60 c0160cdc
> c00445bc
> fd60: 0000ffff 00000002 00000001 ffffb8b2 c0801f88 c0b520e0 c765fe30
> c765fd88
> fd80: c0163b54 c0160b68 00000554 00000aaa 00000aaa 00000554 00000aaa
> 00000000
> fda0: 00020000 00440000 fefecb00 0000ffff 00000030 00000055 000000aa
> 00000080
> fdc0: 00000055 000000aa c02222e0 0000132f 60000013 00001322 ffffecd1
> c0260ac5
> fde0: 00000000 c0a68300 c0044518 00000000 00000000 00000000 c0a68300
> c0044518
> fe00: 00000000 00000000 00020000 00440000 00000000 00000000 00440000
> c0af9f80
> fe20: 00000000 c765fe74 c765fe34 c015fad8 c01633c4 00000000 c0b52118
> c0af9f80
> fe40: c0b520e0 c0801f88 c01633b4 00000000 c74cfba0 c74cfba0 c0817e00
> c765e000
> fe60: c765ff00 00000000 c765fe94 c765fe78 c0163bcc c015f88c 00020000
> 00000000
> fe80: 00000000 bedacdb0 c765fea4 c765fe98 c01594fc c0163bac c765ff38
> c765fea8
> fea0: c015c3ac c01594bc 00000029 40017029 c765e000 c082abdc c765fee0
> c765fec8
> fec0: c00445ec c0044540 00000000 c765e000 c082a00c c765fefc 00000000
> c0a68300
> fee0: c0044518 00000000 00000000 00000000 c0a68300 c0044518 00000000
> 00000000
> ff00: c765ff00 c765ff00 00000000 c01333b4 c0a770c0 ffffffe7 bedacdb0
> 40084d02
> ff20: c0020f44 c765e000 00011a54 c765ff58 c765ff3c c009abdc c015c0b0
> bedacdb0
> ff40: c0a770c0 00000000 00000003 c765ff80 c765ff5c c009af34 c009ab6c
> 00000000
> ff60: 401421f0 fffffff7 bedacdb0 40084d02 c0a770c0 c765ffa4 c765ff84
> c009af98
> ff80: c009ad44 00000000 00000080 00000000 00000003 00000036 00000000
> c765ffa8
> ffa0: c0020dc0 c009af64 00000080 c002821c 00000003 40084d02 bedacdb0
> 00000000
> ffc0: 00000080 00000000 00000003 00011a2c 00000000 00011a28 00011a54
> 00011a5c
> ffe0: 00011a0c bedacdac 00008b4c 400eaed4 60000010 00000003 a1b11142
> 12082062
> Backtrace:
> [<c0044530>] (__wake_up_common+0x0/0x7c) from [<c00445ec>]
> (__wake_up+0x40/0x64)
> [<c00445ac>] (__wake_up+0x0/0x64) from [<c0160cdc>] 
> (put_chip+0x184/0x194)
>  r5 = 00000001  r4 = 00000002
> [<c0160b58>] (put_chip+0x0/0x194) from [<c0163b54>]
> (do_erase_oneblock+0x7a0/0x7e8)
>  r8 = C0B520E0  r7 = C0801F88  r6 = FFFFB8B2  r5 = 00000001
>  r4 = 00000002
> [<c01633b4>] (do_erase_oneblock+0x0/0x7e8) from [<c015fad8>]
> (cfi_varsize_frob+0x25c/0x2e4)
> [<c015f87c>] (cfi_varsize_frob+0x0/0x2e4) from [<c0163bcc>]
> (cfi_amdstd_erase_varsize+0x30/0x60)
> [<c0163b9c>] (cfi_amdstd_erase_varsize+0x0/0x60) from [<c01594fc>]
> (part_erase+0x50/0x5c)
>  r5 = BEDACDB0  r4 = 00000000
> [<c01594ac>] (part_erase+0x0/0x5c) from [<c015c3ac>] 
> (mtd_ioctl+0x30c/0x8d4)
> [<c015c0a0>] (mtd_ioctl+0x0/0x8d4) from [<c009abdc>] (do_ioctl+0x80/0x94)
> [<c009ab5c>] (do_ioctl+0x0/0x94) from [<c009af34>] 
> (vfs_ioctl+0x200/0x220)
>  r7 = 00000003  r6 = 00000000  r5 = C0A770C0  r4 = BEDACDB0
> [<c009ad34>] (vfs_ioctl+0x0/0x220) from [<c009af98>] 
> (sys_ioctl+0x44/0x60)
>  r7 = C0A770C0  r6 = 40084D02  r5 = BEDACDB0  r4 = FFFFFFF7
> [<c009af54>] (sys_ioctl+0x0/0x60) from [<c0020dc0>]
> (ret_fast_syscall+0x0/0x2c)
>  r7 = 00000036  r6 = 00000003  r5 = 00000000  r4 = 00000080
> Code: e1a0a001 e1a04002 e1a08003 e59b9004 (e59e7000)
>  <6>note: flash_eraseall[715] exited with preempt_count 3
> MTD_close
> Unable to handle kernel NULL pointer dereference at virtual address 
> 00000000
> pgd = c0004000
> [00000000] *pgd=00000000
> Internal error: Oops: 17 [#2]
> Modules linked in:
> CPU: 0
> PC is at __wake_up_common+0x28/0x7c
> LR is at __init_begin+0x3fff8000/0x38
> pc : [<c0044558>]    lr : [<00000000>]    Not tainted
> sp : c765fa58  ip : c765fa84  fp : c765fa80
> r10: 00000003  r9 : 00000000  r8 : 00000000
> r7 : c7bc7c40  r6 : 00000000  r5 : c0b52134  r4 : 00000001
> r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c0b52134
> Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
> Control: 5317F  Table: 17898000  DAC: 00000015
> Process flash_eraseall (pid: 715, stack limit = 0xc765e194)
> Stack: (0xc765fa58 to 0xc7660000)
> fa40:                                                       c765e000
> 60000013
> fa60: 00000000 c7bc7c40 c0b520e0 c0b52118 c765fab4 c765fa9c c765fa84
> c00445ec
> fa80: c0044540 00000000 c765e000 c0b520e0 c765faf0 c765faa0 c0163dd4
> c00445bc
> faa0: 00000000 c0a68300 c0044518 00000000 00000000 00000000 c0a68300
> c0044518
> fac0: 00000000 00000000 c0817e00 c0a770c0 c7671994 c7bc7c40 c03b42a0
> 00000017
> fae0: 00000000 c765fb00 c765faf4 c0159668 c0163c7c c765fb14 c765fb04
> c015bc78
> fb00: c015965c 00000008 c765fb38 c765fb18 c00869b8 c015bc54 c0a770c0
> 00000000
> fb20: c03c5c80 c03c5c88 00000001 c765fb4c c765fb3c c0086910 c0086924
> c0a770c0
> fb40: c765fb68 c765fb50 c0084eb8 c0086888 00000001 c03c5c80 00000003
> c765fb8c
> fb60: c765fb6c c004a224 c0084e50 c765e000 c03c5c80 c0a68300 00000001
> 0000000b
> fb80: c765fbb0 c765fb90 c004af70 c004a1a4 c765e000 00000017 c01e7d50
> c765fcd0
> fba0: c0a68300 c765fbd0 c765fbb4 c0026344 c004ad94 00000000 c765fcd0
> c001d1e0
> fbc0: 00000017 c765fbf0 c765fbd4 c0027d4c c00262b8 ffffffec c001d210
> c001d1e0
> fbe0: c765fcd0 c765fc24 c765fbf4 c0028050 c0027cf0 c0218340 c036a320
> ffffffff
> fc00: c02140c8 00000017 c765fcd0 00000000 00000093 00000003 c765fccc
> c765fc28
> fc20: c00281a8 c0027f30 00000000 c01e19f8 00000000 00000020 c0260eb7
> 30303030
> fc40: c0353434 1767a0ff c001b90c c765fc8c c026b628 c765fc70 c765fc90
> c765fc68
> fc60: c0148170 c014595c c02222e0 00001332 0000135c ffffeca4 c0260ae5
> 60000013
> fc80: 00000030 c765fcac c765fc94 c004854c c0147f68 0000135c c0216960
> c0216964
> fca0: c765fcc4 c765fcb0 c00485dc ffffffff c765fd04 ffffb8b2 c0b52118
> 00000000
> fcc0: c765fd40 c765fcd0 c0020940 c002817c c0b52134 00000003 00000001
> 00000000
> fce0: 00000001 c0b52134 ffffb8b2 c0b52118 00000000 00000000 00000003
> c765fd40
> fd00: c765fd44 c765fd18 00000000 c0044558 00000093 ffffffff c765e000
> 60000013
> fd20: ffffb8b2 c0b52118 c0801f88 c765e000 c0b52118 c765fd5c c765fd44
> c00445ec
> fd40: c0044540 00000000 00000002 00000001 c765fd84 c765fd60 c0160cdc
> c00445bc
> fd60: 0000ffff 00000002 00000001 ffffb8b2 c0801f88 c0b520e0 c765fe30
> c765fd88
> fd80: c0163b54 c0160b68 00000554 00000aaa 00000aaa 00000554 00000aaa
> 00000000
> fda0: 00020000 00440000 fefecb00 0000ffff 00000030 00000055 000000aa
> 00000080
> fdc0: 00000055 000000aa c02222e0 0000132f 60000013 00001322 ffffecd1
> c0260ac5
> fde0: 00000000 c0a68300 c0044518 00000000 00000000 00000000 c0a68300
> c0044518
> fe00: 00000000 00000000 00020000 00440000 00000000 00000000 00440000
> c0af9f80
> fe20: 00000000 c765fe74 c765fe34 c015fad8 c01633c4 00000000 c0b52118
> c0af9f80
> fe40: c0b520e0 c0801f88 c01633b4 00000000 c74cfba0 c74cfba0 c0817e00
> c765e000
> fe60: c765ff00 00000000 c765fe94 c765fe78 c0163bcc c015f88c 00020000
> 00000000
> fe80: 00000000 bedacdb0 c765fea4 c765fe98 c01594fc c0163bac c765ff38
> c765fea8
> fea0: c015c3ac c01594bc 00000029 40017029 c765e000 c082abdc c765fee0
> c765fec8
> fec0: c00445ec c0044540 00000000 c765e000 c082a00c c765fefc 00000000
> c0a68300
> fee0: c0044518 00000000 00000000 00000000 c0a68300 c0044518 00000000
> 00000000
> ff00: c765ff00 c765ff00 00000000 c01333b4 c0a770c0 ffffffe7 bedacdb0
> 40084d02
> ff20: c0020f44 c765e000 00011a54 c765ff58 c765ff3c c009abdc c015c0b0
> bedacdb0
> ff40: c0a770c0 00000000 00000003 c765ff80 c765ff5c c009af34 c009ab6c
> 00000000
> ff60: 401421f0 fffffff7 bedacdb0 40084d02 c0a770c0 c765ffa4 c765ff84
> c009af98
> ff80: c009ad44 00000000 00000080 00000000 00000003 00000036 00000000
> c765ffa8
> ffa0: c0020dc0 c009af64 00000080 c002821c 00000003 40084d02 bedacdb0
> 00000000
> ffc0: 00000080 00000000 00000003 00011a2c 00000000 00011a28 00011a54
> 00011a5c
> ffe0: 00011a0c bedacdac 00008b4c 400eaed4 60000010 00000003 a1b11142
> 12082062
> Backtrace:
> [<c0044530>] (__wake_up_common+0x0/0x7c) from [<c00445ec>]
> (__wake_up+0x40/0x64)
> [<c00445ac>] (__wake_up+0x0/0x64) from [<c0163dd4>]
> (cfi_amdstd_sync+0x168/0x194)
>  r5 = C0B520E0  r4 = C765E000
> [<c0163c6c>] (cfi_amdstd_sync+0x0/0x194) from [<c0159668>]
> (part_sync+0x1c/0x20)
> [<c015964c>] (part_sync+0x0/0x20) from [<c015bc78>] (mtd_close+0x34/0x48)
> [<c015bc44>] (mtd_close+0x0/0x48) from [<c00869b8>] (__fput+0xa4/0x18c)
>  r4 = 00000008
> [<c0086914>] (__fput+0x0/0x18c) from [<c0086910>] (fput+0x98/0x9c)
>  r8 = 00000001  r7 = C03C5C88  r6 = C03C5C80  r5 = 00000000
>  r4 = C0A770C0
> [<c0086878>] (fput+0x0/0x9c) from [<c0084eb8>] (filp_close+0x78/0x84)
>  r4 = C0A770C0
> [<c0084e40>] (filp_close+0x0/0x84) from [<c004a224>]
> (put_files_struct+0x90/0xd0)
>  r6 = 00000003  r5 = C03C5C80  r4 = 00000001
> [<c004a194>] (put_files_struct+0x0/0xd0) from [<c004af70>]
> (do_exit+0x1ec/0x484)
>  r8 = 0000000B  r7 = 00000001  r6 = C0A68300  r5 = C03C5C80
>  r4 = C765E000
> [<c004ad84>] (do_exit+0x0/0x484) from [<c0026344>] (die+0x9c/0xa0)
>  r8 = C0A68300  r7 = C765FCD0  r6 = C01E7D50  r5 = 00000017
>  r4 = C765E000
> [<c00262a8>] (die+0x0/0xa0) from [<c0027d4c>] 
> (__do_kernel_fault+0x6c/0x7c)
>  r7 = 00000017  r6 = C001D1E0  r5 = C765FCD0  r4 = 00000000
> [<c0027ce0>] (__do_kernel_fault+0x0/0x7c) from [<c0028050>]
> (do_page_fault+0x130/0x144)
>  r7 = C765FCD0  r6 = C001D1E0  r5 = C001D210  r4 = FFFFFFEC
> [<c0027f20>] (do_page_fault+0x0/0x144) from [<c00281a8>]
> (do_DataAbort+0x3c/0xa0)
> [<c002816c>] (do_DataAbort+0x0/0xa0) from [<c0020940>]
> (__dabt_svc+0x40/0x60)
>  r8 = 00000000  r7 = C0B52118  r6 = FFFFB8B2  r5 = C765FD04
>  r4 = FFFFFFFF
> [<c0044530>] (__wake_up_common+0x0/0x7c) from [<c00445ec>]
> (__wake_up+0x40/0x64)
> [<c00445ac>] (__wake_up+0x0/0x64) from [<c0160cdc>] 
> (put_chip+0x184/0x194)
>  r5 = 00000001  r4 = 00000002
> [<c0160b58>] (put_chip+0x0/0x194) from [<c0163b54>]
> (do_erase_oneblock+0x7a0/0x7e8)
>  r8 = C0B520E0  r7 = C0801F88  r6 = FFFFB8B2  r5 = 00000001
>  r4 = 00000002
> [<c01633b4>] (do_erase_oneblock+0x0/0x7e8) from [<c015fad8>]
> (cfi_varsize_frob+0x25c/0x2e4)
> [<c015f87c>] (cfi_varsize_frob+0x0/0x2e4) from [<c0163bcc>]
> (cfi_amdstd_erase_varsize+0x30/0x60)
> [<c0163b9c>] (cfi_amdstd_erase_varsize+0x0/0x60) from [<c01594fc>]
> (part_erase+0x50/0x5c)
>  r5 = BEDACDB0  r4 = 00000000
> [<c01594ac>] (part_erase+0x0/0x5c) from [<c015c3ac>] 
> (mtd_ioctl+0x30c/0x8d4)
> [<c015c0a0>] (mtd_ioctl+0x0/0x8d4) from [<c009abdc>] (do_ioctl+0x80/0x94)
> [<c009ab5c>] (do_ioctl+0x0/0x94) from [<c009af34>] 
> (vfs_ioctl+0x200/0x220)
>  r7 = 00000003  r6 = 00000000  r5 = C0A770C0  r4 = BEDACDB0
> [<c009ad34>] (vfs_ioctl+0x0/0x220) from [<c009af98>] 
> (sys_ioctl+0x44/0x60)
>  r7 = C0A770C0  r6 = 40084D02  r5 = BEDACDB0  r4 = FFFFFFF7
> [<c009af54>] (sys_ioctl+0x0/0x60) from [<c0020dc0>]
> (ret_fast_syscall+0x0/0x2c)
>  r7 = 00000036  r6 = 00000003  r5 = 00000000  r4 = 00000080
> Code: e1a0a001 e1a04002 e1a08003 e59b9004 (e59e7000)
>  <1>Fixing recursive fault but reboot is needed!pgd = c7898000
> [00000000] *pgd=1788d031, *pte=00000000, *ppte=00000000
> Internal error: Oops: 17 [#1]
> Modules linked in:
> CPU: 0
> PC is at __wake_up_common+0x28/0x7c
> LR is at __init_begin+0x3fff8000/0x38
> pc : [<c00384d4>]    lr : [<00000000>]    Not tainted
> sp : c765fd18  ip : c765fd44  fp : c765fd40
> r10: 00000003  r9 : 00000000  r8 : 00000000
> r7 : c0b52118  r6 : ffffb8b2  r5 : c0b52134  r4 : 00000001
> r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c0b52134
> Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
> Control: 5317F  Table: 17898000  DAC: 00000015
> Process flash_eraseall (pid: 715, stack limit = 0xc765e194)
> Stack: (0xc765fd18 to 0xc7660000)
> fd00:                                                       c765e000
> 60000013
> fd20: ffffb8b2 c0b52118 c0801f88 c765e000 c0b52118 c765fd5c c765fd44
> c00445ec
> fd40: c0044540 00000000 00000002 00000001 c765fd84 c765fd60 c0160cdc
> c00445bc
> fd60: 0000ffff 00000002 00000001 ffffb8b2 c0801f88 c0b520e0 c765fe30
> c765fd88
> fd80: c0163b54 c0160b68 00000554 00000aaa 00000aaa 00000554 00000aaa
> 00000000
> fda0: 00020000 00440000 fefecb00 0000ffff 00000030 00000055 000000aa
> 00000080
> fdc0: 00000055 000000aa c02222e0 0000132f 60000013 00001322 ffffecd1
> c0260ac5
> fde0: 00000000 c0a68300 c0044518 00000000 00000000 00000000 c0a68300
> c0044518
> fe00: 00000000 00000000 00020000 00440000 00000000 00000000 00440000
> c0af9f80
> fe20: 00000000 c765fe74 c765fe34 c015fad8 c01633c4 00000000 c0b52118
> c0af9f80
> fe40: c0b520e0 c0801f88 c01633b4 00000000 c74cfba0 c74cfba0 c0817e00
> c765e000
> fe60: c765ff00 00000000 c765fe94 c765fe78 c0163bcc c015f88c 00020000
> 00000000
> fe80: 00000000 bedacdb0 c765fea4 c765fe98 c01594fc c0163bac c765ff38
> c765fea8
> fea0: c015c3ac c01594bc 00000029 40017029 c765e000 c082abdc c765fee0
> c765fec8
> fec0: c00445ec c0044540 00000000 c765e000 c082a00c c765fefc 00000000
> c0a68300
> fee0: c0044518 00000000 00000000 00000000 c0a68300 c0044518 00000000
> 00000000
> ff00: c765ff00 c765ff00 00000000 c01333b4 c0a770c0 ffffffe7 bedacdb0
> 40084d02
> ff20: c0020f44 c765e000 00011a54 c765ff58 c765ff3c c009abdc c015c0b0
> bedacdb0
> ff40: c0a770c0 00000000 00000003 c765ff80 c765ff5c c009af34 c009ab6c
> 00000000
> ff60: 401421f0 fffffff7 bedacdb0 40084d02 c0a770c0 c765ffa4 c765ff84
> c009af98
> ff80: c009ad44 00000000 00000080 00000000 00000003 00000036 00000000
> c765ffa8
> ffa0: c0020dc0 c009af64 00000080 c002821c 00000003 40084d02 bedacdb0
> 00000000
> ffc0: 00000080 00000000 00000003 00011a2c 00000000 00011a28 00011a54
> 00011a5c
> ffe0: 00011a0c bedacdac 00008b4c 400eaed4 60000010 00000003 a1b11142
> 12082062
> Backtrace:
> [<c0044530>] (__wake_up_common+0x0/0x7c) from [<c00445ec>]
> (__wake_up+0x40/0x64)
> [<c00445ac>] (__wake_up+0x0/0x64) from [<c0160cdc>] 
> (put_chip+0x184/0x194)
>  r5 = 00000001  r4 = 00000002
> [<c0160b58>] (put_chip+0x0/0x194) from [<c0163b54>]
> (do_erase_oneblock+0x7a0/0x7e8)
>  r8 = C0B520E0  r7 = C0801F88  r6 = FFFFB8B2  r5 = 00000001
>  r4 = 00000002
> [<c01633b4>] (do_erase_oneblock+0x0/0x7e8) from [<c015fad8>]
> (cfi_varsize_frob+0x25c/0x2e4)
> [<c015f87c>] (cfi_varsize_frob+0x0/0x2e4) from [<c0163bcc>]
> (cfi_amdstd_erase_varsize+0x30/0x60)
> [<c0163b9c>] (cfi_amdstd_erase_varsize+0x0/0x60) from [<c01594fc>]
> (part_erase+0x50/0x5c)
>  r5 = BEDACDB0  r4 = 00000000
> [<c01594ac>] (part_erase+0x0/0x5c) from [<c015c3ac>] 
> (mtd_ioctl+0x30c/0x8d4)
> [<c015c0a0>] (mtd_ioctl+0x0/0x8d4) from [<c009abdc>] (do_ioctl+0x80/0x94)
> [<c009ab5c>] (do_ioctl+0x0/0x94) from [<c009af34>] 
> (vfs_ioctl+0x200/0x220)
>  r7 = 00000003  r6 = 00000000  r5 = C0A770C0  r4 = BEDACDB0
> [<c009ad34>] (vfs_ioctl+0x0/0x220) from [<c009af98>] 
> (sys_ioctl+0x44/0x60)
>  r7 = C0A770C0  r6 = 40084D02  r5 = BEDACDB0  r4 = FFFFFFF7
> [<c009af54>] (sys_ioctl+0x0/0x60) from [<c0020dc0>]
> (ret_fast_syscall+0x0/0x2c)
>  r7 = 00000036  r6 = 00000003  r5 = 00000000  r4 = 00000080
> Code: e1a0a001 e1a04002 e1a08003 e59b9004 (e59e7000)
>  <6>note: flash_eraseall[715] exited with preempt_count 3
> MTD_close
> Unable to handle kernel NULL pointer dereference at virtual address 
> 00000000
> pgd = c0004000
> [00000000] *pgd=00000000
> Internal error: Oops: 17 [#2]
> Modules linked in:
> CPU: 0
> PC is at __wake_up_common+0x28/0x7c
> LR is at __init_begin+0x3fff8000/0x38
> pc : [<c0044558>]    lr : [<00000000>]    Not tainted
> sp : c765fa58  ip : c765fa84  fp : c765fa80
> r10: 00000003  r9 : 00000000  r8 : 00000000
> r7 : c7bc7c40  r6 : 00000000  r5 : c0b52134  r4 : 00000001
> r3 : 00000000  r2 : 00000001  r1 : 00000003  r0 : c0b52134
> Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  Segment user
> Control: 5317F  Table: 17898000  DAC: 00000015
> Process flash_eraseall (pid: 715, stack limit = 0xc765e194)
> Stack: (0xc765fa58 to 0xc7660000)
> fa40:                                                       c765e000
> 60000013
> fa60: 00000000 c7bc7c40 c0b520e0 c0b52118 c765fab4 c765fa9c c765fa84
> c00445ec
> fa80: c0044540 00000000 c765e000 c0b520e0 c765faf0 c765faa0 c0163dd4
> c00445bc
> faa0: 00000000 c0a68300 c0044518 00000000 00000000 00000000 c0a68300
> c0044518
> fac0: 00000000 00000000 c0817e00 c0a770c0 c7671994 c7bc7c40 c03b42a0
> 00000017
> fae0: 00000000 c765fb00 c765faf4 c0159668 c0163c7c c765fb14 c765fb04
> c015bc78
> fb00: c015965c 00000008 c765fb38 c765fb18 c00869b8 c015bc54 c0a770c0
> 00000000
> fb20: c03c5c80 c03c5c88 00000001 c765fb4c c765fb3c c0086910 c0086924
> c0a770c0
> fb40: c765fb68 c765fb50 c0084eb8 c0086888 00000001 c03c5c80 00000003
> c765fb8c
> fb60: c765fb6c c004a224 c0084e50 c765e000 c03c5c80 c0a68300 00000001
> 0000000b
> fb80: c765fbb0 c765fb90 c004af70 c004a1a4 c765e000 00000017 c01e7d50
> c765fcd0
> fba0: c0a68300 c765fbd0 c765fbb4 c0026344 c004ad94 00000000 c765fcd0
> c001d1e0
> fbc0: 00000017 c765fbf0 c765fbd4 c0027d4c c00262b8 ffffffec c001d210
> c001d1e0
> fbe0: c765fcd0 c765fc24 c765fbf4 c0028050 c0027cf0 c0218340 c036a320
> ffffffff
> fc00: c02140c8 00000017 c765fcd0 00000000 00000093 00000003 c765fccc
> c765fc28
> fc20: c00281a8 c0027f30 00000000 c01e19f8 00000000 00000020 c0260eb7
> 30303030
> fc40: c0353434 1767a0ff c001b90c c765fc8c c026b628 c765fc70 c765fc90
> c765fc68
> fc60: c0148170 c014595c c02222e0 00001332 0000135c ffffeca4 c0260ae5
> 60000013
> fc80: 00000030 c765fcac c765fc94 c004854c c0147f68 0000135c c0216960
> c0216964
> fca0: c765fcc4 c765fcb0 c00485dc ffffffff c765fd04 ffffb8b2 c0b52118
> 00000000
> fcc0: c765fd40 c765fcd0 c0020940 c002817c c0b52134 00000003 00000001
> 00000000
> fce0: 00000001 c0b52134 ffffb8b2 c0b52118 00000000 00000000 00000003
> c765fd40
> fd00: c765fd44 c765fd18 00000000 c0044558 00000093 ffffffff c765e000
> 60000013
> fd20: ffffb8b2 c0b52118 c0801f88 c765e000 c0b52118 c765fd5c c765fd44
> c00445ec
> fd40: c0044540 00000000 00000002 00000001 c765fd84 c765fd60 c0160cdc
> c00445bc
> fd60: 0000ffff 00000002 00000001 ffffb8b2 c0801f88 c0b520e0 c765fe30
> c765fd88
> fd80: c0163b54 c0160b68 00000554 00000aaa 00000aaa 00000554 00000aaa
> 00000000
> fda0: 00020000 00440000 fefecb00 0000ffff 00000030 00000055 000000aa
> 00000080
> fdc0: 00000055 000000aa c02222e0 0000132f 60000013 00001322 ffffecd1
> c0260ac5
> fde0: 00000000 c0a68300 c0044518 00000000 00000000 00000000 c0a68300
> c0044518
> fe00: 00000000 00000000 00020000 00440000 00000000 00000000 00440000
> c0af9f80
> fe20: 00000000 c765fe74 c765fe34 c015fad8 c01633c4 00000000 c0b52118
> c0af9f80
> fe40: c0b520e0 c0801f88 c01633b4 00000000 c74cfba0 c74cfba0 c0817e00
> c765e000
> fe60: c765ff00 00000000 c765fe94 c765fe78 c0163bcc c015f88c 00020000
> 00000000
> fe80: 00000000 bedacdb0 c765fea4 c765fe98 c01594fc c0163bac c765ff38
> c765fea8
> fea0: c015c3ac c01594bc 00000029 40017029 c765e000 c082abdc c765fee0
> c765fec8
> fec0: c00445ec c0044540 00000000 c765e000 c082a00c c765fefc 00000000
> c0a68300
> fee0: c0044518 00000000 00000000 00000000 c0a68300 c0044518 00000000
> 00000000
> ff00: c765ff00 c765ff00 00000000 c01333b4 c0a770c0 ffffffe7 bedacdb0
> 40084d02
> ff20: c0020f44 c765e000 00011a54 c765ff58 c765ff3c c009abdc c015c0b0
> bedacdb0
> ff40: c0a770c0 00000000 00000003 c765ff80 c765ff5c c009af34 c009ab6c
> 00000000
> ff60: 401421f0 fffffff7 bedacdb0 40084d02 c0a770c0 c765ffa4 c765ff84
> c009af98
> ff80: c009ad44 00000000 00000080 00000000 00000003 00000036 00000000
> c765ffa8
> ffa0: c0020dc0 c009af64 00000080 c002821c 00000003 40084d02 bedacdb0
> 00000000
> ffc0: 00000080 00000000 00000003 00011a2c 00000000 00011a28 00011a54
> 00011a5c
> ffe0: 00011a0c bedacdac 00008b4c 400eaed4 60000010 00000003 a1b11142
> 12082062
> Backtrace:
> [<c0044530>] (__wake_up_common+0x0/0x7c) from [<c00445ec>]
> (__wake_up+0x40/0x64)
> [<c00445ac>] (__wake_up+0x0/0x64) from [<c0163dd4>]
> (cfi_amdstd_sync+0x168/0x194)
>  r5 = C0B520E0  r4 = C765E000
> [<c0163c6c>] (cfi_amdstd_sync+0x0/0x194) from [<c0159668>]
> (part_sync+0x1c/0x20)
> [<c015964c>] (part_sync+0x0/0x20) from [<c015bc78>] (mtd_close+0x34/0x48)
> [<c015bc44>] (mtd_close+0x0/0x48) from [<c00869b8>] (__fput+0xa4/0x18c)
>  r4 = 00000008
> [<c0086914>] (__fput+0x0/0x18c) from [<c0086910>] (fput+0x98/0x9c)
>  r8 = 00000001  r7 = C03C5C88  r6 = C03C5C80  r5 = 00000000
>  r4 = C0A770C0
> [<c0086878>] (fput+0x0/0x9c) from [<c0084eb8>] (filp_close+0x78/0x84)
>  r4 = C0A770C0
> [<c0084e40>] (filp_close+0x0/0x84) from [<c004a224>]
> (put_files_struct+0x90/0xd0)
>  r6 = 00000003  r5 = C03C5C80  r4 = 00000001
> [<c004a194>] (put_files_struct+0x0/0xd0) from [<c004af70>]
> (do_exit+0x1ec/0x484)
>  r8 = 0000000B  r7 = 00000001  r6 = C0A68300  r5 = C03C5C80
>  r4 = C765E000
> [<c004ad84>] (do_exit+0x0/0x484) from [<c0026344>] (die+0x9c/0xa0)
>  r8 = C0A68300  r7 = C765FCD0  r6 = C01E7D50  r5 = 00000017
>  r4 = C765E000
> [<c00262a8>] (die+0x0/0xa0) from [<c0027d4c>] 
> (__do_kernel_fault+0x6c/0x7c)
>  r7 = 00000017  r6 = C001D1E0  r5 = C765FCD0  r4 = 00000000
> [<c0027ce0>] (__do_kernel_fault+0x0/0x7c) from [<c0028050>]
> (do_page_fault+0x130/0x144)
>  r7 = C765FCD0  r6 = C001D1E0  r5 = C001D210  r4 = FFFFFFEC
> [<c0027f20>] (do_page_fault+0x0/0x144) from [<c00281a8>]
> (do_DataAbort+0x3c/0xa0)
> [<c002816c>] (do_DataAbort+0x0/0xa0) from [<c0020940>]
> (__dabt_svc+0x40/0x60)
>  r8 = 00000000  r7 = C0B52118  r6 = FFFFB8B2  r5 = C765FD04
>  r4 = FFFFFFFF
> [<c0044530>] (__wake_up_common+0x0/0x7c) from [<c00445ec>]
> (__wake_up+0x40/0x64)
> [<c00445ac>] (__wake_up+0x0/0x64) from [<c0160cdc>] 
> (put_chip+0x184/0x194)
>  r5 = 00000001  r4 = 00000002
> [<c0160b58>] (put_chip+0x0/0x194) from [<c0163b54>]
> (do_erase_oneblock+0x7a0/0x7e8)
>  r8 = C0B520E0  r7 = C0801F88  r6 = FFFFB8B2  r5 = 00000001
>  r4 = 00000002
> [<c01633b4>] (do_erase_oneblock+0x0/0x7e8) from [<c015fad8>]
> (cfi_varsize_frob+0x25c/0x2e4)
> [<c015f87c>] (cfi_varsize_frob+0x0/0x2e4) from [<c0163bcc>]
> (cfi_amdstd_erase_varsize+0x30/0x60)
> [<c0163b9c>] (cfi_amdstd_erase_varsize+0x0/0x60) from [<c01594fc>]
> (part_erase+0x50/0x5c)
>  r5 = BEDACDB0  r4 = 00000000
> [<c01594ac>] (part_erase+0x0/0x5c) from [<c015c3ac>] 
> (mtd_ioctl+0x30c/0x8d4)
> [<c015c0a0>] (mtd_ioctl+0x0/0x8d4) from [<c009abdc>] (do_ioctl+0x80/0x94)
> [<c009ab5c>] (do_ioctl+0x0/0x94) from [<c009af34>] 
> (vfs_ioctl+0x200/0x220)
>  r7 = 00000003  r6 = 00000000  r5 = C0A770C0  r4 = BEDACDB0
> [<c009ad34>] (vfs_ioctl+0x0/0x220) from [<c009af98>] 
> (sys_ioctl+0x44/0x60)
>  r7 = C0A770C0  r6 = 40084D02  r5 = BEDACDB0  r4 = FFFFFFF7
> [<c009af54>] (sys_ioctl+0x0/0x60) from [<c0020dc0>]
> (ret_fast_syscall+0x0/0x2c)
>  r7 = 00000036  r6 = 00000003  r5 = 00000000  r4 = 00000080
> Code: e1a0a001 e1a04002 e1a08003 e59b9004 (e59e7000)
>  <1>Fixing recursive fault but reboot is needed!
> scheduling while atomic: flash_eraseall/0x00000005/715
> scheduling while atomic: flash_eraseall/0x00000005/715
> -- cut --
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
