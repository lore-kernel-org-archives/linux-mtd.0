Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14nLij-0006Qi-00
	for mtd-list@infradead.org; Wed, 11 Apr 2001 15:35:45 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14nLih-0006P8-00
	for mtd@infradead.org; Wed, 11 Apr 2001 15:35:44 +0100
Message-ID: <3AD46B4D.56D713A6@danielind.com>
Date: Wed, 11 Apr 2001 09:33:49 -0500
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: Alexander Melichenko <AlexanderM@lrpeople.com>
CC: rob@sysgo.de, mtd@infradead.org
Subject: Re: Elan SC520 - problem with MTD
References: <00ae01c0c24e$5b566480$4d02010a@lrpeople.com> <01041114460500.00396@rob>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Alexander,

Since you are programming the flash directly into the mtd0 device, I presume that you are trying to boot from it directly.

Be aware of the following (this is true at least for the Rev 1.2 board). This is due to some
hardware challenged software programmer! (that's one for all the knocks the hardware people have taken from
the software guys everywhere :):

This caused me about half a week of misery before I figured it out.

/* The Embedded Systems BIOS decodes the first FLASH starting at
   0x8400000. This is a *terrible* place for it because accessing
   the flash at this location causes the A22 address line to be high
   (that's what 0x8400000 binary's out to be). But this is the highest
   order address line on the raw flash devices themselves!!
   This causes the top HALF of the flash to be accessed first. Beyond
   the physical limits of the flash, the flash chip aliases over (to
   0x880000 which causes the bottom half to be accessed. This splits the
   flash into two and inverts it! If you then try to access this from another
   program that does NOT do this insanity, then you *will* access the
   first half of the flash, but not find what you expect there. That
   stuff is in the *second* half!
*/

Enjoy,

Vipin



Robert Kaiser wrote:

> On Mit, 11 Apr 2001 you wrote:
> > We use Elan SC520 CDP Rev.1.3.
> > I have linux-2.2.18 (on hard drive) with MTD support. I use MTD MAKEDEV script to make MTD devices. I want to place kernel image into flash. But when I do
> >   #cat zFlashImage > /dev/mtd0
> > I see the message : bash: /dev/mtd0: No such device
> >
> > During booting I see following messages :
> > AMD Elan SC520 flash mapping: 1000000 at 4800000
> > mapped physical memory to c4800000
> > Elan SC520 Physically mapped flash: Found no CFI device at location zero
> > JFFS version 1.0, (C) 1999, 2000 Axis Communications AB
> >
> > When I inspect directory /proc  I see 2 (!!!) files mtd with no information about MTD devices.
> >
> > How can I solve this problem?
>
> Which mapping module are you using ?
>
> There is one specifically designed for the SC520 CDP in the current MTD CVS.
> It works fine on my (rev1.2) board.
>
> Cheers
>
> Rob
>
> ----------------------------------------------------------------
> Robert Kaiser                         email: rkaiser@sysgo.de
> SYSGO RTS GmbH
> Am Pfaffenstein 14                    phone: (49) 6136 9948-762
> D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
