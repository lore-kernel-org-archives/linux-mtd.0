Received: from ptb-relay03.plus.net ([212.159.14.214])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfiRd-0005EH-Nc
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 12:32:45 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041218161923.GD1083@wohnheim.fh-wedel.de>
References: <1103152743.15913.33.camel@squizzey.bult.co.uk>
	<41C0D3AC.3050801@us.ibm.com>
	<1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<20041218161923.GD1083@wohnheim.fh-wedel.de>
Content-Type: multipart/mixed; boundary="=-CoN9HT23eeQc+JpJl+H+"
Date: Sat, 18 Dec 2004 17:32:35 +0000
Message-Id: <1103391155.10788.13.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-CoN9HT23eeQc+JpJl+H+
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ok,

There's a public health warning attached to this code ..

I've not cleaned it up and I've not added any comments ..

(!)

fyi; I don't use mkfs.jffs2 .. I flash_eraseall the device then work
from there with "tar".. there seems to be no benefit [for me] to using
mkfs and it seems a little more reliant on the device size than the
erase program.

Gareth.

On Sat, 2004-12-18 at 17:19 +0100, J=F6rn Engel wrote:
> On Thu, 16 December 2004 21:47:49 +0000, Gareth Bult (Encryptec) wrote:
> >=20
> > blkmtd.c is pretty much a rewrite, less than half the size and uses t=
he
> > system buffer cache instead of reading / writing directly to the devi=
ce.
> > This boosts performance x 3 on read x lots on write. [I get x 100
> > faster] (albeit you lose bad block detection on write)
> >=20
> > If anyone's interested in the code, let me know and I'll clean it up =
and
> > post it .. however it'll be a new file and not a patch.
>=20
> Sure am!  If the code lives up to your promises I'd like to read it
> (might learn something new) and possibly use it sometime soon.
>=20
> J=F6rn
>=20

--=-CoN9HT23eeQc+JpJl+H+
Content-Disposition: attachment; filename=blkmtd.c
Content-Type: text/x-csrc; name=blkmtd.c; charset=us-ascii
Content-Transfer-Encoding: 7bit

/*
 * $Id: blkmtd.c,v 1.23 2004/08/09 14:03:19 dwmw2 Exp $
 *
 * blkmtd.c - use a block device as a fake MTD
 *
 * Author: Simon Evans <spse@secret.org.uk>
 *
 * Copyright (C) 2001,2002 Simon Evans
 *
 * Licence: GPL
 *
 * How it works:
 *	The driver uses raw/io to read/write the device and the page
 *	cache to cache access. Writes update the page cache with the
 *	new data and mark it dirty and add the page into a BIO which
 *	is then written out.
 *
 *	It can be loaded Read-Only to prevent erases and writes to the
 *	medium.
 *
 */

#include <linux/config.h>
#include <linux/module.h>
#include <linux/fs.h>
#include <linux/blkdev.h>
#include <linux/bio.h>
#include <linux/pagemap.h>
#include <linux/list.h>
#include <linux/init.h>
#include <linux/mtd/mtd.h>
#include <linux/buffer_head.h>

#define err(format, arg...) printk(KERN_ERR "blkmtd: " format "\n" , ## arg)
#define info(format, arg...) printk(KERN_INFO "blkmtd: " format "\n" , ## arg)
#define warn(format, arg...) printk(KERN_WARNING "blkmtd: " format "\n" , ## arg)
#define crit(format, arg...) printk(KERN_CRIT "blkmtd: " format "\n" , ## arg)


/* Default erase size in K, always make it a multiple of PAGE_SIZE */
#define CONFIG_MTD_BLKDEV_ERASESIZE (128 << 10)	/* 128KiB */
#define VERSION "$Revision: 1.23 $"

/* Info for the block device */
struct blkmtd_dev {
	struct list_head list;
	struct block_device *blkdev;
	struct mtd_info mtd_info;
	struct semaphore wrbuf_mutex;
};


/* Static info about the MTD, used in cleanup_module */
static LIST_HEAD(blkmtd_device_list);

static void blkmtd_sync(struct mtd_info *mtd);

#define MAX_DEVICES 4

/* Module parameters passed by insmod/modprobe */
char *device[MAX_DEVICES];    /* the block device to use */
int erasesz[MAX_DEVICES];     /* optional default erase size */
int ro[MAX_DEVICES];          /* optional read only flag */
int sync;


