Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 133IZY-0007BN-00
	for mtd-list@infradead.org; Sat, 17 Jun 2000 14:23:40 +0100
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 133IZW-0007AD-00
	for mtd@infradead.org; Sat, 17 Jun 2000 14:23:38 +0100
Date: Sat, 17 Jun 2000 15:24:20 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: Joakim Tjernlund <tjernlund@telia.com>
cc: mtd@infradead.org
Subject: Re: HW platform
In-Reply-To: <000501bfd854$a5fc6fa0$62d9b5d4@jocke>
Message-ID: <Pine.LNX.3.96.1000617152038.24260A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 17 Jun 2000, Joakim Tjernlund wrote:

> > The PPC 860 series is well supported by Linux. Several of our customers
> > use it and are satisfied.
> 
> Good to hear! What type of HW do they use(besides the CPU). Is
> is possible to run Linux on 'bare' HW(no BIOS, or ROM monitor)?
> Is there some typical HW configuration which will run Linux without
> to much tweaking of Linux?  Which distro(we are aming for Linux 2.2) ?

Basically you need a cpu, memory, flash and some external i/o circuits
depending on what i/o you need to use (ethernet transcievers etc). You can
pretty easily write you own boot code (I've done it). Just set up the
memory and stuff, then jump to the linux kernel image stored in flash.
 
> I was hoping to buy the HW design and fit it in on our control board.
> Is there such a beast available?

There are some development boards availible, but I don't know much about
them. I've worked mainly with custom boards.

/ Alex





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
