Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcFnC-0000dk-6o
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 11:52:23 +0000
Received: by iyn15 with SMTP id 15so2267678iyn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 04:52:20 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd/nand : don't free the global data
	fsl_lbc_ctrl_dev->nand in fsl_elbc_chip_remove()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Date: Thu, 30 Jun 2011 14:53:13 +0300
In-Reply-To: <20110629114558.13975519@schlenkerla.am.freescale.net>
References: <1309225852-1664-1-git-send-email-b35362@freescale.com>
	<1309328435.23597.104.camel@sauron>
	<20110629114558.13975519@schlenkerla.am.freescale.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309434797.23597.178.camel@sauron>
Mime-Version: 1.0
Cc: linuxppc-dev@ozlabs.org, b35362@freescale.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-29 at 11:45 -0500, Scott Wood wrote:
> On Wed, 29 Jun 2011 09:20:25 +0300
> Artem Bityutskiy <dedekind1@gmail.com> wrote:
> 
> > On Tue, 2011-06-28 at 09:50 +0800, b35362@freescale.com wrote:
> > > From: Liu Shuo <b35362@freescale.com>
> > > 
> > > The global data fsl_lbc_ctrl_dev->nand don't have to be freed in
> > > fsl_elbc_chip_remove(). The right place to do that is in fsl_elbc_nand_remove()
> > > if elbc_fcm_ctrl->counter is zero.
> > > 
> > > Signed-off-by: Liu Shuo <b35362@freescale.com>
> > > ---
> > >  drivers/mtd/nand/fsl_elbc_nand.c |    1 -
> > >  1 files changed, 0 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
> > > index 0bb254c..a212116 100644
> > > --- a/drivers/mtd/nand/fsl_elbc_nand.c
> > > +++ b/drivers/mtd/nand/fsl_elbc_nand.c
> > > @@ -829,7 +829,6 @@ static int fsl_elbc_chip_remove(struct fsl_elbc_mtd *priv)
> > >  
> > >  	elbc_fcm_ctrl->chips[priv->bank] = NULL;
> > >  	kfree(priv);
> > > -	kfree(elbc_fcm_ctrl);
> > >  	return 0;
> > >  }
> > 
> > Do we have to assign fsl_lbc_ctrl_dev->nand to NULL in
> > fsl_elbc_nand_remove() then? I think that assignment can be killed then.
> > 
> >         if (!elbc_fcm_ctrl->counter) {
> >                 fsl_lbc_ctrl_dev->nand = NULL;
> >                 kfree(elbc_fcm_ctrl);
> >         }
> > 
> 
> If we're freeing fsl_lbc_ctrl, we'd better get rid of references to it...

Yes, on the one hand this is a good defensive programming practice, on
the other hand it hides double-free bugs. Like this patch fixes a
double-free bug, and why it was noticed before? I thought may be because
of this NULL assignment?

I do not insist though, that was just a suggestion/question.

-- 
Best Regards,
Artem Bityutskiy
