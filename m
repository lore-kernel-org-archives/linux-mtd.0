Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11RzRM-0006ek-00
	for mtd@infradead.org; Fri, 17 Sep 1999 15:56:44 +0100
To: Jason Gunthorpe <jgg@deltatee.com>
Cc: mtd@infradead.org
Subject: mapped helpful functions requiring libgcc.a
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Sep 1999 15:56:29 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11RzR8-00038d-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I've just noticed that the 'mapped' helper function write_flash(), when 
compiled with 2.3.17, requires __divdi3 and __moddi3 from libgcc.a 

This is because of these two lines (just after line 500, at the beginning of 
flash_write):

      // Compute the page offset and reposition
      base = map->page(map,start/map->pagesize);
      off = start %  map->pagesize;

Given that our map window is always going to be a power of two, I suggest that 
we ought to use shifts instead of div/mod here, and change mapsize to be a 
logarithm instead of the actual size.

Jason?




----                                 ----                                 ----
David Woodhouse        David.Woodhouse@mvhi.com       Office: (+44) 1223 810302
 Project Leader,     Process Information Systems      Mobile: (+44) 976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@imladris.demon.co.uk
