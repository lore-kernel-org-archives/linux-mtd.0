Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1aPBth-0002Kj-My
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 16:27:48 +0000
Date: Fri, 29 Jan 2016 17:27:17 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mason <slash.tmp@free.fr>
Cc: Brian Norris <computersforpeace@gmail.com>, Sebastian Frias
 <sf84@laposte.net>, David Woodhouse <dwmw2@infradead.org>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: RFC on large number of hacks in mtd core files
Message-ID: <20160129172717.24a12c3d@bbrezillon>
In-Reply-To: <56A65CBA.9050705@free.fr>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
 <56A35BA2.3040906@free.fr> <56A65CBA.9050705@free.fr>
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

Hi Mason,

Just ignored all the changes that were not related to NAND or mtdcore
(i.e. drivers/mtd/{chips, maps, device})

On Mon, 25 Jan 2016 18:34:50 +0100
Mason <slash.tmp@free.fr> wrote:

> On 23/01/2016 11:53, Mason wrote:
> 
> > I'll spend a few hours to clean up the diffs and keep only what seems relevant.
> 
> OK, here's my second attempt at presenting the information.
> I'm grateful if anyone has comments regarding the changes
> in core files, or even the driver itself.
> 
> Regards.
> 
> 
> $ git diff --stat -p v3.4.39 HEAD drivers/mtd include/linux/mtd
> 
>  drivers/mtd/Kconfig                 |   14 +-
>  drivers/mtd/chips/cfi_cmdset_0002.c |  127 ++-
>  drivers/mtd/devices/m25p80.c        |  100 +-
>  drivers/mtd/maps/Kconfig            |   11 +-
>  drivers/mtd/maps/physmap.c          |  193 +++-
>  drivers/mtd/mtdchar.c               |   54 +
>  drivers/mtd/mtdcore.c               |   48 +-
>  drivers/mtd/mtdpart.c               |    6 +
>  drivers/mtd/nand/Kconfig            |   18 +-
>  drivers/mtd/nand/Makefile           |    1 +
>  drivers/mtd/nand/nand_base.c        |  230 +++-
>  drivers/mtd/nand/nand_ids.c         |   24 +-
>  drivers/mtd/nand/nandsim.c          |    2 +-
>  drivers/mtd/nand/smp8xxx_nand.c     | 1974 +++++++++++++++++++++++++++++++++++
>  include/linux/mtd/map.h             |    1 +
>  include/linux/mtd/mtd.h             |    6 +
>  include/linux/mtd/nand.h            |   10 +
>  17 files changed, 2776 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 27143e042af5..a2661a490f3c 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -22,9 +22,21 @@ config MTD_TESTS
>  
>  	  WARNING: some of the tests will ERASE entire MTD device which they
>  	  test. Do not use these tests unless you really know what you do.
> +config MTD_PARTITIONS
> +	bool "MTD partitioning support"
> +	help
> +	 If you have a device which needs to divide its flash chip(s) up
> +	 into multiple 'partitions', each of which appears to the user as
> +	 a separate MTD device, you require this option to be enabled. If
> +	 unsure, say 'Y'.
> +
> +	 Note, however, that you don't need this option for the DiskOnChip
> +	 devices. Partitioning on NFTL 'devices' is a different - that's the
> +	 'normal' form of partitioning used on a block device.

This Kconfig option is already available in mainline.

>  
>  config MTD_REDBOOT_PARTS
>  	tristate "RedBoot partition table parsing"
> +	depends on !TANGOX

Why that? If you don't want REBOOT support just don't enable it in your
config.

>  	---help---
>  	  RedBoot is a ROM monitor and bootloader which deals with multiple
>  	  'images' in flash devices by putting a table one of the erase
> @@ -75,7 +87,7 @@ endif # MTD_REDBOOT_PARTS
>  
>  config MTD_CMDLINE_PARTS
>  	bool "Command line partition table parsing"
> -	depends on MTD = "y"
> +	depends on MTD = "y" && !XENV_PARTITION

I don't see any definition of XENV_PARTITIONS in you diff, and even if
there was one, why would it be incompatible with partitions defined in
the kernel cmdline?

>  	---help---
>  	  Allow generic configuration of the MTD partition tables via the kernel
>  	  command line. Multiple flash resources are supported for hardware where

[...]

> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index f2f482bec573..8219c1ce0f6b 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -620,6 +620,8 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
>  	return ret;
>  }
>  
> +#define MEMERASEFORCE  _IOW('M', 20, struct erase_info_user)
> +
>  static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>  {
>  	struct mtd_file_info *mfi = file->private_data;
> @@ -751,6 +753,58 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>  		break;
>  	}
>  
> +	case MEMERASEFORCE:
> +	{
> +		struct erase_info *erase;
> +
> +		if(!(file->f_mode & 2))
> +			return -EPERM;
> +
> +		erase=kzalloc(sizeof(struct erase_info),GFP_KERNEL);
> +		if (!erase)
> +			ret = -ENOMEM;
> +		else {
> +			wait_queue_head_t waitq;
> +			DECLARE_WAITQUEUE(wait, current);
> +
> +			init_waitqueue_head(&waitq);
> +
> +			if (copy_from_user(&erase->addr, argp,
> +				    sizeof(struct erase_info_user))) {
> +				kfree(erase);
> +				return -EFAULT;
> +			}
> +			erase->mtd = mtd;
> +			erase->callback = mtdchar_erase_callback;
> +			erase->priv = (unsigned long)&waitq;
> +			erase->retries = 0x73092215;
> +
> +			/*
> +			  FIXME: Allow INTERRUPTIBLE. Which means
> +			  not having the wait_queue head on the stack.
> +
> +			  If the wq_head is on the stack, and we
> +			  leave because we got interrupted, then the
> +			  wq_head is no longer there when the
> +			  callback routine tries to wake us up.
> +			*/
> +			ret = mtd_erase(mtd, erase);
> +			if (!ret) {
> +				set_current_state(TASK_UNINTERRUPTIBLE);
> +				add_wait_queue(&waitq, &wait);
> +				if (erase->state != MTD_ERASE_DONE &&
> +				    erase->state != MTD_ERASE_FAILED)
> +					schedule();
> +				remove_wait_queue(&waitq, &wait);
> +				set_current_state(TASK_RUNNING);
> +
> +				ret = (erase->state == MTD_ERASE_FAILED)?-EIO:0;
> +			}
> +			kfree(erase);
> +		}
> +		break;
> +	}
> +

Support for bad block erasure has been discussed several times, AFAIR
no decision was taken (or maybe it was decided that it was safer to not
allow it).

The problem here is that BBM (bad block markers) which are placed by the
NAND vendor can be erased too, and if you loose this information you can
start reusing a block that was really bad. ITOH, because some NAND
controller have weird page layout in which BBM are replaced by in-band
data or ECC bytes. So sometime it's useful to be able to force erasure
of bad blocks.
Anyway, until we agree on something I suggest you drop this feature and
use the nand scrub command in u-boot (if you are using u-boot ;)),
which is doing exactly what you're trying to do.

