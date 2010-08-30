Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OpzEI-0002Fm-KO
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 07:56:35 +0000
Received: by gxk27 with SMTP id 27so2307722gxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 00:56:33 -0700 (PDT)
Subject: Re: [PATCH v2] mtd/nand: Spansion S30MLxxxP support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1282230662-25388-1-git-send-email-norris@broadcom.com>
References: <1282230662-25388-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 10:56:24 +0300
Message-ID: <1283154984.12995.12.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: gernot.hoyler@spansion.com, David Woodhouse <dwmw2@infradead.org>,
	Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 2010-08-19 at 08:11 -0700, Brian Norris wrote:
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index a3c7473..8bdcf64 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2899,6 +2899,18 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  		mtd->writesize = type->pagesize;
>  		mtd->oobsize = mtd->writesize / 32;
>  		busw = type->options & NAND_BUSWIDTH_16;
> +
> +		/*
> +		 * Check for Spansion/AMD ID + repeating 5th, 6th byte since
> +		 * some Spansion chips have erasesize that conflicts with size
> +		 * listed in nand_ids table
> +		 * Data sheet (5 byte ID): Spansion S30ML-P ORNAND (p.39)
> +		 */
> +		if (*maf_id == NAND_MFR_AMD && id_data[4] != 0x00 &&
> +				id_data[5] == 0x00 && id_data[6] == 0x00 &&
> +				id_data[7] == 0x00 && mtd->writesize == 512)
> +			mtd->erasesize = (128 * 1024) << ((id_data[3] & 0x03)
> +					<< 1);

IMO, it is untidy to move just this little << 1 piece to another line.
I've amended this part and made it look like:

                        mtd->erasesize = (128 * 1024);
                        mtd->erasesize <<= ((id_data[3] & 0x03) << 1);

instead, if you do not mind, and pushed to l2-mtd-2.6.git / master,
thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
