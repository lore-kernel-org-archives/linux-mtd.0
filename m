Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Waj6e-0007TM-TW
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 09:59:46 +0000
Date: Thu, 17 Apr 2014 18:59:16 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: fix a typo in a comment line
In-Reply-To: <20140416072311.GC5512@norris-Latitude-E6410>
References: <1397028386-16304-1-git-send-email-yamada.m@jp.panasonic.com>
 <20140416072311.GC5512@norris-Latitude-E6410>
Message-Id: <20140417185914.6CE8.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,


On Wed, 16 Apr 2014 00:23:11 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Wed, Apr 09, 2014 at 04:26:26PM +0900, Masahiro Yamada wrote:
> > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 9d01c4d..33ec641 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -3607,7 +3607,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> >  
> >  	chip->onfi_version = 0;
> >  	if (!type->name || !type->pagesize) {
> > -		/* Check is chip is ONFI compliant */
> > +		/* Check if the chip is ONFI compliant */
> 
> Really? We don't spell out "the chip" every time we refer to "chip". I
> think this is just fine as-is.


I am fixing two things here.

 [1] Replace "Check is"  with "Check if"
 [2] Add "the"

Do you think that is fine as-is  for both items?

My main motivation is to fix [1].
Since I am not a native speaker, I am not sure about [2].

I am just following another comment a few lines below:
  /* Check if the chip is JEDEC compliant */



                /* Check is chip is ONFI compliant */
                if (nand_flash_detect_onfi(mtd, chip, &busw))
                        goto ident_done;

                /* Check if the chip is JEDEC compliant */     <------
                if (nand_flash_detect_jedec(mtd, chip, &busw))
                        goto ident_done;
        }





Best Regards
Masahiro Yamada
