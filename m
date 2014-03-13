Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNyCF-0004aP-Jj
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 05:28:48 +0000
Received: by mail-pb0-f45.google.com with SMTP id uo5so591052pbc.4
 for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2014 22:28:25 -0700 (PDT)
Date: Wed, 12 Mar 2014 22:22:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140313052219.GQ31517@norris-Latitude-E6410>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
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

On Wed, Mar 12, 2014 at 01:45:15PM +0100, Elie De Brauwer wrote:
> On Wed, Mar 12, 2014 at 7:59 AM, Brian Norris <computersforpeace@gmail.com> wrote:
> > On 03/11/2014 10:59 PM, Elie De Brauwer wrote:
[...]
> > I'm a little confused by the number of different patches out here. I'll
> > summarize what I understand, but please correct if I'm wrong:
> >
> > [A] First, you (Elie) sent a series of patches that made it to v7 [1].
> > This utilizes a special GPMI hardware feature that can tell report an
> > ECC chunk as "erased" based on how many 0 bits it has (between 0 and
> > some threshold). This still required a fallback to count the number of
> > bits whenever it's under this threshold
> >
> > [B] Then, you sent an additional patch [2] (on top of [1]) which tries
> > to cache the syndrome related to a fully erased page (no bitflips) for
> > speeding up some comparisons. You provided benchmarks in [3]
> >
> > [C] Finally, Huang followed up with his own patch [4]. It doesn't do
> > anything specific to GPMI really, and it encouraged me to just submit my
> > own patch (the current thread) for nand_base.
> >
> > But I can't tell what to do with your performance numbers. I see results
> > for [1] and for [1]+[2], but I don't see any results for [4].
> >
> > Finally, is [4] supposed to replace your (Elie's) work from [1] and [2],
> > or supplement it? It sounded like you two were encouraging me to merge
> > it by itself.
> 
> Your archeological research is  correct. During A-B I followed a track in
> which I believed was a water-tight system using as much as possible
> assist  from hardware as possible. But Huang turned this into something
> more usable using more internal knowledge of the working of the
> BCH syndromes.

OK, so if an approach like [C] stabilizes, that should replace [A] and [B]?

> >> What my tests haves learned me is that there's probably very little to
> >> gain in the
> >> actual optimization of the erased-page correction, but the magic lies in quickly
> >> and efficiently determining if a read-page is actually an all-0xff
> >> case with a bitflip
> >> causing the BCH block to detect it as an error.
> >
> > I'm not quite sure what you're saying here. What do you mean
> > "erased-page correction" vs. "determining ... all-0xff"? Aren't those
> > the same thing?
> >
> 
> I meant there are two things:
> a) "erase-page correction": if you have an erased page with bitflips,
>  count and correct them. (E.g. the for loop with the hweight and
> a potential break when you each a threshold, possible with an in
> place setting of the to 0xff of the byte in question or followed by
> a memset to 0xff at the end).
> b) "determining you read an erased page". In case of the i.mx (and
> thus GPMI) the BCH block can tell you three things:
>  1. I read all 0xff's
>  2. I read some data and nothing got corrected
>  3. I read something but failed to correct it.
> The third case can have two causes:
>  3.a you read valid data with bitflips exceeding what the BCH could
> correct
>  3.b you read an erased page with bitflips.
> 
> Obviously case 3.b is what this discussion is all about, and my quest
> revolved around a means to quickly identify case '3.b'.

Yes, 3.a vs. 3.b is the big problem.

> And once you're in case '3' it's difficult to actually distinguish between
> 3.a and 3.b (think of a page wich consists out of 99.99% 1-bits but
> has bitflips exceeding the threshold), You could only identify this by
> looking at the syndrome data (which should be 0xff) but which is not
> at hand in the GPMI.

So if you can't distinguish between 3.a and 3.b, then you're in the same
boat as many other hardware/drivers. But if you can do something special
with the hardware, that is still potentially very interesting.

(BTW, I don't think saving the syndrome bytes is a very good approach
here. It seems like that would only help for very specific patterns.)

What *can* your BCH do to help w/ distinguishing 3.a and 3.b?

As I read your patches, it seems your BCH can report STATUS_ERASED when
it sees a page with only N or fewer 0-bits, where N is configurable from
0 to 255 (?). If only it could also report *how many* zero bits it
saw... Otherewise, it seems like you just want to leave N = 0 to signal
a clean page, and continue with a pure software solution for the
STATUS_UNCORRECTABLE case.

> So we experimented with tuning the '0xff' case detecting algorithm
> (mainly [A] which I improved by caching the correct syndromes for
> an erased page addition [B]).  Mainly focusing on the theoretical
> background, Huang turned this into a more down to earth approach.
> 
> In my own kernel tree I'm still using my patches [A] and [B], and this
> is what goes out to the field if we need to start shipping (since vanilla
> has a high risk of turning our devices into bricks), but if I have time
> I plan to integrate whatever makes it upstream (unless it really messes
> up my boot times ;) ).

OK, then I think I'll consider only some version of either Huang's patch
or my own. And if we can straighten out the GPMI data/OOB layout (per
Huang and my conversation on another fork of this thread), then I think
we'd want this code in nand_base.

Brian

> > [1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051357.html
> >
> > [2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051413.html
> >
> > [3] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051414.html
> >
> > [4] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html
