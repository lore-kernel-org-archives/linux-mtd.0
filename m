Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdJZw-0004D2-Me
 for linux-mtd@lists.infradead.org; Wed, 01 Apr 2015 14:25:15 +0000
Date: Wed, 1 Apr 2015 16:24:44 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH] mtd: fsl_ifc_nand: use msecs_to_jiffies for time
 conversion
Message-ID: <20150401142444.GA12125@opentech.at>
References: <1426245828-15640-1-git-send-email-hofrat@osadl.org>
 <1162655988.11370.1427896685060.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1162655988.11370.1427896685060.JavaMail.zimbra@xes-inc.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 Joe Schultz <jschultz@xes-inc.com>, linux-mtd@lists.infradead.org,
 Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 01 Apr 2015, Aaron Sierra wrote:

> ----- Original Message -----
> > From: "Nicholas Mc Guire" <hofrat@osadl.org>
> > Sent: Friday, March 13, 2015 6:23:47 AM
> > 
> > This is only an API consolidation and should make things more readable
> > it replaces var * HZ / 1000 by msecs_to_jiffies(var) which helps readability
> > and also handles all corner-cases properly.
> > 
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > ---
> > 
> > Patch was compile tested with corenet64_smp_defconfig
> > (implies CONFIG_MTD_NAND_FSL_IFC=y)
> > 
> > Patch is against 4.0-rc3 (localversion-next is -next-20150313
> > 
> >  drivers/mtd/nand/fsl_ifc_nand.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/fsl_ifc_nand.c
> > b/drivers/mtd/nand/fsl_ifc_nand.c
> > index 4c05f4f..51394e5 100644
> > --- a/drivers/mtd/nand/fsl_ifc_nand.c
> > +++ b/drivers/mtd/nand/fsl_ifc_nand.c
> > @@ -317,7 +317,7 @@ static void fsl_ifc_run_command(struct mtd_info *mtd)
> >  
> >  	/* wait for command complete flag or timeout */
> >  	wait_event_timeout(ctrl->nand_wait, ctrl->nand_stat,
> > -			   IFC_TIMEOUT_MSECS * HZ/1000);
> > +			   msecs_to_jiffies(IFC_TIMEOUT_MSECS));
> 
> Nicholas,
> Your patch makes me think that this timeout value should be calculated
> once during initialization and stored in a new member of
> struct fsl_ifc_mtd. That would improve readability AND have some
> positive impact on performance.
>

is it not a bit wasteful to put it into struct fsl_ifc_mtd
which is used quite often in here ?

#define IFC_TIMEOUT msecs_to_jiffies(500)

sould do - its only referenced twice and would achieve what you
suggested - initializing it in one location and improved readability

	wait_event_timeout(ctrl->nand_wait, ctrl->nand_stat, IFC_TIMEOUT);

would there be any disadvantage of this solution?

thx!
hofrat