>  	case MEMWRITEOOB:
>  	{
>  		struct mtd_oob_buf buf;
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index c837507dfb1c..83085b6169d6 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -250,6 +250,49 @@ static ssize_t mtd_name_show(struct device *dev,
>  }
>  static DEVICE_ATTR(name, S_IRUGO, mtd_name_show, NULL);
>  
> +static ssize_t mtd_nand_type_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->nand_type);
> +}
> +static DEVICE_ATTR(nand_type, S_IRUGO, mtd_nand_type_show, NULL);
> +
> +static ssize_t mtd_nand_manufacturer_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->nand_manufacturer);
> +}
> +static DEVICE_ATTR(nand_manufacturer, S_IRUGO, mtd_nand_manufacturer_show, NULL);
> +
> +static ssize_t mtd_nand_onfi_version_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%s\n", mtd->onfi_version);
> +}
> +static DEVICE_ATTR(onfi_version, S_IRUGO, mtd_nand_onfi_version_show, NULL);
> +
> +static ssize_t mtd_nand_id_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	struct mtd_info *mtd = dev_get_drvdata(dev);
> +
> +	return snprintf(buf, PAGE_SIZE, "%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n", mtd->id_data[0]
> +																			   , mtd->id_data[1]
> +																			   , mtd->id_data[2]
> +																			   , mtd->id_data[3]
> +																			   , mtd->id_data[4]
> +																			   , mtd->id_data[5]
> +																			   , mtd->id_data[6]
> +																			   , mtd->id_data[7]);
> +}
> +static DEVICE_ATTR(nand_id, S_IRUGO, mtd_nand_id_show, NULL);
> +
>  static struct attribute *mtd_attrs[] = {
>  	&dev_attr_type.attr,
>  	&dev_attr_flags.attr,
> @@ -260,6 +303,10 @@ static struct attribute *mtd_attrs[] = {
>  	&dev_attr_oobsize.attr,
>  	&dev_attr_numeraseregions.attr,
>  	&dev_attr_name.attr,
> +	&dev_attr_nand_type.attr,
> +	&dev_attr_nand_manufacturer.attr,
> +	&dev_attr_nand_id.attr,
> +	&dev_attr_onfi_version.attr,
>  	NULL,
>  };

Hm, you're adding NAND specific files in the middle of generic mtd sysfs
files. I'm not saying that those information are not interesting,
but maybe they could be exposed in debugfs, and they should definitely
be exposed by nand_base.c not mtdcore.c.

Anyway, those changes are definitely not required to support your NAND
controller, so you can simply drop them.

>  
> @@ -321,7 +368,6 @@ int add_mtd_device(struct mtd_info *mtd)
>  
>  	mtd->index = i;
>  	mtd->usecount = 0;
> -

Useless blank line removal. 

>  	if (is_power_of_2(mtd->erasesize))
>  		mtd->erasesize_shift = ffs(mtd->erasesize) - 1;
>  	else
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index bf24aa77175d..2e8ba4091dbb 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -345,6 +345,7 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  {
>  	struct mtd_part *slave;
>  	char *name;
> +	int i;
>  
>  	/* allocate the partition structure */
>  	slave = kzalloc(sizeof(*slave), GFP_KERNEL);
> @@ -366,6 +367,11 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  	slave->mtd.oobsize = master->oobsize;
>  	slave->mtd.oobavail = master->oobavail;
>  	slave->mtd.subpage_sft = master->subpage_sft;
> +	slave->mtd.nand_type = master->nand_type;
> +	slave->mtd.nand_manufacturer = master->nand_manufacturer;
> +	slave->mtd.onfi_version = master->onfi_version;
> +	for (i = 0; i < 8; i++)
> +		slave->mtd.id_data[i] = master->id_data[i];

Those changes can be dropped too if you drop the sysfs entries.

>  
>  	slave->mtd.name = name;
>  	slave->mtd.owner = master->owner;
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 7d17cecad69d..e27256885ec1 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -1,3 +1,10 @@
> +config MTD_NAND_IDS
> +	tristate "Include chip ids for known NAND devices."
> +	depends on MTD
> +	help
> +	  Useful for NAND drivers that do not use the NAND subsystem but
> +	  still like to take advantage of the known chip information.
> +

This option already exists and is selected by MTD_NAND, no need to add
a description for it (we don't want users to see this option). So
again, this can be dropped.

>  config MTD_NAND_ECC
>  	tristate
>  
> @@ -83,6 +90,14 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
>            scratch register here to enable this feature. On Intel Moorestown
>            boards, the scratch register is at 0xFF108018.
>  
> +config MTD_NAND_TANGOX
> +        tristate "TANGOX NAND Device Support"
> +        depends on TANGO3 || TANGO4

Maybe you can add COMPILE_TEST too.

> +        select MTD_PARTITIONS

Let the user choose whether it wants MTD_PARTITIONS support or not.

> +        default m
> +        help
> +          Support TANGOX NAND Flash in the NAND flash reserved zone.
> +
>  config MTD_NAND_H1900
>  	tristate "iPAQ H1900 flash"
>  	depends on ARCH_PXA && BROKEN
> @@ -115,9 +130,6 @@ config MTD_NAND_OMAP2
>            Support for NAND flash on Texas Instruments OMAP2, OMAP3 and OMAP4
>  	  platforms.
>  
> -config MTD_NAND_IDS
> -	tristate
> -

Should be dropped too.

>  config MTD_NAND_RICOH
>  	tristate "Ricoh xD card reader"
>  	default n
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index d4b4d8739bd8..1a2ce2cca9f6 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_MTD_NAND_SPIA)		+= spia.o
>  obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+= ams-delta.o
>  obj-$(CONFIG_MTD_NAND_AUTCPU12)		+= autcpu12.o
>  obj-$(CONFIG_MTD_NAND_DENALI)		+= denali.o
> +obj-$(CONFIG_MTD_NAND_TANGOX)		+= smp8xxx_nand.o
>  obj-$(CONFIG_MTD_NAND_AU1550)		+= au1550nd.o
>  obj-$(CONFIG_MTD_NAND_BF5XX)		+= bf5xx_nand.o
>  obj-$(CONFIG_MTD_NAND_PPCHAMELEONEVB)	+= ppchameleonevb.o
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index eb9f5fb02eef..7a98ccef937c 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -47,7 +47,10 @@
>  #include <linux/bitops.h>
>  #include <linux/leds.h>
>  #include <linux/io.h>
> +
> +#ifdef CONFIG_MTD_PARTITIONS
>  #include <linux/mtd/partitions.h>
> +#endif

You don't need to make this inclusion conditional.

>  
>  /* Define default oob placement schemes for large and small page devices */
>  static struct nand_ecclayout nand_oob_8 = {
> @@ -64,8 +67,11 @@ static struct nand_ecclayout nand_oob_16 = {
>  	.eccbytes = 6,
>  	.eccpos = {0, 1, 2, 3, 6, 7},
>  	.oobfree = {
> -		{.offset = 8,
> -		 . length = 8} }
> +#ifdef CONFIG_MTD_NAND_BBM
> +		{.offset = 9, . length = 7}}		//nand bbm config
> +#else
> +		{.offset = 8, . length = 8}}
> +#endif
>  };

If you need to define your own ooblayout then it should be done at the
NAND controller, and you should not make it conditional on some config
option.

>  
>  static struct nand_ecclayout nand_oob_64 = {
> @@ -75,8 +81,11 @@ static struct nand_ecclayout nand_oob_64 = {
>  		   48, 49, 50, 51, 52, 53, 54, 55,
>  		   56, 57, 58, 59, 60, 61, 62, 63},
>  	.oobfree = {
> -		{.offset = 2,
> -		 .length = 38} }
> +#ifdef CONFIG_MTD_NAND_BBM
> +		{.offset = 3,.length = 37}}     //nand bbm config
> +#else
> +		{.offset = 2,.length = 38}}
> +#endif

Ditto.

>  };
>  
>  static struct nand_ecclayout nand_oob_128 = {
> @@ -123,6 +132,12 @@ static int check_offs_len(struct mtd_info *mtd,
>  		ret = -EINVAL;
>  	}
>  
> +	/* Do not allow past end of device */
> +	if (ofs + len > mtd->size) {
> +		pr_debug( "%s: Past end of device\n",__func__);
> +		ret = -EINVAL;
> +	}
> +

This is already checked at the MTD level, so I don't think you need
that.

>  	return ret;
>  }
>  
> @@ -646,7 +661,11 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
>  	 * Apply this short delay always to ensure that we do wait tWB in
>  	 * any case on any machine.
>  	 */
> +#ifdef CONFIG_TANGOX
> +	udelay(1); /* needs to make it much longer than tWB */
> +#else
>  	ndelay(100);
> +#endif

