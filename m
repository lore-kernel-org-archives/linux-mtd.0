Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137Fv2-0005nL-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 12:22:12 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137Fv1-0005nF-00
	for mtd@infradead.org; Wed, 28 Jun 2000 12:22:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <395AB066.3070708@ctam.com.au> 
References: <395AB066.3070708@ctam.com.au>  <16397.962188563@cygnus.co.uk> 
To: brendan.simon@ctam.com.au
Cc: mtd@infradead.org
Subject: Re: Flash chip locking 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 28 Jun 2000 12:24:57 +0100
Message-ID: <20586.962191497@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


brendan.simon@ctam.com.au said:
> Or to avoid ugly "goto" statements.
>   spin_lock_bh();
>   while (!ready)
>   {
>       spin_unlock()
>       udelay(a_little_while);
>       spin_lock_bh();
>   }

Personally, I prefer the goto version. I think it's clearer. We're 
releasing the lock and going back to exactly the state we were in at the 
'retry:' label. It doesn't really matter though. 



> You are implying that 128us is a large amount of time to wait.  Maybe
> with todays processors it is, I don't really know if it is or isn't
> for  the average processor speed. 

It's a long time to disable interrupts or bottom halves. If we didn't have 
to disable bottom halves, I wouldn't worry about it.


> Does the udelay() imply that the scheduler  can switch to another process? 

No. We'd use schedule_timeout() to allow the scheduler to switch.

> If so, I would have thought that the  scheduling process would take a lot
> longer that 128us, but I could be  wrong !!! 

I agree - that's why I used udelay() which is a busy-wait rather than 
scheduling. 

> If no scheduling is performed  then then there would be no difference to
> the naive "foreach" loop that you mention.

The difference is that in the latter version we are allowing interrupts
while we're doing the delay, while in the former they're disabled. There 
are in fact _two_ major differences between the two - the presence of the 
delay, and the place at which we actually wait for the chip to be ready.

The delay is just an optimisation - there's no a lot of point in beating on 
the chip's READY line until there's at least a chance that it'll be done, 
whether we're busy-waiting with IRQs disabled or not.

The important bit is that we let the interrupts run while we're waiting for 
the chip.




--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
