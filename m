Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H5AJ-00009t-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 14:54:35 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13H5AH-00009m-00
	for mtd@infradead.org; Tue, 25 Jul 2000 14:54:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0007251206470.17368-100000@vvv.axis.se> 
References: <Pine.LNX.4.21.0007251206470.17368-100000@vvv.axis.se> 
To: Finn Hakansson <finn@axis.com>
Cc: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>,
  "mtd@infradead.org" <mtd@infradead.org>, jffs-dev@axis.com
Subject: Re: jffs_file_write 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 25 Jul 2000 14:54:30 +0100
Message-ID: <31437.964533270@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


finn@axis.com said:
> On Tue, 25 Jul 2000, David Woodhouse wrote:
> > I'm far more concerned by the thing getting corrupted when I abruptly 
> > remove power - I'm about to see if I can reproduce it with the patches
> > you committed just before I left - do you have any ideas from the log I
> > posted on the 17th of July?

> I'll take a look at it after lunch. 

I've now updated my kernel to the latest code from CVS, and I can still 
reproduce it. I'll start logging and try to do it again. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
