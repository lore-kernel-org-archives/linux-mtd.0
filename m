Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rh8c-0005kW-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 15:16:26 +0100
Received: from ns.sysgo.de ([213.68.67.98] helo=rob.devdep.sysgo.de)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rh8Z-0005kO-00
	for mtd@infradead.org; Mon, 23 Apr 2001 15:16:24 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: "Alex Lennon" <ajlennon@arcom.co.uk>
Subject: RE: Elan SC520 - problem with MTD
Date: Mon, 23 Apr 2001 15:54:52 +0200
Content-Type: text/plain
References: <NEBBKJHOALKOLCFPGELEIEJJCJAA.ajlennon@arcom.co.uk>
In-Reply-To: <NEBBKJHOALKOLCFPGELEIEJJCJAA.ajlennon@arcom.co.uk>
Cc: <mtd@infradead.org>
MIME-Version: 1.0
Message-Id: <01042316161301.01109@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 23 Apr 2001 you wrote:
> >> However, if you want to get rid of the BIOS, you have to write your own
> startup
> >> code for the board, which is not a trivial task. Actually, I'm currently
> >> working on something like that, but it is not ready for release yet and
> I'm
> >> making only slow progress as I have about a hundred other things to do.
> >> However, I believe, Vipin Malik has gotten this to work for himself.
> Maybe if
> >> you ask him nicely...
> 
> I this BIOS compressed ? If not you should be able to write a simple BIOS
> extension
> to hook INT13h or INT19h. Then when your BIOS proper executes the interrupt
> your
> custom BIOS extension code loads your kernel out of linear flash - or do you
> see a
> problem with this approach ?

Interesting idea -- a bit like the DOC approach  ;-)

Though I'm not sure if I understand that BIOS extension part right. As  far as I
can tell, the BIOS is not compressed, but it occupies the only ROM socket on the
board. A BIOS extension would have to be put in a seperate ROM, along with an
0xaa55 header and a checksum so the BIOS calls it, right ? 

In principle this could work. One would basically have to put part of the
MTD code into the BIOS extension to do the flash accesses. Keep in mind though
that the BIOS must be entered and left in real-mode (i.e. no access beyond 
1MB), so the BIOS extension would have to make the transition to protected mode
and back. I've done this a couple of times but this stuff is sooo ugly
that I always want to forget all about  it immediately after the job is done ;-)

To be honest, I don't think this is worth the trouble, I'd rather dump the BIOS
completely and write my own startup code.


Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
