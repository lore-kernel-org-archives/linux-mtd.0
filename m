Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12xnr4-000138-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 10:35:02 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=exim)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12xnr3-000132-00
	for mtd@infradead.org; Fri, 02 Jun 2000 10:35:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.10.10006020957280.1038-100000@tammy.signum.se> 
References: <Pine.LNX.4.10.10006020957280.1038-100000@tammy.signum.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: Bjorn Wesen <bjorn.wesen@axis.com>,
    Finn Hakansson <finn.hakansson@axis.com>, mtd@infradead.org,
    alan@redhat.com
Subject: Re: JFFS - ready for submission into 2.[34]? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 02 Jun 2000 10:34:59 +0100
Message-ID: <28494.959938499@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
> > We create our Linux (and even NT) workstations by just taking a dump
> > of the filesystem after installation, and dd'ing that onto the target. That
> > would work just as well for JFFS. 

> That doesn't work well in a factory producing thousands of cameras a week.

You don't have to create the image over and over again - it's no harder to 
use 'dd' than it is to use 'mkfs', surely?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
