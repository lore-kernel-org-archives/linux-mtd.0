Received: from toledo.inf.pucrs.br ([200.17.94.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eHlc-00019o-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2001 16:05:33 +0100
Message-ID: <3B94F1CE.A03FCBDC@inf.pucrs.br>
Date: Tue, 04 Sep 2001 12:22:54 -0300
From: Daniel Belz <belz@inf.pucrs.br>
MIME-Version: 1.0
To: Norbert Leon <norbert@safetech.com>, linux-mtd@lists.infradead.org
Subject: Re: Problems with Intel TE28F320 B3
References: <Pine.LNX.4.21.0109041622430.4610-100000@tagada.safetech.fr>
Content-Type: multipart/mixed;
 boundary="------------0EE39160BEA60CBA15C2C1EE"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.
--------------0EE39160BEA60CBA15C2C1EE
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Norbert Leon wrote:

> well thank you
> i am for sure interested in your code and it would be nice from you to
> send it to me.
>
> thanks in advance
>
> On Tue, 4 Sep 2001, Daniel Belz wrote:
>
> > David Woodhouse wrote:
> >
> > > norbert@safetech.com said:
> > > >  I'm working on an intel te28f320 b3ba110 (complete reference) and i
> > > > can't get my system to recognize it ...
> > >
> > > Some of the 28F320 chips are CFI-compliant and some aren't. The other
> > > letters and numbers you quoted didn't seem to help me work out which you
> > > have.
> > >
> > > Turn off CONFIG_MTD_RAM, CONFIG_MTD_ROM and CONFIG_MTD_SLRAM. You don't
> > > need them.
> > >
> > > --
> > > dwmw2
> > >
> > > ______________________________________________________
> > > Linux MTD discussion mailing list
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> > the flash intel TE28F320B3BA110 (same of the BSE-IPengine) isn't CFI
> > compliant. Is a JEDEC Flash.
> > You have to modify the MTD source code to detect the flash.
> > If you are interested, i have this code, and if you need, i send to you.
> > Else, see the cfi_cmdset002.c, cfi_probe.c, cfi_jedec.c
> > (/drivers/mtd/chips) and physmap.c (/drivers/mtd/maps).
> > My code give a solution to implementing JFFS file system and Partitioning
> > Support.
> >
> >
> > Daniel Belz
> > belz@inf.pucrs.br
> >
> >
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

i'm using the hhl20 journeyman from montavista (www.mvsita.com). (Kernel 2.4.2)
with a recent (last month) MTD snapshot!
the modified code  is under (//by belz) tags or (//belz //endbelz) tags.
also see the flash datasheet and the .config file attached for more information
about configuration.
atually, i'm do making a documentation about the modifications (where, what,
why, what work and what not, ...). when done, a send all to MTD.
this provide a full support to bse-ipengine (www.brightstareng.com), including
flash partitioning.



Daniel Belz
belz@inf.pucrs.br

--------------0EE39160BEA60CBA15C2C1EE
Content-Type: text/plain; charset=us-ascii;
 name="cfi_cmdset_0002.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cfi_cmdset_0002.c"

/*
 * Common Flash Interface support:
 *   AMD & Fujitsu Standard Vendor Command Set (ID 0x0002)
 *
 * Copyright (C) 2000 Crossnet Co. <info@crossnet.co.jp>
 *
 * 2_by_8 routines added by Simon Munton
 *
 * This code is GPL
 *
 * $Id: cfi_cmdset_0002.c,v 1.49 2001/07/14 00:59:16 thockin Exp $
 *
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <asm/io.h>
#include <asm/byteorder.h>

#include <linux/errno.h>
#include <linux/slab.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/mtd/map.h>
#include <linux/mtd/cfi.h>

#define AMD_BOOTLOC_BUG

static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
static int cfi_amdstd_write(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
static int cfi_amdstd_erase_onesize(struct mtd_info *, struct erase_info *);
static int cfi_amdstd_erase_varsize(struct mtd_info *, struct erase_info *);
static void cfi_amdstd_sync (struct mtd_info *);
static int cfi_amdstd_suspend (struct mtd_info *);
static void cfi_amdstd_resume (struct mtd_info *);

static void cfi_amdstd_destroy(struct mtd_info *);

void cfi_cmdset_0002(struct map_info *, int, unsigned long);
static struct mtd_info *cfi_amdstd_setup (struct map_info *);


static struct mtd_chip_driver cfi_amdstd_chipdrv = {
	probe: cfi_amdstd_setup,
	destroy: cfi_amdstd_destroy,
	name: "cfi_cmdset_0002",
	module: THIS_MODULE
};

void cfi_cmdset_0002(struct map_info *map, int primary, unsigned long base)
{
	struct cfi_private *cfi = map->fldrv_priv;
	unsigned char bootloc;
	int ofs_factor = cfi->interleave * cfi->device_type;
	int i;
	__u8 major, minor;
//	struct cfi_pri_intelext *extp;

    if (cfi->cfi_mode==0){
	__u16 adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;

	cfi_send_gen_cmd(0x98, 0x55, 0, map, cfi, cfi->device_type, NULL); 

	major = cfi_read_query(map, (adr+3)*ofs_factor);
	minor = cfi_read_query(map, (adr+4)*ofs_factor);

	printk(" Amd/Fujitsu Extended Query Table v%c.%c at 0x%4.4X\n",
	       major, minor, adr);

	cfi_send_gen_cmd(0xf0, 0x55, 0, map, cfi, cfi->device_type, NULL);

	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
	cfi->mfr = cfi_read_query(map, base);
	cfi->id = cfi_read_query(map, base + ofs_factor);

	/* Wheee. Bring me the head of someone at AMD. */
#ifdef AMD_BOOTLOC_BUG
	if (((major << 8) | minor) < 0x3131) {
		/* CFI version 1.0 => don't trust bootloc */
		if (cfi->id & 0x80) {
			printk(KERN_WARNING "%s: JEDEC Device ID is 0x%02X. Assuming broken CFI table.\n", map->name, cfi->id);
			bootloc = 3;	/* top boot */
		} else {
			bootloc = 2;	/* bottom boot */
		}
	} else
#endif
	{
		cfi_send_gen_cmd(0x98, 0x55, 0, map, cfi, cfi->device_type, NULL);
		bootloc = cfi_read_query(map, (adr+15)*ofs_factor);
	}
	if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
		printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n", map->name);

		for (i=0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
			int j = (cfi->cfiq->NumEraseRegions-1)-i;
			__u32 swap;

			swap = cfi->cfiq->EraseRegionInfo[i];
			cfi->cfiq->EraseRegionInfo[i] = cfi->cfiq->EraseRegionInfo[j];
			cfi->cfiq->EraseRegionInfo[j] = swap;
		}
	}
    }
    //JEDEC so pega daqui em diante -- belz
    /* If there was an old setup function, decrease its use count */
    if (map->fldrv)
      if(map->fldrv->module)
	__MOD_DEC_USE_COUNT(map->fldrv->module);
    
    if (cfi->cmdset_priv)
		kfree(cfi->cmdset_priv);

    for (i=0; i< cfi->numchips; i++) {
		cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
		cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
    }		

    map->fldrv = &cfi_amdstd_chipdrv;
    MOD_INC_USE_COUNT;
    cfi_send_gen_cmd(0xf0, 0x55, 0, map, cfi, cfi->device_type, NULL);
    return;
}

static struct mtd_info *cfi_amdstd_setup(struct map_info *map)
{
	struct cfi_private *cfi = map->fldrv_priv;
	struct mtd_info *mtd;
	unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;

	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
	printk("number of %s chips: %d\n", (cfi->cfi_mode)?"JEDEC":"CFI",cfi->numchips);

	if (!mtd) {
	  printk("Failed to allocate memory for MTD device\n");
	  kfree(cfi->cmdset_priv);
	  return NULL;
	}

	memset(mtd, 0, sizeof(*mtd));
	mtd->priv = map;
	mtd->type = MTD_NORFLASH;
	/* Also select the correct geometry setup too */ 
	mtd->size = devsize * cfi->numchips;
	
