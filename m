Received: from mail-pa0-f53.google.com ([209.85.220.53])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WO0DD-0006V3-5G
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 07:37:58 +0000
Received: by mail-pa0-f53.google.com with SMTP id ld10so727654pab.12
 for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2014 00:37:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140313052219.GQ31517@norris-Latitude-E6410>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
 <20140313052219.GQ31517@norris-Latitude-E6410>
Date: Thu, 13 Mar 2014 08:37:28 +0100
Message-ID: <CAGWqfijhXp1ayzmaR-Ssy5v0Z1H=3yY7_tmhbp3nAYTyQdjt8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
From: Elie De Brauwer <eliedebrauwer@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kent Li <kent.li@radisys.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 13, 2014 at 6:22 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Mar 12, 2014 at 01:45:15PM +0100, Elie De Brauwer wrote:
>> On Wed, Mar 12, 2014 at 7:59 AM, Brian Norris <computersforpeace@gmail.com> wrote:
>> > On 03/11/2014 10:59 PM, Elie De Brauwer wrote:
> [...]
>> > I'm a little confused by the number of different patches out here. I'll
>> > summarize what I understand, but please correct if I'm wrong:
>> >
>> > [A] First, you (Elie) sent a series of patches that made it to v7 [1].
>> > This utilizes a special GPMI hardware feature that can tell report an
>> > ECC chunk as "erased" based on how many 0 bits it has (between 0 and
>> > some threshold). This still required a fallback to count the number of
>> > bits whenever it's under this threshold
>> >
>> > [B] Then, you sent an additional patch [2] (on top of [1]) which tries
>> > to cache the syndrome related to a fully erased page (no bitflips) for
>> > speeding up some comparisons. You provided benchmarks in [3]
>> >
>> > [C] Finally, Huang followed up with his own patch [4]. It doesn't do
>> > anything specific to GPMI really, and it encouraged me to just submit my
>> > own patch (the current thread) for nand_base.
>> >
>> > But I can't tell what to do with your performance numbers. I see results
>> > for [1] and for [1]+[2], but I don't see any results for [4].
>> >
>> > Finally, is [4] supposed to replace your (Elie's) work from [1] and [2],
>> > or supplement it? It sounded like you two were encouraging me to merge
>> > it by itself.
>>
>> Your archeological research is  correct. During A-B I followed a track in
>> which I believed was a water-tight system using as much as possible
>> assist  from hardware as possible. But Huang turned this into something
>> more usable using more internal knowledge of the working of the
>> BCH syndromes.
>
> OK, so if an approach like [C] stabilizes, that should replace [A] and [B]?


Correct, obviously for mainstream code it's probably better if this can be
solved at a more generic level (e.g. at nand level instead of at the level
of each individual driver). The only reason [A] and [B] exist because for my
current needs (getting my boards stable) that was the point where it made
more sense, and it appeared the same path was being followed by Pekon
for OMAP.

>
>> >> What my tests haves learned me is that there's probably very little to
>> >> gain in the
>> >> actual optimization of the erased-page correction, but the magic lies in quickly
>> >> and efficiently determining if a read-page is actually an all-0xff
>> >> case with a bitflip
>> >> causing the BCH block to detect it as an error.
>> >
>> > I'm not quite sure what you're saying here. What do you mean
>> > "erased-page correction" vs. "determining ... all-0xff"? Aren't those
>> > the same thing?
>> >
>>
>> I meant there are two things:
>> a) "erase-page correction": if you have an erased page with bitflips,
>>  count and correct them. (E.g. the for loop with the hweight and
>> a potential break when you each a threshold, possible with an in
>> place setting of the to 0xff of the byte in question or followed by
>> a memset to 0xff at the end).
>> b) "determining you read an erased page". In case of the i.mx (and
>> thus GPMI) the BCH block can tell you three things:
>>  1. I read all 0xff's
>>  2. I read some data and nothing got corrected
>>  3. I read something but failed to correct it.
>> The third case can have two causes:
>>  3.a you read valid data with bitflips exceeding what the BCH could
>> correct
>>  3.b you read an erased page with bitflips.
>>
>> Obviously case 3.b is what this discussion is all about, and my quest
>> revolved around a means to quickly identify case '3.b'.
>
> Yes, 3.a vs. 3.b is the big problem.
>
>> And once you're in case '3' it's difficult to actually distinguish between
>> 3.a and 3.b (think of a page wich consists out of 99.99% 1-bits but
>> has bitflips exceeding the threshold), You could only identify this by
>> looking at the syndrome data (which should be 0xff) but which is not
>> at hand in the GPMI.
>
> So if you can't distinguish between 3.a and 3.b, then you're in the same
> boat as many other hardware/drivers. But if you can do something special
> with the hardware, that is still potentially very interesting.
>
> (BTW, I don't think saving the syndrome bytes is a very good approach
> here. It seems like that would only help for very specific patterns.)
>
> What *can* your BCH do to help w/ distinguishing 3.a and 3.b?
>
> As I read your patches, it seems your BCH can report STATUS_ERASED when
> it sees a page with only N or fewer 0-bits, where N is configurable from
> 0 to 255 (?). If only it could also report *how many* zero bits it
> saw... Otherewise, it seems like you just want to leave N = 0 to signal
> a clean page, and continue with a pure software solution for the
> STATUS_UNCORRECTABLE case.

Indeed, what can be done is tuning the all 0xff-detection algorithm, you
can modify this threshold to count how many non-1-bits are allowed before
the block is marked as uncorrectable. The only thing which is not clear to
me, and not very clearly documented, is how the OOB data matches in,
suppose we set this threshold to n (or even to zero) and bitflips occur
only in the OOB data, there would be no way to tell. The problem I saw
is that by looking at the data alone, this would not be enough information
to distinguish between an erased pages with bitflips and a non-erased
page which consists mainly out of 0xff's, which you could probably only
distinguish by having access to the ECC data which we had not. Hence
the approach of playing with the 0xff-detection algorithm in the BCH block.

E.g. page 1285 of the i.MX28 reference manual ( [1] ), states

<quote>
As the BCH decoder reads the data and parity blocks, it records a
special condition, i.e.,
that all of the bits of a payload data block or metadata block are
one, including any associated
parity bytes. The all-ones case for both parity and data indicates an
erased block in the
NAND device.
</quote>

[1] http://free-electrons.com/~maxime/pub/datasheet/MCIMX28RM.pdf

>
>> So we experimented with tuning the '0xff' case detecting algorithm
>> (mainly [A] which I improved by caching the correct syndromes for
>> an erased page addition [B]).  Mainly focusing on the theoretical
>> background, Huang turned this into a more down to earth approach.
>>
>> In my own kernel tree I'm still using my patches [A] and [B], and this
>> is what goes out to the field if we need to start shipping (since vanilla
>> has a high risk of turning our devices into bricks), but if I have time
>> I plan to integrate whatever makes it upstream (unless it really messes
>> up my boot times ;) ).
>
> OK, then I think I'll consider only some version of either Huang's patch
> or my own. And if we can straighten out the GPMI data/OOB layout (per
> Huang and my conversation on another fork of this thread), then I think
> we'd want this code in nand_base.

As stated I have no problem with that, on the contrary, I'm very eager to
see an accepted solution to this issue in the kernel.

my 2 cents
E.

-- 
Elie De Brauwer
