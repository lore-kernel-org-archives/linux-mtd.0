Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12UQxC-0002w5-00
	for mtd-list@infradead.org; Mon, 13 Mar 2000 09:15:58 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12UQxA-0002vz-00
	for mtd@infradead.org; Mon, 13 Mar 2000 09:15:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000313094651.32523A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000313094651.32523A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: More comments 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 Mar 2000 09:15:51 +0000
Message-ID: <26768.952938951@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  That means i have to wrap all write and reads in a function that
> loops over the read/write call.

This has to be done somewhere. Where's best - in _every_ device driver or in
only those front ends which attempt non-block-aligned access?


> Hmm, i think i spoke to soon. It would still need some kind of
> locking. How about an explicit read_lock()/read_unlock(). It could
> even use rw_semaphores to allow concurrent reads from several readers.

Yes - that sounds like a good idea.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
