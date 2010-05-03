Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O8vKw-0003Z8-TQ
	for linux-mtd@lists.infradead.org; Mon, 03 May 2010 13:05:28 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Some questions on bit-flips and JFFS2
Date: Mon, 3 May 2010 15:05:18 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201005031505.18604.muehlfelder@enertex.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I'm experiencing some problems with bit-flips on devices using NAND and JFFS2:
NAND device: Manufacturer ID: 0x2c, Chip ID: 0xdc (Micron NAND 512MiB 3,3V 
8-bit)
Creating 2 MTD partitions on "NAND 512MiB 3,3V 8-bit":
0x00000000-0x00a00000 : "Bootloader Area"
0x00a00000-0x20000000 : "User Area"

In rare cases 1 or 2 bits in the bootloader area (kernel) flip, so that the 
system won't boot anymore (kernel checksum error).
As the bootloader image is not mounted at all I wonder if this may be caused 
by these read disturbs I've heard of.

I've found some statements from different people about it here on the ML:

> We use JFFS2. As known JFFS2 detects and corrects single bit-flips
> (per 256 byte subpage) but it doesn't physically correct them
> on the NAND device itself.

and:

> AFAIK, jffs2 doesn't handle correctly bit flip on read: it won't try to
> copy the data on another block while the data can still be recovered
> by ecc.

For me this means that data still is read correctly because of ECC but it 
won't get moved to a new block if a bit-flip happens? And what happens if 
this occours on the kernel partition?

Furthermore:
> > How about detection of ECC errors in read only partitions?
>
> ECC should be done on both rw and read-only partitions. Sometimes NAND gets
> read disturbs which would impact on read-only partitions. Also, write
> disturbs from writes to one partition can still corrupt a read-only
> partition on the same chip.

So writing to my root partition may harm my kernel partition, too?

PS: I could not reproduce the bit-flip problem. It just happens in rare cases. 
Furthermore some of my devices are using Samsung NAND instead of the Micron 
NAND and did not show any problems yet. So perhaps my problem are just some 
bad NAND chip? But still I have to find a solution for the problem.
