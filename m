Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13D3Hz-0006eu-00
	for mtd-list@infradead.org; Fri, 14 Jul 2000 12:05:51 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13D3Hx-0006eo-00
	for mtd@infradead.org; Fri, 14 Jul 2000 12:05:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E1397tM-0004tu-00@the-village.bc.nu> 
References: <E1397tM-0004tu-00@the-village.bc.nu> 
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: nico@cam.org (Nicolas Pitre), jgg@ualberta.ca (Jason Gunthorpe),
  bjorn.wesen@axis.com (Bjorn Wesen), jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jul 2000 12:05:34 +0100
Message-ID: <8096.963572734@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alan@lxorguk.ukuu.org.uk said:
> > MTD devices are not even vaguely related to block devices, and don't
> > go anywhere near the buffer cache.

> The interesting question is should they. Withouth them going via the
> block layer you wont be able to mirror them or potentially run a
> loopback fs over them soon 

I had a chat with sct about this. For mirroring the answer is definitely 
"Do it in the VFS". 

Loopback I still maintain should be done via nbd.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
