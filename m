Received: from mailgate4.kornet.net ([211.48.62.207]
	helo=mailgate4.mailhost2.kornet.net)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWsUv-0004qe-Hm
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2004 03:27:38 -0500
Received: from shamu ([61.73.151.203]) by mailgate4.mailhost2.kornet.net
	with ESMTP id <20041124082726.BNFV478.mailgate4@shamu>
	for <linux-mtd@lists.infradead.org>; Wed, 24 Nov 2004 17:27:26 +0900
From: "shamu" <shamu@semidj.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 24 Nov 2004 13:57:18 +0530
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <E1CWe1Q-0003gk-2V@canuck.infradead.org>
Message-Id: <20041124082726.BNFV478.mailgate4@shamu>
Subject: RE: JFFS & MTD Port
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,
My previous mail regarding MTD & JFFS.
In that mail I didn't mention specifically what I want from you guys.
Here I try to give explanation. If anybody has the idea, please suggest me.
I like port NOR flash device on my target (MIPS), where I have to port
In Linux or BOOTLOADER? Along with MTD & JFFS.
Your help appreciated.
Thanks in advance
Shamu


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
linux-mtd-request@lists.infradead.org
Sent: Tuesday, November 23, 2004 10:30 PM
To: linux-mtd@lists.infradead.org
Subject: linux-mtd Digest, Vol 20, Issue 36

Send linux-mtd mailing list submissions to
	linux-mtd@lists.infradead.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.infradead.org/mailman/listinfo/linux-mtd
or, via email, send a message with subject or body 'help' to
	linux-mtd-request@lists.infradead.org

You can reach the person managing the list at
	linux-mtd-owner@lists.infradead.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of linux-mtd digest..."


Today's Topics:

   1. Re: mkfs.ext3 - segmentation fault (Dmitry Skorinko)
   2. RE: MTD & JFFS porting help (shamu)
   3. RE: MTD & JFFS porting help (David Woodhouse)


----------------------------------------------------------------------

Message: 1
Date: Mon, 22 Nov 2004 21:50:03 +0300
From: Dmitry Skorinko <skorinkod@mosk.ru>
Subject: Re: mkfs.ext3 - segmentation fault
To: linux-mtd@lists.infradead.org
Message-ID: <200411222150.03956.skorinkod@mosk.ru>
Content-Type: text/plain;  charset="koi8-r"

