Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14cPax-0000N0-00
	for mtd-list@infradead.org; Mon, 12 Mar 2001 10:30:31 +0000
Received: from ns.sysgo.de ([213.68.67.98] helo=rob.devdep.sysgo.de)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14cPaw-0000Mu-00
	for mtd@infradead.org; Mon, 12 Mar 2001 10:30:30 +0000
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: Vipin Malik <vmalik@danielind.com>
Subject: Re: Oh, the many joys of MTD...
Date: Mon, 12 Mar 2001 11:10:44 +0100
Content-Type: text/plain
References: <Pine.LNX.4.30.0103081119360.14989-100000@xanadu.home> <3AA7C45C.E7652E1F@danielind.com>
In-Reply-To: <3AA7C45C.E7652E1F@danielind.com>
Cc: Nicolas Pitre <nico@cam.org>,
        Kevin Jacobs <jacobs@penguin.theopalgroup.com>, mtd@infradead.org
MIME-Version: 1.0
Message-Id: <01031211300300.00792@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Don, 08 Mär 2001 you wrote:
> >
> > The device mapping is done with the ioremap() call which is responsible for
> > providing a non-cacheable mapping.
> 
> Actually I had to use ioremap_nocache() call with my ELANSC520 processor (which
> has a processor I&D cache).

Strange, I had just the opposite experience here. I'm using the SC520 CDP board.

> This is even with caching actually disabled for the flash banks inside the
> processor (by the startup processor init code).

My board's BIOS provides options to enable/disable write buffering and to
set cache operation to write-back/write-through. No matter how I set these,
the mtd code always seemed to work, even if I used plain ioremap() . The SC520
has a set of PAR registers which allow to set individual cachability attributes
for ROM (i.e. chips that are selected by the ROMCS[12] and BOOTCS signals).
These are always set to non-cacheable by my BIOS. Then there are also the
cacheability attributes in the page table (this is what ioremap()  and
ioremap_nocache() differ in).

So there are several obscure places where one can enable/disable cacheing for
a given address region  on an SC520. Question is which of them takes
precedence in case they contradict.

Nevertheless, since everybody seems to agree that FlashROM needs to be
non-cached for the MTD code to work, I guess it's safer to generally use
ioremap_nocache().

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
