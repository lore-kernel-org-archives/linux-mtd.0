Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13MUey-00089h-00
	for mtd-list@infradead.org; Wed, 09 Aug 2000 13:08:36 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13MUew-00089K-00
	for mtd@infradead.org; Wed, 09 Aug 2000 13:08:34 +0100
From: David Woodhouse <dwmw2@redhat.com>
In-Reply-To: <39914687.2D805542@arcom.co.uk> 
References: <39914687.2D805542@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: JFFS garbage collection(?) fails 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 09 Aug 2000 13:08:31 +0100
Message-ID: <6299.965822911@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  I was running a script which copies files back and forth checking
> their checksums.  The machine would then reboot after a random time
> (between 5-10 min). The test had been running successfully for about 2
> hrs.  

I ran one of those overnight on the board here, but without the power 
cycles, and without the problems. Actually, I was running two of them in 
parallel.

I hate to say this again, but are you using the latest version of the code, 
with the semaphores in to make writes and garbage collection atomic?

Could you copy reports of JFFS problems to the JFFS development list too?

It's difficult to know what happened without seeing a full debug log of 
what it was doing before the power cycle, and/or a snapshot of the flash 
before the power was returned.

Is there any way you could modify your test cycle to take an image of the 
JFFS flash before attempting to remount it?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
