Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BjLVR-0003ok-QD
	for linux-mtd@lists.infradead.org; Sat, 10 Jul 2004 13:19:22 -0400
Received: from [10.1.1.113] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	10 Jul 2004 13:19:19 -0400
Date: Sat, 10 Jul 2004 13:15:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0407101310380.16786@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: sflash: CFI does not contain boot bank location. Assuming top.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   i just wrote the mtd/maps file for the board i'm playing with, and i 
stole shamelessly from examples of other files in that 
drivers/mtd/maps directory.

   the build is successful, but at boot time, i get (excerpt):

init_synergy_mtd: processing flash bank 0: sflash.
init_synergy_mtd: Remapped flash bank sflash to 0xc3000000.
sflash: Found 1 x16 devices at 0x0 in 16-bit mode
  Amd/Fujitsu Extended Query Table at 0x0040
sflash: CFI does not contain boot bank location. Assuming top. (?????)
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 2 MTD partitions on "sflash":
0x00000000-0x00010000 : "secsi"
0x00400000-0x00800000 : "rootfs"

   the 2 partitions listed are correct based on my defined partitions, 
but i don't ever recall seeing the following diagnostic working with 
earlier boards:

sflash: CFI does not contain boot bank location. Assuming top.

   i'm assuming i've just messed up a pointer, or dereferenced 
something incorrectly.  can anyone explain what this means?

rday
