Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EZiP-00056B-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 16:27:41 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14EZiO-000565-00
	for mtd@infradead.org; Fri, 05 Jan 2001 16:27:40 +0000
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 14EZiN-000258-00
	for mtd@infradead.org; Fri, 05 Jan 2001 16:27:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Re: Supported flash memory (fwd)
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 Jan 2001 16:27:39 +0000
Message-ID: <8005.978712059@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

forwarded by request,

--
dwmw2

------- Forwarded Message

Date: Fri, 05 Jan 2001 09:23:26 -0700 (MST)
From: Russ.Dill@asu.edu
Subject: Re: Supported flash memory
To: David Woodhouse <dwmw2@infradead.org>

Quoting David Woodhouse <dwmw2@infradead.org>:

> 
> Russ.Dill@asu.edu said:
> >  Besides footprints, pinouts, etc, my other concern is software. The
> > logical combination would seem to be blob/mtd. What flash products
> are
> > known or probable to be compatible with this combination, what should
> > I look for to attempt to assertain compatibilty? Does blob/mtd work
> > transparently with a 16bit or 32bit ROM bus? 
> 
> The MTD code ought to work with any CFI-compliant flash chip from Intel
> or 
> AMD, and with a few others too. In most combinations of bus size / 
> interleave.
> 
> I don't know about blob, but RedBoot should support most of the flash 
> setups you're likely to encounter, too.

What about flashes that say they have CUI (Command user interface) and SR
(Status register)? 

what are CFI commands? are they 8bit, 16bit? if you have 2 chips giving you a
32bit databus, does it write out the same command on the high lane and the low
lane? 

I've noticed LART connects address and data lines to flash in  positions most
convienent to route. Does this break any CFI functionality?


------- End of Forwarded Message





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
