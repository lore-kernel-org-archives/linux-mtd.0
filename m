Received: from ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
 ([18.194.220.216] helo=sysam.it)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eK0dq-0001lO-2Q
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 11:35:03 +0000
Date: Wed, 29 Nov 2017 12:34:34 +0100
From: Angelo Dureghello <angelo@sysam.it>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com
Subject: Re: [PATCH v3] mtd: spi-nor: add support for ISSI is25lp128
Message-ID: <20171129113433.4i2fwd5onv23dbj7@jerusalem>
References: <20171118234822.ijchd2cmvc6elerq@jerusalem>
 <3d1c7e75-21c8-ad00-58b4-ba2647bcc91e@wedev4u.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d1c7e75-21c8-ad00-58b4-ba2647bcc91e@wedev4u.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

thanks for reviewing,

On Wed, Nov 29, 2017 at 11:58:37AM +0100, Cyrille Pitchen wrote:
> Hi Angelo,
> 
> Le 19/11/2017 à 00:48, Angelo Dureghello a écrit :
> > Add support for ISSI is25lp128 spi nor flash.
> > 
> > Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> > ---
> > Changes for v2:
> >    - add commit message.
> > Changes for v3:
> >    - add SPI_NOR_DUAL_READ flag.
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 19c000722cbc..b987353440ea 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1005,6 +1005,8 @@ static const struct flash_info spi_nor_ids[] = {
> >  
> >  	/* ISSI */
> >  	{ "is25cd512", INFO(0x7f9d20, 0, 32 * 1024,   2, SECT_4K) },
> > +	{ "is25lp128", INFO(0x9d6018, 0, 64 * 1024,   256,
> 
> If you don't mind, I will align figures in the column for the number of
> sectors before applying your patch.
> 
> Otherwise, it looks good.
> 
Feel free to realign the code as you prefer, or if you prefer i can
also send v4.

> Best regards,
> 
> Cyrille
> > +			SECT_4K | SPI_NOR_DUAL_READ) },
> >  
Best regards,
Angelo Dureghello

> >  	/* Macronix */
> >  	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
> > 
> 
