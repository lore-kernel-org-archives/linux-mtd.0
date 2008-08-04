Received: from mho-01-bos.mailhop.org ([63.208.196.178])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KQ1LS-0004M4-Qa
	for linux-mtd@lists.infradead.org; Mon, 04 Aug 2008 14:47:34 +0000
Date: Mon, 4 Aug 2008 17:24:30 +0300
From: Tony Lindgren <tony@atomide.com>
To: "Kamat, Nishant" <nskamat@ti.com>
Subject: Re: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <20080804142426.GK8885@atomide.com>
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<DFEF307E035C8647B119E6A60DB62D4AE47C155A@dlee02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFEF307E035C8647B119E6A60DB62D4AE47C155A@dlee02.ent.ti.com>
Cc: Kyungmin Park <kmpark@infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Kamat, Nishant <nskamat@ti.com> [080703 14:55]:
> Hi,
> 
> 
> > Kyungmin Park on July 02, 2008 4:57 AM, wrote:
> >
> > Hi,
> >
> > It's should be sent to MTD list. and we also fix the NOR similar ways.
> > It's already posted but not committed.
> 
> 
> Posting the patch on MTD list. Please merge.

Looks like this driver does not exist outside linux-omap tree, care to
send the whole driver to MTD list?

Pushing this fix to linux-omap tree meanwhile.

Tony


> ---< Cut here >---
> 
> From: Nishant Kamat <nskamat@ti.com>
> 
> This patch fixes the omap2 nand driver code that allows
> reading of partition data from board info.
> 
> The parse_mtd_partitions() function no longer returns a
> negative error in case cmdline is not passed.
> See commit: b0d06afb607
> 
> Signed-off-by: Nishant Kamat <nskamat@ti.com>
> ---
>  drivers/mtd/nand/omap2.c |    2 +-
>  1 files changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-omap-ti.ldp/drivers/mtd/nand/omap2.c
> ===================================================================
> --- linux-omap-ti.ldp.orig/drivers/mtd/nand/omap2.c     2008-06-30 22:01:50.000000000 +0530
> +++ linux-omap-ti.ldp/drivers/mtd/nand/omap2.c  2008-06-30 22:03:34.446471469 +0530
> @@ -699,7 +699,7 @@
>         err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
>         if (err > 0)
>                 add_mtd_partitions(&info->mtd, info->parts, err);
> -       else if (err < 0 && pdata->parts)
> +       else if (pdata->parts)
>                 add_mtd_partitions(&info->mtd, pdata->parts, pdata->nr_parts);
>         else
>  #endif
