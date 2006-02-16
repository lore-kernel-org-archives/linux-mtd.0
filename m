Received: from cloudburst.actrix.co.nz ([203.96.16.181])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F9Xxl-0005Xp-KM
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2006 20:29:45 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: yaffs@stoneboat.aleph1.co.uk, linux-mtd@lists.infradead.org
Date: Thu, 16 Feb 2006 14:32:17 +1300
References: <43EB96DC.3030900@eptar.com>
	<35fb2e590602100558s2d868fa3o1752fbf3217439e4@mail.gmail.com>
	<d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>
In-Reply-To: <d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200602161432.17447.manningc2@actrix.gen.nz>
Cc: William Watson <wjw1961@gmail.com>
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To mtd-ers... Please forgive the cross-posting, but I think the content is=
=20
sufficiently important  to those who use NAND but are not plugged in to the=
=20
YAFFS list.


On Thursday 16 February 2006 08:53, William Watson wrote:

> I will also note that a NAND vendor who paid us a visit at about that same
> time said that we should expect WORSE soft error behaviour with succeeding
> generations of NAND flash chips.  The geometries would get smaller and
> smaller, the chip dies would get larger and larger, and the amount of time
> for production testing of each chip would not increase, or at least, not
> increase as fast as the total storage of a chip.  Thus, the testing per
> page would only go down in subsequent generations of chips.  These two
> statements seemed to say that we would see both (1) increased rates of ECC
> errors, and (2) an increase in the number of marginal blocks not marked b=
ad
> by the chip vendor.

A vendor on the list contacted me off list, so I asked their permission bef=
ore=20
posting what they said on-list.  I got that permission so long as their nam=
e=20
was removed.

As William states,  It seems that the reliability has peaked. NAND is expec=
ted=20
to get worse, and a move to better correction schemes is encouraged.

=46or the most part, this is not really a YAFFS2 issue since the ECC mechan=
ism=20
(on the data) is not part of YAFFS2 per se. THis is now part of the mtd, or=
=20
flash driver for non-Linux (eg. William's case). For YAFFS2, the impact is=
=20
probably limited to:
1) ECC on tags....  Tags are so small that a single-bit correction is proba=
bly=20
enough. Multibit is probably a good thing to investigate.
2) More OOB being used for multi-bit schemes will probably mean less space=
=20
available for tags.
3) An emerging need for more forgiving block retirement.
4) Thinking about "spreading" to reduce write disturb.

Thus far it has been quite hard to engage NAND vendors but it seems some ar=
e=20
now willing to talk a bit more. I will try to discuss the issues to better=
=20
understand them.

=2D- Charles


Without further blaah, the vendor's words, slightly edited:

It's difficult to decide what the best block retirement policy should be.
=46or a program or erase failure, block retirement should be mandatory
because internally, the chip has already tried to program or erase multiple
times already. =C2=A0For ECC (soft errors), it's more of an open question.
Should the errors be scrubbed and the data written back (to the same
location or a different location) or should the data be moved and the block
permanently retired?

One thing I can say with certainty, overall NAND flash reliability is
degrading. =C2=A0At the time the application note was written, 0.16 micron =
based
NAND flash had a block write/erase endurance of 250k-1M cycles with
reasonable data retention. =C2=A0However, as lithography shrinks have conti=
nued
(0.16um -> 0.13um -> 90nm -> 70nm), the physical cell area has been cut by
roughly half at each die shrink. =C2=A0The physics of the materials don't
change, therefore, less charge is being stored in the memory cell every
generation. =C2=A090nm SLC (single level cell) NAND flash was nominally rat=
ed at
100K write/erase cycles per block, and it is very likely that 70nm SLC NAND
flash will be significantly less. =C2=A0Better ECC is going to be necessary.
The single bit correcting Hamming code that is currently used for SLC NAND
was originally designed for SmartMedia over 10 years ago. =C2=A0Today, most
memory cards using NAND flash implement Reed Solomon ECC capable of
correcting 4 or more symbol errors (typically 8 or more bits per symbol)
per 512 bytes. =C2=A0This enables the ability to correct 4 random errors per
sector. However, for speed reasons, the ECC is usually done in hardware.
If a multi-bit ECC was implemented, then it would be possible to implement
a policy like: if there is the maximum number of correctable errors or an
uncorrectable error in a page, then the block can be permanently retired,
otherwise, scrub the data and move to a new location. =C2=A0But this kind of
policy would be difficult to implement with single bit correcting Hamming
code. =C2=A0 Disturbance errors (read disturb, program disturb) will become=
 more
probable in the future due to increased capacitive coupling between bit
lines and word lines due to decreased separation at each lithography
shrink.

One fact that is somewhat underappreciated is that one cannot have both
high block write/erase endurance and long data retention simultaneously.
One can have better data retention if the block sees fewer write/erase
cycles. =C2=A0The more the data is spread out across all the blocks, the be=
tter
the overall data retention since every block is written and erased as few
times a necessary. =C2=A0Journaling appears to be one of the best ways to s=
pread
out the writes but some kind of static data wear leveling could improve it
further (however, there might be IP issues).

Keep up the good work,

Sincerely,
[name scrubbed]
