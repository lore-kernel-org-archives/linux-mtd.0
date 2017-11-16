Received: from ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
 ([18.194.220.216] helo=sysam.it)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eFPVt-0002sK-L1
 for linux-mtd@lists.infradead.org; Thu, 16 Nov 2017 19:07:51 +0000
Received: from localhost (localhost [127.0.0.1])
 by sysam.it (Postfix) with ESMTP id E43D9218B3
 for <linux-mtd@lists.infradead.org>; Thu, 16 Nov 2017 19:07:26 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
 by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pGlvCZnxpnF for <linux-mtd@lists.infradead.org>;
 Thu, 16 Nov 2017 19:07:25 +0000 (UTC)
Received: from jerusalem (host138-222-dynamic.5-87-r.retail.telecomitalia.it
 [87.5.222.138]) by sysam.it (Postfix) with ESMTPSA id 85C5E218B2
 for <linux-mtd@lists.infradead.org>; Thu, 16 Nov 2017 19:07:25 +0000 (UTC)
Date: Thu, 16 Nov 2017 20:07:24 +0100
From: Angelo Dureghello <angelo@sysam.it>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [RESEND] mtd: spi-nor: add support for ISSI is25lp128
Message-ID: <20171116190724.cbjzmtlfjacc2u4j@jerusalem>
References: <20171116135600.6lfrbnw5j2vckheo@jerusalem>
 <20171116194311.7d648d41@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171116194311.7d648d41@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Thu, Nov 16, 2017 at 07:43:11PM +0100, Boris Brezillon wrote:
> Hello Angelo,
> 
> On Thu, 16 Nov 2017 14:56:01 +0100
> Angelo Dureghello <angelo@sysam.it> wrote:
> 
> Can you please add a commit message here?
> 

Sure, will send a v2 with a commit message in short.
To explain a bit, i am continuing Nikita Nazarenko job,
since i have here "stmark2" board with this chip, i
could test proper spi nor access and 4K and 64k erase,
as you can read here.

http://lists.infradead.org/pipermail/linux-mtd/2017-October/077225.html


> I'll let Cyrille comment on the patch itself.
> 
> Regards,
> 
> Boris

Regards,
Angelo
> 
> > Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 19c000722cbc..88cd10a0ee9e 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1005,6 +1005,7 @@ static const struct flash_info spi_nor_ids[] = {
> >  
> >  	/* ISSI */
> >  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
> > +	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024,   256, SECT_4K) },
> >  
> >  	/* Macronix */
> >  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> 
