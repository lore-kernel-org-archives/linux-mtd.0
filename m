Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 137KuT-0006ii-00
	for mtd-list@infradead.org; Wed, 28 Jun 2000 17:41:57 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 137KuR-0006ic-00
	for mtd@infradead.org; Wed, 28 Jun 2000 17:41:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000628101404.16453C-100000@wakko.deltatee.com> 
References: <Pine.LNX.3.96.1000628101404.16453C-100000@wakko.deltatee.com> 
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: Bjorn Wesen <bjorn.wesen@axis.com>, jffs-dev@axis.com, mtd@infradead.org
Subject: Re: garbage collect 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 28 Jun 2000 17:44:44 +0100
Message-ID: <1376.962210684@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
>  Yes, that is how other block devices work? Can we somehow reuse that
> mechanism, whatever it is.. 

You don't want to know. The existing partitioning stuff in Linux is 
absolutely disgusting, and it's likely to be replaced fairly early in 2.5



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
