Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11iZle-0004xF-00
	for mtd@infradead.org; Tue, 2 Nov 1999 08:58:14 +0000
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: miket@bluemug.com, SLEAS@videoupdate.com, sct@redhat.com,
    joh@xinit.se, linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: jfs/linux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 02 Nov 1999 08:32:49 +0000
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11iZN3-00027B-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alan@lxorguk.ukuu.org.uk said:
>  Ditto with Compact flash (ATAPI). Compact flash according to the docs
> does its own wear levelling.  Im still baffled why people use the
> other stuff 8) 

Cost, size, complexity.

Why muck about with PCMCIA/IDE chipsets and CompactFlash when you can just 
dump a chunk of NOR flash straight on your mainboard (or in a DIMM slot) and 
use that?

----                                ----                                 ----
David Woodhouse       David.Woodhouse@mvhi.com      Office: (+44) 1223 810302
 Project Leader,    Process Information Systems     Mobile: (+44) 7976 658355
    Axiom (Cambridge) Ltd., Swaffham Bulbeck, Cambridge, CB5 0NA, UK.
             finger dwmw2@ferret.lmh.ox.ac.uk for PGP key.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
