Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b2Si-0000cY-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 15:36:20 +0000
Received: from humbolt.nl.linux.org ([131.211.28.48] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14b2Sf-0000ZT-00
	for mtd@infradead.org; Thu, 08 Mar 2001 15:36:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0103080809310.7682-100000@penguin.theopalgroup.com> 
References: <Pine.LNX.4.21.0103080809310.7682-100000@penguin.theopalgroup.com> 
To: Kevin Jacobs <jacobs@penguin.theopalgroup.com>
Cc: mtd@infradead.org
Subject: Re: Oh, the many joys of MTD... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Mar 2001 14:43:00 +0000
Message-ID: <12369.984062580@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jacobs@penguin.theopalgroup.com said:
>  My first questions is likely something fairly basic.  I've read over
> much of the MTD source and it seems that many of the erase and write
> functions do not deal with concurrent access and CPU cache issues.
> What happens when a {read,write,erase} request comes in for a sector
> that is being {written,erased}?

See the state machine in cfi_cmdset_000[12].c. We wait until the operation 
which is currently in progress has completed. Theoretical support for 
interruption of erases and writes is there, but it's not yet implemented.

> Also, is it assumed that the memory mapped for MTD devices will not be
> cached by the CPU?  If so, is it feasible to add support.  If not,
> where is code to flush/update the cache after a write or erase
> operation? 

It's assumed that it won't be cached, you are correct. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
