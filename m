Received: from ns.sciencehorizons.net ([71.41.210.147])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bC1cF-0005kw-KE
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 09:23:36 +0000
Date: 12 Jun 2016 05:23:13 -0400
Message-ID: <20160612092313.4046.qmail@ns.sciencehorizons.net>
From: "George Spelvin" <linux@sciencehorizons.net>
To: boris.brezillon@free-electrons.com, linux@sciencehorizons.net
Subject: Re: [PATCH 2/4] mtd: nand: implement two pairing scheme
Cc: computersforpeace@gmail.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at
In-Reply-To: <20160612092019.79b57b7f@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> It also applies an offset of +1, to avoid negative numbers and the
>> problems of signed divides.

> It seems to cover all cases.

I wasn't sure why you used a signed int for the interface.

(Another thing I thought of, but am less sure of, is packing the group
and pair numbers into a register-passable int rather than a structure.
Even 2 bits for the group is probably the most that will ever be needed,
but it's easy to say the low 4 bits are the group and the high 28 are
the pair.  Just create a few access macros to pull them apart.

This was inspired by Linus's hash_len abstraction, recently moved to
<linux/stringhash.h>)

>> (or you could add an mtd->write_per_erase field).

> Okay. Actually I'd like to avoid adding new 'conversion' fields to the
> mtd_info struct. Not sure we are really improving perfs when doing that,
> since what takes long is the I/O ops between the flash and the
> controller not the conversion operations.

Well, yes, but you may need to do conversion ops for in-memory cache
lookups or searching for free blocks, or wear-levelling computations,
all of which may involve a great many conversions per actual I/O.

(In hindsight, I'd wish for writesize and write_per_erase, and not
store erasesize explicitly.  Not only is the multiply more efficient,
but it abolishes the error of an erase size which is not a multiple of
the write size by making it impossible.)

> Can we have a boolean to make it clearer?
>
>	bool lastpage = ((page + 1) * mtd->writesize) == mtd->erasesize;

An improvement IMHO.  You can use the same name in all four functions
to make the equivalence clear.

> Also, the page update is quite obscure for people that did not have the
> explanation you gave above. Can we make it

>	/*
>	 * The first and last pages are not surrounded by other pages,
>	 * and are thus less sensitive to read/write disturbance.
>	 * That's why NAND vendors decided to use a different distance
>	 * for these 2 specific case, which complicates a bit the
>	 * pairing scheme logic.

Um... this is, as far as I can tell, complete nonsense.

I realize you know this about a thousand times better than I do, so
I'm hesitant to make such a strong statement, but one thing that I do
know is that paired pages are stored in the exact same transistors.
The pairing is purely a logical addressing distance.  The physical
distance is exactly zero.

The qustion is why they chose this particular *logival* addressing
scheme, and I believe the reason is write bandwidth for the common case
of streaming writes to consecutive pages.

The obvious thing to do is pair consecutive even and odd pages (pages 0 and 1,
then 2 and 3, then...), but that makes it hard to pipeline programming of the
two pages.  You can't start programming page 1 until page 0 is finished.

The next obvious thing is stride-2: 0<->2, 1<->3, 4<->6, 5<->7, etc.

This is done in some MLC chips.  See p. 98 of this Micron data sheet:
http://pdf.datasheet.directory/datasheets-0/micron_technology/MT29F32G08CBACAWP_C.pdf
which has a stride-4 pairing.  0..3 pair with 4..8, then 9..11 with
12..15, and so on.

However, it's desirable to alternate group-0 and group-1 pages, since
the write operations are rather different and even take different amounts
of time.  Alternating them makes it possible to:
1) Possibly overlap parts of the writes that use different on-chip resources,
2) Average the non-overlapping times for minimum jitter.

This leads naturally to the stride-3 solution.  You want to minimize the
stride because you can read both pages in a pair with one read disturbance,
and the shorter the distance, the more likely you'll want both pages
(and the less buffering you'll need to make both available).

Stride-3 does have those two awkward edge cases, and changing the
stride is simply the simplest way to special-case them.

> Thanks for your valuable review/suggestions.
>
> Just out of curiosity, why are you interested in the pairing scheme
> concept? Are you working with NANDs?

Not at present, but I do embedded hardware and might some day.

Also, the data sheets are a real PITA to find.  I have yet to
see an actual data sheet that documents the stride-3 pairing scheme.
