Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12pfIk-00078Z-00
	for mtd-list@infradead.org; Wed, 10 May 2000 23:49:58 +0100
Received: from cr355197-a.poco1.bc.wave.home.com ([24.112.113.88] helo=whiskey.fireplug.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12pfIi-00078T-00
	for mtd@infradead.org; Wed, 10 May 2000 23:49:57 +0100
Received: from sl by whiskey.fireplug.net with local (Exim 3.13 #2)
	id 12pfNu-0006xn-00
	for mtd@infradead.org; Wed, 10 May 2000 15:55:18 -0700
To: mtd@infradead.org
From: sl@whiskey.fireplug.net (Stuart Lynne)
Subject: Re: Initrd?
Date: 10 May 2000 15:55:18 -0700
Message-ID: <8fcpcm$q4h$1@whiskey.fireplug.net>
References: <Pine.LNX.4.21.0005101335290.1556-100000@phiggins.transzap.com>
Reply-To: sl@fireplug.net
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

In article <Pine.LNX.4.21.0005101335290.1556-100000@phiggins.transzap.com>,
Patrick Higgins <phiggins@transzap.com> wrote:
>Has anyone tried to get the M-Systems driver to work with initrd, enabling
>a Disk on Chip to be the root device without (illegally) statically

Yes, with small modifications, the existing driver can be made into
a loadable kernel module. And with suitable attention to configuration
details it works fine when used from an INITRD package.

I cannot comment for M-Systems but I believe that they hope to make
this approach available in the future.

If anyone wants a patch to the existing fldrvlnx.c file they can send me
email.

If you want to look at a working system you can check out www.fireplug.net
and see how thinlinux does it. (If the DOC boot disk hasn't migrated to 
the download area you should be able to get one by contacting 
richard@fireplug.net). ThinLinux uses syslinux to boot from a DOS formated
partition on the DOC into a RAM disk. The DOC can then be mounted at any
time for whatever use you want it for.

>linking the driver?  Would the bootloader require special knowledge of
>Disk on Chip to do this?  I would like to use the free drivers that you

I have only use syslinux. It works fine with this approach. 

The patched lilo should work as well (for booting from ext2 filesystems).

Etherboot will not work if a DOC is present (which shouldn't be a problem
for most people). It has the same problem as lilo. 

-- 
                                            __O 
Fireplug - a Lineo company                _-\<,_ 
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00 (_)/ (_) 88 EC A3 EE 2D 1C 15 68
Stuart Lynne <sl@fireplug.net>       www.fireplug.net        604-461-7532


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
