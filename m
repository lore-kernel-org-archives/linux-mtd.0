Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6Dhn-0000I5-2Q
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2015 08:33:05 +0000
Date: Tue, 8 Dec 2015 09:32:40 +0100
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jespern@axis.com>, linux-mtd@lists.infradead.org,
 linux-cris-kernel@axis.com
Subject: Re: [PATCH v2 03/25] cris: nand: make use of mtd_to_nand() where
 appropriate
Message-ID: <20151208083240.GP22903@axis.com>
References: <1448967802-25796-1-git-send-email-boris.brezillon@free-electrons.com>
 <1448967802-25796-4-git-send-email-boris.brezillon@free-electrons.com>
 <20151208032740.GR120110@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151208032740.GR120110@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 07, 2015 at 07:27:40PM -0800, Brian Norris wrote:
> (Reducing CC)
> 
> Hi Mikael and Jesper,
> 
> On Tue, Dec 01, 2015 at 12:03:00PM +0100, Boris Brezillon wrote:
> > mtd_to_nand() was recently introduced to avoid direct accesses to the
> > mtd->priv field. Update all CRIS specific implementations to use this
> > helper.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 2 +-
> >  arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> > index 7fb5212..db953cf 100644
> > --- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> > +++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
> > @@ -52,7 +52,7 @@ static void crisv32_hwcontrol(struct mtd_info *mtd, int cmd,
> >  {
> >  	unsigned long flags;
> >  	reg_pio_rw_dout dout;
> > -	struct nand_chip *this = mtd->priv;
> > +	struct nand_chip *this = mtd_to_nand(mtd);
> >  
> >  	local_irq_save(flags);
> >  
> > diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> > index e032384..22a6467 100644
> > --- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> > +++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
> > @@ -51,7 +51,7 @@ static void crisv32_hwcontrol(struct mtd_info *mtd, int cmd,
> >  {
> >  	unsigned long flags;
> >  	reg_gio_rw_pa_dout dout;
> > -	struct nand_chip *this = mtd->priv;
> > +	struct nand_chip *this = mtd_to_nand(mtd);
> >  
> >  	local_irq_save(flags);
> >  
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> This patch and patch 18 touch arch/cris/ marginally. It's a little
> complicated to give you all the dependencies for the later stuff without
> bringing in a bunch of MTD stuff. I plan to take them both to MTD
> directly. An ack would be nice.

Sure, looks good, and thanks for the reminder.

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Regards,
> Brian

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
