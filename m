Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JAA6-0001kb-00
	for mtd-list@infradead.org; Mon, 31 Jul 2000 08:38:58 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JAA5-0001kV-00
	for mtd@infradead.org; Mon, 31 Jul 2000 08:38:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39800397.3C3CB51B@auriga.ru> 
References: <39800397.3C3CB51B@auriga.ru> 
To: Nick Ivanter <nick@auriga.ru>
Cc: mtd <mtd@infradead.org>
Subject: Re: flash write, erase & timeouts 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Mon, 31 Jul 2000 08:38:51 +0100
Message-ID: <4061.965029131@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


nick@auriga.ru said:
>  Could anyone please explain the following thing which I see in
> cfi_cmdset_0001.c.

> After writing a Program command and data we are do udelay(chip->
> word_write_time), but when erasing a sector we instead call
> schedule_timeout(HZ) as the Erase command is written. Is it just
> ocassionally or there is a point in doing that way?

We expect the Program command to take around 128 µs, and we don't want to 
schedule() for that period of time because we wouldn't get the CPU back 
quickly enough - so we just drop all the locks and use udelay(). 

What you're looking at is roughly the form of the final implementation of 
the Program command.

The Erase command, on the other hand, is expected to take around a second, 
so we're happy to schedule() and wait for it. In fact, the intention is 
that the erase() function call should return immediately, and that the 
completion should be detected by a timer call, which calls the callback 
function in the erase instruction structure. 


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