	if (cfi->cfiq->NumEraseRegions == 1) {
		/* No need to muck about with multiple erase sizes */
		mtd->erasesize = ((cfi->cfiq->EraseRegionInfo[0] >> 8) & ~0xff) * cfi->interleave;
	} else {
		unsigned long offset = 0;
		int i,j;

		mtd->numeraseregions = cfi->cfiq->NumEraseRegions * cfi->numchips;
		mtd->eraseregions = kmalloc(sizeof(struct mtd_erase_region_info) * mtd->numeraseregions, GFP_KERNEL);
		if (!mtd->eraseregions) { 
			printk("Failed to allocate memory for MTD erase region info\n");
			kfree(cfi->cmdset_priv);
			return NULL;
		}
			
		for (i=0; i<cfi->cfiq->NumEraseRegions; i++) {
			unsigned long ernum, ersize;
			ersize = ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * cfi->interleave;
			ernum = (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;
			
			if (mtd->erasesize < ersize) {
				mtd->erasesize = ersize;
			}
			for (j=0; j<cfi->numchips; j++) {
				mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].offset = (j*devsize)+offset;
				mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize = ersize;
				mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks = ernum;
			}
			offset += (ersize * ernum);
		}
		if (offset != devsize) {
			/* Argh */
			printk("Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
			kfree(mtd->eraseregions);
			kfree(cfi->cmdset_priv);
			return NULL;
		}
		// debug
		for (i=0; i<mtd->numeraseregions;i++){
			printk("%d: offset=0x%x,size=0x%x,blocks=%d\n",
			       i,mtd->eraseregions[i].offset,
			       mtd->eraseregions[i].erasesize,
			       mtd->eraseregions[i].numblocks);
		}
	}

	switch (CFIDEV_BUSWIDTH)
	{
	case 1:
	case 2:
	case 4:
//#if 1
		if (mtd->numeraseregions > 1)
			mtd->erase = cfi_amdstd_erase_varsize;
		else
//#endif
			mtd->erase = cfi_amdstd_erase_onesize;
		mtd->read = cfi_amdstd_read;
		mtd->write = cfi_amdstd_write;
		break;

	default:
	        printk("Unsupported buswidth\n");
		kfree(mtd);
		kfree(cfi->cmdset_priv);
		return NULL;
		break;
	}
	mtd->sync = cfi_amdstd_sync;
	mtd->suspend = cfi_amdstd_suspend;
	mtd->resume = cfi_amdstd_resume;
	mtd->flags = MTD_CAP_NORFLASH;
	map->fldrv = &cfi_amdstd_chipdrv;
	mtd->name = map->name;
	MOD_INC_USE_COUNT;
	return mtd;
}

static inline int do_read_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
{
	DECLARE_WAITQUEUE(wait, current);
	unsigned long timeo = jiffies + HZ;
	struct cfi_private *cfi = map->fldrv_priv;

 retry:
	cfi_spin_lock(chip->mutex);

	if (chip->state != FL_READY){
	        printk("Waiting for chip to read, status = %d\n", chip->state);
		set_current_state(TASK_UNINTERRUPTIBLE);
		add_wait_queue(&chip->wq, &wait);
                
		cfi_spin_unlock(chip->mutex);

		schedule();
		remove_wait_queue(&chip->wq, &wait);
#if 0
		if(signal_pending(current))
			return -EINTR;
#endif
		timeo = jiffies + HZ;

		goto retry;
	}	

	adr += chip->start;

	chip->state = FL_READY;
	
	
	cfi_write(map, CMD(0xFF), adr); //belz


	map->copy_from(map, buf, adr, len);

	wake_up(&chip->wq);
	cfi_spin_unlock(chip->mutex);

	return 0;
}

static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	unsigned long ofs;
	int chipnum;
	int ret = 0;

	/* ofs: offset within the first chip that the first read should start */

	chipnum = (from >> cfi->chipshift);
	ofs = from - (chipnum <<  cfi->chipshift);


	*retlen = 0;

	while (len) {
		unsigned long thislen;

		if (chipnum >= cfi->numchips)
			break;

		if ((len + ofs -1) >> cfi->chipshift)
			thislen = (1<<cfi->chipshift) - ofs;
		else
			thislen = len;

		ret = do_read_onechip(map, &cfi->chips[chipnum], ofs, thislen, buf);
		if (ret)
			break;

		*retlen += thislen;
		len -= thislen;
		buf += thislen;

		ofs = 0;
		chipnum++;
	}
	return ret;
}

static int do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, __u32 datum, int fast)
{
	unsigned long timeo = jiffies + HZ;
	//unsigned int Last[4];    //com belz
	//unsigned long Count = 0; //com belz
	struct cfi_private *cfi = map->fldrv_priv;
	DECLARE_WAITQUEUE(wait, current);
	int ret = 0;
	__u32 status, status_OK; //belz


	status_OK = CMD(0x80); 
 retry:
	cfi_spin_lock(chip->mutex);

	if (chip->state != FL_READY){
	        printk("Waiting for chip to write, status = %d\n", chip->state);
		set_current_state(TASK_UNINTERRUPTIBLE);
		add_wait_queue(&chip->wq, &wait);
                
		cfi_spin_unlock(chip->mutex);

		schedule();
		remove_wait_queue(&chip->wq, &wait);
		printk("Wake up to write:\n");
#if 0
		if(signal_pending(current))
			return -EINTR;
#endif
		timeo = jiffies + HZ;

		goto retry;
	}	

	chip->state = FL_WRITING;

	adr += chip->start;
	ENABLE_VPP(map);
	
	if (fast) { // Unlock bypass
		cfi_send_gen_cmd(0xA0, 0, chip->start, map, cfi, cfi->device_type, NULL);
	}
	else {
	        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
	        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
	}

	//cfi_write(map, CMD(0x50), adr); //belz
	cfi_write(map, CMD(0x40), adr); //belz
	cfi_write(map, datum, adr);
	

	cfi_spin_unlock(chip->mutex);
	cfi_udelay(chip->word_write_time);
	cfi_spin_lock(chip->mutex);
	
	
	
	
	//belz inicio
	
	
	while ( ( (status = cfi_read(map,adr)) & status_OK ) != status_OK ) {
		static int z=0;
		/* OK Still waiting */
		if (time_after(jiffies, timeo)) {
			chip->state = FL_READY;
			cfi_spin_unlock(chip->mutex);
			printk("waiting for writing to complete timed out.");
			DISABLE_VPP(map);
			return -EIO;
		}
		
		/* Latency issues. Drop the lock, wait a while and retry */
		cfi_spin_unlock(chip->mutex);

		z++;
		if ( 0 && !(z % 100 )) 
			printk("chip not ready yet after write. looping\n");

		cfi_udelay(1);
		
		cfi_spin_lock(chip->mutex);
		continue;
	}

	
	
	
	
	//belz fim	
	/*
	
	Last[0] = cfi_read(map, adr);
		printk("Last[0] is %x\n", Last[0]);
	Last[1] = cfi_read(map, adr);
		printk("Last[1] is %x\n", Last[1]);
	Last[2] = cfi_read(map, adr);
		printk("Last[2] is %x\n", Last[2]);

	for (Count = 3; Last[(Count - 1) % 4] != Last[(Count - 2) % 4] && Count < 10000; Count++){
		cfi_spin_unlock(chip->mutex);
		cfi_udelay(10);
		cfi_spin_lock(chip->mutex);
		
	        Last[Count % 4] = cfi_read(map, adr);
		//		printk("Last[%d%%4] is %x\n", Count, Last[Count%4]);
	}
	
	if (Last[(Count - 1) % 4] != datum){
		printk("Last[%ld] is %x, datum is %x\n",(Count - 1) % 4,Last[(Count - 1) % 4],datum);
	        cfi_send_gen_cmd(0xF0, 0, chip->start, map, cfi, cfi->device_type, NULL);
		DISABLE_VPP(map);
		ret = -EIO;
	} */     
	DISABLE_VPP(map);
	chip->state = FL_READY;
	wake_up(&chip->wq);
	cfi_spin_unlock(chip->mutex);
	
	return ret;
}

static int cfi_amdstd_write (struct mtd_info *mtd, loff_t to , size_t len, size_t *retlen, const u_char *buf)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	int ret = 0;
	int chipnum;
	unsigned long ofs, chipstart;

	*retlen = 0;
	if (!len)
		return 0;

	chipnum = to >> cfi->chipshift;
	ofs = to  - (chipnum << cfi->chipshift);
	chipstart = cfi->chips[chipnum].start;

	/* If it's not bus-aligned, do the first byte write */
	if (ofs & (CFIDEV_BUSWIDTH-1)) {
		unsigned long bus_ofs = ofs & ~(CFIDEV_BUSWIDTH-1);
		int i = ofs - bus_ofs;
		int n = 0;
		u_char tmp_buf[4];
		__u32 datum;

		map->copy_from(map, tmp_buf, bus_ofs + cfi->chips[chipnum].start, CFIDEV_BUSWIDTH);
		while (len && i < CFIDEV_BUSWIDTH)
			tmp_buf[i++] = buf[n++], len--;

		if (cfi_buswidth_is_2()) {
			datum = *(__u16*)tmp_buf;
		} else if (cfi_buswidth_is_4()) {
			datum = *(__u32*)tmp_buf;
		} else {
			return -EINVAL;  /* should never happen, but be safe */
		}

		ret = do_write_oneword(map, &cfi->chips[chipnum], 
				bus_ofs, datum, 0);
		if (ret) 
			return ret;
		ofs += n;
		buf += n;
		(*retlen) += n;

		if (ofs >> cfi->chipshift) {
			chipnum ++; 
			ofs = 0;
			if (chipnum == cfi->numchips)
				return 0;
		}

	}
	
	/* Go into unlock bypass mode */
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
	cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);

	//cfi_write(map, CMD(0x40), 0); //belz

	/* We are now aligned, write as much as possible */
	while(len >= CFIDEV_BUSWIDTH) {
		__u32 datum;

		if (cfi_buswidth_is_1()) {
			datum = *(__u8*)buf;
		} else if (cfi_buswidth_is_2()) {
			datum = *(__u16*)buf;
		} else if (cfi_buswidth_is_4()) {
			datum = *(__u32*)buf;
		} else {
			return -EINVAL;
		}
		ret = do_write_oneword(map, &cfi->chips[chipnum],
				       ofs, datum, cfi->fast_prog);
		if (ret) {
			if (cfi->fast_prog){
				/* Get out of unlock bypass mode */
				cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL);
				cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL);
			}
			return ret;
		}

		ofs += CFIDEV_BUSWIDTH;
		buf += CFIDEV_BUSWIDTH;
		(*retlen) += CFIDEV_BUSWIDTH;
		len -= CFIDEV_BUSWIDTH;

		if (ofs >> cfi->chipshift) {
			if (cfi->fast_prog){
				/* Get out of unlock bypass mode */
				cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL);
				cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL);
			}

			chipnum ++; 
			ofs = 0;
			if (chipnum == cfi->numchips)
				return 0;
			chipstart = cfi->chips[chipnum].start;
			if (cfi->fast_prog){
				/* Go into unlock bypass mode for next set of chips */
				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
				cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
				cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
			}
		}
	}

	if (cfi->fast_prog){
		/* Get out of unlock bypass mode */
		cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL);
		cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL);
	}

	if (len & (CFIDEV_BUSWIDTH-1)) {
		int i = 0, n = 0;
		u_char tmp_buf[4];
		__u32 datum;

		map->copy_from(map, tmp_buf, ofs + cfi->chips[chipnum].start, CFIDEV_BUSWIDTH);
		while (len--)
			tmp_buf[i++] = buf[n++];

		if (cfi_buswidth_is_2()) {
			datum = *(__u16*)tmp_buf;
		} else if (cfi_buswidth_is_4()) {
			datum = *(__u32*)tmp_buf;
		} else {
			return -EINVAL;  /* should never happen, but be safe */
		}

		ret = do_write_oneword(map, &cfi->chips[chipnum], 
				ofs, datum, 0);
		if (ret) 
			return ret;
		
		(*retlen) += n;
	}

	return 0;
}

