Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KnWgQ-0004vl-JA
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 10:54:23 +0000
Date: Wed, 8 Oct 2008 12:54:15 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Subject: Re: preventing multi-bit errors on NAND
In-Reply-To: <48EC74FC.7070602@aimvalley.nl>
Message-ID: <Pine.LNX.4.64.0810081139120.18345@lnxricardw.se.axis.com>
References: <48EC74FC.7070602@aimvalley.nl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 8 Oct 2008, Norbert van Bolhuis wrote:

>
> Some of our NAND chips (128MB, 128k blocks, 2k pages) have multi but erro=
rs
> ...
> I studied some JFFS2/NAND/MTD source code and wonder whether we could
> have prevented this. I also looked at the latest JFFS2/NAND/MTD code
> (kernel 2.6.26) and there aren't any major ECC/bad-block changes/improvem=
ents.

I think UBI provides at least some of the functionality you are looking=20
for (see the MTD homepage).

Otherwise, NAND flash reliability seems to vary considerably between=20
manufacturers in this respect, regardless of the similarities when it=20
comes to specifications.

> Why not use 6 bytes ECC code (per 256 bytes) to correct at max 2 bits ?
> I know, this is not standard and would cause incompatibilities, still
> I'd like to know whether it could be done or already has been done. There=
's
> enough room in the OOB I believe.

That would help anyway.

> Why not mark a block bad when detecting a single-bit error ?
> I assume a multi-bit error was a singe-bit error before.
> A single-bit error is corrected and that's it. Nobody knows about it,
> let alone JFFS2 acts upon it.

That would eventually fill the whole flash with bad blocks, and for no=20
really good reason (see below). The correct solution is to 'scrub' the=20
flash, i.e. rewrite the data, potentially at another location (to avoid=20
loosing the data if a power outage occurs during the scrubbing procedure).=
=20
I believe UBI does this.

> Would #defining CONFIG_MTD_NAND_VERIFY_WRITE have helped/prevented this ?
> Currently CONFIG_MTD_NAND_VERIFY_WRITE isn't #defined. It would probably
> better to actually #define it. It looks like a failed verification doesn'=
t
> lead to a block marked bad, why not ?

The problem with NAND flash is that not only do the bit cells themselves=20
wear out as with NOR flash, leading to lower data retention times, and=20
ultimately causing write and erase operations to fail, but also that the=20
due to the design and cell density of the memory array, the data in the=20
bit cells tends to decay over time. Reading the bit cell accellerates the=
=20
process (and there are other influences, such as reading bit cells in the=
=20
same area of the chip etc). There is nothing wrong or worn out about the=20
flash, it is just a natural consequence of the technology used.

Consequently, reading back the data immediately after writing will not=20
find any errors, as the bit errors creep up with time, as the data in the=
=20
bit cells decays. The only real way to deal with this is to rewrite data=20
from time to time, or increase the number of bits that the ECC algorithm=20
can handle, as you mention.

That said, some manufacturers seem to be worse than others. In a random=20
sample test we did with the memory density you mention, after about half a=
=20
million reads from a 512 kbyte partition on a Numonyx (ST) or Hynix flash=
=20
there were consistently multiple bit errors, whereas after 4.5 million=20
reads from a similarly configured Samsung flash yields no bit errors at=20
all. Admittedly, this was a forced test, with the test script repeatedly=20
reading the area over and over again over the course of a couple of days,=
=20
but it still says something about the relative reliability of the parts at=
=20
least.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
