Received: from mx1.quantum.com ([146.174.252.111])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KbJtR-0003ga-Iw
	for linux-mtd@lists.infradead.org; Thu, 04 Sep 2008 18:49:21 +0000
Received: from ppoq3mim3.QUANTUM.COM (ppoq3mim3 [10.50.4.218])
	by mx1.quantum.com (Switch-3.3.2/Switch-3.3.1) with ESMTP id
	m84InIsc031316
	for <linux-mtd@lists.infradead.org>; Thu, 4 Sep 2008 12:49:19 -0600
Subject: Partitioning NAND flash
From: Brian Szmyd <brian.szmyd@quantum.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Sep 2008 12:49:22 -0600
Message-Id: <1220554162.4879.64.camel@lethargic>
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having trouble determining where the partitioning information is
coming from when I boot into linux 2.6.26 for my haleakala reference
board from amcc. When linux boots I receive the following output from
the MTD driver:

fc000000.nor_flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
fc000000.nor_flash: CFI does not contain boot bank location. Assuming
top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
RedBoot partition parsing not available
Creating 5 MTD partitions on "fc000000.nor_flash":
0x00000000-0x001e0000 : "kernel"
0x001e0000-0x00200000 : "dtb"
0x00200000-0x00f60000 : "root"
0x03f60000-0x03fa0000 : "env"
0x03fa0000-0x04000000 : "u-boot"
NDFC NAND Driver initialized. Chip-Rev: 0x00000111
NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB
3,3V 8-bit)
Scanning device for bad blocks
Number of partitions 3
Creating 3 MTD partitions on "NAND 64MiB 3,3V 8-bit":
0x00000000-0x00060000 : "u-boot"
0x00060000-0x00068000 : "env"
0x00068000-0x04000000 : "content"

My problem is that I want to repartition the NAND flash, but am not sure
where the current partitioning scheme is coming from. My bootargs to the
kernel does not contain an mtdparts section and i don't see any
reference to a "u-boot", "env", "content" partition in the mtd driver
code itself.

I have setup my NOR partitioning by modifying the DTS provided by the
linux source, but there is nothing in there that refers to the NAND
chip. I have tried providing an mtdparts argument to the kernel but this
appears to be a no-op even though the appropriate option in the kernel
is configured.

I'm kind of at a loss after monkeying with this for the last couple
days. Any help or direction to a good source of information would be
greatly appreciated!

=EF=BB=BFBrian Szmyd | brian.szmyd@quantum.com

-----------------------------------------------------------
The information contained in this transmission may be=20
confidential. Any disclosure, copying, or further=20
distribution of confidential information is not permitted=20
unless such privilege is explicitly granted in writing by=20
Quantum Corporation. Furthermore, Quantum Corporation is not=20
responsible for the proper and complete transmission of the=20
substance of this communication or for any delay in its=20
receipt.
------------------------------------------------------------
