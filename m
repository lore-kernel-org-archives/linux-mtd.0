Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TRE7-0005ki-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 16:25:51 +0000
Message-ID: <3A8C039F.F97F24EF@axis.com>
Date: Thu, 15 Feb 2001 17:28:15 +0100
From: Jonas Holmberg <jonas.holmberg@axis.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
CC: mtd@infradead.org
Subject: Support for AMD-compatible non-CFI flashes
Content-Type: multipart/mixed;
 boundary="------------82F8006CC9F3CE73BE5A09BE"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------82F8006CC9F3CE73BE5A09BE
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Here's my MTD-driver for AMD-compatible non-CFI flashes.
It only supports one 16-bit flash yet. Is it something you want to
include in mtd/kernel?

/Jonas
--------------82F8006CC9F3CE73BE5A09BE
Content-Type: text/plain; charset=us-ascii;
 name="amd_flash.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="amd_flash.c"

/*
 * MTD map driver for pre-CFI AMD compatible flash chips
 *
 * Copyright (c) 2001 Axis Communications AB
 *
 * This file is under GPL.
 *
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/errno.h>
#include <linux/malloc.h>
#include <linux/delay.h>
#include <linux/mtd/map.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/flashchip.h>

/* Addresses */
#define ADDR_MANUFACTURER		0x0000
#define ADDR_DEVICE_ID			0x0001
#define ADDR_UNLOCK_1			0x0555
#define ADDR_UNLOCK_2			0x02AA

/* Commands */
#define CMD_UNLOCK_DATA_1		0x00AA
#define CMD_UNLOCK_DATA_2		0x0055
#define CMD_MANUFACTURER_UNLOCK_DATA	0x0090
#define CMD_UNLOCK_BYPASS_MODE		0x0020
#define CMD_PROGRAM_UNLOCK_DATA		0x00A0
#define CMD_RESET_DATA			0x00F0
#define CMD_SECTOR_ERASE_UNLOCK_DATA	0x0080
#define CMD_SECTOR_ERASE_UNLOCK_DATA_2	0x0030

/* Manufacturers */
#define MANUFACTURER_AMD	0x0001
#define MANUFACTURER_FUJITSU	0x0004
#define MANUFACTURER_ST		0x0020
#define MANUFACTURER_SST	0x00BF
#define MANUFACTURER_TOSHIBA	0x0098

/* AMD */
#define AM29F800BB	0x2258
#define AM29F800BT	0x22D6
#define AM29LV800BB	0x225B
#define AM29LV800BT	0x22DA
#define AM29LV160DT	0x22C4
#define AM29LV160DB	0x2249

/* Fujitsu */
#define MBM29LV160TE	0x22C4
#define MBM29LV160BE	0x2249

/* ST - www.st.com */
#define M29W800T	0x00D7
#define M29W160DT	0x22C4
#define M29W160DB	0x2249

/* SST */
#define SST39LF800	0x2781
#define SST39LF160	0x2782

/* Toshiba */
#define TC58FVT160	0x00C2
#define TC58FVB160	0x0043

#define D6_MASK	0x40

#define FLASH_SEND_CMD(map, cmd) { \
	map->write16(map, CMD_UNLOCK_DATA_1, map->buswidth * ADDR_UNLOCK_1); \
	map->write16(map, CMD_UNLOCK_DATA_2, map->buswidth * ADDR_UNLOCK_2); \
	map->write16(map, cmd, map->buswidth * ADDR_UNLOCK_1); \
}

#define FLASH_SEND_CMD_TO_ADDR(map, cmd, addr) { \
	map->write16(map, CMD_UNLOCK_DATA_1, map->buswidth * ADDR_UNLOCK_1); \
	map->write16(map, CMD_UNLOCK_DATA_2, map->buswidth * ADDR_UNLOCK_2); \
	map->write16(map, cmd, addr); \
}

struct amd_flash_private {
	int numchips;	
//	const char *im_name;
	struct flchip chips[0];
};

