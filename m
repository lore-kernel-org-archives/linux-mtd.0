Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168mmA-0004zp-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 18:16:10 +0000
Received: from superfortress.nrl.navy.mil ([132.250.130.208] helo=superfortress)
	by osdsun1.nrl.navy.mil with smtp (Exim 3.32 #1 (Debian))
	id 168mpy-000198-00
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 13:20:06 -0500
Message-ID: <004301c17771$1a4c1c90$d082fa84@superfortress>
From: "Dan Brown" <brown@osdsun1.nrl.navy.mil>
To: <linux-mtd@lists.infradead.org>
Subject: jffs2 on DOC
Date: Tue, 27 Nov 2001 13:26:59 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I'm trying to get jffs2 running on DOC.  My tentative plan is to put two
partitions on the DOC; a small NFTL partition for booting and a large
partition containing a jffs2 filesystem.  These "partitions" will initially
be produced by a slightly hacked version of the doc2000 driver which will
accept a new kernel configuration variable which tells it where to draw the
boundary between the two partitions.  (The NFTL "partition" will of course
have its own partition table, etc, which complicates the terminology a bit,
but since it uses a different device namespace it shouldn't be too bad.)  In
the long run a true on-flash partition table would be nice, but this scheme
should be quick and easy to implement, using add_mtd_partitions.

But first, I'm just trying to get jffs2 running on the entire, raw DOC
device, without an NFTL boot partition.  The problem I'm having initially is
that jffs2 is getting short reads from the doc2000 driver.  It seems to me I
could either:

 - modify the jffs2 code to handle short reads, by issuing another read for
the remainder of the needed data, or
 - modify the doc2k code to handle reads that cross 512 byte boundaries, by
issuing multiple low-level reads to the DOC.

The second option looks easier, but I'd appreciate advice.

Also, I'm a little confused about the read() vs read_ecc() and write() vs
write_ecc() routines.  In some cases (NAND driver) it looks like a read() or
read_ecc() will always pull in an entire ecc block, and then return some
subportion of that to the caller if the caller didn't want an entire block.
This gives you the advantages of error correction even if you don't
explicitly call read_ecc().  In contrast, the DOC driver will never do ecc
unless called by read_ecc(), and even then will not do it properly unless
the caller gives block-aligned requests.  With writes, the NAND driver will
always attempt to compute (and write) the ecc no matter which interface is
used, and it looks like there is some support for partial-block writes as
well, by reading the remainder of the block from the device before computing
the ecc.  If I'm reading the code right, it won't work correctly if the
start of the write is not block-aligned.  The DOC driver will do ECC on
writes no matter which interface you use (write() or write_ecc()), but again
it requires a full-block write for proper operation.  This is all very
confusing.

So my question is, what is the intended semantics of read(), read_ecc(),
write(), and write_ecc()?  I can't seem to find any clients of read_ecc() or
write_ecc(), so I can't figure out why a client would need access to the ecc
buffer.  My personal preference, in regard to getting jffs2 working over
DOC, would be for the normal read() and write() functions to perform ecc
operations, including proper partial-block support.  Can anyone shed any
light on this, or give me any pointers?

Thanks,
    Dan Brown
