From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 18 Mar 2003 17:23:43 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <1047926318.11517.235.camel@tubarao>
References: <1047428715.11517.50.camel@tubarao>
 <20030312102735.U1745@brecis.com>  <1047915630.11512.81.camel@tubarao>
 <1047926318.11517.235.camel@tubarao>
Message-ID: <1048033423.11512.1657.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-RZKiLm5gawTslA20lq2l
Content-Type: multipart/mixed; boundary="=-YdlygX9g8mw3u7YELU6q"


--=-YdlygX9g8mw3u7YELU6q
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-03-17 at 11:38, Thayne Harbaugh wrote:

> I have been thinking about the above mentioned problem with DQ5.  I have
> not seen DQ5 behavior documented in the SST49LF040 and Pm49FL00x
> documentation and suspect that other chip documentation is similar.

I wonder if this DQ5 for non suspend/resume chips is documented in
JESD21C.  Does anyone know or ever have an idea where to begin digging
through all the JEDEC meeting notes, etc.?

> Regardless of the current behavior of status bit 5 on these chips I
> think the documentation should be followed.

It's just plain dangerous to follow non-documented behavior.

>   This means that either the
> cfi_cmdset_0002 driver needs to be adapted to work with the "simplified"
> polling in _addition_ to the current polling of DQ5 (some switch is
> added to poll correctly for a given device) or a new cfi_cmdset_xxxx is
> written specifically for this simplified command set.
>=20
> I'm not sure what would be a nice, clean way to switch polling
> mechanisms, but I hesitate to duplicate code for a nearly identical
> cfi_cmdset.

I have worked up a patch that adds a new cfi_cmdset to the mix.  This is
for devices that support a subset or a simplified AMD command set
without the suspend/resume commands and extra query bits.

I feel it's good because I don't feel comfortable trusting the behavior
of DQ5 being low during erase/write operations for devices that don't
support DQ5 and have undocumented behavior for bits other than DQ7 and
DQ6.  It throws out suspend and resume functions and polls exclusively
on DQ7 and DQ6.

I have called this a simplified AMD commandset (ugly name - give me
something better) and have pulled cfi_cmdset_0005 out of the hat (I'm
not sure how the command set numbers are chosen).

Jedec devices listed in jedec_probe.c:jedec_table[] that don't support
suspend resume are marked as P_ID_AMD_SIMPLIFIED (new entry in cfi.h).

I'm not sure why gen_probe.c/check_cmd_set() uses the hex numbers in the
switch statement rather than the P_ID_* #define's from cfi.h - I used
the #define.

  It likely could be simplified even more - take out feeble support for
interleaved chips (which I don't have and can't test and I'm not even
sure that the chips that work this way support interleaving).

Sometimes I wish all of the command sets shared more code - other times
I'm glad they are split.

Should I commit it to CVS?  It works for me(TM).

> Thoughts?

Sorry to reply to myself - I talk back to myself as well.

I still think that the current cfi_cmdset_0002.c needs a fix similar to
what Steve Wahl proposed.  Has that settled and will it be committed?

--=20
Thayne Harbaugh
Linux Networx

--=-YdlygX9g8mw3u7YELU6q
Content-Disposition: attachment; filename=mtd-amd_simplified.patch
Content-Type: text/x-patch; name=mtd-amd_simplified.patch; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