Yes, this delay here should probably depends on the NAND timings
attached to the NAND device, but anyway, I don't think this should be
done like this, so just drop it for the moment, and we'll find a way to
express that differently.

BTW, could you explain why you need it to sleep for more than tWB?
I think this is because you do not wait for the controller to
acknowledge that the command has been sent to the NAND device, can you
check that?

>  
>  	nand_wait_ready(mtd);
>  }
> @@ -768,7 +787,11 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
>  	 * Apply this short delay always to ensure that we do wait tWB in
>  	 * any case on any machine.
>  	 */
> +#ifdef CONFIG_TANGOX
> +	udelay(1); /* needs to make it much longer than tWB */
> +#else
>  	ndelay(100);
> +#endif

Ditto.

>  
>  	nand_wait_ready(mtd);
>  }
> @@ -803,6 +826,7 @@ nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
>  	spinlock_t *lock = &chip->controller->lock;
>  	wait_queue_head_t *wq = &chip->controller->wq;
>  	DECLARE_WAITQUEUE(wait, current);
> +
>  retry:
>  	spin_lock(lock);
>  
> @@ -882,7 +906,11 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
>  	 * Apply this short delay always to ensure that we do wait tWB in any
>  	 * case on any machine.
>  	 */
> +#ifdef CONFIG_TANGOX
> +	udelay(1); /* needs to make it much longer than tWB */
> +#else
>  	ndelay(100);
> +#endif

Ditto.

>  
>  	if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
>  		chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
> @@ -1493,15 +1521,18 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>  		if (realpage != chip->pagebuf || oob) {
>  			bufpoi = aligned ? buf : chip->buffers->databuf;
>  
> +#if defined(CONFIG_TANGOX)
>  			if (likely(sndcmd)) {
>  				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>  				sndcmd = 0;
>  			}
> +#endif

I don't see this conditional path in mainline, but anyway, you
shouldn't change that: the READ0 command in send during the
->cmdfunc() call, and if you need to trigger another READ0 command,
then you should probably do that in you ecc->read_xxx() implementations.

>  
>  			/* Now read the page into the buffer */
> -			if (unlikely(ops->mode == MTD_OPS_RAW))
> +			if (unlikely(ops->mode == MTD_OPS_RAW)){
>  				ret = chip->ecc.read_page_raw(mtd, chip,
>  							      bufpoi, page);
> +			}
>  			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
>  				ret = chip->ecc.read_subpage(mtd, chip,
>  							col, bytes, bufpoi);
> @@ -1614,6 +1645,12 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
>  	struct mtd_oob_ops ops;
>  	int ret;
>  
> +	/* Do not allow reads past end of device */
> +	if ((from + len) > mtd->size)
> +		return -EINVAL;

Already controlled by the MTD layer.

> +	if (!len)
> +		return 0;
> +

And this one too.

>  	nand_get_device(chip, mtd, FL_READING);
>  	ops.len = len;
>  	ops.datbuf = buf;
> @@ -2541,6 +2578,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  	struct nand_chip *chip = mtd->priv;
>  	loff_t rewrite_bbt[NAND_MAX_CHIPS] = {0};
>  	unsigned int bbt_masked_page = 0xffffffff;
> +	int force_erase = 0;
>  	loff_t len;
>  
>  	pr_debug("%s: start = 0x%012llx, len = %llu\n",
> @@ -2550,6 +2588,9 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  	if (check_offs_len(mtd, instr->addr, instr->len))
>  		return -EINVAL;
>  
> +	if (instr->retries == 0x73092215)
> +		force_erase = 1;
> +

As I said, not sure this is a good idea to allow bad block erasure, and
even if we decide to do we'll probably not use this ->retries = MAGICVAL
trick.

>  	/* Grab the lock and see if the device is available */
>  	nand_get_device(chip, mtd, FL_ERASING);
>  
> @@ -2586,14 +2627,16 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  	instr->state = MTD_ERASING;
>  
>  	while (len) {
> +#ifndef CONFIG_MTD_NAND_BBM
>  		/* Check if we have a bad block, we do not erase bad blocks! */
> -		if (nand_block_checkbad(mtd, ((loff_t) page) <<
> +		if (!force_erase && nand_block_checkbad(mtd, ((loff_t) page) <<
>  					chip->page_shift, 0, allowbbt)) {
>  			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
>  				    __func__, page);
>  			instr->state = MTD_ERASE_FAILED;
>  			goto erase_exit;
>  		}
> +#endif

Same here.

>  
>  		/*
>  		 * Invalidate the page cache, if we erase the block which
> @@ -2713,6 +2756,9 @@ static void nand_sync(struct mtd_info *mtd)
>   */
>  static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
>  {
> +	/* Check for invalid offset */
> +	if (offs > mtd->size)
> +		return -EINVAL;

Already checked in mtdcore.

>  	return nand_block_checkbad(mtd, offs, 1, 0);
>  }
>  
> @@ -2851,6 +2897,22 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
>  		return 0;
>  
> +#ifdef CONFIG_TANGOX
> +	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
> +	for (i = 0; i < 3; i++) {
> +		int j = 0;
> +
> +		for ( j = 0; j < sizeof(*p); j++ ) {
> +			*(((uint8_t *)p)+j) = chip->read_byte(mtd);
> +		}
> +
> +		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
> +				le16_to_cpu(p->crc)) {
> +			pr_info("ONFI param page %d valid\n", i);
> +			break;
> +		}
> +	}
> +#else

This fix is available in mainline, so you can drop it.

>  	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
>  	for (i = 0; i < 3; i++) {
>  		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
> @@ -2860,6 +2922,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  			break;
>  		}
>  	}
> +#endif
>  
>  	if (i == 3)
>  		return 0;
> @@ -2888,16 +2951,29 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>  	sanitize_string(p->model, sizeof(p->model));
>  	if (!mtd->name)
>  		mtd->name = p->model;
> +
>  	mtd->writesize = le32_to_cpu(p->byte_per_page);
> -	mtd->erasesize = le32_to_cpu(p->pages_per_block) * mtd->writesize;
> +
> +	/*
> +	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
> +	 * (don't ask me who thought of this...). MTD assumes that these
> +	 * dimensions will be power-of-2, so just truncate the remaining area.
> +	 */
> +	mtd->erasesize = 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
> +	mtd->erasesize *= mtd->writesize;
> +

Hm, I'd like to have a real example (all the chips I've seen so far
are using power-of-2 here). And even if that's the case, then this means
we should patch nand_base to deal with that.

>  	mtd->oobsize = le16_to_cpu(p->spare_bytes_per_page);
> -	chip->chipsize = le32_to_cpu(p->blocks_per_lun);
> +
> +	/* See erasesize comment */
> +	chip->chipsize = 1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);

