Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eQyfH-0005MR-N9
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 16:53:21 +0000
Date: Mon, 18 Dec 2017 17:52:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de
Subject: Re: [PATCH 1/3] mtd: nand: mxc: Fix failed/corrected values
Message-ID: <20171218175258.48378f19@bbrezillon>
In-Reply-To: <20171215085504.32296-2-s.hauer@pengutronix.de>
References: <20171215085504.32296-1-s.hauer@pengutronix.de>
 <20171215085504.32296-2-s.hauer@pengutronix.de>
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

On Fri, 15 Dec 2017 09:55:02 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Currently nand_read_page_hwecc() from nand_base calls
> mxc_nand_correct_data_v2_v3() for each subpage, but in this function we
> return the corrected/failed results for the whole page instead
> of a single subpage. On a 2k page size Nand this leads to results which
> are 4 times too high.
> The whole ecc.calculate/ecc.correct mechanism used by
> nand_read_page_hwecc() is not suitable for devices which correct the
> data in hardware, so fix this by using a driver specific read_page
> function which does the right thing.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index f3be0b2a8869..65d5cde4692b 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -140,6 +140,8 @@ struct mxc_nand_host;
>  
>  struct mxc_nand_devtype_data {
>  	void (*preset)(struct mtd_info *);
> +	int (*read_page)(struct mtd_info *mtd, struct nand_chip *chip,
> +			uint8_t *buf, int oob_required, int page);
>  	void (*send_cmd)(struct mxc_nand_host *, uint16_t, int);
>  	void (*send_addr)(struct mxc_nand_host *, uint16_t, int);
>  	void (*send_page)(struct mtd_info *, unsigned int);
> @@ -617,13 +619,23 @@ static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
>  static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
>  				 u_char *read_ecc, u_char *calc_ecc)
>  {
> -	struct nand_chip *nand_chip = mtd_to_nand(mtd);
> -	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
> +	return 0;
> +}
> +
> +static int mxc_nand_read_page_hwecc_v2_v3(struct mtd_info *mtd,
> +					  struct nand_chip *chip,
> +					  uint8_t *buf, int oob_required,
> +					  int page)
> +{
> +	struct mxc_nand_host *host = nand_get_controller_data(chip);
> +	unsigned int max_bitflips = 0;
>  	u32 ecc_stat, err;
> -	int no_subpages = 1;
> -	int ret = 0;
> +	int no_subpages;
>  	u8 ecc_bit_mask, err_limit;

Sorry but you'll have to rebase this work on nand/next.
->read_page() hooks are now expected to send the READ0 command on
their own.

>  
> +	chip->read_buf(mtd, buf, mtd->writesize);
> +	chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
> +
>  	ecc_bit_mask = (host->eccsize == 4) ? 0x7 : 0xf;
>  	err_limit = (host->eccsize == 4) ? 0x4 : 0x8;
>  
> @@ -634,17 +646,16 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
>  	do {
>  		err = ecc_stat & ecc_bit_mask;
>  		if (err > err_limit) {
> -			dev_dbg(host->dev, "UnCorrectable RS-ECC Error\n");
> -			return -EBADMSG;
> +			mtd->ecc_stats.failed++;
>  		} else {
> -			ret += err;
> +			mtd->ecc_stats.corrected += err;
> +			max_bitflips = max_t(unsigned int, max_bitflips, err);
>  		}
> +
>  		ecc_stat >>= 4;
>  	} while (--no_subpages);
>  
> -	dev_dbg(host->dev, "%d Symbol Correctable RS-ECC Error\n", ret);
> -
> -	return ret;
> +	return max_bitflips;
>  }
>  
>  static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
> @@ -1444,6 +1455,7 @@ static const struct mxc_nand_devtype_data imx27_nand_devtype_data = {
>  /* v21: i.MX25, i.MX35 */
>  static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
>  	.preset = preset_v2,
> +	.read_page = mxc_nand_read_page_hwecc_v2_v3,
>  	.send_cmd = send_cmd_v1_v2,
>  	.send_addr = send_addr_v1_v2,
>  	.send_page = send_page_v2,
> @@ -1469,6 +1481,7 @@ static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
>  /* v3.2a: i.MX51 */
>  static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
>  	.preset = preset_v3,
> +	.read_page = mxc_nand_read_page_hwecc_v2_v3,
>  	.send_cmd = send_cmd_v3,
>  	.send_addr = send_addr_v3,
>  	.send_page = send_page_v3,
> @@ -1494,6 +1507,7 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
>  /* v3.2b: i.MX53 */
>  static const struct mxc_nand_devtype_data imx53_nand_devtype_data = {
>  	.preset = preset_v3,
> +	.read_page = mxc_nand_read_page_hwecc_v2_v3,
>  	.send_cmd = send_cmd_v3,
>  	.send_addr = send_addr_v3,
>  	.send_page = send_page_v3,
> @@ -1751,6 +1765,7 @@ static int mxcnd_probe(struct platform_device *pdev)
>  
>  	switch (this->ecc.mode) {
>  	case NAND_ECC_HW:
> +		this->ecc.read_page = host->devtype_data->read_page;
>  		this->ecc.calculate = mxc_nand_calculate_ecc;
>  		this->ecc.hwctl = mxc_nand_enable_hwecc;
>  		this->ecc.correct = host->devtype_data->correct_data;
