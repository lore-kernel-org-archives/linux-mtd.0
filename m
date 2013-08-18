Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAsyn-00063q-Bn
 for linux-mtd@lists.infradead.org; Sun, 18 Aug 2013 02:44:36 +0000
Received: by mail-pb0-f48.google.com with SMTP id ma3so3514547pbc.35
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 19:44:11 -0700 (PDT)
Date: Sun, 18 Aug 2013 10:48:59 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/6] Export the ECC step size to user applications
Message-ID: <20130818144853.GB3615@gmail.com>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <CAN8TOE9hNijUTxHr5t907CBRhF3oGek84jRy=t4NR9bWBOf-YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8TOE9hNijUTxHr5t907CBRhF3oGek84jRy=t4NR9bWBOf-YQ@mail.gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 17, 2013 at 11:35:28AM -0700, Brian Norris wrote:
> Hi Huang,
> 
> On Fri, Aug 16, 2013 at 10:10:03AM +0800, Huang Shijie wrote:
> > In order to implement the NAND boot for some Freescale's chips, such as
> > imx23/imx28/imx50/imx6, we use a tool (called kobs-ng) to burn the uboot
> > and some metadata to nand chip. And the ROM code will use the metadata to
> > configrate the BCH, and to find the uboot.
> >
> > The ECC information(ecc step size, ecc strength) which is used to configrate
> > the BCH is part of the metadata. The kobs-ng can gets the ecc strength from
> > the sys node /sys/*/mtdX/ecc_strength now. But it can't gets the ecc step size.
> >
> > This patch set is used to export the ecc step size to user applications.
> > With this patch set, the kobs-ng can gets the ecc step size now.
> >
> > v3 --> v4:
> > [1] rename the ecc_step to ecc_step_size.
> >
> > v2 --> v3:
> > [1] replace the nand_scan() with nand_scan_ident()/nand_scan_tail(),
> >    Let the MTD layer to do the initialization for the ECC info.
> >    removed some hack code.
> > [2] move the ONFI nand's hooks in nand_set_defaults().
> > [3] change the comments.
> > [4] misc
> >
> > v1 --> v2:
> > [1] rename the ecc_size to ecc_step.
> > [2] rebase on the latest l2-mtd.
> >
> > Huang Shijie (6):
> >   mtd: add a new field to mtd_info{}
> >   mtd: add a new sys node to show the ecc step size
> >   mtd: set the ecc step size for master/slave mtd_info
> >   mtd: set ONFI nand's default hooks in nand_set_defaults()
> >   mtd: gpmi: remove the nand_scan()
> >   mtd: update the ABI document about the ecc step size
> >
> >  Documentation/ABI/testing/sysfs-class-mtd |   10 ++++
> >  drivers/mtd/mtdcore.c                     |   11 +++++
> >  drivers/mtd/mtdpart.c                     |    1 +
> >  drivers/mtd/nand/gpmi-nand/gpmi-nand.c    |   65 +++++++++++++++-------------
> >  drivers/mtd/nand/nand_base.c              |   13 +++---
> >  include/linux/mtd/mtd.h                   |    3 +
> >  6 files changed, 67 insertions(+), 36 deletions(-)
> 
> I think we're still missing updates for a few drivers, which probably
> shouldn't have mtd->ecc_step_size == 0. For instance,
> nand/alauda.c and maybe a few others. Can you take a pass at them,
okay.  I will check it right now, and send them a email.


thanks
Huang Shijie
> Huang? Perhaps take a guess at their step size and CC relevant author(s).
> If no one cares, then maybe they can stay as zero.
> 
> Anyway, I pushed the whole series, including my edits to patch 6. I will
> amend if there are more comments.
> 
> Thanks,
> Brian
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
