Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 136UMB-0006Ui-00
	for mtd-list@infradead.org; Mon, 26 Jun 2000 09:35:03 +0100
Date: Mon, 26 Jun 2000 02:37:25 -0600 (MDT)
From: Jason Gunthorpe <jgg@ualberta.ca>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: Compile problems 
In-Reply-To: <25426.962001954@cygnus.co.uk>
Message-ID: <Pine.LNX.3.96.1000626023506.881G-100000@wakko.deltatee.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Mon, 26 Jun 2000, David Woodhouse wrote:

> Like my CFI stuff will be when I've finished it, I assume - not like it is 
> at the moment - busy waiting and only detecting one chip in a mapping :)

Hopefully close :> I have the whole thing done, just need to test it now.
 
> I'm going to protect each chip with its own spinlock, and make erases 
> asynchronous. I was hoping to do that last week, but it doesn't seem to 
> have happened. Maybe this week.

If you do that can you do the JEDEC one too? I'm not at all sure how
to ho about doing that, but the flash_erase function is split just so
someone eventually could. 

Seperate spinlocks is possible too, each chip has it's own little struct
that can be locked off.

Jason



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
