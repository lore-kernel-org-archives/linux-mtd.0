Received: from hex.linuxgrrls.org
	([212.18.228.73] helo=mail.linuxgrrls.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ab72-00011r-2m
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2003 14:05:28 +0100
Date: Thu, 10 Jul 2003 14:05:40 +0100 (BST)
From: jasmine@regolith.co.uk
To: Charles Manning <manningc2@actrix.gen.nz>
In-Reply-To: <20030708231846.7C10B4431@blood.actrix.co.nz>
Message-ID: <Pine.LNX.4.53.0307101358200.32710@hex.linuxgrrls.org>
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
 <20030708231846.7C10B4431@blood.actrix.co.nz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: nand flash driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Wed, 9 Jul 2003, Charles Manning wrote:

> I think most people connect CLE and ALE to GPIO pins, but some application 
> notes describe driving these via the address bus. you should then be able to 
> drive the lines the way you want by accessing the corresponding addresses.

Most people running NAND flash on general-purpose designs use GPIO lines 
to drive their ALE, CLE and to read the RNB line.  Some of these designs 
also use a GPIO to generate read and write strobes.  This is a very simple 
design to implement.

Some custom SoCs and logic-array-based implementations put all this logic 
inside the chip, decoding ALE and CLE cycles to different addresses, so 
that you write the address latch bytes to one address and the command 
latch bytes to a different one.  This is slightly neater, though can have 
complications with interrupt latency (requirement to stretch read and 
write cycles to some parts of the address map, etc.)

Some devices take all this stuff and put it inside a piece of logic that 
manages a pipeline of bytes in and out of the NAND.  Some SoCs do this, 
and of course DiskOnChip does something like this, resolving NAND access 
into cycles that look like conventional NOR or ROM cycles.  This is, in 
some ways, the easiest to implement, though it seems to have caused MTD 
the most problems, though that is mostly because of M-Systems' intentional 
obfuscation tactics.

-Jas.
