Received: from smtp4-g21.free.fr ([212.27.42.4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aPIQy-0006Tj-El
 for linux-mtd@lists.infradead.org; Fri, 29 Jan 2016 23:26:36 +0000
Subject: Re: RFC on large number of hacks in mtd core files
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Sebastian Frias <sf84@laposte.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <56A24C22.2050607@free.fr> <20160123031635.GB90611@google.com>
 <56A35BA2.3040906@free.fr> <56A65CBA.9050705@free.fr>
 <20160129172717.24a12c3d@bbrezillon>
From: Mason <slash.tmp@free.fr>
Message-ID: <56ABF506.6000203@free.fr>
Date: Sat, 30 Jan 2016 00:25:58 +0100
MIME-Version: 1.0
In-Reply-To: <20160129172717.24a12c3d@bbrezillon>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wow... you guys are truly amazing! Thanks.

On 29/01/2016 17:27, Boris Brezillon wrote:

> Hi Mason,
> 
> Just ignored all the changes that were not related to NAND or mtdcore
> (i.e. drivers/mtd/{chips, maps, device})

Are you telling me to ignore them? Or are you saying you
ignored them? Because you know they are irrelevant?

> On 23/01/2016 11:53, Mason wrote:
>
>> $ git diff --stat -p v3.4.39 HEAD drivers/mtd include/linux/mtd
>>
>>  drivers/mtd/Kconfig                 |   14 +-
>>  drivers/mtd/chips/cfi_cmdset_0002.c |  127 ++-
>>  drivers/mtd/devices/m25p80.c        |  100 +-
>>  drivers/mtd/maps/Kconfig            |   11 +-
>>  drivers/mtd/maps/physmap.c          |  193 +++-
>>  drivers/mtd/mtdchar.c               |   54 +
>>  drivers/mtd/mtdcore.c               |   48 +-
>>  drivers/mtd/mtdpart.c               |    6 +
>>  drivers/mtd/nand/Kconfig            |   18 +-
>>  drivers/mtd/nand/Makefile           |    1 +
>>  drivers/mtd/nand/nand_base.c        |  230 +++-
>>  drivers/mtd/nand/nand_ids.c         |   24 +-
>>  drivers/mtd/nand/nandsim.c          |    2 +-
>>  drivers/mtd/nand/smp8xxx_nand.c     | 1974 +++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/map.h             |    1 +
>>  include/linux/mtd/mtd.h             |    6 +
>>  include/linux/mtd/nand.h            |   10 +
>>  17 files changed, 2776 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
>> index 27143e042af5..a2661a490f3c 100644
>> --- a/drivers/mtd/Kconfig
>> +++ b/drivers/mtd/Kconfig
>> @@ -22,9 +22,21 @@ config MTD_TESTS
>>  
>>  	  WARNING: some of the tests will ERASE entire MTD device which they
>>  	  test. Do not use these tests unless you really know what you do.
>> +config MTD_PARTITIONS
>> +	bool "MTD partitioning support"
>> +	help
>> +	 If you have a device which needs to divide its flash chip(s) up
>> +	 into multiple 'partitions', each of which appears to the user as
>> +	 a separate MTD device, you require this option to be enabled. If
>> +	 unsure, say 'Y'.
>> +
>> +	 Note, however, that you don't need this option for the DiskOnChip
>> +	 devices. Partitioning on NFTL 'devices' is a different - that's the
>> +	 'normal' form of partitioning used on a block device.
> 
> This Kconfig option is already available in mainline.

Are you referring to MTD_PARTITIONED_MASTER?

commit 727dc612c46b8f3858537ea23805b3e897cf127e
Author: Dan Ehrenberg <dehrenberg@chromium.org>
Date:   Thu Apr 2 15:15:10 2015 -0700

Merged in v4.1 AFAICT.

>>  config MTD_REDBOOT_PARTS
>>  	tristate "RedBoot partition table parsing"
>> +	depends on !TANGOX
> 
> Why that? If you don't want REBOOT support just don't enable it in your
> config.

That makes sense.

>>  	---help---
>>  	  RedBoot is a ROM monitor and bootloader which deals with multiple
>>  	  'images' in flash devices by putting a table one of the erase
>> @@ -75,7 +87,7 @@ endif # MTD_REDBOOT_PARTS
>>  
>>  config MTD_CMDLINE_PARTS
>>  	bool "Command line partition table parsing"
>> -	depends on MTD = "y"
>> +	depends on MTD = "y" && !XENV_PARTITION
> 
> I don't see any definition of XENV_PARTITIONS in you diff, and even if
> there was one, why would it be incompatible with partitions defined in
> the kernel cmdline?
> 
>>  	---help---
>>  	  Allow generic configuration of the MTD partition tables via the kernel
>>  	  command line. Multiple flash resources are supported for hardware where
> 
> [...]
> 
>> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
>> index f2f482bec573..8219c1ce0f6b 100644
>> --- a/drivers/mtd/mtdchar.c
>> +++ b/drivers/mtd/mtdchar.c
>> @@ -620,6 +620,8 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
>>  	return ret;
>>  }
>>  
>> +#define MEMERASEFORCE  _IOW('M', 20, struct erase_info_user)
>> +
>>  static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
>>  {
>>  	struct mtd_file_info *mfi = file->private_data;
> 
> Support for bad block erasure has been discussed several times, AFAIR
> no decision was taken (or maybe it was decided that it was safer to not
> allow it).
> 
> The problem here is that BBM (bad block markers) which are placed by the
> NAND vendor can be erased too, and if you loose this information you can
> start reusing a block that was really bad. ITOH, because some NAND
> controller have weird page layout in which BBM are replaced by in-band
> data or ECC bytes. So sometime it's useful to be able to force erasure
> of bad blocks.
> Anyway, until we agree on something I suggest you drop this feature and
> use the nand scrub command in u-boot (if you are using u-boot ;)),
> which is doing exactly what you're trying to do.

Our dev boards have u-boot, but the production boards don't,
as far as I understand.

>> @@ -260,6 +303,10 @@ static struct attribute *mtd_attrs[] = {
>>  	&dev_attr_oobsize.attr,
>>  	&dev_attr_numeraseregions.attr,
>>  	&dev_attr_name.attr,
>> +	&dev_attr_nand_type.attr,
>> +	&dev_attr_nand_manufacturer.attr,
>> +	&dev_attr_nand_id.attr,
>> +	&dev_attr_onfi_version.attr,
>>  	NULL,
>>  };
> 
> Hm, you're adding NAND specific files in the middle of generic mtd sysfs
> files. I'm not saying that those information are not interesting,
> but maybe they could be exposed in debugfs, and they should definitely
> be exposed by nand_base.c not mtdcore.c.
> 
> Anyway, those changes are definitely not required to support your NAND
> controller, so you can simply drop them.

OK.

>> @@ -321,7 +368,6 @@ int add_mtd_device(struct mtd_info *mtd)
>>  
>>  	mtd->index = i;
>>  	mtd->usecount = 0;
>> -
> 
> Useless blank line removal.

If I had known someone was going to take so close a look,
I would have cleaned up these silly diffs, sorry.


>> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> index 7d17cecad69d..e27256885ec1 100644
>> --- a/drivers/mtd/nand/Kconfig
>> +++ b/drivers/mtd/nand/Kconfig
>> @@ -1,3 +1,10 @@
>> +config MTD_NAND_IDS
>> +	tristate "Include chip ids for known NAND devices."
>> +	depends on MTD
>> +	help
>> +	  Useful for NAND drivers that do not use the NAND subsystem but
>> +	  still like to take advantage of the known chip information.
>> +
> 
> This option already exists and is selected by MTD_NAND, no need to add
> a description for it (we don't want users to see this option). So
> again, this can be dropped.
> 
>>  config MTD_NAND_ECC
>>  	tristate
>>  
>> @@ -83,6 +90,14 @@ config MTD_NAND_DENALI_SCRATCH_REG_ADDR
>>            scratch register here to enable this feature. On Intel Moorestown
>>            boards, the scratch register is at 0xFF108018.
>>  
>> +config MTD_NAND_TANGOX
>> +        tristate "TANGOX NAND Device Support"
>> +        depends on TANGO3 || TANGO4
> 
> Maybe you can add COMPILE_TEST too.

You mean if I try to submit the driver, right?


>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index eb9f5fb02eef..7a98ccef937c 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -47,7 +47,10 @@
>>  #include <linux/bitops.h>
>>  #include <linux/leds.h>
>>  #include <linux/io.h>
>> +
>> +#ifdef CONFIG_MTD_PARTITIONS
>>  #include <linux/mtd/partitions.h>
>> +#endif
> 
> You don't need to make this inclusion conditional.
> 
>>  
>>  /* Define default oob placement schemes for large and small page devices */
>>  static struct nand_ecclayout nand_oob_8 = {
>> @@ -64,8 +67,11 @@ static struct nand_ecclayout nand_oob_16 = {
>>  	.eccbytes = 6,
>>  	.eccpos = {0, 1, 2, 3, 6, 7},
>>  	.oobfree = {
>> -		{.offset = 8,
>> -		 . length = 8} }
>> +#ifdef CONFIG_MTD_NAND_BBM
>> +		{.offset = 9, . length = 7}}		//nand bbm config
>> +#else
>> +		{.offset = 8, . length = 8}}
>> +#endif
>>  };
> 
> If you need to define your own ooblayout then it should be done at the
> NAND controller, and you should not make it conditional on some config
> option.

Hmmm, I think the CONFIG_MTD_NAND_BBM is for a different
product, so it can be ignored.

>> @@ -123,6 +132,12 @@ static int check_offs_len(struct mtd_info *mtd,
>>  		ret = -EINVAL;
>>  	}
>>  
>> +	/* Do not allow past end of device */
>> +	if (ofs + len > mtd->size) {
>> +		pr_debug( "%s: Past end of device\n",__func__);
>> +		ret = -EINVAL;
>> +	}
>> +
> 
> This is already checked at the MTD level, so I don't think you need
> that.
> 
>>  	return ret;
>>  }
>>  
>> @@ -646,7 +661,11 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
>>  	 * Apply this short delay always to ensure that we do wait tWB in
>>  	 * any case on any machine.
>>  	 */
>> +#ifdef CONFIG_TANGOX
>> +	udelay(1); /* needs to make it much longer than tWB */
>> +#else
>>  	ndelay(100);
>> +#endif
> 
> Yes, this delay here should probably depends on the NAND timings
> attached to the NAND device, but anyway, I don't think this should be
> done like this, so just drop it for the moment, and we'll find a way to
> express that differently.

