Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ABC7-0006Fm-00
	for mtd-list@infradead.org; Thu, 06 Jul 2000 13:55:55 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13ABC6-0006Fg-00
	for mtd@infradead.org; Thu, 06 Jul 2000 13:55:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <396460AB.9BEC2657@crossnet.co.jp> 
References: <396460AB.9BEC2657@crossnet.co.jp>  <Pine.LNX.4.21.0007050937500.1226-100000@imladris.demon.co.uk> 
To: Masami Komiya <mkomiya@crossnet.co.jp>
Cc: mtd@infradead.org
Subject: Re: Fujitsu MBM29LV160 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Jul 2000 13:55:48 +0100
Message-ID: <327.962888148@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mkomiya@crossnet.co.jp said:
> I want to use FTL and JFFS for our system. These filesystems can be
> used on AMD's flash chips?

FTL provides a block device, on which you put a 'normal' filesystem.
JFFS runs directly on the flash.

You don't need both, and FTL is patented in some jurisdictions so you're 
not permitted to use it on non-PCMCIA devices.


mkomiya@crossnet.co.jp said:
> Our system has two interleaved flash in 32 bit mode. So I want to
> implement only 32bit read & write routines instead of 16 bit if it is
> allowed. FTL or JFFS require 16bit read & write routines ?

FTL and JFFS can't actually tell what the underlying MTD driver uses to 
talk to the flash chips. So it doesn't matter. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
