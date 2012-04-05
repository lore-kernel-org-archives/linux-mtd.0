Received: from cooperlighting-sw.cooperlighting.com ([216.130.131.68])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SFq7f-0001tO-5g
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2012 17:05:23 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: nanddump shows all bad blocks
Date: Thu, 5 Apr 2012 13:04:29 -0400
Message-ID: <5D308BD40154E4439D82454FE483A50206619995@EVS4.nam.ci.root>
From: "Bishop, Mark" <Mark.Bishop@cooperindustries.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When I do this:
root:/> nanddump  -l 0x20000 -s 0x60000   --bb=3Dpadbad -f testfile
/dev/mtd0

It shows that the ECC has failed, but I know there is good data in there
as that I can read the data in uboot.
0x60000-0x7ffff holds my uboot environment.

ECC failed: 429
ECC corrected: 0
Number of bad blocks: 4
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00060000 and ending at 0x00080000...

My 'testfile' is full of 0xFFs as the option specifies (padbad:  dump
flash data, substituting 0xFF for any bad blocks).

I know mtd0 is mapped to that partition:
...
Creating 4 MTD partitions on "MT29F2G08ABAEAWP":
0x000000000000-0x000000080000 : "bootloader(nand)"
0x000000080000-0x000000880000 : "linux kernel(nand)"
0x000000880000-0x000006c80000 : "file system(nand)"
0x000006c80000-0x000010000000 : "file system(ubifs)"
...

Any idea how I can make this work?
