Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13KcCi-0000cR-00
	for mtd-list@infradead.org; Fri, 04 Aug 2000 08:47:40 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13KcCd-0000cK-00
	for mtd@infradead.org; Fri, 04 Aug 2000 08:47:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <0FA1031B65A9D111960900805F9FA8E103B9F02B@txexmta8.amd.com> 
References: <0FA1031B65A9D111960900805F9FA8E103B9F02B@txexmta8.amd.com> 
To: mark.langsdorf@amd.com
Cc: mtd@infradead.org
Subject: Re: request module returns "root fs not mounted" 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 Aug 2000 08:47:18 +0100
Message-ID: <3380.965375238@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mark.langsdorf@amd.com said:
>  When my system is starting up, I perform the do_map_cfi() call before
> I mount the root filesystem.  request_module(cfi_probe) returns "Root
> fs not mounted."

> How can I make the kernel wait to mount the flash until after the root
> filesystem is mounted?

Either load your 'map' driver as a module, or build cfi_probe and whichever 
CFI command set you require into the kernel too.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
