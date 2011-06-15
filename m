Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QWw4q-0005jF-5B
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2011 19:48:40 +0000
Received: by vws8 with SMTP id 8so776024vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Jun 2011 12:48:32 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 15 Jun 2011 15:48:32 -0400
Message-ID: <BANLkTi=L8CqtTt=+sJ-CHVyXyTsxTR_o8Q@mail.gmail.com>
Subject: NAND BBT corruption on MPC83xx
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I'm not sure whether this list or the U-Boot list is more
appropriate, but figured I'd start here and see if anyone can help.

We've gotten some devices back from the field which all suffer from
this same problem on bootup when attaching UBI (these messages are
from U-Boot):


...
Bad block table found at page 524224, version 0x01
Bad block table found at page 524160, version 0x01
nand_bbt: ECC error while reading bad block table
...(long stream of bogus bad blocks)...
UBI: attaching mtd1 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI error: vtbl_check: volume table check failed: record 0, error 9
UBI error: ubi_init: cannot attach mtd1
UBI error: ubi_init: UBI error: cannot initialize UBI, error -22
UBI init error -22

A full console dump is here:

http://mcreech.com/work/bbt-ecc-error.txt

Question #1: Is the UBI error here attributable to the blocks which
are wrongly marked as bad?  I would assume that it's a red herring,
and I should focus on figuring out how the BBT got corrupted, but
figured I'd check first.

Question #2: Are there any known issues that could cause the BBT to
become corrupt like this?

I noticed that the reported bad blocks were all aligned at multiples
of 0x80000 (with one exception).  Dumping the last 2 blocks shows:
  - one BBT with lots of bytes that have their lower 1 or 2 bits
un-set (e.g. 0xfe instead of 0xff): this explains all the
each-4th-block alignment.
  - the other BBT shows only one factory-marked bad block at
0x062e0000, which is presumably correct.  This is preserved in the
bogus BBT, and is the only non-0x80000-aligned bad block in the table.
  - Only the first 1024 bytes of the BBT contain bogus info - the
latter half of the BBT is all correct

It seems like the original BBT somehow had 0-2 bits corrupted at the
low end of each of its bytes, either while in memory or when the BBT
was written to NAND.  Any ideas on what I can do to isolate the
problem?  Thanks in advance!

More info on this board:
- MPC 8313 SoC
- 1GB Samsung NAND flash (K9K8G08U0B)
- Linux 2.6.31
- U-Boot 2009.06

-- 
Matthew L. Creech