There's a lot of cargo cult delays all over our drivers.

> BTW, could you explain why you need it to sleep for more than tWB?
> I think this is because you do not wait for the controller to
> acknowledge that the command has been sent to the NAND device, can you
> check that?

Could it be that, on some setups, ndelay(100) is equivalent
to no wait at all?


>>  	if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
>>  		chip->cmdfunc(mtd, NAND_CMD_STATUS_MULTI, -1, -1);
>> @@ -1493,15 +1521,18 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
>>  		if (realpage != chip->pagebuf || oob) {
>>  			bufpoi = aligned ? buf : chip->buffers->databuf;
>>  
>> +#if defined(CONFIG_TANGOX)
>>  			if (likely(sndcmd)) {
>>  				chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
>>  				sndcmd = 0;
>>  			}
>> +#endif
> 
> I don't see this conditional path in mainline, but anyway, you
> shouldn't change that: the READ0 command in send during the
> ->cmdfunc() call, and if you need to trigger another READ0 command,
> then you should probably do that in you ecc->read_xxx() implementations.

This is archeology. We are talking about the 3.4 kernel,
released almost 4 years ago.

> As I said, not sure this is a good idea to allow bad block erasure, and
> even if we decide to do we'll probably not use this ->retries = MAGICVAL
> trick.

<smirk>

>>  	return nand_block_checkbad(mtd, offs, 1, 0);
>>  }
>>  
>> @@ -2851,6 +2897,22 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
>>  		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
>>  		return 0;
>>  
>> +#ifdef CONFIG_TANGOX
>> +	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
>> +	for (i = 0; i < 3; i++) {
>> +		int j = 0;
>> +
>> +		for ( j = 0; j < sizeof(*p); j++ ) {
>> +			*(((uint8_t *)p)+j) = chip->read_byte(mtd);
>> +		}
>> +
>> +		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
>> +				le16_to_cpu(p->crc)) {
>> +			pr_info("ONFI param page %d valid\n", i);
>> +			break;
>> +		}
>> +	}
>> +#else
> 
> This fix is available in mainline, so you can drop it.

