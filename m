Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13Rrov-0003li-00
	for mtd-list@infradead.org; Thu, 24 Aug 2000 08:53:05 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13Rrot-0003kh-00
	for mtd@infradead.org; Thu, 24 Aug 2000 08:53:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F071@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9F071@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: Re: Processor Specific Files 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 24 Aug 2000 08:52:56 +0100
Message-ID: <31227.967103576@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mark.langsdorf@amd.com said:
>  My problem is that the cfi_probe() code fails if the PARS  are
> write-cacheable, since the return value of an earlier  probe is
> cached, and then returned for the 4x8 probe.

Why not just fix the BIOS? Making flash regions write-cacheable is just 
wrong, surely?

It would possibly be useful to have some generic code in the physmap.c map 
driver which attempts to turn of caching for the region it's using - is 
there a portable way to call arch-specific routines to do that?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
