Received: from web25010.mail.ukl.yahoo.com ([217.12.10.46])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FyHXK-0005n2-US
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 20:16:16 -0400
Message-ID: <20060706000925.45150.qmail@web25010.mail.ukl.yahoo.com>
Date: Thu, 6 Jul 2006 01:09:25 +0100 (BST)
From: Steven Newbury <s_j_newbury@yahoo.co.uk>
Subject: Fwd: sharpsl nand driver still broken in current git
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I somehow managed to misread the git changelog and get the wrong mailing list
first try so exchange ARM merge for MTD merge below.

rmk wasn't impressed!

--- Steven Newbury <s_j_newbury@yahoo.co.uk> wrote:

> Date: Wed, 5 Jul 2006 22:19:02 +0100 (BST)
> From: Steven Newbury <s_j_newbury@yahoo.co.uk>
> To: linux-arm-kernel@lists.arm.linux.org.uk
> Subject: sharpsl nand driver still broken in current git
> 
> Since the NAND subsystem has been updated from the recent ARM merge the
> sharpsl
> driver no longer detects the NAND device from nand_scan.
> ...
> Sharp SL series flash device: 800000 at 0
> Using static partision definition
> Creating 1 MTD partitions on "sharpsl-flash":
> 0x00140000-0x007f0000 : "Boot PROM Filesystem"
> No NAND device found!!!
> ...
> 
> It could be a difference in my tree, but I don't think so; especially given
> the
> recent changes.
I should add that the machine is a Sharp Zaurus SL-C3100 (Borzoi) and the
normal boot on ealier kernels appears as below:

Sharp SL series flash device: 800000 at 0
Using static partision definition
Creating 1 MTD partitions on "sharpsl-flash":
0x00140000-0x007f0000 : "Boot PROM Filesystem"
NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB 3,3V 8-b
Scanning device for bad blocks
Creating 3 MTD partitions on "sharpsl-nand":
0x00000000-0x00700000 : "System Area"
0x00700000-0x08000000 : "Root Filesystem"
0x08000000-0x08000000 : "Home Filesystem"
mtd: partition "Home Filesystem" is out of reach -- disabled


Steve


		
___________________________________________________________ 
Inbox full of spam? Get leading spam protection and 1GB storage with All New Yahoo! Mail. http://uk.docs.yahoo.com/nowyoucan.html
