Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pZQU-0003YI-00
	for mtd-list@infradead.org; Tue, 17 Apr 2001 18:38:06 +0100
Message-Id: <3ADC7EEF.6020405@onelabs.com>
Date: Tue, 17 Apr 2001 12:35:43 -0500
From: Bari Ari <bari@onelabs.com>
Reply-To: bari@onelabs.com
Mime-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Cc: Manatee <manatee@pacifier.com>, mtd@infradead.org
Subject: Re: mtd on linux
References: <Pine.BSO.4.33.0104170918380.25263-100000@shell.pacifier.com> <5071.987524580@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> manatee@pacifier.com said:
> 
>>  It is a Disk On Chip and it fits into a PCI slot. 
> 
> 
> OK. I'd heard of those but haven't actually met one yet.
> 
>>  I see where jumpers would go but there are no jumpers on the card.
> 
> 
> I was thinking of the ISA eval board.
> 
>>  Ah, so if I can get the machine to boot -- with the card in place --
>> then I can access the card. 
> 
> 
> Probably. It depends just how the PCI eval board is set up. Isn't there a 
> key sequence you can use during booting to prevent the DiskOnChip BIOS from 
> loading itself? Or use the DFORMAT program provided to load the null 
> firmware. 

Check the M-Sys DOC-DIP-EVB-PCI manual. It says the "DiskOnChip base 
address - 0xD000 (Fixed)"

What happens when you boot? Do you get a conflict error? or you just 
can't find your DOC? Did you configure your DOC for Linux?

Bari




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
