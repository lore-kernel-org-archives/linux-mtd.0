Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7Azg-0002qu-61
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 10:24:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200403270907.07298.tglx@linutronix.de>
References: <406328A2.3060905@cray.com>
	 <200403252058.55476.tglx@linutronix.de>
	 <20040327073147.03AF7179A8@desire.actrix.co.nz>
	 <200403270907.07298.tglx@linutronix.de>
Content-Type: text/plain
Message-Id: <1080383077.17352.5.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 27 Mar 2004 10:24:37 +0000
Content-Transfer-Encoding: 7bit
cc: manningc2@actrix.gen.nz
cc: linux-mtd@lists.infradead.org
Subject: Re: nand oob layout assumptions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-03-27 at 09:07 +0100, Thomas Gleixner wrote:
> > For instance, the bad block handling is different in different NAND parts.

And in some cases in the _same_ NAND parts in different environments.
Consider the DiskOnChip, where on first format we look at the 'bad
block' markers in the OOB areas and build a separate bad block bitmap in
a dedicated sector. Then we erase the good blocks and use _every_ byte
in the OOB area. That's why I added the ->block_is_bad() callback from
the NAND code to the board-specific code, but I'm not sure that's
sufficient.

> > It is wrong, IMHO, to be handling bad-block logic in the file system.
> > Instead, the bad block handling should be done in mtd so that each
> > different chip can have its own methods and the file system can be kept
> > "clean".
> 
> I have already considered this. 
> But the fs must be aware of the bad block marker position in the OOB area, as 
> it can not use this byte for storing fs dependend data. The OOB usage is 
> given by the fs layer.

It might not be in the OOB area. The fs does need to be told which bytes
of the OOB area are reserved for hardware ECC and/or bad block markers,
but the hardware driver should still be responsible for bad block
handling.

> Not sure. The generic nand driver provides mechanisms to tell you where the 
> bad block marker is located and a basic protection against the erasing of bad 
> blocks. All other bad block handling tasks should be done in the fs layer.

Other than noticing them and avoiding them, there really isn't much
handling to be done.

-- 
dwmw2
