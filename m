Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VC3S9-0002ZD-Ke
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2013 08:07:42 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RESEND][PATCH] mtd: chips: Add support for PMC SPI Flash chips
 in m25p80.c
Date: Wed, 21 Aug 2013 10:07:17 +0200
References: <51E3CB64.4080107@wanadoo.fr> <201308210941.38483.marex@denx.de>
 <20130821075903.GC31788@brian-ubuntu>
In-Reply-To: <20130821075903.GC31788@brian-ubuntu>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201308211007.18051.marex@denx.de>
Cc: linux-mtd@lists.infradead.org, Michel Stempin <michel.stempin@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> On Wed, Aug 21, 2013 at 09:41:38AM +0200, Marek Vasut wrote:
> > Dear Brian Norris,
> > 
> > > + Marek, since he's been reviewing (with dismay?) the increase in macro
> > > flags in this driver. If there are any objections, I can amend/drop the
> > > patch.
> > 
> > Hmmm ... this SECT_4K_PMC seems too combined to me. Why don't we use the
> > SECT_4K flag and another flag to indicate it's a PMC part? Even better,
> > I recall you can
> 
> Separating manufacturer from SECT_4K sounds good, but it really doesn't
> buy us much. See my next comments.

I see, that's really bad news. Thanks for the explanation!

I guess there really is nothing much we can do about such parts. But then if we 
take device tree probe into consideration, we might actually want to match the 
part name to discern the PMS device. Or am I talking complete nonsense?

Best regards,
Marek Vasut
