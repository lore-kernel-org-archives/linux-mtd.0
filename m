Received: from ptb-relay01.plus.net ([212.159.14.212])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgkHc-0000Sf-IA
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:42:40 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041221133935.GG22636@wohnheim.fh-wedel.de>
References: <1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<20041218161923.GD1083@wohnheim.fh-wedel.de>
	<1103391155.10788.13.camel@squizzey.bult.co.uk>
	<20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
	<20041221133035.GE22636@wohnheim.fh-wedel.de>
	<20041221133935.GG22636@wohnheim.fh-wedel.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-32x5+7PZhVeYNrgpjfq1"
Date: Tue, 21 Dec 2004 13:42:41 +0000
Message-Id: <1103636561.10786.147.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/22] Add drivers/mtd/devices/blockmtd.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-32x5+7PZhVeYNrgpjfq1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ok,

Gimmie a clue - what did you change ?

Gareth.

On Tue, 2004-12-21 at 14:39 +0100, J=F6rn Engel wrote:
> J=F6rn
>=20
> --=20
> When you close your hand, you own nothing. When you open it up, you
> own the whole world.
> -- Li Mu Bai in Tiger & Dragon
>=20
> Add your driver under a new name.  There will be interface changes, so
> it needs to be renamed anyway.
>=20
> Signed-off-by: J=F6rn Engel <joern@wohnheim.fh-wedel.de>
> ---
>=20
>  blockmtd.c |  647 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>  1 files changed, 647 insertions(+)
>=20
> --- /dev/null	2004-08-21 20:14:47.000000000 +0200
> +++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-20 18:56:51.000=
000000 +0100
> @@ -0,0 +1,647 @@
> +/*
> + * $Id: blkmtd.c,v 1.23 2004/08/09 14:03:19 dwmw2 Exp $
> + *
> + * blkmtd.c - use a block device as a fake MTD
> + *
> + * Author: Simon Evans <spse@secret.org.uk>
> + *
> + * Copyright (C) 2001,2002 Simon Evans
> + *
> + * Licence: GPL
> + *
> + * How it works:
> + *	The driver uses raw/io to read/write the device and the page
> + *	cache to cache access. Writes update the page cache with the
> + *	new data and mark it dirty and add the page into a BIO which
> + *	is then written out.
> + *
> + *	It can be loaded Read-Only to prevent erases and writes to the
> + *	medium.
> + *
> + */
> +
> +#include <linux/config.h>
> +#include <linux/module.h>
> +#include <linux/fs.h>
> +#include <linux/blkdev.h>
> +#include <linux/bio.h>
> +#include <linux/pagemap.h>
> +#include <linux/list.h>
> +#include <linux/init.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/buffer_head.h>
> +
> +#define err(format, arg...) printk(KERN_ERR "blkmtd: " format "\n" , ## =
arg)
> +#define info(format, arg...) printk(KERN_INFO "blkmtd: " format "\n" , #=
# arg)
> +#define warn(format, arg...) printk(KERN_WARNING "blkmtd: " format "\n" =
, ## arg)
> +#define crit(format, arg...) printk(KERN_CRIT "blkmtd: " format "\n" , #=
# arg)
> +
> +
> +/* Default erase size in K, always make it a multiple of PAGE_SIZE */
> +#define CONFIG_MTD_BLKDEV_ERASESIZE (128 << 10)	/* 128KiB */
> +#define VERSION "$Revision: 1.23 $"
> +
> +/* Info for the block device */
> +struct blkmtd_dev {
> +	struct list_head list;
> +	struct block_device *blkdev;
> +	struct mtd_info mtd_info;
> +	struct semaphore wrbuf_mutex;
> +};
> +
> +
> +/* Static info about the MTD, used in cleanup_module */
> +static LIST_HEAD(blkmtd_device_list);
> +
> +static void blkmtd_sync(struct mtd_info *mtd);
> +
> +#define MAX_DEVICES 4
> +
> +/* Module parameters passed by insmod/modprobe */
> +char *device[MAX_DEVICES];    /* the block device to use */
> +int erasesz[MAX_DEVICES];     /* optional default erase size */
> +int ro[MAX_DEVICES];          /* optional read only flag */
> +int sync;
> +
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Simon Evans <spse@secret.org.uk>");
> +MODULE_DESCRIPTION("Emulate an MTD using a block device");
> +MODULE_PARM(device, "1-4s");
> +MODULE_PARM_DESC(device, "block device to use");
> +MODULE_PARM(erasesz, "1-4i");
> +MODULE_PARM_DESC(erasesz, "optional erase size to use in KiB. eg 4=3D4Ki=
B.");
> +MODULE_PARM(ro, "1-4i");
> +MODULE_PARM_DESC(ro, "1=3DRead only, writes and erases cause errors");
> +MODULE_PARM(sync, "i");
> +MODULE_PARM_DESC(sync, "1=3DSynchronous writes");
> +
> +#define PAGE_READAHEAD 64
> +
> +void cache_readahead(struct address_space *mapping, int index)
> +{
> +	filler_t *filler =3D (filler_t*)(mapping->a_ops->readpage);
> +	int i,pagei;
> +	unsigned ret =3D 0;
> +	unsigned long end_index;
> +	struct page *page;
> +	LIST_HEAD(page_pool);
> +	struct inode *inode =3D mapping->host;
> +	loff_t isize =3D i_size_read(inode);
> +
> +	if(!isize) {
> +		printk(KERN_INFO "iSize=3D0 in cache_readahead\n");
> +		return;
> +	}
> +
> +	end_index =3D ((isize - 1) >> PAGE_CACHE_SHIFT);
> +
> +	spin_lock_irq(&mapping->tree_lock);
> +	for(i=3D0;i<PAGE_READAHEAD;i++) {
> +		pagei=3Dindex+i;
> +		if (pagei > end_index) {
> +			printk(KERN_INFO "Overrun end of disk in cache readahead\n");
> +			break;
> +		}
> +		page =3D radix_tree_lookup(&mapping->page_tree, pagei);
> +		if(page && (!i)) break;
> +		if(page) continue;
> +		spin_unlock_irq(&mapping->tree_lock);
> +		page =3D page_cache_alloc_cold(mapping);
> +		spin_lock_irq(&mapping->tree_lock);
> +		if(!page) break;
> +		page->index=3Dpagei;
> +		list_add(&page->lru, &page_pool);
> +		ret++;
> +	}
> +	spin_unlock_irq(&mapping->tree_lock);
> +	if(ret) {
> +		read_cache_pages(mapping, &page_pool, filler, NULL);
> +		//printk(KERN_INFO "Readahead [%d/%d] pages from [%d]\n",ret,PAGE_READ=
AHEAD,index);
> +	}
> +}
> +
> +static struct page* page_readahead(struct address_space *mapping, int in=
dex)
> +{
> +	filler_t *filler =3D (filler_t*)(mapping->a_ops->readpage);
> +	cache_readahead(mapping,index);
> +	return read_cache_page(mapping, index, filler, NULL);
> +}
> +/**
> + * write_pages - write block of data to device via the page cache
> + * @dev: device to write to
> + * @buf: data source or NULL if erase (output is set to 0xff)
> + * @to: offset into output device
> + * @len: amount to data to write
> + * @retlen: amount of data written
> + *
> + * Grab pages from the page cache and fill them with the source data.
> + * Non page aligned start and end result in a readin of the page and
> + * part of the page being modified. Pages are added to the bio and then =
written
> + * out.
> + */
> +
> +static int write_pages(struct blkmtd_dev *dev, const u_char *buf, loff_t=
 to, size_t len, size_t *retlen)
