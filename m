Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAvE5-0004En-So
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 11:03:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id q5-v6so12966360wrw.12
 for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2018 04:03:14 -0700 (PDT)
Message-ID: <cdc8194047bc0118f130d4b31e3f07772e657b09.camel@gmail.com>
Subject: Re: [PATCH] mtd: spinand: winbond: Add support for W25N01GV
From: Robert Marko <robimarko@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 12 Oct 2018 13:03:11 +0200
In-Reply-To: <20181012110412.000a932c@bbrezillon>
References: <20181006153642.10376-1-robimarko@gmail.com>
 <20181012110412.000a932c@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2018-10-12 at 11:04 +0200, Boris Brezillon wrote:
> +Miquel
> 
> Hi Robert,
> 
> Please Cc the NAND mantainers when you send a NAND related patch
> (in case you don't know about it already, scripts/get_maintainer.pl
> should help you find who to Cc).
> 
Sorry, I knew about scripts/get_maintainer.pl but completelly forgot
about it this time.

> On Sat,  6 Oct 2018 17:36:42 +0200
> Robert Marko <robimarko@gmail.com> wrote:
> 
> > W25N01GV is a single die version of the already supported
> > W25M02GV with half the capacity. Everything else is the
> > same so introduce support for W25N01GV.
> > 
> > Datasheet:
> > http://www.winbond.com/resource-files/w25n01gv%20revl%20050918%20unsecured.pdf
> > 
> > Tested on 8devices Jalapeno dev board under OpenWrt running 4.19-
> > rc5.
> > 
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> 
> Looks good.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> > ---
> >  drivers/mtd/nand/spi/winbond.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > --- a/drivers/mtd/nand/spi/winbond.c
> > +++ b/drivers/mtd/nand/spi/winbond.c
> > @@ -84,6 +84,14 @@ static const struct spinand_info winbond
> >  		     0,
> >  		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL),
> >  		     SPINAND_SELECT_TARGET(w25m02gv_select_target)),
> > +	SPINAND_INFO("W25N01GV", 0xAA,
> > +		     NAND_MEMORG(1, 2048, 64, 64, 1024, 1, 1, 1),
> > +		     NAND_ECCREQ(1, 512),
> > +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> > +					      &write_cache_variants,
> > +					      &update_cache_variants),
> > +		     0,
> > +		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
> >  };
> >  
> >  /**
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
