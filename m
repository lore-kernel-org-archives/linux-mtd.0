Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zxe3-0003pV-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 16:11:03 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Zxe2-0003pP-00
	for mtd@infradead.org; Tue, 28 Mar 2000 16:11:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000328155631.345A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000328155631.345A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: Preliminary documentation. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Mar 2000 16:11:11 +0100
Message-ID: <19717.954256271@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  A suggested API for fully memory-mapped devices:
>  void lock(struct mtd_info *mtd);
>  void unlock(struct mtd_info *mtd);
>  u_char *mapped; /* may be NULL if not memory mapped device */
> (The "mapped" name could be better...)

I see the most common use of this being when you want to do XIP.

So you're going to want to map it into userspace and leave it mapped - which
means that locking the device for the duration is going to cause significant
problems.

I think the best option might be to let the driver manipulate the page tables 
itself. That way it could do XIP even if it's paged and not 100% mem-mapped, by marking pages as absent, and dealing with page faults as and when they arrive.

alex@cendio.se said:
> Another thing. The void *priv field in the struct mtd isn't neccesary.
> As the structure is allocated by the driver the driver could allocate
> a larger structure (with a struct mtd as first field) and completely
> hide internal data.

I've never thought it very neat to do that kind of thing, although I suppose 
it's safe enough in this case.

>  Why is there a size field in struct erase_info if it must always be
> the size of the mtd erase block size? 

I pondered that as I was writing it up - we ought to either remove it or make 
it legal to use it. I prefer removing it, but left it there at the time mainly 
so that I remembered.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