> +{
> +	struct	page *page;
> +	struct	address_space *mapping =3D dev->blkdev->bd_inode->i_mapping;
> +	//
> +	int	err	=3D 0;			// return status
> +	int	index	=3D to >> PAGE_SHIFT;	// page index
> +	int	offset 	=3D to & ~PAGE_MASK;	// page offset
> +	//
> +
> +	static int my_read()
> +	{
> +		err=3D0;
> +		page =3D page_readahead(mapping,index);
> +		if( unlikely(!page) ) {
> +			crit("unable to read page (%d) in write_pages\n",index);
> +			err=3D-ENOMEM;
> +		}
> +		//if(IS_ERR(page)) err=3D-EIO;
> +		if(err) printk("READ ERROR\n");
> +		return err;
> +	}
> +	//
> +	static int my_erase()
> +	{
> +		int pages =3D len >> PAGE_SHIFT;
> +		unsigned char *p;
> +		unsigned char *max;
> +		int format;
> +
> +		while(pages) {
> +			//printk(KERN_INFO "readahead on index (%d)\n",index);
> +			if(my_read()) return err;
> +
> +			max =3D ((char*)page_address(page)+PAGE_SIZE);
> +			format =3D 0;
> +
> +			for(p=3D(unsigned char*)page_address(page); p<max; p++)=20
> +				if(*p !=3D 0xff) {
> +					format=3D1;
> +					break;
> +				}
> +
> +			if(format) {
> +				//DEBUG(3, "write_pages: erasing\n");
> +				lock_page(page);
> +				memset(page_address(page), 0xff, PAGE_SIZE);
> +				set_page_dirty(page);
> +				unlock_page(page);
> +			}
> +			page_cache_release(page);
> +			pages--;
> +			index++;
> +		}
> +		*retlen =3D len;
> +		return 0;
> +	}
> +
> +	static int my_write()
> +	{
> +		int cpylen;
> +
> +		if(retlen) *retlen =3D 0;
> +		//printk(KERN_INFO "Write req: %d\n",len);
> +		while(len) {
> +			if((offset+len) > PAGE_SIZE)=20
> +				cpylen =3D PAGE_SIZE - offset;	// multiple pages
> +			else	cpylen =3D len;			// this page
> +			len =3D len - cpylen;
> +			//
> +			//	Get page
> +			//
> +			if(my_read()) return err;
> +			//
> +			if(memcmp(page_address(page)+offset,buf,cpylen)) {
> +				lock_page(page);
> +				memcpy(page_address(page) + offset,buf, cpylen);
> +				set_page_dirty(page);
> +				unlock_page(page);
> +			}
> +			page_cache_release(page);
> +
> +			if(retlen) *retlen +=3D cpylen;
> +			//
> +			buf+=3Dcpylen;
> +			offset =3D 0;
> +			index++;
> +			//
> +		}
> +		//printk(KERN_INFO "Write act: %d\n",*retlen);
> +		return 0;
> +	}
> +
> +	err=3D0;
> +	down(&dev->wrbuf_mutex);
> +	err =3D buf ? my_write() : my_erase();
> +	up(&dev->wrbuf_mutex);
> +	return err;
> +}
> +
> +/* erase a specified part of the device */
> +static int blkmtd_erase(struct mtd_info *mtd, struct erase_info *instr)
> +{
> +	struct blkmtd_dev *dev =3D mtd->priv;
> +	struct mtd_erase_region_info *einfo =3D mtd->eraseregions;
> +	int numregions =3D mtd->numeraseregions;
> +	size_t from;
> +	u_long len;
> +	int err =3D -EIO;
> +	size_t retlen;
> +
> +	instr->state =3D MTD_ERASING;
> +	from =3D instr->addr;
> +	len =3D instr->len;
> +
> +	/* check erase region has valid start and length */
> +	//DEBUG(2, "blkmtd: erase: dev =3D `%s' from =3D 0x%zx len =3D 0x%lx\n"=
, mtd->name+9, from, len);
> +	while(numregions) {
> +		DEBUG(3, "blkmtd: checking erase region =3D 0x%08X size =3D 0x%X num =
=3D 0x%x\n",
> +		      einfo->offset, einfo->erasesize, einfo->numblocks);
> +		if(from >=3D einfo->offset
> +		   && from < einfo->offset + (einfo->erasesize * einfo->numblocks)) {
> +			if(len =3D=3D einfo->erasesize
> +			   && ( (from - einfo->offset) % einfo->erasesize =3D=3D 0))
> +				break;
> +		}
> +		numregions--;
> +		einfo++;
> +	}
> +
> +	if(!numregions) {
> +		/* Not a valid erase block */
> +		err("erase: invalid erase request 0x%lX @ 0x%08zX", len, from);
> +		instr->state =3D MTD_ERASE_FAILED;
> +		err =3D -EIO;
> +	}
> +
> +	if(instr->state !=3D MTD_ERASE_FAILED) {
> +		/* do the erase */
> +		DEBUG(3, "Doing erase from =3D %zd len =3D %ld\n", from, len);
> +		err =3D write_pages(dev, NULL, from, len, &retlen);
> +		if(err || retlen !=3D len) {
> +			err("erase failed err =3D %d", err);
> +			instr->state =3D MTD_ERASE_FAILED;
> +		} else {
> +			instr->state =3D MTD_ERASE_DONE;
> +		}
> +	}
> +
> +	DEBUG(3, "blkmtd: erase: checking callback\n");
> +	mtd_erase_callback(instr);
> +	DEBUG(2, "blkmtd: erase: finished (err =3D %d)\n", err);
> +	return err;
> +}
> +
> +static int blkmtd_read(struct mtd_info *mtd, loff_t from, size_t len, si=
ze_t *retlen, u_char *buf)
> +{
> +	struct blkmtd_dev *dev =3D mtd->priv;
> +	struct page *page;
> +	//
> +	int index	=3D from >> PAGE_SHIFT;
> +	int offset	=3D from - (index << PAGE_SHIFT);
> +	int cpylen;
> +
> +	if(from > mtd->size) return -EINVAL;
> +	if(from + len > mtd->size) len =3D mtd->size - from;
> +
> +	if(retlen) *retlen =3D 0;
> +
> +	while(len) {
> +		if((offset+len) > PAGE_SIZE)=20
> +			cpylen =3D PAGE_SIZE - offset;	// multiple pages
> +		else	cpylen =3D len;			// this page
> +		len =3D len - cpylen;
> +		//
> +		//	Get page
> +		//
> +		page =3D page_readahead(dev->blkdev->bd_inode->i_mapping,index);
> +		if(!page) return -ENOMEM;
> +		if(IS_ERR(page)) return -EIO;
> +		//
> +		memcpy(buf, page_address(page) + offset, cpylen);
> +		page_cache_release(page);
> +		//
> +		if(retlen) *retlen +=3D cpylen;
> +		buf+=3Dcpylen;
> +		offset =3D 0;
> +		index++;
> +		//
> +	}
> +	return 0;
> +}
> +
> +
> +/* write data to the underlying device */
> +static int blkmtd_write(struct mtd_info *mtd, loff_t to, size_t len,
> +			size_t *retlen, const u_char *buf)
> +{
> +	struct blkmtd_dev *dev =3D mtd->priv;
> +	int err;
> +
> +	if(!len) return 0;
> +	if(to >=3D mtd->size) return -ENOSPC;
> +	if(to + len > mtd->size) len =3D mtd->size - to;
> +
> +	err =3D write_pages(dev, buf, to, len, retlen);
> +	if(err > 0) err =3D 0;
> +	return err;
> +}
> +
> +
> +/* sync the device - wait until the write queue is empty */
> +static void blkmtd_sync(struct mtd_info *mtd)
> +{
> +	sync_blockdev(((struct blkmtd_dev*)mtd->priv)->blkdev);
> +	return;
> +}
> +
> +static void free_device(struct blkmtd_dev *dev)
> +{
> +	DEBUG(2, "blkmtd: free_device() dev =3D %p\n", dev);
> +	if(dev) {
> +		if(dev->mtd_info.eraseregions)
> +			kfree(dev->mtd_info.eraseregions);
> +		if(dev->mtd_info.name)
> +			kfree(dev->mtd_info.name);
> +
> +		if(dev->blkdev) {
> +			invalidate_inode_pages(dev->blkdev->bd_inode->i_mapping);
> +			close_bdev_excl(dev->blkdev);
> +		}
> +		kfree(dev);
> +	}
> +}
> +
> +
> +/* For a given size and initial erase size, calculate the number
> + * and size of each erase region. Goes round the loop twice,
> + * once to find out how many regions, then allocates space,
> + * then round the loop again to fill it in.
> + */
> +static struct mtd_erase_region_info *calc_erase_regions(
> +	size_t erase_size, size_t total_size, int *regions)
> +{
> +	struct mtd_erase_region_info *info =3D NULL;
> +
> +	DEBUG(2, "calc_erase_regions, es =3D %zd size =3D %zd regions =3D %d\n"=
,
> +	      erase_size, total_size, *regions);
> +	/* Make any user specified erasesize be a power of 2
> +	   and at least PAGE_SIZE */
> +	if(erase_size) {
> +		int es =3D erase_size;
> +		erase_size =3D 1;
> +		while(es !=3D 1) {
> +			es >>=3D 1;
> +			erase_size <<=3D 1;
> +		}
> +		if(erase_size < PAGE_SIZE)
> +			erase_size =3D PAGE_SIZE;
> +	} else {
> +		erase_size =3D CONFIG_MTD_BLKDEV_ERASESIZE;
> +	}
> +
> +	*regions =3D 0;
> +
> +	do {
> +		int tot_size =3D total_size;
> +		int er_size =3D erase_size;
> +		int count =3D 0, offset =3D 0, regcnt =3D 0;
> +
> +		while(tot_size) {
> +			count =3D tot_size / er_size;
> +			if(count) {
> +				tot_size =3D tot_size % er_size;
> +				if(info) {
> +					DEBUG(2, "adding to erase info off=3D%d er=3D%d cnt=3D%d\n",
> +					      offset, er_size, count);
> +					(info+regcnt)->offset =3D offset;
> +					(info+regcnt)->erasesize =3D er_size;
> +					(info+regcnt)->numblocks =3D count;
> +					(*regions)++;
> +				}
> +				regcnt++;
> +				offset +=3D (count * er_size);
> +			}
> +			while(er_size > tot_size)
> +				er_size >>=3D 1;
> +		}
> +		if(info =3D=3D NULL) {
> +			info =3D kmalloc(regcnt * sizeof(struct mtd_erase_region_info), GFP_K=
ERNEL);
> +			if(!info)
> +				break;
> +		}
> +	} while(!(*regions));
> +	DEBUG(2, "calc_erase_regions done, es =3D %zd size =3D %zd regions =3D =
%d\n",
> +	      erase_size, total_size, *regions);
> +	return info;
> +}
> +
> +
> +extern dev_t __init name_to_dev_t(const char *line);
> +
> +static struct blkmtd_dev *add_device(char *devname, int readonly, int er=
ase_size)
> +{
> +	struct block_device *bdev;
> +	int mode;
> +	struct blkmtd_dev *dev;
> +
> +	if(!devname)
> +		return NULL;
> +
> +	/* Get a handle on the device */
> +
> +
> +#ifdef MODULE
> +	mode =3D (readonly) ? O_RDONLY : O_RDWR;
> +	bdev =3D open_bdev_excl(devname, mode, NULL);
> +#else
> +	mode =3D (readonly) ? FMODE_READ : FMODE_WRITE;
> +	bdev =3D open_by_devnum(name_to_dev_t(devname), mode);
> +#endif
> +	if(IS_ERR(bdev)) {
> +		err("error: cannot open device %s", devname);
> +		DEBUG(2, "blkmtd: opening bdev returned %ld\n", PTR_ERR(bdev));
> +		return NULL;
> +	}
> +
> +	DEBUG(1, "blkmtd: found a block device major =3D %d, minor =3D %d\n",
> +	      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));
> +
> +	if(MAJOR(bdev->bd_dev) =3D=3D MTD_BLOCK_MAJOR) {
> +		err("attempting to use an MTD device as a block device");
> +		blkdev_put(bdev);
> +		return NULL;
> +	}
> +
> +	dev =3D kmalloc(sizeof(struct blkmtd_dev), GFP_KERNEL);
> +	if(dev =3D=3D NULL) {
> +		blkdev_put(bdev);
> +		return NULL;
> +	}
> +
> +	memset(dev, 0, sizeof(struct blkmtd_dev));
> +	dev->blkdev =3D bdev;
> +	atomic_set(&(dev->blkdev->bd_inode->i_mapping->truncate_count), 0);
> +	if(!readonly) {
> +		init_MUTEX(&dev->wrbuf_mutex);
> +	}
> +
> +	dev->mtd_info.size =3D dev->blkdev->bd_inode->i_size & PAGE_MASK;
> +
> +	/* Setup the MTD structure */
> +	/* make the name contain the block device in */
> +	dev->mtd_info.name =3D kmalloc(sizeof("blkmtd: ") + strlen(devname), GF=
P_KERNEL);
> +	if(dev->mtd_info.name =3D=3D NULL)
> +		goto devinit_err;
> +
> +	sprintf(dev->mtd_info.name, "blkmtd: %s", devname);
> +	dev->mtd_info.eraseregions =3D calc_erase_regions(erase_size, dev->mtd_=
info.size,
> +							&dev->mtd_info.numeraseregions);
> +	if(dev->mtd_info.eraseregions =3D=3D NULL)
> +		goto devinit_err;
> +
> +	dev->mtd_info.erasesize =3D dev->mtd_info.eraseregions->erasesize;
> +	DEBUG(1, "blkmtd: init: found %d erase regions\n",
> +	      dev->mtd_info.numeraseregions);
> +
> +	if(readonly) {
> +		dev->mtd_info.type =3D MTD_ROM;
> +		dev->mtd_info.flags =3D MTD_CAP_ROM;
> +	} else {
> +		dev->mtd_info.type =3D MTD_RAM;
> +		dev->mtd_info.flags =3D MTD_CAP_RAM;
> +		dev->mtd_info.erase =3D blkmtd_erase;
> +		dev->mtd_info.write =3D blkmtd_write;
> +		dev->mtd_info.writev =3D default_mtd_writev;
> +		dev->mtd_info.sync =3D blkmtd_sync;
> +	}
> +	dev->mtd_info.read =3D blkmtd_read;
> +	dev->mtd_info.readv =3D default_mtd_readv;
> +	dev->mtd_info.priv =3D dev;
> +	dev->mtd_info.owner =3D THIS_MODULE;
> +
> +	list_add(&dev->list, &blkmtd_device_list);
> +	if (add_mtd_device(&dev->mtd_info)) {
> +		/* Device didnt get added, so free the entry */
> +		list_del(&dev->list);
> +		goto devinit_err;
> +	} else {
> +		info("mtd%d: [%s] erase_size =3D %dKiB %s [%ld]",
> +		     dev->mtd_info.index, dev->mtd_info.name + strlen("blkmtd: "),
> +		     dev->mtd_info.erasesize >> 10,
> +		     readonly ? "(read-only)" : "", PAGE_SIZE);
> +	}
> +	return dev;
> +
> + devinit_err:
> +	free_device(dev);
> +	return NULL;
> +}
> +
> +
> +/* Cleanup and exit - sync the device and kill of the kernel thread */
> +static void __devexit cleanup_blkmtd(void)
> +{
> +	struct list_head *temp1, *temp2;
> +
> +	/* Remove the MTD devices */
> +	list_for_each_safe(temp1, temp2, &blkmtd_device_list) {
> +		struct blkmtd_dev *dev =3D list_entry(temp1, struct blkmtd_dev,
> +						    list);
> +		blkmtd_sync(&dev->mtd_info);
> +		del_mtd_device(&dev->mtd_info);
> +		info("mtd%d: [%s] removed", dev->mtd_info.index,
> +		     dev->mtd_info.name + strlen("blkmtd: "));
> +		list_del(&dev->list);
> +		free_device(dev);
> +	}
> +}
> +
> +#ifndef MODULE
> +
> +/* Handle kernel boot params */
> +
> +
> +static int __init param_blkmtd_device(char *str)
> +{
> +	int i;
> +
> +	for(i =3D 0; i < MAX_DEVICES; i++) {
> +		device[i] =3D str;
> +		DEBUG(2, "blkmtd: device setup: %d =3D %s\n", i, device[i]);
> +		strsep(&str, ",");
> +	}
> +	return 1;
> +}
> +
> +
> +static int __init param_blkmtd_erasesz(char *str)
> +{
> +	int i;
> +	for(i =3D 0; i < MAX_DEVICES; i++) {
> +		char *val =3D strsep(&str, ",");
> +		if(val)
> +			erasesz[i] =3D simple_strtoul(val, NULL, 0);
> +		DEBUG(2, "blkmtd: erasesz setup: %d =3D %d\n", i, erasesz[i]);
> +	}
> +
> +	return 1;
> +}
> +
> +
> +static int __init param_blkmtd_ro(char *str)
> +{
> +	int i;
> +	for(i =3D 0; i < MAX_DEVICES; i++) {
> +		char *val =3D strsep(&str, ",");
> +		if(val)
> +			ro[i] =3D simple_strtoul(val, NULL, 0);
> +		DEBUG(2, "blkmtd: ro setup: %d =3D %d\n", i, ro[i]);
> +	}
> +
> +	return 1;
> +}
> +
> +
> +static int __init param_blkmtd_sync(char *str)
> +{
> +	if(str[0] =3D=3D '1')
> +		sync =3D 1;
> +	return 1;
> +}
> +
> +__setup("blkmtd_device=3D", param_blkmtd_device);
> +__setup("blkmtd_erasesz=3D", param_blkmtd_erasesz);
> +__setup("blkmtd_ro=3D", param_blkmtd_ro);
> +__setup("blkmtd_sync=3D", param_blkmtd_sync);
> +
> +#endif
> +
> +
> +/* Startup */
> +static int __init init_blkmtd(void)
> +{
> +	int i;
> +
> +	info("version " VERSION);
> +	/* Check args - device[0] is the bare minimum*/
> +	if(!device[0]) {
> +		err("error: missing `device' name\n");
> +		return -EINVAL;
> +	}
> +
> +	for(i =3D 0; i < MAX_DEVICES; i++)
> +		add_device(device[i], ro[i], erasesz[i] << 10);
> +
> +	if(list_empty(&blkmtd_device_list))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +module_init(init_blkmtd);
> +module_exit(cleanup_blkmtd);

--=-32x5+7PZhVeYNrgpjfq1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBByChRRX9MUnbSukkRAv/qAJ9n+GFCVAgf3W1T4Pq9cA/JIHa48QCfT0G0
9ZQQmY6pV5rWpKi/bqagxuE=
=kDDG
-----END PGP SIGNATURE-----

--=-32x5+7PZhVeYNrgpjfq1--
