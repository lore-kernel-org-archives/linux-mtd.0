Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pWqx-0001KN-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 15:53:15 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pWqw-0001KG-00
	for mtd@infradead.org; Tue, 17 Apr 2001 15:53:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.BSO.4.33.0104122209520.4678-100000@shell.pacifier.com> 
References: <Pine.BSO.4.33.0104122209520.4678-100000@shell.pacifier.com> 
To: Manatee <manatee@pacifier.com>
Cc: mtd@infradead.org
Subject: Re: mtd on linux 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 17 Apr 2001 15:52:38 +0100
Message-ID: <26445.987519158@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


manatee@pacifier.com said:
>  I compiled the 2.4.1 kernel for Linux which has support for this device.

Which device?

> Then I put the card in the PCI slot and rebooted. 

Which card?

> My harddrive was not recognized. 

I know nothing about harddrives. 


manatee@pacifier.com said:
> What I want to do is just boot up as normal and then mount the card
> and take a look at what is on it. Just curious. Could someone tell me
> how to install the card so it does not interfere with normal booting?
> And once I boot up how, specifically, can I take a look at what is on
> the 'disk on chip'? Thank you. 

Do you have a DiskOnChip on an evaluation board? The way I prevent it from 
interfering with normal booting is to remove the jumper which controls the 
memory window during booting, and replace it after the grub or lilo prompt 
has appeared. If you _never_ want to boot from it, you can just destroy the 
firmware on it. M-Systems provide an 'fff.exb' or similarly named firmware 
file for this purpose.

If you get Linux to boot, with the DOC2000 and NFTL config options 
turned on (or if you load the modules), then you ought to be able to access 
the device as /dev/nftla (block 93,0) and /dev/nftla1 (block 93,1). 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
