Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Aq5-0001Bz-00
	for mtd-list@infradead.org; Wed, 29 Nov 2000 17:16:13 +0000
Date: Wed, 29 Nov 2000 10:19:17 +0000
From: Shane Nay <shane@agendacomputing.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Shane Nay <shane@agendacomputing.com>, Nicolas Pitre <nico@cam.org>,
   mtd@infradead.org
Subject: Re: XIP kernel + MTD polling interest
Message-ID: <20001129101917.H996@www.easysolutions.net>
References: <20001128085354.L17376@www.easysolutions.net> <20001128070007.E17376@www.easysolutions.net> <Pine.LNX.4.30.0011282033210.546-100000@xanadu.gn.com> <20001128085354.L17376@www.easysolutions.net> <28079.975427082@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
In-Reply-To: <28079.975427082@redhat.com>; from dwmw2@infradead.org on Tue, Nov 28, 2000 at 15:58:02 +0000
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

MTD folk,

Okay, I've redone my stuff with the ELF section.  It's actually pretty
clean, and does full intialization up through the Intel command set.  I'm
still trying to figure out the best way to deal with calls to schedule. 
What I'm thinking is we already have the wrapper code for cfi_udelay, if we
were to replace all calls to schedule to this wrapper guy in
cfi_cmdset_0001.c, then it would be really clean, just get rid of that
if(current->need_resched) schedule(), to just go to udelay(us) #if defined
MTD_XIP.  That would be the only real change that would need to be made,
except flipping off interrupts when switching modes in MTD_XIP.

What do you guys think of doing this change?..., Any negatives?

Thanks,
Shane Nay.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
