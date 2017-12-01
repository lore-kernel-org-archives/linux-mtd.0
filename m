Date: Fri, 1 Dec 2017 10:50:53 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>, Hanna Hawa
 <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org,
 devel@driverdev.osuosl.org
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Wenyou Yang
 <wenyou.yang@atmel.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Han Xu <han.xu@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux
 <slemieux.tyco@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxim Levitsky
 <maximlevitsky@gmail.com>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Marc
 Gonzalez <marc_gonzalez@sigmadesigns.com>, Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>
Subject: Re: [PATCH 5/5] mtd: nand: add ->exec_op() implementation
Message-ID: <20171201105053.25af2267@bbrezillon>
In-Reply-To: <20171130232538.140f17b1@xps13>
References: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
 <20171130170132.27522-6-miquel.raynal@free-electrons.com>
 <20171130215025.67f74437@bbrezillon>
 <20171130232538.140f17b1@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On Thu, 30 Nov 2017 23:25:38 +0100
Miquel RAYNAL <miquel.raynal@free-electrons.com> wrote:

> > > diff --git a/drivers/mtd/nand/nand_base.c
> > > b/drivers/mtd/nand/nand_base.c index 52965a8aeb2c..46bf31aff909
> > > 100644 --- a/drivers/mtd/nand/nand_base.c
> > > +++ b/drivers/mtd/nand/nand_base.c
> > > @@ -689,6 +689,59 @@ static void nand_wait_status_ready(struct
> > > mtd_info *mtd, unsigned long timeo) };
> > >  
> > >  /**
> > > + * nand_soft_waitrdy - Read the status waiting for it to be ready
> > > + * @chip: NAND chip structure
> > > + * @timeout_ms: Timeout in ms
> > > + *
> > > + * Poll the status using ->exec_op() until it is ready unless it
> > > takes too
> > > + * much time.
> > > + *
> > > + * This helper is intended to be used by drivers without R/B pin
> > > available to
> > > + * poll for the chip status until ready and may be called at any
> > > time in the
> > > + * middle of any set of instruction. The READ_STATUS just need to
> > > ask a single
> > > + * time for it and then any read will return the status. Once the
> > > READ_STATUS
> > > + * cycles are done, the function will send a READ0 command to
> > > cancel the
> > > + * "READ_STATUS state" and let the normal flow of operation to
> > > continue.
> > > + *
> > > + * This helper *cannot* send a WAITRDY command or ->exec_op()
> > > implementations    
> > 
> > 					  ^ instruction
> >   
> > > + * using it will enter an infinite loop.    
> > 
> > Hm, not sure why this would be the case, but okay. Maybe you should
> > move this comment outside the kernel doc header, since this is an
> > implementation detail, not something the caller/user should be aware
> > of.  
> 
> Right.
> 
> > 
> > There's another important aspect to mention here: this function can
> > only be called from an ->exec_op() implementation if this
> > implementation is re-entrant.  
> 
> I do not agree with this statement: this function can be called from an
> ->exec_op() implementation even if it is not reentrant as long as it  
> does not send a WAITRDY instruction itself. No?

If the ->exec_op() implementation is not re-entrant, no,
nand_soft_waitrdy() can't be called from ->exec_op(), because then
you will re-enter ->exec_op() to execute the read_status_op(), and BOOM!

> 
> Or maybe you wanted to point that the entire ->exec_op()
> implementation must be reentrant in order to use this function in it?

Yes, what did you understand?

> 
> >   
> > > + *
> > > + * Return 0 if the NAND chip is ready, a negative error otherwise.
> > > + */
> > > +int nand_soft_waitrdy(struct nand_chip *chip, unsigned long
> > > timeout_ms) +{
> > > +	u8 status = 0;
> > > +	int ret;
> > > +
> > > +	if (!chip->exec_op)
> > > +		return -ENOTSUPP;
> > > +
> > > +	ret = nand_status_op(chip, NULL);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	timeout_ms = jiffies + msecs_to_jiffies(timeout_ms);
> > > +	do {
> > > +		ret = nand_read_data_op(chip, &status,
> > > sizeof(status), true);
> > > +		if (ret)
> > > +			break;
> > > +
> > > +		if (status & NAND_STATUS_READY)
> > > +			break;
> > > +
> > > +		udelay(100);    
> > 
> > Sounds a bit high, especially for a read page which takes around 20us.  
> 
> Well, this value is arbitrary but greping for NAND_OP_WAIT_RDY tells us
> the different timeouts with which this function is usually called, to
> get an idea of the possible wait periods: tR, tBERS, tFEAT, tPROG, tRST.
> 
> While a tR_max is 200us, a tRST_max is 250000us. That is why I choose
> 100us as period, which I found somehow well tuned for every timeout.

A timeout is different from a typical execution time. The timeout is
here as a boundary to detect when the device/controller is not
responding, so if you poll the status at the periodicity of the
timeout, you're likely to wait much more than you should have.

> But
> if you think most of the time the delay will be smaller, I will update
> the value to repeat the operation every 20us.

Well, either you do something smart that calculates a polling period
based on the timeout val (timeout / ratio), or you pick something
close to the lowest typical value. So, in our case, something like
10us, which should not be far from the typical tR value on most NANDs.

Regards,

Boris

> 
> >   
> > > +	} while	(time_before(jiffies, timeout_ms));
> > > +
> > > +	nand_exit_status_op(chip);
> > > +
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return status & NAND_STATUS_READY ? 0 : -ETIMEDOUT;
> > > +};
> > > +EXPORT_SYMBOL_GPL(nand_soft_waitrdy);
> > > +  
