Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140lSv-0003HV-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 14:10:37 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 140lSs-0003HP-00
	for mtd@infradead.org; Tue, 28 Nov 2000 14:10:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20001128070007.E17376@www.easysolutions.net> 
References: <20001128070007.E17376@www.easysolutions.net> 
To: Shane Nay <shane@agendacomputing.com>
Cc: mtd@infradead.org
Subject: Re: XIP kernel + MTD polling interest 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 28 Nov 2000 14:08:22 +0000
Message-ID: <6193.975420502@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


shane@agendacomputing.com said:
>   What I'm really wondering is whether I should move to make patches
> off of the present versions of cfi_probe.c, cfi.h, cfi_cmdset_0001.c,
> or whether I should just fork them?  (Basically, it follows the same
> logic, I just use macros to build copies of functions in memory also
> the code gets messy because I can't use else, can't use switch, and
> can't use return until the bottom of the function.  Also can't use
> printk, or any kernel function while the flash is in query, or write
> mode)

If it can be cleanly merged with macros then it's probably worth doing. 
Otherwise, it's best to fork it. The former is preferable.

Show me the code. Do you have a filesystem working XIP from flash yet?
I'm about to start looking at hacking romfs to prepopulate the page cache 
with pages directly from the flash chip.


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
