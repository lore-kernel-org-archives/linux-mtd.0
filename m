Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sLXA-0006yX-00
	for mtd-list@infradead.org; Thu, 18 May 2000 09:19:56 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12sLX9-0006yR-00
	for mtd@infradead.org; Thu, 18 May 2000 09:19:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0005171150570.14754-100000@phiggins.transzap.com> 
References: <Pine.LNX.4.21.0005171150570.14754-100000@phiggins.transzap.com> 
To: Patrick Higgins <phiggins@transzap.com>
Cc: mtd@infradead.org
Subject: Re: DoC2k_init problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 May 2000 09:19:53 +0100
Message-ID: <15284.958637993@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


phiggins@transzap.com said:
>  Anyone know what might be going on here?

Pure stupidity on my part. Thanks for fixing it .

The reason we're searching through the old list is to make sure that we 
don't get invoked more than once for a DiskOnChip in any given location - 
which could happen if you have docprobe.o as a module, and load it more 
than once. 

There's no equivalent to request_region() for memory space, unfortunately.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
