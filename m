Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ScJR-0004lx-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 10:03:57 +0000
Message-ID: <151F3D2AE9F0D3119E480004ACB8EA3701DEC945@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Tue, 13 Feb 2001 11:04:16 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> Is there _any_ difference between these chips which is 
> detectable without 
> actually trying to erase the damn things and observing how 
> much data gets 
> removed?
> 

I may have found something. Take a look at the following table. It includes some AMD, Toshiba and ST flash chips.

Name            dev_id  last_byte_of_dev_id
---------------------------------
AM29F800BT      0x22D6  1101 0110
AM29LV800BT     0x22DA  1101 1010
AM29LV160DT     0x22C4  1100 0100
MBM29LV160TE    0x22C4  1100 0100
M29W800T        0x00D7  1101 0111
M29W160DT       0x22C4  1100 0100
TC58FVT160      0x00C2  1100 0010
                        ^
                        All 1s

M29W160DB       0x2249  0100 1001
MBM29LV160BE    0x2249  0100 1001
AM29LV160DB     0x2249  0100 1001
AM29LV800BB     0x225B  0101 1011
AM29F800BB      0x2258  0101 1000
TC58FVB160      0x0043  0100 0011
                        ^
                        All 0s
				
It looks like the eigth bit in the last byte of the device ID. It is 1 for top boot chips and 0 for bottom boot chips! Does anyone have the device IDs for any other chips? In that case, please confirm this theory.

/Jonas


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
