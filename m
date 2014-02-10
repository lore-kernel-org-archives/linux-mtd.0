Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCvtX-00085W-9j
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2014 18:47:51 +0000
Received: by mail-ig0-f181.google.com with SMTP id j1so7183468iga.2
 for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2014 10:47:30 -0800 (PST)
Date: Mon, 10 Feb 2014 10:47:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "B48286@freescale.com" <B48286@freescale.com>
Subject: Re: [PATCH] mtd: m25p80: Make the name of mtd_info fixed
Message-ID: <20140210184726.GC18440@ld-irv-0074>
References: <1388990069-27066-1-git-send-email-b48286@freescale.com>
 <20140123021213.GZ8919@ld-irv-0074>
 <66941b677b7e4b8d9ce4cc44304b0955@DM2PR03MB301.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66941b677b7e4b8d9ce4cc44304b0955@DM2PR03MB301.namprd03.prod.outlook.com>
Cc: Scott Wood <scottwood@freescale.com>,
 "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 "Mingkai.Hu@freescale.com" <Mingkai.Hu@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hou,

On Thu, Jan 23, 2014 at 03:29:41AM +0000, B48286@freescale.com wrote:
> > -----Original Message-----
> > From: Brian Norris [mailto:computersforpeace@gmail.com]
> > Sent: Thursday, January 23, 2014 10:12 AM
> > To: Hou Zhiqiang-B48286
> > Cc: linux-mtd@lists.infradead.org; linuxppc-dev@ozlabs.org; Wood Scott-
> > B07421; Hu Mingkai-B21284; Ezequiel Garcia
> > Subject: Re: [PATCH] mtd: m25p80: Make the name of mtd_info fixed
> > 
> > On Mon, Jan 06, 2014 at 02:34:29PM +0800, Hou Zhiqiang wrote:
> > > --- a/drivers/mtd/devices/m25p80.c
> > > +++ b/drivers/mtd/devices/m25p80.c
> > > @@ -1012,7 +1012,8 @@ static int m25p_probe(struct spi_device *spi)
> > >  	if (data && data->name)
> > >  		flash->mtd.name = data->name;
> > >  	else
> > > -		flash->mtd.name = dev_name(&spi->dev);
> > > +		flash->mtd.name = kasprintf(GFP_KERNEL, "%s.%d",
> > > +				id->name, spi->chip_select);
> > 
> > Changing the mtd.name may have far-reaching consequences for users who
> > already have mtdparts= command lines. But your concern is probably valid
> > for dynamically-determined bus numbers. Perhaps you can edit this patch
> > to only change the name when the busnum is dynamically-allocated?
> >
> It's a good idea, but in the case of mtd_info's name dynamically-allocated
> using "mtdparts=..." in command lines is illegal obviously.

I agree that users should never have relied on the dynamically-allocated
name. But changing the name for non-dynamic schemes (e.g., where the SPI
busnum is a fixed value) is not pleasant for users.

> Would you tell
> me what side-effect will be brought by the change of mtd_info's name.

I can only think of the mtdparts= command line. Otherwise, I don't think
the name is very important.

Brian