MODULE_LICENSE("GPL");
MODULE_AUTHOR("Simon Evans <spse@secret.org.uk>");
MODULE_DESCRIPTION("Emulate an MTD using a block device");
MODULE_PARM(device, "1-4s");
MODULE_PARM_DESC(device, "block device to use");
MODULE_PARM(erasesz, "1-4i");
MODULE_PARM_DESC(erasesz, "optional erase size to use in KiB. eg 4=4KiB.");
MODULE_PARM(ro, "1-4i");
MODULE_PARM_DESC(ro, "1=Read only, writes and erases cause errors");
MODULE_PARM(sync, "i");
MODULE_PARM_DESC(sync, "1=Synchronous writes");

#define PAGE_READAHEAD 64

void cache_readahead(struct address_space *mapping, int index)
{
	filler_t *filler = (filler_t*)(mapping->a_ops->readpage);
	int i,pagei;
	unsigned ret = 0;
	unsigned long end_index;
	struct page *page;
	LIST_HEAD(page_pool);
	struct inode *inode = mapping->host;
	loff_t isize = i_size_read(inode);

	if(!isize) {
		printk(KERN_INFO "iSize=0 in cache_readahead\n");
		return;
	}

	end_index = ((isize - 1) >> PAGE_CACHE_SHIFT);

	spin_lock_irq(&mapping->tree_lock);
	for(i=0;i<PAGE_READAHEAD;i++) {
		pagei=index+i;
		if (pagei > end_index) {
			printk(KERN_INFO "Overrun end of disk in cache readahead\n");
			break;
		}
		page = radix_tree_lookup(&mapping->page_tree, pagei);
		if(page && (!i)) break;
		if(page) continue;
		spin_unlock_irq(&mapping->tree_lock);
		page = page_cache_alloc_cold(mapping);
		spin_lock_irq(&mapping->tree_lock);
		if(!page) break;
		page->index=pagei;
		list_add(&page->lru, &page_pool);
		ret++;
	}
	spin_unlock_irq(&mapping->tree_lock);
	if(ret) {
		read_cache_pages(mapping, &page_pool, filler, NULL);
		//printk(KERN_INFO "Readahead [%d/%d] pages from [%d]\n",ret,PAGE_READAHEAD,index);
	}
}

static struct page* page_readahead(struct address_space *mapping, int index)
{
	filler_t *filler = (filler_t*)(mapping->a_ops->readpage);
	cache_readahead(mapping,index);
	return read_cache_page(mapping, index, filler, NULL);
}
/**
 * write_pages - write block of data to device via the page cache
 * @dev: device to write to
 * @buf: data source or NULL if erase (output is set to 0xff)
 * @to: offset into output device
 * @len: amount to data to write
 * @retlen: amount of data written
 *
 * Grab pages from the page cache and fill them with the source data.
 * Non page aligned start and end result in a readin of the page and
 * part of the page being modified. Pages are added to the bio and then written
 * out.
 */

static int write_pages(struct blkmtd_dev *dev, const u_char *buf, loff_t to, size_t len, size_t *retlen)
{
	struct	page *page;
	struct	address_space *mapping = dev->blkdev->bd_inode->i_mapping;
	//
	int	err	= 0;			// return status
	int	index	= to >> PAGE_SHIFT;	// page index
	int	offset 	= to & ~PAGE_MASK;	// page offset
	//

	static int my_read()
	{
		err=0;
		page = page_readahead(mapping,index);
		if( unlikely(!page) ) {
			crit("unable to read page (%d) in write_pages\n",index);
			err=-ENOMEM;
		}
		//if(IS_ERR(page)) err=-EIO;
		if(err) printk("READ ERROR\n");
		return err;
	}
	//
	static int my_erase()
	{
		int pages = len >> PAGE_SHIFT;
		unsigned char *p;
		unsigned char *max;
		int format;

		while(pages) {
			//printk(KERN_INFO "readahead on index (%d)\n",index);
			if(my_read()) return err;

			max = ((char*)page_address(page)+PAGE_SIZE);
			format = 0;

			for(p=(unsigned char*)page_address(page); p<max; p++) 
				if(*p != 0xff) {
					format=1;
					break;
				}

			if(format) {
				//DEBUG(3, "write_pages: erasing\n");
				lock_page(page);
				memset(page_address(page), 0xff, PAGE_SIZE);
				set_page_dirty(page);
				unlock_page(page);
			}
			page_cache_release(page);
			pages--;
			index++;
		}
		*retlen = len;
		return 0;
	}

	static int my_write()
	{
		int cpylen;

		if(retlen) *retlen = 0;
		//printk(KERN_INFO "Write req: %d\n",len);
		while(len) {
			if((offset+len) > PAGE_SIZE) 
				cpylen = PAGE_SIZE - offset;	// multiple pages
			else	cpylen = len;			// this page
			len = len - cpylen;
			//
			//	Get page
			//
			if(my_read()) return err;
			//
			if(memcmp(page_address(page)+offset,buf,cpylen)) {
				lock_page(page);
				memcpy(page_address(page) + offset,buf, cpylen);
				set_page_dirty(page);
				unlock_page(page);
			}
			page_cache_release(page);

			if(retlen) *retlen += cpylen;
			//
			buf+=cpylen;
			offset = 0;
			index++;
			//
		}
		//printk(KERN_INFO "Write act: %d\n",*retlen);
		return 0;
	}

	err=0;
	down(&dev->wrbuf_mutex);
	err = buf ? my_write() : my_erase();
	up(&dev->wrbuf_mutex);
	return err;
}