diff -uNr mtd/drivers/mtd/chips/cfi_cmdset_0005.c mtd-amd_simplified/driver=
s/mtd/chips/cfi_cmdset_0005.c
--- mtd/drivers/mtd/chips/cfi_cmdset_0005.c	1969-12-31 17:00:00.000000000 -=
0700
+++ mtd-amd_simplified/drivers/mtd/chips/cfi_cmdset_0005.c	2003-03-18 16:51=
:05.000000000 -0700
@@ -0,0 +1,1027 @@
+/*
+ * Common Flash Interface support:
+ *   AMD Simplified command set (ID 0x0005)
+ *
+ * Copyright (C) 2000 Crossnet Co. <info@crossnet.co.jp>
+ * Copyright (C) 2003 Linux Networx - adapted to AMD simplified
+ *     command set by Thayne Harbaugh.  This is nearly the same
+ *     as cfi_cmdset_0002 except for the polling mechanism for
+ *     erase/write operations and the removal of extra
+ *     functionality: erase suspend and resume.  Ideally this and
+ *     cfi_cmdset_0002 should share as much as possible.
+ *
+ * Although this looks like it was written for interleaved chips,
+ *     it has never been tested.  Ise at your own risk and send
+ *     in the patches.
+ *
+ * This code is GPL
+ *
+ * $Id$
+ *
+ */
+
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <asm/io.h>
+#include <asm/byteorder.h>
+
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/mtd/map.h>
+#include <linux/mtd/cfi.h>
+
+
+static int cfi_amdsmpl_read (struct mtd_info *, loff_t, size_t, size_t *, =
u_char *);
+static int cfi_amdsmpl_write(struct mtd_info *, loff_t, size_t, size_t *, =
const u_char *);
+static int cfi_amdsmpl_erase_onesize(struct mtd_info *, struct erase_info =
*);
+static int cfi_amdsmpl_erase_varsize(struct mtd_info *, struct erase_info =
*);
+static void cfi_amdsmpl_sync (struct mtd_info *);
+static int cfi_amdsmpl_secsi_read (struct mtd_info *, loff_t, size_t, size=
_t *, u_char *);
+
+static void cfi_amdsmpl_destroy(struct mtd_info *);
+
+struct mtd_info *cfi_cmdset_0005(struct map_info *, int);
+static struct mtd_info *cfi_amdsmpl_setup (struct map_info *);
+
+
+static struct mtd_chip_driver cfi_amdsmpl_chipdrv =3D {
+	probe: NULL, /* Not usable directly */
+	destroy: cfi_amdsmpl_destroy,
+	name: "cfi_cmdset_0005",
+	module: THIS_MODULE
+};
+
+struct mtd_info *cfi_cmdset_0005(struct map_info *map, int primary)
+{
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	unsigned char bootloc;
+	int ofs_factor =3D cfi->interleave * cfi->device_type;
+	int i;
+	__u8 major, minor;
+	__u32 base =3D cfi->chips[0].start;
+
+	if (cfi->cfi_mode=3D=3DCFI_MODE_CFI){
+		__u16 adr =3D primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;
+
+		cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
+	=09
+		major =3D cfi_read_query(map, base + (adr+3)*ofs_factor);
+		minor =3D cfi_read_query(map, base + (adr+4)*ofs_factor);
+	=09
+		printk(KERN_NOTICE " Amd/Fujitsu Extended Query Table v%c.%c at 0x%4.4X\=
n",
+		       major, minor, adr);
+				cfi_send_gen_cmd(0xf0, 0x55, base, map, cfi, cfi->device_type, NULL);
+	=09
+		cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
+		cfi->mfr =3D cfi_read_query(map, base);
+		cfi->id =3D cfi_read_query(map, base + ofs_factor);   =20
+
+		/* Wheee. Bring me the head of someone at AMD. */
+		cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
+		bootloc =3D cfi_read_query(map, base + (adr+15)*ofs_factor);
+		if (bootloc =3D=3D 3 && cfi->cfiq->NumEraseRegions > 1) {
+			printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n=
", map->name);
+		=09
+			for (i=3D0; i<cfi->cfiq->NumEraseRegions / 2; i++) {
+				int j =3D (cfi->cfiq->NumEraseRegions-1)-i;
+				__u32 swap;
+			=09
+				swap =3D cfi->cfiq->EraseRegionInfo[i];
+				cfi->cfiq->EraseRegionInfo[i] =3D cfi->cfiq->EraseRegionInfo[j];
+				cfi->cfiq->EraseRegionInfo[j] =3D swap;
+			}
+		}
+		switch (cfi->device_type) {
+		case CFI_DEVICETYPE_X8:
+			cfi->addr_unlock1 =3D 0x555;=20
+			cfi->addr_unlock2 =3D 0x2aa;=20
+			break;
+		case CFI_DEVICETYPE_X16:
+			cfi->addr_unlock1 =3D 0xaaa;
+			if (map->buswidth =3D=3D cfi->interleave) {
+				/* X16 chip(s) in X8 mode */
+				cfi->addr_unlock2 =3D 0x555;
+			} else {
+				cfi->addr_unlock2 =3D 0x554;
+			}
+			break;
+		case CFI_DEVICETYPE_X32:
+			cfi->addr_unlock1 =3D 0x1555;=20
+			cfi->addr_unlock2 =3D 0xaaa;=20
+			break;
+		default:
+			printk(KERN_NOTICE "Eep. Unknown cfi_cmdset_0005 device type %d\n", cfi=
->device_type);
+			return NULL;
+		}
+	} /* CFI mode */
+
+	for (i=3D0; i< cfi->numchips; i++) {
+		cfi->chips[i].word_write_time =3D 1<<cfi->cfiq->WordWriteTimeoutTyp;
+		cfi->chips[i].buffer_write_time =3D 1<<cfi->cfiq->BufWriteTimeoutTyp;
+		cfi->chips[i].erase_time =3D 1<<cfi->cfiq->BlockEraseTimeoutTyp;
+	}	=09
+=09
+	map->fldrv =3D &cfi_amdsmpl_chipdrv;
+
+	cfi_send_gen_cmd(0xf0, 0x55, base, map, cfi, cfi->device_type, NULL);
+	return cfi_amdsmpl_setup(map);
+}
+
+static struct mtd_info *cfi_amdsmpl_setup(struct map_info *map)
+{
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	struct mtd_info *mtd;
+	unsigned long devsize =3D (1<<cfi->cfiq->DevSize) * cfi->interleave;
+
+	mtd =3D kmalloc(sizeof(*mtd), GFP_KERNEL);
+	printk(KERN_NOTICE "number of %s chips: %d\n",=20
+		(cfi->cfi_mode =3D=3D CFI_MODE_CFI)?"CFI":"JEDEC",cfi->numchips);
+
+	if (!mtd) {
+	  printk(KERN_WARNING "Failed to allocate memory for MTD device\n");
+	  goto setup_err;
+	}
+
+	memset(mtd, 0, sizeof(*mtd));
+	mtd->priv =3D map;
+	mtd->type =3D MTD_NORFLASH;
+	/* Also select the correct geometry setup too */=20
+	mtd->size =3D devsize * cfi->numchips;
+=09
+	if (cfi->cfiq->NumEraseRegions =3D=3D 1) {
+		/* No need to muck about with multiple erase sizes */
+		mtd->erasesize =3D ((cfi->cfiq->EraseRegionInfo[0] >> 8) & ~0xff) * cfi-=
>interleave;
+	} else {
+		unsigned long offset =3D 0;
+		int i,j;
+
+		mtd->numeraseregions =3D cfi->cfiq->NumEraseRegions * cfi->numchips;
+		mtd->eraseregions =3D kmalloc(sizeof(struct mtd_erase_region_info) * mtd=
->numeraseregions, GFP_KERNEL);
+		if (!mtd->eraseregions) {=20
+			printk(KERN_WARNING "Failed to allocate memory for MTD erase region inf=
o\n");
+			goto setup_err;
+		}
+		=09
+		for (i=3D0; i<cfi->cfiq->NumEraseRegions; i++) {
+			unsigned long ernum, ersize;
+			ersize =3D ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * cfi->interl=
eave;
+			ernum =3D (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;
+		=09
+			if (mtd->erasesize < ersize) {
+				mtd->erasesize =3D ersize;
+			}
+			for (j=3D0; j<cfi->numchips; j++) {
+				mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].offset =3D (j*devs=
ize)+offset;
+				mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize =3D ersi=
ze;
+				mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks =3D ernu=
m;
+			}
+			offset +=3D (ersize * ernum);
+		}
+		if (offset !=3D devsize) {
+			/* Argh */
+			printk(KERN_WARNING "Sum of regions (%lx) !=3D total size of set of int=
erleaved chips (%lx)\n", offset, devsize);
+			goto setup_err;
+		}
+#if 0
+		// debug
+		for (i=3D0; i<mtd->numeraseregions;i++){
+			printk("%d: offset=3D0x%x,size=3D0x%x,blocks=3D%d\n",
+			       i,mtd->eraseregions[i].offset,
+			       mtd->eraseregions[i].erasesize,
+			       mtd->eraseregions[i].numblocks);
+		}
+#endif
+	}
+
+	switch (CFIDEV_BUSWIDTH)
+	{
+	case 1:
+	case 2:
+	case 4:
+#if 1
+		if (mtd->numeraseregions > 1)
+			mtd->erase =3D cfi_amdsmpl_erase_varsize;
+		else
+#endif
+			mtd->erase =3D cfi_amdsmpl_erase_onesize;
+		mtd->read =3D cfi_amdsmpl_read;
+		mtd->write =3D cfi_amdsmpl_write;
+		break;
+
+	default:
+	        printk(KERN_WARNING "Unsupported buswidth\n");
+		goto setup_err;
+		break;
+	}
+	if (cfi->fast_prog) {
+		/* In cfi_amdsmpl_write() we frob the protection stuff
+		   without paying any attention to the state machine.
+		   This upsets in-progress erases. So we turn this flag
+		   off for now till the code gets fixed. */
+		printk(KERN_NOTICE "cfi_cmdset_0005: Disabling fast programming due to c=
ode brokenness.\n");
+		cfi->fast_prog =3D 0;
+	}
+
+
+        /* does this chip have a secsi area? */
+	if(cfi->mfr=3D=3D1){
+	=09
+		switch(cfi->id){
+		case 0x50:
+		case 0x53:
+		case 0x55:
+		case 0x56:
+		case 0x5C:
+		case 0x5F:
+			/* Yes */
+			mtd->read_user_prot_reg =3D cfi_amdsmpl_secsi_read;
+			mtd->read_fact_prot_reg =3D cfi_amdsmpl_secsi_read;
+		default:		      =20
+			;
+		}
+	}
+=09
+	=09
+	mtd->sync =3D cfi_amdsmpl_sync;
+	mtd->suspend =3D NULL;
+	mtd->resume =3D NULL;
+	mtd->flags =3D MTD_CAP_NORFLASH;
+	map->fldrv =3D &cfi_amdsmpl_chipdrv;
+	mtd->name =3D map->name;
+	MOD_INC_USE_COUNT;
+	return mtd;
+
+ setup_err:
+	if(mtd) {
+		if(mtd->eraseregions)
+			kfree(mtd->eraseregions);
+		kfree(mtd);
+	}
+	kfree(cfi->cmdset_priv);
+	kfree(cfi->cfiq);
+	return NULL;
+}
+
+static inline int do_read_onechip(struct map_info *map, struct flchip *chi=
p, loff_t adr, size_t len, u_char *buf)
+{
+	DECLARE_WAITQUEUE(wait, current);
+	unsigned long timeo =3D jiffies + HZ;
+
+ retry:
+	cfi_spin_lock(chip->mutex);
+
+	if (chip->state !=3D FL_READY){
+#if 0
+	        printk(KERN_DEBUG "Waiting for chip to read, status =3D %d\n", ch=
ip->state);
+#endif
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&chip->wq, &wait);
+               =20
+		cfi_spin_unlock(chip->mutex);
+
+		schedule();
+		remove_wait_queue(&chip->wq, &wait);
+#if 0
+		if(signal_pending(current))
+			return -EINTR;
+#endif
+		timeo =3D jiffies + HZ;
+
+		goto retry;
+	}=09
+
+	adr +=3D chip->start;
+
+	chip->state =3D FL_READY;
+
+	map->copy_from(map, buf, adr, len);
+
+	wake_up(&chip->wq);
+	cfi_spin_unlock(chip->mutex);
+
+	return 0;
+}
+
+static int cfi_amdsmpl_read (struct mtd_info *mtd, loff_t from, size_t len=
, size_t *retlen, u_char *buf)
+{
+	struct map_info *map =3D mtd->priv;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	unsigned long ofs;
+	int chipnum;
+	int ret =3D 0;
+
+	/* ofs: offset within the first chip that the first read should start */
+
+	chipnum =3D (from >> cfi->chipshift);
+	ofs =3D from - (chipnum <<  cfi->chipshift);
+
+
+	*retlen =3D 0;
+
+	while (len) {
+		unsigned long thislen;
+
+		if (chipnum >=3D cfi->numchips)
+			break;
+
+		if ((len + ofs -1) >> cfi->chipshift)
+			thislen =3D (1<<cfi->chipshift) - ofs;
+		else
+			thislen =3D len;
+
+		ret =3D do_read_onechip(map, &cfi->chips[chipnum], ofs, thislen, buf);
+		if (ret)
+			break;
+
+		*retlen +=3D thislen;
+		len -=3D thislen;
+		buf +=3D thislen;
+
+		ofs =3D 0;
+		chipnum++;
+	}
+	return ret;
+}
+
+static inline int do_read_secsi_onechip(struct map_info *map, struct flchi=
p *chip, loff_t adr, size_t len, u_char *buf)
+{
+	DECLARE_WAITQUEUE(wait, current);
+	unsigned long timeo =3D jiffies + HZ;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+
+ retry:
+	cfi_spin_lock(chip->mutex);
+
+	if (chip->state !=3D FL_READY){
+#if 0
+	        printk(KERN_DEBUG "Waiting for chip to read, status =3D %d\n", ch=
ip->state);
+#endif
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&chip->wq, &wait);
+               =20
+		cfi_spin_unlock(chip->mutex);
+
+		schedule();
+		remove_wait_queue(&chip->wq, &wait);
+#if 0
+		if(signal_pending(current))
+			return -EINTR;
+#endif
+		timeo =3D jiffies + HZ;
+
+		goto retry;
+	}=09
+
+	adr +=3D chip->start;
+
+	chip->state =3D FL_READY;
+=09
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
+	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
+=09
+	map->copy_from(map, buf, adr, len);
+
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
+	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->dev=
ice_type, NULL);
+=09
+	wake_up(&chip->wq);
+	cfi_spin_unlock(chip->mutex);
+
+	return 0;
+}
+
+static int cfi_amdsmpl_secsi_read (struct mtd_info *mtd, loff_t from, size=
_t len, size_t *retlen, u_char *buf)
+{
+	struct map_info *map =3D mtd->priv;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	unsigned long ofs;
+	int chipnum;
+	int ret =3D 0;
+
+
+	/* ofs: offset within the first chip that the first read should start */
+
+	/* 8 secsi bytes per chip */
+	chipnum=3Dfrom>>3;
+	ofs=3Dfrom & 7;
+
+
+	*retlen =3D 0;
+
+	while (len) {
+		unsigned long thislen;
+
+		if (chipnum >=3D cfi->numchips)
+			break;
+
+		if ((len + ofs -1) >> 3)
+			thislen =3D (1<<3) - ofs;
+		else
+			thislen =3D len;
+
+		ret =3D do_read_secsi_onechip(map, &cfi->chips[chipnum], ofs, thislen, b=
uf);
+		if (ret)
+			break;
+
+		*retlen +=3D thislen;
+		len -=3D thislen;
+		buf +=3D thislen;
+
+		ofs =3D 0;
+		chipnum++;
+	}
+	return ret;
+}
+
+
+static inline int status_poll( struct map_info *map, struct flchip *chip, =
unsigned long adr, __u32 datum, unsigned long timeo )
+{
+	int ret =3D 0;
+	unsigned int dq6, dq7;=09
+	unsigned int oldstatus, status;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+
+	/*
+	 * Wait for the end of programing/erasure by using the toggle method.
+	 * As long as there is a programming procedure going on, bit 6 of the las=
t
+	 * written byte is toggling it's state with each consectuve read and
+	 * bit 7 is the complement of the data written.
+	 * The toggling stops as soon as the procedure is completed and bit
+	 * 7 represents true data.
+	 */
+
+	/*
+	 * Polling toggle bits instead of reading back many times
+	 * This ensures that write operation is really completed,
+	 */
+	dq6 =3D CMD(1<<6);     /* toggle until operation finishes */
+	dq7 =3D CMD(1<<7);     /* inverts data until operation finishes */
+
+	oldstatus =3D cfi_read(map, adr);
+	status =3D cfi_read(map, adr);
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.2x 0x%.2x\n", __func__, old=
status, status );
+
+	while( ( ( oldstatus ^ status ) & dq6 )
+	       && ( ( status ^ datum ) & dq7 )
+	       && ! time_after(jiffies, timeo) ) {
+
+		if (need_resched()) {
+			cfi_spin_unlock(chip->mutex);
+			yield();
+			cfi_spin_lock(chip->mutex);
+		} else=20
+			udelay(1);
+
+		oldstatus =3D cfi_read( map, adr );
+		status =3D cfi_read( map, adr );
+		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.2x 0x%.2x\n", __func__, ol=
dstatus, status );
+	}
+
+	if ( time_after( jiffies, timeo ) ) {
+		/*
+		 * The operation did not complete in reasonable time - the
+		 * chip should be reset.
+		 */
+		printk(KERN_WARNING
+		       "MTD %s(): Internal flash device timeout occured\n",
+		       __func__ );
+	        cfi_write( map, CMD(0xF0), chip->start );
+		ret =3D -EIO;
+	} else {
+
+		status =3D cfi_read(map, adr);
+
+		if ( datum !=3D status ) {
+			/* must check two more times and succeed for both */
+			oldstatus =3D cfi_read(map, adr);
+			status =3D cfi_read(map, adr);
+			if ( datum !=3D oldstatus || datum !=3D status ) {
+				DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): 0x%.2x !=3D 0x%.2x\n", __func__, s=
tatus, datum );
+				ret =3D -EIO;
+			}
+		}
+	}
+
+	return ret;
+}
+
+
+static int do_write_oneword(struct map_info *map, struct flchip *chip, uns=
igned long adr, __u32 datum, int fast)
+{
+	unsigned long timeo =3D jiffies + HZ;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+    /* We use a 1ms + 1 jiffies generic timeout for writes (most devices h=
ave
+       a max write time of a few hundreds usec). However, we should use th=
e
+       maximum timeout value given by the chip at probe time instead.=20
+       Unfortunately, struct flchip does have a field for maximum timeout,=
=20
+       only for typical which can be far too short depending of the condit=
ions.
+       The ' + 1' is to avoid having a timeout of 0 jiffies if HZ is small=
er
+       than 1000. Using a static variable allows makes us save the costly
+       divide operation at each word write.*/=20
+    static unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
+	DECLARE_WAITQUEUE(wait, current);
+	int ret =3D 0;
+
+ retry:
+	cfi_spin_lock(chip->mutex);
+
+	if (chip->state !=3D FL_READY) {
+#if 0
+	        printk(KERN_DEBUG "Waiting for chip to write, status =3D %d\n", c=
hip->state);
+#endif
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&chip->wq, &wait);
+               =20
+		cfi_spin_unlock(chip->mutex);
+
+		schedule();
+		remove_wait_queue(&chip->wq, &wait);
+#if 0
+		printk(KERN_DEBUG "Wake up to write:\n");
+		if(signal_pending(current))
+			return -EINTR;
+#endif
+		timeo =3D jiffies + HZ;
+
+		goto retry;
+	}=09
+
+	chip->state =3D FL_WRITING;
+
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE (0x%.8lx)0x%.2x\n", __func__, a=
dr, datum );
+	adr +=3D chip->start;
+	ENABLE_VPP(map);
+	if (fast) { /* Unlock bypass */
+		cfi_send_gen_cmd(0xA0, 0, chip->start, map, cfi, cfi->device_type, NULL)=
;
+	}
+	else {
+	        cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);
+	        cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);
+	        cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, =
CFI_DEVICETYPE_X8, NULL);
+	}
+
+	cfi_write(map, datum, adr);
+
+	cfi_spin_unlock(chip->mutex);
+	cfi_udelay(chip->word_write_time);
+	cfi_spin_lock(chip->mutex);
+
+	/* See comment above for timeout value. */
+	ret =3D status_poll( map, chip, adr, datum, jiffies + uWriteTimeout );
+
+	DISABLE_VPP(map);
+	chip->state =3D FL_READY;
+	wake_up(&chip->wq);
+	cfi_spin_unlock(chip->mutex);
+
+	return ret;
+}
+
+
+static int cfi_amdsmpl_write (struct mtd_info *mtd, loff_t to , size_t len=
, size_t *retlen, const u_char *buf)
+{
+	struct map_info *map =3D mtd->priv;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	int ret =3D 0;
+	int chipnum;
+	unsigned long ofs, chipstart;
+
+	*retlen =3D 0;
+	if (!len)
+		return 0;
+
+	chipnum =3D to >> cfi->chipshift;
+	ofs =3D to  - (chipnum << cfi->chipshift);
+	chipstart =3D cfi->chips[chipnum].start;
+
+	/* If it's not bus-aligned, do the first byte write */
+	if (ofs & (CFIDEV_BUSWIDTH-1)) {
+		unsigned long bus_ofs =3D ofs & ~(CFIDEV_BUSWIDTH-1);
+		int i =3D ofs - bus_ofs;
+		int n =3D 0;
+		u_char tmp_buf[8];
+		__u32 datum;
+
+		map->copy_from(map, tmp_buf, bus_ofs + cfi->chips[chipnum].start, CFIDEV=
_BUSWIDTH);
+		while (len && i < CFIDEV_BUSWIDTH)
+			tmp_buf[i++] =3D buf[n++], len--;
+
+		if (cfi_buswidth_is_2()) {
+			datum =3D *(__u16*)tmp_buf;
+		} else if (cfi_buswidth_is_4()) {
+			datum =3D *(__u32*)tmp_buf;
+		} else {
+			return -EINVAL;  /* should never happen, but be safe */
+		}
+
+		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=20
+				bus_ofs, datum, 0);
+		if (ret)=20
+			return ret;
+	=09
+		ofs +=3D n;
+		buf +=3D n;
+		(*retlen) +=3D n;
+
+		if (ofs >> cfi->chipshift) {
+			chipnum ++;=20
+			ofs =3D 0;
+			if (chipnum =3D=3D cfi->numchips)
+				return 0;
+		}
+	}
+=09
+	if (cfi->fast_prog) {
+		/* Go into unlock bypass mode */
+		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVIC=
ETYPE_X8, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEVIC=
ETYPE_X8, NULL);
+		cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVIC=
ETYPE_X8, NULL);
+	}
+
+	/* We are now aligned, write as much as possible */
+	while(len >=3D CFIDEV_BUSWIDTH) {
+		__u32 datum;
+
+		if (cfi_buswidth_is_1()) {
+			datum =3D *(__u8*)buf;
+		} else if (cfi_buswidth_is_2()) {
+			datum =3D *(__u16*)buf;
+		} else if (cfi_buswidth_is_4()) {
+			datum =3D *(__u32*)buf;
+		} else {
+			return -EINVAL;
+		}
+		ret =3D do_write_oneword(map, &cfi->chips[chipnum],
+				       ofs, datum, cfi->fast_prog);
+		if (ret) {
+			if (cfi->fast_prog){
+				/* Get out of unlock bypass mode */
+				cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL)=
;
+				cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL)=
;
+			}
+			return ret;
+		}
+
+		ofs +=3D CFIDEV_BUSWIDTH;
+		buf +=3D CFIDEV_BUSWIDTH;
+		(*retlen) +=3D CFIDEV_BUSWIDTH;
+		len -=3D CFIDEV_BUSWIDTH;
+
+		if (ofs >> cfi->chipshift) {
+			if (cfi->fast_prog){
+				/* Get out of unlock bypass mode */
+				cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL)=
;
+				cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL)=
;
+			}
+
+			chipnum ++;=20
+			ofs =3D 0;
+			if (chipnum =3D=3D cfi->numchips)
+				return 0;
+			chipstart =3D cfi->chips[chipnum].start;
+			if (cfi->fast_prog){
+				/* Go into unlock bypass mode for next set of chips */
+				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEV=
ICETYPE_X8, NULL);
+				cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEV=
ICETYPE_X8, NULL);
+				cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEV=
ICETYPE_X8, NULL);
+			}
+		}
+	}
+
+	if (cfi->fast_prog){
+		/* Get out of unlock bypass mode */
+		cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL);
+	}
+
+	/* Write the trailing bytes if any */
+	if (len & (CFIDEV_BUSWIDTH-1)) {
+		int i =3D 0, n =3D 0;
+		u_char tmp_buf[8];
+		__u32 datum;
+
+		map->copy_from(map, tmp_buf, ofs + cfi->chips[chipnum].start, CFIDEV_BUS=
WIDTH);
+		while (len--)
+			tmp_buf[i++] =3D buf[n++];
+
+		if (cfi_buswidth_is_2()) {
+			datum =3D *(__u16*)tmp_buf;
+		} else if (cfi_buswidth_is_4()) {
+			datum =3D *(__u32*)tmp_buf;
+		} else {
+			return -EINVAL;  /* should never happen, but be safe */
+		}
+
+		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=20
+				ofs, datum, 0);
+		if (ret)=20
+			return ret;
+	=09
+		(*retlen) +=3D n;
+	}
+
+	return 0;
+}
+
+
+static inline int do_erase_oneblock(struct map_info *map, struct flchip *c=
hip, unsigned long adr)
+{
+	int ret =3D 0;
+	unsigned long timeo =3D jiffies + HZ;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	DECLARE_WAITQUEUE(wait, current);
+	__u32 ones =3D 0;
+
+ retry:
+	cfi_spin_lock(chip->mutex);
+
+	if (chip->state !=3D FL_READY){
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&chip->wq, &wait);
+               =20
+		cfi_spin_unlock(chip->mutex);
+
+		schedule();
+		remove_wait_queue(&chip->wq, &wait);
+#if 0
+		if(signal_pending(current))
+			return -EINTR;
+#endif
+		timeo =3D jiffies + HZ;
+
+		goto retry;
+	}=09
+
+	chip->state =3D FL_ERASING;
+
+	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n", __func__, adr );
+	adr +=3D chip->start;
+	ENABLE_VPP(map);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVI=
CETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVI=
CETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVI=
CETYPE_X8, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVI=
CETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVI=
CETYPE_X8, NULL);
+	cfi_write(map, CMD(0x30), adr);
+
+	switch( CFIDEV_BUSWIDTH ) {
+	case 1:
+		ones =3D (__u8)~0;
+		break;
+	case 2:
+		ones =3D (__u16)~0;
+		break;
+	case 4:
+		ones =3D (__u32)~0;
+		break;
+	}
+=09
+	ret =3D status_poll( map, chip, adr, ones, jiffies + (HZ*20) );
+
+	DISABLE_VPP(map);
+	chip->state =3D FL_READY;
+	wake_up(&chip->wq);
+	cfi_spin_unlock(chip->mutex);
+	return ret;
+}
+
+
+static int cfi_amdsmpl_erase_varsize(struct mtd_info *mtd, struct erase_in=
fo *instr)
+{
+	struct map_info *map =3D mtd->priv;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	unsigned long adr, len;
+	int chipnum, ret =3D 0;
+	int i, first;
+	struct mtd_erase_region_info *regions =3D mtd->eraseregions;
+
+	if (instr->addr > mtd->size)
+		return -EINVAL;
+
+	if ((instr->len + instr->addr) > mtd->size)
+		return -EINVAL;
+
+	/* Check that both start and end of the requested erase are
+	 * aligned with the erasesize at the appropriate addresses.
+	 */
+
+	i =3D 0;
+
+	/* Skip all erase regions which are ended before the start of=20
+	   the requested erase. Actually, to save on the calculations,
+	   we skip to the first erase region which starts after the
+	   start of the requested erase, and then go back one.
+	*/
+=09
+	while (i < mtd->numeraseregions && instr->addr >=3D regions[i].offset)
+	       i++;
+	i--;
+
+	/* OK, now i is pointing at the erase region in which this=20
+	   erase request starts. Check the start of the requested
+	   erase range is aligned with the erase size which is in
+	   effect here.
+	*/
+
+	if (instr->addr & (regions[i].erasesize-1))
+		return -EINVAL;
+
+	/* Remember the erase region we start on */
+	first =3D i;
+
+	/* Next, check that the end of the requested erase is aligned
+	 * with the erase region at that address.
+	 */
+
+	while (i<mtd->numeraseregions && (instr->addr + instr->len) >=3D regions[=
i].offset)
+		i++;
+
+	/* As before, drop back one to point at the region in which
+	   the address actually falls
+	*/
+	i--;
+=09
+	if ((instr->addr + instr->len) & (regions[i].erasesize-1))
+		return -EINVAL;
+=09
+	chipnum =3D instr->addr >> cfi->chipshift;
+	adr =3D instr->addr - (chipnum << cfi->chipshift);
+	len =3D instr->len;
+
+	i=3Dfirst;
+
+	while(len) {
+		ret =3D do_erase_oneblock(map, &cfi->chips[chipnum], adr);
+
+		if (ret)
+			return ret;
+
+		adr +=3D regions[i].erasesize;
+		len -=3D regions[i].erasesize;
+
+		if (adr % (1<< cfi->chipshift) =3D=3D ((regions[i].offset + (regions[i].=
erasesize * regions[i].numblocks)) %( 1<< cfi->chipshift)))
+			i++;
+
+		if (adr >> cfi->chipshift) {
+			adr =3D 0;
+			chipnum++;
+		=09
+			if (chipnum >=3D cfi->numchips)
+			break;
+		}
+	}
+
+	instr->state =3D MTD_ERASE_DONE;
+	if (instr->callback)
+		instr->callback(instr);
+=09
+	return 0;
+}
+
+
+static int cfi_amdsmpl_erase_onesize(struct mtd_info *mtd, struct erase_in=
fo *instr)
+{
+	struct map_info *map =3D mtd->priv;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	unsigned long adr, len;
+	int chipnum, ret =3D 0;
+
+	if (instr->addr & (mtd->erasesize - 1))
+		return -EINVAL;
+
+	if (instr->len & (mtd->erasesize -1))
+		return -EINVAL;
+
+	if ((instr->len + instr->addr) > mtd->size)
+		return -EINVAL;
+
+	chipnum =3D instr->addr >> cfi->chipshift;
+	adr =3D instr->addr - (chipnum << cfi->chipshift);
+	len =3D instr->len;
+
+	while(len) {
+		ret =3D do_erase_oneblock(map, &cfi->chips[chipnum], adr);
+
+		if (ret)
+			return ret;
+
+		adr +=3D mtd->erasesize;
+		len -=3D mtd->erasesize;
+
+		if (adr >> cfi->chipshift) {
+			adr =3D 0;
+			chipnum++;
+		=09
+			if (chipnum >=3D cfi->numchips)
+			break;
+		}
+	}
+	=09
+	instr->state =3D MTD_ERASE_DONE;
+	if (instr->callback)
+		instr->callback(instr);
+=09
+	return 0;
+}
+
+
+static void cfi_amdsmpl_sync (struct mtd_info *mtd)
+{
+	struct map_info *map =3D mtd->priv;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	int i;
+	struct flchip *chip;
+	int ret =3D 0;
+	DECLARE_WAITQUEUE(wait, current);
+
+	for (i=3D0; !ret && i<cfi->numchips; i++) {
+		chip =3D &cfi->chips[i];
+
+	retry:
+		cfi_spin_lock(chip->mutex);
+
+		switch(chip->state) {
+		case FL_READY:
+		case FL_STATUS:
+		case FL_CFI_QUERY:
+		case FL_JEDEC_QUERY:
+			chip->oldstate =3D chip->state;
+			chip->state =3D FL_SYNCING;
+			/* No need to wake_up() on this state change -=20
+			 * as the whole point is that nobody can do anything
+			 * with the chip now anyway.
+			 */
+		case FL_SYNCING:
+			cfi_spin_unlock(chip->mutex);
+			break;
+
+		default:
+			/* Not an idle state */
+			add_wait_queue(&chip->wq, &wait);
+		=09
+			cfi_spin_unlock(chip->mutex);
+
+			schedule();
+
+		        remove_wait_queue(&chip->wq, &wait);
+		=09
+			goto retry;
+		}
+	}
+
+	/* Unlock the chips again */
+
+	for (i--; i >=3D0; i--) {
+		chip =3D &cfi->chips[i];
+
+		cfi_spin_lock(chip->mutex);
+	=09
+		if (chip->state =3D=3D FL_SYNCING) {
+			chip->state =3D chip->oldstate;
+			wake_up(&chip->wq);
+		}
+		cfi_spin_unlock(chip->mutex);
+	}
+}
+
+
+static void cfi_amdsmpl_destroy(struct mtd_info *mtd)
+{
+	struct map_info *map =3D mtd->priv;
+	struct cfi_private *cfi =3D map->fldrv_priv;
+	kfree(cfi->cmdset_priv);
+	kfree(cfi->cfiq);
+	kfree(cfi);
+	kfree(mtd->eraseregions);
+}
+
+static char im_name[]=3D"cfi_cmdset_0005";
+
+int __init cfi_amdsmpl_init(void)
+{
+	inter_module_register(im_name, THIS_MODULE, &cfi_cmdset_0005);
+	return 0;
+}
+
+static void __exit cfi_amdsmpl_exit(void)
+{
+	inter_module_unregister(im_name);
+}
+
+module_init(cfi_amdsmpl_init);
+module_exit(cfi_amdsmpl_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Linux Networx - based on cfi_cmdset_0002.c by Crossnet Co. =
et al.");
+MODULE_DESCRIPTION("MTD chip driver for AMD/Fujitsu simplified flash chips=
");
+
diff -uNr mtd/drivers/mtd/chips/Config.in mtd-amd_simplified/drivers/mtd/ch=
ips/Config.in
--- mtd/drivers/mtd/chips/Config.in	2002-09-03 07:30:43.000000000 -0600
+++ mtd-amd_simplified/drivers/mtd/chips/Config.in	2003-03-18 16:51:05.0000=
00000 -0700
@@ -44,6 +44,7 @@
 fi
 dep_tristate '  Support for Intel/Sharp flash chips' CONFIG_MTD_CFI_INTELE=
XT $CONFIG_MTD_GEN_PROBE
 dep_tristate '  Support for AMD/Fujitsu flash chips' CONFIG_MTD_CFI_AMDSTD=
 $CONFIG_MTD_GEN_PROBE
+dep_tristate '  Support for AMD Simplified flash chips' CONFIG_MTD_AMDSIMP=
LIFIED $CONFIG_MTD_GEN_PROBE
 dep_tristate '  Support for ST (Advanced Architecture) flash chips' CONFIG=
_MTD_CFI_STAA $CONFIG_MTD_GEN_PROBE
=20
 dep_tristate '  Support for RAM chips in bus mapping' CONFIG_MTD_RAM $CONF=
IG_MTD
diff -uNr mtd/drivers/mtd/chips/gen_probe.c mtd-amd_simplified/drivers/mtd/=
chips/gen_probe.c
--- mtd/drivers/mtd/chips/gen_probe.c	2003-01-31 06:35:07.000000000 -0700
+++ mtd-amd_simplified/drivers/mtd/chips/gen_probe.c	2003-03-18 16:51:05.00=
0000000 -0700
@@ -331,6 +331,10 @@
 	case 0x0002:
 		return cfi_cmdset_0002(map, primary);
 #endif
+#ifdef CONFIG_MTD_CFI_AMDSMPLFD
+	case P_ID_AMD_SIMPLIFIED:
+		return cfi_cmdset_0005(map, primary);
+#endif
 #ifdef CONFIG_MTD_CFI_STAA
         case 0x0020:
 		return cfi_cmdset_0020(map, primary);
diff -uNr mtd/drivers/mtd/chips/jedec_probe.c mtd-amd_simplified/drivers/mt=
d/chips/jedec_probe.c
--- mtd/drivers/mtd/chips/jedec_probe.c	2003-03-18 16:36:28.000000000 -0700
+++ mtd-amd_simplified/drivers/mtd/chips/jedec_probe.c	2003-03-18 16:51:05.=
000000000 -0700
@@ -746,7 +746,7 @@
 		name: "Atmel AT49BV512",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_64KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x10000,1)
 		}
