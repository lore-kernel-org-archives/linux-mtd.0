Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137JTo-0006O1-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 16:10:20 +0100
Received: from vindaloo.ras.ucalgary.ca ([136.159.55.21])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 137JTm-0006Nv-00
	for mtd@infradead.org; Wed, 28 Jun 2000 16:10:18 +0100
Date: Wed, 28 Jun 2000 09:12:33 -0600
Message-Id: <200006281512.e5SFCXw25688@vindaloo.ras.ucalgary.ca>
From: Richard Gooch <rgooch@ras.ucalgary.ca>
To: brendan.simon@ctam.com.au
Cc: mtd@infradead.org
Subject: Re: Flash chip locking
In-Reply-To: <395AB066.3070708@ctam.com.au>
References: <16397.962188563@cygnus.co.uk>
	<395AB066.3070708@ctam.com.au>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Brendan Simon writes:
> You are implying that 128us is a large amount of time to wait.  Maybe 
> with todays processors it is, I don't really know if it is or isn't for 
> the average processor speed.  Does the udelay() imply that the scheduler 
> can switch to another process ?  If so, I would have thought that the 
> scheduling process would take a lot longer that 128us, but I could be 
> wrong !!!

Even on a P5, scheduling processes is < 10 us. The problem is getting
control back before they complete their timeslice. If we had an
interrupt after that 128 us it would be easy.

				Regards,

					Richard....
Permanent: rgooch@atnf.csiro.au
Current:   rgooch@ras.ucalgary.ca


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
