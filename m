Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from smtprtp1.ntcom.nortel.net ([137.118.22.14])
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11eWLG-0005m3-00
	for mtd@infradead.org; Fri, 22 Oct 1999 05:30:14 +0100
Message-ID: <380FE715.B58DDE49@americasm01.nt.com>
Date: Thu, 21 Oct 1999 23:24:53 -0500
From: "Mark Ferrell" <mferrell@nortelnetworks.com>
MIME-Version: 1.0
To: David Woodhouse <David.Woodhouse@mvhi.com>
CC: mtd@infradead.org
Subject: Re: pmc551 status
References: <E11eD1f-0002cH-00@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Yah .. that's the interesting part .. I can write/read to/from the /dev/mtd0 just
fine from what I can tell, but when I load the mtdblock0 it causes an ugly kernel
panic.

Anyway .. here is an output of what is going on, though I don't know what extent
you want me to test /dev/mtd0 at.

[root@(none) /mnt/src/mtd-19990820/kernel]# insmod mtd.o
[root@(none) /mnt/src/mtd-19990820/kernel]# insmod pmc551.o
pmc551: Found PCI V370PDC IRQ:11
pmc551: 256M (0x10000000) of prefetchable memory at 0x90000000
pmc551: DRAM_BLK3 Flags: RW,On
pmc551: DRAM_BLK2 Flags: RW,On
pmc551: DRAM_BLK1 Flags: RW,On
pmc551: DRAM_BLK0 Flags: RW,On
pmc551: Memory Access on
pmc551: I/O Access off
pmc551: Devsel Fast
pmc551: Not Fast Back-to-Back
Registered pmc551 device from 2359296Kb to 2621440Kb
Mapped from 0xd4005008 to 0xe4005008

[root@(none) /mnt/src/mtd-19990820/kernel]# cd /proc
[root@(none) /proc]# cat devices
Character devices:
  1 mem
  2 pty
  3 ttyp
  4 ttyS
  5 cua
 10 misc
 90 mtd
128 ptm
136 pts

Block devices:
  1 ramdisk
  7 loop

[root@(none) /proc]# cat ksyms > /dev/mtd0
pmc551: writing 0xc00 to 0xd4005008
pmc551: writing 0xc00 to 0xd4005c08
pmc551: writing 0xc00 to 0xd4006808
pmc551: writing 0xc00 to 0xd4007408
pmc551: writing 0xc00 to 0xd4008008
pmc551: writing 0x3d5 to 0xd4008c08

[root@(none) /proc]# /mnt/bin/head -50 /dev/mtd0
d400304c pmc551_erase   [pmc551]
d40030d4 pmc551_point   [pmc551]
d40031d4 pmc551_init    [pmc551]
d40030f0 pmc551_unpoint [pmc551]
d4003c90 mymtd  [pmc551]
d4003164 pmc551_write   [pmc551]
d40030f4 pmc551_read    [pmc551]
d4000b58 get_mtd_device [mtd]
d4000b6c del_mtd_device [mtd]
d4000c1c register_mtd_notifier  [mtd]
d4000c68 unregister_mtd_notifier        [mtd]
d4000aa4 add_mtd_device [mtd]
d4001090 proc_mtd       [mtd]
c0003e3c clear_page
c0007b38 do_signal
c0009b70 syscall_trace
c0003000 transfer_to_handler
c0003b44 int_return
c0005edc do_IRQ
c0005504 MachineCheckException
c0005728 AlignmentException
c00056a0 ProgramCheckException
c00056f4 SingleStepException
c0007548 sys_sigreturn
c0108070 ppc_n_lost_interrupts
c00086ac do_lost_interrupts
c0005bd8 enable_irq
c0005b8c disable_irq
c0005b40 disable_irq_nosync
c0108078 ppc_local_irq_count
c0108068 ppc_local_bh_count
c00e86c8 isa_io_base
c00e86cc isa_mem_base
c00e86d0 pci_dram_offset
c010802c ISA_DMA_THRESHOLD
c010805c DMA_MODE_READ
c0108044 DMA_MODE_WRITE
c01080a4 _prep_type
c0108050 ucSystemType
c0008778 atomic_add
c00087a4 atomic_sub
c00087b8 atomic_inc
c00087cc atomic_inc_return
c00087e4 atomic_dec
c00087f8 atomic_dec_return
c0008810 atomic_dec_and_test
c0008d24 set_bit
c0008d90 clear_bit
c0008dfc change_bit
c0008e68 test_and_set_bit
[root@(none) /proc]# cd /mnt/src/mtd-19990820/kernel/
[root@(none) /mnt/src/mtd-19990820/kernel]# insmod mtdblock.o
NIP: C000EE54 XER: 00000000 LR: C0017A20 REGS: cf6b5da0 TRAP: 0300
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = cf6b4000[37] 'insmod' mm->pgd c11f3000 Last syscall: 127
last math cf6b4000
GPR00: C0017A08 CF6B5E50 CF6B4000 E4007000 00000000 00000048 E4006FFC 00008000
GPR08: CF710000 C0110000 00007B49 C0110000 2222222C 01901170 00000000 00000000
GPR16: 018D2C10 00000000 FFFFFFFF 00000000 00009032 0F6B5E80 00000000 C0003B44
GPR24: C0003878 00000002 00000001 019002D8 0000080C 00000008 00000008 E4007000
Call backtrace:
C0017A08 C00038CC 00000002 0181DFF0 0181B2E0 01814308 0184CFFC
00000000
Kernel panic: kernel access of bad area pc c000ee54 lr c0017a20 address
E4007007





David Woodhouse wrote:

> mferrell@nortelnetworks.com said:
> >  And that's it.  It opens the device for a short duration of time ..
> > but nothing comes forth.  I tried all sortsa fun with noluck.  Any
> > ideas, suggestions, large bat's to beat the system about the head
> > with?
>
> Hmmm. To test your driver itself, use the character devices, which are what
> /dev/mtd0 ought to be.
>
> When you're sure that's OK, you ought just to be able to load the mtdblock
> device (after your driver) and use /dev/mtdblock0 too. There may be bugs in
> the mtdblock code, however.
>
> Can you trace and send me the oops that you get if you load mtd, pmc551, then
> mtdblock in that order?
>
> Also, it's worth checking that the mtdblock code actually sets the size of the
> block device. The kernel might be refusing to pass on any read() requests
> because we've left the device size set to zero.
>
> ----                                ----                                 ----
> David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
>  Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
>     Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
>              finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.

--
 Mark Ferrell  : mferrell@nortelnetworks.com
(972) 685-7868 : Desk
(972) 685-4210 : Lab
(972) 879-4326 : Pager





To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