static inline int do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr)
{
	unsigned int status;
	unsigned long timeo = jiffies + HZ;
	struct cfi_private *cfi = map->fldrv_priv;
	unsigned int rdy_mask;
	DECLARE_WAITQUEUE(wait, current);

 retry:
	cfi_spin_lock(chip->mutex);

	if (chip->state != FL_READY){
		set_current_state(TASK_UNINTERRUPTIBLE);
		add_wait_queue(&chip->wq, &wait);
                
		cfi_spin_unlock(chip->mutex);

		schedule();
		remove_wait_queue(&chip->wq, &wait);
#if 0
		if(signal_pending(current))
			return -EINTR;
#endif
		timeo = jiffies + HZ;

		goto retry;
	}	

	chip->state = FL_ERASING;

	adr += chip->start;
	ENABLE_VPP(map);
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
	//cfi_write(map, CMD(0x20), adr);
	
	timeo = jiffies + (HZ*20);

	cfi_spin_unlock(chip->mutex);
	schedule_timeout(HZ);
	cfi_spin_lock(chip->mutex);
	
	rdy_mask = CMD(0x80);
        cfi_write(map, CMD(0x50), adr);//<----foi inserido e com
	cfi_write(map, CMD(0x20), adr);//<----foi inserido
	cfi_write(map, CMD(0xD0), adr);//<----foi inserido
	/* FIXME. Use a timer to check this, and return immediately. */
	/* Once the state machine's known to be working I'll do that */

	while ( ( (status = cfi_read(map,adr)) & rdy_mask ) != rdy_mask ) {
		static int z=0;

		if (chip->state != FL_ERASING) {
			/* Someone's suspended the erase. Sleep */
			set_current_state(TASK_UNINTERRUPTIBLE);
			add_wait_queue(&chip->wq, &wait);
			
			cfi_spin_unlock(chip->mutex);
			printk("erase suspended. Sleeping\n");
			
			schedule();
			remove_wait_queue(&chip->wq, &wait);
#if 0			
			if (signal_pending(current))
				return -EINTR;
#endif			
			timeo = jiffies + (HZ*2); /* FIXME */
			cfi_spin_lock(chip->mutex);
			continue;
		}

		/* OK Still waiting */
		if (time_after(jiffies, timeo)) {
			chip->state = FL_READY;
			cfi_spin_unlock(chip->mutex);
			printk("--->(status:%X, cfi_read:%X) waiting for erase to complete timed out.",chip->state,cfi_read(map, adr));
			DISABLE_VPP(map);
			return -EIO;
		}
		
		/* Latency issues. Drop the lock, wait a while and retry */
		cfi_spin_unlock(chip->mutex);

		z++;
		if ( 0 && !(z % 100 )) 
			printk("chip not ready yet after erase. looping\n");

		cfi_udelay(1);
		
		cfi_spin_lock(chip->mutex);
		continue;
	}
	
	/* Done and happy. */
	DISABLE_VPP(map);
	chip->state = FL_READY;
	wake_up(&chip->wq);
	cfi_spin_unlock(chip->mutex);
	return 0;
}

static int cfi_amdstd_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	unsigned long adr, len;
	int chipnum, ret = 0;
	int i, first;
	struct mtd_erase_region_info *regions = mtd->eraseregions;

	if (instr->addr > mtd->size)
		return -EINVAL;

	if ((instr->len + instr->addr) > mtd->size)
		return -EINVAL;

	/* Check that both start and end of the requested erase are
	 * aligned with the erasesize at the appropriate addresses.
	 */

	i = 0;

	/* Skip all erase regions which are ended before the start of 
	   the requested erase. Actually, to save on the calculations,
	   we skip to the first erase region which starts after the
	   start of the requested erase, and then go back one.
	*/
	
	while (i < mtd->numeraseregions && instr->addr >= regions[i].offset)
	       i++;
	i--;

	/* OK, now i is pointing at the erase region in which this 
	   erase request starts. Check the start of the requested
	   erase range is aligned with the erase size which is in
	   effect here.
	*/

	if (instr->addr & (regions[i].erasesize-1))
		return -EINVAL;

	/* Remember the erase region we start on */
	first = i;

	/* Next, check that the end of the requested erase is aligned
	 * with the erase region at that address.
	 */

	while (i<mtd->numeraseregions && (instr->addr + instr->len) >= regions[i].offset)
		i++;

	/* As before, drop back one to point at the region in which
	   the address actually falls
	*/
	i--;
	
	if ((instr->addr + instr->len) & (regions[i].erasesize-1))
		return -EINVAL;
	
	chipnum = instr->addr >> cfi->chipshift;
	adr = instr->addr - (chipnum << cfi->chipshift);
	len = instr->len;

	i=first;

	while(len) {
		ret = do_erase_oneblock(map, &cfi->chips[chipnum], adr);

		if (ret)
			return ret;

		adr += regions[i].erasesize;
		len -= regions[i].erasesize;

		if (adr % (1<< cfi->chipshift) == ((regions[i].offset + (regions[i].erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
			i++;

		if (adr >> cfi->chipshift) {
			adr = 0;
			chipnum++;
			
			if (chipnum >= cfi->numchips)
			break;
		}
	}

	instr->state = MTD_ERASE_DONE;
	if (instr->callback)
		instr->callback(instr);
	
	return 0;
}

static int cfi_amdstd_erase_onesize(struct mtd_info *mtd, struct erase_info *instr)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	unsigned long adr, len;
	int chipnum, ret = 0;

	if (instr->addr & (mtd->erasesize - 1))
		return -EINVAL;

	if (instr->len & (mtd->erasesize -1))
		return -EINVAL;

	if ((instr->len + instr->addr) > mtd->size)
		return -EINVAL;

	chipnum = instr->addr >> cfi->chipshift;
	adr = instr->addr - (chipnum << cfi->chipshift);
	len = instr->len;

	while(len) {
		ret = do_erase_oneblock(map, &cfi->chips[chipnum], adr);

		if (ret)
			return ret;

		adr += mtd->erasesize;
		len -= mtd->erasesize;

		if (adr >> cfi->chipshift) {
			adr = 0;
			chipnum++;
			
			if (chipnum >= cfi->numchips)
			break;
		}
	}
		
	instr->state = MTD_ERASE_DONE;
	if (instr->callback)
		instr->callback(instr);
	
	return 0;
}

static void cfi_amdstd_sync (struct mtd_info *mtd)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	int i;
	struct flchip *chip;
	int ret = 0;
	DECLARE_WAITQUEUE(wait, current);

	for (i=0; !ret && i<cfi->numchips; i++) {
		chip = &cfi->chips[i];

	retry:
		cfi_spin_lock(chip->mutex);

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
			cfi_spin_unlock(chip->mutex);
			break;

		default:
			/* Not an idle state */
			add_wait_queue(&chip->wq, &wait);
			
			cfi_spin_unlock(chip->mutex);

			schedule();

		        remove_wait_queue(&chip->wq, &wait);
			
			goto retry;
		}
	}

	/* Unlock the chips again */

	for (i--; i >=0; i--) {
		chip = &cfi->chips[i];

		cfi_spin_lock(chip->mutex);
		
		if (chip->state == FL_SYNCING) {
			chip->state = chip->oldstate;
			wake_up(&chip->wq);
		}
		cfi_spin_unlock(chip->mutex);
	}
}


static int cfi_amdstd_suspend(struct mtd_info *mtd)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	int i;
	struct flchip *chip;
	int ret = 0;
//printk("suspend\n");

	for (i=0; !ret && i<cfi->numchips; i++) {
		chip = &cfi->chips[i];

		cfi_spin_lock(chip->mutex);

		switch(chip->state) {
		case FL_READY:
		case FL_STATUS:
		case FL_CFI_QUERY:
		case FL_JEDEC_QUERY:
			chip->oldstate = chip->state;
			chip->state = FL_PM_SUSPENDED;
			/* No need to wake_up() on this state change - 
			 * as the whole point is that nobody can do anything
			 * with the chip now anyway.
			 */
		case FL_PM_SUSPENDED:
			break;

		default:
			ret = -EAGAIN;
			break;
		}
		cfi_spin_unlock(chip->mutex);
	}

	/* Unlock the chips again */

	if (ret) {
    		for (i--; i >=0; i--) {
			chip = &cfi->chips[i];

			cfi_spin_lock(chip->mutex);
		
			if (chip->state == FL_PM_SUSPENDED) {
				chip->state = chip->oldstate;
				wake_up(&chip->wq);
			}
			cfi_spin_unlock(chip->mutex);
		}
	}
	
	return ret;
}

static void cfi_amdstd_resume(struct mtd_info *mtd)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	int i;
	struct flchip *chip;
