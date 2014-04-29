Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfDUM-0000FJ-Uy
 for linux-mtd@lists.infradead.org; Tue, 29 Apr 2014 19:14:49 +0000
Received: by mail-pa0-f45.google.com with SMTP id kq14so674837pab.32
 for <linux-mtd@lists.infradead.org>; Tue, 29 Apr 2014 12:14:23 -0700 (PDT)
Date: Tue, 29 Apr 2014 12:14:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH] mtd: nand: fix a typo in a comment line
Message-ID: <20140429191417.GC9418@norris-Latitude-E6410>
References: <1397028386-16304-1-git-send-email-yamada.m@jp.panasonic.com>
 <20140416072311.GC5512@norris-Latitude-E6410>
 <20140417185914.6CE8.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140417185914.6CE8.AA925319@jp.panasonic.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 17, 2014 at 06:59:16PM +0900, Masahiro Yamada wrote:
> On Wed, 16 Apr 2014 00:23:11 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> > On Wed, Apr 09, 2014 at 04:26:26PM +0900, Masahiro Yamada wrote:
> > > Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> > > ---
> > >  drivers/mtd/nand/nand_base.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > > index 9d01c4d..33ec641 100644
> > > --- a/drivers/mtd/nand/nand_base.c
> > > +++ b/drivers/mtd/nand/nand_base.c
> > > @@ -3607,7 +3607,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
> > >  
> > >  	chip->onfi_version = 0;
> > >  	if (!type->name || !type->pagesize) {
> > > -		/* Check is chip is ONFI compliant */
> > > +		/* Check if the chip is ONFI compliant */
> > 
> > Really? We don't spell out "the chip" every time we refer to "chip". I
> > think this is just fine as-is.
> 
> I am fixing two things here.
...

My apologies. Apparently I can't tell the difference between "is" and
"if". This patch is fine!

Pushed to l2-mtd.git!

Thanks,
Brian
