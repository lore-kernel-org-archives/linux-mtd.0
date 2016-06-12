Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bC3JK-0005a8-6y
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 11:12:13 +0000
Date: Sun, 12 Jun 2016 13:11:42 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "George Spelvin" <linux@sciencehorizons.net>
Cc: computersforpeace@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at, "Bean Huo =?UTF-8?B?6ZyN?=
 =?UTF-8?B?5paM5paM?= (beanhuo)" <beanhuo@micron.com>
Subject: Re: [PATCH 2/4] mtd: nand: implement two pairing scheme
Message-ID: <20160612131142.293ff800@bbrezillon>
In-Reply-To: <20160612092313.4046.qmail@ns.sciencehorizons.net>
References: <20160612092019.79b57b7f@bbrezillon>
 <20160612092313.4046.qmail@ns.sciencehorizons.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 Jun 2016 05:23:13 -0400
"George Spelvin" <linux@sciencehorizons.net> wrote:

> >> It also applies an offset of +1, to avoid negative numbers and the
> >> problems of signed divides. =20
>=20
> > It seems to cover all cases. =20
>=20
> I wasn't sure why you used a signed int for the interface.

No real reason other than consistency with other prototypes where page
is always expressed as an integer.

>=20
> (Another thing I thought of, but am less sure of, is packing the group
> and pair numbers into a register-passable int rather than a structure.
> Even 2 bits for the group is probably the most that will ever be needed,
> but it's easy to say the low 4 bits are the group and the high 28 are
> the pair.  Just create a few access macros to pull them apart.

We could indeed do that, but again, do we really need to optimize
things like that?

>=20
> This was inspired by Linus's hash_len abstraction, recently moved to
> <linux/stringhash.h>)
>=20
> >> (or you could add an mtd->write_per_erase field). =20
>=20
> > Okay. Actually I'd like to avoid adding new 'conversion' fields to the
> > mtd_info struct. Not sure we are really improving perfs when doing that,
> > since what takes long is the I/O ops between the flash and the
> > controller not the conversion operations. =20
>=20
> Well, yes, but you may need to do conversion ops for in-memory cache
> lookups or searching for free blocks, or wear-levelling computations,
> all of which may involve a great many conversions per actual I/O.

That's true, even if I don't think it makes such a big difference (you
don't have that much paired pages manipulation that are not followed by
read/write accesses, and this is where the contention is).

>=20
> (In hindsight, I'd wish for writesize and write_per_erase, and not
> store erasesize explicitly.  Not only is the multiply more efficient,
> but it abolishes the error of an erase size which is not a multiple of
> the write size by making it impossible.)

That's also true. Actually I was thinking about adding inline functions
to retrieve the eraseblock and page size instead of letting people
manipulate the ->writesize/erasesize fields. This way we would be able
to rework the internal representation.

>=20
> > Can we have a boolean to make it clearer?
> >
> >	bool lastpage =3D ((page + 1) * mtd->writesize) =3D=3D mtd->erasesize; =
=20
>=20
> An improvement IMHO.  You can use the same name in all four functions
> to make the equivalence clear.
>=20
> > Also, the page update is quite obscure for people that did not have the
> > explanation you gave above. Can we make it =20
>=20
> >	/*
> >	 * The first and last pages are not surrounded by other pages,
> >	 * and are thus less sensitive to read/write disturbance.
> >	 * That's why NAND vendors decided to use a different distance
> >	 * for these 2 specific case, which complicates a bit the
> >	 * pairing scheme logic. =20
>=20
> Um... this is, as far as I can tell, complete nonsense.

Actually this was pure guessing, cause I never had a real explanation
for these weird pairing scheme.

>=20
> I realize you know this about a thousand times better than I do, so
> I'm hesitant to make such a strong statement, but one thing that I do
> know is that paired pages are stored in the exact same transistors.
> The pairing is purely a logical addressing distance.  The physical
> distance is exactly zero.
>=20
> The qustion is why they chose this particular *logival* addressing
> scheme, and I believe the reason is write bandwidth for the common case
> of streaming writes to consecutive pages.
>=20
> The obvious thing to do is pair consecutive even and odd pages (pages 0 a=
nd 1,
> then 2 and 3, then...), but that makes it hard to pipeline programming of=
 the
> two pages.  You can't start programming page 1 until page 0 is finished.
>=20
> The next obvious thing is stride-2: 0<->2, 1<->3, 4<->6, 5<->7, etc.

Yes I understand that one.

>=20
> This is done in some MLC chips.  See p. 98 of this Micron data sheet:
> http://pdf.datasheet.directory/datasheets-0/micron_technology/MT29F32G08C=
BACAWP_C.pdf
> which has a stride-4 pairing.  0..3 pair with 4..8, then 9..11 with
> 12..15, and so on.
>=20
> However, it's desirable to alternate group-0 and group-1 pages, since
> the write operations are rather different and even take different amounts
> of time.  Alternating them makes it possible to:
> 1) Possibly overlap parts of the writes that use different on-chip resour=
ces,
> 2) Average the non-overlapping times for minimum jitter.

Okay, that's actually a good reason, and probably the part I was
missing to explain these non-log2 distance scheme leading to
heterogeneous distance (the first and last set of pages don't have
the same stride).

>=20
> This leads naturally to the stride-3 solution.  You want to minimize the
> stride because you can read both pages in a pair with one read disturbanc=
e,
> and the shorter the distance, the more likely you'll want both pages
> (and the less buffering you'll need to make both available).
>=20
> Stride-3 does have those two awkward edge cases, and changing the
> stride is simply the simplest way to special-case them.

Yep.

Still, I've seen weird things while working on modern MLC NANDs which
makes me think the pairing scheme is also here to help mitigate the
write-disturb effect, but I might be wrong. The behavior I'm
describing here has been observed on Hynix (H27QCG8T2E5R=E2=80=90BCF) and
Toshiba (TC58TEG5DCLTA00) NANDs so far. When I write the 2 pages in a
pair, but not the following page, I see a high number of bitflips in
the last programmed page until the next page is programmed.

Let's take a real example. My NAND is exposing a stride-3 pairing
scheme, when I only program page 0, 1, 2, page 2 is showing a high
number of bitflips until page 3 is programmed. Actually, I don't
remember if the number decrease after programming page 3 or 4, but my
guess is that the NAND is accounting for future write-disturb when
programming a page in group 1, which makes this page un-reliable until
the subsequent page(s) have been programmed.

What's your opinion on that?

>=20
> > Thanks for your valuable review/suggestions.
> >
> > Just out of curiosity, why are you interested in the pairing scheme
> > concept? Are you working with NANDs? =20
>=20
> Not at present, but I do embedded hardware and might some day.

Okay. You seem pretty well aware of MLC/TLC NAND constraints, and you
already have good idea of how things work.
Good to have someone like you reviewing this stuff.

>=20
> Also, the data sheets are a real PITA to find.  I have yet to
> see an actual data sheet that documents the stride-3 pairing scheme.

Yes, that's a real problem. Here is a Samsung NAND data sheet
describing stride-3 [1], and an Hynix one describing stride-6 [2].

[1]http://dl.btc.pl/kamami_wa/k9gbg08u0a_ds.pdf
[2]http://www.szyuda88.com/uploadfile/cfile/201061714220663.pdf

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