//printk("resume\n");

	for (i=0; i<cfi->numchips; i++) {
	
		chip = &cfi->chips[i];

		cfi_spin_lock(chip->mutex);
		
		if (chip->state == FL_PM_SUSPENDED) {
			chip->state = FL_READY;
			cfi_write(map, CMD(0xF0), chip->start);
			wake_up(&chip->wq);
		}
		else
			printk("Argh. Chip not in PM_SUSPENDED state upon resume()\n");

		cfi_spin_unlock(chip->mutex);
	}
}

static void cfi_amdstd_destroy(struct mtd_info *mtd)
{
	struct map_info *map = mtd->priv;
	struct cfi_private *cfi = map->fldrv_priv;
	kfree(cfi->cmdset_priv);
	kfree(cfi);
}

#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)
#define cfi_amdstd_init init_module
#define cfi_amdstd_exit cleanup_module
#endif

static char im_name[]="cfi_cmdset_0002";

mod_init_t cfi_amdstd_init(void)
{
	inter_module_register(im_name, THIS_MODULE, &cfi_cmdset_0002);
	return 0;
}

mod_exit_t cfi_amdstd_exit(void)
{
	inter_module_unregister(im_name);
}

module_init(cfi_amdstd_init);
module_exit(cfi_amdstd_exit);


--------------0EE39160BEA60CBA15C2C1EE
Content-Type: text/plain; charset=us-ascii;
 name="cfi_jedec.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cfi_jedec.c"

/* $Id: cfi_jedec.c,v 1.6 2001/07/14 00:59:17 thockin Exp $ */

#include <linux/config.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <asm/byteorder.h>
#include <linux/errno.h>
#include <linux/slab.h>
#include <linux/interrupt.h>

#include <linux/mtd/map.h>
#include <linux/mtd/cfi.h>

/* Manufacturers */
#define MANUFACTURER_AMD	0x0001
#define MANUFACTURER_FUJITSU	0x0004
#define MANUFACTURER_ATMEL	0x001f
#define MANUFACTURER_ST		0x0020
#define MANUFACTURER_SST	0x00BF
#define MANUFACTURER_TOSHIBA	0x0098
#define MANUFACTURER_INTEL      0x0089 //by belz

/*INTEL*/ //by belz
#define TE28F320B3      0x8897

/* AMD */
#define AM29F800BB	0x2258
#define AM29F800BT	0x22D6
#define AM29LV800BB	0x225B
#define AM29LV800BT	0x22DA
#define AM29LV160DT	0x22C4
#define AM29LV160DB	0x2249

/* Atmel */
#define AT49BV16X4	0x00c0
#define AT49BV16X4T	0x00c2

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


struct amd_flash_info {
	const __u16 mfr_id;
	const __u16 dev_id;
	const char *name;
	const int DevSize;
	const int InterfaceDesc;
	const int NumEraseRegions;
	const ulong regions[4];
};

#define ERASEINFO(size,blocks) (size<<8)|(blocks-1)

#define SIZE_1MiB 20
#define SIZE_2MiB 21
#define SIZE_4MiB 22

static const struct amd_flash_info jedec_table[] = {
	{       //by belz
		mfr_id: MANUFACTURER_INTEL,
		dev_id: TE28F320B3,
		name: "INTEL TE28F320B3",
		DevSize: SIZE_4MiB,
		NumEraseRegions: 1,
		regions: {//ERASEINFO(0x02000,8),
			  ERASEINFO(0x10000,64)
		}
	}, {
		mfr_id: MANUFACTURER_AMD,
		dev_id: AM29LV160DT,
		name: "AMD AM29LV160DT",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x10000,31),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x04000,1)
		}
	}, {
		mfr_id: MANUFACTURER_AMD,
		dev_id: AM29LV160DB,
		name: "AMD AM29LV160DB",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x04000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x10000,31)
		}
	}, {
		mfr_id: MANUFACTURER_TOSHIBA,
		dev_id: TC58FVT160,
		name: "Toshiba TC58FVT160",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x10000,31),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x04000,1)
		}
	}, {
		mfr_id: MANUFACTURER_FUJITSU,
		dev_id: MBM29LV160TE,
		name: "Fujitsu MBM29LV160TE",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x10000,31),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x04000,1)
		}
	}, {
		mfr_id: MANUFACTURER_TOSHIBA,
		dev_id: TC58FVB160,
		name: "Toshiba TC58FVB160",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x04000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x10000,31)
		}
	}, {
		mfr_id: MANUFACTURER_FUJITSU,
		dev_id: MBM29LV160BE,
		name: "Fujitsu MBM29LV160BE",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x04000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x10000,31)
		}
	}, {
		mfr_id: MANUFACTURER_AMD,
		dev_id: AM29LV800BB,
		name: "AMD AM29LV800BB",
		DevSize: SIZE_1MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x04000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x10000,15),
		}
	}, {
		mfr_id: MANUFACTURER_AMD,
		dev_id: AM29F800BB,
		name: "AMD AM29F800BB",
		DevSize: SIZE_1MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x04000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x10000,15),
		}
	}, {
		mfr_id: MANUFACTURER_AMD,
		dev_id: AM29LV800BT,
		name: "AMD AM29LV800BT",
		DevSize: SIZE_1MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x10000,15),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x04000,1)
		}
	}, {
		mfr_id: MANUFACTURER_AMD,
		dev_id: AM29F800BT,
		name: "AMD AM29F800BT",
		DevSize: SIZE_1MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x10000,15),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x04000,1)
		}
	}, {
		mfr_id: MANUFACTURER_AMD,
		dev_id: AM29LV800BB,
		name: "AMD AM29LV800BB",
		DevSize: SIZE_1MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x10000,15),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x04000,1)
		}
	}, {
		mfr_id: MANUFACTURER_ST,
		dev_id: M29W800T,
		name: "ST M29W800T",
		DevSize: SIZE_1MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x10000,15),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x04000,1)
		}
	}, {
		mfr_id: MANUFACTURER_ST,
		dev_id: M29W160DT,
		name: "ST M29W160DT",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x10000,31),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x04000,1)
		}
	}, {
		mfr_id: MANUFACTURER_ST,
		dev_id: M29W160DB,
		name: "ST M29W160DB",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 4,
		regions: {ERASEINFO(0x04000,1),
			  ERASEINFO(0x02000,2),
			  ERASEINFO(0x08000,1),
			  ERASEINFO(0x10000,31)
		}
	}, {
		mfr_id: MANUFACTURER_ATMEL,
		dev_id: AT49BV16X4,
		name: "Atmel AT49BV16X4",
		DevSize: SIZE_2MiB,
		NumEraseRegions: 3,
		regions: {ERASEINFO(0x02000,8),
			  ERASEINFO(0x08000,2),
			  ERASEINFO(0x10000,30)
		}
	}, {
                mfr_id: MANUFACTURER_ATMEL,
                dev_id: AT49BV16X4T,
                name: "Atmel AT49BV16X4T",
                DevSize: SIZE_2MiB,
                NumEraseRegions: 3,
                regions: {ERASEINFO(0x10000,30),
                          ERASEINFO(0x08000,2),
			  ERASEINFO(0x02000,8)
                }
        }, {
		0
	} 
};

int cfi_jedec_lookup(int index, int mfr_id, int dev_id)
{
  	if (index>=0){
		if (jedec_table[index].mfr_id == mfr_id &&
		    jedec_table[index].dev_id == dev_id) return index;
  	}
  	else{
		for (index=0; jedec_table[index].mfr_id; index++){
		    if (jedec_table[index].mfr_id == mfr_id &&
		        jedec_table[index].dev_id == dev_id) return index;
		}
  	}
	return -1;
}

int cfi_jedec_setup(struct cfi_private *p_cfi, int index)
{
        int i,num_erase_regions;

	printk("Found: %s\n",jedec_table[index].name);

	num_erase_regions = jedec_table[index].NumEraseRegions;
	
	p_cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
	if (!p_cfi->cfiq) {
		//xx printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
		return -1;
	}

	memset(p_cfi->cfiq,0,sizeof(struct cfi_ident));	
	
	p_cfi->cfiq->P_ID = P_ID_AMD_STD;
	//if (jedec_table[index].mfr_id==MANUFACTURER_INTEL) p_cfi->cfiq->P_ID = P_ID_INTEL_STD; //by belz
 	p_cfi->cfiq->NumEraseRegions = jedec_table[index].NumEraseRegions;
	p_cfi->cfiq->DevSize = jedec_table[index].DevSize;

	for (i=0; i<num_erase_regions; i++){
		p_cfi->cfiq->EraseRegionInfo[i] = jedec_table[index].regions[i];
	}	
	return 0; 	/* ok */
}


--------------0EE39160BEA60CBA15C2C1EE
Content-Type: text/plain; charset=iso-8859-1;
 name="cfi_probe.c"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="cfi_probe.c"

/* 
   Common Flash Interface probe code.
   (C) 2000 Red Hat. GPL'd.
   $Id: cfi_probe.c,v 1.61 2001/07/14 00:59:17 thockin Exp $
*/

#include <linux/config.h>
#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <asm/byteorder.h>
#include <linux/errno.h>
#include <linux/slab.h>
#include <linux/interrupt.h>

#include <linux/mtd/map.h>
#include <linux/mtd/cfi.h>

//#define DEBUG_CFI

#ifdef DEBUG_CFI
static void print_cfi_ident(struct cfi_ident *);
#endif

int cfi_jedec_setup(struct cfi_private *p_cfi, int index);
int cfi_jedec_lookup(int index, int mfr_id, int dev_id);

