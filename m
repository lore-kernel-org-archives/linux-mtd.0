Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137O2m-0007NG-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 21:02:44 +0100
Date: Wed, 28 Jun 2000 13:05:34 -0700
From: Philipp Rumpf <prumpf@uzix.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: Re: Flash chip locking
Message-ID: <20000628130534.A28487@fruits.uzix.org>
References: <16397.962188563@cygnus.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
In-Reply-To: <16397.962188563@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, Jun 28, 2000 at 11:36:03AM +0100, David Woodhouse wrote:
> OK. After some deliberation, this is the arrangement I'm about to code up 
> for preventing concurrent access to flash chips. If you don't like it, 
> feel free to present a better alternative.
> 
> Each chip is protected by a spinlock, which prevents it from being accessed 
> concurrently by different CPUs. Lovely, simple, and even free on UP 
> machines. 

on UP machines with recent compilers, at least.

> This means that bottom halves are disabled for the entire time that we're 
> talking to the flash chip. Not good if we hold them for a long time, like 
> for example the 128µs that we expect a typical write cycle to take. 

Not good, but shouldn't be fatal either.

> So we try to keep the latency down to a minimum. Rather than the naïve 
> inner loop which looked like this:
> 
> foreach(word to write) {
> 	spin_lock_bh();
> 	writeb(WRITE_COMMAND);
> 	writeb(datum);
> 	while (!done)
> 		;
> 	spin_unlock_bh();
> }
> 
> ... we do something more like
> 
> foreach(word to write) {
> 
> retry:
> 	spin_lock_bh();
> 	if (!ready) {

Just to be sure, ready is really a complicated writeb/readb sequence ?

> 		spin_unlock()
> 		udelay(a little while);

udelay(1); should be sufficient here.

> 		goto retry;
> 	}
> 	writeb(WRITE_COMMAND);
> 	writeb(datum);
> 	spin_unlock_bh();
> 	udelay(expected time for the write we just started);
> 	spin_lock_bh();
> 	check final status, loop or whatever
> 	spin_unlock_bh();
> }
> 
> We'll need to keep a 'state' variable in the per-chip data structure, so 
> that if anything else grabs the lock while we're waiting for an operation 
> to complete, it knows that there's an operation in progress and that it 
> should either suspend it and do its thing before resuming the operation, 
> or just go away and wait for the operation to finish.

Sounds like yucky hardware to me .. otoh, a state variable shouldn't be a
problem.

> We may add a wait queue to handle the latter case - so the write call can 
> wake_up the waiting processes when it's completely finished. This will be
> come more clear as I code it up.

That'd benefit SMP only, wouldn't it ?

	Philipp Rumpf


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
