Return-path: <David.Woodhouse@mvhi.com>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 111Eig-0004jN-00
	for mtd@infradead.org; Mon, 5 Jul 1999 20:48:02 +0100
To: Jason Gunthorpe <jgg@ualberta.ca>
Cc: mtd@infradead.org
Subject: Re: FFS2 and MTDs (flash) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Jul 1999 20:47:58 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E111Eic-0002Ka-00@devel2.axiom.internal>
Sender: David Woodhouse <David.Woodhouse@mvhi.com>
List-ID: <linux-mtd.lists.infradead.org>


jgg@ualberta.ca said:
>  It is not a huge deal, but if you are accessing the same memory again
> and again to do lookups like FFS2 does then a caching in system ram
> does speed things, and you get it for free ;>
>  

I was thinking that the CPU L1/L2 cache will have much the same effect, but 
I suppose on the type of systems we're talking about, there's not going to be 
a usefully large CPU cache. Shame; it seemed like quite a nice idea. 

It'd be nice to retain the option of doing it for those systems where it makes
sense - and I think the way you're doing it should allow that. So we can look 
into it later if we want to.



----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
