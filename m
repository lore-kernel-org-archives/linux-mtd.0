Received: from smtprelay0168.hostedemail.com ([216.40.44.168]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0bjs-0008Ho-40
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 22:36:49 +0000
Message-ID: <1492554972.8661.51.camel@perches.com>
Subject: Re: [PATCH v2 2/3] mtd: dataflash: Improve coding style in
 jedec_probe()
From: Joe Perches <joe@perches.com>
To: Marek Vasut <marek.vasut@gmail.com>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, linux-mtd@lists.infradead.org
Cc: cphealy@gmail.com, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
In-Reply-To: <32615ada-eddc-3911-17bf-32f6897c77e1@gmail.com>
References: <20170418142127.23301-1-andrew.smirnov@gmail.com>
 <20170418142127.23301-2-andrew.smirnov@gmail.com>
 <32615ada-eddc-3911-17bf-32f6897c77e1@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Date: Tue, 18 Apr 2017 15:36:12 -0700
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-04-18 at 20:25 +0200, Marek Vasut wrote:
> On 04/18/2017 04:21 PM, Andrey Smirnov wrote:
> > As per request from Marek Vasut, change the following:
> 
> Does that really have to be in the commit message ? ^_^'
> 
> >    - Replace indentation between type and name of local variable from
> >      tabs to spaces
> > 
> >    - Replace magic number 0x1F with CFI_MFR_ATMEL macro
> > 
> >    - Replace variable 'tmp' with 'ret' and 'i' where appropriate
> > 
> >    - Reformat multi-line comments and add newlines where appropriate
> > 
> > No functional change intended.
> 
> Appreciated, thanks!

trivia:

> > diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
[]
> > @@ -768,9 +771,9 @@ static struct flash_info *jedec_probe(struct spi_device *spi)
> >  	jedec = jedec << 8;
> >  	jedec |= id[2];
> >  
> > -	for (tmp = 0, info = dataflash_data;
> > -			tmp < ARRAY_SIZE(dataflash_data);
> > -			tmp++, info++) {
> > +	for (i = 0, info = dataflash_data;
> > +			i < ARRAY_SIZE(dataflash_data);
> > +			i++, info++) {
> >  		if (info->jedec_id == jedec) {
> >  			pr_debug("%s: OTP, sector protect%s\n",
> >  				dev_name(&spi->dev),

This loop could be written without the i variable.

	for (info = dataflash_data;
	     info < dataflash_data + ARRAY_SIZE(dataflash_data);
	     info++) {