/* erase a specified part of the device */
static int blkmtd_erase(struct mtd_info *mtd, struct erase_info *instr)
{
	struct blkmtd_dev *dev = mtd->priv;
	struct mtd_erase_region_info *einfo = mtd->eraseregions;
	int numregions = mtd->numeraseregions;
	size_t from;
	u_long len;
	int err = -EIO;
	size_t retlen;

	instr->state = MTD_ERASING;
	from = instr->addr;
	len = instr->len;

	/* check erase region has valid start and length */
	//DEBUG(2, "blkmtd: erase: dev = `%s' from = 0x%zx len = 0x%lx\n", mtd->name+9, from, len);
	while(numregions) {
		DEBUG(3, "blkmtd: checking erase region = 0x%08X size = 0x%X num = 0x%x\n",
		      einfo->offset, einfo->erasesize, einfo->numblocks);
		if(from >= einfo->offset
		   && from < einfo->offset + (einfo->erasesize * einfo->numblocks)) {
			if(len == einfo->erasesize
			   && ( (from - einfo->offset) % einfo->erasesize == 0))
				break;
		}
		numregions--;
		einfo++;
	}

	if(!numregions) {
		/* Not a valid erase block */
		err("erase: invalid erase request 0x%lX @ 0x%08zX", len, from);
		instr->state = MTD_ERASE_FAILED;
		err = -EIO;
	}

	if(instr->state != MTD_ERASE_FAILED) {
		/* do the erase */
		DEBUG(3, "Doing erase from = %zd len = %ld\n", from, len);
		err = write_pages(dev, NULL, from, len, &retlen);
		if(err || retlen != len) {
			err("erase failed err = %d", err);
			instr->state = MTD_ERASE_FAILED;
		} else {
			instr->state = MTD_ERASE_DONE;
		}
	}

	DEBUG(3, "blkmtd: erase: checking callback\n");
	mtd_erase_callback(instr);
	DEBUG(2, "blkmtd: erase: finished (err = %d)\n", err);
	return err;
}

static int blkmtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
{
	struct blkmtd_dev *dev = mtd->priv;
	struct page *page;
	//
	int index	= from >> PAGE_SHIFT;
	int offset	= from - (index << PAGE_SHIFT);
	int cpylen;

	if(from > mtd->size) return -EINVAL;
	if(from + len > mtd->size) len = mtd->size - from;

	if(retlen) *retlen = 0;

	while(len) {
		if((offset+len) > PAGE_SIZE) 
			cpylen = PAGE_SIZE - offset;	// multiple pages
		else	cpylen = len;			// this page
		len = len - cpylen;
		//
		//	Get page
		//
		page = page_readahead(dev->blkdev->bd_inode->i_mapping,index);
		if(!page) return -ENOMEM;
		if(IS_ERR(page)) return -EIO;
		//
		memcpy(buf, page_address(page) + offset, cpylen);
		page_cache_release(page);
		//
		if(retlen) *retlen += cpylen;
		buf+=cpylen;
		offset = 0;
		index++;
		//
	}
	return 0;
}


/* write data to the underlying device */
static int blkmtd_write(struct mtd_info *mtd, loff_t to, size_t len,
			size_t *retlen, const u_char *buf)
{
	struct blkmtd_dev *dev = mtd->priv;
	int err;

	if(!len) return 0;
	if(to >= mtd->size) return -ENOSPC;
	if(to + len > mtd->size) len = mtd->size - to;

	err = write_pages(dev, buf, to, len, retlen);
	if(err > 0) err = 0;
	return err;
}


/* sync the device - wait until the write queue is empty */
static void blkmtd_sync(struct mtd_info *mtd)
{
	sync_blockdev(((struct blkmtd_dev*)mtd->priv)->blkdev);
	return;
}