struct amd_flash_info {
	const __u16 manu_id;
	const __u16 dev_id;
	const char *name;
	const u_long size;
	const int numeraseregions;
	const struct mtd_erase_region_info regions[4];
};



static int amd_flash_read(struct mtd_info *, loff_t, size_t, size_t *,
			  u_char *);
static int amd_flash_write(struct mtd_info *, loff_t, size_t, size_t *,
			   const u_char *);
static int amd_flash_erase(struct mtd_info *, struct erase_info *);
static void amd_flash_sync(struct mtd_info *);
static int amd_flash_suspend(struct mtd_info *);
static void amd_flash_resume(struct mtd_info *);

static void amd_flash_destroy(struct mtd_info *);

static const char im_name[] = "amd_flash";



struct mtd_info *amd_flash_probe(struct map_info *map)
{
	struct mtd_info *mtd;
	int chip_count = 0;
	__u16 manu_id, dev_id;
	struct flchip *chip;
	int i;
	int found;
	const struct amd_flash_info table[] = {
	{
		manu_id: MANUFACTURER_AMD,
		dev_id: AM29LV160DT,
		name: "AMD AM29LV160DT",
		size: 0x00200000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x10000, numblocks: 31 },
			{ offset: 0x1F0000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x1F8000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x1FC000, erasesize: 0x04000, numblocks:  1 }
		}
	}, {
		manu_id: MANUFACTURER_AMD,
		dev_id: AM29LV160DB,
		name: "AMD AM29LV160DB",
		size: 0x00200000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x04000, numblocks:  1 },
			{ offset: 0x004000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x008000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x010000, erasesize: 0x10000, numblocks: 31 }
		}
	}, {
		manu_id: MANUFACTURER_TOSHIBA,
		dev_id: TC58FVT160,
		name: "Toshiba TC58FVT160",
		size: 0x00200000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x10000, numblocks: 31 },
			{ offset: 0x1F0000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x1F8000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x1FC000, erasesize: 0x04000, numblocks:  1 }
		}
	}, {
		manu_id: MANUFACTURER_FUJITSU,
		dev_id: MBM29LV160TE,
		name: "Fujitsu MBM29LV160TE",
		size: 0x00200000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x10000, numblocks: 31 },
			{ offset: 0x1F0000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x1F8000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x1FC000, erasesize: 0x04000, numblocks:  1 }
		}
	}, {
		manu_id: MANUFACTURER_TOSHIBA,
		dev_id: TC58FVB160,
		name: "Toshiba TC58FVB160",
		size: 0x00200000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x04000, numblocks:  1 },
			{ offset: 0x004000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x008000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x010000, erasesize: 0x10000, numblocks: 31 }
		}
	}, {
		manu_id: MANUFACTURER_FUJITSU,
		dev_id: MBM29LV160BE,
		name: "Fujitsu MBM29LV160BE",
		size: 0x00200000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x04000, numblocks:  1 },
			{ offset: 0x004000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x008000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x010000, erasesize: 0x10000, numblocks: 31 }
		}
	}, {
		manu_id: MANUFACTURER_AMD,
		dev_id: AM29LV800BB,
		name: "AMD AM29LV800BB",
		size: 0x00100000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x04000, numblocks:  1 },
			{ offset: 0x004000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x008000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x010000, erasesize: 0x10000, numblocks: 15 }
		}
	}, {
		manu_id: MANUFACTURER_AMD,
		dev_id: AM29F800BB,
		name: "AMD AM29F800BB",
		size: 0x00100000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x04000, numblocks:  1 },
			{ offset: 0x004000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x008000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x010000, erasesize: 0x10000, numblocks: 15 }
		}
	}, {
		manu_id: MANUFACTURER_AMD,
		dev_id: AM29LV800BT,
		name: "AMD AM29LV800BT",
		size: 0x00100000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x10000, numblocks: 15 },
			{ offset: 0x0F0000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x0F8000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x0FC000, erasesize: 0x04000, numblocks:  1 }
		}
	}, {
		manu_id: MANUFACTURER_AMD,
		dev_id: AM29F800BT,
		name: "AMD AM29F800BT",
		size: 0x00100000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x10000, numblocks: 15 },
			{ offset: 0x0F0000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x0F8000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x0FC000, erasesize: 0x04000, numblocks:  1 }
		}
	}, {
		manu_id: MANUFACTURER_AMD,
		dev_id: AM29LV800BB,
		name: "AMD AM29LV800BB",
		size: 0x00100000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x10000, numblocks: 15 },
			{ offset: 0x0F0000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x0F8000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x0FC000, erasesize: 0x04000, numblocks:  1 }
		}
	}, {
		manu_id: MANUFACTURER_ST,
		dev_id: M29W800T,
		name: "ST M29W800T",
		size: 0x00100000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x10000, numblocks: 15 },
			{ offset: 0x0F0000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x0F8000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x0FC000, erasesize: 0x04000, numblocks:  1 }
		}
	}, {
		manu_id: MANUFACTURER_ST,
		dev_id: M29W160DT,
		name: "ST M29W160DT",
		size: 0x00200000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x10000, numblocks: 31 },
			{ offset: 0x1F0000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x1F8000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x1FC000, erasesize: 0x04000, numblocks:  1 }
		}
	}, {
		manu_id: MANUFACTURER_ST,
		dev_id: M29W160DB,
		name: "ST M29W160DB",
		size: 0x00200000,
		numeraseregions: 4,
		regions: {
			{ offset: 0x000000, erasesize: 0x04000, numblocks:  1 },
			{ offset: 0x004000, erasesize: 0x02000, numblocks:  2 },
			{ offset: 0x008000, erasesize: 0x08000, numblocks:  1 },
			{ offset: 0x010000, erasesize: 0x10000, numblocks: 31 }
		}
	} /* , {
		manu_id: MANUFACTURER_SST,
		dev_id: SST39LF800,
		name: "SST SST39LF800",
		size: 0x00100000,
		numeraseregions: ,
		regions: {
			{ offset:         , erasesize:        , numblocks:    },
		}
	}, {
		manu_id: MANUFACTURER_SST,
		dev_id: SST39LF160,
		name: "SST SST39LF160",
		size: 0x00200000,
		numeraseregions: ,
		regions: {
			{ offset:         , erasesize:        , numblocks:    },
		}
	} */
	};

	printk("%s: Probing for AMD compatible flash...\n", map->name);

	FLASH_SEND_CMD(map, CMD_RESET_DATA);
	FLASH_SEND_CMD(map, CMD_MANUFACTURER_UNLOCK_DATA);
	manu_id = map->read16(map, map->buswidth * ADDR_MANUFACTURER);

	FLASH_SEND_CMD(map, CMD_RESET_DATA);
	FLASH_SEND_CMD(map, CMD_MANUFACTURER_UNLOCK_DATA);
	dev_id = map->read16(map, map->buswidth * ADDR_DEVICE_ID);

	FLASH_SEND_CMD(map, CMD_RESET_DATA);

	mtd = (struct mtd_info*)kmalloc(sizeof(*mtd), GFP_KERNEL);
	if (!mtd) {
		printk(KERN_WARNING
		       "%s: kmalloc failed for private structure\n", map->name);
		return NULL;
	}
	memset(mtd, 0, sizeof(*mtd));

	found = 0;
	for (i = 0; i < (sizeof(table)/sizeof(table[0])); i++) {
		if ((manu_id == table[i].manu_id) &&
		    (dev_id == table[i].dev_id)) {
			int j;

			printk("%s: Found %s %ldMb\n", map->name,
				table[i].name, (table[i].size*8)/(1024*1024));

			mtd->size = table[i].size;
			mtd->numeraseregions = table[i].numeraseregions;
			mtd->eraseregions = kmalloc(
				sizeof(struct mtd_erase_region_info) *
				mtd->numeraseregions, GFP_KERNEL);
			if (!mtd->eraseregions) { 
				printk(KERN_WARNING "%s: Failed to allocate "
				       "memory for MTD erase region info\n",
				       map->name);
				kfree(mtd);
				return NULL;
			}
			for (j = 0; j < mtd->numeraseregions; j++) {
				mtd->eraseregions[j].offset =
					table[i].regions[j].offset;
				mtd->eraseregions[j].erasesize =
					table[i].regions[j].erasesize;
				mtd->eraseregions[j].numblocks =
					table[i].regions[j].numblocks;
				if (mtd->erasesize <
				    table[i].regions[j].erasesize) {
					mtd->erasesize =
						table[i].regions[j].erasesize;
				}
			}
			found = 1;
			break;
		}
	}
	if (!found) {
		printk(KERN_WARNING "%s: unknown flash device\n", map->name);
		kfree(mtd);
		return NULL;
	}

	mtd->type = MTD_NORFLASH;
	mtd->flags = MTD_CAP_NORFLASH;
	mtd->name = map->name;
	mtd->erase = amd_flash_erase;	
	mtd->read = amd_flash_read;	
	mtd->write = amd_flash_write;	
	mtd->sync = amd_flash_sync;	
	mtd->suspend = amd_flash_suspend;	
	mtd->resume = amd_flash_resume;	
	map->fldrv_destroy = amd_flash_destroy;
	mtd->priv = map;

	map->fldrv_priv = kmalloc(sizeof(struct amd_flash_private) +
				   sizeof(struct flchip),
				  GFP_KERNEL);
	if (!map->fldrv_priv) {
		printk(KERN_WARNING
		       "%s: kmalloc failed for private structure\n", map->name);
		kfree(mtd);
		return NULL;
	}
	memset(map->fldrv_priv, 0, sizeof(struct amd_flash_private));

	chip = ((struct amd_flash_private *)map->fldrv_priv)->chips;
	memset(chip, 0, sizeof(*chip));

	init_waitqueue_head(&chip->wq);
	spin_lock_init(&chips->_spinlock);
	chip->state = FL_READY;
	chip->mutex = &chip->_spinlock;

	return mtd;
}



