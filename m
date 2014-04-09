Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpYb-0004da-3w
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 10:16:39 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N3R00FY0DUYDM40@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 19:16:10 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Marek Vasut' <marex@denx.de>, 'Graham Moore' <grmoore@altera.com>
References: <1396973570-13995-1-git-send-email-grmoore@altera.com>
 <1396973570-13995-2-git-send-email-grmoore@altera.com>
 <201404091206.45967.marex@denx.de>
In-reply-to: <201404091206.45967.marex@denx.de>
Subject: Re: [PATCH] Add support for flag status register on Micron chips.
Date: Wed, 09 Apr 2014 19:16:10 +0900
Message-id: <000801cf53dc$ba81e820$2f85b860$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: ggrahammoore@gmail.com,
 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'Sascha Hauer' <s.hauer@pengutronix.de>, 'Jingoo Han' <jg1.han@samsung.com>,
 'Geert Uytterhoeven' <geert+renesas@linux-m68k.org>,
 linux-kernel@vger.kernel.org, 'Yves Vandervennet' <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, 'Insop Song' <insop.song@gainspeed.com>,
 'Alan Tull' <atull@altera.com>, 'Sourav Poddar' <sourav.poddar@ti.com>,
 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Dinh Nguyen' <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 09, 2014 7:07 PM, Marek Vasut wrote:
> On Tuesday, April 08, 2014 at 06:12:50 PM, grmoore@altera.com wrote:
> > From: Graham Moore <grmoore@altera.com>
> >
> > Some new Micron flash chips require reading the flag
> > status register to determine when operations have completed.
> >
> > Furthermore, chips with multi-die stacks of the 65nm 256Mb QSPI also
> > require reading the status register before reading the flag status
> > register.
> >
> > This patch adds support for the flag status register in the n25q512a1 and
> > n25q00 Micron QSPI flash chips.
> 
> [...]
> 
> > +static int read_fsr(struct m25p *flash)
> > +{
> > +	ssize_t retval;
> > +	u8 code = OPCODE_RDFSR;
> > +	u8 val;
> > +
> > +	retval = spi_write_then_read(flash->spi, &code, 1, &val, 1);
> > +
> > +	if (retval < 0) {
> > +		dev_err(&flash->spi->dev, "error %d reading FSR\n",
> > +				(int) retval);
> 
> Is the type-cast really needed here? Why ?

The type-cast looks clumsy.
The type of 'retval' is retval; thus, '%zd' can be used,
instead of '%d', as below.

 +		dev_err(&flash->spi->dev, "error %zd reading FSR\n",
 +				retval);


> 
> > +		return retval;
> > +	}
> > +
> > +	return val;
> > +}
> > +/*
> >   * Read configuration register, returning its value in the
> >   * location. Return the configuration register value.
> >   * Returns negative if error occured.
> > @@ -233,7 +259,7 @@ static inline int set_4byte(struct m25p *flash, u32
> > jedec_id, int enable) * Service routine to read status register until
> > ready, or timeout occurs. * Returns non-zero if error.
> >   */
> > -static int wait_till_ready(struct m25p *flash)
> > +static int _wait_till_ready(struct m25p *flash)
> 
> Please avoid using function names that start with underscore .

+1

I agree with Marek Vasut's opinion.
If there is no reason, please don't use it.

Best regards,
Jingoo Han

> [...]
> 
> Thanks!
> 
> Best regards,
> Marek Vasut
