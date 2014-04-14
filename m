Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZmBg-0001W4-69
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 19:05:00 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 00/11] mtd: spi-nor: misc. updates, de-duplication
Date: Mon, 14 Apr 2014 20:26:46 +0200
References: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
 <20140414182142.GS32070@ld-irv-0074>
In-Reply-To: <20140414182142.GS32070@ld-irv-0074>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404142026.46967.marex@denx.de>
Cc: Huang Shijie <b32955@freescale.com>, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, April 14, 2014 at 08:21:42 PM, Brian Norris wrote:
> On Fri, Apr 11, 2014 at 11:59:55AM -0700, Brian Norris wrote:
> > A few miscellaneous updates, cleanups, and de-duplications. Mostly
> > trivial stuff, but I had a few oversights in the first round...and in
> > the second round too :(
> > 
> > v3:
> >  - move the fsl-quadspi.c rename of
> >  
> >      SPINOR_OP_QUAD_READ => SPINOR_OP_READ_1_1_4
> >    
> >    from patch 8 to patch 3, so that the series bisects properly
> >  
> >  - add new patch 11, caught while testing with sparse
> > 
> > v2:
> >  - opcode renames to fsl-quadspi.c (missed a few; I compiled it this
> >  time!) - additional whitespace consistency cleanups
> >  - tweak documentation wording/formatting
> >  - additonal patch (patch 10), to allow building spi-nor as a module
> 
> Pushed the first 10 to l2-mtd.git/spinor. I'll revisit #11 later.
> 
> Will rebase on 3.15-rc1 soon, and likely will merge to l2-mtd.git/master
> soon enough, so we can get -next coverage and begin informing others of
> the M25P80 -> MTD_SPI_NOR dependency.

Aye aye, captain ! :)

Best regards,
Marek Vasut
