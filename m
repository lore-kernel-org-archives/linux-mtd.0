Received: from mail-pb0-x232.google.com ([2607:f8b0:400e:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucf8Z-00061O-1Q
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 17:05:11 +0000
Received: by mail-pb0-f50.google.com with SMTP id um15so1528079pbc.23
 for <linux-mtd@lists.infradead.org>; Wed, 15 May 2013 10:04:48 -0700 (PDT)
Message-ID: <5193C029.5060104@gmail.com>
Date: Wed, 15 May 2013 22:34:41 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v5 03/11] mtd: get the ECC info from the parameter page
 for ONFI nand
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1368607232-2210-4-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/15/2013 2:10 PM, Huang Shijie wrote:
>  From the ONFI spec, we can just get the ECC info from the @ecc_bits field of
> the parameter page.

I wonder what do we do, if the chip is not ONFI compliant?
which means when the legacy calculation in GPMI goes wrong?

> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>   drivers/mtd/nand/nand_base.c |    5 +++++
>   1 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index edc7663..15630ef 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2900,6 +2900,11 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>   	if (le16_to_cpu(p->features) & 1)
>   		*busw = NAND_BUSWIDTH_16;
>
> +	if (p->ecc_bits != 0xff) {
> +		chip->ecc_strength = p->ecc_bits;
> +		chip->ecc_step = 512;
> +	}
> +
>   	pr_info("ONFI flash detected\n");
>   	return 1;
>   }
>