@@ -756,7 +756,7 @@
 		name: "Atmel AT29LV512",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_64KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {
 			ERASEINFO(0x80,256),
@@ -934,7 +934,7 @@
 		name: "SST 39LF512",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_64KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,16),
 		}
@@ -944,7 +944,7 @@
 		name: "SST 39LF010",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_128KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,32),
 		}
@@ -954,7 +954,7 @@
 		name: "SST 39LF020",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_256KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,64),
 		}
@@ -964,7 +964,7 @@
 		name: "SST 39LF040",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_512KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,128),
 		}
@@ -974,7 +974,7 @@
 		name: "SST 39SF010A",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_128KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,32),
 		}
@@ -984,7 +984,7 @@
 		name: "SST 39SF020A",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_256KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,64),
 		}
@@ -994,7 +994,7 @@
 		name: "SST 49LF030A",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_512KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,96),
 		}
@@ -1004,7 +1004,7 @@
 		name: "SST 49LF040A",
 		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_512KiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,128),
 		}
@@ -1014,7 +1014,7 @@
 		name: "SST 49LF080A",
  		uaddr: MTD_UADDR_0x5555_0x2AAA,
 		DevSize: SIZE_1MiB,
-		CmdSet: P_ID_AMD_STD,
+		CmdSet: P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions: {ERASEINFO(0x01000,256),
 		}
