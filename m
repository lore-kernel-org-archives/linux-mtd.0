Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh1oz-000795-GY
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 14:21:14 +0000
Received: by fxm1 with SMTP id 1so5088204fxm.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Feb 2010 06:21:08 -0800 (PST)
Subject: Re: [PATCH 1/1] mtd: nand: move the checking the validity of oob
	into nand_write_oob
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dedekind1@gmail.com
In-Reply-To: <1266242822.11659.96.camel@localhost>
References: <1265267917-2487-1-git-send-email-stanley.miao@windriver.com>
	<1265267917-2487-2-git-send-email-stanley.miao@windriver.com>
	<1266242822.11659.96.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 15 Feb 2010 16:21:04 +0200
Message-ID: <1266243664.13872.0.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Stanley.Miao" <stanley.miao@windriver.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-15 at 16:07 +0200, Artem Bityutskiy wrote: 
> On Thu, 2010-02-04 at 15:18 +0800, Stanley.Miao wrote:
> > nand_write_oob will invoke nand_do_write_oob or nand_do_write_ops depending
> > on if ops->datbuf is NULL. nand_do_write_oob checked the validity of oob
> > but nand_do_write_ops didn't. Now move the check into nand_write_oob to
> > ensure the validity of oobbuf.
> > 
> > Signed-off-by: Stanley.Miao <stanley.miao@windriver.com>
> > ---
> >  drivers/mtd/nand/nand_base.c |   69 ++++++++++++++++++++++-------------------
> >  1 files changed, 37 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 8f2958f..29e2a06 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2113,40 +2113,9 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
> >  static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
> >  			     struct mtd_oob_ops *ops)
> >  {
> 
> ...
> 
> > @@ -2203,6 +2172,42 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
> >  		return -EINVAL;
> >  	}
> >  
> > +	if (ops->oobbuf) {
> > +		int len;
> > +		DEBUG(MTD_DEBUG_LEVEL3, "%s: to = 0x%08x, ooblen = %i\n",
> > +				__func__, (unsigned int)to, (int)ops->ooblen);
> 
> Why this check is not done for !obs->oobbuf cas as well?
> 
> 

I address this and other problems in my patchset, please test if it
works.

Best regards,
Maxim Levitsky
