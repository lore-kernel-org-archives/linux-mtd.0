Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZbM5-0000vO-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 16:23:01 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZbM4-0000vI-00
	for mtd@infradead.org; Mon, 27 Mar 2000 16:23:00 +0100
Received: from devel2.axiom.internal ([10.0.1.4])
	by server.axiom.internal with esmtp (Exim 3.03 #1)
	id 12ZbM4-0001hu-00
	for mtd@infradead.org; Mon, 27 Mar 2000 16:23:00 +0100
Received: from dwmw2 by devel2.axiom.internal with local (Exim 1.90 #1)
	for mtd@infradead.org
	id 12ZbM4-0002cV-00; Mon, 27 Mar 2000 16:23:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000327164508.26529C-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000327164508.26529C-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Subject: Re: New release of MTD code pending. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 16:22:29 +0100
Message-ID: <10067.954170549@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  When I fire away a flash erase, can i just continue working with the
> flash, content with knowing that if i do a read or write while the
> chip is erasing it will block? I thought so at first, and it would be
> the logical thing.  

This is how it _should_ work. The hardware driver should keep track of when 
each chip is busy erasing, and when it receives a new request for that chip, 
it may block, or may decide to interrupt the erase (it must then restart the 
erase itself).


>  WTF is this? 

Broken. Luckily, not even M-Systems can find examples of the device that code
is supposed to drive. I _think_ that the idea was "if we're currently erasing 
this cell, then it's going to be all 0xFF, so there's no point in waiting 
until it's done, we might as well use memset."


>  Also, doc2000.c: doc_erase() doesn't seem to call the callback
> function at all.

Two reasons: firstly, like I said - I didn't remember how it worked, so I just
implemented doc_erase() synchronously. nftl.c relies on that, so would break if
you coded a new NAND device driver which wasn't synchronous (Patent issues
aside).

Secondly, it was easier to get something up and running without worrying about
threading - I've been putting off the threading of doc2000 / nftl until I'm
happy with the correctness of the NFTL code. But it's definitely on the TODO
list.




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
