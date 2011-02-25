Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PsyvM-00051N-ML
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 14:45:41 +0000
Date: Fri, 25 Feb 2011 15:44:10 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
Message-ID: <20110225144410.GC21841@parrot.com>
References: <Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
	<Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
	<1298629762.2798.38.camel@localhost>
	<20110225113609.GB21841@parrot.com>
	<1298635930.2798.96.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1298635930.2798.96.camel@localhost>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Peverley <pev@sketchymonkey.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 25, 2011 at 12:12:10PM +0000, Artem Bityutskiy wrote:
> On Fri, 2011-02-25 at 12:36 +0100, Ivan Djelic wrote:
(...)
> >=20
> > The fact that a bitflip detected during torture is enough to decide tha=
t a
> > block is bad causes problems on some 4-bit ecc devices we are using. If=
 we
> > stick to this policy, we end up with a _lot_ of blocks being marked as =
bad
> > (i.e. way too many).
>=20
> I see. May be in your case 1 bit errors are completely harmless, but 2
> and 3 are not?

When a NAND device requires 4-bit ecc or more, you do see a lot of 1-bit er=
rors
(compared to previous NAND devices). They are not "completely harmless" bec=
ause
you are still supposed to relocate data in some other block and erase the b=
lock
(those bitflips are reversible errors), in order to avoid error accumulation
and stay below the specified ecc requirement. But they probably should not =
be
considered an indication that the block has gone bad.

> > Our NAND manufacturer tells us that, as long as a block erase operation
> > completes without a failure reported by the device, it should not be cl=
assified
> > as bad, even if it has bitflips (which sounds risky at best).
>=20
> For any amount of flipped bits per page? Sounds a bit scary.

I agree. Our NAND manufacturer even told us that a single permanent 1-bit
failure in a block is not enough for marking this block as bad on 4-bit ecc=
 NAND
devices. I still think there should be a specified amount of errors above w=
hich
the block should be considered bad. Maybe only permanent bit failures should
be considered.

Just for information, in our case: 1-bit and 2-bit errors are not reported,
3-bit and above are reported. And we are able to correct up to 8 errors (wh=
ile
the device only requires 4-bit correction), so we have some kind of safety
margin.

> > Right now, we implement a bitflip threshold, below which we correct ecc=
 errors
> > without reporting them. When the bitflip threshold is reached, we repor=
t the
> > amount of corrected errors, triggering block scrubbing, etc.
> > This is not ideal, but it prevents UBI from torturing and marking too m=
any
> > blocks as bad.
>=20
> Hmm... Working around UBI behavior does not sound like a the best
> solution.

Agreed.

> How about changing the MTD interface a little and teach it to:
>=20
> 1. Report the bit-flip level (or you name it properly) - the amount of
> bits flipped in this NAND page (or sub-page). If we read more than one
> NAND page at one go, and several pages had bit-flips of different level,
> report the maximum.

Yes, we do need the maximum error count per subpage. Today we only have a
cumulative count.

> 2. Make it possible for drivers to set the "bit-flip tolerance
> threshold" (invent a better name please), which is lowest the bit-flip
> level which should be considered harmful. E.g., in your case, the
> threshold could be 2.

This kind of threshold is NAND-device specific, ideally it could be derived
=66rom ONFI + manufacturer information, in a driver-independent way. Ideall=
y...

> 3. Make UBI only react on bit-flips with order higher or equivalend to
> the threshold. In your case then, UBI would ignore all level 1 bit-flips
> and react only to level 2, 3, and 4 bit-flips.
=20
Yes, this makes sense. When you say "react", do you also mean not doing any
scrubbing when the error count is below the threshold ?
In future devices, 1-bit errors will become very common and we'll probably =
need
to ignore them to avoid scrubbing blocks all the time.

BR,

Ivan
