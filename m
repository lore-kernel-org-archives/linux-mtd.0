Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Sban-0004TQ-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 09:17:49 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Sbam-0004TK-00
	for mtd@infradead.org; Tue, 13 Feb 2001 09:17:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <151F3D2AE9F0D3119E480004ACB8EA3701DEC943@cluster01.axis.se> 
References: <151F3D2AE9F0D3119E480004ACB8EA3701DEC943@cluster01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: Johan Adolfsson <johan.adolfsson@axis.com>, mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 09:17:16 +0000
Message-ID: <10951.982055836@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jonas.holmberg@axis.com said:
> I have two AM29LV160D one top and one bottom boot and the both say
> bootloc==0 :(

One of these days I really am going to painfully slaughter a hardware 
designer. The engineers at an unnamed company who decided to route the 
PCMCIA socket's interrupt line to a general purpose I/O line on the SH3 CPU 
without any possibility of generating an interrupt were prime targets a few 
weeks ago. AMD are in that spot now. Strange - the chip manufacturers are 
generally more clueful - it's the monkeys who glue them together who 
usually screw it up (present company excepted :)

Is there _any_ difference between these chips which is detectable without 
actually trying to erase the damn things and observing how much data gets 
removed?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
