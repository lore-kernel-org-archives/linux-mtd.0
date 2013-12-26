Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1Ea-000338-4l
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:03:40 +0000
Date: Thu, 26 Dec 2013 10:32:07 +0800
From: Huang Shijie <b32955@freescale.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: nand: remove unused function input parameter
Message-ID: <20131226023206.GB6752@shlinux2.ap.freescale.net>
References: <C3050A4DBA34F345975765E43127F10F25E47D50@SZXEMA512-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <C3050A4DBA34F345975765E43127F10F25E47D50@SZXEMA512-MBX.china.huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 25, 2013 at 12:40:50PM +0000, Caizhiyong wrote:
> From: Cai Zhiyong <caizhiyong@huawei.com>
> Date: Wed, 25 Dec 2013 20:11:15 +0800
> Subject: [PATCH] mtd: nand: remove unused function input parameter
> 
> The nand_get_flash_type parameter "busw" input value is not used by any
> branch, and it is updated before use it in the function, so remove it, 
> define the "busw" as an internal variable.
> 
> Signed-off-by: Cai Zhiyong <caizhiyong@huawei.com>
> ---
>  drivers/mtd/nand/nand_base.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 9b3bb3c..a123afa 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3337,10 +3337,10 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>   */
>  static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  						  struct nand_chip *chip,
> -						  int busw,
>  						  int *maf_id, int *dev_id,
>  						  struct nand_flash_dev *type)
>  {
> +	int busw;
>  	int i, maf_idx;
>  	u8 id_data[8];
>  
> @@ -3497,18 +3497,16 @@ ident_done:
>  int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  		    struct nand_flash_dev *table)
>  {
> -	int i, busw, nand_maf_id, nand_dev_id;
> +	int i, nand_maf_id, nand_dev_id;
>  	struct nand_chip *chip = mtd->priv;
>  	struct nand_flash_dev *type;
>  
> -	/* Get buswidth to select the correct functions */
> -	busw = chip->options & NAND_BUSWIDTH_16;
>  	/* Set the default functions */
> -	nand_set_defaults(chip, busw);
> +	nand_set_defaults(chip, chip->options & NAND_BUSWIDTH_16);
>  
>  	/* Read the flash type */
> -	type = nand_get_flash_type(mtd, chip, busw,
> -				&nand_maf_id, &nand_dev_id, table);
> +	type = nand_get_flash_type(mtd, chip, &nand_maf_id,
> +				   &nand_dev_id, table);
I think the "busw" is to make the code more readable, since the nand_set_defaults
also needs a busw.

Let Brian judge it.

thanks
Huang Shijie
