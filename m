Date: Tue, 20 May 2014 12:21:34 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH v3 5/9] mtd: nand: add sunxi NAND flash controller support
Message-ID: <20140520192134.GU28907@ld-irv-0074>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-6-git-send-email-b.brezillon.dev@gmail.com>
 <20140509160341.GA6984@arch.cereza> <536D069A.40401@gmail.com>
 <20140520184942.GT28907@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140520184942.GT28907@ld-irv-0074>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-doc@vger.kernel.org,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, dev@linux-sunxi.org,
 Rob Herring <robherring2@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 20, 2014 at 11:49:42AM -0700, Brian Norris wrote:
> On Fri, May 09, 2014 at 06:47:22PM +0200, Boris BREZILLON wrote:
> > On 09/05/2014 18:03, Ezequiel Garcia wrote:
> > > On 12 Mar 07:07 PM, Boris BREZILLON wrote:
> > >> --- /dev/null
> > >> +++ b/drivers/mtd/nand/sunxi_nand.c
> > >> @@ -0,0 +1,1276 @@
> ...
> > >> +static int sunxi_nand_ecc_init(struct mtd_info *mtd, struct nand_ecc_ctrl *ecc,
> > >> +			       struct device_node *np)
> > >> +{
> > >> +	struct nand_chip *nand = mtd->priv;
> > >> +	int ecc_step_size, ecc_strength;
> > >> +	int ret;
> > >> +
> > >> +	ecc_step_size = of_get_nand_ecc_step_size(np);
> > >> +	ecc_strength = of_get_nand_ecc_strength(np);
> > >> +	if (ecc_step_size > 0 && ecc_strength > 0) {
> > >> +		ecc->size = ecc_step_size;
> > >> +		ecc->strength = ecc_strength;
> > >> +	} else {
> > >> +		ecc->size = nand->ecc_step_ds;
> > >> +		ecc->strength = nand->ecc_strength_ds;
> > >> +	}
> > >> +
> > > Shouldn't you check the devicetree value is not weaker than the ONFI-obtained?
> > 
> > I can definitely do that.
> 
> You can do that here, but take a look at the discussion Ezequiel and I
> had about this:
> 
>   http://thread.gmane.org/gmane.linux.drivers.devicetree/67462
> 
> We probably don't want to be doing anything drastic like overriding the
> device tree configuration. Instead, we might want to stick a warning
> into the core nand_base code that does the proper comparison of the
> '*_ds' values with the actual values chosen in
> chip->ecc->{size,strength}. The comparison is kind of subtle, actually,
> so it'd be good to do it exactly once for everyone.

I forgot, Ezequiel already submitted this. I'll look at it soon:

  http://patchwork.ozlabs.org/patch/348901/

Brian
