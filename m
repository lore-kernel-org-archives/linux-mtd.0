Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178yyY-0007gD-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 08:50:02 +0100
Date: Sat, 18 May 2002 09:49:54 +0200 (MEST)
From: Robert Kaiser <rob@sysgo.de>
To: john riehl <jr@i-bucks.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Getting big flash onto motherboards. Will CF work? what   will?
In-Reply-To: <3.0.32.20020517142924.0074ef10@mail.i-bucks.com>
Message-ID: <Pine.LNX.4.21.0205180939300.18909-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Fri, 17 May 2002, john riehl wrote:

> At 08:51 PM 5/17/02 +0200, Robert Kaiser wrote:
> >
> >>> 
> >> These are called DiskonModule  (as opposed to diskonchip).  
> >> 
> >> They come in both 40 and 44 pin connections.  They arent very big, they
> >> look like a terminator.  Most are flat, like a hard drive (but much shorter
> >> & smaller), some have an L-shape.
> >
> >So, except for the form factor, what is the difference beween these and
> >a CompactFlash (wrt to reliabilty on power failure, etc.) ?
> >
> 
> I dont know.  I dont know about CF.  how does cf connect to a system?

Basically, a CF uses flash as storage media but looking at it's
interface, it behaves exactly like a normal IDE disk. You can actually
buy adapters (just wiring, no logic) to connect a CF to a normal IDE
connector. So it's pretty much like a DOM.

>  what
> happens when cf loses power?

I understand that when a CF loses power while a write is in progress, it
may corrupt some blocks in such a way that they can not be recovered.

> can you boot from it?

Obviously yes, since it behaves like an IDE drive.

> 
> afaik, dom keeps info despite a power loss.

So does a CF, the problem occurrs when it loses power while a write
is in progress.

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