Ditto.

>  	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
>  	*busw = 0;
>  	if (le16_to_cpu(p->features) & 1)
>  		*busw = NAND_BUSWIDTH_16;
>  
> -	chip->options |= NAND_NO_READRDY | NAND_NO_AUTOINCR;
> +	chip->options &= ~NAND_CHIPOPTIONS_MSK;
> +	chip->options |= (NAND_NO_READRDY |
> +			NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;

Hm, can this really happens? Can we really have something set in
->options before entering this function?

>  
>  	pr_info("ONFI flash detected\n");
>  	return 1;
> @@ -2915,6 +2991,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  	int i, maf_idx;
>  	u8 id_data[8];
>  	int ret;
> +	char onfi_version[3];
>  
>  	/* Select the device */
>  	chip->select_chip(mtd, 0);
> @@ -2941,7 +3018,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  
>  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
>  
> -	for (i = 0; i < 2; i++)
> +	for (i = 0; i < 8; i++)
>  		id_data[i] = chip->read_byte(mtd);
>  
>  	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
> @@ -2954,12 +3031,12 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  	if (!type)
>  		type = nand_flash_ids;
>  
> -	for (; type->name != NULL; type++)
> +	for (; (type->name != NULL) && (type->id != 0); type++)
>  		if (*dev_id == type->id)
>  			break;
>  
>  	chip->onfi_version = 0;
> -	if (!type->name || !type->pagesize) {
> +	if (!type->name || !type->id || !type->pagesize) {
>  		/* Check is chip is ONFI compliant */
>  		ret = nand_flash_detect_onfi(mtd, chip, &busw);
>  		if (ret)
> @@ -2973,7 +3050,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  	for (i = 0; i < 8; i++)
>  		id_data[i] = chip->read_byte(mtd);
>  
> -	if (!type->name)
> +	if ((!type->name) || (!type->id))
>  		return ERR_PTR(-ENODEV);
>  
>  	if (!mtd->name)
> @@ -2995,14 +3072,17 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  		 * Field definitions are in the following datasheets:
>  		 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
>  		 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
> +		 * Micron      (5 byte ID): Micron MT29F16G08MAA (p.24)
> +		 *      Note: Micron rule is based on heuristics for
> +		 *            newer chips
>  		 *
>  		 * Check for wraparound + Samsung ID + nonzero 6th byte
>  		 * to decide what to do.
>  		 */
> -		if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
> +		if ((id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
>  				id_data[0] == NAND_MFR_SAMSUNG &&
>  				(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
> -				id_data[5] != 0x00) {
> +				id_data[5] != 0x00) || (id_data[0] == NAND_MFR_MIRA)) {
>  			/* Calc pagesize */
>  			mtd->writesize = 2048 << (extid & 0x03);
>  			extid >>= 2;
> @@ -3026,19 +3106,47 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  			mtd->erasesize = (128 * 1024) <<
>  				(((extid >> 1) & 0x04) | (extid & 0x03));
>  			busw = 0;
> -		} else {
> +		} else if (id_data[0] == NAND_MFR_ESMT) {
>  			/* Calc pagesize */
>  			mtd->writesize = 1024 << (extid & 0x03);
>  			extid >>= 2;
>  			/* Calc oobsize */
> -			mtd->oobsize = (8 << (extid & 0x01)) *
> -				(mtd->writesize >> 9);
> +			mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize / 512) ;

Exactly the same as the operation you removed, so the NAND_MFR_ESMT
case is just the default case.

>  			extid >>= 2;
> -			/* Calc blocksize. Blocksize is multiples of 64KiB */
> +			/* Calc blocksize */
>  			mtd->erasesize = (64 * 1024) << (extid & 0x03);
> +			busw = 0;
> +		} else {
> +			/* Calc pagesize */
> +			mtd->writesize = 1024 << (extid & 0x03);
>  			extid >>= 2;
> -			/* Get buswidth information */
> -			busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
> +
> +			/* Check for 5 byte ID + Micron + read more 0x00 */
> +			if (id_data[0] == NAND_MFR_MICRON && id_data[4] != 0x00
> +					&& mtd->writesize >= 4096
> +					&& id_data[5] == 0x00
> +					&& id_data[6] == 0x00) {
> +				/* OOB is 218B/224B per 4KiB pagesize */
> +				mtd->oobsize = ((extid & 0x03) == 0x03 ? 218 :
> +						224) << (mtd->writesize >> 13);
> +				extid >>= 3;
> +				/* Blocksize is multiple of 64KiB */
> +				mtd->erasesize = mtd->writesize <<
> +					(extid & 0x03) << 6;
> +				/* All Micron have busw x8? */
> +				printk("[%s] All Micron : %d\n", __func__, extid);

Maybe this handling is needed, I'll try to have a look at the Micron
datasheet. Anyway, this should be moved in nand_decode_ext_id().

> +				busw = 0;
> +			} else {
> +				/* Calc oobsize */
> +				mtd->oobsize = (8 << (extid & 0x01)) *
> +					(mtd->writesize >> 9);
> +				extid >>= 2;
> +				/* Calc blocksize (multiples of 64KiB) */
> +				mtd->erasesize = (64 * 1024) << (extid & 0x03);
> +				extid >>= 2;
> +				/* Get buswidth information */
> +				busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
> +			}
>  		}
>  	} else {
>  		/*
> @@ -3062,8 +3170,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>  			mtd->erasesize <<= ((id_data[3] & 0x03) << 1);
>  		}
>  	}
> -	/* Get chip options */
> -	chip->options |= type->options;
> +	/* Get chip options, preserve non chip based options */
> +	chip->options &= ~NAND_CHIPOPTIONS_MSK;
> +	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
>  
>  	/*
>  	 * Check if chip is not a Samsung device. Do not clear the
> @@ -3129,10 +3238,14 @@ ident_done:
>  	 */
>  	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
>  			(*maf_id == NAND_MFR_SAMSUNG ||
> +			 *maf_id == NAND_MFR_MIRA ||
> +			 *maf_id == NAND_MFR_ESMT ||
>  			 *maf_id == NAND_MFR_HYNIX))
>  		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
>  	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
>  				(*maf_id == NAND_MFR_SAMSUNG ||
> +				 *maf_id == NAND_MFR_MIRA ||
> +				 *maf_id == NAND_MFR_ESMT ||
>  				 *maf_id == NAND_MFR_HYNIX ||
>  				 *maf_id == NAND_MFR_TOSHIBA ||
>  				 *maf_id == NAND_MFR_AMD ||

Yep, this change is needed (if this is really the case of course). I'll
check the datasheet to be sure.

> @@ -3141,6 +3254,7 @@ ident_done:
>  			 *maf_id == NAND_MFR_MICRON))
>  		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
>  
> +
>  	/* Check for AND chips with 4 page planes */
>  	if (chip->options & NAND_4PAGE_ARRAY)
>  		chip->erase_cmd = multi_erase_cmd;
> @@ -3156,7 +3270,42 @@ ident_done:
>  		nand_manuf_ids[maf_idx].name,
>  		chip->onfi_version ? chip->onfi_params.model : type->name);
>  
> +	if (chip->onfi_version)
> +		snprintf(onfi_version, sizeof(onfi_version), "%d.%d",
> +					chip->onfi_version / 10,
> +					chip->onfi_version % 10);
> +	else
> +		snprintf(onfi_version, sizeof(onfi_version), "%s", "0");
> +
> +	/* ID Data Mapping */
> +	for (i = 0; i < 8; i++)
> +	{
> +		mtd->id_data[i] = id_data[i];
> +	}
> +
> +	mtd->onfi_version = kstrdup(onfi_version, GFP_KERNEL);
> +	if (!mtd->onfi_version)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mtd->nand_manufacturer = kstrdup(nand_manuf_ids[maf_idx].name, GFP_KERNEL);
> +	if (!mtd->nand_manufacturer) {
> +		ret = -ENOMEM;
> +		goto out_onfi_version;
> +	}
> +
> +	mtd->nand_type = kstrdup(type->name, GFP_KERNEL);
> +	if (!mtd->nand_type) {
> +		ret = -ENOMEM;
> +		goto out_nand_type;
> +	}
> +
>  	return type;
> +
> +out_nand_type:
> +	kfree(mtd->nand_type);
> +out_onfi_version:
> +	kfree(mtd->onfi_version);
> +	return ERR_PTR(ret);
>  }

