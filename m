Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SHlj-0007Uu-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 12:07:47 +0000
Message-ID: <151F3D2AE9F0D3119E480004ACB8EA3701DEC940@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: Problems with cfi_cmdset_0002.c
Date: Mon, 12 Feb 2001 13:08:55 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I'm working on a MTD driver for AMD compatible non-CFI flash chips. Since the command set for those chips is almost the same as the one in cfi_cmdset_0002.c I have been testing that code a lot lately. I have found two "bugs". Firstly the if-statement on line 63 (current in CVS) does not work for my flash chip (AM29LV160DT):

        /* Wheee. Bring me the head of someone at AMD. */
        if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
                printk("Swapping erase regions for broken CFI table\n");

The expression is false, but the EraseRegionInfo should be swapped. I have no solution to that problem. Can you think of one?

Secondly, the if-statement on line 660:

	if (adr % (1<< cfi->chipshift) == ((regions[i].erasesize * regions[i].numblocks) %( 1<< cfi->chipshift)))

should be:

	if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))

Best regards
/Jonas Holmberg, Axis Communications


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
