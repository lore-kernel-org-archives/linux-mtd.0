Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141AsI-0001C9-00
	for mtd-list@infradead.org; Wed, 29 Nov 2000 17:18:30 +0000
Received: from cerebus-ext.cygnus.co.uk ([194.130.39.252] helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141AsH-0001C2-00
	for mtd@infradead.org; Wed, 29 Nov 2000 17:18:29 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20001129101917.H996@www.easysolutions.net> 
References: <20001129101917.H996@www.easysolutions.net>  <20001128085354.L17376@www.easysolutions.net> <20001128070007.E17376@www.easysolutions.net> <Pine.LNX.4.30.0011282033210.546-100000@xanadu.gn.com> <20001128085354.L17376@www.easysolutions.net> <28079.975427082@redhat.com> 
To: Shane Nay <shane@agendacomputing.com>
Cc: Nicolas Pitre <nico@cam.org>, mtd@infradead.org
Subject: Re: XIP kernel + MTD polling interest 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 29 Nov 2000 17:18:14 +0000
Message-ID: <28305.975518294@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


shane@agendacomputing.com said:
> What I'm thinking is we already have the wrapper code for cfi_udelay,
> if we were to replace all calls to schedule to this wrapper guy in
> cfi_cmdset_0001.c, then it would be really clean, just get rid of that
> if(current->need_resched) schedule(), to just go to udelay(us) #if
> defined MTD_XIP.  That would be the only real change that would need
> to be made, except flipping off interrupts when switching modes in
> MTD_XIP.

> What do you guys think of doing this change?..., Any negatives? 

Sounds reasonable to me. I'd like to see the section magic too.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
