From: eric.dejonc@thales-e-transactions.com (Eric DEJONC)
Date: Mon, 31 Mar 2003 11:03:50 +0200
Subject: Unable to handle kernel paging request at virtualaddress80000013
References: <3E8303F3.980B0F02@thales-e-transactions.com>
 <200303272119.02420.tglx@linutronix.de>
 <3E87F022.F65810C7@thales-e-transactions.com> <200303311102.55397.tglx@linutronix.de>
Message-ID: <3E880475.1D0C8B3D@thales-e-transactions.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

ok,
thank you for help, but I still can't mount the jffs2:
I don't understand at all, the error seems to come from the jeddec_probe_chip: I
have not selected in the menuconfig something that contains Jedec!
I have an Intel strataflash chip!



/ # mount -t jffs2 /dev/mtdb2 /mnt
mtdblock_open
jffs2: read_super for device mtdblock(31,2)
jffs2_scan_eraseblock(): Scanning block at 0x0
Unable to handle kernel NULL pointer dereference at virtual address 00000038
pgd = c1424000
*pgd = 00000000, *pmd = 00000000
Internal error: Oops: c1427005

here is the decode:
>>r10; ffffffff <END_OF_CODE+397bf3ec/????>
Trace; c00fa5fc <jedec_probe_chip+6f8/f10>
Trace; c009cba8 <jffs2_scan_empty+e4/218>
Trace; c009cac4 <jffs2_scan_empty+0/218>
Trace; c009c27c <jffs2_scan_eraseblock+54/89c>
Trace; c009c228 <jffs2_scan_eraseblock+0/89c>
Trace; c009c02c <jffs2_scan_medium+60/25c>
Trace; c009bfcc <jffs2_scan_medium+0/25c>
Trace; c009f15c <jffs2_build_filesystem+18/1ec>
Trace; c009f144 <jffs2_build_filesystem+0/1ec>
Trace; c009affc <jffs2_fill_super+2f4/448>
Trace; c009ad08 <jffs2_fill_super+0/448>
Trace; c0064be8 <get_sb_bdev+29c/310>
Trace; c006494c <get_sb_bdev+0/310>
Trace; c009b2dc <jffs2_get_sb+1c/28>
Trace; c009b2c0 <jffs2_get_sb+0/28>
Trace; c0064de8 <do_kern_mount+58/f4>
Trace; c0064d90 <do_kern_mount+0/f4>
Trace; c007d924 <do_add_mount+94/184>
Trace; c007d890 <do_add_mount+0/184>
Trace; c007dc64 <do_mount+178/18c>
Trace; c007daec <do_mount+0/18c>
Trace; c007e4b0 <sys_mount+9c/e4>
Trace; c007e414 <sys_mount+0/e4>
Trace; c001b6a0 <ret_fast_syscall+0/38>
Code;  c00fa604 <jedec_probe_chip+700/f10>
00000000 <_EIP>:
Code;  c00fa604 <jedec_probe_chip+700/f10>
   0:   04 b0                     add    $0xb0,%al
Code;  c00fa606 <jedec_probe_chip+702/f10>
   2:   4c                        dec    %esp
Code;  c00fa607 <jedec_probe_chip+703/f10>
   3:   e2 00                     loop   5 <_EIP+0x5> c00fa609
<jedec_probe_chip+705/f10>
Code;  c00fa609 <jedec_probe_chip+705/f10>
   5:   70 a0                     jo     ffffffa7 <_EIP+0xffffffa7> c00fa5ab
<jedec_probe_chip+6a7/f10>
Code;  c00fa60b <jedec_probe_chip+707/f10>
   7:   e1 10                     loope  19 <_EIP+0x19> c00fa61d
<jedec_probe_chip+719/f10>
Code;  c00fa60d <jedec_probe_chip+709/f10>
   9:   d0 4d e2                  rorb   0xffffffe2(%ebp)
Code;  c00fa610 <jedec_probe_chip+70c/f10>
   c:   84 c0                     test   %al,%al
Code;  c00fa612 <jedec_probe_chip+70e/f10>
   e:   97                        xchg   %eax,%edi
Code;  c00fa613 <jedec_probe_chip+70f/f10>   <=====
   f:   e5 38                     in     $0x38,%eax   <=====
Code;  c00fa615 <jedec_probe_chip+711/f10>
  11:   00 9c e5 00 00 00 00      add    %bl,0x0(%ebp,8)







Thomas Gleixner a ?crit :

> On Monday 31 March 2003 09:37, Eric DEJONC wrote:
> > Hi,
> >
> >  I have a question....
> >   What is the physical start adress of flash mapping, and where can I find
> > it. I get different results if I change this value. In the
> > arch/arm/machsa1100/trizeps.c, its is written:
> The physical address is defined by your board design. It depends on the
> chipselect, addressdecoding...
> The virtual address is the address which is used inside the kernel driver
> code. This address is translated by the MMU into a physical address.
> e.g.
> MTD driver uses virtual address 0xf0000000 according to chip-mapping. So a
> read from 0xf0000000 is a read from the physical address 0x30000000, which is
> the physical hardware address of the flash chip.
>
> --
> Thomas
> ________________________________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx at linutronix.de
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
