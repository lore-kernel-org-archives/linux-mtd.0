Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFroI-0004bE-DJ
	for linux-mtd@lists.infradead.org; Fri, 29 Apr 2011 17:48:59 +0000
Received: by ewy3 with SMTP id 3so1405832ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Apr 2011 10:48:56 -0700 (PDT)
Subject: RE: [RFC] mtd: nand: Fix bad block identification issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Saxena, Parth" <parth.saxena@ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E739404E1A21866@dbde02.ent.ti.com>
References: <1303906161-24175-1-git-send-email-parth.saxena@ti.com>
	<1304011843.2737.3.camel@localhost>
	<19F8576C6E063C45BE387C64729E739404E1A21866@dbde02.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 29 Apr 2011 20:44:44 +0300
Message-ID: <1304099084.2737.59.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Basheer, Mansoor Ahamed" <mansoor.ahamed@ti.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-29 at 19:52 +0530, Saxena, Parth wrote:
> 
> > -----Original Message-----
> > From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> > Sent: Thursday, April 28, 2011 11:01 PM
> > To: Saxena, Parth; Brian Norris
> > Cc: linux-mtd@lists.infradead.org; Basheer, Mansoor Ahamed; linux-
> > omap@vger.kernel.org
> > Subject: Re: [RFC] mtd: nand: Fix bad block identification issue
> > 
> > On Wed, 2011-04-27 at 17:39 +0530, Saxena, Parth wrote:
> > > This patch solves the above issue for omap by initialising
> > > badblockbits. We are working further on this to find a generic fix
> > > to the problem in nand_base.c.
> > 
> > But it looks like the generic solution is to return the line which was
> > accidentally removed, how about this patch
> > 
> > From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Date: Thu, 28 Apr 2011 20:26:59 +0300
> > Subject: [PATCH] mtd: return badblockbits back
> > 
> > In commit c7b28e25cb9beb943aead770ff14551b55fa8c79 the initialization of
> > the backblockbits was accidentally removed. This patch returns it back,
> > because otherwise some NAND drivers are broken.
> > 
> > This problem was reported by "Saxena, Parth <parth.saxena@ti.com>" here:
> > http://lists.infradead.org/pipermail/linux-mtd/2011-April/035221.html
> > 
> > Reported-by: Saxena, Parth <parth.saxena@ti.com>
> > Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Cc: stable@kernel.org [2.6.36+]
> > ---
> >  drivers/mtd/nand/nand_base.c |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 15510f2..5a7f817 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -3106,6 +3106,8 @@ ident_done:
> >  		chip->chip_shift += 32 - 1;
> >  	}
> > 
> > +	chip->badblockbits = 8;
> > +
> >  	/* Set the bad block position */
> >  	if (mtd->writesize > 512 || (busw & NAND_BUSWIDTH_16))
> >  		chip->badblockpos = NAND_LARGE_BADBLOCK_POS;
> [Saxena, Parth] 
> 
> Tested-By: Saxena, Parth <parth.saxena@ti.com>
> Acked By: Saxena, Parth <parth.saxena@ti.com>

Thanks, pushing to the l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
