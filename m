Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Vva0-00081L-00
	for <linux-mtd@lists.infradead.org>; Sun, 12 Aug 2001 14:47:00 +0100
Message-Id: <5.1.0.14.0.20010812085950.00ace380@mail.spewey.com>
Date: Sun, 12 Aug 2001 09:06:26 -0500
To: Luke <luke_epsilon@yahoo.com>,linux-mtd@lists.infradead.org
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: Am29LV065D woes???
In-Reply-To: <20010811043417.4943.qmail@web13603.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

>When setting
>the physical address mapping in the mtd section of the
>kernel - what should the values be for this chip?  I
>assume from the above info that the bus width is 8 bit
>and the size is 0x800000 - but I am unsure what to put
>down for an address to start.

That's entirely dependent on your hardware- as to which address range it 
decodes the chip select (CS) line going to the flash chip.

Look in the schematic of your hardware- see where the chip select line on 
the flash chip is connected to. If it's connected to a PAL or FPGA on your 
board, then get hold of the spec of the chip select decoding logic and see 
where in the memory space that cs is decoded.

If it is going to your (embedded PC on a chip) processor (if that's the 
case- like in an AMD SC520 or Intel 386EX) then either look in the bios 
settings where the PAR (programmable address range) chip select registers 
are being set or you may have to program them yourself- say in the 
physmap.c file before you do the probe for the flash chip.

The sc520cdp.c is a good example for this case.

Best of Luck

Vipin