22 nOQBRX 2004 18:44, Dmitry Skorinko NAPISAL:
> On Monday 22 November 2004 16:21, you wrote:
> > Dmitry Skorinko wrote:
> > >try current cvs and have same :((   :
> >
> > Try the attached patch.
> 

I wanted to say that it's working. thanx
Dmitry




------------------------------

Message: 2
Date: Tue, 23 Nov 2004 07:46:26 +0530
From: "shamu" <shamu@semidj.com>
Subject: RE: MTD & JFFS porting help
To: <linux-mtd@lists.infradead.org>
Message-ID: <20041123021558.BQQ11941.mailgate1@shamu>
Content-Type: text/plain;	charset="us-ascii"

Dear All,
I am new to this Techies, could you help me regarding how to port.
MTD & JFFS on my target, My target is MIPS.
Thanks in advance
shashank

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
linux-mtd-request@lists.infradead.org
Sent: Monday, November 22, 2004 3:55 PM
To: linux-mtd@lists.infradead.org
Subject: linux-mtd Digest, Vol 20, Issue 33

Send linux-mtd mailing list submissions to
	linux-mtd@lists.infradead.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.infradead.org/mailman/listinfo/linux-mtd
or, via email, send a message with subject or body 'help' to
	linux-mtd-request@lists.infradead.org

You can reach the person managing the list at
	linux-mtd-owner@lists.infradead.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of linux-mtd digest..."


Today's Topics:

   1. Re: [2.6 patch] MTD: some cleanups (Adrian Bunk)
   2. Re: [2.6 patch] MTD: some cleanups (David Woodhouse)
   3. Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies (Adrian Bunk)
   4. Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies (Nicolas Pitre)
   5. BUG at dcache.h:276! Causing oops when I rmmod a nand module
      having mulitple partitions (Brad Beveridge)
   6. Re: BUG at dcache.h:276! Causing oops when I rmmod a nand
      module having mulitple partitions (Brad Beveridge)
   7. Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies (David Woodhouse)
   8. mkfs.ext3 - segmentation fault (Dmitry Skorinko)
   9. Re: mkfs.ext3 - segmentation fault (Sean Young)
  10. Re: mkfs.ext3 - segmentation fault (Kalev Lember)


----------------------------------------------------------------------

Message: 1
Date: Sun, 21 Nov 2004 19:01:50 +0100
From: Adrian Bunk <bunk@stusta.de>
Subject: Re: [2.6 patch] MTD: some cleanups
To: David Woodhouse <dwmw2@redhat.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <20041121180150.GE2924@stusta.de>
Content-Type: text/plain; charset=us-ascii

On Tue, Nov 16, 2004 at 06:26:07PM +0000, David Woodhouse wrote:
> On Fri, 2004-11-12 at 14:53 +0100, Adrian Bunk wrote:
> > The patch below makes the following cleanups for code under drivers/mtd/
:
> > - make some needlessly global code static
> 
> OK.

Thanks.

> > - remove the following unused code:
> >   - function ftl_freepart in drivers/mtd/ftl.c
> 
> It's a bug that we never free these. We should call the function
> occasionally instead of deleting it.

OK.

> >   - functions nettel_eraseconfig and nettel_erasecallback,
> >    struct nettel_erase in drivers/mtd/maps/nettel.c
> 
> The nettel_eraseconfig() function isn't static -- I assume it was called
> from the nettel-specific platform code.

>From some platform code where the merging into the kernel is pending?

> >   - function physmap_set_partitions in drivers/mtd/maps/physmap.c
> 
> Again that's called from elsewhere.

The merging of the code calling it into the kernel is pending?

> dwmw2

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed




------------------------------

Message: 2
Date: Sun, 21 Nov 2004 18:06:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [2.6 patch] MTD: some cleanups
To: Adrian Bunk <bunk@stusta.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Message-ID: <1101060371.9988.45.camel@localhost.localdomain>
Content-Type: text/plain

On Sun, 2004-11-21 at 19:01 +0100, Adrian Bunk wrote:
> > Again that's called from elsewhere.
> 
> The merging of the code calling it into the kernel is pending?

I believe so, yes.

-- 
dwmw2




------------------------------

Message: 3
Date: Sun, 21 Nov 2004 20:56:17 +0100
From: Adrian Bunk <bunk@stusta.de>
Subject: Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
To: Nicolas Pitre <nico@cam.org>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, lkml
	<linux-kernel@vger.kernel.org>
Message-ID: <20041121195617.GB13254@stusta.de>
Content-Type: text/plain; charset=us-ascii

On Fri, Nov 19, 2004 at 11:35:26AM -0500, Nicolas Pitre wrote:
> On Fri, 19 Nov 2004, Adrian Bunk wrote:
> 
> >...
> > The Kconfig file should express all dependencies of a driver.
> > If a driver doesn't compile, it should not be selectable - and not 
> > #error at compile time.
> 
> Absolutely!

Good that we agree.  :-)

> So please would you just ask Andrew to apply the following patch and be 
> happy?  Thank you.

A slightly improved patch is below.

> --- ./drivers/mtd/chips/Kconfig.orig	Fri Nov 19 11:25:45 2004
> +++ ./drivers/mtd/chips/Kconfig	Fri Nov 19 11:28:08 2004
> @@ -274,8 +274,7 @@
>  
>  config MTD_XIP
>  	bool "XIP aware MTD support"
> -	depends on !SMP && MTD_CFI_INTELEXT && EXPERIMENTAL
> -	default y if XIP_KERNEL
> +	depends on XIP_KERNEL && !SMP && MTD_CFI_INTELEXT && EXPERIMENTAL
>  	help
>  	  This allows MTD support to work with flash memory which is also
>  	  used for XIP purposes.  If you're not sure what this is all about
> 
> 
> Nicolas


cu
Adrian

Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.10-rc2-mm2-full/drivers/mtd/chips/Kconfig.old	2004-11-18
16:35:40.000000000 +0100
+++ linux-2.6.10-rc2-mm2-full/drivers/mtd/chips/Kconfig	2004-11-21
20:54:43.000000000 +0100
@@ -274,8 +274,8 @@
 
 config MTD_XIP
 	bool "XIP aware MTD support"
-	depends on !SMP && MTD_CFI_INTELEXT && EXPERIMENTAL
-	default y if XIP_KERNEL
+	depends on XIP_KERNEL && !SMP && MTD_CFI_INTELEXT && EXPERIMENTAL &&
(ARCH_SA1100 || ARCH_PXA || BROKEN)
+	default y
 	help
 	  This allows MTD support to work with flash memory which is also
 	  used for XIP purposes.  If you're not sure what this is all about




------------------------------

Message: 4
Date: Sun, 21 Nov 2004 19:38:04 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
To: Adrian Bunk <bunk@stusta.de>
Cc: Andrew Morton <akpm@osdl.org>, David Woodhouse
	<dwmw2@infradead.org>,	linux-mtd@lists.infradead.org, lkml
	<linux-kernel@vger.kernel.org>
Message-ID: <Pine.LNX.4.61.0411211932000.3732@xanadu.home>
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 21 Nov 2004, Adrian Bunk wrote:

> On Fri, Nov 19, 2004 at 11:35:26AM -0500, Nicolas Pitre wrote:
> 
> > On Fri, 19 Nov 2004, Adrian Bunk wrote:
> > 
> > > The Kconfig file should express all dependencies of a driver.
> > 
> > Absolutely!
> 
> Good that we agree.  :-)

