Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13925i-000308-00
	for mtd-list@infradead.org; Mon, 03 Jul 2000 10:00:34 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13925g-000301-00
	for mtd@infradead.org; Mon, 03 Jul 2000 10:00:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <395DC4F0.5610B924@crossnet.co.jp> 
References: <395DC4F0.5610B924@crossnet.co.jp> 
To: Masami Komiya <mkomiya@crossnet.co.jp>
Cc: mtd@infradead.org
Subject: Re: Fujitsu MBM29LV160 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Jul 2000 10:04:17 +0100
Message-ID: <7330.962615057@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mkomiya@crossnet.co.jp said:
> We try to port Linux kernel to our embedded system that has Fujitsu's
> NOR type Flash memory MBM29LV160.

Is it CFI-compliant?

If so, it'll be at least detected by the current code. 

If it is capable of using the Intel command set, then it is supported. 
Otherwise, you will have a little bit of work to do to add support for it. 

It should be quite simple to add support for it if it doesn't support the 
Intel command set.

First you need to provide a 'map' driver which allows access to the flash 
chips. Look at something simple like nora.c for an example - if your flash 
chips are mapped into virtual memory then all you need to do is change a 
couple of defines in nora.c to drive your own board.

Then load the cfi_probe module and the nora module (or your own map driver).

Show me all the output you get from it.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
