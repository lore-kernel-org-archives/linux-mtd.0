Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140nc1-00045o-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 16:28:09 +0000
Date: Tue, 28 Nov 2000 09:31:49 +0000
From: Shane Nay <shane@agendacomputing.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: Re: XIP kernel + MTD polling interest
Message-ID: <20001128093149.M17376@www.easysolutions.net>
References: <20001128085354.L17376@www.easysolutions.net> <20001128070007.E17376@www.easysolutions.net> <Pine.LNX.4.30.0011282033210.546-100000@xanadu.gn.com> <20001128085354.L17376@www.easysolutions.net> <28079.975427082@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
In-Reply-To: <28079.975427082@redhat.com>; from dwmw2@infradead.org on Tue, Nov 28, 2000 at 15:58:02 +0000
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> Cute, and not too horrible because you already had to copy the data
> section
> into RAM at startup anyway. Doing so with an extra section isn't too much
> of
> a problem, and there's enough other 'put this code in a different
> section' 
> magic in the kernel already that that bit isn't too troublesome either.

Hehe, yes :).


> In general, XIP isn't as interesting as I first thought. XIP is mutually 
> exclusive with compression, and RAM is cheaper than flash. That's even 
> _before_ you try to deal with the horrible problems that you're trying to

> work round right now.

Accurate because of the cost differential at this time :).

> But having said that, some of our customers do seem to be on crack so I'm
> looking at XIP anyway :) But I'm trying to get away with declaring 
> that the XIP flash chip is _strictly_ read-only, and that the writable 
> filesystem is to be kept on an entirely different flash chip.
> 
> I should be putting together a version of romfs designed to work on 
> read-only memory chips fairly shortly.

Our device has the flash memory mapped into the memory map of the device. 
So we use some /dev/rom stuff that's floating around on Brads ftp site, or
more recently I threw together a linear mapped version of cramfs which
works rather nicely, and has a slight boost in performance.  (Hair
splitting slight because of cache churning)

Our quandry is we're doing developers units right now, which are all flash,
and the PCB really can't work with two flash chips, so we have to have the
write-ability of the consumer units which have flash and ROM on the dev
units.  In any event, I don't expect it to be that bad on latency since the
flash chips write is really fast, and we can always call into schedule
between buffered writes or whatever.  (10 words at a time?, can't remember,
but those are imperceptable, it's the erase that's a killer)

Thanks,
Shane.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
