Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EZjt-00057h-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 16:29:13 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14EZjs-00057b-00
	for mtd@infradead.org; Fri, 05 Jan 2001 16:29:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <978711806.3a55f4fe37922@webmail1.asu.edu> 
References: <978711806.3a55f4fe37922@webmail1.asu.edu>  <978636488.3a54cec86af09@webmail2.asu.edu> <2842.978696346@redhat.com> 
To: Russ.Dill@asu.edu
Cc: mtd@infradead.org
Subject: Re: Supported flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 Jan 2001 16:29:09 +0000
Message-ID: <8151.978712149@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Russ.Dill@asu.edu said:
>  What about flashes that say they have CUI (Command user interface)
> and SR (Status register)? 

Not sure. I haven't encountered those. 

> what are CFI commands? are they 8bit, 16bit? 

Can be either. 

> if you have 2 chips giving you a 32bit databus, does it write out the same
> command on the high lane and the low lane?  

Yep.


Russ.Dill@asu.edu said:
>  I've noticed LART connects address and data lines to flash in
> positions most convienent to route. Does this break any CFI
> functionality? 

What do you mean? It's generally considered quite rude for hardware 
designers to connect nets to _completely_ random places on the chips, 
although sometimes it wouldn't really surprise me.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
