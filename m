Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132VL4-0006dL-00
	for mtd-list@infradead.org; Thu, 15 Jun 2000 09:49:26 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 132VL3-0006dF-00
	for mtd@infradead.org; Thu, 15 Jun 2000 09:49:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39489799.EDB77B51@pel.dk> 
References: <39489799.EDB77B51@pel.dk> 
To: akc <akc@pel.dk>
Cc: mtd@infradead.org
Subject: Re: CVS access 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 15 Jun 2000 09:49:37 +0100
Message-ID: <15540.961058977@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


akc@pel.dk said:
> I tried the Anonymous CVS access, as described, but receives
> connection refused after entering the password ???

Works from here. Are you sure you're not firewalled? I don't understand how 
you can receive 'connection refused' after it's already asked you for a 
password - you're already connected by then.

Can you cut and paste exactly what you see?

passion /home/dwmw2 $ cvs -d :pserver:anoncvs@infradead.org:/home/cvs login
(Logging in to anoncvs@infradead.org)
CVS password: 
passion /home/dwmw2 $ cvs -d :pserver:anoncvs@infradead.org:/home/cvs co mtd
cvs server: Updating mtd
cvs [checkout aborted]: received interrupt signal


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