On this very point only.

> > So please would you just ask Andrew to apply the following patch and be 
> > happy?  Thank you.
> 
> A slightly improved patch is below.

But I continue to disagree with your proposed patch.
And I'll bet that you will continue to disagree with mine.

Can we let the MTD maintainer arbitrate on this?


Nicolas



------------------------------

Message: 5
Date: Mon, 22 Nov 2004 14:41:24 +1300
From: Brad Beveridge <bbeveridge@bluewatersys.com>
Subject: BUG at dcache.h:276! Causing oops when I rmmod a nand module
	having mulitple partitions
To: linux-mtd@lists.infradead.org
Message-ID: <41A143C4.2090304@bluewatersys.com>
Content-Type: text/plain; format=flowed; charset=ISO-8859-1

Hi all.  Here is the basic problem, I have a nand module that I want to 
insmod & rmmod.  It has multiple partitions that look like
static struct mtd_partition partition_info1[] = {   
        { name: "part1",                   
          offset: 0,                                                     
          size: 4 * 1024 * 1024 },                                     
        { name: "part2",                      
          offset: 4 * 1024 * 
1024,                                          
          size: 4 * 1024 * 1024 
},                                          
        { name: "part3",                             
                  offset: 8 * 1024 * 
1024,                                  
                  size: MTDPART_SIZ_FULL }
};

I call nand_scan on my device, and then add_mtd_partitions.
When I rmmod the module I simply call nand_release, because it 
automatically calls del_mtd_partitions.

However, this causes a BUG in dcache.h:276.
There is no oops if I only use a single partition.

Any thoughts on what might be going on?

Cheers
Brad



------------------------------

Message: 6
Date: Mon, 22 Nov 2004 16:17:04 +1300
From: Brad Beveridge <bbeveridge@bluewatersys.com>
Subject: Re: BUG at dcache.h:276! Causing oops when I rmmod a nand
	module having mulitple partitions
Cc: linux-mtd@lists.infradead.org
Message-ID: <41A15A30.4070808@bluewatersys.com>
Content-Type: text/plain; format=flowed; charset=ISO-8859-1

