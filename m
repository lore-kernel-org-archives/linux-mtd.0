Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pYGO-0002WI-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 17:23:36 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pYGN-0002VY-00
	for mtd@infradead.org; Tue, 17 Apr 2001 17:23:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.BSO.4.33.0104170918380.25263-100000@shell.pacifier.com> 
References: <Pine.BSO.4.33.0104170918380.25263-100000@shell.pacifier.com> 
To: Manatee <manatee@pacifier.com>
Cc: mtd@infradead.org
Subject: Re: mtd on linux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 17:23:00 +0100
Message-ID: <5071.987524580@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


manatee@pacifier.com said:
>  It is a Disk On Chip and it fits into a PCI slot. 

OK. I'd heard of those but haven't actually met one yet.

>  I see where jumpers would go but there are no jumpers on the card.

I was thinking of the ISA eval board.

>  Ah, so if I can get the machine to boot -- with the card in place --
> then I can access the card. 

Probably. It depends just how the PCI eval board is set up. Isn't there a 
key sequence you can use during booting to prevent the DiskOnChip BIOS from 
loading itself? Or use the DFORMAT program provided to load the null 
firmware. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
