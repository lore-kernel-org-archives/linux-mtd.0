Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eXTgl-00076f-1u
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 15:13:44 +0000
Date: Fri, 5 Jan 2018 16:13:21 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: Check ONFI timings have been acked by
 the chip
Message-ID: <20180105161321.44218e4e@bbrezillon>
In-Reply-To: <20171222172853.27710-2-miquel.raynal@free-electrons.com>
References: <20171222172853.27710-1-miquel.raynal@free-electrons.com>
 <20171222172853.27710-2-miquel.raynal@free-electrons.com>
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

On Fri, 22 Dec 2017 18:28:52 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Choosing ONFI timings when ->onfi_set/get_features() calls are supported
> by the NAND chip is a matter of reading the chip's ONFI parameter page
> and telling the chip the chosen mode (between all of the supported ones)
> with ->onfi_set_feature().
> 
> Add a check on whether the chip "acked" the timing mode or not.
> 
> This can be a problem for NAND chips that do not follow entirely the
> ONFI specification. These chips actually support other modes than
> "mode 0", but do not update the parameter page once a timing mode has
> been selected. This issue will be addressed in another patch that will
> add the feature to overwrite NAND chips features within the parameter
> page, from the NAND chip driver.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 96c97588e1ba..ea862be6a803 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1236,6 +1236,18 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>  				tmode_param);
>  		if (ret)
>  			goto err;
> +
> +		ret = chip->onfi_get_features(mtd, chip,
> +					      ONFI_FEATURE_ADDR_TIMING_MODE,
> +					      tmode_param);
> +		if (ret)
> +			goto err;
> +
> +		if (tmode_param[0] != chip->onfi_timing_mode_default) {
> +			pr_warn("timings mode %d not acknowledged by the NAND chip\n",
> +				chip->onfi_timing_mode_default);
> +			goto err;
> +		}

Hm, I'm not sure this is safe. The spec says that new ONFI timing mode
is applied as soon the CS line is released after a
SET_FEATURES(ONFI_FEATURE_ADDR_TIMING_MODE), and since we have no
guarantee that the CS will be kept low by the controller after
->onfi_set_features() returns we must assume the new mode has been
applied and call ->setup_data_interface() to instruct the controller
to apply new timings.

If you want to check if the mode has really been applied, you should
release the CS (->select_chip(-1)), re-acquire it
(->select_chip(X)), and call
->onfi_get_features(ONFI_FEATURE_ADDR_TIMING_MODE). If it appears that
the mode has not been applied, you should restore timing mode 0 and
issue a RESET.

>  	}
>  
>  	ret = chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