You can drop all the above chunk.

>  
>  /**
> @@ -3176,6 +3325,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  	int i, busw, nand_maf_id, nand_dev_id;
>  	struct nand_chip *chip = mtd->priv;
>  	struct nand_flash_dev *type;
> +	int err;
>  
>  	/* Get buswidth to select the correct functions */
>  	busw = chip->options & NAND_BUSWIDTH_16;
> @@ -3190,7 +3340,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
>  			pr_warn("No NAND device found\n");
>  		chip->select_chip(mtd, -1);
> -		return PTR_ERR(type);
> +		err = PTR_ERR(type);
> +		goto out_error;
>  	}
>  
>  	/* Check for a chip array */
> @@ -3212,7 +3363,20 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
>  	chip->numchips = i;
>  	mtd->size = i * chip->chipsize;
>  
> +	chip->maf_id = nand_maf_id;
> +	chip->dev_id = type->id;
> +
>  	return 0;
> +
> +out_error:
> +	if (mtd->nand_type)
> +		kfree(mtd->nand_type);
> +	if (mtd->nand_manufacturer)
> +		kfree(mtd->nand_manufacturer);
> +	if (mtd->onfi_version)
> +		kfree(mtd->onfi_version);
> +
> +	return err;
>  }
>  EXPORT_SYMBOL(nand_scan_ident);

