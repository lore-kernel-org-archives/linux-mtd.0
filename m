Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137F9n-0005fv-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 11:33:23 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137F9k-0005fp-00
	for mtd@infradead.org; Wed, 28 Jun 2000 11:33:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: Philipp Rumpf <prumpf@uzix.org>
Subject: Flash chip locking
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 28 Jun 2000 11:36:03 +0100
Message-ID: <16397.962188563@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

OK. After some deliberation, this is the arrangement I'm about to code up 
for preventing concurrent access to flash chips. If you don't like it, 
feel free to present a better alternative.

Each chip is protected by a spinlock, which prevents it from being accessed 
concurrently by different CPUs. Lovely, simple, and even free on UP 
machines. 

Unfortunately, we have to consider the fact that this lock will also be 
obtained from a Bottom Half context, when the "has the erase finished yet?" 
timer runs. Therefore, all occurrences of spin_lock in the main code have 
to be spin_lock_bh()¹ instead of the nurmal (and almost free) spin_lock().

This means that bottom halves are disabled for the entire time that we're 
talking to the flash chip. Not good if we hold them for a long time, like 
for example the 128µs that we expect a typical write cycle to take. 

So we try to keep the latency down to a minimum. Rather than the naïve 
inner loop which looked like this:

foreach(word to write) {
	spin_lock_bh();
	writeb(WRITE_COMMAND);
	writeb(datum);
	while (!done)
		;
	spin_unlock_bh();
}

... we do something more like

foreach(word to write) {

retry:
	spin_lock_bh();
	if (!ready) {
		spin_unlock()
		udelay(a little while);
		goto retry;
	}
	writeb(WRITE_COMMAND);
	writeb(datum);
	spin_unlock_bh();
	udelay(expected time for the write we just started);
	spin_lock_bh();
	check final status, loop or whatever
	spin_unlock_bh();
}

We'll need to keep a 'state' variable in the per-chip data structure, so 
that if anything else grabs the lock while we're waiting for an operation 
to complete, it knows that there's an operation in progress and that it 
should either suspend it and do its thing before resuming the operation, 
or just go away and wait for the operation to finish.

We may add a wait queue to handle the latter case - so the write call can 
wake_up the waiting processes when it's completely finished. This will be
come more clear as I code it up.


¹ spin_lock_bh() doesn't exist in 2.2 so it's added to compatmac.h as:
#define spin_lock_bh(lock) do {start_bh_atomic();spin_lock(lock);}while(0);


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
