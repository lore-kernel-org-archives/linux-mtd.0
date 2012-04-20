Received: from 2.mo3.mail-out.ovh.net ([46.105.75.36]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLAB1-0004Uf-Hc
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2012 09:30:52 +0000
Received: from mail622.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id F1D76FF954D
 for <linux-mtd@lists.infradead.org>; Fri, 20 Apr 2012 11:32:15 +0200 (CEST)
Date: Fri, 20 Apr 2012 11:11:48 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: "Xu, Hong" <Hong.Xu@atmel.com>
Subject: Re: [PATCH v4 2/2] MTD: AT91: Update atmel_nand_data to support PMECC
Message-ID: <20120420091148.GZ16641@game.jcrosoft.org>
References: <1334906788-18704-1-git-send-email-hong.xu@atmel.com>
 <1334906788-18704-2-git-send-email-hong.xu@atmel.com>
 <20120420082729.GY16641@game.jcrosoft.org>
 <A92DB5DF46DBC241980A99BFD8A00AEE0F62D6EE@penmbx01>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A92DB5DF46DBC241980A99BFD8A00AEE0F62D6EE@penmbx01>
Cc: "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09:24 Fri 20 Apr     , Xu, Hong wrote:
> 
> 
> > -----Original Message-----
> > From: Jean-Christophe PLAGNIOL-VILLARD [mailto:plagnioj@jcrosoft.com]
> > Sent: Friday, April 20, 2012 4:27 PM
> > To: Xu, Hong
> > Cc: linux-mtd@lists.infradead.org; linux-arm-kernel@lists.infradead.org;
> > dedekind1@gmail.com; Ferre, Nicolas
> > Subject: Re: [PATCH v4 2/2] MTD: AT91: Update atmel_nand_data to support PMECC
> > 
> > On 15:26 Fri 20 Apr     , Hong Xu wrote:
> > > Added two items,
> > > * correction_cap: PMECC correction capability
> > > * sector_size:    Sector size for PMECC
> > >
> > > Signed-off-by: Hong Xu <hong.xu@atmel.com>
> > > ---
> > >  include/linux/platform_data/atmel.h |    2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/linux/platform_data/atmel.h
> > b/include/linux/platform_data/atmel.h
> > > index b0f2c56..4d9bfd5 100644
> > > --- a/include/linux/platform_data/atmel.h
> > > +++ b/include/linux/platform_data/atmel.h
> > > @@ -20,6 +20,8 @@ struct atmel_nand_data {
> > >  	u8		bus_width_16;		/* buswidth is 16 bit */
> > >  	u8		ecc_mode;		/* ecc mode */
> > >  	u8		on_flash_bbt;		/* bbt on flash */
> > > +	u8		correction_cap;		/* PMECC capability */
> > > +	u16		sector_size;		/* Sector size for PMECC */
> > as this only used by DT
> > no need to expose it
> > 
> 
> OK, we could put those into struct Atmel_nand_host. But this means PMECC will totally rely on DT.
yes as none of the non dt-only soc use it

Best Regards,
J.
