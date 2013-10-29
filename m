Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vb9rP-0008Kh-RK
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2013 14:01:33 +0000
From: Marek Vasut <marex@denx.de>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
Date: Tue, 29 Oct 2013 15:01:05 +0100
References: <1382693145-15750-1-git-send-email-sourav.poddar@ti.com>
 <201310271745.17152.marex@denx.de> <526F4E53.1050706@ti.com>
In-Reply-To: <526F4E53.1050706@ti.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201310291501.06051.marex@denx.de>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Sourav Poddar,

> Hi,
> 
> On Sunday 27 October 2013 10:15 PM, Marek Vasut wrote:
> > Dear Sourav Poddar,
> > 
> > [...]
> > 
> >> +static int macronix_quad_enable(struct m25p *flash)
> >> +{
> >> +	int ret, val;
> >> +	u8 cmd[2];
> >> +	cmd[0] = OPCODE_WRSR;
> >> +
> >> +	val = read_sr(flash);
> >> +	cmd[1] = val | SR_QUAD_EN_MX;
> >> +	write_enable(flash);
> >> +
> >> +	spi_write(flash->spi,&cmd, 2);
> >> +
> >> +	if (wait_till_ready(flash))
> >> +		return 1;
> >> +
> >> +	ret = read_sr(flash);
> > 
> > Maybe read_sr() and read_cr() shall be fixed to return retval only and
> > the val shall be passed to them as an argument pointer? Aka. ret =
> > read_sr(flash,&val);
> > 
> > That way, this dangerous construct below could become:
> > 
> > if (!(val&  SR_....)) {
> > 
> > 	dev_err();
> > 	ret = -EINVAL;
> > 
> > }
> > 
> > return ret;
> 
> I was trying to work on it and realise, we dont need to pass val directly.
> We can continue returning the val and can still cleanup the below code as
> u suggetsed above.
> if (!(ret & SR_....)) {
>      dev_err();
>      ret = -EINVAL;
> }

Uh oh, no. This doesn't seem right. I'd like to be able to clearly check if the 
function failed to read the register altogether OR if not, check the returned 
value of the register. Mixing these two together won't do us good. But maybe I 
just fail to understand your proposal, if so, then I appologize.

[...]

Best regards,
Marek Vasut
