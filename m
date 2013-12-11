Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqkG4-0004k5-2m
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2013 13:55:24 +0000
Received: by mail-pb0-f44.google.com with SMTP id rq2so9986515pbb.31
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 05:55:02 -0800 (PST)
Date: Wed, 11 Dec 2013 21:54:54 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 3/4] mtd: nand: support Micron READ RETRY
Message-ID: <20131211135451.GB1284@gmail.com>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
 <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386619753-27613-3-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 09, 2013 at 12:09:12PM -0800, Brian Norris wrote:
> + * nand_set_read_retry - [INTERN] Set the READ RETRY mode
> + * @mtd: MTD device structure
> + * @retry_mode: the retry mode to use
> + *
> + * Some vendors supply a special command to shift the Vt threshold, to be used
> + * when there are too many bitflips in a page (i.e., ECC error). After setting
> + * a new threshold, the host should retry reading the page.
> + */
> +static int nand_set_read_retry(struct mtd_info *mtd, int retry_mode)
> +{
> +	struct nand_chip *chip = mtd->priv;
> +	uint8_t feature[ONFI_SUBFEATURE_PARAM_LEN] = {retry_mode};
> +
This can cause a DMA warning.

> +	if (retry_mode >= chip->read_retries)
> +		return -EINVAL;
> +
> +	if (chip->onfi_params.jedec_id == NAND_MFR_MICRON)
> +		return chip->onfi_set_features(mtd, chip,
> +				ONFI_FEATURE_ADDR_READ_RETRY, feature);
I suggest to add a hook such as for nand_chip{}:
	chip->read_retry(..)

Different nand chips fill different hook.

For Micron, fill it with micron_read_retry();
for Toshiba, fill it with a toshiab_read_retry();
For Hynix, fill it with hynix_read_retry().

I am wondar if we should add a file for the read-retry in the
drivers/mtd/nand folder.


thanks
Huang Shijie
