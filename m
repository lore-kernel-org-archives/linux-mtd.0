Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rdwO-0003x9-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 11:51:36 +0100
Received: from ns.sysgo.de ([213.68.67.98] helo=rob.devdep.sysgo.de)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rdwM-0003x3-00
	for mtd@infradead.org; Mon, 23 Apr 2001 11:51:34 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: "Alexander Melichenko" <AlexanderM@lrpeople.com>
Subject: Re: Elan SC520 - problem with MTD
Date: Mon, 23 Apr 2001 11:59:48 +0200
Content-Type: text/plain
References: <Pine.LNX.4.21.0104161208120.12472-100000@dagobert.svc.sysgo.de> <01041713245700.01481@rob> <005801c0cbd3$2bdb3c60$4d02010a@lrpeople.com>
In-Reply-To: <005801c0cbd3$2bdb3c60$4d02010a@lrpeople.com>
Cc: mtd@infradead.org
MIME-Version: 1.0
Message-Id: <01042312512000.00451@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi Alexander,

On Mon, 23 Apr 2001 you wrote:
> Hello Robert!
> Thank You very much for Your help.
> I worked with kernel 2.2.18 but could not achieve a success.
> Now I use Linux kernel 2.4.0 and latest version MTD from CVS. After booting
> in /proc/mtd I see :
> dev:    size   erasesize  name
> mtd0: 00800000 00040000 "SC520CDP Flash Bank #0"
> mtd1: 00800000 00040000 "SC520CDP Flash Bank #1"
> 
> Das ist fantastik!
> It was a good present for me last week ( my son was born last week!).

Well, congratulations to you and your wife then!!

> Now I must place a kernel to a flash and booting from it.
> What steps should be undertaken to reach that result?

One Question: Do you want to keep the BIOS ?

If yes, then I have a working solution, but it is not very nice:

Some Background info: 

In order to persuade the BIOS to boot from the Flash, you have to enable it's
"disk" emulation:  the BIOS can treat each of the flash banks as an emulated
disk. So far so good, but: these "disk" functions are only accessible through
the BIOS int 13h call, thus, you can't access it from Linux.

Worse even, the BIOS insists on doing "wear levelling" (i.e. it tries to
distribute erases evenly over all flash blocks). It does this by remapping
flash blocks when they have seen to many write erases. Therefore,  if you
write a continuous stream of data to the flash using the BIOS int13h function,
the BIOS will scatter your data all over the flash memory in an unpredictable
way. There is no way (other than buying a customized BIOS from General
Software) to disable his wear levelling. So the bottom line is:

* If you want to use the BIOS to boot from Flash, you must enable it's Disk
  emulation.
* If you use the Disk emulation, you must do all accesses to the boot flash
  through the BIOS int 13h.
* Bootloaders can access the Flash through the BIOS, but Linux can't.

Thus you essentially have to sacrifice one of the two banks entirely for booting
a kernel from it. Quite a waste considering it has 8 MB. In order to get a
bootable (via the BIOS) flash "disk", the easiest way is to put a minimal DOS
system on it with your kernel and LOADLIN. You can then run LOADLIN
from AUTOEXEC.BAT to boot your Linux Kernel.

As I said, this is ugly, but it should work.

However, if you want to get rid of the BIOS, you have to write your own startup
code for the board, which is not a trivial task. Actually, I'm currently
working on something like that, but it is not ready for release yet and I'm
making only slow progress as I have about a hundred other things to do.
However, I believe, Vipin Malik has gotten this to work for himself. Maybe if
you ask him nicely...

Cheers

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
