Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KNEV-0006rJ-00
	for mtd-list@infradead.org; Thu, 03 Aug 2000 16:48:31 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13KNE0-0006rD-00
	for mtd@infradead.org; Thu, 03 Aug 2000 16:48:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39899405.CAB92AA4@arcom.co.uk> 
References: <39899405.CAB92AA4@arcom.co.uk> 
To: David Vrabel <dvrabel@arcom.co.uk>
Cc: mtd@infradead.org
Subject: Re: Messages produced by cfi_probe.c and cfi_cmdset_0001.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 03 Aug 2000 16:47:01 +0100
Message-ID: <9202.965317621@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dvrabel@arcom.co.uk said:
>  cfi_probe.c and cfi_cmdset_0001.c both produce large quantities of
> output when probing. (eg all of the CFI query data).  Is is necessary?
>  Can I remove it (comment it out,#ifdef, debug only messages etc.)?

It's only there because it came long before the actual access routines, and 
it make me happy to think that the code could do something useful :)

By all means, wrap it in #if 0


> Also, in cfi_cmdset_0001.c in cfi_intelext_write_{2_by_8,1_by_16}_buffe
> rs() we always write a full buffer even if we have less than a buffer
> to write.  This affects performace (particularly when writing short
> <32byte buffers).  Is there a reason why this is done like this?

Laziness. Please do fix it.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
