From: eric.dejonc@thales-e-transactions.com (Eric DEJONC)
Date: Mon, 31 Mar 2003 09:37:06 +0200
Subject: Unable to handle kernel paging request at virtualaddress80000013
References: <3E8303F3.980B0F02@thales-e-transactions.com>
 <1048778440.30799.76.camel@henrik.marasystems.com>
 <3E832D9D.8C65AC7@thales-e-transactions.com> <200303272119.02420.tglx@linutronix.de>
Message-ID: <3E87F022.F65810C7@thales-e-transactions.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,

 I have a question....
  What is the physical start adress of flash mapping, and where can I find it.
I get different results if I change this value. In the
arch/arm/machsa1100/trizeps.c, its is written:

static struct map_desc trizeps_io_desc[] __initdata = {
 /* Defines in trizeps.h */
 /* r = read   w = write   c = cache   b = buffer */
 /* virtual     physical    length      domain     r  w  c  b */
 { 0xe8000000, 0x00000000, 0x01000000, DOMAIN_IO, 0, 1, 0, 0 }, /* Flash bank
0, neccessary for mtd */

 { 0xF0000000l, 0x30000000l, 0x00800000l, DOMAIN_IO, 1, 1, 0, 0 },
 { 0xF2000000l, 0x38000000l, 0x00800000l, DOMAIN_IO, 1, 1, 0, 0 },
 LAST_DESC
};

Does it mean that I have to put 0 to the physical start adress of flash
mapping?


I patched the kernel, Here is the error I get when I try to mount the flash
disk.
thank's  in advance
Eric


>>EIP; c00fd654 <cfi_intelext_read_fact_prot_reg+18/94>   <=====
>>r10; ffffffff <END_OF_CODE+397b6148/????>
Trace; c00fd63c <cfi_intelext_read_fact_prot_reg+0/94>
Trace; c009eba8 <jffs2_scan_empty+e4/218>
Trace; c009eac4 <jffs2_scan_empty+0/218>
Trace; c009e27c <jffs2_scan_eraseblock+54/89c>
Trace; c009e228 <jffs2_scan_eraseblock+0/89c>
Trace; c009e02c <jffs2_scan_medium+60/25c>
Trace; c009dfcc <jffs2_scan_medium+0/25c>
Trace; c00a115c <jffs2_build_filesystem+18/1ec>
Trace; c00a1144 <jffs2_build_filesystem+0/1ec>
Trace; c009cffc <jffs2_fill_super+2f4/448>
Trace; c009cd08 <jffs2_fill_super+0/448>
Trace; c0066be8 <get_sb_bdev+29c/310>
Trace; c006694c <get_sb_bdev+0/310>
Trace; c009d2dc <jffs2_get_sb+1c/28>
Trace; c009d2c0 <jffs2_get_sb+0/28>
Trace; c0066de8 <do_kern_mount+58/f4>
Trace; c0066d90 <do_kern_mount+0/f4>
Trace; c007f924 <do_add_mount+94/184>
Trace; c007f890 <do_add_mount+0/184>
Trace; c007fc64 <do_mount+178/18c>
Trace; c007faec <do_mount+0/18c>
Trace; c00804b0 <sys_mount+9c/e4>
Trace; c0080414 <sys_mount+0/e4>
Trace; c001d6a0 <ret_fast_syscall+0/38>
Code;  c00fd644 <cfi_intelext_read_fact_prot_reg+8/94>
00000000 <_EIP>:
Code;  c00fd644 <cfi_intelext_read_fact_prot_reg+8/94>
   0:   04 b0                     add    $0xb0,%al
Code;  c00fd646 <cfi_intelext_read_fact_prot_reg+a/94>
   2:   4c                        dec    %esp
Code;  c00fd647 <cfi_intelext_read_fact_prot_reg+b/94>
   3:   e2 00                     loop   5 <_EIP+0x5> c00fd649
<cfi_intelext_read_fact_prot_reg+d/94>
Code;  c00fd649 <cfi_intelext_read_fact_prot_reg+d/94>
   5:   70 a0                     jo     ffffffa7 <_EIP+0xffffffa7> c00fd5eb
<cfi_intelext_read_user_prot_reg+47/98>
Code;  c00fd64b <cfi_intelext_read_fact_prot_reg+f/94>
   7:   e1 10                     loope  19 <_EIP+0x19> c00fd65d
<cfi_intelext_read_fact_prot_reg+21/94>
Code;  c00fd64d <cfi_intelext_read_fact_prot_reg+11/94>
   9:   d0 4d e2                  rorb   0xffffffe2(%ebp)
Code;  c00fd650 <cfi_intelext_read_fact_prot_reg+14/94>
   c:   84 c0                     test   %al,%al
Code;  c00fd652 <cfi_intelext_read_fact_prot_reg+16/94>
   e:   97                        xchg   %eax,%edi
Code;  c00fd653 <cfi_intelext_read_fact_prot_reg+17/94>   <=====
   f:   e5 38                     in     $0x38,%eax   <=====
Code;  c00fd655 <cfi_intelext_read_fact_prot_reg+19/94>
  11:   00 9c e5 00 00 00 00      add    %bl,0x0(%ebp,8)






Thomas Gleixner a ?crit :

> On Thursday 27 March 2003 17:58, Eric DEJONC wrote:
> > Thank you all for your help,
> > I gave the vmlinux file but  compiled with the cross compiler I  think it
> > was the right think to do, i gave too the system.map and the sykms. The
> > output seems to denote that the problem comes from the jffs2, driver?
>
> Could you please try the following:
>
> 1. Get current MTD source from MTD-CVS or pick a snapshot.
> 2. read INSTALL in the base directory of MTD soruce
> 3. use install.sh in mtd/patches to update your kernel
> 4. compile and try again
> 5. report results
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
