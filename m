Received: from mail-oa0-x230.google.com ([2607:f8b0:4003:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJsCO-0002OC-Bn
 for linux-mtd@lists.infradead.org; Wed, 11 Sep 2013 21:43:45 +0000
Received: by mail-oa0-f48.google.com with SMTP id o17so9941483oag.35
 for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2013 14:43:23 -0700 (PDT)
Date: Wed, 11 Sep 2013 14:43:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 07/12] mtd: nand: return failure when failing to get
 ECC from ONFI
Message-ID: <20130911214319.GB4550@ld-irv-0074.broadcom.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
 <1378319126-24473-8-git-send-email-computersforpeace@gmail.com>
 <5227EDAD.6000808@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5227EDAD.6000808@freescale.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 05, 2013 at 10:34:21AM +0800, Huang Shijie wrote:
> 于 2013年09月05日 02:25, Brian Norris 写道:
> > If ONFI fails to provide ECC information, we should not use it. Print
> > appropriate error messages and return.
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Huang Shijie <b32955@freescale.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 7ed4841..38b8dd4 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -3010,8 +3010,13 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
> >  			chip->cmdfunc = nand_command_lp;
> >  
> >  		/* The Extended Parameter Page is supported since ONFI 2.1. */
> > -		if (nand_flash_detect_ext_param_page(mtd, chip, p))
> > -			pr_info("Failed to detect the extended param page.\n");
> > +		if (nand_flash_detect_ext_param_page(mtd, chip, p)) {
> > +			pr_info("Failed to detect ONFI extended param page\n");
> > +			return 0;
> > +		}
> > +	} else {
> > +		pr_err("Could not retrieve ONFI ECC requirements\n");
> > +		return 0;
> This return will skips the message "ONFI flash detected", could we
> remove the 'return' from this patch?

Well, the "ONFI flash detected" message is not significant at all. In
fact, it is pretty useless and should just be dropped, I think. The real
question is whether we signal ONFI detected (return 1) or failed (return
0) when ONFI doesn't report ECC properly.

There are two "return"s in my patch. Are you suggesting removing both of
them, and just warning the user of the failure?

> most of the drivers will not use the ECC info, so i think even we fail
> to detect the ECC info
> we do not need to skip the message "ONFI flash detected".

You do have a point here, that most drivers don't (yet) use the ECC
info.

> My suggestion is to use the pr_warn() to just print out the warning,
> such as:
> pr_warn("Could not retrieve ONFI ECC requirements\n");

I may turn both prints into warnings, drop both of the 'return 0' (at
least until ONFI ECC detection is more heavily relied on), and drop all
the prints that are done for the success case ("ONFI flash detected" and
"ONFI param page X valid").

> >  	}
> >  
> >  	pr_info("ONFI flash detected\n");

Brian