Ditto.

>  
> @@ -3259,6 +3423,19 @@ int nand_scan_tail(struct mtd_info *mtd)
>  		case 128:
>  			chip->ecc.layout = &nand_oob_128;
>  			break;
> +		case 224:
> +			chip->ecc.layout = &nand_oob_mlcbch_224;
> +			//8 bit bch ecc for Micron 1G flash, 224 oobsize use 128 for ecc
> +			//for(i=224-112,k=0;i<224;k++,i++)
> +			//	chip->ecc.layout->eccpos[k]=i;
> +			//chip->ecc.layout->oobfree[0].offset=3;
> +			//chip->ecc.layout->oobfree[0].length=(224-112-3);
> +			break;
> +#ifndef CONFIG_MTD_NAND_ECC_512
> +		case 448:
> +			chip->ecc.layout = &nand_oob_mlcbch_448;
> +			break;
> +#endif

Let's see if we can build those layout dynamically...

>  		default:
>  			pr_warn("No oob scheme defined for oobsize %d\n",
>  				   mtd->oobsize);
> @@ -3526,6 +3703,7 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
>  	ret = nand_scan_ident(mtd, maxchips, NULL);
>  	if (!ret)
>  		ret = nand_scan_tail(mtd);
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(nand_scan);
> @@ -3552,6 +3730,10 @@ void nand_release(struct mtd_info *mtd)
>  	if (chip->badblock_pattern && chip->badblock_pattern->options
>  			& NAND_BBT_DYNAMICSTRUCT)
>  		kfree(chip->badblock_pattern);
> +
> +	kfree(mtd->nand_type);
> +	kfree(mtd->nand_manufacturer);
> +	kfree(mtd->onfi_version);
>  }

Drop that too.

>  EXPORT_SYMBOL_GPL(nand_release);
>  
> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
> index af4fe8ca7b5e..2f14ff5efb4c 100644
> --- a/drivers/mtd/nand/nand_ids.c
> +++ b/drivers/mtd/nand/nand_ids.c
> @@ -107,22 +107,26 @@ struct nand_flash_dev nand_flash_ids[] = {
>  	/* 8 Gigabit */
>  	{"NAND 1GiB 1,8V 8-bit",	0xA3, 0, 1024, 0, LP_OPTIONS},
>  	{"NAND 1GiB 3,3V 8-bit",	0xD3, 0, 1024, 0, LP_OPTIONS},
> +	{"NAND 1GiB 3,3V 8-bit",	0x38, 0, 1024, 0, LP_OPTIONS},
>  	{"NAND 1GiB 1,8V 16-bit",	0xB3, 0, 1024, 0, LP_OPTIONS16},
>  	{"NAND 1GiB 3,3V 16-bit",	0xC3, 0, 1024, 0, LP_OPTIONS16},
>  
>  	/* 16 Gigabit */
>  	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
>  	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
> +	{"NAND 2GiB 3,3V 8-bit",	0x48, 0, 2048, 0, LP_OPTIONS},
>  	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
>  	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
>  
>  	/* 32 Gigabit */
> +	{"NAND 4GiB 3,3V 8-bit",	0x68, 0, 4096, 0, LP_OPTIONS},
>  	{"NAND 4GiB 1,8V 8-bit",	0xA7, 0, 4096, 0, LP_OPTIONS},
>  	{"NAND 4GiB 3,3V 8-bit",	0xD7, 0, 4096, 0, LP_OPTIONS},
>  	{"NAND 4GiB 1,8V 16-bit",	0xB7, 0, 4096, 0, LP_OPTIONS16},
>  	{"NAND 4GiB 3,3V 16-bit",	0xC7, 0, 4096, 0, LP_OPTIONS16},
>  
>  	/* 64 Gigabit */
> +	{"NAND 8GiB 3,3V 8-bit",	0x88, 0, 8192, 0, LP_OPTIONS},
>  	{"NAND 8GiB 1,8V 8-bit",	0xAE, 0, 8192, 0, LP_OPTIONS},
>  	{"NAND 8GiB 3,3V 8-bit",	0xDE, 0, 8192, 0, LP_OPTIONS},
>  	{"NAND 8GiB 1,8V 16-bit",	0xBE, 0, 8192, 0, LP_OPTIONS16},
> @@ -135,6 +139,7 @@ struct nand_flash_dev nand_flash_ids[] = {
>  	{"NAND 16GiB 3,3V 16-bit",	0x4A, 0, 16384, 0, LP_OPTIONS16},
>  
>  	/* 256 Gigabit */
> +	{"NAND 32GiB 3,3V 8-bit",	0xA8, 0, 32768, 0, LP_OPTIONS},
>  	{"NAND 32GiB 1,8V 8-bit",	0x1C, 0, 32768, 0, LP_OPTIONS},
>  	{"NAND 32GiB 3,3V 8-bit",	0x3C, 0, 32768, 0, LP_OPTIONS},
>  	{"NAND 32GiB 1,8V 16-bit",	0x2C, 0, 32768, 0, LP_OPTIONS16},

Maybe those chips should be defined with full IDs. Again, I need to
look at the datasheet to give a definitive answer.

> @@ -161,7 +166,22 @@ struct nand_flash_dev nand_flash_ids[] = {
>  	 BBT_AUTO_REFRESH
>  	},
>  
> -	{NULL,}
> +	/*
> +	 * Fill-in gaps, may be refilled at the runtime
> +	 */
> +	{"                                ", 0, },
> +	{"                                ", 0, },
> +	{"                                ", 0, },
> +	{"                                ", 0, },
> +	{"                                ", 0, },
> +	{"                                ", 0, },
> +	{"                                ", 0, },
> +	{"                                ", 0, },
> +
> +	/*
> +	 * Terminates the table
> +	 */
> +	{NULL, },
>  };

Let's say I didn't see that. Please remove it :).

