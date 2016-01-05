Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aGWIz-0004YM-Ss
 for linux-mtd@lists.infradead.org; Tue, 05 Jan 2016 18:26:02 +0000
Received: by mail-pa0-x230.google.com with SMTP id uo6so199756307pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 05 Jan 2016 10:25:41 -0800 (PST)
Date: Tue, 5 Jan 2016 10:25:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Schocher <hs@denx.de>, Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH for-4.4] mtd: nand: assign reasonable default name for
 NAND drivers
Message-ID: <20160105182538.GH109450@google.com>
References: <1451934663-68925-1-git-send-email-computersforpeace@gmail.com>
 <20160104213102.4e3757d3@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160104213102.4e3757d3@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Mon, Jan 04, 2016 at 09:31:02PM +0100, Boris Brezillon wrote:
> On Mon,  4 Jan 2016 11:11:03 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > Commits such as commit 853f1c58c4b2 ("mtd: nand: omap2: show parent
> > device structure in sysfs") attempt to rely on the core MTD code to set
> > the MTD name based on the parent device. However, nand_base tries to set
> > a different default name according to the flash name (e.g., extracted
> > from the ONFI parameter page), which means NAND drivers will never make
> > use of the MTD defaults. This is not the intention of commit
> > 853f1c58c4b2.
> > 
> > This results in problems when trying to use the cmdline partition
> > parser, since the MTD name is different than expected. Let's fix this by
> > providing a default NAND name, where possible.
> > 
> > Note that this is not really a great default name in the long run, since
> > this means that if there are multiple MTDs attached to the same
> > controller device, they will have the same name. But that is an existing
> > issue and requires future work on a better controller vs. flash chip
> > abstraction to fix properly.
> 
> Yep, and IMHO, the chip numbering currently in use in most NAND
> controller drivers is not the best solution either. We should somehow
> find a way to describe the mtd id using something like:
> 
> mtd-id: <nand-controller-id>@<cs-line>
> nand-controller-id: <nand-controller-ip-name>-<ip-address>

Maybe dots ('.') instead of '@'? But otherwise, seems somewhat
reasonable. Maybe this could just be something like:

	dev_name(mtd->dev.parent) + "." + chip_select

> Anyway, let's discuss that after the nand-chip <-> nand-controller
> separation rework.

Sure.

> > Reported-by: Heiko Schocher <hs@denx.de>
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Heiko Schocher <hs@denx.de>
> > Cc: Frans Klaver <fransklaver@gmail.com>
> > ---
> > This patch is needed in additon to commit 472b444eef93 ("mtd: fix cmdlinepart
> > parser, early naming for auto-filled MTD") to fix Heiko's reported problem. At
> > this point, I'm not sure if this should be targeted toward late 4.4 or for 4.5.
> > It's a 4.4 regresssion, but a very small one. And I'm not sure if this will
> > have wide enough impact that it should be given a longer time to be reviewed
> > and tested. We can always send it to -stable later, if it's really needed.
> > 
> >  drivers/mtd/nand/nand_base.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index ece544efccc3..9f169566fba4 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -3826,6 +3826,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> >  	if (!type)
> >  		type = nand_flash_ids;
> >  
> > +	if (!mtd->name && mtd->dev.parent)
> > +		mtd->name = dev_name(mtd->dev.parent);
> > +
> 
> Just nitpicking, but I think this would be better placed in
> nand_set_defaults() or in nand_scan_ident() before nand_get_flash_type()
> call.

Hmm, nand_set_defaults() would probably be better. I'll resend this and
defer it to 4.5 (and 4.4.x).

> Anyway,
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks,
Brian
