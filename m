Received: from lvps87-230-0-242.dedicated.hosteurope.de ([87.230.0.242])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OlHuV-0006Wg-Ae
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2010 08:52:44 +0000
From: Michael Guntsche <mike@it-loops.com>
To: Brian Norris <norris@broadcom.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] Nand support broken with v2.6.36-rc1
Message-ID: <20100817085227.GA19623@gibson.comsick.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Tue, 17 Aug 2010 08:52:44 -0000

Hello,

First of all, please CC me on any replies since I am not subscribed to one of the MLs.

I just tried compiling 2.6.36-rc1 for one of my embedded boards here and
noticed that nand support was apparently broken with -rc1. 
In the syslog I see:

[  231.039693] rbppc_nand_probe: MikroTik RouterBOARD 600 series NAND
driver, version 0.0.2
[  231.048103] NAND device: Manufacturer ID: 0xad, Chip ID: 0x76 (Hynix
NAND 64MiB 3,3V 8-bit)

This is the board I am using and the nand driver worked from 2.6.27 up
to 2.6.35 with no modifications

[  231.056590] Scanning device for bad blocks
[  231.063908] Bad eraseblock 56 at 0x0000000e0000
[  231.068589] Bad eraseblock 57 at 0x0000000e4000
[  231.073194] Bad eraseblock 58 at 0x0000000e8000
[  231.077870] Bad eraseblock 59 at 0x0000000ec000
[  231.082482] Bad eraseblock 60 at 0x0000000f0000
[  231.087146] Bad eraseblock 61 at 0x0000000f4000
......
This continues for a long time

I know that this device has two badblocks. But with the new code almost
all blocks are marked as bad. 
I tracked this down to commit:

c7b28e25cb9beb943aead770ff14551b55fa8c79
 mtd: nand: refactor BB marker detection

Reverting the code under drivers/mtd/nand to an earlier commit makes it
work again.
The only thing that might be special with the nand driver that is being
used is that a different oob layout is being used.

static struct nand_ecclayout rbppc_nand_oob_16 = {
  .eccbytes = 6,
  .eccpos = { 8, 9, 10, 13, 14, 15 },
  .oobavail = 9,
  .oobfree = { { 0, 4 }, { 6, 2 }, { 11, 2 }, { 4, 1 } }
};

I am not sure if a driver change is needed, but seeing that the commit did not touch any specific nand driver code I do not think that this is the problem here.

Maybe someone more knowledgeable than me can take a look at it.

Kind regards,
Michael Guntsche
