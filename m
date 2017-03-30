Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cte3R-0000WI-0g
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 17:40:15 +0000
Date: Thu, 30 Mar 2017 19:39:44 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Jesper Nilsson <jespern@axis.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] UBI: Make MTD_UBI_FASTMAP non-experimental
Message-ID: <20170330173944.GJ29118@axis.com>
References: <20170329153836.GB29118@axis.com>
 <434195d8-d638-240d-8d63-50d033ea453a@nod.at>
 <3f8d0417-5e7d-b7c8-ba83-9a87e774f97f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f8d0417-5e7d-b7c8-ba83-9a87e774f97f@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Richard, Marek,

On Thu, Mar 30, 2017 at 12:01:41PM +0200, Marek Vasut wrote:
> On 03/29/2017 10:04 PM, Richard Weinberger wrote:
> > Jesper,
> > 
> > Am 29.03.2017 um 17:38 schrieb Jesper Nilsson:
> >> MTD_UBI_FASTMAP has been set as experimental since it
> >> was merged back in 2012.
> >>
> >> There hasn't been much change in the format,
> >> so we can consider the feature stable and start
> >> being careful about breaking the format.
> >> (This is somewhat of a pre-requisite for anyone actually
> >> using the feature in the real world and depending on it)
> >>
> >> Drop the experimental note and the warning text about
> >> the on-flash format not being finalized.
> > 
> > I fully agree, we can drop this note. But we have to add another
> > one.
> > While Fastmap is a nice feature to speed-up the attach time it
> > comes with a cost. It makes UBI less robust. I saw issues
> > on NAND chips which misbehaved slightly where UBI was able to
> > recover when using a full scan but not when Fastmap was used.
> > The UBI full scan code is paranoid and can sort out problems
> > very early, with Fastmap enabled you lose this valuable property.
> > 
> > So, users should enable Fastmap only when they absolutely need
> > a very fast attach time and be very sure that the NAND works as
> > expected.
> 
> So we should document this with a big fat warning and set fastmap to
> default=n ?

Does this sound reasonable?

Note that this feature makes UBI less robust, since Fastmap does not scan
the full flash, which might lead to problems on misbehaving NAND chips.
Only enable this if the speedup in attach is really important and
you can be sure that the NAND works as expected.


> Best regards,
> Marek Vasut

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