static void check_cmd_set(struct map_info *, int, unsigned long);
static struct cfi_private *cfi_cfi_probe(struct map_info *);
struct mtd_info *cfi_probe(struct map_info *map);


static struct mtd_chip_driver cfi_chipdrv = {
	probe: cfi_probe,
	name: "cfi_probe",
	module: THIS_MODULE
};


struct mtd_info *cfi_probe(struct map_info *map)
{
	struct mtd_info *mtd = NULL;
	struct cfi_private *cfi;

	/* First probe the map to see if we have CFI stuff there. */
	cfi = cfi_cfi_probe(map);
	
	if (!cfi)
		return NULL;

	map->fldrv_priv = cfi;
	/* OK we liked it. Now find a driver for the command set it talks */

	check_cmd_set(map, 1, cfi->chips[0].start); /* First the primary cmdset */
	if (!map->fldrv)
		check_cmd_set(map, 0, cfi->chips[0].start); /* Then the secondary */
	
	/* check_cmd_set() will have used inter_module_get to increase
	   the use count of the module which provides the command set 
	   driver. If we're quitting, we have to decrease it again.
	*/

	if(map->fldrv) {
		mtd = map->fldrv->probe(map);
		/* Undo the use count we held onto from inter_module_get */
#ifdef MODULE
		if(map->fldrv->module)
		  __MOD_DEC_USE_COUNT(map->fldrv->module);
#endif
		if (mtd)
			return mtd;
	}
	printk(KERN_WARNING"cfi_probe: No supported Vendor Command Set found\n");
	
	kfree(cfi->cfiq);
	kfree(cfi);
	map->fldrv_priv = NULL;
	return NULL;
}

static __u32 cfi_send_cmd(u_char cmd, __u32 base, struct map_info *map, struct cfi_private *cfi)
{
	return cfi_send_gen_cmd(cmd, 0x55, base, map, cfi, cfi->device_type, NULL);
}

/* check for QRY, or search for jedec id.
   in: interleave,type,mode
   ret: table index, <0 for error
 */
static int cfi_check_qry_or_id(struct map_info *map, __u32 base, int index,
				struct cfi_private *cfi)
{
	__u32 manufacturer_id, device_id;
	int osf = cfi->interleave * cfi->device_type;
	// scale factor
	//printk("cfi_check_qry_or_id: base=0x%08lx interl=%d type=%d index=%d\n",base,cfi->interleave,cfi->device_type,index);
	switch(cfi->cfi_mode){
	case 0:
	      if (cfi_read(map,base+osf*0x10)==cfi_build_cmd('Q',map,cfi) &&   //<------------ estas tres linhas devem ser inseridas
		    cfi_read(map,base+osf*0x11)==cfi_build_cmd('R',map,cfi) &&
		    cfi_read(map,base+osf*0x12)==cfi_build_cmd('Y',map,cfi))
		    
    			return 0;	// ok !
		break;
	case 1:
		manufacturer_id = cfi_read(map,base+0*osf);
		device_id 	= cfi_read(map,base+1*osf);
		//printk("--> cfi_check_qry_or_id: man=0x%lx,id=0x%lx\n",manufacturer_id, device_id);
		return cfi_jedec_lookup(index,manufacturer_id,device_id);
	}
	
	return -1; 	// nothing found

}

static void cfi_qry_mode(struct map_info *map, __u32 base, struct cfi_private *cfi)
{
      switch(cfi->cfi_mode){
	case 0:
		/* Query */
		
		cfi_send_cmd(0x98, base, map, cfi);
		break;
		
	case 1:
		
		/* Autoselect */
		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
		cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
		break;
	}
}

static int cfi_probe_chip_1(struct map_info *map, __u32 base,
			  struct flchip *chips, struct cfi_private *cfi)
{
	int index;
	__u32 tmp,ofs;
	
	ofs = cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, &tmp);
	
	cfi_qry_mode(map,base,cfi);
	
	index=cfi_check_qry_or_id(map,base,-1,cfi);
	if (index<0) return -1;
	
	if (chips){
		int i;

		for (i=0; i<cfi->numchips; i++){
			/* This chip should be in read mode if it's one
			   we've already touched. */
			if (cfi_check_qry_or_id(map,chips[i].start,index,cfi) >= 0){
				cfi_send_gen_cmd(0xF0, 0, chips[i].start, map, cfi, cfi->device_type, NULL);
				if (cfi_check_qry_or_id(map,chips[i].start,index,cfi) >= 0){
					/* Yes it's got QRY for data. Most unfortunate.
					   Stick the old one in read mode too. */
					cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
					if (cfi_check_qry_or_id(map,base,index,cfi) >= 0){
						/* OK, so has the new one. Assume it's an alias */
						printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
						       map->name, base, chips[i].start);
						return -1;
					}
				} else {
					/* 
					 * FIXME: Is this supposed to work?
					 * The third argument is already
					 * multiplied as this within the
					 * function definition. (Nicolas Pitre)
					 */
					cfi_send_gen_cmd(0xF0, 0, base+0xaa*cfi->interleave * cfi->device_type, map, cfi, cfi->device_type, NULL);
					cfi_send_gen_cmd(0xF0, 0, chips[i].start+0xaa*cfi->interleave * cfi->device_type, map, cfi, cfi->device_type, NULL);
					return -1;
				}
			}
		} /* for i */
		
		/* OK, if we got to here, then none of the previous chips appear to
		   be aliases for the current one. */
		if (cfi->numchips == MAX_CFI_CHIPS) {
			printk(KERN_WARNING"%s: Too many flash chips detected. Increase MAX_CFI_CHIPS from %d.\n", map->name, MAX_CFI_CHIPS);
			/* Doesn't matter about resetting it to Read Mode - we're not going to talk to it anyway */
			return -1;
		}
		chips[cfi->numchips].start = base;
		chips[cfi->numchips].state = FL_READY;
		chips[cfi->numchips].mutex = &chips[cfi->numchips]._spinlock;
		cfi->numchips++;
		
		/* Put it back into Read Mode */
		cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
	}
	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit mode\n", map->name, 
	       cfi->interleave, cfi->device_type*8, base, map->buswidth*8);
	
	return index;
}

/*  put dev into qry mode, and try cfi and jedec modes for the given type/interleave
 */
static int cfi_probe_chip(struct map_info *map, __u32 base,
			  struct flchip *chips, struct cfi_private *cfi)
{
	int index;
	cfi->cfi_mode=0;	/* cfi mode */
	
	switch (cfi->device_type) {
	case CFI_DEVICETYPE_X8:
		cfi->addr_unlock1 = 0x555; 
		cfi->addr_unlock2 = 0x2aa; 
		break;
	case CFI_DEVICETYPE_X16:
		cfi->addr_unlock1 = 0xaaa;
		if (map->buswidth == cfi->interleave) {
			/* X16 chip(s) in X8 mode */
			cfi->addr_unlock2 = 0x555;
		} else {
			cfi->addr_unlock2 = 0x554;
		}
		break;
	case CFI_DEVICETYPE_X32:
		cfi->addr_unlock1 = 0x1555; 
		cfi->addr_unlock2 = 0xaaa; 
		break;
	default:
		return 0;
	}
	index = cfi_probe_chip_1(map,base,chips,cfi);
	if (index>=0) return index;
	
	cfi->cfi_mode=1;	/* jedec mode */
	index = cfi_probe_chip_1(map,base,chips,cfi);
	if (index>=0) return index;
	
	cfi->addr_unlock1 = 0x5555;
	cfi->addr_unlock2 = 0x2aaa; 
	index = cfi_probe_chip_1(map,base,chips,cfi);
	
	return index;
}

/*
 * Since probeing for CFI chips requires writing to the device problems may
 * occur if the flash is not present and RAM is accessed instead.  For now we
 * assume that the flash is present so we don't check for RAM or replace
 * possibly overwritten data.
 */
static int cfi_probe_new_chip(struct map_info *map, unsigned long base,
			      struct flchip *chips, struct cfi_private *cfi)
{
int index;
	switch (map->buswidth) {
#ifdef CFIDEV_BUSWIDTH_1		
	case CFIDEV_BUSWIDTH_1:
		cfi->interleave = CFIDEV_INTERLEAVE_1;
		cfi->device_type = CFI_DEVICETYPE_X8;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;

		cfi->device_type = CFI_DEVICETYPE_X16;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;
		break;			
#endif

#ifdef CFIDEV_BUSWIDTH_2		
	case CFIDEV_BUSWIDTH_2:
#ifdef CFIDEV_INTERLEAVE_1
		cfi->interleave = CFIDEV_INTERLEAVE_1;
		cfi->device_type = CFI_DEVICETYPE_X16;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;
#endif
#ifdef CFIDEV_INTERLEAVE_2
		cfi->interleave = CFIDEV_INTERLEAVE_2;
		cfi->device_type = CFI_DEVICETYPE_X8;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;

		cfi->device_type = CFI_DEVICETYPE_X16;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;

#endif
		break;			
#endif

#ifdef CFIDEV_BUSWIDTH_4
	case CFIDEV_BUSWIDTH_4:
#ifdef CFIDEV_INTERLEAVE_4
		cfi->interleave = CFIDEV_INTERLEAVE_4;
		cfi->device_type = CFI_DEVICETYPE_X16;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;

		cfi->device_type = CFI_DEVICETYPE_X32;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;

		cfi->device_type = CFI_DEVICETYPE_X8;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;
#endif
#ifdef CFIDEV_INTERLEAVE_2
		cfi->interleave = CFIDEV_INTERLEAVE_2;
		cfi->device_type = CFI_DEVICETYPE_X16;
		index = cfi_probe_chip(map,base,chips,cfi);
		if (index>=0) return index;
#endif
#ifdef CFIDEV_INTERLEAVE_1
                cfi->interleave = CFIDEV_INTERLEAVE_1;
                cfi->device_type = CFI_DEVICETYPE_X32;
                index = cfi_probe_chip(map,base,chips,cfi);
                if (index>=0) return index;
#endif
		break;
#endif
	default:
		printk(KERN_WARNING "cfi_probe called with unsupported buswidth %d\n", map->buswidth);
		return -1;
	} // switch
	return -1;
}