As a followup - the oops only occurs when CONFIG_MTD_BLOCK is on, but 
not when it is off.
The oops backtrace is
Backtrace:
[<c0028bac>] (__bug+0x0/0x54) from [<c00a1854>] 
(sysfs_remove_dir+0x2c/0x168)
r4 = C5C59D60
[<c00a1828>] (sysfs_remove_dir+0x0/0x168) from [<c00d8fe4>] 
(kobject_del+0x24/0x34)
r5 = C029AE60  r4 = C5C59D60
[<c00d8fc0>] (kobject_del+0x0/0x34) from [<c00d9008>] 
(kobject_unregister+0x14/0x20)
r4 = C5C59D60
[<c00d8ff4>] (kobject_unregister+0x0/0x20) from [<c011149c>] 
(elv_unregister_queue+0x20/0x30)
r4 = C5C59D10
[<c011147c>] (elv_unregister_queue+0x0/0x30) from [<c011587c>] 
(blk_unregister_queue+0x30/0x48)
r4 = C5C59D10
[<c011584c>] (blk_unregister_queue+0x0/0x48) from [<c0116610>] 
(unlink_gendisk+0x14/0x28)
r5 = C029AE60  r4 = C029AE60
[<c01165fc>] (unlink_gendisk+0x0/0x28) from [<c00a0a20>] 
(del_gendisk+0x6c/0xc4)
r4 = 00000000
[<c00a09b4>] (del_gendisk+0x0/0xc4) from [<c012e164>] 
(del_mtd_blktrans_dev+0xa4/0xc8)
r5 = C01D8990  r4 = C027B320
[<c012e0c0>] (del_mtd_blktrans_dev+0x0/0xc8) from [<c012d7dc>] 
(mtdblock_remove_dev+0x14/0x20)
r4 = C027B320
[<c012d7c8>] (mtdblock_remove_dev+0x0/0x20) from [<c012e1dc>] 
(blktrans_notify_remove+0x54/0x84)
r4 = C01D8998
[<c012e188>] (blktrans_notify_remove+0x0/0x84) from [<c012a300>] 
(del_mtd_device+0xa0/0x100)
r8 = C021889C  r7 = C01D88C4  r6 = C01D88D4  r5 = C034A200
r4 = C01D89D0
[<c012a260>] (del_mtd_device+0x0/0x100) from [<c012b4fc>] 
(del_mtd_partitions+0x58/0x80)
r8 = 00000880  r7 = C5E00C00  r6 = C01D88DC  r5 = C01D88DC
r4 = C034A200
[<c012b4a4>] (del_mtd_partitions+0x0/0x80) from [<c0131f94>] 
(nand_release+0x78/0x94)
r7 = C5E93F48  r6 = C01CD184  r5 = C5E00C00  r4 = C5E00D68
[<c0131f1c>] (nand_release+0x0/0x94) from [<bf0007d4>] 
(scallop_cleanup+0x30/0x58 [scallop])
r5 = BF001540  r4 = 00000000
[<bf0007a4>] (scallop_cleanup+0x0/0x58 [scallop]) from [<c004cf34>] 
(sys_delete_module+0x1c4/0x228)
r5 = 00000000  r4 = BF001440
[<c004cd70>] (sys_delete_module+0x0/0x228) from [<c0023120>] 
(ret_fast_syscall+0x0/0x2c)
r8 = C00232A4  r7 = 00000081  r6 = 000741C8  r5 = 00706F6C
r4 = 6C616373

Cheers
Brad

Brad Beveridge wrote:

> Hi all.  Here is the basic problem, I have a nand module that I want 
> to insmod & rmmod.  It has multiple partitions that look like
> static struct mtd_partition partition_info1[] = {          { name: 
> "part1",                            offset: 
> 0,                                                              size: 
> 4 * 1024 * 1024 },                                            { name: 
> "part2",                               offset: 4 * 1024 * 
> 1024,                                                   size: 4 * 1024 
> * 1024 },                                                 { name: 
> "part3",                                              offset: 8 * 1024 
> * 1024,                                                   size: 
> MTDPART_SIZ_FULL }
> };
>
> I call nand_scan on my device, and then add_mtd_partitions.
> When I rmmod the module I simply call nand_release, because it 
> automatically calls del_mtd_partitions.
>
> However, this causes a BUG in dcache.h:276.
> There is no oops if I only use a single partition.
>
> Any thoughts on what might be going on?
>
> Cheers
> Brad
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

       Brad Beveridge                           Bluewater Systems Ltd
Phone: +64 3 3779127 (Aus +1 800 148 751)       Level 17, 119 Armagh St
Fax:   +64 3 3779135                            PO Box 13889
Email: bbeveridge@bluewatersys.com              Christchurch
Web:   http://www.bluewatersys.com              New Zealand 




