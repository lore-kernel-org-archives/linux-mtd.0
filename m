Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZaRJ-0000bt-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:24:21 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZaRI-0000bn-00
	for mtd@infradead.org; Mon, 27 Mar 2000 15:24:20 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000327161351.26450A-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000327161351.26450A-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: New release of MTD code pending. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 15:24:19 +0100
Message-ID: <9794.954167059@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


alex@cendio.se said:
>  I saw the new FTL code uses 2.3 style module initialization, and so
> does my mtdram code. Are we targeting only 2.3, or should we add some
> kludges to support older versions?

I'd like to support 2.2 unless it's too much trouble. doc2000 and nftl already 
do (should?)

> I'm mostly interested in 2.4 (and 2.5) stuff, as I hope we can get MTD
> included in the 2.5 release cycle. Also much of the API (i.e. modules)
> is cleaner in 2.3. 

I hope we can get it in earlier than 2.5. "New drivers that don't affect 
infrastructure are never too late."


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
