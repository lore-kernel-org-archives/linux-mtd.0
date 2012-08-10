Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzeEu-0008V2-Ku
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2012 01:42:13 +0000
From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: Kernel crashes when CONFIG_MTD_NAND_VERIFY_WRITE=y
Date: Fri, 10 Aug 2012 03:42:10 +0200
References: <CAOMZO5DuG9m-SCPPxza=VFMmcWrGnp3Brry6nS8XHrCSzQqM7g@mail.gmail.com>
 <CAOMZO5BCjV6iLUiQ74GskkOdgGpdqbo2ZB=7eu6VeY=mNwWf0Q@mail.gmail.com>
 <201208100341.23167.marex@denx.de>
In-Reply-To: <201208100341.23167.marex@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201208100342.11194.marex@denx.de>
Cc: Shawn Guo <shawn.guo@linaro.org>, Subodh Nijsure <snijsure@grid-net.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Marek Vasut,

> Dear Fabio Estevam,
> 
> > Hi Marek,
> > 
> > On Thu, Aug 9, 2012 at 8:53 PM, Marek Vasut <marex@denx.de> wrote:
> > > This problem is there because the GPMI NAND code doesn't implement
> > > verify buffer
> > 
> > > function and defaults to nand_verify_buf() call in nand_base.c:
> > Yes, you are right.
> > 
> > > Now the chip->IO_ADDR_R is zero, making the kernel access bogus
> > > location, and therefore crash. So the correct solution is to properly
> > > implement the struct nand_chip *'s verify_buf function.
> > 
> > Right, the patch below prevents the kernel to happen:
> > 
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -857,6 +857,15 @@ static uint8_t gpmi_read_byte(struct mtd_info *mtd)
> > 
> >         return buf[0];
> >  
> >  }
> > 
> > +/* Used by the upper layer to verify the data in NAND Flash
> > + * with the data in the buf. */
> > +static int gpmi_verify_buf(struct mtd_info *mtd,
> > +                               const u_char *buf, int len)
> > +{
> > +       /* TODO: implement verify_buf mechanism */
> > +       return 0;
> > +}
> 
> NAK! This is only a workaround, proper implementation is needed. If it's
> not implemented now, I'm pretty sure such workaround will be there
> forever.
[...]

btw if you want a workaround, make Kconfig entry so it'd disallow VERIFY to be 
selected for GPMI_NAND, but that's also a wrong way to go.

Best regards,
Marek Vasut