static int amd_flash_read(struct mtd_info *mtd, loff_t from, size_t len,
			  size_t *retlen, u_char *buf)
{
	DECLARE_WAITQUEUE(wait, current);
	unsigned long timeo = jiffies + HZ;
	struct map_info *map = mtd->priv;
	struct amd_flash_private *private = map->fldrv_priv;
	struct flchip *chip = &private->chips[0];

	*retlen = 0;

	if ((from + len) > mtd->size) {
		printk(KERN_WARNING "%s: read request past end of device "
		       "(0x%x)\n", map->name, from + len);

		return -EINVAL;
	}

retry:
	spin_lock_bh(chip->mutex);

	if (chip->state != FL_READY){
		printk(KERN_INFO "%s: waiting for chip to read, state = %d\n",
		       map->name, chip->state);
		set_current_state(TASK_UNINTERRUPTIBLE);
		add_wait_queue(&chip->wq, &wait);
                
		spin_unlock_bh(chip->mutex);

		schedule();
		remove_wait_queue(&chip->wq, &wait);

		if(signal_pending(current))
			return -EINTR;

		timeo = jiffies + HZ;

		goto retry;
	}	

//	from += chip->start;

	chip->state = FL_READY;

	map->copy_from(map, buf, from, len);

	wake_up(&chip->wq);
	spin_unlock_bh(chip->mutex);

	*retlen = len;

	return 0;
}



