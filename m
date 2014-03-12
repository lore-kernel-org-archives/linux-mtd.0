Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNd8j-0008Mt-9Q
 for linux-mtd@lists.infradead.org; Wed, 12 Mar 2014 06:59:46 +0000
Received: by mail-pb0-f49.google.com with SMTP id jt11so673073pbb.22
 for <linux-mtd@lists.infradead.org>; Tue, 11 Mar 2014 23:59:21 -0700 (PDT)
Message-ID: <532005C6.3090805@gmail.com>
Date: Tue, 11 Mar 2014 23:59:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>	<20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>	<531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
In-Reply-To: <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

Hi Elie,

Thanks for your response.

On 03/11/2014 10:59 PM, Elie De Brauwer wrote:
> In [1] you an find some benchmarks which I did in the early days of the GPMI fix
> where I tried several approaches ranging from the naive version based on some
> of Pekon's work, going to making using of the BCH status register ending with
> reading the syndromes and caching them, for me this last version is what I have
> in our own Linux tree, because after this Huang took over and came
> with the patch
> which started these discussions which I'm waiting to upstream.

I'm a little confused by the number of different patches out here. I'll
summarize what I understand, but please correct if I'm wrong:

[A] First, you (Elie) sent a series of patches that made it to v7 [1].
This utilizes a special GPMI hardware feature that can tell report an
ECC chunk as "erased" based on how many 0 bits it has (between 0 and
some threshold). This still required a fallback to count the number of
bits whenever it's under this threshold

[B] Then, you sent an additional patch [2] (on top of [1]) which tries
to cache the syndrome related to a fully erased page (no bitflips) for
speeding up some comparisons. You provided benchmarks in [3]

[C] Finally, Huang followed up with his own patch [4]. It doesn't do
anything specific to GPMI really, and it encouraged me to just submit my
own patch (the current thread) for nand_base.

But I can't tell what to do with your performance numbers. I see results
for [1] and for [1]+[2], but I don't see any results for [4].

Finally, is [4] supposed to replace your (Elie's) work from [1] and [2],
or supplement it? It sounded like you two were encouraging me to merge
it by itself.

> What my tests haves learned me is that there's probably very little to
> gain in the
> actual optimization of the erased-page correction, but the magic lies in quickly
> and efficiently determining if a read-page is actually an all-0xff
> case with a bitflip
> causing the BCH block to detect it as an error.

I'm not quite sure what you're saying here. What do you mean
"erased-page correction" vs. "determining ... all-0xff"? Aren't those
the same thing?

> (In the case of GPMI
> is, our n-bit
> ECC failed to withstand a single bitflip).

That's understandable. ECC algorithms must be written specifically so
that they can match and correct mostly-0xff patterns. You can't really
massage an inflexible hardware implementation to do this.

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051357.html

[2] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051413.html

[3] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051414.html

[4] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html
