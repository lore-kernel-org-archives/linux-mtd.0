Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136ScG-0006F5-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 07:43:32 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 136ScF-0006Ez-00
	for mtd@infradead.org; Mon, 26 Jun 2000 07:43:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000625165745.15303B-100000@white.priv.deltatee.com> 
References: <Pine.LNX.3.96.1000625165745.15303B-100000@white.priv.deltatee.com> 
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: Re: Compile problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 26 Jun 2000 07:45:54 +0100
Message-ID: <25426.962001954@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@deltatee.com said:
>  BTW, I am almost finished redoing my JEDEC stuff to be more like your
> CFI stuff [turns out my SIMM was made in 1995, no CFI] and adding
> support for interleved and banked memories.. will send you a patch
> soon. 

Like my CFI stuff will be when I've finished it, I assume - not like it is 
at the moment - busy waiting and only detecting one chip in a mapping :)

I'm going to protect each chip with its own spinlock, and make erases 
asynchronous. I was hoping to do that last week, but it doesn't seem to 
have happened. Maybe this week.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
