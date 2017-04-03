Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cuzzm-0000fb-Hf
 for linux-mtd@lists.infradead.org; Mon, 03 Apr 2017 11:18:06 +0000
Date: Mon, 3 Apr 2017 13:17:36 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Richard Weinberger <richard@nod.at>
Cc: Jesper Nilsson <jespern@axis.com>, Marek Vasut <marek.vasut@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] UBI: Make MTD_UBI_FASTMAP non-experimental
Message-ID: <20170403111735.GV29118@axis.com>
References: <20170329153836.GB29118@axis.com>
 <434195d8-d638-240d-8d63-50d033ea453a@nod.at>
 <3f8d0417-5e7d-b7c8-ba83-9a87e774f97f@gmail.com>
 <20170330173944.GJ29118@axis.com>
 <a85d3308-e9c9-b292-b2ad-0005a55d2e6d@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a85d3308-e9c9-b292-b2ad-0005a55d2e6d@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Thu, Mar 30, 2017 at 11:29:15PM +0200, Richard Weinberger wrote:
> Jesper,
> 
> Am 30.03.2017 um 19:39 schrieb Jesper Nilsson:
> >> So we should document this with a big fat warning and set fastmap to
> >> default=n ?
> > 
> > Does this sound reasonable?
> > 
> > Note that this feature makes UBI less robust, since Fastmap does not scan
> > the full flash, which might lead to problems on misbehaving NAND chips.
> > Only enable this if the speedup in attach is really important and
> 
> I'm not a native English speaker, but shouldn't this be
> "...if speedup of the attach time is important ..."
> 
> > you can be sure that the NAND works as expected.
> 
> Looks fine!

As you saw I resent the patch with this formulation added.

However, after thinking about it (and with input from some coworkers),
could we pinpoint the failure case a bit more here?

What is the exact problem behaviour on NAND chips that we're
worried about, and in which case will UBI be less robust if
we don't scan the full flash?

My first reaction was that this was a natural conclusion,
but if the NAND flash is failing, we should either be in the
case that the FASTMAP is corrupted or that the original data
is corrupted. Both should be found by current implementation.
Or am I missing additional failure cases here?

I getting a bit worried about using the feature at all,
even if it seems to work right now...

> Thanks,
> //richard

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
