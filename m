Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQKVc-0000Eo-Qv
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2018 23:05:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Sat, 24 Nov 2018 00:04:57 +0100
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Vladimir Zapolskiy
 <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH 07/10] mtd: rawnand: vf610: Stop passing mtd_info to
 internal functions
In-Reply-To: <20181120090239.5792-8-boris.brezillon@bootlin.com>
References: <20181120090239.5792-1-boris.brezillon@bootlin.com>
 <20181120090239.5792-8-boris.brezillon@bootlin.com>
Message-ID: <1ad297f41e1c91646ad581ff15a04046@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20.11.2018 10:02, Boris Brezillon wrote:
> Mimic what has been done in the core and avoid passing mtd_info object
> to internally.

Nit: drop the to...

Otherwise looks good, thanks for improving this:

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/vf610_nfc.c | 48 +++++++++++++-------------------
>  1 file changed, 19 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
> index 0fa7cac4ce14..845a639b0595 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -168,11 +168,6 @@ struct vf610_nfc {
>  	u32 ecc_mode;
>  };
>  
> -static inline struct vf610_nfc *mtd_to_nfc(struct mtd_info *mtd)
> -{
> -	return container_of(mtd_to_nand(mtd), struct vf610_nfc, chip);
> -}
> -
>  static inline struct vf610_nfc *chip_to_nfc(struct nand_chip *chip)
>  {
>  	return container_of(chip, struct vf610_nfc, chip);
> @@ -316,8 +311,7 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
>  
>  static irqreturn_t vf610_nfc_irq(int irq, void *data)
>  {
> -	struct mtd_info *mtd = data;
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	struct vf610_nfc *nfc = data;
>  
>  	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
>  	complete(&nfc->cmd_done);
> @@ -492,7 +486,7 @@ static const struct nand_op_parser
> vf610_nfc_op_parser = NAND_OP_PARSER(
>   */
>  static void vf610_nfc_select_target(struct nand_chip *chip, unsigned int cs)
>  {
> -	struct vf610_nfc *nfc = mtd_to_nfc(nand_to_mtd(chip));
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	u32 tmp;
>  
>  	/* Vybrid only (MPC5125 would have full RB and four CS) */
> @@ -516,10 +510,11 @@ static int vf610_nfc_exec_op(struct nand_chip *chip,
>  				      check_only);
>  }
>  
> -static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
> +static inline int vf610_nfc_correct_data(struct nand_chip *chip, uint8_t *dat,
>  					 uint8_t *oob, int page)
>  {
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
> +	struct mtd_info *mtd = nand_to_mtd(chip);
>  	u32 ecc_status_off = NFC_MAIN_AREA(0) + ECC_SRAM_ADDR + ECC_STATUS;
>  	u8 ecc_status;
>  	u8 ecc_count;
> @@ -559,8 +554,8 @@ static void vf610_nfc_fill_row(struct nand_chip
> *chip, int page, u32 *code,
>  static int vf610_nfc_read_page(struct nand_chip *chip, uint8_t *buf,
>  			       int oob_required, int page)
>  {
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
>  	int trfr_sz = mtd->writesize + mtd->oobsize;
>  	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
>  	int stat;
> @@ -593,7 +588,7 @@ static int vf610_nfc_read_page(struct nand_chip
> *chip, uint8_t *buf,
>  						   mtd->writesize,
>  				       mtd->oobsize, false);
>  
> -	stat = vf610_nfc_correct_data(mtd, buf, chip->oob_poi, page);
> +	stat = vf610_nfc_correct_data(chip, buf, chip->oob_poi, page);
>  
>  	if (stat < 0) {
>  		mtd->ecc_stats.failed++;
> @@ -607,8 +602,8 @@ static int vf610_nfc_read_page(struct nand_chip
> *chip, uint8_t *buf,
>  static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
>  				int oob_required, int page)
>  {
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
>  	int trfr_sz = mtd->writesize + mtd->oobsize;
>  	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
>  	u8 status;
> @@ -651,8 +646,7 @@ static int vf610_nfc_write_page(struct nand_chip
> *chip, const uint8_t *buf,
>  static int vf610_nfc_read_page_raw(struct nand_chip *chip, u8 *buf,
>  				   int oob_required, int page)
>  {
> -	struct mtd_info *mtd = nand_to_mtd(chip);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	int ret;
>  
>  	nfc->data_access = true;
> @@ -665,8 +659,8 @@ static int vf610_nfc_read_page_raw(struct
> nand_chip *chip, u8 *buf,
>  static int vf610_nfc_write_page_raw(struct nand_chip *chip, const u8 *buf,
>  				    int oob_required, int page)
>  {
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
>  	int ret;
>  
>  	nfc->data_access = true;
> @@ -684,7 +678,7 @@ static int vf610_nfc_write_page_raw(struct
> nand_chip *chip, const u8 *buf,
>  
>  static int vf610_nfc_read_oob(struct nand_chip *chip, int page)
>  {
> -	struct vf610_nfc *nfc = mtd_to_nfc(nand_to_mtd(chip));
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	int ret;
>  
>  	nfc->data_access = true;
> @@ -697,7 +691,7 @@ static int vf610_nfc_read_oob(struct nand_chip
> *chip, int page)
>  static int vf610_nfc_write_oob(struct nand_chip *chip, int page)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  	int ret;
>  
>  	nfc->data_access = true;
> @@ -754,7 +748,7 @@ static void vf610_nfc_init_controller(struct vf610_nfc *nfc)
>  static int vf610_nfc_attach_chip(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	struct vf610_nfc *nfc = chip_to_nfc(chip);
>  
>  	vf610_nfc_init_controller(nfc);
>  
> @@ -885,7 +879,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  
>  	init_completion(&nfc->cmd_done);
>  
> -	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, mtd);
> +	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, nfc);
>  	if (err) {
>  		dev_err(nfc->dev, "Error requesting IRQ!\n");
>  		goto err_disable_clk;
> @@ -899,7 +893,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  	if (err)
>  		goto err_disable_clk;
>  
> -	platform_set_drvdata(pdev, mtd);
> +	platform_set_drvdata(pdev, nfc);
>  
>  	/* Register device in MTD */
>  	err = mtd_device_register(mtd, NULL, 0);
> @@ -916,10 +910,9 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  
>  static int vf610_nfc_remove(struct platform_device *pdev)
>  {
> -	struct mtd_info *mtd = platform_get_drvdata(pdev);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	struct vf610_nfc *nfc = platform_get_drvdata(pdev);
>  
> -	nand_release(mtd_to_nand(mtd));
> +	nand_release(&nfc->chip);
>  	clk_disable_unprepare(nfc->clk);
>  	return 0;
>  }
> @@ -927,8 +920,7 @@ static int vf610_nfc_remove(struct platform_device *pdev)
>  #ifdef CONFIG_PM_SLEEP
>  static int vf610_nfc_suspend(struct device *dev)
>  {
> -	struct mtd_info *mtd = dev_get_drvdata(dev);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> +	struct vf610_nfc *nfc = dev_get_drvdata(dev);
>  
>  	clk_disable_unprepare(nfc->clk);
>  	return 0;
> @@ -936,11 +928,9 @@ static int vf610_nfc_suspend(struct device *dev)
>  
>  static int vf610_nfc_resume(struct device *dev)
>  {
> +	struct vf610_nfc *nfc = dev_get_drvdata(dev);
>  	int err;
>  
> -	struct mtd_info *mtd = dev_get_drvdata(dev);
> -	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
> -
>  	err = clk_prepare_enable(nfc->clk);
>  	if (err)
>  		return err;