>  
>  /*
> @@ -178,6 +198,8 @@ struct nand_manufacturers nand_manuf_ids[] = {
>  	{NAND_MFR_MICRON, "Micron"},
>  	{NAND_MFR_AMD, "AMD"},
>  	{NAND_MFR_MACRONIX, "Macronix"},
> +	{NAND_MFR_ESMT, "ESMT"},

There's already an entry for EON, so putting the "EON/ESMT" should be
good.

> +	{NAND_MFR_MIRA, "MIRA"},
>  	{0x0, "Unknown"}
>  };
>  
> diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
> index b9cbd65f49b5..a3b0336dc374 100644
> --- a/drivers/mtd/nand/nandsim.c
> +++ b/drivers/mtd/nand/nandsim.c
> @@ -654,7 +654,7 @@ static int init_nandsim(struct mtd_info *mtd)
>  	}
>  
>  	/* Detect how many ID bytes the NAND chip outputs */
> -        for (i = 0; nand_flash_ids[i].name != NULL; i++) {
> +        for (i = 0; (nand_flash_ids[i].name != NULL) && (nand_flash_ids[i].id != 0); i++) {
>                  if (second_id_byte != nand_flash_ids[i].id)
>                          continue;
>  		if (!(nand_flash_ids[i].options & NAND_NO_AUTOINCR))

You don't need that one.

> diff --git a/drivers/mtd/nand/smp8xxx_nand.c b/drivers/mtd/nand/smp8xxx_nand.c
> new file mode 100644
> index 000000000000..769144ffca44
> --- /dev/null
> +++ b/drivers/mtd/nand/smp8xxx_nand.c

I'll try to review the nand driver soon, stay tuned ;).

[...]

> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index cf5ea8cdcf8e..90b5caf8cacd 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -157,6 +157,12 @@ struct mtd_info {
>  	unsigned int erasesize_mask;
>  	unsigned int writesize_mask;
>  
> +	/* NAND related attributes */
> +	const char *nand_type;
> +	const char *nand_manufacturer;
> +	const char *onfi_version;
> +	u8 id_data[8];
> +

Drop those field.

>  	// Kernel-only stuff starts here.
>  	const char *name;
>  	int index;
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 248351344718..f58f617ea562 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -215,6 +215,9 @@ typedef enum {
>  #define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT) \
>  					&& (chip->page_shift > 9))
>  
> +/* Mask to zero out the chip options, which come from the id table */
> +#define NAND_CHIPOPTIONS_MSK	(0x0000ffff & ~NAND_NO_AUTOINCR)
> +

I'm pretty sure you don't need this macro.

>  /* Non chip related options */
>  /* This option skips the bbt scan during initialization. */
>  #define NAND_SKIP_BBTSCAN	0x00010000
> @@ -471,6 +474,8 @@ struct nand_buffers {
>   * @controller:		[REPLACEABLE] a pointer to a hardware controller
>   *			structure which is shared among multiple independent
>   *			devices.
> + * @maf_id:		[OPTOINAL] manufacture ID 
> + * @dev_id:		[OPTIONAL] device ID
>   * @priv:		[OPTIONAL] pointer to private chip data
>   * @errstat:		[OPTIONAL] hardware specific function to perform
>   *			additional error status checks (determine if errors are
> @@ -540,6 +545,9 @@ struct nand_chip {
>  
>  	struct nand_bbt_descr *badblock_pattern;
>  
> +	int maf_id;
> +	int dev_id;
> +

Let's drop those fields for now.

>  	void *priv;
>  };
>  
> @@ -556,6 +564,8 @@ struct nand_chip {
>  #define NAND_MFR_MICRON		0x2c
>  #define NAND_MFR_AMD		0x01
>  #define NAND_MFR_MACRONIX	0xc2
> +#define NAND_MFR_ESMT		0x92

As Geert said, not sure we have to redefine a new macro, just say that
EON and ESMT are the same.

> +#define NAND_MFR_MIRA		0xc8
>  
>  /**
>   * struct nand_flash_dev - NAND Flash Device ID Structure
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
