Received: from [222.33.36.197] (helo=sict.ac.cn)
	by pentafluge.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CcD7Q-0002RA-8S
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 01:29:25 +0000
Received: from [10.32.4.45] ([10.32.4.45])
	by sict.ac.cn (Merak 7.2.0) with ASMTP id 42U08685
	for <linux-mtd@lists.infradead.org>; Thu, 09 Dec 2004 09:28:55 +0800
From: zhang jingxin <zhangjingxin@sict.ac.cn>
To: list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Message-Id: <1102555735.2526.40.camel@z21921>
Mime-Version: 1.0
Date: Thu, 09 Dec 2004 09:28:55 +0800
Content-Transfer-Encoding: 7bit
Subject: doc2000 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am sorry to write another mail as I use a bad mailtool.


>Kalev Lember added Millenium+ support to diskonchip.c.  I think he sent
>an announcement to the list, but since you're not using that device I 
>won't go into detail.


And I find this head in the diskonchip.c.
/*
 * drivers/mtd/nand/diskonchip.c
 *
 * (C) 2003 Red Hat, Inc.
 * (C) 2004 Dan Brown <dan_brown@ieee.org>
 * (C) 2004 Kalev Lember <kalev@smartlink.ee>
 */

So I think there is no problem you metioned.

>BBT handling was added for DOC2000 original after I wrote this email. 
>It should work just fine with JFFS2 (it does for me).


I use the  mtd-util-20011008.tar.bz2. It should not have BBT problem.

>Proper probing did indeed come soon, as I copied it more-or-less 
>verbatim from the old driver.  The kernel configuration options (and 
>accompanying help text) should hopefully make this clear.

I use the right position,and it shows this:
Dec  8 10:23:52 localhost kernel: Using configured DiskOnChip probe
address 0xd8000
Dec  8 10:23:52 localhost kernel: DiskOnChip found at 0xd8000

I read this from mtd/device/docprobe.c.
static unsigned long __initdata doc_locations[] = {
#if defined (__alpha__) || defined(__i386__) || defined(__x86_64__)
#ifdef CONFIG_MTD_DOCPROBE_HIGH
        0xfffc8000, 0xfffca000, 0xfffcc000, 0xfffce000,
        0xfffd0000, 0xfffd2000, 0xfffd4000, 0xfffd6000,
        0xfffd8000, 0xfffda000, 0xfffdc000, 0xfffde000,
        0xfffe0000, 0xfffe2000, 0xfffe4000, 0xfffe6000,
        0xfffe8000, 0xfffea000, 0xfffec000, 0xfffee000,
#else /*  CONFIG_MTD_DOCPROBE_HIGH */
        0xc8000, 0xca000, 0xcc000, 0xce000,
        0xd0000, 0xd2000, 0xd4000, 0xd6000,
        0xd8000, 0xda000, 0xdc000, 0xde000,
        0xe0000, 0xe2000, 0xe4000, 0xe6000,
        0xe8000, 0xea000, 0xec000, 0xee000,
#endif /*  CONFIG_MTD_DOCPROBE_HIGH */




>Did you create the device nodes in /dev?  Unless you're using devfs or 
>suchlike, device nodes are not automatically created for you (even 
>though the devices themselves were created when you loaded the
modules). 
>  Try running the MAKEFILE script included in the mtd CVS (in the util 
>directory).

I run MAKEFILE.
It return like this 
mtd* file exist.

flash_eraseall -j /dev/mtd1
it doesn't recongize the device.
it return no such device.

Then what should I do??
