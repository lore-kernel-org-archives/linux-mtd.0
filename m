Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eQyl8-0007hG-Vc
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 16:59:25 +0000
Date: Mon, 18 Dec 2017 17:59:00 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] mtd: nand: mxc: Add own write_page
Message-ID: <20171218175900.24332c1f@bbrezillon>
In-Reply-To: <20171215085504.32296-3-s.hauer@pengutronix.de>
References: <20171215085504.32296-1-s.hauer@pengutronix.de>
 <20171215085504.32296-3-s.hauer@pengutronix.de>
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

On Fri, 15 Dec 2017 09:55:03 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Now that we have our own read_page function add a write_page function
> for consistency aswell. This can be a lot easier than the generic
> function since we do not have to iterate over subpages but can write
> the whole page at once.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index 65d5cde4692b..a54804f14bb1 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -142,6 +142,8 @@ struct mxc_nand_devtype_data {
>  	void (*preset)(struct mtd_info *);
>  	int (*read_page)(struct mtd_info *mtd, struct nand_chip *chip,
>  			uint8_t *buf, int oob_required, int page);
> +	int (*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
> +			  const uint8_t *buf, int oob_required, int page);
>  	void (*send_cmd)(struct mxc_nand_host *, uint16_t, int);
>  	void (*send_addr)(struct mxc_nand_host *, uint16_t, int);
>  	void (*send_page)(struct mtd_info *, unsigned int);
> @@ -658,6 +660,17 @@ static int mxc_nand_read_page_hwecc_v2_v3(struct mtd_info *mtd,
>  	return max_bitflips;
>  }
>  
> +static int mxc_nand_write_page_hwecc_v2_v3(struct mtd_info *mtd,
> +					   struct nand_chip *chip,
> +					   const uint8_t *buf, int oob_required,
> +					   int page)
> +{

Same as for the ->read_page() hooks, this needs to be rebased on top of
nand/next.

Note that I've seen other drivers implementing the exact same sequence
(one example is fsl_elbc_write_subpage() [1] but AFAIR there are
others), so maybe it's worth creating a nand_write_page_raw_force_oob()
helper.

> +	chip->write_buf(mtd, buf, mtd->writesize);
> +	chip->write_buf(mtd, chip->oob_poi, mtd->oobsize);
> +
> +	return 0;
> +}
> +

[1]http://elixir.free-electrons.com/linux/v4.15-rc3/source/drivers/mtd/nand/fsl_elbc_nand.c#L741