@@ -1024,7 +1024,7 @@
 		name:            "PMC_Pm49FL002",
  		uaddr:           MTD_UADDR_0x5555_0x2AAA,
 		DevSize:         SIZE_256KiB,
-		CmdSet:          P_ID_AMD_STD,
+		CmdSet:          P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions:         {
 			ERASEINFO( 0x01000, 64 )
@@ -1035,7 +1035,7 @@
 		name:            "PMC_Pm49FL004",
  		uaddr:           MTD_UADDR_0x5555_0x2AAA,
 		DevSize:         SIZE_512KiB,
-		CmdSet:          P_ID_AMD_STD,
+		CmdSet:          P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions:         {
 			ERASEINFO( 0x01000, 128 )
@@ -1046,7 +1046,7 @@
 		name:            "PMC_Pm49FL008",
  		uaddr:           MTD_UADDR_0x5555_0x2AAA,
 		DevSize:         SIZE_1MiB,
-		CmdSet:          P_ID_AMD_STD,
+		CmdSet:          P_ID_AMD_SIMPLIFIED,
 		NumEraseRegions: 1,
 		regions:         {
 			ERASEINFO( 0x01000, 256 )
diff -uNr mtd/drivers/mtd/chips/Makefile mtd-amd_simplified/drivers/mtd/chi=
ps/Makefile
--- mtd/drivers/mtd/chips/Makefile	2003-02-13 14:07:31.000000000 -0700
+++ mtd-amd_simplified/drivers/mtd/chips/Makefile	2003-03-18 16:51:05.00000=
0000 -0700
@@ -22,6 +22,7 @@
 obj-$(CONFIG_MTD_AMDSTD)	+=3D amd_flash.o=20
 obj-$(CONFIG_MTD_CFI)		+=3D cfi_probe.o
 obj-$(CONFIG_MTD_CFI_STAA)	+=3D cfi_cmdset_0020.o
+obj-$(CONFIG_MTD_AMDSIMPLIFIED)	+=3D cfi_cmdset_0005.o
 obj-$(CONFIG_MTD_CFI_AMDSTD)	+=3D cfi_cmdset_0002.o
 obj-$(CONFIG_MTD_CFI_INTELEXT)	+=3D cfi_cmdset_0001.o
 obj-$(CONFIG_MTD_GEN_PROBE)	+=3D gen_probe.o
diff -uNr mtd/patches/Configure.help mtd-amd_simplified/patches/Configure.h=
elp
--- mtd/patches/Configure.help	2002-11-26 17:24:38.000000000 -0700
+++ mtd-amd_simplified/patches/Configure.help	2003-03-18 16:49:13.000000000=
 -0700
@@ -295,6 +295,20 @@
=20
   It also works on AMD compatible chips that do conform to CFI.
=20
+AMD simplified compatible flash chip support (non-CFI)
+CONFIG_MTD_AMDSIMPLIFIED
+  This option enables support for flash chips using a subset of
+  AMD commands.  These devices provide toggle and complement status
+  polling bits but do not have support for other status bits and the
+  more sophisticated functions, such as erase suspend, that those
+  chips support.
+
+  This driver is also available as a module ( =3D code which can be
+  inserted in and removed from the running kernel whenever you want).
+  If you want to compile it as a module, say M here and read
+  <file:Documentation/modules.txt>. The module will be called
+  amd_flash.o
+
 Support for RAM chips in bus mapping
 CONFIG_MTD_RAM
   This option enables basic support for RAM chips accessed through=20

--=-YdlygX9g8mw3u7YELU6q--

--=-RZKiLm5gawTslA20lq2l
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+d7iPfsBPTKE6HMkRAkwTAJ4vev0OXxtA+UDKkQEcq5sTJegPXQCeMDXw
/yRF12JriuOF4pSLMwLjhpw=
=cYZW
-----END PGP SIGNATURE-----

--=-RZKiLm5gawTslA20lq2l--
