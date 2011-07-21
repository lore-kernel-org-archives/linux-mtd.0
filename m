Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qjwll-0001H5-4H
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2011 17:10:49 +0000
Date: Thu, 21 Jul 2011 18:10:20 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Varun Wadekar <vwadekar@nvidia.com>
Subject: Re: [PATCH] mtd: s3c2410 nand: Remove uncessary null check
Message-ID: <20110721171020.GE20310@n2100.arm.linux.org.uk>
References: <1311230038-6111-1-git-send-email-jhbird.choi@samsung.com>
	<4E27CD14.4090702@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E27CD14.4090702@nvidia.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Kukjin Kim <kgene.kim@samsung.com>,
	"jhbird.choi@samsung.com" <jhbird.choi@samsung.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 21, 2011 at 12:24:12PM +0530, Varun Wadekar wrote:
> On Thursday 21 July 2011 12:03 PM, jhbird.choi@samsung.com wrote:
> > From: Jonghwan Choi <jhbird.choi@samsung.com>
> >
> > clk_get() return a pointer to the struct clk or an ERR_PTR().
> >
> > Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> > ---
> >  drivers/mtd/nand/s3c2410.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
> > index 4405468..18ff2f5 100644
> > --- a/drivers/mtd/nand/s3c2410.c
> > +++ b/drivers/mtd/nand/s3c2410.c
> > @@ -723,7 +723,7 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
> >  
> >  	/* free the common resources */
> >  
> > -	if (info->clk != NULL && !IS_ERR(info->clk)) {
> > +	if (!IS_ERR(info->clk)) {
> 
> I think you should use IS_ERR_OR_NULL instead.

No.  Jonghwan Choi's patch is correct.

As per the patch description, the only error value which a driver can
attribute any problem with is something which passes IS_ERR().  Everything
else the driver must treat as a _valid_ struct clk - and the clk API
implementation must accept non-IS_ERR() clk_get() values.
