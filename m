Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CIvB-0007KA-00
	for mtd-list@infradead.org; Wed, 12 Jul 2000 10:35:13 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13CIvA-0007K4-00
	for mtd@infradead.org; Wed, 12 Jul 2000 10:35:12 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <21454.963389948@cygnus.co.uk> 
References: <21454.963389948@cygnus.co.uk>  <20000711212323.21257.qmail@web5302.mail.yahoo.com> 
Cc: Juan Gonzo <kayemmess@yahoo.ca>, MTD Mailing List <mtd@infradead.org>
Subject: Re: mtd devices & jffs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 Jul 2000 10:35:09 +0100
Message-ID: <32068.963394509@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
> > Is there a way to tell JFFS "start at this
> > addr and only use this much space" without changing this code? 

> Give it an MTD device which points at only the range you want it to
> use. See how nora.c splits up the flash chips into four 'partitions'. 

I just committed 'pnc2000.c' which should be clearer. Look at that instead.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