I got into a heated exchange over this patch (specifically
how one should use git cherry-pick).

>>  	mtd->writesize = le32_to_cpu(p->byte_per_page);
>> -	mtd->erasesize = le32_to_cpu(p->pages_per_block) * mtd->writesize;
>> +
>> +	/*
>> +	 * pages_per_block and blocks_per_lun may not be a power-of-2 size
>> +	 * (don't ask me who thought of this...). MTD assumes that these
>> +	 * dimensions will be power-of-2, so just truncate the remaining area.
>> +	 */
>> +	mtd->erasesize = 1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
>> +	mtd->erasesize *= mtd->writesize;
>> +
> 
> Hm, I'd like to have a real example (all the chips I've seen so far
> are using power-of-2 here). And even if that's the case, then this means
> we should patch nand_base to deal with that.

As Brian pointed out, this patch didn't come from here.
The well-thought out comment is a dead giveaway.

>>  	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
>>  	*busw = 0;
>>  	if (le16_to_cpu(p->features) & 1)
>>  		*busw = NAND_BUSWIDTH_16;
>>  
>> -	chip->options |= NAND_NO_READRDY | NAND_NO_AUTOINCR;
>> +	chip->options &= ~NAND_CHIPOPTIONS_MSK;
>> +	chip->options |= (NAND_NO_READRDY |
>> +			NAND_NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
> 
> Hm, can this really happens? Can we really have something set in
> ->options before entering this function?

Are you asking me?

>> @@ -2995,14 +3072,17 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>>  		 * Field definitions are in the following datasheets:
>>  		 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
>>  		 * New style   (6 byte ID): Samsung K9GBG08U0M (p.40)
>> +		 * Micron      (5 byte ID): Micron MT29F16G08MAA (p.24)
>> +		 *      Note: Micron rule is based on heuristics for
>> +		 *            newer chips

http://lists.infradead.org/pipermail/linux-mtd/2010-July/031068.html

>>  		 *
>>  		 * Check for wraparound + Samsung ID + nonzero 6th byte
>>  		 * to decide what to do.
>>  		 */
>> -		if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
>> +		if ((id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
>>  				id_data[0] == NAND_MFR_SAMSUNG &&
>>  				(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
>> -				id_data[5] != 0x00) {
>> +				id_data[5] != 0x00) || (id_data[0] == NAND_MFR_MIRA)) {
>>  			/* Calc pagesize */
>>  			mtd->writesize = 2048 << (extid & 0x03);
>>  			extid >>= 2;
>> @@ -3026,19 +3106,47 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>>  			mtd->erasesize = (128 * 1024) <<
>>  				(((extid >> 1) & 0x04) | (extid & 0x03));
>>  			busw = 0;
>> -		} else {
>> +		} else if (id_data[0] == NAND_MFR_ESMT) {
>>  			/* Calc pagesize */
>>  			mtd->writesize = 1024 << (extid & 0x03);
>>  			extid >>= 2;
>>  			/* Calc oobsize */
>> -			mtd->oobsize = (8 << (extid & 0x01)) *
>> -				(mtd->writesize >> 9);
>> +			mtd->oobsize = (8 << (extid & 0x01)) * (mtd->writesize / 512) ;
> 
> Exactly the same as the operation you removed, so the NAND_MFR_ESMT
> case is just the default case.
> 
>>  			extid >>= 2;
>> -			/* Calc blocksize. Blocksize is multiples of 64KiB */
>> +			/* Calc blocksize */
>>  			mtd->erasesize = (64 * 1024) << (extid & 0x03);
>> +			busw = 0;
>> +		} else {
>> +			/* Calc pagesize */
>> +			mtd->writesize = 1024 << (extid & 0x03);
>>  			extid >>= 2;
>> -			/* Get buswidth information */
>> -			busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
>> +
>> +			/* Check for 5 byte ID + Micron + read more 0x00 */
>> +			if (id_data[0] == NAND_MFR_MICRON && id_data[4] != 0x00
>> +					&& mtd->writesize >= 4096
>> +					&& id_data[5] == 0x00
>> +					&& id_data[6] == 0x00) {
>> +				/* OOB is 218B/224B per 4KiB pagesize */
>> +				mtd->oobsize = ((extid & 0x03) == 0x03 ? 218 :
>> +						224) << (mtd->writesize >> 13);
>> +				extid >>= 3;
>> +				/* Blocksize is multiple of 64KiB */
>> +				mtd->erasesize = mtd->writesize <<
>> +					(extid & 0x03) << 6;
>> +				/* All Micron have busw x8? */
>> +				printk("[%s] All Micron : %d\n", __func__, extid);
> 
> Maybe this handling is needed, I'll try to have a look at the Micron
> datasheet. Anyway, this should be moved in nand_decode_ext_id().

I think this is also part of Brian's patch:
http://lists.infradead.org/pipermail/linux-mtd/2010-July/031068.html

>> @@ -3156,7 +3270,42 @@ ident_done:
>>  		nand_manuf_ids[maf_idx].name,
>>  		chip->onfi_version ? chip->onfi_params.model : type->name);
>>  
>> +	if (chip->onfi_version)
>> +		snprintf(onfi_version, sizeof(onfi_version), "%d.%d",
>> +					chip->onfi_version / 10,
>> +					chip->onfi_version % 10);
>> +	else
>> +		snprintf(onfi_version, sizeof(onfi_version), "%s", "0");
>> +
>> +	/* ID Data Mapping */
>> +	for (i = 0; i < 8; i++)
>> +	{
>> +		mtd->id_data[i] = id_data[i];
>> +	}
>> +
>> +	mtd->onfi_version = kstrdup(onfi_version, GFP_KERNEL);
>> +	if (!mtd->onfi_version)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	mtd->nand_manufacturer = kstrdup(nand_manuf_ids[maf_idx].name, GFP_KERNEL);
>> +	if (!mtd->nand_manufacturer) {
>> +		ret = -ENOMEM;
>> +		goto out_onfi_version;
>> +	}
>> +
>> +	mtd->nand_type = kstrdup(type->name, GFP_KERNEL);
>> +	if (!mtd->nand_type) {
>> +		ret = -ENOMEM;
>> +		goto out_nand_type;
>> +	}
>> +
>>  	return type;
>> +
>> +out_nand_type:
>> +	kfree(mtd->nand_type);
>> +out_onfi_version:
>> +	kfree(mtd->onfi_version);
>> +	return ERR_PTR(ret);
>>  }
> 
> You can drop all the above chunk.

I thought you'd written "all the above junk" :-)


>> @@ -3259,6 +3423,19 @@ int nand_scan_tail(struct mtd_info *mtd)
>>  		case 128:
>>  			chip->ecc.layout = &nand_oob_128;
>>  			break;
>> +		case 224:
>> +			chip->ecc.layout = &nand_oob_mlcbch_224;
>> +			//8 bit bch ecc for Micron 1G flash, 224 oobsize use 128 for ecc
>> +			//for(i=224-112,k=0;i<224;k++,i++)
>> +			//	chip->ecc.layout->eccpos[k]=i;
>> +			//chip->ecc.layout->oobfree[0].offset=3;
>> +			//chip->ecc.layout->oobfree[0].length=(224-112-3);
>> +			break;
>> +#ifndef CONFIG_MTD_NAND_ECC_512
>> +		case 448:
>> +			chip->ecc.layout = &nand_oob_mlcbch_448;
>> +			break;
>> +#endif
> 
> Let's see if we can build those layout dynamically...

You mean compute the array at run-time, instead of having it
pre-computed and hard-coded?


>> diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
>> index af4fe8ca7b5e..2f14ff5efb4c 100644
>> --- a/drivers/mtd/nand/nand_ids.c
>> +++ b/drivers/mtd/nand/nand_ids.c
>> @@ -107,22 +107,26 @@ struct nand_flash_dev nand_flash_ids[] = {
>>  	/* 8 Gigabit */
>>  	{"NAND 1GiB 1,8V 8-bit",	0xA3, 0, 1024, 0, LP_OPTIONS},
>>  	{"NAND 1GiB 3,3V 8-bit",	0xD3, 0, 1024, 0, LP_OPTIONS},
>> +	{"NAND 1GiB 3,3V 8-bit",	0x38, 0, 1024, 0, LP_OPTIONS},
>>  	{"NAND 1GiB 1,8V 16-bit",	0xB3, 0, 1024, 0, LP_OPTIONS16},
>>  	{"NAND 1GiB 3,3V 16-bit",	0xC3, 0, 1024, 0, LP_OPTIONS16},
>>  
>>  	/* 16 Gigabit */
>>  	{"NAND 2GiB 1,8V 8-bit",	0xA5, 0, 2048, 0, LP_OPTIONS},
>>  	{"NAND 2GiB 3,3V 8-bit",	0xD5, 0, 2048, 0, LP_OPTIONS},
>> +	{"NAND 2GiB 3,3V 8-bit",	0x48, 0, 2048, 0, LP_OPTIONS},

At least this one comes from Brian's patch.

>>  	{"NAND 2GiB 1,8V 16-bit",	0xB5, 0, 2048, 0, LP_OPTIONS16},
>>  	{"NAND 2GiB 3,3V 16-bit",	0xC5, 0, 2048, 0, LP_OPTIONS16},
>>  
>>  	/* 32 Gigabit */
>> +	{"NAND 4GiB 3,3V 8-bit",	0x68, 0, 4096, 0, LP_OPTIONS},
>>  	{"NAND 4GiB 1,8V 8-bit",	0xA7, 0, 4096, 0, LP_OPTIONS},
>>  	{"NAND 4GiB 3,3V 8-bit",	0xD7, 0, 4096, 0, LP_OPTIONS},
>>  	{"NAND 4GiB 1,8V 16-bit",	0xB7, 0, 4096, 0, LP_OPTIONS16},
>>  	{"NAND 4GiB 3,3V 16-bit",	0xC7, 0, 4096, 0, LP_OPTIONS16},
>>  
>>  	/* 64 Gigabit */
>> +	{"NAND 8GiB 3,3V 8-bit",	0x88, 0, 8192, 0, LP_OPTIONS},
>>  	{"NAND 8GiB 1,8V 8-bit",	0xAE, 0, 8192, 0, LP_OPTIONS},
>>  	{"NAND 8GiB 3,3V 8-bit",	0xDE, 0, 8192, 0, LP_OPTIONS},
>>  	{"NAND 8GiB 1,8V 16-bit",	0xBE, 0, 8192, 0, LP_OPTIONS16},
>> @@ -135,6 +139,7 @@ struct nand_flash_dev nand_flash_ids[] = {
>>  	{"NAND 16GiB 3,3V 16-bit",	0x4A, 0, 16384, 0, LP_OPTIONS16},
>>  
>>  	/* 256 Gigabit */
>> +	{"NAND 32GiB 3,3V 8-bit",	0xA8, 0, 32768, 0, LP_OPTIONS},
>>  	{"NAND 32GiB 1,8V 8-bit",	0x1C, 0, 32768, 0, LP_OPTIONS},
>>  	{"NAND 32GiB 3,3V 8-bit",	0x3C, 0, 32768, 0, LP_OPTIONS},
>>  	{"NAND 32GiB 1,8V 16-bit",	0x2C, 0, 32768, 0, LP_OPTIONS16},
> 
> Maybe those chips should be defined with full IDs. Again, I need to
> look at the datasheet to give a definitive answer.
> 
>> @@ -161,7 +166,22 @@ struct nand_flash_dev nand_flash_ids[] = {
>>  	 BBT_AUTO_REFRESH
>>  	},
>>  
>> -	{NULL,}
>> +	/*
>> +	 * Fill-in gaps, may be refilled at the runtime
>> +	 */
>> +	{"                                ", 0, },
>> +	{"                                ", 0, },
>> +	{"                                ", 0, },
>> +	{"                                ", 0, },
>> +	{"                                ", 0, },
>> +	{"                                ", 0, },
>> +	{"                                ", 0, },
>> +	{"                                ", 0, },
>> +
>> +	/*
>> +	 * Terminates the table
>> +	 */
>> +	{NULL, },
>>  };
> 
> Let's say I didn't see that. Please remove it :).

"Interesting" isn't it?

>> @@ -178,6 +198,8 @@ struct nand_manufacturers nand_manuf_ids[] = {
>>  	{NAND_MFR_MICRON, "Micron"},
>>  	{NAND_MFR_AMD, "AMD"},
>>  	{NAND_MFR_MACRONIX, "Macronix"},
>> +	{NAND_MFR_ESMT, "ESMT"},
> 
> There's already an entry for EON, so putting the "EON/ESMT" should be
> good.

The IDs are unique?
There have been less than 256 manufacturers, ever?


>> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
>> index cf5ea8cdcf8e..90b5caf8cacd 100644
>> --- a/include/linux/mtd/mtd.h
>> +++ b/include/linux/mtd/mtd.h
>> @@ -157,6 +157,12 @@ struct mtd_info {
>>  	unsigned int erasesize_mask;
>>  	unsigned int writesize_mask;
>>  
>> +	/* NAND related attributes */
>> +	const char *nand_type;
>> +	const char *nand_manufacturer;
>> +	const char *onfi_version;
>> +	u8 id_data[8];
>> +
> 
> Drop those field.
> 
>>  	// Kernel-only stuff starts here.
>>  	const char *name;
>>  	int index;
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 248351344718..f58f617ea562 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -215,6 +215,9 @@ typedef enum {
>>  #define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT) \
>>  					&& (chip->page_shift > 9))
>>  
>> +/* Mask to zero out the chip options, which come from the id table */
>> +#define NAND_CHIPOPTIONS_MSK	(0x0000ffff & ~NAND_NO_AUTOINCR)
>> +
> 
> I'm pretty sure you don't need this macro.
> 
>>  /* Non chip related options */
>>  /* This option skips the bbt scan during initialization. */
>>  #define NAND_SKIP_BBTSCAN	0x00010000
>> @@ -471,6 +474,8 @@ struct nand_buffers {
>>   * @controller:		[REPLACEABLE] a pointer to a hardware controller
>>   *			structure which is shared among multiple independent
>>   *			devices.
>> + * @maf_id:		[OPTOINAL] manufacture ID 
>> + * @dev_id:		[OPTIONAL] device ID
>>   * @priv:		[OPTIONAL] pointer to private chip data
>>   * @errstat:		[OPTIONAL] hardware specific function to perform
>>   *			additional error status checks (determine if errors are
>> @@ -540,6 +545,9 @@ struct nand_chip {
>>  
>>  	struct nand_bbt_descr *badblock_pattern;
>>  
>> +	int maf_id;
>> +	int dev_id;
>> +
> 
> Let's drop those fields for now.
> 
>>  	void *priv;
>>  };
>>  
>> @@ -556,6 +564,8 @@ struct nand_chip {
>>  #define NAND_MFR_MICRON		0x2c
>>  #define NAND_MFR_AMD		0x01
>>  #define NAND_MFR_MACRONIX	0xc2
>> +#define NAND_MFR_ESMT		0x92
> 
> As Geert said, not sure we have to redefine a new macro, just say that
> EON and ESMT are the same.

But if someone expects ESMT, are they supposed to know
EON was swallowed by ESMT?

>> +#define NAND_MFR_MIRA		0xc8

What about this one?

http://www.deutron.com.tw/miles.htm
2002 MIRA renamed as Deutron focus on DRAM spot market.

http://www.datasheetspdf.com/PDF/PSU8GA30AT/897320/1

Anyway, many many thanks for having taken such a close look
at this patch.

Regards.