static struct cfi_private *cfi_cfi_probe(struct map_info *map)
{
	unsigned long base=0;
	struct cfi_private cfi;
	struct cfi_private *retcfi;
	struct flchip chip[MAX_CFI_CHIPS];
	int i,index; 
	char num_erase_regions;
 	int ofs_factor;

	memset(&cfi, 0, sizeof(cfi));

	/* The first invocation (with chips == NULL) leaves the device in Query Mode */
	index = cfi_probe_new_chip(map, 0, NULL, &cfi);

	if (index<0) {
		printk(KERN_WARNING"%s: Found no CFI device at location zero\n", map->name);
		/* Doesn't appear to be CFI-compliant at all */
		return NULL;
	}

	/* Read the Basic Query Structure from the device */

 	ofs_factor = cfi.interleave*cfi.device_type;

	/* First, work out the amount of space to allocate */
	if (cfi.cfi_mode==0){
		num_erase_regions = cfi_read_query(map, base + (0x10 + 28)*ofs_factor);

//#ifdef DEBUG_CFI
		printk("Number of erase regions: %d\n", num_erase_regions);
//#endif

		cfi.cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
		if (!cfi.cfiq) {
			printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
			return NULL;
		}

		memset(cfi.cfiq,0,sizeof(struct cfi_ident));	

		cfi.fast_prog=1;		/* CFI supports fast programming */

			/* CFI flash */
		for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++) {
			((unsigned char *)cfi.cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
		}

		/* Do any necessary byteswapping */
		cfi.cfiq->P_ID = le16_to_cpu(cfi.cfiq->P_ID);

		cfi.cfiq->P_ADR = le16_to_cpu(cfi.cfiq->P_ADR);
		cfi.cfiq->A_ID = le16_to_cpu(cfi.cfiq->A_ID);
		cfi.cfiq->A_ADR = le16_to_cpu(cfi.cfiq->A_ADR);
		cfi.cfiq->InterfaceDesc = le16_to_cpu(cfi.cfiq->InterfaceDesc);
		cfi.cfiq->MaxBufWriteSize = le16_to_cpu(cfi.cfiq->MaxBufWriteSize);

		for (i=0; i<cfi.cfiq->NumEraseRegions; i++) {
			cfi.cfiq->EraseRegionInfo[i] = le32_to_cpu(cfi.cfiq->EraseRegionInfo[i]);

//#ifdef DEBUG_CFI		
			printk("  Erase Region #%d: BlockSize 0x%4.4X bytes, %d blocks\n",
		       		i, (cfi.cfiq->EraseRegionInfo[i] >> 8) & ~0xff, 
		       		(cfi.cfiq->EraseRegionInfo[i] & 0xffff) + 1);
//#endif
		}
	}
	else{
		/* JEDEC flash */
		if (cfi_jedec_setup(&cfi,index)<0){
			printk(KERN_WARNING "cfi_jedec_setup failed\n");
			return NULL;
		}
	}

	if (cfi.cfiq->NumEraseRegions == 0) {
		printk(KERN_WARNING "Number of erase regions is zero\n");
		kfree(cfi.cfiq);
		return NULL;
	}

#ifdef DEBUG_CFI
	/* Dump the information therein */
	print_cfi_ident(cfi.cfiq);
#endif

	cfi_send_cmd(0xFF, base, map, &cfi);

	/* OK. We've worked out what it is and we're happy with it. Now see if there are others */

	chip[0].start = 0;
	chip[0].state = FL_READY;
	chip[0].mutex = &chip[0]._spinlock;

	cfi.chipshift = cfi.cfiq->DevSize;
	cfi.numchips = 1;

	if (!cfi.chipshift) {
		printk(KERN_ERR"cfi.chipsize is zero. This is bad. cfi.cfiq->DevSize is %d\n", cfi.cfiq->DevSize);
		kfree(cfi.cfiq);
		return NULL;
	}
	switch (cfi.interleave) {
	    case 2: cfi.chipshift += 1; break;
	    case 4: cfi.chipshift += 2; break;
	}

	for (base = (1<<cfi.chipshift); base < map->size; base += (1<<cfi.chipshift))
		cfi_probe_chip_1(map, base, &chip[0], &cfi);

	retcfi = kmalloc(sizeof(struct cfi_private) + cfi.numchips * sizeof(struct flchip), GFP_KERNEL);

	if (!retcfi) {
		printk(KERN_WARNING "%s: kmalloc failed for CFI private structure\n", map->name);
		kfree(cfi.cfiq);
		return NULL;
	}
	memcpy(retcfi, &cfi, sizeof(cfi));
	memcpy(&retcfi->chips[0], chip, sizeof(struct flchip) * cfi.numchips);
	for (i=0; i< retcfi->numchips; i++) {
		init_waitqueue_head(&retcfi->chips[i].wq);
		spin_lock_init(&retcfi->chips[i]._spinlock);
		retcfi->chips[i].mutex = &retcfi->chips[i]._spinlock;
	}
	return retcfi;
}

#ifdef DEBUG_CFI
static char *vendorname(__u16 vendor) 
{
	switch (vendor) {
	case P_ID_NONE:
		return "None";
		
	case P_ID_INTEL_EXT:
		return "Intel/Sharp Extended";
		
	case P_ID_AMD_STD:
		return "AMD/Fujitsu Standard";
		
	case P_ID_INTEL_STD:
		return "Intel/Sharp Standard";
		
	case P_ID_AMD_EXT:
		return "AMD/Fujitsu Extended";
		
	case P_ID_MITSUBISHI_STD:
		return "Mitsubishi Standard";
		
	case P_ID_MITSUBISHI_EXT:
		return "Mitsubishi Extended";
		
	case P_ID_RESERVED:
		return "Not Allowed / Reserved for Future Use";
		
	default:
		return "Unknown";
	}
}


static void print_cfi_ident(struct cfi_ident *cfip)
{
#if 0
	if (cfip->qry[0] != 'Q' || cfip->qry[1] != 'R' || cfip->qry[2] != 'Y') {
		printk("Invalid CFI ident structure.\n");
		return;
	}	
#endif	
	printk("Primary Vendor Command Set: %4.4X (%s)\n", cfip->P_ID, vendorname(cfip->P_ID));
	if (cfip->P_ADR)
		printk("Primary Algorithm Table at %4.4X\n", cfip->P_ADR);
	else
		printk("No Primary Algorithm Table\n");
	
	printk("Alternative Vendor Command Set: %4.4X (%s)\n", cfip->A_ID, vendorname(cfip->A_ID));
	if (cfip->A_ADR)
		printk("Alternate Algorithm Table at %4.4X\n", cfip->A_ADR);
	else
		printk("No Alternate Algorithm Table\n");
		
		
	printk("Vcc Minimum: %x.%x V\n", cfip->VccMin >> 4, cfip->VccMin & 0xf);
	printk("Vcc Maximum: %x.%x V\n", cfip->VccMax >> 4, cfip->VccMax & 0xf);
	if (cfip->VppMin) {
		printk("Vpp Minimum: %x.%x V\n", cfip->VppMin >> 4, cfip->VppMin & 0xf);
		printk("Vpp Maximum: %x.%x V\n", cfip->VppMax >> 4, cfip->VppMax & 0xf);
	}
	else
		printk("No Vpp line\n");
	
	printk("Typical byte/word write timeout: %d 탎\n", 1<<cfip->WordWriteTimeoutTyp);
	printk("Maximum byte/word write timeout: %d 탎\n", (1<<cfip->WordWriteTimeoutMax) * (1<<cfip->WordWriteTimeoutTyp));
	
	if (cfip->BufWriteTimeoutTyp || cfip->BufWriteTimeoutMax) {
		printk("Typical full buffer write timeout: %d 탎\n", 1<<cfip->BufWriteTimeoutTyp);
		printk("Maximum full buffer write timeout: %d 탎\n", (1<<cfip->BufWriteTimeoutMax) * (1<<cfip->BufWriteTimeoutTyp));
	}
	else
		printk("Full buffer write not supported\n");
	
	printk("Typical block erase timeout: %d 탎\n", 1<<cfip->BlockEraseTimeoutTyp);
	printk("Maximum block erase timeout: %d 탎\n", (1<<cfip->BlockEraseTimeoutMax) * (1<<cfip->BlockEraseTimeoutTyp));
	if (cfip->ChipEraseTimeoutTyp || cfip->ChipEraseTimeoutMax) {
		printk("Typical chip erase timeout: %d 탎\n", 1<<cfip->ChipEraseTimeoutTyp); 
		printk("Maximum chip erase timeout: %d 탎\n", (1<<cfip->ChipEraseTimeoutMax) * (1<<cfip->ChipEraseTimeoutTyp));
	}
	else
		printk("Chip erase not supported\n");
	
	printk("Device size: 0x%X bytes (%d MiB)\n", 1 << cfip->DevSize, 1<< (cfip->DevSize - 20));
	printk("Flash Device Interface description: 0x%4.4X\n", cfip->InterfaceDesc);
	switch(cfip->InterfaceDesc) {
	case 0:
		printk("  - x8-only asynchronous interface\n");
		break;
		
	case 1:
		printk("  - x16-only asynchronous interface\n");
		break;
		
	case 2:
		printk("  - supports x8 and x16 via BYTE# with asynchronous interface\n");
		break;
		
	case 3:
		printk("  - x32-only asynchronous interface\n");
		break;
		
	case 65535:
		printk("  - Not Allowed / Reserved\n");
		break;
		
	default:
		printk("  - Unknown\n");
		break;
	}
	
	printk("Max. bytes in buffer write: 0x%x\n", 1<< cfip->MaxBufWriteSize);
	printk("Number of Erase Block Regions: %d\n", cfip->NumEraseRegions);
	
}
#endif /* DEBUG_CFI */

