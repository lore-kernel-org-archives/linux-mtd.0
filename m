Received: from florence.buici.com ([206.124.142.26])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSN0u-0007Dp-Gx
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 17:01:57 -0500
Date: Thu, 11 Nov 2004 14:01:46 -0800
From: Marc Singer <elf@buici.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20041111220146.GA1898@buici.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: cmdlineparts and chip initialization order
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With a command line like this:

  console=ttyAM0 root=/dev/hda1 mtdparts=norflash:2m(boot),-(root);nandflash:32k(apex)ro,-(root)

I am able to initialization partitions for the NOR flash, but not the
NAND flash.  It look like the problem is that the NOR flash driver is
initializing before the mtdparts command line parsed, but the NAND
flash isn't.

All code is linked into the kernel--no modules.

Moving the cmdlinepart.o file to the end of the list appears to
prevent the command line from being parsed.

Is this a recognized problem with a known solution.

BTW, it looks like none of the other NAND drivers expect a command
line partition setup.  Has anyone else tried?

Cheers.
