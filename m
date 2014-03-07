Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpV3-00044M-6A
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:47:22 +0000
Received: by mail-pb0-f54.google.com with SMTP id ma3so3845038pbc.27
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 23:46:59 -0800 (PST)
Date: Thu, 6 Mar 2014 23:46:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 2/3] mtd: nand: add new parsing rule for Hynix's
 H27UBG8T2CTR
Message-ID: <20140307074657.GF31517@norris-Latitude-E6410>
References: <1388736518-5934-1-git-send-email-b32955@freescale.com>
 <1388736518-5934-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388736518-5934-3-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 04:08:37PM +0800, Huang Shijie wrote:
> The H27UBG8T2CTR is produced by the 20nm technology, and Hynix uses
> different ID rules for it.
> 
> In order to parse out the correct information, we should check the
> process technology and the Device ID, and then determine whether to
> use a new parsing rule for this chip.
> 
> This patch adds the new parsing rule for the H27UBG8T2CTR.
> 
> Tested with H27UBG8T2CTR(8192 + 640).
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |   90 +++++++++++++++++++++++++++++++-----------
>  1 files changed, 67 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d6b7dc3..2c2f7af 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3204,34 +3204,78 @@ static void nand_parse_hynix(struct mtd_info *mtd, struct nand_chip *chip,
>  {
>  	int extid = id_data[3];
>  	unsigned int tmp;
> +	bool new_rule;
>  
> +	/*
> +	 * The ((id_data[5] & 0x7) < 4) means the nand uses >20nm technology;
> +	 * The ((id_data[5] & 0x7) >= 4) means the nand uses <=20nm technology;
> +	 *
> +	 * Please reference to the H27UBG8T2B (p.23) and H27UBG8T2C (p.23).
> +	 *
> +	 * The new parsing rule is used in the H27UBG8T2C, we have to use the
> +	 * process technology and the Device ID to distinguish this new rule.
> +	 */
> +	new_rule = ((id_data[5] & 0x7) >= 4) && (id_data[1] == 0xd7);

Are you sure you need to use the device ID (0xD7)? It's best if we don't
have to constrain ourselves to particular flash sizes here... Are there
Hynix MLC that don't follow the id_data[5] pattern for differentiating
technology types (>20nm vs <=20nm)? I'll have to check my datasheets
when I get back in the office.

> +
> +	tmp = new_rule ? SZ_4K : SZ_2K;

You forgot to include <linux/sizes.h> again :)

>  	/* Calc pagesize */
> -	mtd->writesize = 2048 << (extid & 0x03);
> +	mtd->writesize = tmp << (extid & 0x03);
>  	extid >>= 2;
>  
>  	/* Calc oobsize */
> -	switch (((extid >> 2) & 0x04) | (extid & 0x03)) {
> -	case 0:
> -		mtd->oobsize = 128;
> -		break;
> -	case 1:
> -		mtd->oobsize = 224;
> -		break;
> -	case 2:
> -		mtd->oobsize = 448;
> -		break;
> -	case 3:
> -		mtd->oobsize = 64;
> -		break;
> -	case 4:
> -		mtd->oobsize = 32;
> -		break;
> -	case 5:
> -		mtd->oobsize = 16;
> -		break;
> -	default:
> -		mtd->oobsize = 640;
> -		break;
> +	tmp = ((extid >> 2) & 0x04) | (extid & 0x03);
> +
> +	if (!new_rule) {
> +		switch (tmp) {
> +		case 0:
> +			mtd->oobsize = 128;
> +			break;
> +		case 1:
> +			mtd->oobsize = 224;
> +			break;
> +		case 2:
> +			mtd->oobsize = 448;
> +			break;
> +		case 3:
> +			mtd->oobsize = 64;
> +			break;
> +		case 4:
> +			mtd->oobsize = 32;
> +			break;
> +		case 5:
> +			mtd->oobsize = 16;
> +			break;
> +		default:
> +			mtd->oobsize = 640;
> +			break;
> +		}
> +	} else {
> +		switch (tmp) {
> +		case 0:
> +			mtd->oobsize = 640;
> +			break;
> +		case 1:
> +			mtd->oobsize = 448;
> +			break;
> +		case 2:
> +			mtd->oobsize = 224;
> +			break;
> +		case 3:
> +			mtd->oobsize = 128;
> +			break;
> +		case 4:
> +			mtd->oobsize = 64;
> +			break;
> +		case 5:
> +			mtd->oobsize = 32;
> +			break;
> +		case 6:
> +			mtd->oobsize = 16;
> +			break;
> +		default:
> +			mtd->oobsize = 640;
> +			break;
> +		}
>  	}
>  	extid >>= 2;
>  

Brian
