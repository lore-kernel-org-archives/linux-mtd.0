Date: Thu, 8 Aug 2013 00:32:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Mack <zonque@gmail.com>
Subject: Re: [PATCH 03/20] ARM: pxa: ssp: add shortcut for &pdev->dev
Message-ID: <20130808073253.GA17106@norris.computersforpeace.net>
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <1375889649-14638-4-git-send-email-zonque@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1375889649-14638-4-git-send-email-zonque@gmail.com>
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, linux-mtd@lists.infradead.org,
 haojian.zhuang@linaro.org, cxie4@marvell.com, lars@metafoo.de, nico@linaro.org,
 vinod.koul@intel.com, marek.vasut@gmail.com,
 ezequiel.garcia@free-electrons.com, rmk+kernel@arm.linux.org.uk,
 devicetree@vger.kernel.org, samuel@sortiz.org, arnd@arndb.de,
 broonie@kernel.org, mika.westerberg@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, thomas.petazzoni@free-electrons.com,
 eric.y.miao@gmail.com, gregkh@linuxfoundation.org, davem@davemloft.net,
 sachin.kamat@linaro.org, kernel@pengutronix.de, djbw@fb.com,
 g.liakhovetski@gmx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 07, 2013 at 05:33:52PM +0200, Daniel Mack wrote:
> No functional change, just a cosmetic cleanup.
> 
> Signed-off-by: Daniel Mack <zonque@gmail.com>
> ---
> --- a/arch/arm/plat-pxa/ssp.c
> +++ b/arch/arm/plat-pxa/ssp.c
> @@ -77,16 +77,17 @@ static int pxa_ssp_probe(struct platform_device *pdev)
>  	const struct platform_device_id *id = platform_get_device_id(pdev);
>  	struct resource *res;
>  	struct ssp_device *ssp;
> +	struct device *dev = &pdev->dev;
>  	int ret = 0;
>  
>  	ssp = kzalloc(sizeof(struct ssp_device), GFP_KERNEL);
>  	if (ssp == NULL) {
> -		dev_err(&pdev->dev, "failed to allocate memory");
> +		dev_err(dev, "failed to allocate memory");

Two options here: either remove the message entirely (I believe kzalloc
will complain loudly if the allocation fails) or at least add a newline
at the end of it!

>  		return -ENOMEM;
>  	}
>  	ssp->pdev = pdev;
>  
...

Brian