static void free_device(struct blkmtd_dev *dev)
{
	DEBUG(2, "blkmtd: free_device() dev = %p\n", dev);
	if(dev) {
		if(dev->mtd_info.eraseregions)
			kfree(dev->mtd_info.eraseregions);
		if(dev->mtd_info.name)
			kfree(dev->mtd_info.name);

		if(dev->blkdev) {
			invalidate_inode_pages(dev->blkdev->bd_inode->i_mapping);
			close_bdev_excl(dev->blkdev);
		}
		kfree(dev);
	}
}


/* For a given size and initial erase size, calculate the number
 * and size of each erase region. Goes round the loop twice,
 * once to find out how many regions, then allocates space,
 * then round the loop again to fill it in.
 */
static struct mtd_erase_region_info *calc_erase_regions(
	size_t erase_size, size_t total_size, int *regions)
{
	struct mtd_erase_region_info *info = NULL;

	DEBUG(2, "calc_erase_regions, es = %zd size = %zd regions = %d\n",
	      erase_size, total_size, *regions);
	/* Make any user specified erasesize be a power of 2
	   and at least PAGE_SIZE */
	if(erase_size) {
		int es = erase_size;
		erase_size = 1;
		while(es != 1) {
			es >>= 1;
			erase_size <<= 1;
		}
		if(erase_size < PAGE_SIZE)
			erase_size = PAGE_SIZE;
	} else {
		erase_size = CONFIG_MTD_BLKDEV_ERASESIZE;
	}

	*regions = 0;

	do {
		int tot_size = total_size;
		int er_size = erase_size;
		int count = 0, offset = 0, regcnt = 0;

		while(tot_size) {
			count = tot_size / er_size;
			if(count) {
				tot_size = tot_size % er_size;
				if(info) {
					DEBUG(2, "adding to erase info off=%d er=%d cnt=%d\n",
					      offset, er_size, count);
					(info+regcnt)->offset = offset;
					(info+regcnt)->erasesize = er_size;
					(info+regcnt)->numblocks = count;
					(*regions)++;
				}
				regcnt++;
				offset += (count * er_size);
			}
			while(er_size > tot_size)
				er_size >>= 1;
		}
		if(info == NULL) {
			info = kmalloc(regcnt * sizeof(struct mtd_erase_region_info), GFP_KERNEL);
			if(!info)
				break;
		}
	} while(!(*regions));
	DEBUG(2, "calc_erase_regions done, es = %zd size = %zd regions = %d\n",
	      erase_size, total_size, *regions);
	return info;
}


extern dev_t __init name_to_dev_t(const char *line);

static struct blkmtd_dev *add_device(char *devname, int readonly, int erase_size)
{
	struct block_device *bdev;
	int mode;
	struct blkmtd_dev *dev;

	if(!devname)
		return NULL;

	/* Get a handle on the device */


#ifdef MODULE
	mode = (readonly) ? O_RDONLY : O_RDWR;
	bdev = open_bdev_excl(devname, mode, NULL);
#else
	mode = (readonly) ? FMODE_READ : FMODE_WRITE;
	bdev = open_by_devnum(name_to_dev_t(devname), mode);
#endif
	if(IS_ERR(bdev)) {
		err("error: cannot open device %s", devname);
		DEBUG(2, "blkmtd: opening bdev returned %ld\n", PTR_ERR(bdev));
		return NULL;
	}

	DEBUG(1, "blkmtd: found a block device major = %d, minor = %d\n",
	      MAJOR(bdev->bd_dev), MINOR(bdev->bd_dev));

	if(MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
		err("attempting to use an MTD device as a block device");
		blkdev_put(bdev);
		return NULL;
	}

	dev = kmalloc(sizeof(struct blkmtd_dev), GFP_KERNEL);
	if(dev == NULL) {
		blkdev_put(bdev);
		return NULL;
	}

	memset(dev, 0, sizeof(struct blkmtd_dev));
	dev->blkdev = bdev;
	atomic_set(&(dev->blkdev->bd_inode->i_mapping->truncate_count), 0);
	if(!readonly) {
		init_MUTEX(&dev->wrbuf_mutex);
	}

	dev->mtd_info.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;

	/* Setup the MTD structure */
	/* make the name contain the block device in */
	dev->mtd_info.name = kmalloc(sizeof("blkmtd: ") + strlen(devname), GFP_KERNEL);
	if(dev->mtd_info.name == NULL)
		goto devinit_err;

