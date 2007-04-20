Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HetyS-0005Zk-19
	for linux-mtd@lists.infradead.org; Fri, 20 Apr 2007 10:20:36 -0400
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l3KDsE2M002593
	for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2007 15:54:14 +0200
Date: Fri, 20 Apr 2007 15:54:34 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Bad bits and blocks in JFFS2
Message-ID: <Pine.LNX.4.64.0704201335140.9064@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

We are trying to determine how JFFS2 behaves in the case of a file system=
=20
in NAND flash exhibiting bit flips and/or bad blocks.

To start with, we ran a series of tests to try and determine reasonable=20
failure modes for flash chips. The data sheets are notoriously vague, just=
=20
specifying the maximum number of bad blocks over the lifetime of the chip,=
=20
and that ECC should be used to handle bit errors. Some application notes=20
give further hints.

So what we did was erase/write torture a couple of eraseblocks in an=20
ST NAND256W3 flash chip, program them with a test pattern, and then=20
repeatedly read back the data to see if and when bit errors occurred.

The following table is the result of the test. 'First ecc correction'=20
means that we did the indicated number of reads before the mtd ecc=20
corrected counter started to increase. 'Ecc correction every read' means=20
that from this read cycle, each read attempt was met with a corresponding=
=20
increase in the ecc correction counter. And, similarly for the ecc failure=
=20
counter.

(The test focused on number of read cycles, but it would seem that another=
=20
factor affecting bit decay is the time between writing and reading. We did=
=20
some tests with this too, but it seems that the most significant factor is=
=20
the number of read cycles.)

---
(Table shows number of read cycles until the condition in the left hand
column becomes true).

Erase/write cycles=09=09~20=09 10 000=09 100 000 1.7e+6=09 3.7e+6
------------------------------------------------------------------------
First ecc correction=09=09>4.5e+10 140e+6=09 15e+6=09 195000=09 550
Ecc correction every read=09>4.5e+10 163e+6=09 19e+6=09 231000=09 n/a
First ecc failure=09=09>4.5e+10 >991e+6 43e+6=09 1.5e+6=09 9600
Ecc failure every read=09=09>4.5e+10 >991e+6 76e+6=09 2.2e+6=09 n/a
Notes=09=09=09=09*1=09 *2=09=09=09 *3,*4
*1: Test ran over a three-month period, and the ecc stats remained at 0
     all the time.
*2: The test didn't run long enough to experience ecc failures.
*3: Values reported are after complete rewrite of device, not after
     write torture terminated with I/O errors, as this might have left
     the chip in an indeterminate state.
*4: Torture was run until it terminated with an I/O error.
(Also note that the maximum number of erase/write cycles are specified as
100 000 for this chip, so the last two columns are way over spec in terms
of erase/write cycle counts).
---

Of course, this is just a test on one single individual device of one type=
=20
from one manufacturer. Still I believe it gives some insight into
the chip behavior. For larger memories, I'd expect the same behavior but=20
perhaps scaled up a magnitude due to the smaller geometries involved.

The conclusions we drew from this are basically that:
a) Reading the device slowly causes the bits to decay, i.e. not the
    bit cells themselves, but the data (charge) therein.
b) The more times a cell has been erased/written, the faster this decay
    occurs. The cell wears out.
c) Cells which have been written few times exhibit no practical bit decay.
d) At least when torturing the blocks in this way, there's no point
    when a block becomes 'bad' in the sense that it becomes terminally
    unusable, however, the number of permitted read cycles before the
    data decays to unreadability becomes impractically small. (i.e. this
    limit is bound by the application using the flash.)

(An interesting thing not shown in the table above was that when doing the=
=20
3.7e+6 cycle torture test, the torture module terminated with an I/O=20
error. However, upon restarting the torture, it ran for a further 6000=20
cycles without terminating (again with an I/O error), and the eraseblock=20
that caused the error was not the same as the first time.)

The results above would seem to indicate that for program storage or other=
=20
usage where the data is very seldom read, at least this NAND flash type=20
would seem to exhibit a very low bit failure rate. ECC should cope with=20
any spurious bit flips without problems.

However, let's assume that part of the flash is configured as a JFFS2 file=
=20
system. Furthermore, assume that during the lifetime of a product, a lot=20
of writes are performed, so that the maximum specified erase/write cycle=20
count is reached and even exceeded. How does JFFS2 cope with the resulting=
=20
errors?

I've looked in the code to try and see how JFFS2 handles this. Since my=20
knowledge of JFFS2 internals is very dim, perhaps someone could shed some=
=20
light on this...

In wbuf.c, from what I can tell, when mtd returns EBADMSG (=3D uncorrectabl=
e=20
ecc occurred when reading) or EUCLEAN (=3D corrected ecc occurred), the=20
resulting data is treated as if it was ok, and the failure assumed to be=20
detected using the JFFS2 node CRC. There doesn't seem to be any attempt at=
=20
rewriting the block or bumping a node read error counter so that the block=
=20
could later be rewritten or marked bad. To me, it would therefore seem=20
that ultimately, as bits decay and errors become uncorrectable, that one=20
would simply get a read error on the file, instead of the data being moved=
=20
to a good block while there is time. Or am I missing something completely=
=20
here (very likely, but if so, what)?

Regarding write or erase failures, in jffs2_write_nand_badblock, a block=20
is marked bad (this seems to be the only place it is done) if it fails to=
=20
erase after two attempts (the function is called from=20
erase.c:jffs2_erase_failed only). While this seems all good and well, the=
=20
torture tests show that when the chip returns an erase or write failure,=20
the number of erase/write cycles has far exceeded the specifications, and=
=20
reads at this point cause significant bit decay. So while it's definitely=
=20
a good idea to mark the block bad at this point, it seems to me that this=
=20
should have done earlier, perhaps in conjunction with a significant number=
=20
of read errors above.

Are these conclusions correct? Or what am I missing here?

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