static int amd_flash_write_one_word(struct map_info *map, struct flchip *chip,
				    unsigned long adr, __u16 datum)
{
	unsigned long timeo = jiffies + HZ;
	unsigned int Last[4];
	unsigned long Count = 0;
	struct amd_flash_private *private = map->fldrv_priv;
	DECLARE_WAITQUEUE(wait, current);
	int ret = 0;
	int times_left;
// printk("amd_flash_write_one_word(): 0x%x\n", adr);

 retry:
	spin_lock_bh(chip->mutex);

	if (chip->state != FL_READY){
		printk("%s: waiting for chip to write, state = %d\n",
		       map->name, chip->state);
		set_current_state(TASK_UNINTERRUPTIBLE);
		add_wait_queue(&chip->wq, &wait);
                
		spin_unlock_bh(chip->mutex);

		schedule();
		remove_wait_queue(&chip->wq, &wait);
		printk(KERN_INFO "%s: woke up to write\n", map->name);
		if(signal_pending(current))
			return -EINTR;

		timeo = jiffies + HZ;

		goto retry;
	}	

	chip->state = FL_WRITING;

//	adr += chip->start;
	ENABLE_VPP(map);
	FLASH_SEND_CMD(map, CMD_PROGRAM_UNLOCK_DATA);
// printk("Write, %x to 0x%x\n", datum, adr);
	map->write16(map, datum, adr);

	spin_unlock_bh(chip->mutex);
	times_left = 500000;
	while (times_left-- && ((map->read16(map, chip->start) & D6_MASK) !=
				(map->read16(map, chip->start) & D6_MASK))) {
		if (current->need_resched)
			schedule();
	}
	if (!times_left) {
		printk(KERN_WARNING "%s: write to 0x%x timed out!\n",
		       map->name, adr);
		ret = -EIO;
	} else {
		__u16 verify;
		if ((verify = map->read16(map, adr)) != datum) {
			printk(KERN_WARNING "%s: write failed. datum = %x, "
			       "verify = %x\n", map->name, datum, verify);
			ret = -EIO;
		}
// printk("Read, %x at 0x%x\n", verify, adr);
	}
	spin_lock_bh(chip->mutex);

	DISABLE_VPP(map);
	chip->state = FL_READY;
	wake_up(&chip->wq);
	spin_unlock_bh(chip->mutex);

	return ret;
}