typedef void cfi_cmdset_fn_t(struct map_info *, int, unsigned long);

extern cfi_cmdset_fn_t cfi_cmdset_0001;
extern cfi_cmdset_fn_t cfi_cmdset_0002;

static void cfi_cmdset_unknown(struct map_info *map, int primary, unsigned long base)
{
	__u16 adr;
	struct cfi_private *cfi = map->fldrv_priv;
	__u16 type = primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;
#ifdef HAVE_INTER_MODULE
	char probename[32];
	cfi_cmdset_fn_t *probe_function;

	sprintf(probename, "cfi_cmdset_%4.4X", type);
		
	probe_function = inter_module_get_request(probename, probename);

	if (probe_function) {
		(*probe_function)(map, primary, base);
		return;
	}	
#endif
	printk(KERN_NOTICE "Support for command set %04X not present\n", type);
	/* This was a command set we don't know about. Print only the basic info */
	adr = primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
	
	if (!adr) {
		printk(" No Extended Query Table\n");
	}
	else {
 		int ofs_factor = cfi->interleave * cfi->device_type;

		if (cfi_read_query(map,base + adr*ofs_factor) != (primary?'P':'A') ||
		    cfi_read_query(map,base + (adr+1)*ofs_factor) != (primary?'R':'L') ||
		    cfi_read_query(map,base + (adr+2)*ofs_factor) != (primary?'I':'T')) {
			printk ("Invalid Extended Query Table at %4.4X: %2.2X %2.2X %2.2X\n",
				adr,
				cfi_read_query(map,base + adr*ofs_factor),
				cfi_read_query(map,base + (adr+1)*ofs_factor),
				cfi_read_query(map,base + (adr+2)*ofs_factor));
		}
		else {
			printk(" Extended Query Table version %c.%c\n",
			       cfi_read_query(map,base + (adr+3)*ofs_factor), 
			       cfi_read_query(map,base + (adr+4)*ofs_factor));
		}
	}
	cfi_send_cmd(0xff, base, map, cfi);
}

static void check_cmd_set(struct map_info *map, int primary, unsigned long base)
{
	struct cfi_private *cfi = map->fldrv_priv;
	__u16 type = primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;
	
	if (type == P_ID_NONE || type == P_ID_RESERVED)
		return;
	/* Put it in query mode */
	cfi_qry_mode(map,base,cfi);

	switch(type){
		/* Urgh. Ifdefs. The version with weak symbols was
		 * _much_ nicer. Shame it didn't seem to work on
		 * anything but x86, really.
		 * But we can't rely in inter_module_get() because
		 * that'd mean we depend on link order.
		 */
#ifdef CONFIG_MTD_CFI_INTELEXT
	case 0x0001:
	case 0x0003:
		return cfi_cmdset_0001(map, primary, base);
#endif
#ifdef CONFIG_MTD_CFI_AMDSTD
	case 0x0002:
		return cfi_cmdset_0002(map, primary, base);
#endif
	}

	return cfi_cmdset_unknown(map, primary, base);
}


#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)
#define cfi_probe_init init_module
#define cfi_probe_exit cleanup_module
#endif

mod_init_t cfi_probe_init(void)
{
	register_mtd_chip_driver(&cfi_chipdrv);
	return 0;
}

mod_exit_t cfi_probe_exit(void)
{
	unregister_mtd_chip_driver(&cfi_chipdrv);
}

module_init(cfi_probe_init);
module_exit(cfi_probe_exit);

--------------0EE39160BEA60CBA15C2C1EE
Content-Type: text/plain; charset=us-ascii;
 name="physmap.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="physmap.c"

/*
 * $Id: physmap.c,v 1.14 2001/07/14 00:59:17 thockin Exp $
 *
 * Normal mappings of chips in physical memory
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/config.h>

#include <linux/mtd/partitions.h>        /*belz*/

#define WINDOW_ADDR CONFIG_MTD_PHYSMAP_START
#define WINDOW_SIZE CONFIG_MTD_PHYSMAP_LEN
#define BUSWIDTH CONFIG_MTD_PHYSMAP_BUSWIDTH


struct mtd_part_def //belz 
{
    int nums;
    unsigned char *type;
    struct mtd_partition* mtd_part;
};


static struct mtd_info *mymtd;
static struct mtd_part_def part_banks; //belz

__u8 physmap_read8(struct map_info *map, unsigned long ofs)
{
	return __raw_readb(map->map_priv_1 + ofs);
}

__u16 physmap_read16(struct map_info *map, unsigned long ofs)
{
	return __raw_readw(map->map_priv_1 + ofs);
}

__u32 physmap_read32(struct map_info *map, unsigned long ofs)
{
	return __raw_readl(map->map_priv_1 + ofs);
}

void physmap_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
{
	memcpy_fromio(to, map->map_priv_1 + from, len);
}

void physmap_write8(struct map_info *map, __u8 d, unsigned long adr)
{
	__raw_writeb(d, map->map_priv_1 + adr);
	mb();
}

void physmap_write16(struct map_info *map, __u16 d, unsigned long adr)
{
	__raw_writew(d, map->map_priv_1 + adr);
	mb();
}

void physmap_write32(struct map_info *map, __u32 d, unsigned long adr)
{
	__raw_writel(d, map->map_priv_1 + adr);
	mb();
}

void physmap_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
{
	memcpy_toio(map->map_priv_1 + to, from, len);
}

struct map_info physmap_map = {
	name: "Physically mapped flash",
	size: WINDOW_SIZE,
	buswidth: BUSWIDTH,
	read8: physmap_read8,
	read16: physmap_read16,
	read32: physmap_read32,
	copy_from: physmap_copy_from,
	write8: physmap_write8,
	write16: physmap_write16,
	write32: physmap_write32,
	copy_to: physmap_copy_to
};

//belz
#ifdef CONFIG_MTD_PARTITIONS
static struct mtd_partition physmap_partitions[] = {
    {
	name: "boot ro",
	offset: 0x00000000,
	size: 0x00010000,		//64k
	mask_flags: MTD_WRITEABLE,	//force ro (read-only)
    },
    {
	name: "zimage ro",
	offset: 0x00010000,
	size: 0x002e0000,		//3mb
	mask_flags: MTD_WRITEABLE,	//force ro (read-only)
    },
    {
	name: "jffs",
	offset: 0x00300000,
	size: 0x00070000,		// 1/2 mb
    },
    {
	name: "jffs backup",
	offset: 0x00370000,
	size: 0x00070000,		// 1/2 mb
    }
};
#endif
//endbelz

#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)
#define init_physmap init_module
#define cleanup_physmap cleanup_module
#endif

int __init init_physmap(void)
{
       	printk(KERN_NOTICE "physmap flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
	physmap_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);

	if (!physmap_map.map_priv_1) {
		printk("Failed to ioremap\n");
		return -EIO;
	}
	mymtd = do_map_probe("cfi_probe", &physmap_map);
	if (mymtd) {
		mymtd->module = THIS_MODULE;
//belz
#ifdef CONFIG_MTD_PARTITIONS
		part_banks.mtd_part = physmap_partitions;
		part_banks.type = "Boot, Images and File System";
		part_banks.nums = 4;
		printk("Physmap Flash: Using %s partition definition\n", part_banks.type);
		add_mtd_partitions(mymtd, part_banks.mtd_part, part_banks.nums);
#else
		add_mtd_device(mymtd);
#endif
//endblez
		return 0;
	}
	iounmap((void *)physmap_map.map_priv_1);
	return -ENXIO;
}

static void __exit cleanup_physmap(void)
{
	if (mymtd) {
		del_mtd_device(mymtd);
		map_destroy(mymtd);
	}
	if (physmap_map.map_priv_1) {
		iounmap((void *)physmap_map.map_priv_1);
		physmap_map.map_priv_1 = 0;
	}
}

module_init(init_physmap);
module_exit(cleanup_physmap);


--------------0EE39160BEA60CBA15C2C1EE
Content-Type: text/plain; charset=us-ascii;
 name=".config"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename=".config"

#
# Automatically generated by make menuconfig: don't edit
#
# CONFIG_UID16 is not set

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y

#
# Loadable module support
#
CONFIG_MODULES=y
# CONFIG_MODVERSIONS is not set
CONFIG_KMOD=y

#
# Platform support
#
CONFIG_PPC=y
# CONFIG_6xx is not set
# CONFIG_4xx is not set
# CONFIG_POWER3 is not set
# CONFIG_POWER4 is not set
CONFIG_8xx=y
CONFIG_SERIAL_CONSOLE=y
# CONFIG_RPXLITE is not set
# CONFIG_RPXCLASSIC is not set
CONFIG_BSEIP=y
# CONFIG_TQM823L is not set
# CONFIG_TQM850L is not set
# CONFIG_TQM855L is not set
# CONFIG_TQM860L is not set
# CONFIG_FPS850L is not set
# CONFIG_TQM860 is not set
# CONFIG_SPD823TS is not set
# CONFIG_IVMS8 is not set
# CONFIG_SM850 is not set
# CONFIG_MBX is not set
# CONFIG_FADS is not set
# CONFIG_WINCEPT is not set
CONFIG_NOT_COHERENT_CACHE=y
# CONFIG_WORKSTATION_PPC is not set
# CONFIG_SMP is not set
# CONFIG_OPENFIRMWARE is not set
# CONFIG_MATH_EMULATION is not set
# CONFIG_RTSCHED is not set

