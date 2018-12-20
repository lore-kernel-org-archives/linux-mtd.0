Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga0TU-0002u3-0c
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 15:43:03 +0000
From: Richard Weinberger <richard@nod.at>
To: Martin Townsend <mtownsend1973@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: hung task detected in ubifs
Date: Thu, 20 Dec 2018 16:42:46 +0100
Message-ID: <1722601.NPUxFaVKW8@blindfold>
In-Reply-To: <CABatt_yRNnfrkysYwWuPJ=80nTa5ePNrpmvAq=B=bkcHvA5yig@mail.gmail.com>
References: <CABatt_wvwVuzAMp6JX4yUireb3wAuiiF5i+=7FRGDPx3fwxrKA@mail.gmail.com>
 <3974794.HFKrkWXeJj@blindfold>
 <CABatt_yRNnfrkysYwWuPJ=80nTa5ePNrpmvAq=B=bkcHvA5yig@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 20. Dezember 2018, 16:04:10 CET schrieb Martin Townsend:
> > Basically we need to figure why and where exactly cma_alloc() hangs.
> > And of course also we need to know if it is really cma_alloc().
> >
> > Can you please dig into that?
> Will do, would CMA_DEBUG help or would it produce too much log information?

I don't know. I'd first try to figure where exactly it hangs and why.

Thanks,
//richard