static int amd_flash_write(struct mtd_info *mtd, loff_t to , size_t len,
			   size_t *retlen, const u_char *buf)
{
	struct map_info *map = mtd->priv;
	struct amd_flash_private *private = map->fldrv_priv;
	int ret = 0;
	unsigned long ofs;
// printk("amd_flash_write(): 0x%x\n", to);

	*retlen = 0;
	if (!len)
		return 0;

	ofs = to;

	/* If it's not bus-aligned, do the first byte write */
	if (ofs & (map->buswidth - 1)) {
		unsigned long bus_ofs = ofs & ~(map->buswidth - 1);
		int i = ofs - bus_ofs;
		int n = 0;
		u_char tmp_buf[2];
		__u16 datum;

		map->copy_from(map, tmp_buf, bus_ofs + private->chips[0].start,
			       map->buswidth);
		while (len && i < map->buswidth)
			tmp_buf[i++] = buf[n++], len--;

		datum = *(__u16*)tmp_buf;

		ret = amd_flash_write_one_word(map, &private->chips[0], 
					       bus_ofs, datum);
		if (ret) 
			return ret;
		
		ofs += n;
		buf += n;
		(*retlen) += n;

		if (ofs) {
			return 0;
		}
	}
	
	/* We are now aligned, write as much as possible */
	while(len >= map->buswidth) {
		__u16 datum;

		datum = *(__u16*)buf;
		ret = amd_flash_write_one_word(map, &private->chips[0], ofs,
					       datum);
		if (ret) {
			return ret;
		}

		ofs += map->buswidth;
		buf += map->buswidth;
		(*retlen) += map->buswidth;
		len -= map->buswidth;
	}

	if (len & (map->buswidth - 1)) {
		int i = 0, n = 0;
		u_char tmp_buf[2];
		__u16 datum;

		map->copy_from(map, tmp_buf, ofs + private->chips[0].start,
			       map->buswidth);
		while (len--)
			tmp_buf[i++] = buf[n++];

		datum = *(__u16*)tmp_buf;

		ret = amd_flash_write_one_word(map, &private->chips[0], ofs,
					       datum);
		if (ret) 
			return ret;
		
		(*retlen) += n;
	}

	return 0;
}