#
# General setup
#
# CONFIG_HIGHMEM is not set
# CONFIG_MOL is not set
# CONFIG_ISA is not set
# CONFIG_EISA is not set
# CONFIG_SBUS is not set
# CONFIG_MCA is not set
# CONFIG_PCI_QSPAN is not set
# CONFIG_PCI is not set
CONFIG_NET=y
CONFIG_SYSCTL=y
CONFIG_SYSVIPC=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_KCORE_ELF=y
CONFIG_BINFMT_ELF=y
CONFIG_KERNEL_ELF=y
CONFIG_BINFMT_MISC=y
# CONFIG_HOTPLUG is not set
# CONFIG_PCMCIA is not set

#
# Parallel port support
#
# CONFIG_PARPORT is not set
# CONFIG_PPC_RTC is not set
CONFIG_CMDLINE_BOOL=y
CONFIG_CMDLINE="console=ttyS0,9600 console=tty0 root=/dev/ram"

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_REDBOOT_PARTS=y
# CONFIG_MTD_BOOTLDR_PARTS is not set
# CONFIG_MTD_AFS_PARTS is not set
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=y
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
CONFIG_MTD_JEDEC=y

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=fe000000
CONFIG_MTD_PHYSMAP_LEN=0400000
CONFIG_MTD_PHYSMAP_BUSWIDTH=2
# CONFIG_MTD_SUN_UFLASH is not set
# CONFIG_MTD_NORA is not set
# CONFIG_MTD_PNC2000 is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_SC520CDP is not set
# CONFIG_MTD_NETSC520 is not set
# CONFIG_MTD_SBC_GXX is not set
# CONFIG_MTD_ELAN_104NC is not set
# CONFIG_MTD_DBOX2 is not set
# CONFIG_MTD_CSTM_MIPS_IXX is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_SOLUTIONENGINE is not set
# CONFIG_MTD_MIXMEM is not set
# CONFIG_MTD_OCTAGON is not set
# CONFIG_MTD_VMAX is not set
# CONFIG_MTD_OCELOT is not set
# CONFIG_MTD_L440GX is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_LART is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set

#
# Plug and Play configuration
#
# CONFIG_PNP is not set
# CONFIG_ISAPNP is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_BLK_DEV_XD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
CONFIG_BLK_DEV_LOOP=y
# CONFIG_BLK_DEV_NBD is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=8192
CONFIG_BLK_DEV_INITRD=y

#
# Multi-device support (RAID and LVM)
#
# CONFIG_MD is not set
# CONFIG_BLK_DEV_MD is not set
# CONFIG_MD_LINEAR is not set
# CONFIG_MD_RAID0 is not set
# CONFIG_MD_RAID1 is not set
# CONFIG_MD_RAID5 is not set
# CONFIG_BLK_DEV_LVM is not set

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_MMAP is not set
CONFIG_NETLINK=y
CONFIG_RTNETLINK=y
# CONFIG_NETLINK_DEV is not set
# CONFIG_NETFILTER is not set
# CONFIG_FILTER is not set
CONFIG_UNIX=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_RTNETLINK=y
CONFIG_NETLINK=y
# CONFIG_IP_MULTIPLE_TABLES is not set
# CONFIG_IP_ROUTE_MULTIPATH is not set
# CONFIG_IP_ROUTE_TOS is not set
# CONFIG_IP_ROUTE_VERBOSE is not set
# CONFIG_IP_ROUTE_LARGE_TABLES is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_ARPD is not set
# CONFIG_INET_ECN is not set
CONFIG_SYN_COOKIES=y
# CONFIG_IPV6 is not set
# CONFIG_KHTTPD is not set
# CONFIG_ATM is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_DECNET is not set
# CONFIG_BRIDGE is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_LLC is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_FASTROUTE is not set
# CONFIG_NET_HW_FLOWCONTROL is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# ATA/IDE/MFM/RLL support
#
# CONFIG_IDE is not set
# CONFIG_BLK_DEV_IDE_MODES is not set
# CONFIG_BLK_DEV_HD is not set

#
# SCSI support
#
# CONFIG_SCSI is not set

#
# Network device support
#
CONFIG_NETDEVICES=y

#
# ARCnet devices
#
# CONFIG_ARCNET is not set
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_ETHERTAP is not set
# CONFIG_NET_SB1000 is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
CONFIG_SCC_ENET=y
# CONFIG_SCC1_ENET is not set
CONFIG_SCC2_ENET=y
# CONFIG_SCC3_ENET is not set
# CONFIG_FEC_ENET is not set
# CONFIG_ENET_BIG_BUFFERS is not set
# CONFIG_NET_VENDOR_3COM is not set
# CONFIG_LANCE is not set
# CONFIG_NET_VENDOR_SMC is not set
# CONFIG_NET_VENDOR_RACAL is not set
# CONFIG_AT1700 is not set
# CONFIG_DEPCA is not set
# CONFIG_NET_ISA is not set
# CONFIG_NET_PCI is not set
# CONFIG_NET_POCKET is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC is not set
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
# CONFIG_SK98LIN is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set
# CONFIG_NET_FC is not set
# CONFIG_RCPCI is not set
# CONFIG_SHAPER is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set

#
# Amateur Radio support
#
# CONFIG_HAMRADIO is not set

#
# IrDA (infrared) support
#
# CONFIG_IRDA is not set

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Old CD-ROM drivers (not SCSI, not IDE)
#
# CONFIG_CD_NO_IDESCSI is not set

#
# Console drivers
#

#
# Frame-buffer support
#
# CONFIG_FB is not set

#
# Input core support
#
# CONFIG_INPUT is not set

#
# Macintosh device drivers
#
# CONFIG_MACINTOSH_DRIVERS is not set

#
# Character devices
#
CONFIG_VT=y
# CONFIG_VT_CONSOLE is not set
# CONFIG_SERIAL is not set
# CONFIG_SERIAL_EXTENDED is not set
# CONFIG_SERIAL_NONSTANDARD is not set
CONFIG_UNIX98_PTYS=y
CONFIG_UNIX98_PTY_COUNT=128

#
# I2C support
#
# CONFIG_I2C is not set

#
# Hardware monitors support
#
# CONFIG_MONITORS is not set

#
# Mice
#
# CONFIG_BUSMOUSE is not set
# CONFIG_MOUSE is not set

#
# Joysticks
#
# CONFIG_JOYSTICK is not set
# CONFIG_QIC02_TAPE is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
# CONFIG_INTEL_RNG is not set
# CONFIG_NVRAM is not set
# CONFIG_RTC is not set
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
# CONFIG_AGP is not set
# CONFIG_DRM is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# File systems
#
# CONFIG_QUOTA is not set
# CONFIG_MULTI_THREADED_CORE_FILES is not set
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_REISERFS_CHECK is not set
# CONFIG_ADFS_FS is not set
# CONFIG_ADFS_FS_RW is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
CONFIG_JFFS_FS=y
CONFIG_JFFS_FS_VERBOSE=0
# CONFIG_JFFS2_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_RAMFS is not set
# CONFIG_ISO9660_FS is not set
# CONFIG_JOLIET is not set
# CONFIG_MINIX_FS is not set
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS_RW is not set
# CONFIG_HPFS_FS is not set
CONFIG_PROC_FS=y
CONFIG_DEVFS_FS=y
CONFIG_DEVFS_MOUNT=y
CONFIG_DEVFS_DEBUG=y
CONFIG_DEVPTS_FS=y
# CONFIG_QNX4FS_FS is not set
# CONFIG_QNX4FS_RW is not set
# CONFIG_ROMFS_FS is not set
CONFIG_EXT2_FS=y
# CONFIG_SYSV_FS is not set
# CONFIG_SYSV_FS_WRITE is not set
# CONFIG_UDF_FS is not set
# CONFIG_UDF_RW is not set
# CONFIG_UFS_FS is not set
# CONFIG_UFS_FS_WRITE is not set

#
# Network File Systems
#
# CONFIG_CODA_FS is not set
CONFIG_NFS_FS=y
# CONFIG_NFS_V3 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFSD is not set
# CONFIG_NFSD_V3 is not set
CONFIG_SUNRPC=y
CONFIG_LOCKD=y
# CONFIG_SMB_FS is not set
# CONFIG_NCP_FS is not set
# CONFIG_NCPFS_PACKET_SIGNING is not set
# CONFIG_NCPFS_IOCTL_LOCKING is not set
# CONFIG_NCPFS_STRONG is not set
# CONFIG_NCPFS_NFS_NS is not set
# CONFIG_NCPFS_OS2_NS is not set
# CONFIG_NCPFS_SMALLDOS is not set
# CONFIG_NCPFS_NLS is not set
# CONFIG_NCPFS_EXTRAS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
# CONFIG_SMB_NLS is not set
# CONFIG_NLS is not set

#
# Sound
#
# CONFIG_SOUND is not set

#
# MPC8xx CPM Options
#
# CONFIG_SMC2_UART is not set
# CONFIG_USE_SCC_IO is not set
# CONFIG_8xx_COPYBACK is not set
# CONFIG_8xx_CPU6 is not set

#
# USB support
#
# CONFIG_USB is not set

#
# Kernel hacking
#
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_KGDB is not set
# CONFIG_XMON is not set

--------------0EE39160BEA60CBA15C2C1EE--
