Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140laR-0003IW-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 14:18:23 +0000
Date: Tue, 28 Nov 2000 07:22:03 +0000
From: Shane Nay <shane@agendacomputing.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Shane Nay <shane@agendacomputing.com>, mtd@infradead.org
Subject: Re: XIP kernel + MTD polling interest
Message-ID: <20001128072203.F17376@www.easysolutions.net>
References: <20001128070007.E17376@www.easysolutions.net> <6193.975420502@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
In-Reply-To: <6193.975420502@redhat.com>; from dwmw2@infradead.org on Tue, Nov 28, 2000 at 14:08:22 +0000
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 28 Nov 2000 14:08:22 David Woodhouse wrote:
> 
> shane@agendacomputing.com said:
> >   What I'm really wondering is whether I should move to make patches
> > off of the present versions of cfi_probe.c, cfi.h, cfi_cmdset_0001.c,
> > or whether I should just fork them?  (Basically, it follows the same
> > logic, I just use macros to build copies of functions in memory also
> > the code gets messy because I can't use else, can't use switch, and
> > can't use return until the bottom of the function.  Also can't use
> > printk, or any kernel function while the flash is in query, or write
> > mode)
> 
> If it can be cleanly merged with macros then it's probably worth doing. 
> Otherwise, it's best to fork it. The former is preferable.

Agreed if it's possible without blowing the design of mtd itself.  (Which
is debatable)


> Show me the code. Do you have a filesystem working XIP from flash yet?
> I'm about to start looking at hacking romfs to prepopulate the page cache
> 
> with pages directly from the flash chip.

I don't have a filesystem working just yet, as mentioned in the message I
haven't done the intel command set, just finished probing.  I'll attach
that code to you to give you an idea of how it is.  (Has the macros for
command copying, etc.)  Right now though it's very very messy, would have
to be cleaned up before inclusion anyhow, but I'll just send you snap as it
sits.  (Feel free to share obviously, not attaching to list because don't
want to bog everyones mailer down.)

Thanks,
Shane.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
