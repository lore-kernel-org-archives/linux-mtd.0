Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctVXN-00066z-3C
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:34:36 +0000
Date: Thu, 30 Mar 2017 10:34:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>, Arnaud
 Mouiche <arnaud.mouiche@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Marek Vasut <marex@denx.de>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v4 1/9] mtd: nand: add oob iterator in nand_for_each_page
Message-ID: <20170330103401.5335205d@bbrezillon>
In-Reply-To: <CAAyFORKmW2EXvSFyJM+Yg1OQaoN9EaMMw440117-Xwr2sExwUA@mail.gmail.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-2-git-send-email-peterpandong@micron.com>
 <20170329213427.280c26bb@bbrezillon>
 <CAAyFORKmW2EXvSFyJM+Yg1OQaoN9EaMMw440117-Xwr2sExwUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Mar 2017 16:01:04 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:
> 
> >  
> >>   */
> >>  struct nand_page_iter {
> >> -     loff_t offs;
> >>       int page;
> >>       int pageoffs;
> >> +     size_t dataleft;
> >> +     int ooboffs;
> >> +     int oobsize;  
> >
> > oobsize can be extracted from nand_device, and since a nand_device
> > object it passed to all nand_page_iter_xxx() functions you don't need it
> > here.  
> 
> Er.. I think we can not get oobsize from nand_device, since oobsize is
> determined
> by mtd_oob_ops.mode, it can be mtd->oobavail or mtd->oobsize. What do
> you think Boris?

Correct, I forgot about this aspect. Ignore my previous comment and try
to find a better name for this field (+ document it). How about
oobbytes_per_page?
