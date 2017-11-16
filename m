Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eFGMB-0006g3-AK
 for linux-mtd@lists.infradead.org; Thu, 16 Nov 2017 09:21:13 +0000
Date: Thu, 16 Nov 2017 10:20:39 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Quentin Schulz
 <quentin.schulz@free-electrons.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH 3/3] mtd: nand: add sysfs entry for NAND chip unique ID
Message-ID: <20171116102039.37691f35@bbrezillon>
In-Reply-To: <20171114154622.5493-4-miquel.raynal@free-electrons.com>
References: <20171114154622.5493-1-miquel.raynal@free-electrons.com>
 <20171114154622.5493-4-miquel.raynal@free-electrons.com>
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

On Tue, 14 Nov 2017 16:46:22 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> ONFI NAND chips may support the unique ID feature which is, once
> concatenated with the NAND manufacturer ID, a real unique ID.
> 
> It has been tried to make the NAND framework declare a "nand" bus type,
> with NAND chips being the bus devices and having their particular
> unique ID. But in this configuration, the chips could not be attached
> to the MTD class anymore.
> 
> No easy solution was doable in a reasonable amount of time, so instead
> it has been chosen to use the mtd_info structure to store the ID and
> turn it visible only if filled by the NAND framework.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> ---
>  drivers/mtd/mtdcore.c        | 33 ++++++++++++++++++++++++++++++++-
>  drivers/mtd/nand/nand_base.c | 26 +++++++++++++++++++-------
>  include/linux/mtd/mtd.h      |  1 +
>  3 files changed, 52 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index e7ea842ba3db..d43090348295 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -319,6 +319,15 @@ static ssize_t mtd_bbtblocks_show(struct device *dev,
>  }
>  static DEVICE_ATTR(bbt_blocks, S_IRUGO, mtd_bbtblocks_show, NULL);
>  
> +static ssize_t nand_unique_id_show(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->nand_unique_id);
> +}
> +static DEVICE_ATTR_RO(nand_unique_id);
> +
>  static struct attribute *mtd_attrs[] = {
>  	&dev_attr_type.attr,
>  	&dev_attr_flags.attr,
> @@ -336,9 +345,31 @@ static struct attribute *mtd_attrs[] = {
>  	&dev_attr_bad_blocks.attr,
>  	&dev_attr_bbt_blocks.attr,
>  	&dev_attr_bitflip_threshold.attr,
> +	&dev_attr_nand_unique_id.attr,
> +	NULL,
> +};
> +
> +static umode_t mtd_attr_is_visible(struct kobject *kobj,
> +				   struct attribute *attr, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +
> +	if (attr == &dev_attr_nand_unique_id.attr && !mtd->nand_unique_id)
> +		return 0;
> +
> +	return attr->mode;
> +}
> +
> +static const struct attribute_group mtd_group = {
> +	.attrs		= mtd_attrs,
> +	.is_visible	= mtd_attr_is_visible,
> +};
> +
> +static const struct attribute_group *mtd_groups[] = {
> +	&mtd_group,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(mtd);
>  
>  static const struct device_type mtd_devtype = {
>  	.name		= "mtd",
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 0bbc1fc04e01..e5ea3b159551 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -6368,7 +6368,6 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	struct nand_buffers *nbuf = NULL;
> -	char unique_id[ONFI_FULL_UNIQUEID_STRING_LEN];
>  	int ret, i;
>  
>  	/* New bad blocks should be marked in OOB, flash-based BBT, or both */
> @@ -6666,9 +6665,15 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	mtd->writebufsize = mtd->writesize;
>  
>  	/* Read the unique ID from the first die if available */
> -	chip->select_chip(mtd, 0);
> -	nand_read_unique_id(chip, unique_id);
> -	chip->select_chip(mtd, -1);
> +	mtd->nand_unique_id = kmalloc(ONFI_FULL_UNIQUEID_STRING_LEN,
> +				      GFP_KERNEL);
> +	if (mtd->nand_unique_id) {
> +		chip->select_chip(mtd, 0);
> +		ret = nand_read_unique_id(chip, mtd->nand_unique_id);
> +		chip->select_chip(mtd, -1);
> +		if (ret)
> +			kfree(mtd->nand_unique_id);
> +	}
>  
>  	/*
>  	 * Initialize bitflip_threshold to its default prior scan_bbt() call.
> @@ -6681,7 +6686,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/* Initialize the ->data_interface field. */
>  	ret = nand_init_data_interface(chip);
>  	if (ret)
> -		goto err_nand_manuf_cleanup;
> +		goto err_free_unique_id;
>  
>  	/* Enter fastest possible mode on all dies. */
>  	for (i = 0; i < chip->numchips; i++) {
> @@ -6690,7 +6695,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		chip->select_chip(mtd, -1);
>  
>  		if (ret)
> -			goto err_nand_manuf_cleanup;
> +			goto err_free_unique_id;
>  	}
>  
>  	/* Check, if we should skip the bad block table scan */
> @@ -6700,10 +6705,12 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/* Build bad block table */
>  	ret = chip->scan_bbt(mtd);
>  	if (ret)
> -		goto err_nand_manuf_cleanup;
> +		goto err_free_unique_id;
>  
>  	return 0;
>  
> +err_free_unique_id:
> +	kfree(mtd->nand_unique_id);
>  
>  err_nand_manuf_cleanup:
>  	nand_manufacturer_cleanup(chip);
> @@ -6758,10 +6765,15 @@ EXPORT_SYMBOL(nand_scan);
>   */
>  void nand_cleanup(struct nand_chip *chip)
>  {
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +
>  	if (chip->ecc.mode == NAND_ECC_SOFT &&
>  	    chip->ecc.algo == NAND_ECC_BCH)
>  		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
>  
> +	/* Free unique ID if existing */
> +	kfree(mtd->nand_unique_id);
> +
>  	/* Free bad block table memory */
>  	kfree(chip->bbt);
>  	if (!(chip->options & NAND_OWN_BUFFERS) && chip->buffers) {
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 6cd0f6b7658b..817eecd08fb5 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -269,6 +269,7 @@ struct mtd_info {
>  
>  	// Kernel-only stuff starts here.
>  	const char *name;
> +	u8 *nand_unique_id;

Should be "const char *" since this is a printable string that is not
supposed to be modified.

MTD folks (Richard, Marek, Brian, Cyrille), I'd like a feedback on this
patch.

I personally don't like the idea of putting NAND-specific (in this case
it's even more specific than NAND because it's only applicable to
ONFI-NANDs that support the READ_UNIQUE_ID command) stuff into mtd_info,
but there's currently no easy way to create NAND-specific sysfs entry.

We could add a nand_register() wrapper that would call
mtd_device_register() and add sysfs/debugfs entries after that, but
that implies patching all NAND drivers (again).

Any idea how we could make it less invasive?

Also, is there any other flash device that expose some sort of
unique-id, and if there is, what's the format?

Regards,

Boris
