Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsXnZ-0002Z0-6b
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2013 13:01:26 +0000
Received: by mail-pd0-f176.google.com with SMTP id w10so5287031pde.21
 for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2013 05:01:01 -0800 (PST)
Date: Mon, 16 Dec 2013 21:00:50 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Elie De Brauwer <eliedebrauwer@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Deal with bitflips in erased regions regions
Message-ID: <20131216130048.GA1155@gmail.com>
References: <1387133061-6573-1-git-send-email-eliedebrauwer@gmail.com>
 <1387133061-6573-2-git-send-email-eliedebrauwer@gmail.com>
 <20131216043040.GB27109@shlinux2.ap.freescale.net>
 <CAGWqfij_FQrXoBkhsL-noMxHyJV1yOyj8BO+ABCZFMP8Hv5upA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGWqfij_FQrXoBkhsL-noMxHyJV1yOyj8BO+ABCZFMP8Hv5upA@mail.gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 16, 2013 at 10:43:34AM +0100, Elie De Brauwer wrote:
> On Mon, Dec 16, 2013 at 5:30 AM, Huang Shijie <b32955@freescale.com> wrote:
 >> +/* Returns 1 if the last transaction consisted only out of ones. */
> >> +int gpmi_allones(struct gpmi_nand_data *this)
> >> +{
> >> +     struct resources *r = &this->resources;
> >> +     uint32_t reg = readl(r->gpmi_regs + HW_BCH_STATUS0);
> > please add a empty line here.
> >> +     if (reg & BM_BCH_STATUS0_ALLONES_MASK)
> >> +             return 1;
> >> +     return 0;
> > We can simplify the code to:
> >         return reg & BM_BCH_STATUS0_ALLONES_MASK;
> >
> 
> I was doing some stress testing on this piece of code today, but I'm
> afraid the ALLONES solution apparently does not work. If I look at the
> BCH_STATUS0 register while doing some heavy flash access, the
> (entire) register remains zero at all times, while I would at least expect the
how do you do the stress test, and how do you know the register is zero?

I can test it on my side too.

thanks
Huang Shijie