------------------------------

Message: 7
Date: Mon, 22 Nov 2004 07:38:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch] 2.6.10-rc2-mm2: MTD_XIP dependencies
To: Nicolas Pitre <nico@cam.org>
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,	lkml
	<linux-kernel@vger.kernel.org>, Adrian Bunk <bunk@stusta.de>
Message-ID: <1101109132.9988.107.camel@localhost.localdomain>
Content-Type: text/plain

On Sun, 2004-11-21 at 19:38 -0500, Nicolas Pitre wrote:
> But I continue to disagree with your proposed patch.
> And I'll bet that you will continue to disagree with mine.
> 
> Can we let the MTD maintainer arbitrate on this?

Personally I prefer the #error. People with platforms which _don't_ yet
provide the underlying primitives which the XIP code needs will see the
option, turn it on and work out what they need to do. Otherwise, they'll
continue to be unaware that it even exists. 

I consider that to be more important than the case of someone who turns
it on when they don't actually want it.

-- 
dwmw2




------------------------------

Message: 8
Date: Mon, 22 Nov 2004 12:11:12 +0300
From: Dmitry Skorinko <skorinkod@mosk.ru>
Subject: mkfs.ext3 - segmentation fault
To: linux-mtd@lists.infradead.org
Message-ID: <200411221211.12394.skorinkod@mosk.ru>
Content-Type: text/plain;  charset="us-ascii"

2.6.8-1 + mtd snapshot (about 2 week ago)

#modprobe inftl
#modprobe diskonchip
#cat /proc/mtd
dev:    size   erasesize  name
mtd0: 10000000 00004000 "DiskOnChip 2000 (INFTL Model)"
mtd1: 0ffe8000 00004000 " DiskOnChip BDTL partition"
#fdisk -l /dev/inftla

Disk /dev/inftla: 262 MB, 262946816 bytes
16 heads, 32 sectors/track, 1003 cylinders
Units = cylinders of 512 * 512 = 262144 bytes

      Device Boot      Start         End      Blocks   Id  System
/dev/inftla1   *           1        1003      256752   83  Linux

#mkfs.ext3 /dev/inftla1
Segmentation fault
#dmesg
--skip--
nand_read_oob: from = 0x00027a00, len = 8
nand_read_oob: from = 0x00027c00, len = 8
nand_read_oob: from = 0x00027e00, len = 8
INFTL: deleting empty VUC 2
Deleting EUN 9 from VUC 2
INFTL: INFTL_formatblock(inftl=c7554200,block=9)
nand_erase: start = 0x00024000, len = 16384
nand_isbad_bbt(): bbt info for offs 0x00024000: (block 0) 0x09
Unable to handle kernel NULL pointer dereference at virtual address 00000100
 printing eip:
