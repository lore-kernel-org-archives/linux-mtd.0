Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13SIOx-0000hY-00
	for mtd-list@infradead.org; Fri, 25 Aug 2000 13:16:03 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13SIOw-0000hS-00
	for mtd@infradead.org; Fri, 25 Aug 2000 13:16:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000801c00e8b$9a649560$0800a8c0@win95.inteloop.se> 
References: <000801c00e8b$9a649560$0800a8c0@win95.inteloop.se> 
To: mdeans@algonet.se
Cc: mtd@infradead.org, mark.langsdorf@amd.com
Subject: Re: Anyone using mtd on NAND flash? (Was: The archives [looking for info on AM29LV640 flash]) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 Aug 2000 13:15:59 +0100
Message-ID: <15725.967205759@cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjorn@brannstrom.se said:
>  I've just been across the hall to strangle our hardware engineer (who
> happens to also be my boss). He /intended/ to use the AM29LV640 part
> but had problems finding a reliable source for them so we're using
> Samsungs KM29U128 part instead.

Don't strangle him. Have him hung, drawn and quartered.

The KM29U128 is an _entirely_ different beast. NAND flash is quite 
different to NOR flash.

With NOR flash, you can keep clearing bits individually until they're all
zero. With NAND flash you can only do 10 write cycles in each 512-byte page
before it becomes unreliable and you have to erase it again. JFFS currently
exceeds that number.

Also, NAND flash is permitted to ship with bad blocks and you're expected to
work round them. JFFS doesn't, and JFFS-on-NAND should probably use an error
correcting checksum rather than the simple checksum it currently uses.

He's just replaced something you could use with the current code with 
something we're not going to support for some time, unless you care to do 
the necessary work yourself.

You can't use NFTL, as we do on the DiskOnChip, because it's patented, and
even if you were only going to distribute within the Free World, the NFTL
code requires the built-in ECC support provided by the DiskOnChip ASIC.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
