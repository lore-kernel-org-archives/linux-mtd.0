Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ssI0-0000Oj-00
	for mtd-list@infradead.org; Mon, 06 Nov 2000 19:50:44 +0000
Date: Mon, 6 Nov 2000 20:02:15 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: corruption with mtdblock 
In-Reply-To: <9135.973531897@redhat.com>
Message-ID: <Pine.LNX.4.10.10011061947170.530-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 6 Nov 2000, David Woodhouse wrote:

> 
> nico@cam.org said:
> > On Mon, 6 Nov 2000, David Woodhouse wrote:
> > > OK. Upon prodding, it seems that I'd misunderstood beforehand. You
> > > _CAN_ sleep in a standard request function; you don't need to have a 
> > > kernel thread. 
> 
> > Are you certain of that?
> 
> > One place where the request function is called is within
> > generic_unplug_device() which is called through a task queue (see
> > blk_init_queue()).
> 
> I believe the tq_disk task queue is always run from process context. 

Hmmm...  Maybe.  However the code at many places where the tq_disk is run
seem to expect it is run asynchronously while some other places it is run
synchronously while sticking to a wait queue with the task state set to
TASK_UNINTERRUPTIBLE...  I'm afraid we could break something by suddenly
returning from run_task_queue() with the current process' state set to
TASK_RUNNING.

Anyway it doesn't explain the corruption problem.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
