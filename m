Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137f40-0000ty-00
	for mtd-list@infradead.org; Thu, 29 Jun 2000 15:13:08 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137f3y-0000ts-00
	for mtd@infradead.org; Thu, 29 Jun 2000 15:13:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <395B574E.CD20E7C2@pel.dk> 
References: <395B574E.CD20E7C2@pel.dk> 
To: akc <akc@pel.dk>
Cc: mtd@infradead.org
Subject: Re: Problem accessing physical memory... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 29 Jun 2000 15:16:06 +0100
Message-ID: <29551.962288166@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


akc@pel.dk said:
>  I've tried mtdram and it works, but I am going to make a flash driver
> and need access to physical memory.

Ignore slram which I haven't even looked at for months, and look at nora.c
Once we've coded up support for the various kinds of flash chips, all 
you'll need to do is provide the mmap access functions defined in 
linux/mtd/map.h

ISTR something about PPC falling over if you try a large ioremap() because 
it doesn't have a lot of spare VM space. Try smaller dynamic mappings 
rather than mapping the whole lot all at once. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
