Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13CHjc-00078G-00
	for mtd-list@infradead.org; Wed, 12 Jul 2000 09:19:12 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13CHjb-00078A-00
	for mtd@infradead.org; Wed, 12 Jul 2000 09:19:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20000711212323.21257.qmail@web5302.mail.yahoo.com> 
References: <20000711212323.21257.qmail@web5302.mail.yahoo.com> 
To: Juan Gonzo <kayemmess@yahoo.ca>
Cc: MTD Mailing List <mtd@infradead.org>
Subject: Re: mtd devices & jffs 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 12 Jul 2000 09:19:08 +0100
Message-ID: <21454.963389948@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kayemmess@yahoo.ca said:
> Is this possible?  Looking through the JFFS code, they hardcode the
> start address for their scan at 0x0 and get the end addr based on the
> size of the total flash.  Is there a way to tell JFFS "start at this
> addr and only use this much space" without changing this code? 

Give it an MTD device which points at only the range you want it to use.
See how nora.c splits up the flash chips into four 'partitions'.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
