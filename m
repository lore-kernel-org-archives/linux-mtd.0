Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140nFu-0003nI-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 16:05:18 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140nFt-0003nC-00
	for mtd@infradead.org; Tue, 28 Nov 2000 16:05:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20001128085354.L17376@www.easysolutions.net> 
References: <20001128085354.L17376@www.easysolutions.net>  <20001128070007.E17376@www.easysolutions.net> <Pine.LNX.4.30.0011282033210.546-100000@xanadu.gn.com> 
To: Shane Nay <shane@agendacomputing.com>
Cc: Nicolas Pitre <nico@cam.org>, mtd@infradead.org
Subject: Re: XIP kernel + MTD polling interest 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Nov 2000 15:58:02 +0000
Message-ID: <28079.975427082@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


shane@agendacomputing.com said:
> Well, we've come up with a better way (well, Mike Klar did from
> linux-vr) to take care of weird c code, and allow everything to be
> normal.  (Special elf sections, and twiddling with the linker script) 

Cute, and not too horrible because you already had to copy the data section
into RAM at startup anyway. Doing so with an extra section isn't too much of
a problem, and there's enough other 'put this code in a different section' 
magic in the kernel already that that bit isn't too troublesome either.

shane@agendacomputing.com said:
>   I was just thinking XIP kernel with flash stuff might be usefull for
> MTD as a general thing, because people might want to take this tact
> with various types of chips, etc

In general, XIP isn't as interesting as I first thought. XIP is mutually 
exclusive with compression, and RAM is cheaper than flash. That's even 
_before_ you try to deal with the horrible problems that you're trying to 
work round right now.

But having said that, some of our customers do seem to be on crack so I'm 
looking at XIP anyway :) But I'm trying to get away with declaring 
that the XIP flash chip is _strictly_ read-only, and that the writable 
filesystem is to be kept on an entirely different flash chip.

I should be putting together a version of romfs designed to work on 
read-only memory chips fairly shortly.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