c8065711
*pde = 00000000
Oops: 0000 [#1]
PREEMPT
Modules linked in: diskonchip reed_solomon nand nand_ids nand_ecc mtdpart 
inftl mtd_blkdevs mtdcore ipv6 af_packet 8139too mii crc32 usbkbd usbcore
rtc 
ext3 jbd ide_generic sis5513 ide_disk ide_core sd_mod ata_piix libata 
scsi_mod unix
CPU:    0
EIP:    0060:[<c8065711>]    Not tainted
EFLAGS: 00010246   (2.6.8mymtd26)
EIP is at mtd_erase_callback+0x6/0x3b [mtdpart]
eax: 00004000   ebx: c60f1968   ecx: c7554300   edx: 00000000
esi: 00000140   edi: c7554300   ebp: 00000000   esp: c60c7db4
ds: 007b   es: 007b   ss: 0068
Process inftld (pid: 741, threadinfo=c60c6000 task=c6543180)
Stack: c810a458 c7554300 00000000 00000020 c7554300 c7554200 00000000
00000009
       c810a273 c60f1800 c7554300 00000000 c80b378b c60f1800 c7554300
0000001d
       00000002 c0117cc7 c6118004 c7554200 00000009 00000002 c80b290c
c7554200
Call Trace:
 [<c810a458>] nand_erase_nand+0x1e1/0x1f7 [nand]
 [<c810a273>] nand_erase+0xf/0x13 [nand]
 [<c80b378b>] INFTL_formatblock+0x5c/0x116 [inftl]
 [<c0117cc7>] printk+0xfb/0x11b
 [<c80b290c>] INFTL_trydeletechain+0x1dd/0x22a [inftl]
 [<c80b2af1>] INFTL_deleteblock+0x198/0x1a6 [inftl]
 [<c0117cc7>] printk+0xfb/0x11b
 [<c80b2f01>] inftl_writeblock+0x402/0x40e [inftl]
 [<c01d75d9>] __end_that_request_first+0x193/0x1a3
 [<c8020096>] do_blktrans_request+0x96/0xcb [mtd_blkdevs]
 [<c8020208>] mtd_blktrans_thread+0x13d/0x18e [mtd_blkdevs]
 [<c0114c48>] default_wake_function+0x0/0x12
 [<c0105996>] ret_from_fork+0x6/0x20
 [<c0114c48>] default_wake_function+0x0/0x12
 [<c80200cb>] mtd_blktrans_thread+0x0/0x18e [mtd_blkdevs]
 [<c01041e1>] kernel_thread_helper+0x5/0xb
Code: 81 ba 00 01 00 00 cf 56 06 c8 75 1d 8b 41 0c 83 f8 ff 74 09

Help, plz.  Thanks.
Dmitry



------------------------------

Message: 9
Date: Mon, 22 Nov 2004 10:40:39 +0100
From: Sean Young <sean@mess.org>
Subject: Re: mkfs.ext3 - segmentation fault
To: linux-mtd@lists.infradead.org
Message-ID: <20041122094039.GA4919@levin.pad.mess.org>
Content-Type: text/plain; charset=us-ascii

On Mon, Nov 22, 2004 at 12:11:12PM +0300, Dmitry Skorinko wrote:
> 2.6.8-1 + mtd snapshot (about 2 week ago)
> 
> #modprobe inftl
> #modprobe diskonchip

-snip-

> EIP is at mtd_erase_callback+0x6/0x3b [mtdpart]

inftl is not setting the mtd member of struct erase_info. None of the
ftl's seem to be doing this but I do not have a current cvs handy so it
might be fixed.


Sean



------------------------------

Message: 10
Date: Mon, 22 Nov 2004 12:24:00 +0200
From: Kalev Lember <kalev@colleduc.ee>
Subject: Re: mkfs.ext3 - segmentation fault
To: linux-mtd@lists.infradead.org
Message-ID: <41A1BE40.2000106@colleduc.ee>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed

Dmitry Skorinko wrote:
<snip>

>EIP is at mtd_erase_callback+0x6/0x3b [mtdpart]
>  
>
<snip>

>Help, plz.  Thanks.
>  
>
I fixed this in the CVS about two weeks ago and sent a note about the 
fix to the list. Try the current CVS.

-- 
Best regards,
Kalev Lember



------------------------------

______________________________________________________
Linux MTD discussion mailing list digest
http://lists.infradead.org/mailman/listinfo/linux-mtd/


End of linux-mtd Digest, Vol 20, Issue 33
*****************************************





------------------------------

Message: 3
Date: Tue, 23 Nov 2004 09:51:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
Subject: RE: MTD & JFFS porting help
To: shamu <shamu@semidj.com>
Cc: linux-mtd@lists.infradead.org
Message-ID: <1101203479.8191.7533.camel@hades.cambridge.redhat.com>
Content-Type: text/plain

On Tue, 2004-11-23 at 07:46 +0530, shamu wrote:
> Dear All,
> I am new to this Techies, could you help me regarding how to port.
> MTD & JFFS on my target, My target is MIPS.

Please read http://david.woodhou.se/email.html

You seem to have included and entire day's worth of mail in yours, and
you haven't asked a question which is specific enough to even start
answering it.

-- 
dwmw2




------------------------------

______________________________________________________
Linux MTD discussion mailing list digest
http://lists.infradead.org/mailman/listinfo/linux-mtd/


End of linux-mtd Digest, Vol 20, Issue 36
*****************************************
