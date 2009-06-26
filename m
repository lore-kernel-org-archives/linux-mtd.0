Received: from smtp-out4.atlngahp.sys.nuvox.net ([70.43.63.22]
	helo=smtp04.atlngahp.sys.nuvox.net)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MKBe4-000652-Hq
	for linux-mtd@lists.infradead.org; Fri, 26 Jun 2009 13:39:19 +0000
Received: from webmail.nuvox.net (webmail.nuvox.net [64.89.70.59])
	by smtp04.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	n5QDd1so017233
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jun 2009 09:39:01 -0400
Message-ID: <4862.137.237.242.66.1246023541.squirrel@webmail.nuvox.net>
Date: Fri, 26 Jun 2009 09:39:01 -0400 (EDT)
Subject: Linux 2.6.25, Problem with 64MB flash on Freescale M5485EVB
From: jkimble@one.net
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I've been having a very strange problem while trying to get 64MB of flash
to work with a custom board based on the Freescale M5485EVB board (Intel
P33 flash with CS lines tied together for 32 bit width). I had no problem
with this for the 2.6.10 kernel so I know the hardware is OK. U-Boot had
no problem with it but the 2.6.25 kernel doesn't want to see 64MB. I can
get it to work with 38MB but no more than that (yeah, weird!!).

In this case the only thing I've had to do in the kernel is specify a
length of 0x03ffffff rather than 0x04000000 because the larger size causes
the mtd physmap routine to fail with a FAULT 5. The smaller size seems to
allow everything to boot up fine.

Kernel boot is always OK when initializing partitions. I see:

---------------- snip ------------------------------------

Driver 'sd' needs updating - please use bus_type methods
physmap platform flash device: 03ffffff at fc000000
physmap-flash.0: Found 2 x16 devices at 0x0 in 32-bit bank
NOR chip too large to fit in mapping. Attempting to cope...
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
Using auto-unlock on power-up/resume
cfi_cmdset_0001: Erase suspend on write enabled
Reducing visibility of 65536KiB chip to 65535KiB
2 cmdlinepart partitions found on MTD device physmap-flash.0
Creating 2 MTD partitions on "physmap-flash.0":
0x00000000-0x00400000 : "kernel"
0x00400000-0x03b00000 : "root"
DSPI: Coldfire master initialized

------------------- snip -------------------------------------

With an NFS kernel I'm able to specify a root partition of 60M in bootargs
as in:

root=/dev/nfs rw nfsroot=137.237.242.53:/tftpboot/ltib
ip=137.237.242.175:137.237.242.53:137.237.242.13:255.255.255.0:ColdFire:eth0ff
mtdparts=physmap-flash.0:4M(kernel)ro,60M(root)

But when I burn the kernel and rootfs (21M) to flash and try to boot with
a bootargs of (anything bigger than 38M fails):

root=/dev/mtdblock1 rw rootfstype=jffs2
mtdparts=physmap-flash.0:4M(kernel)ro,55M(root)

I get the following messages and the kernel panics:

--------------  snip 
---------------------------------------------------------

RPC: Registered tcp transport module.
Bad page state in process 'swapper'
page:003bba70 flags:0x0000000c mapping:00000002 mapcount:1 count:0
Trying to fix it up, but a reboot is needed
Backtrace:
Stack from 0702daf0:
       <0> 0702db00<0> 002e687c<0> 0005118c<0> 00281bfc<0> 003bba88<0>
003bba70<
0> 00051f52<0> 003bba70
       <0> 00000000<0> 000000d0<0> 00000000<0> 00000010<0> 002e6db0<0>
00000000<
0> 00000000<0> 0702a000
       <0> fc480000<0> 002e6db4<0> 00000004<0> 00000000<0> 00000000<0>
00000000<
0> 00000001<0> 00000000

                                            ;;;;

Totlen for ref at 071721f8 (0x00080000-0x575d5555) miscalculated as
0xffcd9759 i
nstead of 57555555
No next ref. jeb->last_node is 071721f8
jeb->wasted_size 2e68a8, dirty_size 3bbac0, used_size 1, free_size 2e68a8
------------[ cut here ]------------
WARNING: at fs/jffs2/nodelist.c:766 __jffs2_ref_totlen+0x286/0x340()
Modules linked in:
Stack from 0702dab8:
       <0> 0702dac8<0> 071721f8<0> 0002c910<0> 0027d944<0> 00291d4a<0>
000002fe<
0> 0702dae9<0> 0027d91b
                                        ;;;;;

<0> 07134eae<0> 000c0000<0> 070255f5<0> 00000002<0> 00000000<0> 00000000<
0> 00000000<0> 0000000a
Call Trace:
       <0> [<0011519a>]<0> [<001179d6>]<0> [<00117382>]<0> [<001179d6>]
       <0> [<001941ea>]<0> [<00194432>]<0> [<001179d6>]<0> [<00077844>]
       <0> [<0007f7f8>]<0> [<0006c73e>]<0> [<00117882>]<0> [<001179d6>]
       <0> [<00071112>]<0> [<00071210>]<0> [<00051af2>]<0> [<000859de>]
       <0> [<00085b86>]<0> [<00083d20>]<0> [<00052416>]<0> [<00083dde>]
       <0> [<00085c56>]<0> [<000412f2>]<0> [<000790ac>]<0> [<00079592>]
       <0> [<0013f7c2>]<0> [<00021228>]<0> [<000795a8>]<0> [<001735b4>]
       <0> [<0002d1a6>]<0> [<0004afd6>]<0> [<000212a2>]<0> [<000212da>]
Kernel panic - not syncing: Attempted to kill init!

------------------ snip -------------------------------------------------

This is very weird!! Anyone have any ideas about what might be causing this?