static inline int amd_flash_erase_one_block(struct map_info *map,
					    struct flchip *chip,
					    unsigned long adr,
					    u_long size /* for verification */)
{
	unsigned long timeo = jiffies + HZ;
	struct amd_flash_private *private = map->fldrv_priv;
	DECLARE_WAITQUEUE(wait, current);
// printk("amd_flash_erase_one_block(): adr: 0x%x, size: 0x%x\n", adr, size);

 retry:
	spin_lock_bh(chip->mutex);

	if (chip->state != FL_READY){
		set_current_state(TASK_UNINTERRUPTIBLE);
		add_wait_queue(&chip->wq, &wait);
                
		spin_unlock_bh(chip->mutex);

		schedule();
		remove_wait_queue(&chip->wq, &wait);

		if (signal_pending(current)) {
			return -EINTR;
		}

		timeo = jiffies + HZ;

		goto retry;
	}	

	chip->state = FL_ERASING;

//	adr += chip->start;
	ENABLE_VPP(map);
	FLASH_SEND_CMD(map, CMD_SECTOR_ERASE_UNLOCK_DATA);
	FLASH_SEND_CMD_TO_ADDR(map, CMD_SECTOR_ERASE_UNLOCK_DATA_2, adr);
	
	timeo = jiffies + (HZ*20);

	spin_unlock_bh(chip->mutex);
	schedule_timeout(HZ);
	spin_lock_bh(chip->mutex);
	
	while ((map->read16(map, chip->start) & D6_MASK) !=
	       (map->read16(map, chip->start) & D6_MASK)) {

		if (chip->state != FL_ERASING) {
			/* Someone's suspended the erase. Sleep */
			set_current_state(TASK_UNINTERRUPTIBLE);
			add_wait_queue(&chip->wq, &wait);
			
			spin_unlock_bh(chip->mutex);
			printk(KERN_INFO "%s: erase suspended. Sleeping\n",
			       map->name);
			schedule();
			remove_wait_queue(&chip->wq, &wait);
			
			if (signal_pending(current)) {

				return -EINTR;
			}
			
			timeo = jiffies + (HZ*2); /* FIXME */
			spin_lock_bh(chip->mutex);
			continue;
		}

		/* OK Still waiting */
		if (time_after(jiffies, timeo)) {
			chip->state = FL_READY;
			spin_unlock_bh(chip->mutex);
			printk(KERN_WARNING "%s: waiting for erase to complete "
			       "timed out.\n", map->name);
			DISABLE_VPP(map);

			return -EIO;
		}
		
		/* Latency issues. Drop the lock, wait a while and retry */
		spin_unlock_bh(chip->mutex);

		if (current->need_resched)
			schedule();
		else
			udelay(1);
		
		spin_lock_bh(chip->mutex);
		continue;
	}

	/* Verify every single word */
	{
		int address;
		int error = 0;
		__u16 verify;

		for (address = adr; address < (adr + size); address += 2) {
			if ((verify = map->read16(map, address)) != 0xFFFF) {
				error = 1;
				break;
			}
// printk("%04x ", verify);
		}
// printk("\n");
		if (error) {
			chip->state = FL_READY;
			spin_unlock_bh(chip->mutex);
			printk(KERN_WARNING
			       "%s: error found on address 0x%x size %ld.\n",
			       map->name, address, size);
			DISABLE_VPP(map);

			return -EIO;
		}
	}
	
	DISABLE_VPP(map);
	chip->state = FL_READY;
	wake_up(&chip->wq);
	spin_unlock_bh(chip->mutex);

	return 0;
}



