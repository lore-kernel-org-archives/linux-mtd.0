Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNz8h-0005Q9-UL
 for linux-mtd@lists.infradead.org; Thu, 13 Mar 2014 06:29:12 +0000
Received: by mail-pd0-f181.google.com with SMTP id p10so628612pdj.26
 for <linux-mtd@lists.infradead.org>; Wed, 12 Mar 2014 23:28:49 -0700 (PDT)
Date: Wed, 12 Mar 2014 23:28:45 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH 1/2] mtd: nand: add erased-page bitflip correction
Message-ID: <20140313062845.GT31517@norris-Latitude-E6410>
References: <1394529112-9659-1-git-send-email-computersforpeace@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB1679@DBDE04.ent.ti.com>
 <531FF16F.7060808@gmail.com>
 <CAGWqfijgOL4Qk4axrPo=Z2vcq_upBCM-jQCm-wkSs12RqTeR8Q@mail.gmail.com>
 <532005C6.3090805@gmail.com>
 <CAGWqfigu3GFPS3Ykap4_hjkMtEUCv8bXGOt2h7GGQ=Sgip=DdQ@mail.gmail.com>
 <20140313052219.GQ31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB2F71@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB2F71@DBDE04.ent.ti.com>
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frederic <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Thu, Mar 13, 2014 at 05:55:32AM +0000, Pekon Gupta wrote:
> >From: Brian Norris [mailto:computersforpeace@gmail.com]
> >On Wed, Mar 12, 2014 at 01:45:15PM +0100, Elie De Brauwer wrote:
> >> b) "determining you read an erased page". In case of the i.mx (and
> >> thus GPMI) the BCH block can tell you three things:
> >>  1. I read all 0xff's
> >>  2. I read some data and nothing got corrected
> >>  3. I read something but failed to correct it.
> >> The third case can have two causes:
> >>  3.a you read valid data with bitflips exceeding what the BCH could
> >> correct
> >>  3.b you read an erased page with bitflips.
> >>
> >> Obviously case 3.b is what this discussion is all about, and my quest
> >> revolved around a means to quickly identify case '3.b'.
> >
> >Yes, 3.a vs. 3.b is the big problem.
[...]

> I think for OMAP NAND driver there needs to be some help on "1." also.
> There is no hardware support in GPMC (Ti's controller) to find out if the
> (read_data + read_oob) == 0xff. So you have to do this comparison in
> software.

Really? So if you read a blank (all 0xff) page that has no bitflips, you
see an ECC error? I'm sorry, but I didn't realize that's how your
hardware worked. That's the worst hardware ECC design I've seen so far
:(

So currently, omap2.c tries to mitigate the overhead of checking 1 (and
3.b) by using a fixed-offset "programmed" marker, right? But this isn't
workable for all platforms (why, exactly?) so you're trying to remove
this marker in your patch sets, right? (Could you possibly move the
marker somewhere else, depending on the platform? But admittedly, this
is still fragile.)

In any case, if the special marker approach fails, you're falling back
to an approach similar to the Freescale approach (and mine), with a few
extra tweaks.

> And, thus there is performance penalty right at first-step.
> (I'm trying to get the statistics of this soon).

Yes, that would be nice.

Brian
