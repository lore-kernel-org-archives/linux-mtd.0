Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142Evv-0006GO-00
	for mtd-list@infradead.org; Sat, 02 Dec 2000 15:50:39 +0000
Received: from laxmls02.socal.rr.com ([24.30.163.11])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142Evt-0006GI-00
	for mtd@infradead.org; Sat, 02 Dec 2000 15:50:38 +0000
Date: Sat, 2 Dec 2000 08:54:19 +0000
From: Shane Nay <shane@agendacomputing.com>
To: Nicolas Pitre <nico@cam.org>
Cc: Shane Nay <shane@agendacomputing.com>, mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0001
Message-ID: <20001202085419.I4457@www.easysolutions.net>
References: <20001202050132.B4457@www.easysolutions.net> <Pine.LNX.4.30.0012021004200.16670-100000@xanadu.gn.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.30.0012021004200.16670-100000@xanadu.gn.com>; from nico@cam.org on Sat, Dec 02, 2000 at 15:23:33 +0000
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Nicholas,
> Please consider using the following for better efficiency instead:
> 
> 	cmd_adr = addr & ~(mtd->erasesize-1);

Will do.  I was trying to think of the bit wise way to do it, but I was/am
kind of tired.

> 
> This produces the same result but omits the division which is best to
> avoid
> on some CPUs which don't have a native instruction for it.

Tell me about it..., working on FPU less MIPS processor.  So division in
general makes the hair on my neck stand out on end.

> 
> What kind of arrangement do the probe function find?  Does it actually
> tell
> you: "Found 2 x8 CFI devices at location 0 in 8 bit mode"?  If not,
> you'll
> have to look at the probe code in cfi-probe.c.  Carefully reordering the
> probe sequence might be required (I had to do it for the 32-bit buswidth
> case).

Ah, ic.  No, I think it found it correctly, here's the output:  (Paste
isn't working right now, have to turn on Emulate3Buttons again)
supports x8 and x16 via BYTE# with asynchronous interface


> 
> My impression is that it had better advantages to be separate just to
> keep
> things as simple as possible.

I happen to agree with your position now :-).  After a couple days of
drudging through stuff, I think simple is much better :).  I don't know
whether to contribut this stuff, and use a macro to re-probe for the
commandset_xip, and then write a commandset_xip.c file and contribute that
or what precisely.  It's pretty special purpose, so maybe just a patch
floating around for people to try out.  In any case, I have to maintain the
patch against linux-vr cvs repository for our device after we ship, so
it'll be floating around on the agenda computing pages starting Real Soon
Now, aka, as soon as I suck it into a kernel release for our device, which
is likely to be Monday or Tuesday.

> Well... I don't know who is the official maintainer, but I think I
> contributed the largest mods recently.

Cool, then I'll make the patch, post it on one of our pages and drop a link
here.  You guys can choose to include it in your stuff or not.  I
understand Daves philsophical issue on this..., RAM is cheaper than flash
:-).

Thanks,
Shane.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