static int amd_flash_erase(struct mtd_info *mtd, struct erase_info *instr)
{
	struct map_info *map = mtd->priv;
	struct amd_flash_private *private = map->fldrv_priv;
	unsigned long adr, len;
	int ret = 0;
	int i;
	int first;
	struct mtd_erase_region_info *regions = mtd->eraseregions;

// printk("amd_flash_erase()\n");
// printk("  instr->len = %ld\n", instr->len);
// printk("  instr->addr = 0x%x\n", instr->addr);

	if (instr->addr > mtd->size) {
		return -EINVAL;
	}

	if ((instr->len + instr->addr) > mtd->size) {
		return -EINVAL;
	}

	/* Check that both start and end of the requested erase are
	 * aligned with the erasesize at the appropriate addresses.
	 */

	i = 0;

        /* Skip all erase regions which are ended before the start of
           the requested erase. Actually, to save on the calculations,
           we skip to the first erase region which starts after the
           start of the requested erase, and then go back one.
        */

        while ((i < mtd->numeraseregions) &&
	       (instr->addr >= regions[i].offset)) {
               i++;
	}
        i--;

	/* OK, now i is pointing at the erase region in which this
	 * erase request starts. Check the start of the requested
	 * erase range is aligned with the erase size which is in
	 * effect here.
	 */

	if (instr->addr & (regions[i].erasesize-1)) {
		return -EINVAL;
	}

	/* Remember the erase region we start on. */

	first = i;

	/* Next, check that the end of the requested erase is aligned
	 * with the erase region at that address.
	 */

	while ((i < mtd->numeraseregions) && 
	       ((instr->addr + instr->len) >= regions[i].offset)) {
                i++;
	}

	/* As before, drop back one to point at the region in which
	 * the address actually falls.
	 */

	i--;

	if ((instr->addr + instr->len) & (regions[i].erasesize-1)) {
                return -EINVAL;
	}

	adr = instr->addr;
	len = instr->len;

	i = first;

	while (len) {
		ret = amd_flash_erase_one_block(map, &private->chips[0], adr,
						regions[i].erasesize);

		if (ret)
			return ret;

		adr += regions[i].erasesize;
		len -= regions[i].erasesize;

		if (adr ==
		    (regions[i].offset +
		     (regions[i].erasesize * regions[i].numblocks))) {
			i++;
		}
	}
		
	if (instr->callback) {
		instr->callback(instr);
	}
	
	return 0;
}



static void amd_flash_sync(struct mtd_info *mtd)
{
	struct map_info *map = mtd->priv;
	struct amd_flash_private *private = map->fldrv_priv;
	int i;
	struct flchip *chip;
	int ret = 0;
	DECLARE_WAITQUEUE(wait, current);

	for (i=0; !ret && (i < private->numchips); i++) {
		chip = &private->chips[i];

	retry:
		spin_lock_bh(chip->mutex);

		switch(chip->state) {
		case FL_READY:
		case FL_STATUS:
		case FL_CFI_QUERY:
		case FL_JEDEC_QUERY:
			chip->oldstate = chip->state;
			chip->state = FL_SYNCING;
			/* No need to wake_up() on this state change - 
			 * as the whole point is that nobody can do anything
			 * with the chip now anyway.
			 */
		case FL_SYNCING:
			spin_unlock_bh(chip->mutex);
			break;

		default:
			/* Not an idle state */
			add_wait_queue(&chip->wq, &wait);
			
			spin_unlock_bh(chip->mutex);

			schedule();

		        remove_wait_queue(&chip->wq, &wait);
			
			goto retry;
		}
	}

	/* Unlock the chips again */

	for (i--; i >= 0; i--) {
		chip = &private->chips[i];

		spin_lock_bh(chip->mutex);
		
		if (chip->state == FL_SYNCING) {
			chip->state = chip->oldstate;
			wake_up(&chip->wq);
		}
		spin_unlock_bh(chip->mutex);
	}
}



static int amd_flash_suspend(struct mtd_info *mtd)
{
printk("amd_flash_suspend(): not implemented!\n");
	return -EINVAL;
}



static void amd_flash_resume(struct mtd_info *mtd)
{
printk("amd_flash_resume(): not implemented!\n");
}



static void amd_flash_destroy(struct mtd_info *mtd)
{
	struct map_info *map = mtd->priv;
	struct amd_flash_private *private = map->fldrv_priv;
	kfree(private);
}



int __init amd_flash_init(void)
{
	inter_module_register(im_name, THIS_MODULE, &amd_flash_probe);

	return 0;
}

void __exit amd_flash_exit(void)
{
	inter_module_unregister(im_name);
}

module_init(amd_flash_init);
module_exit(amd_flash_exit);


--------------82F8006CC9F3CE73BE5A09BE--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
