Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13sq7X-00081w-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 17:31:47 +0000
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13sq7V-00081q-00
	for mtd@infradead.org; Mon, 06 Nov 2000 17:31:46 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10011061618420.530-100000@xanadu.gn.com> 
References: <Pine.LNX.4.10.10011061618420.530-100000@xanadu.gn.com> 
To: Nicolas Pitre <nico@cam.org>
Cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 06 Nov 2000 17:31:37 +0000
Message-ID: <9135.973531897@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nico@cam.org said:
> On Mon, 6 Nov 2000, David Woodhouse wrote:
> > OK. Upon prodding, it seems that I'd misunderstood beforehand. You
> > _CAN_ sleep in a standard request function; you don't need to have a 
> > kernel thread. 

> Are you certain of that?

> One place where the request function is called is within
> generic_unplug_device() which is called through a task queue (see
> blk_init_queue()).

I believe the tq_disk task queue is always run from process context. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
