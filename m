Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pYDe-0002Qa-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 17:20:46 +0100
Date: Tue, 17 Apr 2001 09:20:39 -0700 (PDT)
From: Manatee <manatee@pacifier.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: <mtd@infradead.org>
Subject: Re: mtd on linux 
In-Reply-To: <26445.987519158@redhat.com>
Message-ID: <Pine.BSO.4.33.0104170918380.25263-100000@shell.pacifier.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


On Tue, 17 Apr 2001, David Woodhouse wrote:

> Which device?

It is a Disk On Chip and it fits into a PCI slot.

> Do you have a DiskOnChip on an evaluation board? The way I prevent it from
> interfering with normal booting is to remove the jumper which controls the
> memory window during booting, and replace it after the grub or lilo prompt
> has appeared. If you _never_ want to boot from it, you can just destroy the
> firmware on it. M-Systems provide an 'fff.exb' or similarly named firmware
> file for this purpose.

I see where jumpers would go but there are no jumpers on the card.


> If you get Linux to boot, with the DOC2000 and NFTL config options
> turned on (or if you load the modules), then you ought to be able to access
> the device as /dev/nftla (block 93,0) and /dev/nftla1 (block 93,1).

Ah, so if I can get the machine to boot -- with the card in place -- then
I can access the card.

Manatee



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
