Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 133HNt-00073U-00
	for mtd-list@infradead.org; Sat, 17 Jun 2000 13:07:33 +0100
Received: from mailq.telia.com ([194.22.190.101] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 133HNr-00073O-00
	for mtd@infradead.org; Sat, 17 Jun 2000 13:07:32 +0100
Message-ID: <000501bfd854$a5fc6fa0$62d9b5d4@jocke>
From: "Joakim Tjernlund" <tjernlund@telia.com>
To: "Alexander Larsson" <alex@cendio.se>
Cc: <mtd@infradead.org>
References: <Pine.LNX.3.96.1000617121832.19548A-100000@biffen.cendio.se>
Subject: Re: HW platform
Date: Sat, 17 Jun 2000 14:07:45 +0200
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


----- Original Message -----
From: "Alexander Larsson" <alex@cendio.se>
To: "Joakim Tjernlund" <tjernlund@telia.com>
Cc: <mtd@infradead.org>
Sent: den 17 juni 2000 12:20
Subject: Re: HW platform


> On Sat, 17 Jun 2000, Joakim Tjernlund wrote:
>
> > Hi all
> >
> > We are planning the next generation of our product and I want
> > to use Linux for the control board(this is an embedded system)
> > and I wondering what HW platform to use. We need a file
> > system(on flash) and IP/OSPF mainly from Linux.
> > Ther will be alot of (internal) communication with the other boards(25
of
> > them)
> > We have earlier used m68360 and therefore I am thinking a
> > PowerPC 860 CPU would serve us well in that respect.
> >
> > I need something that does take a lot of effort to get Linux running on.
> > It would be great if there we could buy CPU design that is Linux
prepared.
>
>  I suppose you mean doesn't take a lot of effort...

yeah :-)

>
> > Any ideas ? I open for all suggestions
>
> The PPC 860 series is well supported by Linux. Several of our customers
> use it and are satisfied.

Good to hear! What type of HW do they use(besides the CPU). Is
is possible to run Linux on 'bare' HW(no BIOS, or ROM monitor)?
Is there some typical HW configuration which will run Linux without
to much tweaking of Linux?  Which distro(we are aming for Linux 2.2) ?

I was hoping to buy the HW design and fit it in on our control board.
Is there such a beast available?
>
> / Alex
>
>




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
