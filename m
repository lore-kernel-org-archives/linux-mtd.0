Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 144OgX-0000GF-00
	for mtd-list@infradead.org; Fri, 08 Dec 2000 14:39:41 +0000
Received: from [194.200.159.162] (helo=mailserver.arcom.co.uk)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 144OgW-0000G8-00
	for mtd@infradead.org; Fri, 08 Dec 2000 14:39:40 +0000
Message-ID: <3A30F3FE.5C9781CD@arcom.co.uk>
Date: Fri, 08 Dec 2000 14:45:18 +0000
From: David Vrabel <dvrabel@arcom.co.uk>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: cfi_cmdset_0001.c: do_write_buffer: wrong length
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

In cfi_cmdset_0001.c do_write_buffer writes an incorrect length to the
chip

    cfi_write(map, CMD((len/(cfi->device_type*CFIDEV_INTERLEAVE))-1),
cmd_adr);

which with 1 x16 chip in x8 mode eg on the SBC-MediaGX (buswidth == 1;
interleave == 1; 
devicetype == 2) works out as

    cfi_write(map, CMD(len/2-1), cmd_adr); <-- Fails

When it should be

    cfi_write(map, CMD(len-1), cmd_adr); <-- Works

Should it it be?
    cfi_write(map, CMD(len/map->buswidth-1), cmd_adr);

David Vrabel



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
