Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11g7aM-0004Al-00
	for mtd@infradead.org; Tue, 26 Oct 1999 15:28:26 +0100
To: Bob Canup <rcanup@go2fax.com>
Cc: mtd@infradead.org
Subject: Re: follow up 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Oct 1999 15:28:23 +0100
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11g7aK-0007tj-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


rcanup@go2fax.com said:
> BLOCK_USED found after BLOCK_FREE in Virtual unit Chain 0 for block 1
> BLOCK_USED found after BLOCK_FREE in Virtual unit Chain 0 for block 1

I think this is what happens when a block is deleted from the NFTL completely, 
and the M-Systems driver is interrupted in the middle of folding the chain.

If you only write to the system using my driver, then this should go away, 
because my driver won't do that. Perhaps it should, but that's a different 
matter.

I believe that my response to that situation is correct according to their 
NFTL specification. I just put the message in to warn me, because I didn't 
know whether it ever actually happened.


----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
