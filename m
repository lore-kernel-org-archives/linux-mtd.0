Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Si03-0007ub-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 16:08:19 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14Si02-0007tV-00
	for mtd@infradead.org; Tue, 13 Feb 2001 16:08:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200102131555.HAA26937@shell9.ba.best.com> 
References: <200102131555.HAA26937@shell9.ba.best.com> 
To: Subodh Nijsure <subodh@best.com>
Cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: Trying to get CFI to work on my board. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 16:06:52 +0000
Message-ID: <31581.982080412@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


subodh@best.com said:
>  Correct?  So when I  execute virt_to_phys on physmap_map.map_priv_1
> shouldn't I get my "original" physical address of 0x28000000 back? but
> I am getting  following output 

No. You should get a 'cookie' back which is to be passed to the kernel's 
read[bwl] functions. This 'cookie' may be coincidence be very similar to a 
virtual address. 

I don't think virt_to_phys() is supposed to work for ioremapped areas - 
only for main memory. If you just use map_rom_probe instead of cfi_probe, 
can you read sensible data from the beginning of the chip (i.e. does it 
match what you know is in there)?

What chips are on the board and how are they arranged? 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
