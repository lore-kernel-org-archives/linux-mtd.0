Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNieS-00019s-51
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 12:52:53 +0000
Received: by mail-pd0-f179.google.com with SMTP id w10so1034510pde.38
 for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2014 05:52:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <532005C6.3090805@gmail.com>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
Date: Wed, 12 Mar 2014 13:45:15 +0100
Message-ID: <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
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

On Wed, Mar 12, 2014 at 7:59 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Hi Elie,
>
> Thanks for your response.
>
> On 03/11/2014 10:59 PM, Elie De Brauwer wrote:
>> In [1] you an find some benchmarks which I did in the early days of the GPMI fix
>> where I tried several approaches ranging from the naive version based on some
>> of Pekon's work, going to making using of the BCH status register ending with
>> reading the syndromes and caching them, for me this last version is what I have
>> in our own Linux tree, because after this Huang took over and came
>> with the patch
>> which started these discussions which I'm waiting to upstream.
>
> I'm a little confused by the number of different patches out here. I'll
> summarize what I understand, but please correct if I'm wrong:
>
> [A] First, you (Elie) sent a series of patches that made it to v7 [1].
> This utilizes a special GPMI hardware feature that can tell report an
> ECC chunk as "erased" based on how many 0 bits it has (between 0 and
> some threshold). This still required a fallback to count the number of
> bits whenever it's under this threshold
>
> [B] Then, you sent an additional patch [2] (on top of [1]) which tries
> to cache the syndrome related to a fully erased page (no bitflips) for
> speeding up some comparisons. You provided benchmarks in [3]
>
> [C] Finally, Huang followed up with his own patch [4]. It doesn't do
> anything specific to GPMI really, and it encouraged me to just submit my
> own patch (the current thread) for nand_base.
>
> But I can't tell what to do with your performance numbers. I see results
> for [1] and for [1]+[2], but I don't see any results for [4].
>
> Finally, is [4] supposed to replace your (Elie's) work from [1] and [2],
> or supplement it? It sounded like you two were encouraging me to merge
> it by itself.

Your archeological research is  correct. During A-B I followed a track in
which I believed was a water-tight system using as much as possible
assist  from hardware as possible. But Huang turned this into something
more usable using more internal knowledge of the working of the
BCH syndromes.

>> What my tests haves learned me is that there's probably very little to
>> gain in the
>> actual optimization of the erased-page correction, but the magic lies in quickly
>> and efficiently determining if a read-page is actually an all-0xff
>> case with a bitflip
>> causing the BCH block to detect it as an error.
>
> I'm not quite sure what you're saying here. What do you mean
> "erased-page correction" vs. "determining ... all-0xff"? Aren't those
> the same thing?
>

I meant there are two things:
a) "erase-page correction": if you have an erased page with bitflips,
 count and correct them. (E.g. the for loop with the hweight and
a potential break when you each a threshold, possible with an in
place setting of the to 0xff of the byte in question or followed by
a memset to 0xff at the end).
b) "determining you read an erased page". In case of the i.mx (and
thus GPMI) the BCH block can tell you three things:
 1. I read all 0xff's
 2. I read some data and nothing got corrected
 3. I read something but failed to correct it.
The third case can have two causes:
 3.a you read valid data with bitflips exceeding what the BCH could
correct
 3.b you read an erased page with bitflips.

Obviously case 3.b is what this discussion is all about, and my quest
revolved around a means to quickly identify case '3.b'.

And once you're in case '3' it's difficult to actually distinguish between
3.a and 3.b (think of a page wich consists out of 99.99% 1-bits but
has bitflips exceeding the threshold), You could only identify this by
looking at the syndrome data (which should be 0xff) but which is not
at hand in the GPMI.

So we experimented with tuning the '0xff' case detecting algorithm
(mainly [A] which I improved by caching the correct syndromes for
an erased page addition [B]).  Mainly focusing on the theoretical
background, Huang turned this into a more down to earth approach.

In my own kernel tree I'm still using my patches [A] and [B], and this
is what goes out to the field if we need to start shipping (since vanilla
has a high risk of turning our devices into bricks), but if I have time
I plan to integrate whatever makes it upstream (unless it really messes
up my boot times ;) ).


my 2 cents
E.


>> (In the case of GPMI
>> is, our n-bit
>> ECC failed to withstand a single bitflip).
>
> That's understandable. ECC algorithms must be written specifically so
> that they can match and correct mostly-0xff patterns. You can't really
> massage an inflexible hardware implementation to do this.
>
> Brian
>
> [1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051357.html
>
> [2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051413.html
>
> [3] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051414.html
>
> [4] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html



-- 
Elie De Brauwer
