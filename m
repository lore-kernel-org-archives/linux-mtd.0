Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 1399eu-0004NC-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 18:05:24 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 1399es-0004N6-00
	for mtd@infradead.org; Mon, 03 Jul 2000 18:05:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000627124319.12137A-100000@wakko.deltatee.com> 
References: <Pine.LNX.3.96.1000627124319.12137A-100000@wakko.deltatee.com> 
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: mtd@infradead.org
Subject: Changing mtd.name to a char *
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Jul 2000 18:09:08 +0100
Message-ID: <26435.962644148@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
> Hmmm. How about a char * ?
> That might be best.

Argh. The MEMGETINFO ioctl returns the first part of the struct mtd_info, 
which used to contain the actual name of the device, but now just holds a 
pointer to it.

For now, I've just shifted the name field out of the part which is available
to the user - if anyone cares, you'll have to code up a MEMGETNAME ioctl
which nicely and safely passes back the variable-length name. 

Of course, I'm still screwed because I can't currently compile armv4l 
binaries for my test board, so I can't update my utils to reflect that.

Could anyone compile the contents of the util/ directory for armv4l and 
mail them to dwmw2@redhat.com?


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
