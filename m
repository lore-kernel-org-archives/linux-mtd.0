Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MU58-00026H-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 14:12:54 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H7000ME6GVPV9@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 12 Dec 2002 15:43:02 +0100 (MET)
Date: Thu, 12 Dec 2002 15:40:43 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: bbram access problems
In-reply-to: <20021212140546.3607a3e0.geof@hellea.com>
To: Geoffroy Stevenne <geof@hellea.com>, linux-mtd@lists.infradead.org
Cc: jch@hellea.be
Reply-to: tglx@linutronix.de
Message-id: <200212121540.43586.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <20021212140546.3607a3e0.geof@hellea.com>
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

On Thursday 12 December 2002 14:05, Geoffroy Stevenne wrote:
> Hi,
>
> We're trying to use BBRAM on a VersaLogic VSBC-6 m-b.  We use the slram
> driver and the 2.4.18 kernel.  The problem is that we can't acces the
> entire memory of the BBRAM, just the first 64k page.
>
> Other problem: we added to our lilo.conf:
>
> append="slram=BBRAM,0xE0000,+0x10000"
>
> We can write to the BBRAM but we noticed data corruption (not write
> operation was done) in this address range.  Is there a way to lock this
> memory area?  Is this the right thing to do?
>
> What we need is to mount a filesystem on the entire BBRAM, not just the
> first 64k. I can (and wish to) provide more information, test changes,
> report bugs, etc. I can read and understand C code but I don't feel
> competent in writing drivers on my own.

from slram.c
NOTE:
  With slram it's only possible to map a contigous memory region. 

So you can't access it with slram, as the BBSRAM is a device with paged 
access. All you have to do, is copy slram.c to bbram.c and add an additional 
parameter, which tells the driver the number of pages.available. Then modify 
the erase / read / write functions to do the page selection depending on the 
address you have to access. 
If you think this is out of your league, then hope, that somebody does this 
for you sometimes, or ask one of the experts to help you for a little fee 
immidiately :)

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
