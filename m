Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Eb3c-0007Z5-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 17:53:40 +0000
Date: Fri, 5 Jan 2001 12:53:36 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: <Russ.Dill@asu.edu>, <mtd@infradead.org>
Subject: Re: Supported flash memory 
In-Reply-To: <8151.978712149@redhat.com>
Message-ID: <Pine.LNX.4.30.0101051216570.535-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 5 Jan 2001, David Woodhouse wrote:

> Russ.Dill@asu.edu said:
> >  I've noticed LART connects address and data lines to flash in
> > positions most convienent to route. Does this break any CFI
> > functionality?
>
> What do you mean? It's generally considered quite rude for hardware
> designers to connect nets to _completely_ random places on the chips,
> although sometimes it wouldn't really surprise me.

They did!  My recommendation to Erik Mouw (the software guy from the LART
team) was to modify cfi_build_cmd() to sweezle the bits appropriately.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
