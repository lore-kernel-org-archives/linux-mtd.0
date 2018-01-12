Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ea1JA-0006Kr-Mb
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 15:31:59 +0000
Date: Fri, 12 Jan 2018 16:31:10 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH 4/8] mtd: nand: mxc: Fix failed/corrected values for
 v2/v3 controllers
Message-ID: <20180112163110.27a571b7@bbrezillon>
In-Reply-To: <20180109101148.13728-5-s.hauer@pengutronix.de>
References: <20180109101148.13728-1-s.hauer@pengutronix.de>
 <20180109101148.13728-5-s.hauer@pengutronix.de>
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

On Tue,  9 Jan 2018 11:11:44 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> Currently nand_read_page_hwecc() from nand_base calls
> mxc_nand_correct_data_v2_v3() for each subpage, but in this function we
> return the corrected/failed results for the whole page instead
> of a single subpage. On a 2k page size Nand this leads to results which
> are 4 times too high.
> The whole ecc.calculate/ecc.correct mechanism used by
> nand_read_page_hwecc() is not suitable for devices which correct the
> data in hardware, so fix this by using a driver specific read_page
> function which does the right thing. Also add read_page_raw and read_oob
> For proper raw and oob read support.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c | 84 ++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 76 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
> index ab9cd45237d3..d698f7c6666c 100644
> --- a/drivers/mtd/nand/mxc_nand.c
> +++ b/drivers/mtd/nand/mxc_nand.c
> @@ -140,6 +140,8 @@ struct mxc_nand_host;
>  
>  struct mxc_nand_devtype_data {
>  	void (*preset)(struct mtd_info *);
> +	int (*read_page)(struct mtd_info *mtd, struct nand_chip *chip,

You really don't have to pass both mtd and chip, since mtd can be
extraced from chip. Just pass chip and you should be good (the same
comment apply to other patches).

> +			void *buf, void *oob, bool ecc, int page);
>  	void (*send_cmd)(struct mxc_nand_host *, uint16_t, int);
>  	void (*send_addr)(struct mxc_nand_host *, uint16_t, int);
>  	void (*send_page)(struct mtd_info *, unsigned int);
> @@ -757,13 +759,35 @@ static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
>  static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
>  				 u_char *read_ecc, u_char *calc_ecc)
>  {
> +	return 0;
> +}
> +
> +static int mxc_nand_read_page_v2_v3(struct mtd_info *mtd, struct nand_chip *chip,
> +				    void *buf, void *oob, bool ecc, int page)
> +{
>  	struct nand_chip *nand_chip = mtd_to_nand(mtd);
> -	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
> +	struct mxc_nand_host *host = nand_get_controller_data(chip);
> +	unsigned int max_bitflips = 0;
>  	u32 ecc_stat, err;
> -	int no_subpages = 1;
> -	int ret = 0;
> +	int no_subpages;
>  	u8 ecc_bit_mask, err_limit;
>  
> +	host->devtype_data->enable_hwecc(nand_chip, ecc);
> +
> +	host->devtype_data->send_cmd(host, NAND_CMD_READ0, false);
> +	mxc_do_addr_cycle(mtd, 0, page);
> +
> +	if (mtd->writesize > 512)
> +		host->devtype_data->send_cmd(host,
> +				NAND_CMD_READSTART, true);
> +
> +	host->devtype_data->send_page(mtd, NFC_OUTPUT);
> +
> +	if (buf)
> +		memcpy32_fromio(buf, host->main_area0, mtd->writesize);
> +	if (oob)
> +		copy_spare(mtd, true, oob);
> +
>  	ecc_bit_mask = (host->eccsize == 4) ? 0x7 : 0xf;
>  	err_limit = (host->eccsize == 4) ? 0x4 : 0x8;
>  
> @@ -774,17 +798,53 @@ static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
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
> +	return max_bitflips;
> +}
>  
> -	return ret;
> +static int mxc_nand_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> +			      uint8_t *buf, int oob_required, int page)
> +{
> +	struct mxc_nand_host *host = nand_get_controller_data(chip);
> +	void *oob_buf;
> +
> +	if (oob_required)
> +		oob_buf = chip->oob_poi;
> +	else
> +		oob_buf = NULL;
> +
> +	return host->devtype_data->read_page(mtd, chip, buf, oob_buf, 1, page);
> +}
> +
> +static int mxc_nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> +				  uint8_t *buf, int oob_required, int page)
> +{
> +	struct mxc_nand_host *host = nand_get_controller_data(chip);
> +	void *oob_buf;
> +
> +	if (oob_required)
> +		oob_buf = chip->oob_poi;
> +	else
> +		oob_buf = NULL;
> +
> +	return host->devtype_data->read_page(mtd, chip, buf, oob_buf, 0, page);
> +}
> +
> +static int mxc_nand_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
> +			     int page)
> +{
> +	struct mxc_nand_host *host = nand_get_controller_data(chip);
> +
> +	return host->devtype_data->read_page(mtd, chip, NULL, chip->oob_poi, 0,
> +					     page);
>  }
>  
>  static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
> @@ -1483,6 +1543,7 @@ static const struct mxc_nand_devtype_data imx27_nand_devtype_data = {
>  /* v21: i.MX25, i.MX35 */
>  static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
>  	.preset = preset_v2,
> +	.read_page = mxc_nand_read_page_v2_v3,
>  	.send_cmd = send_cmd_v1_v2,
>  	.send_addr = send_addr_v1_v2,
>  	.send_page = send_page_v2,
> @@ -1509,6 +1570,7 @@ static const struct mxc_nand_devtype_data imx25_nand_devtype_data = {
>  /* v3.2a: i.MX51 */
>  static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
>  	.preset = preset_v3,
> +	.read_page = mxc_nand_read_page_v2_v3,
>  	.send_cmd = send_cmd_v3,
>  	.send_addr = send_addr_v3,
>  	.send_page = send_page_v3,
> @@ -1535,6 +1597,7 @@ static const struct mxc_nand_devtype_data imx51_nand_devtype_data = {
>  /* v3.2b: i.MX53 */
>  static const struct mxc_nand_devtype_data imx53_nand_devtype_data = {
>  	.preset = preset_v3,
> +	.read_page = mxc_nand_read_page_v2_v3,
>  	.send_cmd = send_cmd_v3,
>  	.send_addr = send_addr_v3,
>  	.send_page = send_page_v3,
> @@ -1793,6 +1856,11 @@ static int mxcnd_probe(struct platform_device *pdev)
>  
>  	switch (this->ecc.mode) {
>  	case NAND_ECC_HW:
> +		if (host->devtype_data->read_page) {
> +			this->ecc.read_page = mxc_nand_read_page;
> +			this->ecc.read_page_raw = mxc_nand_read_page_raw;
> +			this->ecc.read_oob = mxc_nand_read_oob;
> +		}
>  		this->ecc.calculate = mxc_nand_calculate_ecc;
>  		this->ecc.hwctl = mxc_nand_enable_hwecc;
>  		this->ecc.correct = host->devtype_data->correct_data;