	sprintf(dev->mtd_info.name, "blkmtd: %s", devname);
	dev->mtd_info.eraseregions = calc_erase_regions(erase_size, dev->mtd_info.size,
							&dev->mtd_info.numeraseregions);
	if(dev->mtd_info.eraseregions == NULL)
		goto devinit_err;

	dev->mtd_info.erasesize = dev->mtd_info.eraseregions->erasesize;
	DEBUG(1, "blkmtd: init: found %d erase regions\n",
	      dev->mtd_info.numeraseregions);

	if(readonly) {
		dev->mtd_info.type = MTD_ROM;
		dev->mtd_info.flags = MTD_CAP_ROM;
	} else {
		dev->mtd_info.type = MTD_RAM;
		dev->mtd_info.flags = MTD_CAP_RAM;
		dev->mtd_info.erase = blkmtd_erase;
		dev->mtd_info.write = blkmtd_write;
		dev->mtd_info.writev = default_mtd_writev;
		dev->mtd_info.sync = blkmtd_sync;
	}
	dev->mtd_info.read = blkmtd_read;
	dev->mtd_info.readv = default_mtd_readv;
	dev->mtd_info.priv = dev;
	dev->mtd_info.owner = THIS_MODULE;

	list_add(&dev->list, &blkmtd_device_list);
	if (add_mtd_device(&dev->mtd_info)) {
		/* Device didnt get added, so free the entry */
		list_del(&dev->list);
		goto devinit_err;
	} else {
		info("mtd%d: [%s] erase_size = %dKiB %s [%ld]",
		     dev->mtd_info.index, dev->mtd_info.name + strlen("blkmtd: "),
		     dev->mtd_info.erasesize >> 10,
		     readonly ? "(read-only)" : "", PAGE_SIZE);
	}
	return dev;

 devinit_err:
	free_device(dev);
	return NULL;
}


/* Cleanup and exit - sync the device and kill of the kernel thread */
static void __devexit cleanup_blkmtd(void)
{
	struct list_head *temp1, *temp2;

	/* Remove the MTD devices */
	list_for_each_safe(temp1, temp2, &blkmtd_device_list) {
		struct blkmtd_dev *dev = list_entry(temp1, struct blkmtd_dev,
						    list);
		blkmtd_sync(&dev->mtd_info);
		del_mtd_device(&dev->mtd_info);
		info("mtd%d: [%s] removed", dev->mtd_info.index,
		     dev->mtd_info.name + strlen("blkmtd: "));
		list_del(&dev->list);
		free_device(dev);
	}
}

#ifndef MODULE

/* Handle kernel boot params */


static int __init param_blkmtd_device(char *str)
{
	int i;

	for(i = 0; i < MAX_DEVICES; i++) {
		device[i] = str;
		DEBUG(2, "blkmtd: device setup: %d = %s\n", i, device[i]);
		strsep(&str, ",");
	}
	return 1;
}


static int __init param_blkmtd_erasesz(char *str)
{
	int i;
	for(i = 0; i < MAX_DEVICES; i++) {
		char *val = strsep(&str, ",");
		if(val)
			erasesz[i] = simple_strtoul(val, NULL, 0);
		DEBUG(2, "blkmtd: erasesz setup: %d = %d\n", i, erasesz[i]);
	}

	return 1;
}


static int __init param_blkmtd_ro(char *str)
{
	int i;
	for(i = 0; i < MAX_DEVICES; i++) {
		char *val = strsep(&str, ",");
		if(val)
			ro[i] = simple_strtoul(val, NULL, 0);
		DEBUG(2, "blkmtd: ro setup: %d = %d\n", i, ro[i]);
	}

	return 1;
}


static int __init param_blkmtd_sync(char *str)
{
	if(str[0] == '1')
		sync = 1;
	return 1;
}

__setup("blkmtd_device=", param_blkmtd_device);
__setup("blkmtd_erasesz=", param_blkmtd_erasesz);
__setup("blkmtd_ro=", param_blkmtd_ro);
__setup("blkmtd_sync=", param_blkmtd_sync);

#endif


/* Startup */
static int __init init_blkmtd(void)
{
	int i;

	info("version " VERSION);
	/* Check args - device[0] is the bare minimum*/
	if(!device[0]) {
		err("error: missing `device' name\n");
		return -EINVAL;
	}

	for(i = 0; i < MAX_DEVICES; i++)
		add_device(device[i], ro[i], erasesz[i] << 10);

	if(list_empty(&blkmtd_device_list))
		return -EINVAL;

	return 0;
}

module_init(init_blkmtd);
module_exit(cleanup_blkmtd);

--=-CoN9HT23eeQc+JpJl+H+--
