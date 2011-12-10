Received: from if02-mail-sr08-mia.mta.terra.com ([208.84.243.35])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RZCB3-00029d-H5
 for linux-mtd@lists.infradead.org; Sat, 10 Dec 2011 01:56:38 +0000
Message-ID: <C5C236F9A7674BD0BC588929B742935D@THOR>
From: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
To: "Guillaume LECERF" <glecerf@gmail.com>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
 <AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com><AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com><201010221950.57594.fabio.giovagnini@aurion-tech.com><DEF16A5C46894A5DB447E0F7C81A9D5F@THOR><F8730DE65A2E4EB3BC47D4C2DC317502@THOR>
 <CAJpamw5n+UYDauw5oDoMvpUycdtUJdRALT28sbg5iTciUzv9RA@mail.gmail.com>
In-Reply-To: <CAJpamw5n+UYDauw5oDoMvpUycdtUJdRALT28sbg5iTciUzv9RA@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Fri, 9 Dec 2011 23:56:16 -0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0B20_01CCB6CE.23C14A50"
Cc: yidong zhang <zhangyd6@gmail.com>, David.Woodhouse@intel.com,
 Wolfram Sang <w.sang@pengutronix.de>, yegorslists@googlemail.com,
 linux-mtd@lists.infradead.org, taliaferro62@gmail.com,
 Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0B20_01CCB6CE.23C14A50
Content-Type: text/plain;
	format=flowed;
	charset="UTF-8";
	reply-type=original
Content-Transfer-Encoding: 8bit

Hi Guillaume,

Thanks for the heads up.

The file from this e-mail isn't current, I'm attaching current with the 
patch you suggested, the original file from the kernel I'm backporting 
(2.6.39) and a diff of them

Please review


----- Original Message ----- 
From: "Guillaume LECERF" <glecerf@gmail.com>
To: "Flávio Silveira" <fggs@terra.com.br>
Cc: "yidong zhang" <zhangyd6@gmail.com>; <David.Woodhouse@intel.com>; 
"Wolfram Sang" <w.sang@pengutronix.de>; <yegorslists@googlemail.com>; 
<linux-mtd@lists.infradead.org>; <taliaferro62@gmail.com>; "Fabio 
Giovagnini" <fabio.giovagnini@aurion-tech.com>
Sent: Friday, December 09, 2011 10:54 PM
Subject: Re: [Help] SST39VF6401B Support


> Hi
>
> 2011/6/20 Flávio Silveira <fggs@terra.com.br>:
>> Hi,
>> I'm attaching some other files to see if it helps finding what's wrong.
>
> According to your cfi_cmdset_0002.c version, you need this patch
> allowing chips with no PRI (extp == null) to be correctly detected :
> http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commitdiff/564b84978df2bf83d334940f1a1190702579f79f
>
>
> -- 
> Guillaume LECERF
> OpenBricks developer - www.openbricks.org
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

------=_NextPart_000_0B20_01CCB6CE.23C14A50
Content-Type: application/octet-stream;
	name="cfi_cmdset_0002_my_kernel.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cfi_cmdset_0002_my_kernel.c"

/*=0A=
 * Common Flash Interface support:=0A=
 *   AMD & Fujitsu Standard Vendor Command Set (ID 0x0002)=0A=
 *=0A=
 * Copyright (C) 2000 Crossnet Co. <info@crossnet.co.jp>=0A=
 * Copyright (C) 2004 Arcom Control Systems Ltd <linux@arcom.com>=0A=
 * Copyright (C) 2005 MontaVista Software Inc. <source@mvista.com>=0A=
 *=0A=
 * 2_by_8 routines added by Simon Munton=0A=
 *=0A=
 * 4_by_16 work by Carolyn J. Smith=0A=
 *=0A=
 * XIP support hooks by Vitaly Wool (based on code for Intel flash=0A=
 * by Nicolas Pitre)=0A=
 *=0A=
 * Occasionally maintained by Thayne Harbaugh tharbaugh at lnxi dot com=0A=
 *=0A=
 * This code is GPL=0A=
 *=0A=
 * $Id: cfi_cmdset_0002.c,v 1.122 2005/11/07 11:14:22 gleixner Exp $=0A=
 *=0A=
 */=0A=
=0A=
#include <linux/module.h>=0A=
#include <linux/types.h>=0A=
#include <linux/kernel.h>=0A=
#include <linux/sched.h>=0A=
#include <linux/init.h>=0A=
#include <asm/io.h>=0A=
#include <asm/byteorder.h>=0A=
=0A=
#include <linux/errno.h>=0A=
#include <linux/slab.h>=0A=
#include <linux/delay.h>=0A=
#include <linux/interrupt.h>=0A=
#include <linux/mtd/compatmac.h>=0A=
#include <linux/mtd/map.h>=0A=
#include <linux/mtd/mtd.h>=0A=
#include <linux/mtd/cfi.h>=0A=
#include <linux/mtd/xip.h>=0A=
=0A=
#define AMD_BOOTLOC_BUG=0A=
#define FORCE_WORD_WRITE 0=0A=
=0A=
#define MAX_WORD_RETRIES 3=0A=
=0A=
#define SST49LF004B	        0x0060=0A=
#define SST49LF040B	        0x0050=0A=
#define SST49LF008A		0x005a=0A=
#define AT49BV6416		0x00d6=0A=
=0A=
static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, =
u_char *);=0A=
static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, =
size_t *, const u_char *);=0A=
static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, =
size_t *, const u_char *);=0A=
static int cfi_amdstd_erase_chip(struct mtd_info *, struct erase_info *);=0A=
static int cfi_amdstd_erase_varsize(struct mtd_info *, struct erase_info =
*);=0A=
static void cfi_amdstd_sync (struct mtd_info *);=0A=
static int cfi_amdstd_suspend (struct mtd_info *);=0A=
static void cfi_amdstd_resume (struct mtd_info *);=0A=
static int cfi_amdstd_secsi_read (struct mtd_info *, loff_t, size_t, =
size_t *, u_char *);=0A=
=0A=
static void cfi_amdstd_destroy(struct mtd_info *);=0A=
=0A=
struct mtd_info *cfi_cmdset_0002(struct map_info *, int);=0A=
static struct mtd_info *cfi_amdstd_setup (struct mtd_info *);=0A=
=0A=
static int get_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr, int mode);=0A=
static void put_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr);=0A=
#include "fwh_lock.h"=0A=
=0A=
static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, size_t len);=0A=
static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, size_t =
len);=0A=
=0A=
static struct mtd_chip_driver cfi_amdstd_chipdrv =3D {=0A=
	.probe		=3D NULL, /* Not usable directly */=0A=
	.destroy	=3D cfi_amdstd_destroy,=0A=
	.name		=3D "cfi_cmdset_0002",=0A=
	.module		=3D THIS_MODULE=0A=
};=0A=
=0A=
=0A=
/* #define DEBUG_CFI_FEATURES */=0A=
=0A=
=0A=
#ifdef DEBUG_CFI_FEATURES=0A=
static void cfi_tell_features(struct cfi_pri_amdstd *extp)=0A=
{=0A=
	const char* erase_suspend[3] =3D {=0A=
		"Not supported", "Read only", "Read/write"=0A=
	};=0A=
	const char* top_bottom[6] =3D {=0A=
		"No WP", "8x8KiB sectors at top & bottom, no WP",=0A=
		"Bottom boot", "Top boot",=0A=
		"Uniform, Bottom WP", "Uniform, Top WP"=0A=
	};=0A=
=0A=
	printk("  Silicon revision: %d\n", extp->SiliconRevision >> 1);=0A=
	printk("  Address sensitive unlock: %s\n",=0A=
	       (extp->SiliconRevision & 1) ? "Not required" : "Required");=0A=
=0A=
	if (extp->EraseSuspend < ARRAY_SIZE(erase_suspend))=0A=
		printk("  Erase Suspend: %s\n", erase_suspend[extp->EraseSuspend]);=0A=
	else=0A=
		printk("  Erase Suspend: Unknown value %d\n", extp->EraseSuspend);=0A=
=0A=
	if (extp->BlkProt =3D=3D 0)=0A=
		printk("  Block protection: Not supported\n");=0A=
	else=0A=
		printk("  Block protection: %d sectors per group\n", extp->BlkProt);=0A=
=0A=
=0A=
	printk("  Temporary block unprotect: %s\n",=0A=
	       extp->TmpBlkUnprotect ? "Supported" : "Not supported");=0A=
	printk("  Block protect/unprotect scheme: %d\n", extp->BlkProtUnprot);=0A=
	printk("  Number of simultaneous operations: %d\n", =
extp->SimultaneousOps);=0A=
	printk("  Burst mode: %s\n",=0A=
	       extp->BurstMode ? "Supported" : "Not supported");=0A=
	if (extp->PageMode =3D=3D 0)=0A=
		printk("  Page mode: Not supported\n");=0A=
	else=0A=
		printk("  Page mode: %d word page\n", extp->PageMode << 2);=0A=
=0A=
	printk("  Vpp Supply Minimum Program/Erase Voltage: %d.%d V\n",=0A=
	       extp->VppMin >> 4, extp->VppMin & 0xf);=0A=
	printk("  Vpp Supply Maximum Program/Erase Voltage: %d.%d V\n",=0A=
	       extp->VppMax >> 4, extp->VppMax & 0xf);=0A=
=0A=
	if (extp->TopBottom < ARRAY_SIZE(top_bottom))=0A=
		printk("  Top/Bottom Boot Block: %s\n", top_bottom[extp->TopBottom]);=0A=
	else=0A=
		printk("  Top/Bottom Boot Block: Unknown value %d\n", extp->TopBottom);=0A=
}=0A=
#endif=0A=
=0A=
#ifdef AMD_BOOTLOC_BUG=0A=
/* Wheee. Bring me the head of someone at AMD. */=0A=
static void fixup_amd_bootblock(struct mtd_info *mtd, void* param)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;=0A=
	__u8 major =3D extp->MajorVersion;=0A=
	__u8 minor =3D extp->MinorVersion;=0A=
=0A=
	if (((major << 8) | minor) < 0x3131) {=0A=
		/* CFI version 1.0 =3D> don't trust bootloc */=0A=
		if (cfi->id & 0x80) {=0A=
			printk(KERN_WARNING "%s: JEDEC Device ID is 0x%02X. Assuming broken =
CFI table.\n", map->name, cfi->id);=0A=
			extp->TopBottom =3D 3;	/* top boot */=0A=
		} else {=0A=
			extp->TopBottom =3D 2;	/* bottom boot */=0A=
		}=0A=
	}=0A=
}=0A=
#endif=0A=
=0A=
static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	if (cfi->cfiq->BufWriteTimeoutTyp) {=0A=
		DEBUG(MTD_DEBUG_LEVEL1, "Using buffer write method\n" );=0A=
		mtd->write =3D cfi_amdstd_write_buffers;=0A=
	}=0A=
}=0A=
=0A=
/* Atmel chips don't use the same PRI format as AMD chips */=0A=
static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;=0A=
	struct cfi_pri_atmel atmel_pri;=0A=
=0A=
	memcpy(&atmel_pri, extp, sizeof(atmel_pri));=0A=
	memset((char *)extp + 5, 0, sizeof(*extp) - 5);=0A=
=0A=
	if (atmel_pri.Features & 0x02)=0A=
		extp->EraseSuspend =3D 2;=0A=
=0A=
	if (atmel_pri.BottomBoot)=0A=
		extp->TopBottom =3D 2;=0A=
	else=0A=
		extp->TopBottom =3D 3;=0A=
}=0A=
=0A=
static void fixup_use_secsi(struct mtd_info *mtd, void *param)=0A=
{=0A=
	/* Setup for chips with a secsi area */=0A=
	mtd->read_user_prot_reg =3D cfi_amdstd_secsi_read;=0A=
	mtd->read_fact_prot_reg =3D cfi_amdstd_secsi_read;=0A=
}=0A=
=0A=
static void fixup_use_erase_chip(struct mtd_info *mtd, void *param)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	if ((cfi->cfiq->NumEraseRegions =3D=3D 1) &&=0A=
		((cfi->cfiq->EraseRegionInfo[0] & 0xffff) =3D=3D 0)) {=0A=
		mtd->erase =3D cfi_amdstd_erase_chip;=0A=
	}=0A=
=0A=
}=0A=
=0A=
/*=0A=
 * Some Atmel chips (e.g. the AT49BV6416) power-up with all sectors=0A=
 * locked by default.=0A=
 */=0A=
static void fixup_use_atmel_lock(struct mtd_info *mtd, void *param)=0A=
{=0A=
	mtd->lock =3D cfi_atmel_lock;=0A=
	mtd->unlock =3D cfi_atmel_unlock;=0A=
	mtd->flags |=3D MTD_STUPID_LOCK;=0A=
}=0A=
=0A=
static void fixup_old_sst_eraseregion(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	/*=0A=
	 * These flashes report two separate eraseblock regions based on the=0A=
	 * sector_erase-size and block_erase-size, although they both operate =
on the=0A=
	 * same memory. This is not allowed according to CFI, so we just pick =
the=0A=
	 * sector_erase-size.=0A=
	 */=0A=
	cfi->cfiq->NumEraseRegions =3D 1;=0A=
}=0A=
=0A=
static void fixup_sst39vf(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	fixup_old_sst_eraseregion(mtd);=0A=
=0A=
	cfi->addr_unlock1 =3D 0x5555;=0A=
	cfi->addr_unlock2 =3D 0x2AAA;=0A=
}=0A=
=0A=
static void fixup_sst39vf_rev_b(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	fixup_old_sst_eraseregion(mtd);=0A=
=0A=
	cfi->addr_unlock1 =3D 0x555;=0A=
	cfi->addr_unlock2 =3D 0x2AA;=0A=
=0A=
	cfi->sector_erase_cmd =3D CMD(0x50);=0A=
}=0A=
=0A=
static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	fixup_sst39vf_rev_b(mtd);=0A=
=0A=
	/*=0A=
	 * CFI reports 1024 sectors (0x03ff+1) of 64KBytes (0x0100*256) where=0A=
	 * it should report a size of 8KBytes (0x0020*256).=0A=
	 */=0A=
	cfi->cfiq->EraseRegionInfo[0] =3D 0x002003ff;=0A=
	printk(KERN_WARNING "%s: Bad 38VF640x CFI data; adjusting sector size =
from 64 to 8KiB\n", mtd->name);=0A=
}=0A=
=0A=
static void fixup_s29gl064n_sectors(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	if ((cfi->cfiq->EraseRegionInfo[0] & 0xffff) =3D=3D 0x003f) {=0A=
		cfi->cfiq->EraseRegionInfo[0] |=3D 0x0040;=0A=
		printk(KERN_WARNING "%s: Bad S29GL064N CFI data, adjust from 64 to 128 =
sectors\n", mtd->name);=0A=
	}=0A=
}=0A=
=0A=
static void fixup_s29gl032n_sectors(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	if ((cfi->cfiq->EraseRegionInfo[1] & 0xffff) =3D=3D 0x007e) {=0A=
		cfi->cfiq->EraseRegionInfo[1] &=3D ~0x0040;=0A=
		printk(KERN_WARNING "%s: Bad S29GL032N CFI data, adjust from 127 to 63 =
sectors\n", mtd->name);=0A=
	}=0A=
}=0A=
=0A=
/* Used to fix CFI-Tables of chips without Extended Query Tables */=0A=
static struct cfi_fixup cfi_nopri_fixup_table[] =3D {=0A=
	{ CFI_MFR_SST, 0x234a, fixup_sst39vf }, /* SST39VF1602 */=0A=
	{ CFI_MFR_SST, 0x234b, fixup_sst39vf }, /* SST39VF1601 */=0A=
	{ CFI_MFR_SST, 0x235a, fixup_sst39vf }, /* SST39VF3202 */=0A=
	{ CFI_MFR_SST, 0x235b, fixup_sst39vf }, /* SST39VF3201 */=0A=
	{ CFI_MFR_SST, 0x235c, fixup_sst39vf_rev_b }, /* SST39VF3202B */=0A=
	{ CFI_MFR_SST, 0x235d, fixup_sst39vf_rev_b }, /* SST39VF3201B */=0A=
	{ CFI_MFR_SST, 0x236c, fixup_sst39vf_rev_b }, /* SST39VF6402B */=0A=
	{ CFI_MFR_SST, 0x236d, fixup_sst39vf_rev_b }, /* SST39VF6401B */=0A=
	{ 0, 0, NULL }=0A=
};=0A=
=0A=
static struct cfi_fixup cfi_fixup_table[] =3D {=0A=
#ifdef AMD_BOOTLOC_BUG=0A=
	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },=0A=
#endif=0A=
	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },=0A=
	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },=0A=
	{ CFI_MFR_AMD, 0x0055, fixup_use_secsi, NULL, },=0A=
	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi, NULL, },=0A=
	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi, NULL, },=0A=
	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi, NULL, },=0A=
	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },=0A=
	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },=0A=
	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },=0A=
	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },=0A=
	{ CFI_MFR_SST, 0x536a, fixup_sst38vf640x_sectorsize }, /* SST38VF6402 */=0A=
	{ CFI_MFR_SST, 0x536b, fixup_sst38vf640x_sectorsize }, /* SST38VF6401 */=0A=
	{ CFI_MFR_SST, 0x536c, fixup_sst38vf640x_sectorsize }, /* SST38VF6404 */=0A=
	{ CFI_MFR_SST, 0x536d, fixup_sst38vf640x_sectorsize }, /* SST38VF6403 */=0A=
#if !FORCE_WORD_WRITE=0A=
	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },=0A=
#endif=0A=
	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },=0A=
	{ 0, 0, NULL, NULL }=0A=
};=0A=
static struct cfi_fixup jedec_fixup_table[] =3D {=0A=
	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },=0A=
	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock, NULL, },=0A=
	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },=0A=
	{ 0, 0, NULL, NULL }=0A=
};=0A=
=0A=
static struct cfi_fixup fixup_table[] =3D {=0A=
	/* The CFI vendor ids and the JEDEC vendor IDs appear=0A=
	 * to be common.  It is like the devices id's are as=0A=
	 * well.  This table is to pick all cases where=0A=
	 * we know that is the case.=0A=
	 */=0A=
	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip, NULL },=0A=
	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock, NULL },=0A=
	{ 0, 0, NULL, NULL }=0A=
};=0A=
=0A=
static void cfi_fixup_major_minor(struct cfi_private *cfi,=0A=
				  struct cfi_pri_amdstd *extp)=0A=
{=0A=
	if (cfi->mfr =3D=3D CFI_MFR_SAMSUNG) {=0A=
		if ((extp->MajorVersion =3D=3D '0' && extp->MinorVersion =3D=3D '0') ||=0A=
		    (extp->MajorVersion =3D=3D '3' && extp->MinorVersion =3D=3D '3')) {=0A=
			/*=0A=
			 * Samsung K8P2815UQB and K8D6x16UxM chips=0A=
			 * report major=3D0 / minor=3D0.=0A=
			 * K8D3x16UxC chips report major=3D3 / minor=3D3.=0A=
			 */=0A=
			printk(KERN_NOTICE "  Fixing Samsung's Amd/Fujitsu"=0A=
			       " Extended Query version to 1.%c\n",=0A=
			       extp->MinorVersion);=0A=
			extp->MajorVersion =3D '1';=0A=
		}=0A=
	}=0A=
=0A=
	/*=0A=
	 * SST 38VF640x chips report major=3D0xFF / minor=3D0xFF.=0A=
	 */=0A=
	if (cfi->mfr =3D=3D CFI_MFR_SST && (cfi->id >> 4) =3D=3D 0x0536) {=0A=
		extp->MajorVersion =3D '1';=0A=
		extp->MinorVersion =3D '0';=0A=
	}=0A=
}=0A=
=0A=
struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	struct mtd_info *mtd;=0A=
	int i;=0A=
=0A=
	mtd =3D kzalloc(sizeof(*mtd), GFP_KERNEL);=0A=
	if (!mtd) {=0A=
		printk(KERN_WARNING "Failed to allocate memory for MTD device\n");=0A=
		return NULL;=0A=
	}=0A=
	mtd->priv =3D map;=0A=
	mtd->type =3D MTD_NORFLASH;=0A=
=0A=
	/* Fill in the default mtd operations */=0A=
	mtd->erase   =3D cfi_amdstd_erase_varsize;=0A=
	mtd->write   =3D cfi_amdstd_write_words;=0A=
	mtd->read    =3D cfi_amdstd_read;=0A=
	mtd->sync    =3D cfi_amdstd_sync;=0A=
	mtd->suspend =3D cfi_amdstd_suspend;=0A=
	mtd->resume  =3D cfi_amdstd_resume;=0A=
	mtd->flags   =3D MTD_CAP_NORFLASH;=0A=
	mtd->name    =3D map->name;=0A=
	mtd->writesize =3D 1;=0A=
=0A=
	if (cfi->cfi_mode=3D=3DCFI_MODE_CFI){=0A=
		unsigned char bootloc;=0A=
		__u16 adr =3D primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;=0A=
		struct cfi_pri_amdstd *extp;=0A=
=0A=
		extp =3D (struct cfi_pri_amdstd*)cfi_read_pri(map, adr, sizeof(*extp), =
"Amd/Fujitsu");=0A=
		if (extp) {=0A=
			/*=0A=
			 * It's a real CFI chip, not one for which the probe=0A=
			 * routine faked a CFI structure.=0A=
			 */=0A=
			cfi_fixup_major_minor(cfi, extp);=0A=
=0A=
		if (extp->MajorVersion !=3D '1' ||=0A=
			    (extp->MajorVersion =3D=3D '1' && (extp->MinorVersion < '0' || =
extp->MinorVersion > '4'))) {=0A=
				printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "=0A=
				       "version %c.%c (%#02x/%#02x).\n",=0A=
				       extp->MajorVersion, extp->MinorVersion,=0A=
				       extp->MajorVersion, extp->MinorVersion);=0A=
				kfree(extp);=0A=
				kfree(mtd);=0A=
				return NULL;=0A=
			}=0A=
		}=0A=
=0A=
			/* Install our own private info structure */=0A=
			cfi->cmdset_priv =3D extp;=0A=
=0A=
			/* Apply cfi device specific fixups */=0A=
			cfi_fixup(mtd, cfi_fixup_table);=0A=
=0A=
#ifdef DEBUG_CFI_FEATURES=0A=
			/* Tell the user about it in lots of lovely detail */=0A=
			cfi_tell_features(extp);=0A=
#endif=0A=
=0A=
			bootloc =3D extp->TopBottom;=0A=
			if ((bootloc !=3D 2) && (bootloc !=3D 3)) {=0A=
				printk(KERN_WARNING "%s: CFI does not contain boot "=0A=
				"bank location. Assuming top.\n", map->name);=0A=
				bootloc =3D 2;=0A=
			}=0A=
=0A=
			if (bootloc =3D=3D 3 && cfi->cfiq->NumEraseRegions > 1) {=0A=
				printk(KERN_WARNING "%s: Swapping erase regions for broken CFI =
table.\n", map->name);=0A=
=0A=
				for (i=3D0; i<cfi->cfiq->NumEraseRegions / 2; i++) {=0A=
					int j =3D (cfi->cfiq->NumEraseRegions-1)-i;=0A=
					__u32 swap;=0A=
=0A=
					swap =3D cfi->cfiq->EraseRegionInfo[i];=0A=
					cfi->cfiq->EraseRegionInfo[i] =3D cfi->cfiq->EraseRegionInfo[j];=0A=
					cfi->cfiq->EraseRegionInfo[j] =3D swap;=0A=
				}=0A=
			}=0A=
			/* Set the default CFI lock/unlock addresses */=0A=
			cfi->addr_unlock1 =3D 0x555;=0A=
			cfi->addr_unlock2 =3D 0x2aa;=0A=
		}=0A=
		cfi_fixup(mtd, cfi_nopri_fixup_table);=0A=
=0A=
		if (!cfi->addr_unlock1 || !cfi->addr_unlock2) {=0A=
			kfree(mtd);=0A=
			return NULL;=0A=
		}=0A=
=0A=
	} /* CFI mode */=0A=
	else if (cfi->cfi_mode =3D=3D CFI_MODE_JEDEC) {=0A=
		/* Apply jedec specific fixups */=0A=
		cfi_fixup(mtd, jedec_fixup_table);=0A=
	}=0A=
	/* Apply generic fixups */=0A=
	cfi_fixup(mtd, fixup_table);=0A=
=0A=
	for (i=3D0; i< cfi->numchips; i++) {=0A=
		cfi->chips[i].word_write_time =3D 1<<cfi->cfiq->WordWriteTimeoutTyp;=0A=
		cfi->chips[i].buffer_write_time =3D 1<<cfi->cfiq->BufWriteTimeoutTyp;=0A=
		cfi->chips[i].erase_time =3D 1<<cfi->cfiq->BlockEraseTimeoutTyp;=0A=
		cfi->chips[i].ref_point_counter =3D 0;=0A=
		init_waitqueue_head(&(cfi->chips[i].wq));=0A=
	}=0A=
=0A=
	map->fldrv =3D &cfi_amdstd_chipdrv;=0A=
=0A=
	return cfi_amdstd_setup(mtd);=0A=
}=0A=
EXPORT_SYMBOL_GPL(cfi_cmdset_0002);=0A=
=0A=
static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long devsize =3D (1<<cfi->cfiq->DevSize) * cfi->interleave;=0A=
	unsigned long offset =3D 0;=0A=
	int i,j;=0A=
=0A=
	printk(KERN_NOTICE "number of %s chips: %d\n",=0A=
	       (cfi->cfi_mode =3D=3D CFI_MODE_CFI)?"CFI":"JEDEC",cfi->numchips);=0A=
	/* Select the correct geometry setup */=0A=
	mtd->size =3D devsize * cfi->numchips;=0A=
=0A=
	mtd->numeraseregions =3D cfi->cfiq->NumEraseRegions * cfi->numchips;=0A=
	mtd->eraseregions =3D kmalloc(sizeof(struct mtd_erase_region_info)=0A=
				    * mtd->numeraseregions, GFP_KERNEL);=0A=
	if (!mtd->eraseregions) {=0A=
		printk(KERN_WARNING "Failed to allocate memory for MTD erase region =
info\n");=0A=
		goto setup_err;=0A=
	}=0A=
=0A=
	for (i=3D0; i<cfi->cfiq->NumEraseRegions; i++) {=0A=
		unsigned long ernum, ersize;=0A=
		ersize =3D ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * =
cfi->interleave;=0A=
		ernum =3D (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;=0A=
=0A=
		if (mtd->erasesize < ersize) {=0A=
			mtd->erasesize =3D ersize;=0A=
		}=0A=
		for (j=3D0; j<cfi->numchips; j++) {=0A=
			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].offset =3D =
(j*devsize)+offset;=0A=
			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize =3D =
ersize;=0A=
			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks =3D =
ernum;=0A=
		}=0A=
		offset +=3D (ersize * ernum);=0A=
	}=0A=
	if (offset !=3D devsize) {=0A=
		/* Argh */=0A=
		printk(KERN_WARNING "Sum of regions (%lx) !=3D total size of set of =
interleaved chips (%lx)\n", offset, devsize);=0A=
		goto setup_err;=0A=
	}=0A=
#if 0=0A=
	// debug=0A=
	for (i=3D0; i<mtd->numeraseregions;i++){=0A=
		printk("%d: offset=3D0x%x,size=3D0x%x,blocks=3D%d\n",=0A=
		       i,mtd->eraseregions[i].offset,=0A=
		       mtd->eraseregions[i].erasesize,=0A=
		       mtd->eraseregions[i].numblocks);=0A=
	}=0A=
#endif=0A=
=0A=
	/* FIXME: erase-suspend-program is broken.  See=0A=
	   =
http://lists.infradead.org/pipermail/linux-mtd/2003-December/009001.html =
*/=0A=
	printk(KERN_NOTICE "cfi_cmdset_0002: Disabling erase-suspend-program =
due to code brokenness.\n");=0A=
=0A=
	__module_get(THIS_MODULE);=0A=
	return mtd;=0A=
=0A=
 setup_err:=0A=
	if(mtd) {=0A=
		kfree(mtd->eraseregions);=0A=
		kfree(mtd);=0A=
	}=0A=
	kfree(cfi->cmdset_priv);=0A=
	kfree(cfi->cfiq);=0A=
	return NULL;=0A=
}=0A=
=0A=
/*=0A=
 * Return true if the chip is ready.=0A=
 *=0A=
 * Ready is one of: read mode, query mode, erase-suspend-read mode (in =
any=0A=
 * non-suspended sector) and is indicated by no toggle bits toggling.=0A=
 *=0A=
 * Note that anything more complicated than checking if no bits are =
toggling=0A=
 * (including checking DQ5 for an error status) is tricky to get working=0A=
 * correctly and is therefore not done	(particulary with interleaved =
chips=0A=
 * as each chip must be checked independantly of the others).=0A=
 */=0A=
static int __xipram chip_ready(struct map_info *map, unsigned long addr)=0A=
{=0A=
	map_word d, t;=0A=
=0A=
	d =3D map_read(map, addr);=0A=
	t =3D map_read(map, addr);=0A=
=0A=
	return map_word_equal(map, d, t);=0A=
}=0A=
=0A=
/*=0A=
 * Return true if the chip is ready and has the correct value.=0A=
 *=0A=
 * Ready is one of: read mode, query mode, erase-suspend-read mode (in =
any=0A=
 * non-suspended sector) and it is indicated by no bits toggling.=0A=
 *=0A=
 * Error are indicated by toggling bits or bits held with the wrong =
value,=0A=
 * or with bits toggling.=0A=
 *=0A=
 * Note that anything more complicated than checking if no bits are =
toggling=0A=
 * (including checking DQ5 for an error status) is tricky to get working=0A=
 * correctly and is therefore not done	(particulary with interleaved =
chips=0A=
 * as each chip must be checked independantly of the others).=0A=
 *=0A=
 */=0A=
static int __xipram chip_good(struct map_info *map, unsigned long addr, =
map_word expected)=0A=
{=0A=
	map_word oldd, curd;=0A=
=0A=
	oldd =3D map_read(map, addr);=0A=
	curd =3D map_read(map, addr);=0A=
=0A=
	return	map_word_equal(map, oldd, curd) &&=0A=
		map_word_equal(map, curd, expected);=0A=
}=0A=
=0A=
static int get_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr, int mode)=0A=
{=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo;=0A=
	struct cfi_pri_amdstd *cfip =3D (struct cfi_pri_amdstd =
*)cfi->cmdset_priv;=0A=
=0A=
 resettime:=0A=
	timeo =3D jiffies + HZ;=0A=
 retry:=0A=
	switch (chip->state) {=0A=
=0A=
	case FL_STATUS:=0A=
		for (;;) {=0A=
			if (chip_ready(map, adr))=0A=
				break;=0A=
=0A=
			if (time_after(jiffies, timeo)) {=0A=
				printk(KERN_ERR "Waiting for chip to be ready timed out.\n");=0A=
				spin_unlock(chip->mutex);=0A=
				return -EIO;=0A=
			}=0A=
			spin_unlock(chip->mutex);=0A=
			cfi_udelay(1);=0A=
			spin_lock(chip->mutex);=0A=
			/* Someone else might have been playing with it. */=0A=
			goto retry;=0A=
		}=0A=
=0A=
	case FL_READY:=0A=
	case FL_CFI_QUERY:=0A=
	case FL_JEDEC_QUERY:=0A=
		return 0;=0A=
=0A=
	case FL_ERASING:=0A=
		if (mode =3D=3D FL_WRITING) /* FIXME: Erase-suspend-program appears =
broken. */=0A=
			goto sleep;=0A=
=0A=
		if (!(   mode =3D=3D FL_READY=0A=
		      || mode =3D=3D FL_POINT=0A=
		      || !cfip=0A=
		      || (mode =3D=3D FL_WRITING && (cfip->EraseSuspend & 0x2))=0A=
		      || (mode =3D=3D FL_WRITING && (cfip->EraseSuspend & 0x1)=0A=
		    )))=0A=
			goto sleep;=0A=
=0A=
		/* We could check to see if we're trying to access the sector=0A=
		 * that is currently being erased. However, no user will try=0A=
		 * anything like that so we just wait for the timeout. */=0A=
=0A=
		/* Erase suspend */=0A=
		/* It's harmless to issue the Erase-Suspend and Erase-Resume=0A=
		 * commands when the erase algorithm isn't in progress. */=0A=
		map_write(map, CMD(0xB0), chip->in_progress_block_addr);=0A=
		chip->oldstate =3D FL_ERASING;=0A=
		chip->state =3D FL_ERASE_SUSPENDING;=0A=
		chip->erase_suspended =3D 1;=0A=
		for (;;) {=0A=
			if (chip_ready(map, adr))=0A=
				break;=0A=
=0A=
			if (time_after(jiffies, timeo)) {=0A=
				/* Should have suspended the erase by now.=0A=
				 * Send an Erase-Resume command as either=0A=
				 * there was an error (so leave the erase=0A=
				 * routine to recover from it) or we trying to=0A=
				 * use the erase-in-progress sector. */=0A=
				map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);=0A=
				chip->state =3D FL_ERASING;=0A=
				chip->oldstate =3D FL_READY;=0A=
				printk(KERN_ERR "MTD %s(): chip not ready after erase suspend\n", =
__func__);=0A=
				return -EIO;=0A=
			}=0A=
=0A=
			spin_unlock(chip->mutex);=0A=
			cfi_udelay(1);=0A=
			spin_lock(chip->mutex);=0A=
			/* Nobody will touch it while it's in state FL_ERASE_SUSPENDING.=0A=
			   So we can just loop here. */=0A=
		}=0A=
		chip->state =3D FL_READY;=0A=
		return 0;=0A=
=0A=
	case FL_XIP_WHILE_ERASING:=0A=
		if (mode !=3D FL_READY && mode !=3D FL_POINT &&=0A=
		    (!cfip || !(cfip->EraseSuspend&2)))=0A=
			goto sleep;=0A=
		chip->oldstate =3D chip->state;=0A=
		chip->state =3D FL_READY;=0A=
		return 0;=0A=
=0A=
	case FL_POINT:=0A=
		/* Only if there's no operation suspended... */=0A=
		if (mode =3D=3D FL_READY && chip->oldstate =3D=3D FL_READY)=0A=
			return 0;=0A=
=0A=
	default:=0A=
	sleep:=0A=
		set_current_state(TASK_UNINTERRUPTIBLE);=0A=
		add_wait_queue(&chip->wq, &wait);=0A=
		spin_unlock(chip->mutex);=0A=
		schedule();=0A=
		remove_wait_queue(&chip->wq, &wait);=0A=
		spin_lock(chip->mutex);=0A=
		goto resettime;=0A=
	}=0A=
}=0A=
=0A=
=0A=
static void put_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	switch(chip->oldstate) {=0A=
	case FL_ERASING:=0A=
		chip->state =3D chip->oldstate;=0A=
		map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);=0A=
		chip->oldstate =3D FL_READY;=0A=
		chip->state =3D FL_ERASING;=0A=
		break;=0A=
=0A=
	case FL_XIP_WHILE_ERASING:=0A=
		chip->state =3D chip->oldstate;=0A=
		chip->oldstate =3D FL_READY;=0A=
		break;=0A=
=0A=
	case FL_READY:=0A=
	case FL_STATUS:=0A=
		/* We should really make set_vpp() count, rather than doing this */=0A=
		DISABLE_VPP(map);=0A=
		break;=0A=
	default:=0A=
		printk(KERN_ERR "MTD: put_chip() called with oldstate %d!!\n", =
chip->oldstate);=0A=
	}=0A=
	wake_up(&chip->wq);=0A=
}=0A=
=0A=
#ifdef CONFIG_MTD_XIP=0A=
=0A=
/*=0A=
 * No interrupt what so ever can be serviced while the flash isn't in =
array=0A=
 * mode.  This is ensured by the xip_disable() and xip_enable() functions=0A=
 * enclosing any code path where the flash is known not to be in array =
mode.=0A=
 * And within a XIP disabled code path, only functions marked with =
__xipram=0A=
 * may be called and nothing else (it's a good thing to inspect generated=0A=
 * assembly to make sure inline functions were actually inlined and that =
gcc=0A=
 * didn't emit calls to its own support functions). Also configuring MTD =
CFI=0A=
 * support to a single buswidth and a single interleave is also =
recommended.=0A=
 */=0A=
=0A=
static void xip_disable(struct map_info *map, struct flchip *chip,=0A=
			unsigned long adr)=0A=
{=0A=
	/* TODO: chips with no XIP use should ignore and return */=0A=
	(void) map_read(map, adr); /* ensure mmu mapping is up to date */=0A=
	local_irq_disable();=0A=
}=0A=
=0A=
static void __xipram xip_enable(struct map_info *map, struct flchip =
*chip,=0A=
				unsigned long adr)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	if (chip->state !=3D FL_POINT && chip->state !=3D FL_READY) {=0A=
		map_write(map, CMD(0xf0), adr);=0A=
		chip->state =3D FL_READY;=0A=
	}=0A=
	(void) map_read(map, adr);=0A=
	xip_iprefetch();=0A=
	local_irq_enable();=0A=
}=0A=
=0A=
/*=0A=
 * When a delay is required for the flash operation to complete, the=0A=
 * xip_udelay() function is polling for both the given timeout and =
pending=0A=
 * (but still masked) hardware interrupts.  Whenever there is an =
interrupt=0A=
 * pending then the flash erase operation is suspended, array mode =
restored=0A=
 * and interrupts unmasked.  Task scheduling might also happen at that=0A=
 * point.  The CPU eventually returns from the interrupt or the call to=0A=
 * schedule() and the suspended flash operation is resumed for the =
remaining=0A=
 * of the delay period.=0A=
 *=0A=
 * Warning: this function _will_ fool interrupt latency tracing tools.=0A=
 */=0A=
=0A=
static void __xipram xip_udelay(struct map_info *map, struct flchip =
*chip,=0A=
				unsigned long adr, int usec)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;=0A=
	map_word status, OK =3D CMD(0x80);=0A=
	unsigned long suspended, start =3D xip_currtime();=0A=
	flstate_t oldstate;=0A=
=0A=
	do {=0A=
		cpu_relax();=0A=
		if (xip_irqpending() && extp &&=0A=
		    ((chip->state =3D=3D FL_ERASING && (extp->EraseSuspend & 2))) &&=0A=
		    (cfi_interleave_is_1(cfi) || chip->oldstate =3D=3D FL_READY)) {=0A=
			/*=0A=
			 * Let's suspend the erase operation when supported.=0A=
			 * Note that we currently don't try to suspend=0A=
			 * interleaved chips if there is already another=0A=
			 * operation suspended (imagine what happens=0A=
			 * when one chip was already done with the current=0A=
			 * operation while another chip suspended it, then=0A=
			 * we resume the whole thing at once).  Yes, it=0A=
			 * can happen!=0A=
			 */=0A=
			map_write(map, CMD(0xb0), adr);=0A=
			usec -=3D xip_elapsed_since(start);=0A=
			suspended =3D xip_currtime();=0A=
			do {=0A=
				if (xip_elapsed_since(suspended) > 100000) {=0A=
					/*=0A=
					 * The chip doesn't want to suspend=0A=
					 * after waiting for 100 msecs.=0A=
					 * This is a critical error but there=0A=
					 * is not much we can do here.=0A=
					 */=0A=
					return;=0A=
				}=0A=
				status =3D map_read(map, adr);=0A=
			} while (!map_word_andequal(map, status, OK, OK));=0A=
=0A=
			/* Suspend succeeded */=0A=
			oldstate =3D chip->state;=0A=
			if (!map_word_bitsset(map, status, CMD(0x40)))=0A=
				break;=0A=
			chip->state =3D FL_XIP_WHILE_ERASING;=0A=
			chip->erase_suspended =3D 1;=0A=
			map_write(map, CMD(0xf0), adr);=0A=
			(void) map_read(map, adr);=0A=
			asm volatile (".rep 8; nop; .endr");=0A=
			local_irq_enable();=0A=
			spin_unlock(chip->mutex);=0A=
			asm volatile (".rep 8; nop; .endr");=0A=
			cond_resched();=0A=
=0A=
			/*=0A=
			 * We're back.  However someone else might have=0A=
			 * decided to go write to the chip if we are in=0A=
			 * a suspended erase state.  If so let's wait=0A=
			 * until it's done.=0A=
			 */=0A=
			spin_lock(chip->mutex);=0A=
			while (chip->state !=3D FL_XIP_WHILE_ERASING) {=0A=
				DECLARE_WAITQUEUE(wait, current);=0A=
				set_current_state(TASK_UNINTERRUPTIBLE);=0A=
				add_wait_queue(&chip->wq, &wait);=0A=
				spin_unlock(chip->mutex);=0A=
				schedule();=0A=
				remove_wait_queue(&chip->wq, &wait);=0A=
				spin_lock(chip->mutex);=0A=
			}=0A=
			/* Disallow XIP again */=0A=
			local_irq_disable();=0A=
=0A=
			/* Resume the write or erase operation */=0A=
			map_write(map, cfi->sector_erase_cmd, adr);=0A=
			chip->state =3D oldstate;=0A=
			start =3D xip_currtime();=0A=
		} else if (usec >=3D 1000000/HZ) {=0A=
			/*=0A=
			 * Try to save on CPU power when waiting delay=0A=
			 * is at least a system timer tick period.=0A=
			 * No need to be extremely accurate here.=0A=
			 */=0A=
			xip_cpu_idle();=0A=
		}=0A=
		status =3D map_read(map, adr);=0A=
	} while (!map_word_andequal(map, status, OK, OK)=0A=
		 && xip_elapsed_since(start) < usec);=0A=
}=0A=
=0A=
#define UDELAY(map, chip, adr, usec)  xip_udelay(map, chip, adr, usec)=0A=
=0A=
/*=0A=
 * The INVALIDATE_CACHED_RANGE() macro is normally used in parallel while=0A=
 * the flash is actively programming or erasing since we have to poll for=0A=
 * the operation to complete anyway.  We can't do that in a generic way =
with=0A=
 * a XIP setup so do it before the actual flash operation in this case=0A=
 * and stub it out from INVALIDATE_CACHE_UDELAY.=0A=
 */=0A=
#define XIP_INVAL_CACHED_RANGE(map, from, size)  \=0A=
	INVALIDATE_CACHED_RANGE(map, from, size)=0A=
=0A=
#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \=0A=
	UDELAY(map, chip, adr, usec)=0A=
=0A=
/*=0A=
 * Extra notes:=0A=
 *=0A=
 * Activating this XIP support changes the way the code works a bit.  For=0A=
 * example the code to suspend the current process when concurrent access=0A=
 * happens is never executed because xip_udelay() will always return =
with the=0A=
 * same chip state as it was entered with.  This is why there is no care =
for=0A=
 * the presence of add_wait_queue() or schedule() calls from within a =
couple=0A=
 * xip_disable()'d  areas of code, like in do_erase_oneblock for example.=0A=
 * The queueing and scheduling are always happening within xip_udelay().=0A=
 *=0A=
 * Similarly, get_chip() and put_chip() just happen to always be executed=0A=
 * with chip->state set to FL_READY (or FL_XIP_WHILE_*) where flash state=0A=
 * is in array mode, therefore never executing many cases therein and not=0A=
 * causing any problem with XIP.=0A=
 */=0A=
=0A=
#else=0A=
=0A=
#define xip_disable(map, chip, adr)=0A=
#define xip_enable(map, chip, adr)=0A=
#define XIP_INVAL_CACHED_RANGE(x...)=0A=
=0A=
#define UDELAY(map, chip, adr, usec)  \=0A=
do {  \=0A=
	spin_unlock(chip->mutex);  \=0A=
	cfi_udelay(usec);  \=0A=
	spin_lock(chip->mutex);  \=0A=
} while (0)=0A=
=0A=
#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \=0A=
do {  \=0A=
	spin_unlock(chip->mutex);  \=0A=
	INVALIDATE_CACHED_RANGE(map, adr, len);  \=0A=
	cfi_udelay(usec);  \=0A=
	spin_lock(chip->mutex);  \=0A=
} while (0)=0A=
=0A=
#endif=0A=
=0A=
static inline int do_read_onechip(struct map_info *map, struct flchip =
*chip, loff_t adr, size_t len, u_char *buf)=0A=
{=0A=
	unsigned long cmd_addr;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret;=0A=
=0A=
	adr +=3D chip->start;=0A=
=0A=
	/* Ensure cmd read/writes are aligned. */=0A=
	cmd_addr =3D adr & ~(map_bankwidth(map)-1);=0A=
=0A=
	spin_lock(chip->mutex);=0A=
	ret =3D get_chip(map, chip, cmd_addr, FL_READY);=0A=
	if (ret) {=0A=
		spin_unlock(chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	if (chip->state !=3D FL_POINT && chip->state !=3D FL_READY) {=0A=
		map_write(map, CMD(0xf0), cmd_addr);=0A=
		chip->state =3D FL_READY;=0A=
	}=0A=
=0A=
	map_copy_from(map, buf, adr, len);=0A=
=0A=
	put_chip(map, chip, cmd_addr);=0A=
=0A=
	spin_unlock(chip->mutex);=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t =
len, size_t *retlen, u_char *buf)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long ofs;=0A=
	int chipnum;=0A=
	int ret =3D 0;=0A=
=0A=
	/* ofs: offset within the first chip that the first read should start */=0A=
=0A=
	chipnum =3D (from >> cfi->chipshift);=0A=
	ofs =3D from - (chipnum <<  cfi->chipshift);=0A=
=0A=
=0A=
	*retlen =3D 0;=0A=
=0A=
	while (len) {=0A=
		unsigned long thislen;=0A=
=0A=
		if (chipnum >=3D cfi->numchips)=0A=
			break;=0A=
=0A=
		if ((len + ofs -1) >> cfi->chipshift)=0A=
			thislen =3D (1<<cfi->chipshift) - ofs;=0A=
		else=0A=
			thislen =3D len;=0A=
=0A=
		ret =3D do_read_onechip(map, &cfi->chips[chipnum], ofs, thislen, buf);=0A=
		if (ret)=0A=
			break;=0A=
=0A=
		*retlen +=3D thislen;=0A=
		len -=3D thislen;=0A=
		buf +=3D thislen;=0A=
=0A=
		ofs =3D 0;=0A=
		chipnum++;=0A=
	}=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static inline int do_read_secsi_onechip(struct map_info *map, struct =
flchip *chip, loff_t adr, size_t len, u_char *buf)=0A=
{=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
 retry:=0A=
	spin_lock(chip->mutex);=0A=
=0A=
	if (chip->state !=3D FL_READY){=0A=
#if 0=0A=
		printk(KERN_DEBUG "Waiting for chip to read, status =3D %d\n", =
chip->state);=0A=
#endif=0A=
		set_current_state(TASK_UNINTERRUPTIBLE);=0A=
		add_wait_queue(&chip->wq, &wait);=0A=
=0A=
		spin_unlock(chip->mutex);=0A=
=0A=
		schedule();=0A=
		remove_wait_queue(&chip->wq, &wait);=0A=
#if 0=0A=
		if(signal_pending(current))=0A=
			return -EINTR;=0A=
#endif=0A=
		timeo =3D jiffies + HZ;=0A=
=0A=
		goto retry;=0A=
	}=0A=
=0A=
	adr +=3D chip->start;=0A=
=0A=
	chip->state =3D FL_READY;=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
=0A=
	map_copy_from(map, buf, adr, len);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
=0A=
	wake_up(&chip->wq);=0A=
	spin_unlock(chip->mutex);=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, =
size_t len, size_t *retlen, u_char *buf)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long ofs;=0A=
	int chipnum;=0A=
	int ret =3D 0;=0A=
=0A=
=0A=
	/* ofs: offset within the first chip that the first read should start */=0A=
=0A=
	/* 8 secsi bytes per chip */=0A=
	chipnum=3Dfrom>>3;=0A=
	ofs=3Dfrom & 7;=0A=
=0A=
=0A=
	*retlen =3D 0;=0A=
=0A=
	while (len) {=0A=
		unsigned long thislen;=0A=
=0A=
		if (chipnum >=3D cfi->numchips)=0A=
			break;=0A=
=0A=
		if ((len + ofs -1) >> 3)=0A=
			thislen =3D (1<<3) - ofs;=0A=
		else=0A=
			thislen =3D len;=0A=
=0A=
		ret =3D do_read_secsi_onechip(map, &cfi->chips[chipnum], ofs, thislen, =
buf);=0A=
		if (ret)=0A=
			break;=0A=
=0A=
		*retlen +=3D thislen;=0A=
		len -=3D thislen;=0A=
		buf +=3D thislen;=0A=
=0A=
		ofs =3D 0;=0A=
		chipnum++;=0A=
	}=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int __xipram do_write_oneword(struct map_info *map, struct flchip =
*chip, unsigned long adr, map_word datum)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	/*=0A=
	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices=0A=
	 * have a max write time of a few hundreds usec). However, we should=0A=
	 * use the maximum timeout value given by the chip at probe time=0A=
	 * instead.  Unfortunately, struct flchip does have a field for=0A=
	 * maximum timeout, only for typical which can be far too short=0A=
	 * depending of the conditions.	 The ' + 1' is to avoid having a=0A=
	 * timeout of 0 jiffies if HZ is smaller than 1000.=0A=
	 */=0A=
	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;=0A=
	int ret =3D 0;=0A=
	map_word oldd;=0A=
	int retry_cnt =3D 0;=0A=
=0A=
	adr +=3D chip->start;=0A=
=0A=
	spin_lock(chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr, FL_WRITING);=0A=
	if (ret) {=0A=
		spin_unlock(chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",=0A=
	       __func__, adr, datum.x[0] );=0A=
=0A=
	/*=0A=
	 * Check for a NOP for the case when the datum to write is already=0A=
	 * present - it saves time and works around buggy chips that corrupt=0A=
	 * data at other locations when 0xff is written to a location that=0A=
	 * already contains 0xff.=0A=
	 */=0A=
	oldd =3D map_read(map, adr);=0A=
	if (map_word_equal(map, oldd, datum)) {=0A=
		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): NOP\n",=0A=
		       __func__);=0A=
		goto op_done;=0A=
	}=0A=
=0A=
	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));=0A=
	ENABLE_VPP(map);=0A=
	xip_disable(map, chip, adr);=0A=
 retry:=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	map_write(map, datum, adr);=0A=
	chip->state =3D FL_WRITING;=0A=
=0A=
	INVALIDATE_CACHE_UDELAY(map, chip,=0A=
				adr, map_bankwidth(map),=0A=
				chip->word_write_time);=0A=
=0A=
	/* See comment above for timeout value. */=0A=
	timeo =3D jiffies + uWriteTimeout;=0A=
	for (;;) {=0A=
		if (chip->state !=3D FL_WRITING) {=0A=
			/* Someone's suspended the write. Sleep */=0A=
			DECLARE_WAITQUEUE(wait, current);=0A=
=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
			spin_unlock(chip->mutex);=0A=
			schedule();=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
			timeo =3D jiffies + (HZ / 2); /* FIXME */=0A=
			spin_lock(chip->mutex);=0A=
			continue;=0A=
		}=0A=
=0A=
		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){=0A=
			xip_enable(map, chip, adr);=0A=
			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);=0A=
			xip_disable(map, chip, adr);=0A=
			break;=0A=
		}=0A=
=0A=
		if (chip_ready(map, adr))=0A=
			break;=0A=
=0A=
		/* Latency issues. Drop the lock, wait a while and retry */=0A=
		UDELAY(map, chip, adr, 1);=0A=
	}=0A=
	/* Did we succeed? */=0A=
	if (!chip_good(map, adr, datum)) {=0A=
		/* reset on all failures. */=0A=
		map_write( map, CMD(0xF0), chip->start );=0A=
		/* FIXME - should have reset delay before continuing */=0A=
=0A=
		if (++retry_cnt <=3D MAX_WORD_RETRIES)=0A=
			goto retry;=0A=
=0A=
		ret =3D -EIO;=0A=
	}=0A=
	xip_enable(map, chip, adr);=0A=
 op_done:=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr);=0A=
	spin_unlock(chip->mutex);=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, =
size_t len,=0A=
				  size_t *retlen, const u_char *buf)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret =3D 0;=0A=
	int chipnum;=0A=
	unsigned long ofs, chipstart;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
=0A=
	*retlen =3D 0;=0A=
	if (!len)=0A=
		return 0;=0A=
=0A=
	chipnum =3D to >> cfi->chipshift;=0A=
	ofs =3D to  - (chipnum << cfi->chipshift);=0A=
	chipstart =3D cfi->chips[chipnum].start;=0A=
=0A=
	/* If it's not bus-aligned, do the first byte write */=0A=
	if (ofs & (map_bankwidth(map)-1)) {=0A=
		unsigned long bus_ofs =3D ofs & ~(map_bankwidth(map)-1);=0A=
		int i =3D ofs - bus_ofs;=0A=
		int n =3D 0;=0A=
		map_word tmp_buf;=0A=
=0A=
 retry:=0A=
		spin_lock(cfi->chips[chipnum].mutex);=0A=
=0A=
		if (cfi->chips[chipnum].state !=3D FL_READY) {=0A=
#if 0=0A=
			printk(KERN_DEBUG "Waiting for chip to write, status =3D %d\n", =
cfi->chips[chipnum].state);=0A=
#endif=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
=0A=
			spin_unlock(cfi->chips[chipnum].mutex);=0A=
=0A=
			schedule();=0A=
			remove_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
#if 0=0A=
			if(signal_pending(current))=0A=
				return -EINTR;=0A=
#endif=0A=
			goto retry;=0A=
		}=0A=
=0A=
		/* Load 'tmp_buf' with old contents of flash */=0A=
		tmp_buf =3D map_read(map, bus_ofs+chipstart);=0A=
=0A=
		spin_unlock(cfi->chips[chipnum].mutex);=0A=
=0A=
		/* Number of bytes to copy from buffer */=0A=
		n =3D min_t(int, len, map_bankwidth(map)-i);=0A=
=0A=
		tmp_buf =3D map_word_load_partial(map, tmp_buf, buf, i, n);=0A=
=0A=
		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=0A=
				       bus_ofs, tmp_buf);=0A=
		if (ret)=0A=
			return ret;=0A=
=0A=
		ofs +=3D n;=0A=
		buf +=3D n;=0A=
		(*retlen) +=3D n;=0A=
		len -=3D n;=0A=
=0A=
		if (ofs >> cfi->chipshift) {=0A=
			chipnum ++;=0A=
			ofs =3D 0;=0A=
			if (chipnum =3D=3D cfi->numchips)=0A=
				return 0;=0A=
		}=0A=
	}=0A=
=0A=
	/* We are now aligned, write as much as possible */=0A=
	while(len >=3D map_bankwidth(map)) {=0A=
		map_word datum;=0A=
=0A=
		datum =3D map_word_load(map, buf);=0A=
=0A=
		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=0A=
				       ofs, datum);=0A=
		if (ret)=0A=
			return ret;=0A=
=0A=
		ofs +=3D map_bankwidth(map);=0A=
		buf +=3D map_bankwidth(map);=0A=
		(*retlen) +=3D map_bankwidth(map);=0A=
		len -=3D map_bankwidth(map);=0A=
=0A=
		if (ofs >> cfi->chipshift) {=0A=
			chipnum ++;=0A=
			ofs =3D 0;=0A=
			if (chipnum =3D=3D cfi->numchips)=0A=
				return 0;=0A=
			chipstart =3D cfi->chips[chipnum].start;=0A=
		}=0A=
	}=0A=
=0A=
	/* Write the trailing bytes if any */=0A=
	if (len & (map_bankwidth(map)-1)) {=0A=
		map_word tmp_buf;=0A=
=0A=
 retry1:=0A=
		spin_lock(cfi->chips[chipnum].mutex);=0A=
=0A=
		if (cfi->chips[chipnum].state !=3D FL_READY) {=0A=
#if 0=0A=
			printk(KERN_DEBUG "Waiting for chip to write, status =3D %d\n", =
cfi->chips[chipnum].state);=0A=
#endif=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
=0A=
			spin_unlock(cfi->chips[chipnum].mutex);=0A=
=0A=
			schedule();=0A=
			remove_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
#if 0=0A=
			if(signal_pending(current))=0A=
				return -EINTR;=0A=
#endif=0A=
			goto retry1;=0A=
		}=0A=
=0A=
		tmp_buf =3D map_read(map, ofs + chipstart);=0A=
=0A=
		spin_unlock(cfi->chips[chipnum].mutex);=0A=
=0A=
		tmp_buf =3D map_word_load_partial(map, tmp_buf, buf, 0, len);=0A=
=0A=
		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=0A=
				ofs, tmp_buf);=0A=
		if (ret)=0A=
			return ret;=0A=
=0A=
		(*retlen) +=3D len;=0A=
	}=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
/*=0A=
 * FIXME: interleaved mode not tested, and probably not supported!=0A=
 */=0A=
static int __xipram do_write_buffer(struct map_info *map, struct flchip =
*chip,=0A=
				    unsigned long adr, const u_char *buf,=0A=
				    int len)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	/* see comments in do_write_oneword() regarding uWriteTimeo. */=0A=
	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;=0A=
	int ret =3D -EIO;=0A=
	unsigned long cmd_adr;=0A=
	int z, words;=0A=
	map_word datum;=0A=
=0A=
	adr +=3D chip->start;=0A=
	cmd_adr =3D adr;=0A=
=0A=
	spin_lock(chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr, FL_WRITING);=0A=
	if (ret) {=0A=
		spin_unlock(chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	datum =3D map_word_load(map, buf);=0A=
=0A=
	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",=0A=
	       __func__, adr, datum.x[0] );=0A=
=0A=
	XIP_INVAL_CACHED_RANGE(map, adr, len);=0A=
	ENABLE_VPP(map);=0A=
	xip_disable(map, chip, cmd_adr);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
=0A=
	/* Write Buffer Load */=0A=
	map_write(map, CMD(0x25), cmd_adr);=0A=
=0A=
	chip->state =3D FL_WRITING_TO_BUFFER;=0A=
=0A=
	/* Write length of data to come */=0A=
	words =3D len / map_bankwidth(map);=0A=
	map_write(map, CMD(words - 1), cmd_adr);=0A=
	/* Write data */=0A=
	z =3D 0;=0A=
	while(z < words * map_bankwidth(map)) {=0A=
		datum =3D map_word_load(map, buf);=0A=
		map_write(map, datum, adr + z);=0A=
=0A=
		z +=3D map_bankwidth(map);=0A=
		buf +=3D map_bankwidth(map);=0A=
	}=0A=
	z -=3D map_bankwidth(map);=0A=
=0A=
	adr +=3D z;=0A=
=0A=
	/* Write Buffer Program Confirm: GO GO GO */=0A=
	map_write(map, CMD(0x29), cmd_adr);=0A=
	chip->state =3D FL_WRITING;=0A=
=0A=
	INVALIDATE_CACHE_UDELAY(map, chip,=0A=
				adr, map_bankwidth(map),=0A=
				chip->word_write_time);=0A=
=0A=
	timeo =3D jiffies + uWriteTimeout;=0A=
=0A=
	for (;;) {=0A=
		if (chip->state !=3D FL_WRITING) {=0A=
			/* Someone's suspended the write. Sleep */=0A=
			DECLARE_WAITQUEUE(wait, current);=0A=
=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
			spin_unlock(chip->mutex);=0A=
			schedule();=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
			timeo =3D jiffies + (HZ / 2); /* FIXME */=0A=
			spin_lock(chip->mutex);=0A=
			continue;=0A=
		}=0A=
=0A=
		if (time_after(jiffies, timeo) && !chip_ready(map, adr))=0A=
			break;=0A=
=0A=
		if (chip_ready(map, adr)) {=0A=
			xip_enable(map, chip, adr);=0A=
			goto op_done;=0A=
		}=0A=
=0A=
		/* Latency issues. Drop the lock, wait a while and retry */=0A=
		UDELAY(map, chip, adr, 1);=0A=
	}=0A=
=0A=
	/* reset on all failures. */=0A=
	map_write( map, CMD(0xF0), chip->start );=0A=
	xip_enable(map, chip, adr);=0A=
	/* FIXME - should have reset delay before continuing */=0A=
=0A=
	printk(KERN_WARNING "MTD %s(): software timeout\n",=0A=
	       __func__ );=0A=
=0A=
	ret =3D -EIO;=0A=
 op_done:=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr);=0A=
	spin_unlock(chip->mutex);=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, =
size_t len,=0A=
				    size_t *retlen, const u_char *buf)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int wbufsize =3D cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;=0A=
	int ret =3D 0;=0A=
	int chipnum;=0A=
	unsigned long ofs;=0A=
=0A=
	*retlen =3D 0;=0A=
	if (!len)=0A=
		return 0;=0A=
=0A=
	chipnum =3D to >> cfi->chipshift;=0A=
	ofs =3D to  - (chipnum << cfi->chipshift);=0A=
=0A=
	/* If it's not bus-aligned, do the first word write */=0A=
	if (ofs & (map_bankwidth(map)-1)) {=0A=
		size_t local_len =3D (-ofs)&(map_bankwidth(map)-1);=0A=
		if (local_len > len)=0A=
			local_len =3D len;=0A=
		ret =3D cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),=0A=
					     local_len, retlen, buf);=0A=
		if (ret)=0A=
			return ret;=0A=
		ofs +=3D local_len;=0A=
		buf +=3D local_len;=0A=
		len -=3D local_len;=0A=
=0A=
		if (ofs >> cfi->chipshift) {=0A=
			chipnum ++;=0A=
			ofs =3D 0;=0A=
			if (chipnum =3D=3D cfi->numchips)=0A=
				return 0;=0A=
		}=0A=
	}=0A=
=0A=
	/* Write buffer is worth it only if more than one word to write... */=0A=
	while (len >=3D map_bankwidth(map) * 2) {=0A=
		/* We must not cross write block boundaries */=0A=
		int size =3D wbufsize - (ofs & (wbufsize-1));=0A=
=0A=
		if (size > len)=0A=
			size =3D len;=0A=
		if (size % map_bankwidth(map))=0A=
			size -=3D size % map_bankwidth(map);=0A=
=0A=
		ret =3D do_write_buffer(map, &cfi->chips[chipnum],=0A=
				      ofs, buf, size);=0A=
		if (ret)=0A=
			return ret;=0A=
=0A=
		ofs +=3D size;=0A=
		buf +=3D size;=0A=
		(*retlen) +=3D size;=0A=
		len -=3D size;=0A=
=0A=
		if (ofs >> cfi->chipshift) {=0A=
			chipnum ++;=0A=
			ofs =3D 0;=0A=
			if (chipnum =3D=3D cfi->numchips)=0A=
				return 0;=0A=
		}=0A=
	}=0A=
=0A=
	if (len) {=0A=
		size_t retlen_dregs =3D 0;=0A=
=0A=
		ret =3D cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),=0A=
					     len, &retlen_dregs, buf);=0A=
=0A=
		*retlen +=3D retlen_dregs;=0A=
		return ret;=0A=
	}=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
/*=0A=
 * Handle devices with one erase region, that only implement=0A=
 * the chip erase command.=0A=
 */=0A=
static int __xipram do_erase_chip(struct map_info *map, struct flchip =
*chip)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	unsigned long int adr;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	int ret =3D 0;=0A=
=0A=
	adr =3D cfi->addr_unlock1;=0A=
=0A=
	spin_lock(chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr, FL_WRITING);=0A=
	if (ret) {=0A=
		spin_unlock(chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",=0A=
	       __func__, chip->start );=0A=
=0A=
	XIP_INVAL_CACHED_RANGE(map, adr, map->size);=0A=
	ENABLE_VPP(map);=0A=
	xip_disable(map, chip, adr);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
=0A=
	chip->state =3D FL_ERASING;=0A=
	chip->erase_suspended =3D 0;=0A=
	chip->in_progress_block_addr =3D adr;=0A=
=0A=
	INVALIDATE_CACHE_UDELAY(map, chip,=0A=
				adr, map->size,=0A=
				chip->erase_time*500);=0A=
=0A=
	timeo =3D jiffies + (HZ*20);=0A=
=0A=
	for (;;) {=0A=
		if (chip->state !=3D FL_ERASING) {=0A=
			/* Someone's suspended the erase. Sleep */=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
			spin_unlock(chip->mutex);=0A=
			schedule();=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
			spin_lock(chip->mutex);=0A=
			continue;=0A=
		}=0A=
		if (chip->erase_suspended) {=0A=
			/* This erase was suspended and resumed.=0A=
			   Adjust the timeout */=0A=
			timeo =3D jiffies + (HZ*20); /* FIXME */=0A=
			chip->erase_suspended =3D 0;=0A=
		}=0A=
=0A=
		if (chip_ready(map, adr))=0A=
			break;=0A=
=0A=
		if (time_after(jiffies, timeo)) {=0A=
			printk(KERN_WARNING "MTD %s(): software timeout\n",=0A=
				__func__ );=0A=
			break;=0A=
		}=0A=
=0A=
		/* Latency issues. Drop the lock, wait a while and retry */=0A=
		UDELAY(map, chip, adr, 1000000/HZ);=0A=
	}=0A=
	/* Did we succeed? */=0A=
	if (!chip_good(map, adr, map_word_ff(map))) {=0A=
		/* reset on all failures. */=0A=
		map_write( map, CMD(0xF0), chip->start );=0A=
		/* FIXME - should have reset delay before continuing */=0A=
=0A=
		ret =3D -EIO;=0A=
	}=0A=
=0A=
	chip->state =3D FL_READY;=0A=
	xip_enable(map, chip, adr);=0A=
	put_chip(map, chip, adr);=0A=
	spin_unlock(chip->mutex);=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int __xipram do_erase_oneblock(struct map_info *map, struct =
flchip *chip, unsigned long adr, int len, void *thunk)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	int ret =3D 0;=0A=
=0A=
	adr +=3D chip->start;=0A=
=0A=
	spin_lock(chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr, FL_ERASING);=0A=
	if (ret) {=0A=
		spin_unlock(chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",=0A=
	       __func__, adr );=0A=
=0A=
	XIP_INVAL_CACHED_RANGE(map, adr, len);=0A=
	ENABLE_VPP(map);=0A=
	xip_disable(map, chip, adr);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	map_write(map, cfi->sector_erase_cmd, adr);=0A=
=0A=
	chip->state =3D FL_ERASING;=0A=
	chip->erase_suspended =3D 0;=0A=
	chip->in_progress_block_addr =3D adr;=0A=
=0A=
	INVALIDATE_CACHE_UDELAY(map, chip,=0A=
				adr, len,=0A=
				chip->erase_time*500);=0A=
=0A=
	timeo =3D jiffies + (HZ*20);=0A=
=0A=
	for (;;) {=0A=
		if (chip->state !=3D FL_ERASING) {=0A=
			/* Someone's suspended the erase. Sleep */=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
			spin_unlock(chip->mutex);=0A=
			schedule();=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
			spin_lock(chip->mutex);=0A=
			continue;=0A=
		}=0A=
		if (chip->erase_suspended) {=0A=
			/* This erase was suspended and resumed.=0A=
			   Adjust the timeout */=0A=
			timeo =3D jiffies + (HZ*20); /* FIXME */=0A=
			chip->erase_suspended =3D 0;=0A=
		}=0A=
=0A=
		if (chip_ready(map, adr)) {=0A=
			xip_enable(map, chip, adr);=0A=
			break;=0A=
		}=0A=
=0A=
		if (time_after(jiffies, timeo)) {=0A=
			xip_enable(map, chip, adr);=0A=
			printk(KERN_WARNING "MTD %s(): software timeout\n",=0A=
				__func__ );=0A=
			break;=0A=
		}=0A=
=0A=
		/* Latency issues. Drop the lock, wait a while and retry */=0A=
		UDELAY(map, chip, adr, 1000000/HZ);=0A=
	}=0A=
	/* Did we succeed? */=0A=
	if (!chip_good(map, adr, map_word_ff(map))) {=0A=
		/* reset on all failures. */=0A=
		map_write( map, CMD(0xF0), chip->start );=0A=
		/* FIXME - should have reset delay before continuing */=0A=
=0A=
		ret =3D -EIO;=0A=
	}=0A=
=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr);=0A=
	spin_unlock(chip->mutex);=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
int cfi_amdstd_erase_varsize(struct mtd_info *mtd, struct erase_info =
*instr)=0A=
{=0A=
	unsigned long ofs, len;=0A=
	int ret;=0A=
=0A=
	ofs =3D instr->addr;=0A=
	len =3D instr->len;=0A=
=0A=
	ret =3D cfi_varsize_frob(mtd, do_erase_oneblock, ofs, len, NULL);=0A=
	if (ret)=0A=
		return ret;=0A=
=0A=
	instr->state =3D MTD_ERASE_DONE;=0A=
	mtd_erase_callback(instr);=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_erase_chip(struct mtd_info *mtd, struct erase_info =
*instr)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret =3D 0;=0A=
=0A=
	if (instr->addr !=3D 0)=0A=
		return -EINVAL;=0A=
=0A=
	if (instr->len !=3D mtd->size)=0A=
		return -EINVAL;=0A=
=0A=
	ret =3D do_erase_chip(map, &cfi->chips[0]);=0A=
	if (ret)=0A=
		return ret;=0A=
=0A=
	instr->state =3D MTD_ERASE_DONE;=0A=
	mtd_erase_callback(instr);=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
static int do_atmel_lock(struct map_info *map, struct flchip *chip,=0A=
			 unsigned long adr, int len, void *thunk)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret;=0A=
=0A=
	spin_lock(chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr + chip->start, FL_LOCKING);=0A=
	if (ret)=0A=
		goto out_unlock;=0A=
	chip->state =3D FL_LOCKING;=0A=
=0A=
	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): LOCK 0x%08lx len %d\n",=0A=
	      __func__, adr, len);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	map_write(map, CMD(0x40), chip->start + adr);=0A=
=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr + chip->start);=0A=
	ret =3D 0;=0A=
=0A=
out_unlock:=0A=
	spin_unlock(chip->mutex);=0A=
	return ret;=0A=
}=0A=
=0A=
static int do_atmel_unlock(struct map_info *map, struct flchip *chip,=0A=
			   unsigned long adr, int len, void *thunk)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret;=0A=
=0A=
	spin_lock(chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr + chip->start, FL_UNLOCKING);=0A=
	if (ret)=0A=
		goto out_unlock;=0A=
	chip->state =3D FL_UNLOCKING;=0A=
=0A=
	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): LOCK 0x%08lx len %d\n",=0A=
	      __func__, adr, len);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	map_write(map, CMD(0x70), adr);=0A=
=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr + chip->start);=0A=
	ret =3D 0;=0A=
=0A=
out_unlock:=0A=
	spin_unlock(chip->mutex);=0A=
	return ret;=0A=
}=0A=
=0A=
static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, size_t len)=0A=
{=0A=
	return cfi_varsize_frob(mtd, do_atmel_lock, ofs, len, NULL);=0A=
}=0A=
=0A=
static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)=0A=
{=0A=
	return cfi_varsize_frob(mtd, do_atmel_unlock, ofs, len, NULL);=0A=
}=0A=
=0A=
=0A=
static void cfi_amdstd_sync (struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int i;=0A=
	struct flchip *chip;=0A=
	int ret =3D 0;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
=0A=
	for (i=3D0; !ret && i<cfi->numchips; i++) {=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
	retry:=0A=
		spin_lock(chip->mutex);=0A=
=0A=
		switch(chip->state) {=0A=
		case FL_READY:=0A=
		case FL_STATUS:=0A=
		case FL_CFI_QUERY:=0A=
		case FL_JEDEC_QUERY:=0A=
			chip->oldstate =3D chip->state;=0A=
			chip->state =3D FL_SYNCING;=0A=
			/* No need to wake_up() on this state change -=0A=
			 * as the whole point is that nobody can do anything=0A=
			 * with the chip now anyway.=0A=
			 */=0A=
		case FL_SYNCING:=0A=
			spin_unlock(chip->mutex);=0A=
			break;=0A=
=0A=
		default:=0A=
			/* Not an idle state */=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
=0A=
			spin_unlock(chip->mutex);=0A=
=0A=
			schedule();=0A=
=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
=0A=
			goto retry;=0A=
		}=0A=
	}=0A=
=0A=
	/* Unlock the chips again */=0A=
=0A=
	for (i--; i >=3D0; i--) {=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
		spin_lock(chip->mutex);=0A=
=0A=
		if (chip->state =3D=3D FL_SYNCING) {=0A=
			chip->state =3D chip->oldstate;=0A=
			wake_up(&chip->wq);=0A=
		}=0A=
		spin_unlock(chip->mutex);=0A=
	}=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_suspend(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int i;=0A=
	struct flchip *chip;=0A=
	int ret =3D 0;=0A=
=0A=
	for (i=3D0; !ret && i<cfi->numchips; i++) {=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
		spin_lock(chip->mutex);=0A=
=0A=
		switch(chip->state) {=0A=
		case FL_READY:=0A=
		case FL_STATUS:=0A=
		case FL_CFI_QUERY:=0A=
		case FL_JEDEC_QUERY:=0A=
			chip->oldstate =3D chip->state;=0A=
			chip->state =3D FL_PM_SUSPENDED;=0A=
			/* No need to wake_up() on this state change -=0A=
			 * as the whole point is that nobody can do anything=0A=
			 * with the chip now anyway.=0A=
			 */=0A=
		case FL_PM_SUSPENDED:=0A=
			break;=0A=
=0A=
		default:=0A=
			ret =3D -EAGAIN;=0A=
			break;=0A=
		}=0A=
		spin_unlock(chip->mutex);=0A=
	}=0A=
=0A=
	/* Unlock the chips again */=0A=
=0A=
	if (ret) {=0A=
		for (i--; i >=3D0; i--) {=0A=
			chip =3D &cfi->chips[i];=0A=
=0A=
			spin_lock(chip->mutex);=0A=
=0A=
			if (chip->state =3D=3D FL_PM_SUSPENDED) {=0A=
				chip->state =3D chip->oldstate;=0A=
				wake_up(&chip->wq);=0A=
			}=0A=
			spin_unlock(chip->mutex);=0A=
		}=0A=
	}=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static void cfi_amdstd_resume(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int i;=0A=
	struct flchip *chip;=0A=
=0A=
	for (i=3D0; i<cfi->numchips; i++) {=0A=
=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
		spin_lock(chip->mutex);=0A=
=0A=
		if (chip->state =3D=3D FL_PM_SUSPENDED) {=0A=
			chip->state =3D FL_READY;=0A=
			map_write(map, CMD(0xF0), chip->start);=0A=
			wake_up(&chip->wq);=0A=
		}=0A=
		else=0A=
			printk(KERN_ERR "Argh. Chip not in PM_SUSPENDED state upon =
resume()\n");=0A=
=0A=
		spin_unlock(chip->mutex);=0A=
	}=0A=
}=0A=
=0A=
static void cfi_amdstd_destroy(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	kfree(cfi->cmdset_priv);=0A=
	kfree(cfi->cfiq);=0A=
	kfree(cfi);=0A=
	kfree(mtd->eraseregions);=0A=
}=0A=
=0A=
MODULE_LICENSE("GPL");=0A=
MODULE_AUTHOR("Crossnet Co. <info@crossnet.co.jp> et al.");=0A=
MODULE_DESCRIPTION("MTD chip driver for AMD/Fujitsu flash chips");=0A=

------=_NextPart_000_0B20_01CCB6CE.23C14A50
Content-Type: application/octet-stream;
	name="cfi_cmdset_0002_2.6.39.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cfi_cmdset_0002_2.6.39.c"

/*=0A=
 * Common Flash Interface support:=0A=
 *   AMD & Fujitsu Standard Vendor Command Set (ID 0x0002)=0A=
 *=0A=
 * Copyright (C) 2000 Crossnet Co. <info@crossnet.co.jp>=0A=
 * Copyright (C) 2004 Arcom Control Systems Ltd <linux@arcom.com>=0A=
 * Copyright (C) 2005 MontaVista Software Inc. <source@mvista.com>=0A=
 *=0A=
 * 2_by_8 routines added by Simon Munton=0A=
 *=0A=
 * 4_by_16 work by Carolyn J. Smith=0A=
 *=0A=
 * XIP support hooks by Vitaly Wool (based on code for Intel flash=0A=
 * by Nicolas Pitre)=0A=
 *=0A=
 * 25/09/2008 Christopher Moore: TopBottom fixup for many Macronix with =
CFI V1.0=0A=
 *=0A=
 * Occasionally maintained by Thayne Harbaugh tharbaugh at lnxi dot com=0A=
 *=0A=
 * This code is GPL=0A=
 */=0A=
=0A=
#include <linux/module.h>=0A=
#include <linux/types.h>=0A=
#include <linux/kernel.h>=0A=
#include <linux/sched.h>=0A=
#include <linux/init.h>=0A=
#include <asm/io.h>=0A=
#include <asm/byteorder.h>=0A=
=0A=
#include <linux/errno.h>=0A=
#include <linux/slab.h>=0A=
#include <linux/delay.h>=0A=
#include <linux/interrupt.h>=0A=
#include <linux/reboot.h>=0A=
#include <linux/mtd/map.h>=0A=
#include <linux/mtd/mtd.h>=0A=
#include <linux/mtd/cfi.h>=0A=
#include <linux/mtd/xip.h>=0A=
=0A=
#define AMD_BOOTLOC_BUG=0A=
#define FORCE_WORD_WRITE 0=0A=
=0A=
#define MAX_WORD_RETRIES 3=0A=
=0A=
#define SST49LF004B	        0x0060=0A=
#define SST49LF040B	        0x0050=0A=
#define SST49LF008A		0x005a=0A=
#define AT49BV6416		0x00d6=0A=
=0A=
static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, =
u_char *);=0A=
static int cfi_amdstd_write_words(struct mtd_info *, loff_t, size_t, =
size_t *, const u_char *);=0A=
static int cfi_amdstd_write_buffers(struct mtd_info *, loff_t, size_t, =
size_t *, const u_char *);=0A=
static int cfi_amdstd_erase_chip(struct mtd_info *, struct erase_info *);=0A=
static int cfi_amdstd_erase_varsize(struct mtd_info *, struct erase_info =
*);=0A=
static void cfi_amdstd_sync (struct mtd_info *);=0A=
static int cfi_amdstd_suspend (struct mtd_info *);=0A=
static void cfi_amdstd_resume (struct mtd_info *);=0A=
static int cfi_amdstd_reboot(struct notifier_block *, unsigned long, =
void *);=0A=
static int cfi_amdstd_secsi_read (struct mtd_info *, loff_t, size_t, =
size_t *, u_char *);=0A=
=0A=
static void cfi_amdstd_destroy(struct mtd_info *);=0A=
=0A=
struct mtd_info *cfi_cmdset_0002(struct map_info *, int);=0A=
static struct mtd_info *cfi_amdstd_setup (struct mtd_info *);=0A=
=0A=
static int get_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr, int mode);=0A=
static void put_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr);=0A=
#include "fwh_lock.h"=0A=
=0A=
static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, uint64_t =
len);=0A=
static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t =
len);=0A=
=0A=
static struct mtd_chip_driver cfi_amdstd_chipdrv =3D {=0A=
	.probe		=3D NULL, /* Not usable directly */=0A=
	.destroy	=3D cfi_amdstd_destroy,=0A=
	.name		=3D "cfi_cmdset_0002",=0A=
	.module		=3D THIS_MODULE=0A=
};=0A=
=0A=
=0A=
/* #define DEBUG_CFI_FEATURES */=0A=
=0A=
=0A=
#ifdef DEBUG_CFI_FEATURES=0A=
static void cfi_tell_features(struct cfi_pri_amdstd *extp)=0A=
{=0A=
	const char* erase_suspend[3] =3D {=0A=
		"Not supported", "Read only", "Read/write"=0A=
	};=0A=
	const char* top_bottom[6] =3D {=0A=
		"No WP", "8x8KiB sectors at top & bottom, no WP",=0A=
		"Bottom boot", "Top boot",=0A=
		"Uniform, Bottom WP", "Uniform, Top WP"=0A=
	};=0A=
=0A=
	printk("  Silicon revision: %d\n", extp->SiliconRevision >> 1);=0A=
	printk("  Address sensitive unlock: %s\n",=0A=
	       (extp->SiliconRevision & 1) ? "Not required" : "Required");=0A=
=0A=
	if (extp->EraseSuspend < ARRAY_SIZE(erase_suspend))=0A=
		printk("  Erase Suspend: %s\n", erase_suspend[extp->EraseSuspend]);=0A=
	else=0A=
		printk("  Erase Suspend: Unknown value %d\n", extp->EraseSuspend);=0A=
=0A=
	if (extp->BlkProt =3D=3D 0)=0A=
		printk("  Block protection: Not supported\n");=0A=
	else=0A=
		printk("  Block protection: %d sectors per group\n", extp->BlkProt);=0A=
=0A=
=0A=
	printk("  Temporary block unprotect: %s\n",=0A=
	       extp->TmpBlkUnprotect ? "Supported" : "Not supported");=0A=
	printk("  Block protect/unprotect scheme: %d\n", extp->BlkProtUnprot);=0A=
	printk("  Number of simultaneous operations: %d\n", =
extp->SimultaneousOps);=0A=
	printk("  Burst mode: %s\n",=0A=
	       extp->BurstMode ? "Supported" : "Not supported");=0A=
	if (extp->PageMode =3D=3D 0)=0A=
		printk("  Page mode: Not supported\n");=0A=
	else=0A=
		printk("  Page mode: %d word page\n", extp->PageMode << 2);=0A=
=0A=
	printk("  Vpp Supply Minimum Program/Erase Voltage: %d.%d V\n",=0A=
	       extp->VppMin >> 4, extp->VppMin & 0xf);=0A=
	printk("  Vpp Supply Maximum Program/Erase Voltage: %d.%d V\n",=0A=
	       extp->VppMax >> 4, extp->VppMax & 0xf);=0A=
=0A=
	if (extp->TopBottom < ARRAY_SIZE(top_bottom))=0A=
		printk("  Top/Bottom Boot Block: %s\n", top_bottom[extp->TopBottom]);=0A=
	else=0A=
		printk("  Top/Bottom Boot Block: Unknown value %d\n", extp->TopBottom);=0A=
}=0A=
#endif=0A=
=0A=
#ifdef AMD_BOOTLOC_BUG=0A=
/* Wheee. Bring me the head of someone at AMD. */=0A=
static void fixup_amd_bootblock(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;=0A=
	__u8 major =3D extp->MajorVersion;=0A=
	__u8 minor =3D extp->MinorVersion;=0A=
=0A=
	if (((major << 8) | minor) < 0x3131) {=0A=
		/* CFI version 1.0 =3D> don't trust bootloc */=0A=
=0A=
		DEBUG(MTD_DEBUG_LEVEL1,=0A=
			"%s: JEDEC Vendor ID is 0x%02X Device ID is 0x%02X\n",=0A=
			map->name, cfi->mfr, cfi->id);=0A=
=0A=
		/* AFAICS all 29LV400 with a bottom boot block have a device ID=0A=
		 * of 0x22BA in 16-bit mode and 0xBA in 8-bit mode.=0A=
		 * These were badly detected as they have the 0x80 bit set=0A=
		 * so treat them as a special case.=0A=
		 */=0A=
		if (((cfi->id =3D=3D 0xBA) || (cfi->id =3D=3D 0x22BA)) &&=0A=
=0A=
			/* Macronix added CFI to their 2nd generation=0A=
			 * MX29LV400C B/T but AFAICS no other 29LV400 (AMD,=0A=
			 * Fujitsu, Spansion, EON, ESI and older Macronix)=0A=
			 * has CFI.=0A=
			 *=0A=
			 * Therefore also check the manufacturer.=0A=
			 * This reduces the risk of false detection due to=0A=
			 * the 8-bit device ID.=0A=
			 */=0A=
			(cfi->mfr =3D=3D CFI_MFR_MACRONIX)) {=0A=
			DEBUG(MTD_DEBUG_LEVEL1,=0A=
				"%s: Macronix MX29LV400C with bottom boot block"=0A=
				" detected\n", map->name);=0A=
			extp->TopBottom =3D 2;	/* bottom boot */=0A=
		} else=0A=
		if (cfi->id & 0x80) {=0A=
			printk(KERN_WARNING "%s: JEDEC Device ID is 0x%02X. Assuming broken =
CFI table.\n", map->name, cfi->id);=0A=
			extp->TopBottom =3D 3;	/* top boot */=0A=
		} else {=0A=
			extp->TopBottom =3D 2;	/* bottom boot */=0A=
		}=0A=
=0A=
		DEBUG(MTD_DEBUG_LEVEL1,=0A=
			"%s: AMD CFI PRI V%c.%c has no boot block field;"=0A=
			" deduced %s from Device ID\n", map->name, major, minor,=0A=
			extp->TopBottom =3D=3D 2 ? "bottom" : "top");=0A=
	}=0A=
}=0A=
#endif=0A=
=0A=
static void fixup_use_write_buffers(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	if (cfi->cfiq->BufWriteTimeoutTyp) {=0A=
		DEBUG(MTD_DEBUG_LEVEL1, "Using buffer write method\n" );=0A=
		mtd->write =3D cfi_amdstd_write_buffers;=0A=
	}=0A=
}=0A=
=0A=
/* Atmel chips don't use the same PRI format as AMD chips */=0A=
static void fixup_convert_atmel_pri(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;=0A=
	struct cfi_pri_atmel atmel_pri;=0A=
=0A=
	memcpy(&atmel_pri, extp, sizeof(atmel_pri));=0A=
	memset((char *)extp + 5, 0, sizeof(*extp) - 5);=0A=
=0A=
	if (atmel_pri.Features & 0x02)=0A=
		extp->EraseSuspend =3D 2;=0A=
=0A=
	/* Some chips got it backwards... */=0A=
	if (cfi->id =3D=3D AT49BV6416) {=0A=
		if (atmel_pri.BottomBoot)=0A=
			extp->TopBottom =3D 3;=0A=
		else=0A=
			extp->TopBottom =3D 2;=0A=
	} else {=0A=
		if (atmel_pri.BottomBoot)=0A=
			extp->TopBottom =3D 2;=0A=
		else=0A=
			extp->TopBottom =3D 3;=0A=
	}=0A=
=0A=
	/* burst write mode not supported */=0A=
	cfi->cfiq->BufWriteTimeoutTyp =3D 0;=0A=
	cfi->cfiq->BufWriteTimeoutMax =3D 0;=0A=
}=0A=
=0A=
static void fixup_use_secsi(struct mtd_info *mtd)=0A=
{=0A=
	/* Setup for chips with a secsi area */=0A=
	mtd->read_user_prot_reg =3D cfi_amdstd_secsi_read;=0A=
	mtd->read_fact_prot_reg =3D cfi_amdstd_secsi_read;=0A=
}=0A=
=0A=
static void fixup_use_erase_chip(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	if ((cfi->cfiq->NumEraseRegions =3D=3D 1) &&=0A=
		((cfi->cfiq->EraseRegionInfo[0] & 0xffff) =3D=3D 0)) {=0A=
		mtd->erase =3D cfi_amdstd_erase_chip;=0A=
	}=0A=
=0A=
}=0A=
=0A=
/*=0A=
 * Some Atmel chips (e.g. the AT49BV6416) power-up with all sectors=0A=
 * locked by default.=0A=
 */=0A=
static void fixup_use_atmel_lock(struct mtd_info *mtd)=0A=
{=0A=
	mtd->lock =3D cfi_atmel_lock;=0A=
	mtd->unlock =3D cfi_atmel_unlock;=0A=
	mtd->flags |=3D MTD_POWERUP_LOCK;=0A=
}=0A=
=0A=
static void fixup_old_sst_eraseregion(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	/*=0A=
	 * These flashes report two separate eraseblock regions based on the=0A=
	 * sector_erase-size and block_erase-size, although they both operate =
on the=0A=
	 * same memory. This is not allowed according to CFI, so we just pick =
the=0A=
	 * sector_erase-size.=0A=
	 */=0A=
	cfi->cfiq->NumEraseRegions =3D 1;=0A=
}=0A=
=0A=
static void fixup_sst39vf(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	fixup_old_sst_eraseregion(mtd);=0A=
=0A=
	cfi->addr_unlock1 =3D 0x5555;=0A=
	cfi->addr_unlock2 =3D 0x2AAA;=0A=
}=0A=
=0A=
static void fixup_sst39vf_rev_b(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	fixup_old_sst_eraseregion(mtd);=0A=
=0A=
	cfi->addr_unlock1 =3D 0x555;=0A=
	cfi->addr_unlock2 =3D 0x2AA;=0A=
=0A=
	cfi->sector_erase_cmd =3D CMD(0x50);=0A=
}=0A=
=0A=
static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	fixup_sst39vf_rev_b(mtd);=0A=
=0A=
	/*=0A=
	 * CFI reports 1024 sectors (0x03ff+1) of 64KBytes (0x0100*256) where=0A=
	 * it should report a size of 8KBytes (0x0020*256).=0A=
	 */=0A=
	cfi->cfiq->EraseRegionInfo[0] =3D 0x002003ff;=0A=
	pr_warning("%s: Bad 38VF640x CFI data; adjusting sector size from 64 to =
8KiB\n", mtd->name);=0A=
}=0A=
=0A=
static void fixup_s29gl064n_sectors(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	if ((cfi->cfiq->EraseRegionInfo[0] & 0xffff) =3D=3D 0x003f) {=0A=
		cfi->cfiq->EraseRegionInfo[0] |=3D 0x0040;=0A=
		pr_warning("%s: Bad S29GL064N CFI data, adjust from 64 to 128 =
sectors\n", mtd->name);=0A=
	}=0A=
}=0A=
=0A=
static void fixup_s29gl032n_sectors(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	if ((cfi->cfiq->EraseRegionInfo[1] & 0xffff) =3D=3D 0x007e) {=0A=
		cfi->cfiq->EraseRegionInfo[1] &=3D ~0x0040;=0A=
		pr_warning("%s: Bad S29GL032N CFI data, adjust from 127 to 63 =
sectors\n", mtd->name);=0A=
	}=0A=
}=0A=
=0A=
/* Used to fix CFI-Tables of chips without Extended Query Tables */=0A=
static struct cfi_fixup cfi_nopri_fixup_table[] =3D {=0A=
	{ CFI_MFR_SST, 0x234a, fixup_sst39vf }, /* SST39VF1602 */=0A=
	{ CFI_MFR_SST, 0x234b, fixup_sst39vf }, /* SST39VF1601 */=0A=
	{ CFI_MFR_SST, 0x235a, fixup_sst39vf }, /* SST39VF3202 */=0A=
	{ CFI_MFR_SST, 0x235b, fixup_sst39vf }, /* SST39VF3201 */=0A=
	{ CFI_MFR_SST, 0x235c, fixup_sst39vf_rev_b }, /* SST39VF3202B */=0A=
	{ CFI_MFR_SST, 0x235d, fixup_sst39vf_rev_b }, /* SST39VF3201B */=0A=
	{ CFI_MFR_SST, 0x236c, fixup_sst39vf_rev_b }, /* SST39VF6402B */=0A=
	{ CFI_MFR_SST, 0x236d, fixup_sst39vf_rev_b }, /* SST39VF6401B */=0A=
	{ 0, 0, NULL }=0A=
};=0A=
=0A=
static struct cfi_fixup cfi_fixup_table[] =3D {=0A=
	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri },=0A=
#ifdef AMD_BOOTLOC_BUG=0A=
	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock },=0A=
	{ CFI_MFR_AMIC, CFI_ID_ANY, fixup_amd_bootblock },=0A=
	{ CFI_MFR_MACRONIX, CFI_ID_ANY, fixup_amd_bootblock },=0A=
#endif=0A=
	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi },=0A=
	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi },=0A=
	{ CFI_MFR_AMD, 0x0055, fixup_use_secsi },=0A=
	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },=0A=
	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },=0A=
	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },=0A=
	{ CFI_MFR_AMD, 0x0c01, fixup_s29gl064n_sectors },=0A=
	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors },=0A=
	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors },=0A=
	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors },=0A=
	{ CFI_MFR_SST, 0x536a, fixup_sst38vf640x_sectorsize }, /* SST38VF6402 */=0A=
	{ CFI_MFR_SST, 0x536b, fixup_sst38vf640x_sectorsize }, /* SST38VF6401 */=0A=
	{ CFI_MFR_SST, 0x536c, fixup_sst38vf640x_sectorsize }, /* SST38VF6404 */=0A=
	{ CFI_MFR_SST, 0x536d, fixup_sst38vf640x_sectorsize }, /* SST38VF6403 */=0A=
#if !FORCE_WORD_WRITE=0A=
	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers },=0A=
#endif=0A=
	{ 0, 0, NULL }=0A=
};=0A=
static struct cfi_fixup jedec_fixup_table[] =3D {=0A=
	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock },=0A=
	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock },=0A=
	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock },=0A=
	{ 0, 0, NULL }=0A=
};=0A=
=0A=
static struct cfi_fixup fixup_table[] =3D {=0A=
	/* The CFI vendor ids and the JEDEC vendor IDs appear=0A=
	 * to be common.  It is like the devices id's are as=0A=
	 * well.  This table is to pick all cases where=0A=
	 * we know that is the case.=0A=
	 */=0A=
	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip },=0A=
	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock },=0A=
	{ 0, 0, NULL }=0A=
};=0A=
=0A=
=0A=
static void cfi_fixup_major_minor(struct cfi_private *cfi,=0A=
				  struct cfi_pri_amdstd *extp)=0A=
{=0A=
	if (cfi->mfr =3D=3D CFI_MFR_SAMSUNG) {=0A=
		if ((extp->MajorVersion =3D=3D '0' && extp->MinorVersion =3D=3D '0') ||=0A=
		    (extp->MajorVersion =3D=3D '3' && extp->MinorVersion =3D=3D '3')) {=0A=
			/*=0A=
			 * Samsung K8P2815UQB and K8D6x16UxM chips=0A=
			 * report major=3D0 / minor=3D0.=0A=
			 * K8D3x16UxC chips report major=3D3 / minor=3D3.=0A=
			 */=0A=
			printk(KERN_NOTICE "  Fixing Samsung's Amd/Fujitsu"=0A=
			       " Extended Query version to 1.%c\n",=0A=
			       extp->MinorVersion);=0A=
			extp->MajorVersion =3D '1';=0A=
		}=0A=
	}=0A=
=0A=
	/*=0A=
	 * SST 38VF640x chips report major=3D0xFF / minor=3D0xFF.=0A=
	 */=0A=
	if (cfi->mfr =3D=3D CFI_MFR_SST && (cfi->id >> 4) =3D=3D 0x0536) {=0A=
		extp->MajorVersion =3D '1';=0A=
		extp->MinorVersion =3D '0';=0A=
	}=0A=
}=0A=
=0A=
struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	struct mtd_info *mtd;=0A=
	int i;=0A=
=0A=
	mtd =3D kzalloc(sizeof(*mtd), GFP_KERNEL);=0A=
	if (!mtd) {=0A=
		printk(KERN_WARNING "Failed to allocate memory for MTD device\n");=0A=
		return NULL;=0A=
	}=0A=
	mtd->priv =3D map;=0A=
	mtd->type =3D MTD_NORFLASH;=0A=
=0A=
	/* Fill in the default mtd operations */=0A=
	mtd->erase   =3D cfi_amdstd_erase_varsize;=0A=
	mtd->write   =3D cfi_amdstd_write_words;=0A=
	mtd->read    =3D cfi_amdstd_read;=0A=
	mtd->sync    =3D cfi_amdstd_sync;=0A=
	mtd->suspend =3D cfi_amdstd_suspend;=0A=
	mtd->resume  =3D cfi_amdstd_resume;=0A=
	mtd->flags   =3D MTD_CAP_NORFLASH;=0A=
	mtd->name    =3D map->name;=0A=
	mtd->writesize =3D 1;=0A=
	mtd->writebufsize =3D cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;=0A=
=0A=
	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): write buffer size %d\n",=0A=
		__func__, mtd->writebufsize);=0A=
=0A=
	mtd->reboot_notifier.notifier_call =3D cfi_amdstd_reboot;=0A=
=0A=
	if (cfi->cfi_mode=3D=3DCFI_MODE_CFI){=0A=
		unsigned char bootloc;=0A=
		__u16 adr =3D primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;=0A=
		struct cfi_pri_amdstd *extp;=0A=
=0A=
		extp =3D (struct cfi_pri_amdstd*)cfi_read_pri(map, adr, sizeof(*extp), =
"Amd/Fujitsu");=0A=
		if (extp) {=0A=
			/*=0A=
			 * It's a real CFI chip, not one for which the probe=0A=
			 * routine faked a CFI structure.=0A=
			 */=0A=
			cfi_fixup_major_minor(cfi, extp);=0A=
=0A=
			/*=0A=
			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4=0A=
 			 * see: Spec 1.3 =
http://cs.ozerki.net/zap/pub/axim-x5/docs/cfi_r20.pdf, page 19 =0A=
 			 *               =
http://www.spansion.com/Support/AppNotes/cfi_100_20011201.pdf=0A=
			 *      Spec 1.4 =
http://www.spansion.com/Support/AppNotes/CFI_Spec_AN_03.pdf, page 9=0A=
			 */=0A=
			if (extp->MajorVersion !=3D '1' ||=0A=
			    (extp->MajorVersion =3D=3D '1' && (extp->MinorVersion < '0' || =
extp->MinorVersion > '4'))) {=0A=
				printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "=0A=
				       "version %c.%c (%#02x/%#02x).\n",=0A=
				       extp->MajorVersion, extp->MinorVersion,=0A=
				       extp->MajorVersion, extp->MinorVersion);=0A=
				kfree(extp);=0A=
				kfree(mtd);=0A=
				return NULL;=0A=
			}=0A=
=0A=
			printk(KERN_INFO "  Amd/Fujitsu Extended Query version %c.%c.\n",=0A=
			       extp->MajorVersion, extp->MinorVersion);=0A=
=0A=
			/* Install our own private info structure */=0A=
			cfi->cmdset_priv =3D extp;=0A=
=0A=
			/* Apply cfi device specific fixups */=0A=
			cfi_fixup(mtd, cfi_fixup_table);=0A=
=0A=
#ifdef DEBUG_CFI_FEATURES=0A=
			/* Tell the user about it in lots of lovely detail */=0A=
			cfi_tell_features(extp);=0A=
#endif=0A=
=0A=
			bootloc =3D extp->TopBottom;=0A=
			if ((bootloc < 2) || (bootloc > 5)) {=0A=
				printk(KERN_WARNING "%s: CFI contains unrecognised boot "=0A=
				       "bank location (%d). Assuming bottom.\n",=0A=
				       map->name, bootloc);=0A=
				bootloc =3D 2;=0A=
			}=0A=
=0A=
			if (bootloc =3D=3D 3 && cfi->cfiq->NumEraseRegions > 1) {=0A=
				printk(KERN_WARNING "%s: Swapping erase regions for top-boot CFI =
table.\n", map->name);=0A=
=0A=
				for (i=3D0; i<cfi->cfiq->NumEraseRegions / 2; i++) {=0A=
					int j =3D (cfi->cfiq->NumEraseRegions-1)-i;=0A=
					__u32 swap;=0A=
=0A=
					swap =3D cfi->cfiq->EraseRegionInfo[i];=0A=
					cfi->cfiq->EraseRegionInfo[i] =3D cfi->cfiq->EraseRegionInfo[j];=0A=
					cfi->cfiq->EraseRegionInfo[j] =3D swap;=0A=
				}=0A=
			}=0A=
			/* Set the default CFI lock/unlock addresses */=0A=
			cfi->addr_unlock1 =3D 0x555;=0A=
			cfi->addr_unlock2 =3D 0x2aa;=0A=
		}=0A=
		cfi_fixup(mtd, cfi_nopri_fixup_table);=0A=
=0A=
		if (!cfi->addr_unlock1 || !cfi->addr_unlock2) {=0A=
			kfree(mtd);=0A=
			return NULL;=0A=
		}=0A=
=0A=
	} /* CFI mode */=0A=
	else if (cfi->cfi_mode =3D=3D CFI_MODE_JEDEC) {=0A=
		/* Apply jedec specific fixups */=0A=
		cfi_fixup(mtd, jedec_fixup_table);=0A=
	}=0A=
	/* Apply generic fixups */=0A=
	cfi_fixup(mtd, fixup_table);=0A=
=0A=
	for (i=3D0; i< cfi->numchips; i++) {=0A=
		cfi->chips[i].word_write_time =3D 1<<cfi->cfiq->WordWriteTimeoutTyp;=0A=
		cfi->chips[i].buffer_write_time =3D 1<<cfi->cfiq->BufWriteTimeoutTyp;=0A=
		cfi->chips[i].erase_time =3D 1<<cfi->cfiq->BlockEraseTimeoutTyp;=0A=
		cfi->chips[i].ref_point_counter =3D 0;=0A=
		init_waitqueue_head(&(cfi->chips[i].wq));=0A=
	}=0A=
=0A=
	map->fldrv =3D &cfi_amdstd_chipdrv;=0A=
=0A=
	return cfi_amdstd_setup(mtd);=0A=
}=0A=
struct mtd_info *cfi_cmdset_0006(struct map_info *map, int primary) =
__attribute__((alias("cfi_cmdset_0002")));=0A=
struct mtd_info *cfi_cmdset_0701(struct map_info *map, int primary) =
__attribute__((alias("cfi_cmdset_0002")));=0A=
EXPORT_SYMBOL_GPL(cfi_cmdset_0002);=0A=
EXPORT_SYMBOL_GPL(cfi_cmdset_0006);=0A=
EXPORT_SYMBOL_GPL(cfi_cmdset_0701);=0A=
=0A=
static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long devsize =3D (1<<cfi->cfiq->DevSize) * cfi->interleave;=0A=
	unsigned long offset =3D 0;=0A=
	int i,j;=0A=
=0A=
	printk(KERN_NOTICE "number of %s chips: %d\n",=0A=
	       (cfi->cfi_mode =3D=3D CFI_MODE_CFI)?"CFI":"JEDEC",cfi->numchips);=0A=
	/* Select the correct geometry setup */=0A=
	mtd->size =3D devsize * cfi->numchips;=0A=
=0A=
	mtd->numeraseregions =3D cfi->cfiq->NumEraseRegions * cfi->numchips;=0A=
	mtd->eraseregions =3D kmalloc(sizeof(struct mtd_erase_region_info)=0A=
				    * mtd->numeraseregions, GFP_KERNEL);=0A=
	if (!mtd->eraseregions) {=0A=
		printk(KERN_WARNING "Failed to allocate memory for MTD erase region =
info\n");=0A=
		goto setup_err;=0A=
	}=0A=
=0A=
	for (i=3D0; i<cfi->cfiq->NumEraseRegions; i++) {=0A=
		unsigned long ernum, ersize;=0A=
		ersize =3D ((cfi->cfiq->EraseRegionInfo[i] >> 8) & ~0xff) * =
cfi->interleave;=0A=
		ernum =3D (cfi->cfiq->EraseRegionInfo[i] & 0xffff) + 1;=0A=
=0A=
		if (mtd->erasesize < ersize) {=0A=
			mtd->erasesize =3D ersize;=0A=
		}=0A=
		for (j=3D0; j<cfi->numchips; j++) {=0A=
			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].offset =3D =
(j*devsize)+offset;=0A=
			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize =3D =
ersize;=0A=
			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks =3D =
ernum;=0A=
		}=0A=
		offset +=3D (ersize * ernum);=0A=
	}=0A=
	if (offset !=3D devsize) {=0A=
		/* Argh */=0A=
		printk(KERN_WARNING "Sum of regions (%lx) !=3D total size of set of =
interleaved chips (%lx)\n", offset, devsize);=0A=
		goto setup_err;=0A=
	}=0A=
=0A=
	__module_get(THIS_MODULE);=0A=
	register_reboot_notifier(&mtd->reboot_notifier);=0A=
	return mtd;=0A=
=0A=
 setup_err:=0A=
	kfree(mtd->eraseregions);=0A=
	kfree(mtd);=0A=
	kfree(cfi->cmdset_priv);=0A=
	kfree(cfi->cfiq);=0A=
	return NULL;=0A=
}=0A=
=0A=
/*=0A=
 * Return true if the chip is ready.=0A=
 *=0A=
 * Ready is one of: read mode, query mode, erase-suspend-read mode (in =
any=0A=
 * non-suspended sector) and is indicated by no toggle bits toggling.=0A=
 *=0A=
 * Note that anything more complicated than checking if no bits are =
toggling=0A=
 * (including checking DQ5 for an error status) is tricky to get working=0A=
 * correctly and is therefore not done	(particularly with interleaved =
chips=0A=
 * as each chip must be checked independently of the others).=0A=
 */=0A=
static int __xipram chip_ready(struct map_info *map, unsigned long addr)=0A=
{=0A=
	map_word d, t;=0A=
=0A=
	d =3D map_read(map, addr);=0A=
	t =3D map_read(map, addr);=0A=
=0A=
	return map_word_equal(map, d, t);=0A=
}=0A=
=0A=
/*=0A=
 * Return true if the chip is ready and has the correct value.=0A=
 *=0A=
 * Ready is one of: read mode, query mode, erase-suspend-read mode (in =
any=0A=
 * non-suspended sector) and it is indicated by no bits toggling.=0A=
 *=0A=
 * Error are indicated by toggling bits or bits held with the wrong =
value,=0A=
 * or with bits toggling.=0A=
 *=0A=
 * Note that anything more complicated than checking if no bits are =
toggling=0A=
 * (including checking DQ5 for an error status) is tricky to get working=0A=
 * correctly and is therefore not done	(particularly with interleaved =
chips=0A=
 * as each chip must be checked independently of the others).=0A=
 *=0A=
 */=0A=
static int __xipram chip_good(struct map_info *map, unsigned long addr, =
map_word expected)=0A=
{=0A=
	map_word oldd, curd;=0A=
=0A=
	oldd =3D map_read(map, addr);=0A=
	curd =3D map_read(map, addr);=0A=
=0A=
	return	map_word_equal(map, oldd, curd) &&=0A=
		map_word_equal(map, curd, expected);=0A=
}=0A=
=0A=
static int get_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr, int mode)=0A=
{=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo;=0A=
	struct cfi_pri_amdstd *cfip =3D (struct cfi_pri_amdstd =
*)cfi->cmdset_priv;=0A=
=0A=
 resettime:=0A=
	timeo =3D jiffies + HZ;=0A=
 retry:=0A=
	switch (chip->state) {=0A=
=0A=
	case FL_STATUS:=0A=
		for (;;) {=0A=
			if (chip_ready(map, adr))=0A=
				break;=0A=
=0A=
			if (time_after(jiffies, timeo)) {=0A=
				printk(KERN_ERR "Waiting for chip to be ready timed out.\n");=0A=
				return -EIO;=0A=
			}=0A=
			mutex_unlock(&chip->mutex);=0A=
			cfi_udelay(1);=0A=
			mutex_lock(&chip->mutex);=0A=
			/* Someone else might have been playing with it. */=0A=
			goto retry;=0A=
		}=0A=
=0A=
	case FL_READY:=0A=
	case FL_CFI_QUERY:=0A=
	case FL_JEDEC_QUERY:=0A=
		return 0;=0A=
=0A=
	case FL_ERASING:=0A=
		if (!cfip || !(cfip->EraseSuspend & (0x1|0x2)) ||=0A=
		    !(mode =3D=3D FL_READY || mode =3D=3D FL_POINT ||=0A=
		    (mode =3D=3D FL_WRITING && (cfip->EraseSuspend & 0x2))))=0A=
			goto sleep;=0A=
=0A=
		/* We could check to see if we're trying to access the sector=0A=
		 * that is currently being erased. However, no user will try=0A=
		 * anything like that so we just wait for the timeout. */=0A=
=0A=
		/* Erase suspend */=0A=
		/* It's harmless to issue the Erase-Suspend and Erase-Resume=0A=
		 * commands when the erase algorithm isn't in progress. */=0A=
		map_write(map, CMD(0xB0), chip->in_progress_block_addr);=0A=
		chip->oldstate =3D FL_ERASING;=0A=
		chip->state =3D FL_ERASE_SUSPENDING;=0A=
		chip->erase_suspended =3D 1;=0A=
		for (;;) {=0A=
			if (chip_ready(map, adr))=0A=
				break;=0A=
=0A=
			if (time_after(jiffies, timeo)) {=0A=
				/* Should have suspended the erase by now.=0A=
				 * Send an Erase-Resume command as either=0A=
				 * there was an error (so leave the erase=0A=
				 * routine to recover from it) or we trying to=0A=
				 * use the erase-in-progress sector. */=0A=
				map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);=0A=
				chip->state =3D FL_ERASING;=0A=
				chip->oldstate =3D FL_READY;=0A=
				printk(KERN_ERR "MTD %s(): chip not ready after erase suspend\n", =
__func__);=0A=
				return -EIO;=0A=
			}=0A=
=0A=
			mutex_unlock(&chip->mutex);=0A=
			cfi_udelay(1);=0A=
			mutex_lock(&chip->mutex);=0A=
			/* Nobody will touch it while it's in state FL_ERASE_SUSPENDING.=0A=
			   So we can just loop here. */=0A=
		}=0A=
		chip->state =3D FL_READY;=0A=
		return 0;=0A=
=0A=
	case FL_XIP_WHILE_ERASING:=0A=
		if (mode !=3D FL_READY && mode !=3D FL_POINT &&=0A=
		    (!cfip || !(cfip->EraseSuspend&2)))=0A=
			goto sleep;=0A=
		chip->oldstate =3D chip->state;=0A=
		chip->state =3D FL_READY;=0A=
		return 0;=0A=
=0A=
	case FL_SHUTDOWN:=0A=
		/* The machine is rebooting */=0A=
		return -EIO;=0A=
=0A=
	case FL_POINT:=0A=
		/* Only if there's no operation suspended... */=0A=
		if (mode =3D=3D FL_READY && chip->oldstate =3D=3D FL_READY)=0A=
			return 0;=0A=
=0A=
	default:=0A=
	sleep:=0A=
		set_current_state(TASK_UNINTERRUPTIBLE);=0A=
		add_wait_queue(&chip->wq, &wait);=0A=
		mutex_unlock(&chip->mutex);=0A=
		schedule();=0A=
		remove_wait_queue(&chip->wq, &wait);=0A=
		mutex_lock(&chip->mutex);=0A=
		goto resettime;=0A=
	}=0A=
}=0A=
=0A=
=0A=
static void put_chip(struct map_info *map, struct flchip *chip, unsigned =
long adr)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	switch(chip->oldstate) {=0A=
	case FL_ERASING:=0A=
		chip->state =3D chip->oldstate;=0A=
		map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);=0A=
		chip->oldstate =3D FL_READY;=0A=
		chip->state =3D FL_ERASING;=0A=
		break;=0A=
=0A=
	case FL_XIP_WHILE_ERASING:=0A=
		chip->state =3D chip->oldstate;=0A=
		chip->oldstate =3D FL_READY;=0A=
		break;=0A=
=0A=
	case FL_READY:=0A=
	case FL_STATUS:=0A=
		/* We should really make set_vpp() count, rather than doing this */=0A=
		DISABLE_VPP(map);=0A=
		break;=0A=
	default:=0A=
		printk(KERN_ERR "MTD: put_chip() called with oldstate %d!!\n", =
chip->oldstate);=0A=
	}=0A=
	wake_up(&chip->wq);=0A=
}=0A=
=0A=
#ifdef CONFIG_MTD_XIP=0A=
=0A=
/*=0A=
 * No interrupt what so ever can be serviced while the flash isn't in =
array=0A=
 * mode.  This is ensured by the xip_disable() and xip_enable() functions=0A=
 * enclosing any code path where the flash is known not to be in array =
mode.=0A=
 * And within a XIP disabled code path, only functions marked with =
__xipram=0A=
 * may be called and nothing else (it's a good thing to inspect generated=0A=
 * assembly to make sure inline functions were actually inlined and that =
gcc=0A=
 * didn't emit calls to its own support functions). Also configuring MTD =
CFI=0A=
 * support to a single buswidth and a single interleave is also =
recommended.=0A=
 */=0A=
=0A=
static void xip_disable(struct map_info *map, struct flchip *chip,=0A=
			unsigned long adr)=0A=
{=0A=
	/* TODO: chips with no XIP use should ignore and return */=0A=
	(void) map_read(map, adr); /* ensure mmu mapping is up to date */=0A=
	local_irq_disable();=0A=
}=0A=
=0A=
static void __xipram xip_enable(struct map_info *map, struct flchip =
*chip,=0A=
				unsigned long adr)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	if (chip->state !=3D FL_POINT && chip->state !=3D FL_READY) {=0A=
		map_write(map, CMD(0xf0), adr);=0A=
		chip->state =3D FL_READY;=0A=
	}=0A=
	(void) map_read(map, adr);=0A=
	xip_iprefetch();=0A=
	local_irq_enable();=0A=
}=0A=
=0A=
/*=0A=
 * When a delay is required for the flash operation to complete, the=0A=
 * xip_udelay() function is polling for both the given timeout and =
pending=0A=
 * (but still masked) hardware interrupts.  Whenever there is an =
interrupt=0A=
 * pending then the flash erase operation is suspended, array mode =
restored=0A=
 * and interrupts unmasked.  Task scheduling might also happen at that=0A=
 * point.  The CPU eventually returns from the interrupt or the call to=0A=
 * schedule() and the suspended flash operation is resumed for the =
remaining=0A=
 * of the delay period.=0A=
 *=0A=
 * Warning: this function _will_ fool interrupt latency tracing tools.=0A=
 */=0A=
=0A=
static void __xipram xip_udelay(struct map_info *map, struct flchip =
*chip,=0A=
				unsigned long adr, int usec)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	struct cfi_pri_amdstd *extp =3D cfi->cmdset_priv;=0A=
	map_word status, OK =3D CMD(0x80);=0A=
	unsigned long suspended, start =3D xip_currtime();=0A=
	flstate_t oldstate;=0A=
=0A=
	do {=0A=
		cpu_relax();=0A=
		if (xip_irqpending() && extp &&=0A=
		    ((chip->state =3D=3D FL_ERASING && (extp->EraseSuspend & 2))) &&=0A=
		    (cfi_interleave_is_1(cfi) || chip->oldstate =3D=3D FL_READY)) {=0A=
			/*=0A=
			 * Let's suspend the erase operation when supported.=0A=
			 * Note that we currently don't try to suspend=0A=
			 * interleaved chips if there is already another=0A=
			 * operation suspended (imagine what happens=0A=
			 * when one chip was already done with the current=0A=
			 * operation while another chip suspended it, then=0A=
			 * we resume the whole thing at once).  Yes, it=0A=
			 * can happen!=0A=
			 */=0A=
			map_write(map, CMD(0xb0), adr);=0A=
			usec -=3D xip_elapsed_since(start);=0A=
			suspended =3D xip_currtime();=0A=
			do {=0A=
				if (xip_elapsed_since(suspended) > 100000) {=0A=
					/*=0A=
					 * The chip doesn't want to suspend=0A=
					 * after waiting for 100 msecs.=0A=
					 * This is a critical error but there=0A=
					 * is not much we can do here.=0A=
					 */=0A=
					return;=0A=
				}=0A=
				status =3D map_read(map, adr);=0A=
			} while (!map_word_andequal(map, status, OK, OK));=0A=
=0A=
			/* Suspend succeeded */=0A=
			oldstate =3D chip->state;=0A=
			if (!map_word_bitsset(map, status, CMD(0x40)))=0A=
				break;=0A=
			chip->state =3D FL_XIP_WHILE_ERASING;=0A=
			chip->erase_suspended =3D 1;=0A=
			map_write(map, CMD(0xf0), adr);=0A=
			(void) map_read(map, adr);=0A=
			xip_iprefetch();=0A=
			local_irq_enable();=0A=
			mutex_unlock(&chip->mutex);=0A=
			xip_iprefetch();=0A=
			cond_resched();=0A=
=0A=
			/*=0A=
			 * We're back.  However someone else might have=0A=
			 * decided to go write to the chip if we are in=0A=
			 * a suspended erase state.  If so let's wait=0A=
			 * until it's done.=0A=
			 */=0A=
			mutex_lock(&chip->mutex);=0A=
			while (chip->state !=3D FL_XIP_WHILE_ERASING) {=0A=
				DECLARE_WAITQUEUE(wait, current);=0A=
				set_current_state(TASK_UNINTERRUPTIBLE);=0A=
				add_wait_queue(&chip->wq, &wait);=0A=
				mutex_unlock(&chip->mutex);=0A=
				schedule();=0A=
				remove_wait_queue(&chip->wq, &wait);=0A=
				mutex_lock(&chip->mutex);=0A=
			}=0A=
			/* Disallow XIP again */=0A=
			local_irq_disable();=0A=
=0A=
			/* Resume the write or erase operation */=0A=
			map_write(map, cfi->sector_erase_cmd, adr);=0A=
			chip->state =3D oldstate;=0A=
			start =3D xip_currtime();=0A=
		} else if (usec >=3D 1000000/HZ) {=0A=
			/*=0A=
			 * Try to save on CPU power when waiting delay=0A=
			 * is at least a system timer tick period.=0A=
			 * No need to be extremely accurate here.=0A=
			 */=0A=
			xip_cpu_idle();=0A=
		}=0A=
		status =3D map_read(map, adr);=0A=
	} while (!map_word_andequal(map, status, OK, OK)=0A=
		 && xip_elapsed_since(start) < usec);=0A=
}=0A=
=0A=
#define UDELAY(map, chip, adr, usec)  xip_udelay(map, chip, adr, usec)=0A=
=0A=
/*=0A=
 * The INVALIDATE_CACHED_RANGE() macro is normally used in parallel while=0A=
 * the flash is actively programming or erasing since we have to poll for=0A=
 * the operation to complete anyway.  We can't do that in a generic way =
with=0A=
 * a XIP setup so do it before the actual flash operation in this case=0A=
 * and stub it out from INVALIDATE_CACHE_UDELAY.=0A=
 */=0A=
#define XIP_INVAL_CACHED_RANGE(map, from, size)  \=0A=
	INVALIDATE_CACHED_RANGE(map, from, size)=0A=
=0A=
#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \=0A=
	UDELAY(map, chip, adr, usec)=0A=
=0A=
/*=0A=
 * Extra notes:=0A=
 *=0A=
 * Activating this XIP support changes the way the code works a bit.  For=0A=
 * example the code to suspend the current process when concurrent access=0A=
 * happens is never executed because xip_udelay() will always return =
with the=0A=
 * same chip state as it was entered with.  This is why there is no care =
for=0A=
 * the presence of add_wait_queue() or schedule() calls from within a =
couple=0A=
 * xip_disable()'d  areas of code, like in do_erase_oneblock for example.=0A=
 * The queueing and scheduling are always happening within xip_udelay().=0A=
 *=0A=
 * Similarly, get_chip() and put_chip() just happen to always be executed=0A=
 * with chip->state set to FL_READY (or FL_XIP_WHILE_*) where flash state=0A=
 * is in array mode, therefore never executing many cases therein and not=0A=
 * causing any problem with XIP.=0A=
 */=0A=
=0A=
#else=0A=
=0A=
#define xip_disable(map, chip, adr)=0A=
#define xip_enable(map, chip, adr)=0A=
#define XIP_INVAL_CACHED_RANGE(x...)=0A=
=0A=
#define UDELAY(map, chip, adr, usec)  \=0A=
do {  \=0A=
	mutex_unlock(&chip->mutex);  \=0A=
	cfi_udelay(usec);  \=0A=
	mutex_lock(&chip->mutex);  \=0A=
} while (0)=0A=
=0A=
#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \=0A=
do {  \=0A=
	mutex_unlock(&chip->mutex);  \=0A=
	INVALIDATE_CACHED_RANGE(map, adr, len);  \=0A=
	cfi_udelay(usec);  \=0A=
	mutex_lock(&chip->mutex);  \=0A=
} while (0)=0A=
=0A=
#endif=0A=
=0A=
static inline int do_read_onechip(struct map_info *map, struct flchip =
*chip, loff_t adr, size_t len, u_char *buf)=0A=
{=0A=
	unsigned long cmd_addr;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret;=0A=
=0A=
	adr +=3D chip->start;=0A=
=0A=
	/* Ensure cmd read/writes are aligned. */=0A=
	cmd_addr =3D adr & ~(map_bankwidth(map)-1);=0A=
=0A=
	mutex_lock(&chip->mutex);=0A=
	ret =3D get_chip(map, chip, cmd_addr, FL_READY);=0A=
	if (ret) {=0A=
		mutex_unlock(&chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	if (chip->state !=3D FL_POINT && chip->state !=3D FL_READY) {=0A=
		map_write(map, CMD(0xf0), cmd_addr);=0A=
		chip->state =3D FL_READY;=0A=
	}=0A=
=0A=
	map_copy_from(map, buf, adr, len);=0A=
=0A=
	put_chip(map, chip, cmd_addr);=0A=
=0A=
	mutex_unlock(&chip->mutex);=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t =
len, size_t *retlen, u_char *buf)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long ofs;=0A=
	int chipnum;=0A=
	int ret =3D 0;=0A=
=0A=
	/* ofs: offset within the first chip that the first read should start */=0A=
=0A=
	chipnum =3D (from >> cfi->chipshift);=0A=
	ofs =3D from - (chipnum <<  cfi->chipshift);=0A=
=0A=
=0A=
	*retlen =3D 0;=0A=
=0A=
	while (len) {=0A=
		unsigned long thislen;=0A=
=0A=
		if (chipnum >=3D cfi->numchips)=0A=
			break;=0A=
=0A=
		if ((len + ofs -1) >> cfi->chipshift)=0A=
			thislen =3D (1<<cfi->chipshift) - ofs;=0A=
		else=0A=
			thislen =3D len;=0A=
=0A=
		ret =3D do_read_onechip(map, &cfi->chips[chipnum], ofs, thislen, buf);=0A=
		if (ret)=0A=
			break;=0A=
=0A=
		*retlen +=3D thislen;=0A=
		len -=3D thislen;=0A=
		buf +=3D thislen;=0A=
=0A=
		ofs =3D 0;=0A=
		chipnum++;=0A=
	}=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static inline int do_read_secsi_onechip(struct map_info *map, struct =
flchip *chip, loff_t adr, size_t len, u_char *buf)=0A=
{=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
 retry:=0A=
	mutex_lock(&chip->mutex);=0A=
=0A=
	if (chip->state !=3D FL_READY){=0A=
		set_current_state(TASK_UNINTERRUPTIBLE);=0A=
		add_wait_queue(&chip->wq, &wait);=0A=
=0A=
		mutex_unlock(&chip->mutex);=0A=
=0A=
		schedule();=0A=
		remove_wait_queue(&chip->wq, &wait);=0A=
		timeo =3D jiffies + HZ;=0A=
=0A=
		goto retry;=0A=
	}=0A=
=0A=
	adr +=3D chip->start;=0A=
=0A=
	chip->state =3D FL_READY;=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
=0A=
	map_copy_from(map, buf, adr, len);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
=0A=
	wake_up(&chip->wq);=0A=
	mutex_unlock(&chip->mutex);=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
static int cfi_amdstd_secsi_read (struct mtd_info *mtd, loff_t from, =
size_t len, size_t *retlen, u_char *buf)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long ofs;=0A=
	int chipnum;=0A=
	int ret =3D 0;=0A=
=0A=
=0A=
	/* ofs: offset within the first chip that the first read should start */=0A=
=0A=
	/* 8 secsi bytes per chip */=0A=
	chipnum=3Dfrom>>3;=0A=
	ofs=3Dfrom & 7;=0A=
=0A=
=0A=
	*retlen =3D 0;=0A=
=0A=
	while (len) {=0A=
		unsigned long thislen;=0A=
=0A=
		if (chipnum >=3D cfi->numchips)=0A=
			break;=0A=
=0A=
		if ((len + ofs -1) >> 3)=0A=
			thislen =3D (1<<3) - ofs;=0A=
		else=0A=
			thislen =3D len;=0A=
=0A=
		ret =3D do_read_secsi_onechip(map, &cfi->chips[chipnum], ofs, thislen, =
buf);=0A=
		if (ret)=0A=
			break;=0A=
=0A=
		*retlen +=3D thislen;=0A=
		len -=3D thislen;=0A=
		buf +=3D thislen;=0A=
=0A=
		ofs =3D 0;=0A=
		chipnum++;=0A=
	}=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int __xipram do_write_oneword(struct map_info *map, struct flchip =
*chip, unsigned long adr, map_word datum)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	/*=0A=
	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices=0A=
	 * have a max write time of a few hundreds usec). However, we should=0A=
	 * use the maximum timeout value given by the chip at probe time=0A=
	 * instead.  Unfortunately, struct flchip does have a field for=0A=
	 * maximum timeout, only for typical which can be far too short=0A=
	 * depending of the conditions.	 The ' + 1' is to avoid having a=0A=
	 * timeout of 0 jiffies if HZ is smaller than 1000.=0A=
	 */=0A=
	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;=0A=
	int ret =3D 0;=0A=
	map_word oldd;=0A=
	int retry_cnt =3D 0;=0A=
=0A=
	adr +=3D chip->start;=0A=
=0A=
	mutex_lock(&chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr, FL_WRITING);=0A=
	if (ret) {=0A=
		mutex_unlock(&chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",=0A=
	       __func__, adr, datum.x[0] );=0A=
=0A=
	/*=0A=
	 * Check for a NOP for the case when the datum to write is already=0A=
	 * present - it saves time and works around buggy chips that corrupt=0A=
	 * data at other locations when 0xff is written to a location that=0A=
	 * already contains 0xff.=0A=
	 */=0A=
	oldd =3D map_read(map, adr);=0A=
	if (map_word_equal(map, oldd, datum)) {=0A=
		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): NOP\n",=0A=
		       __func__);=0A=
		goto op_done;=0A=
	}=0A=
=0A=
	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));=0A=
	ENABLE_VPP(map);=0A=
	xip_disable(map, chip, adr);=0A=
 retry:=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	map_write(map, datum, adr);=0A=
	chip->state =3D FL_WRITING;=0A=
=0A=
	INVALIDATE_CACHE_UDELAY(map, chip,=0A=
				adr, map_bankwidth(map),=0A=
				chip->word_write_time);=0A=
=0A=
	/* See comment above for timeout value. */=0A=
	timeo =3D jiffies + uWriteTimeout;=0A=
	for (;;) {=0A=
		if (chip->state !=3D FL_WRITING) {=0A=
			/* Someone's suspended the write. Sleep */=0A=
			DECLARE_WAITQUEUE(wait, current);=0A=
=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
			mutex_unlock(&chip->mutex);=0A=
			schedule();=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
			timeo =3D jiffies + (HZ / 2); /* FIXME */=0A=
			mutex_lock(&chip->mutex);=0A=
			continue;=0A=
		}=0A=
=0A=
		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){=0A=
			xip_enable(map, chip, adr);=0A=
			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);=0A=
			xip_disable(map, chip, adr);=0A=
			break;=0A=
		}=0A=
=0A=
		if (chip_ready(map, adr))=0A=
			break;=0A=
=0A=
		/* Latency issues. Drop the lock, wait a while and retry */=0A=
		UDELAY(map, chip, adr, 1);=0A=
	}=0A=
	/* Did we succeed? */=0A=
	if (!chip_good(map, adr, datum)) {=0A=
		/* reset on all failures. */=0A=
		map_write( map, CMD(0xF0), chip->start );=0A=
		/* FIXME - should have reset delay before continuing */=0A=
=0A=
		if (++retry_cnt <=3D MAX_WORD_RETRIES)=0A=
			goto retry;=0A=
=0A=
		ret =3D -EIO;=0A=
	}=0A=
	xip_enable(map, chip, adr);=0A=
 op_done:=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr);=0A=
	mutex_unlock(&chip->mutex);=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, =
size_t len,=0A=
				  size_t *retlen, const u_char *buf)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret =3D 0;=0A=
	int chipnum;=0A=
	unsigned long ofs, chipstart;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
=0A=
	*retlen =3D 0;=0A=
	if (!len)=0A=
		return 0;=0A=
=0A=
	chipnum =3D to >> cfi->chipshift;=0A=
	ofs =3D to  - (chipnum << cfi->chipshift);=0A=
	chipstart =3D cfi->chips[chipnum].start;=0A=
=0A=
	/* If it's not bus-aligned, do the first byte write */=0A=
	if (ofs & (map_bankwidth(map)-1)) {=0A=
		unsigned long bus_ofs =3D ofs & ~(map_bankwidth(map)-1);=0A=
		int i =3D ofs - bus_ofs;=0A=
		int n =3D 0;=0A=
		map_word tmp_buf;=0A=
=0A=
 retry:=0A=
		mutex_lock(&cfi->chips[chipnum].mutex);=0A=
=0A=
		if (cfi->chips[chipnum].state !=3D FL_READY) {=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
=0A=
			mutex_unlock(&cfi->chips[chipnum].mutex);=0A=
=0A=
			schedule();=0A=
			remove_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
			goto retry;=0A=
		}=0A=
=0A=
		/* Load 'tmp_buf' with old contents of flash */=0A=
		tmp_buf =3D map_read(map, bus_ofs+chipstart);=0A=
=0A=
		mutex_unlock(&cfi->chips[chipnum].mutex);=0A=
=0A=
		/* Number of bytes to copy from buffer */=0A=
		n =3D min_t(int, len, map_bankwidth(map)-i);=0A=
=0A=
		tmp_buf =3D map_word_load_partial(map, tmp_buf, buf, i, n);=0A=
=0A=
		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=0A=
				       bus_ofs, tmp_buf);=0A=
		if (ret)=0A=
			return ret;=0A=
=0A=
		ofs +=3D n;=0A=
		buf +=3D n;=0A=
		(*retlen) +=3D n;=0A=
		len -=3D n;=0A=
=0A=
		if (ofs >> cfi->chipshift) {=0A=
			chipnum ++;=0A=
			ofs =3D 0;=0A=
			if (chipnum =3D=3D cfi->numchips)=0A=
				return 0;=0A=
		}=0A=
	}=0A=
=0A=
	/* We are now aligned, write as much as possible */=0A=
	while(len >=3D map_bankwidth(map)) {=0A=
		map_word datum;=0A=
=0A=
		datum =3D map_word_load(map, buf);=0A=
=0A=
		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=0A=
				       ofs, datum);=0A=
		if (ret)=0A=
			return ret;=0A=
=0A=
		ofs +=3D map_bankwidth(map);=0A=
		buf +=3D map_bankwidth(map);=0A=
		(*retlen) +=3D map_bankwidth(map);=0A=
		len -=3D map_bankwidth(map);=0A=
=0A=
		if (ofs >> cfi->chipshift) {=0A=
			chipnum ++;=0A=
			ofs =3D 0;=0A=
			if (chipnum =3D=3D cfi->numchips)=0A=
				return 0;=0A=
			chipstart =3D cfi->chips[chipnum].start;=0A=
		}=0A=
	}=0A=
=0A=
	/* Write the trailing bytes if any */=0A=
	if (len & (map_bankwidth(map)-1)) {=0A=
		map_word tmp_buf;=0A=
=0A=
 retry1:=0A=
		mutex_lock(&cfi->chips[chipnum].mutex);=0A=
=0A=
		if (cfi->chips[chipnum].state !=3D FL_READY) {=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
=0A=
			mutex_unlock(&cfi->chips[chipnum].mutex);=0A=
=0A=
			schedule();=0A=
			remove_wait_queue(&cfi->chips[chipnum].wq, &wait);=0A=
			goto retry1;=0A=
		}=0A=
=0A=
		tmp_buf =3D map_read(map, ofs + chipstart);=0A=
=0A=
		mutex_unlock(&cfi->chips[chipnum].mutex);=0A=
=0A=
		tmp_buf =3D map_word_load_partial(map, tmp_buf, buf, 0, len);=0A=
=0A=
		ret =3D do_write_oneword(map, &cfi->chips[chipnum],=0A=
				ofs, tmp_buf);=0A=
		if (ret)=0A=
			return ret;=0A=
=0A=
		(*retlen) +=3D len;=0A=
	}=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
/*=0A=
 * FIXME: interleaved mode not tested, and probably not supported!=0A=
 */=0A=
static int __xipram do_write_buffer(struct map_info *map, struct flchip =
*chip,=0A=
				    unsigned long adr, const u_char *buf,=0A=
				    int len)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	/* see comments in do_write_oneword() regarding uWriteTimeo. */=0A=
	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;=0A=
	int ret =3D -EIO;=0A=
	unsigned long cmd_adr;=0A=
	int z, words;=0A=
	map_word datum;=0A=
=0A=
	adr +=3D chip->start;=0A=
	cmd_adr =3D adr;=0A=
=0A=
	mutex_lock(&chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr, FL_WRITING);=0A=
	if (ret) {=0A=
		mutex_unlock(&chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	datum =3D map_word_load(map, buf);=0A=
=0A=
	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",=0A=
	       __func__, adr, datum.x[0] );=0A=
=0A=
	XIP_INVAL_CACHED_RANGE(map, adr, len);=0A=
	ENABLE_VPP(map);=0A=
	xip_disable(map, chip, cmd_adr);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
=0A=
	/* Write Buffer Load */=0A=
	map_write(map, CMD(0x25), cmd_adr);=0A=
=0A=
	chip->state =3D FL_WRITING_TO_BUFFER;=0A=
=0A=
	/* Write length of data to come */=0A=
	words =3D len / map_bankwidth(map);=0A=
	map_write(map, CMD(words - 1), cmd_adr);=0A=
	/* Write data */=0A=
	z =3D 0;=0A=
	while(z < words * map_bankwidth(map)) {=0A=
		datum =3D map_word_load(map, buf);=0A=
		map_write(map, datum, adr + z);=0A=
=0A=
		z +=3D map_bankwidth(map);=0A=
		buf +=3D map_bankwidth(map);=0A=
	}=0A=
	z -=3D map_bankwidth(map);=0A=
=0A=
	adr +=3D z;=0A=
=0A=
	/* Write Buffer Program Confirm: GO GO GO */=0A=
	map_write(map, CMD(0x29), cmd_adr);=0A=
	chip->state =3D FL_WRITING;=0A=
=0A=
	INVALIDATE_CACHE_UDELAY(map, chip,=0A=
				adr, map_bankwidth(map),=0A=
				chip->word_write_time);=0A=
=0A=
	timeo =3D jiffies + uWriteTimeout;=0A=
=0A=
	for (;;) {=0A=
		if (chip->state !=3D FL_WRITING) {=0A=
			/* Someone's suspended the write. Sleep */=0A=
			DECLARE_WAITQUEUE(wait, current);=0A=
=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
			mutex_unlock(&chip->mutex);=0A=
			schedule();=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
			timeo =3D jiffies + (HZ / 2); /* FIXME */=0A=
			mutex_lock(&chip->mutex);=0A=
			continue;=0A=
		}=0A=
=0A=
		if (time_after(jiffies, timeo) && !chip_ready(map, adr))=0A=
			break;=0A=
=0A=
		if (chip_ready(map, adr)) {=0A=
			xip_enable(map, chip, adr);=0A=
			goto op_done;=0A=
		}=0A=
=0A=
		/* Latency issues. Drop the lock, wait a while and retry */=0A=
		UDELAY(map, chip, adr, 1);=0A=
	}=0A=
=0A=
	/* reset on all failures. */=0A=
	map_write( map, CMD(0xF0), chip->start );=0A=
	xip_enable(map, chip, adr);=0A=
	/* FIXME - should have reset delay before continuing */=0A=
=0A=
	printk(KERN_WARNING "MTD %s(): software timeout\n",=0A=
	       __func__ );=0A=
=0A=
	ret =3D -EIO;=0A=
 op_done:=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr);=0A=
	mutex_unlock(&chip->mutex);=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_write_buffers(struct mtd_info *mtd, loff_t to, =
size_t len,=0A=
				    size_t *retlen, const u_char *buf)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int wbufsize =3D cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;=0A=
	int ret =3D 0;=0A=
	int chipnum;=0A=
	unsigned long ofs;=0A=
=0A=
	*retlen =3D 0;=0A=
	if (!len)=0A=
		return 0;=0A=
=0A=
	chipnum =3D to >> cfi->chipshift;=0A=
	ofs =3D to  - (chipnum << cfi->chipshift);=0A=
=0A=
	/* If it's not bus-aligned, do the first word write */=0A=
	if (ofs & (map_bankwidth(map)-1)) {=0A=
		size_t local_len =3D (-ofs)&(map_bankwidth(map)-1);=0A=
		if (local_len > len)=0A=
			local_len =3D len;=0A=
		ret =3D cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),=0A=
					     local_len, retlen, buf);=0A=
		if (ret)=0A=
			return ret;=0A=
		ofs +=3D local_len;=0A=
		buf +=3D local_len;=0A=
		len -=3D local_len;=0A=
=0A=
		if (ofs >> cfi->chipshift) {=0A=
			chipnum ++;=0A=
			ofs =3D 0;=0A=
			if (chipnum =3D=3D cfi->numchips)=0A=
				return 0;=0A=
		}=0A=
	}=0A=
=0A=
	/* Write buffer is worth it only if more than one word to write... */=0A=
	while (len >=3D map_bankwidth(map) * 2) {=0A=
		/* We must not cross write block boundaries */=0A=
		int size =3D wbufsize - (ofs & (wbufsize-1));=0A=
=0A=
		if (size > len)=0A=
			size =3D len;=0A=
		if (size % map_bankwidth(map))=0A=
			size -=3D size % map_bankwidth(map);=0A=
=0A=
		ret =3D do_write_buffer(map, &cfi->chips[chipnum],=0A=
				      ofs, buf, size);=0A=
		if (ret)=0A=
			return ret;=0A=
=0A=
		ofs +=3D size;=0A=
		buf +=3D size;=0A=
		(*retlen) +=3D size;=0A=
		len -=3D size;=0A=
=0A=
		if (ofs >> cfi->chipshift) {=0A=
			chipnum ++;=0A=
			ofs =3D 0;=0A=
			if (chipnum =3D=3D cfi->numchips)=0A=
				return 0;=0A=
		}=0A=
	}=0A=
=0A=
	if (len) {=0A=
		size_t retlen_dregs =3D 0;=0A=
=0A=
		ret =3D cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),=0A=
					     len, &retlen_dregs, buf);=0A=
=0A=
		*retlen +=3D retlen_dregs;=0A=
		return ret;=0A=
	}=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
/*=0A=
 * Handle devices with one erase region, that only implement=0A=
 * the chip erase command.=0A=
 */=0A=
static int __xipram do_erase_chip(struct map_info *map, struct flchip =
*chip)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	unsigned long int adr;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	int ret =3D 0;=0A=
=0A=
	adr =3D cfi->addr_unlock1;=0A=
=0A=
	mutex_lock(&chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr, FL_WRITING);=0A=
	if (ret) {=0A=
		mutex_unlock(&chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",=0A=
	       __func__, chip->start );=0A=
=0A=
	XIP_INVAL_CACHED_RANGE(map, adr, map->size);=0A=
	ENABLE_VPP(map);=0A=
	xip_disable(map, chip, adr);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
=0A=
	chip->state =3D FL_ERASING;=0A=
	chip->erase_suspended =3D 0;=0A=
	chip->in_progress_block_addr =3D adr;=0A=
=0A=
	INVALIDATE_CACHE_UDELAY(map, chip,=0A=
				adr, map->size,=0A=
				chip->erase_time*500);=0A=
=0A=
	timeo =3D jiffies + (HZ*20);=0A=
=0A=
	for (;;) {=0A=
		if (chip->state !=3D FL_ERASING) {=0A=
			/* Someone's suspended the erase. Sleep */=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
			mutex_unlock(&chip->mutex);=0A=
			schedule();=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
			mutex_lock(&chip->mutex);=0A=
			continue;=0A=
		}=0A=
		if (chip->erase_suspended) {=0A=
			/* This erase was suspended and resumed.=0A=
			   Adjust the timeout */=0A=
			timeo =3D jiffies + (HZ*20); /* FIXME */=0A=
			chip->erase_suspended =3D 0;=0A=
		}=0A=
=0A=
		if (chip_ready(map, adr))=0A=
			break;=0A=
=0A=
		if (time_after(jiffies, timeo)) {=0A=
			printk(KERN_WARNING "MTD %s(): software timeout\n",=0A=
				__func__ );=0A=
			break;=0A=
		}=0A=
=0A=
		/* Latency issues. Drop the lock, wait a while and retry */=0A=
		UDELAY(map, chip, adr, 1000000/HZ);=0A=
	}=0A=
	/* Did we succeed? */=0A=
	if (!chip_good(map, adr, map_word_ff(map))) {=0A=
		/* reset on all failures. */=0A=
		map_write( map, CMD(0xF0), chip->start );=0A=
		/* FIXME - should have reset delay before continuing */=0A=
=0A=
		ret =3D -EIO;=0A=
	}=0A=
=0A=
	chip->state =3D FL_READY;=0A=
	xip_enable(map, chip, adr);=0A=
	put_chip(map, chip, adr);=0A=
	mutex_unlock(&chip->mutex);=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int __xipram do_erase_oneblock(struct map_info *map, struct =
flchip *chip, unsigned long adr, int len, void *thunk)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	unsigned long timeo =3D jiffies + HZ;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	int ret =3D 0;=0A=
=0A=
	adr +=3D chip->start;=0A=
=0A=
	mutex_lock(&chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr, FL_ERASING);=0A=
	if (ret) {=0A=
		mutex_unlock(&chip->mutex);=0A=
		return ret;=0A=
	}=0A=
=0A=
	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",=0A=
	       __func__, adr );=0A=
=0A=
	XIP_INVAL_CACHED_RANGE(map, adr, len);=0A=
	ENABLE_VPP(map);=0A=
	xip_disable(map, chip, adr);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, =
cfi->device_type, NULL);=0A=
	map_write(map, cfi->sector_erase_cmd, adr);=0A=
=0A=
	chip->state =3D FL_ERASING;=0A=
	chip->erase_suspended =3D 0;=0A=
	chip->in_progress_block_addr =3D adr;=0A=
=0A=
	INVALIDATE_CACHE_UDELAY(map, chip,=0A=
				adr, len,=0A=
				chip->erase_time*500);=0A=
=0A=
	timeo =3D jiffies + (HZ*20);=0A=
=0A=
	for (;;) {=0A=
		if (chip->state !=3D FL_ERASING) {=0A=
			/* Someone's suspended the erase. Sleep */=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
			mutex_unlock(&chip->mutex);=0A=
			schedule();=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
			mutex_lock(&chip->mutex);=0A=
			continue;=0A=
		}=0A=
		if (chip->erase_suspended) {=0A=
			/* This erase was suspended and resumed.=0A=
			   Adjust the timeout */=0A=
			timeo =3D jiffies + (HZ*20); /* FIXME */=0A=
			chip->erase_suspended =3D 0;=0A=
		}=0A=
=0A=
		if (chip_ready(map, adr)) {=0A=
			xip_enable(map, chip, adr);=0A=
			break;=0A=
		}=0A=
=0A=
		if (time_after(jiffies, timeo)) {=0A=
			xip_enable(map, chip, adr);=0A=
			printk(KERN_WARNING "MTD %s(): software timeout\n",=0A=
				__func__ );=0A=
			break;=0A=
		}=0A=
=0A=
		/* Latency issues. Drop the lock, wait a while and retry */=0A=
		UDELAY(map, chip, adr, 1000000/HZ);=0A=
	}=0A=
	/* Did we succeed? */=0A=
	if (!chip_good(map, adr, map_word_ff(map))) {=0A=
		/* reset on all failures. */=0A=
		map_write( map, CMD(0xF0), chip->start );=0A=
		/* FIXME - should have reset delay before continuing */=0A=
=0A=
		ret =3D -EIO;=0A=
	}=0A=
=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr);=0A=
	mutex_unlock(&chip->mutex);=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_erase_varsize(struct mtd_info *mtd, struct =
erase_info *instr)=0A=
{=0A=
	unsigned long ofs, len;=0A=
	int ret;=0A=
=0A=
	ofs =3D instr->addr;=0A=
	len =3D instr->len;=0A=
=0A=
	ret =3D cfi_varsize_frob(mtd, do_erase_oneblock, ofs, len, NULL);=0A=
	if (ret)=0A=
		return ret;=0A=
=0A=
	instr->state =3D MTD_ERASE_DONE;=0A=
	mtd_erase_callback(instr);=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_erase_chip(struct mtd_info *mtd, struct erase_info =
*instr)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret =3D 0;=0A=
=0A=
	if (instr->addr !=3D 0)=0A=
		return -EINVAL;=0A=
=0A=
	if (instr->len !=3D mtd->size)=0A=
		return -EINVAL;=0A=
=0A=
	ret =3D do_erase_chip(map, &cfi->chips[0]);=0A=
	if (ret)=0A=
		return ret;=0A=
=0A=
	instr->state =3D MTD_ERASE_DONE;=0A=
	mtd_erase_callback(instr);=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
static int do_atmel_lock(struct map_info *map, struct flchip *chip,=0A=
			 unsigned long adr, int len, void *thunk)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret;=0A=
=0A=
	mutex_lock(&chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr + chip->start, FL_LOCKING);=0A=
	if (ret)=0A=
		goto out_unlock;=0A=
	chip->state =3D FL_LOCKING;=0A=
=0A=
	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): LOCK 0x%08lx len %d\n",=0A=
	      __func__, adr, len);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	map_write(map, CMD(0x40), chip->start + adr);=0A=
=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr + chip->start);=0A=
	ret =3D 0;=0A=
=0A=
out_unlock:=0A=
	mutex_unlock(&chip->mutex);=0A=
	return ret;=0A=
}=0A=
=0A=
static int do_atmel_unlock(struct map_info *map, struct flchip *chip,=0A=
			   unsigned long adr, int len, void *thunk)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int ret;=0A=
=0A=
	mutex_lock(&chip->mutex);=0A=
	ret =3D get_chip(map, chip, adr + chip->start, FL_UNLOCKING);=0A=
	if (ret)=0A=
		goto out_unlock;=0A=
	chip->state =3D FL_UNLOCKING;=0A=
=0A=
	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): LOCK 0x%08lx len %d\n",=0A=
	      __func__, adr, len);=0A=
=0A=
	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,=0A=
			 cfi->device_type, NULL);=0A=
	map_write(map, CMD(0x70), adr);=0A=
=0A=
	chip->state =3D FL_READY;=0A=
	put_chip(map, chip, adr + chip->start);=0A=
	ret =3D 0;=0A=
=0A=
out_unlock:=0A=
	mutex_unlock(&chip->mutex);=0A=
	return ret;=0A=
}=0A=
=0A=
static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)=0A=
{=0A=
	return cfi_varsize_frob(mtd, do_atmel_lock, ofs, len, NULL);=0A=
}=0A=
=0A=
static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t =
len)=0A=
{=0A=
	return cfi_varsize_frob(mtd, do_atmel_unlock, ofs, len, NULL);=0A=
}=0A=
=0A=
=0A=
static void cfi_amdstd_sync (struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int i;=0A=
	struct flchip *chip;=0A=
	int ret =3D 0;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
=0A=
	for (i=3D0; !ret && i<cfi->numchips; i++) {=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
	retry:=0A=
		mutex_lock(&chip->mutex);=0A=
=0A=
		switch(chip->state) {=0A=
		case FL_READY:=0A=
		case FL_STATUS:=0A=
		case FL_CFI_QUERY:=0A=
		case FL_JEDEC_QUERY:=0A=
			chip->oldstate =3D chip->state;=0A=
			chip->state =3D FL_SYNCING;=0A=
			/* No need to wake_up() on this state change -=0A=
			 * as the whole point is that nobody can do anything=0A=
			 * with the chip now anyway.=0A=
			 */=0A=
		case FL_SYNCING:=0A=
			mutex_unlock(&chip->mutex);=0A=
			break;=0A=
=0A=
		default:=0A=
			/* Not an idle state */=0A=
			set_current_state(TASK_UNINTERRUPTIBLE);=0A=
			add_wait_queue(&chip->wq, &wait);=0A=
=0A=
			mutex_unlock(&chip->mutex);=0A=
=0A=
			schedule();=0A=
=0A=
			remove_wait_queue(&chip->wq, &wait);=0A=
=0A=
			goto retry;=0A=
		}=0A=
	}=0A=
=0A=
	/* Unlock the chips again */=0A=
=0A=
	for (i--; i >=3D0; i--) {=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
		mutex_lock(&chip->mutex);=0A=
=0A=
		if (chip->state =3D=3D FL_SYNCING) {=0A=
			chip->state =3D chip->oldstate;=0A=
			wake_up(&chip->wq);=0A=
		}=0A=
		mutex_unlock(&chip->mutex);=0A=
	}=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_suspend(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int i;=0A=
	struct flchip *chip;=0A=
	int ret =3D 0;=0A=
=0A=
	for (i=3D0; !ret && i<cfi->numchips; i++) {=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
		mutex_lock(&chip->mutex);=0A=
=0A=
		switch(chip->state) {=0A=
		case FL_READY:=0A=
		case FL_STATUS:=0A=
		case FL_CFI_QUERY:=0A=
		case FL_JEDEC_QUERY:=0A=
			chip->oldstate =3D chip->state;=0A=
			chip->state =3D FL_PM_SUSPENDED;=0A=
			/* No need to wake_up() on this state change -=0A=
			 * as the whole point is that nobody can do anything=0A=
			 * with the chip now anyway.=0A=
			 */=0A=
		case FL_PM_SUSPENDED:=0A=
			break;=0A=
=0A=
		default:=0A=
			ret =3D -EAGAIN;=0A=
			break;=0A=
		}=0A=
		mutex_unlock(&chip->mutex);=0A=
	}=0A=
=0A=
	/* Unlock the chips again */=0A=
=0A=
	if (ret) {=0A=
		for (i--; i >=3D0; i--) {=0A=
			chip =3D &cfi->chips[i];=0A=
=0A=
			mutex_lock(&chip->mutex);=0A=
=0A=
			if (chip->state =3D=3D FL_PM_SUSPENDED) {=0A=
				chip->state =3D chip->oldstate;=0A=
				wake_up(&chip->wq);=0A=
			}=0A=
			mutex_unlock(&chip->mutex);=0A=
		}=0A=
	}=0A=
=0A=
	return ret;=0A=
}=0A=
=0A=
=0A=
static void cfi_amdstd_resume(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int i;=0A=
	struct flchip *chip;=0A=
=0A=
	for (i=3D0; i<cfi->numchips; i++) {=0A=
=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
		mutex_lock(&chip->mutex);=0A=
=0A=
		if (chip->state =3D=3D FL_PM_SUSPENDED) {=0A=
			chip->state =3D FL_READY;=0A=
			map_write(map, CMD(0xF0), chip->start);=0A=
			wake_up(&chip->wq);=0A=
		}=0A=
		else=0A=
			printk(KERN_ERR "Argh. Chip not in PM_SUSPENDED state upon =
resume()\n");=0A=
=0A=
		mutex_unlock(&chip->mutex);=0A=
	}=0A=
}=0A=
=0A=
=0A=
/*=0A=
 * Ensure that the flash device is put back into read array mode before=0A=
 * unloading the driver or rebooting.  On some systems, rebooting while=0A=
 * the flash is in query/program/erase mode will prevent the CPU from=0A=
 * fetching the bootloader code, requiring a hard reset or power cycle.=0A=
 */=0A=
static int cfi_amdstd_reset(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	int i, ret;=0A=
	struct flchip *chip;=0A=
=0A=
	for (i =3D 0; i < cfi->numchips; i++) {=0A=
=0A=
		chip =3D &cfi->chips[i];=0A=
=0A=
		mutex_lock(&chip->mutex);=0A=
=0A=
		ret =3D get_chip(map, chip, chip->start, FL_SHUTDOWN);=0A=
		if (!ret) {=0A=
			map_write(map, CMD(0xF0), chip->start);=0A=
			chip->state =3D FL_SHUTDOWN;=0A=
			put_chip(map, chip, chip->start);=0A=
		}=0A=
=0A=
		mutex_unlock(&chip->mutex);=0A=
	}=0A=
=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
static int cfi_amdstd_reboot(struct notifier_block *nb, unsigned long =
val,=0A=
			       void *v)=0A=
{=0A=
	struct mtd_info *mtd;=0A=
=0A=
	mtd =3D container_of(nb, struct mtd_info, reboot_notifier);=0A=
	cfi_amdstd_reset(mtd);=0A=
	return NOTIFY_DONE;=0A=
}=0A=
=0A=
=0A=
static void cfi_amdstd_destroy(struct mtd_info *mtd)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	cfi_amdstd_reset(mtd);=0A=
	unregister_reboot_notifier(&mtd->reboot_notifier);=0A=
	kfree(cfi->cmdset_priv);=0A=
	kfree(cfi->cfiq);=0A=
	kfree(cfi);=0A=
	kfree(mtd->eraseregions);=0A=
}=0A=
=0A=
MODULE_LICENSE("GPL");=0A=
MODULE_AUTHOR("Crossnet Co. <info@crossnet.co.jp> et al.");=0A=
MODULE_DESCRIPTION("MTD chip driver for AMD/Fujitsu flash chips");=0A=
MODULE_ALIAS("cfi_cmdset_0006");=0A=
MODULE_ALIAS("cfi_cmdset_0701");=0A=

------=_NextPart_000_0B20_01CCB6CE.23C14A50
Content-Type: application/octet-stream;
	name="cmdset.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cmdset.diff"

15a16,17
>  * 25/09/2008 Christopher Moore: TopBottom fixup for many Macronix =
with CFI V1.0
>  *
19,21d20
<  *
<  * $Id: cfi_cmdset_0002.c,v 1.122 2005/11/07 11:14:22 gleixner Exp $
<  *
36c35
< #include <linux/mtd/compatmac.h>
---
> #include <linux/reboot.h>
59a59
> static int cfi_amdstd_reboot(struct notifier_block *, unsigned long, =
void *);
71,72c71,72
< static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, size_t =
len);
< static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, size_t =
len);
---
> static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, uint64_t =
len);
> static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t =
len);
137c137
< static void fixup_amd_bootblock(struct mtd_info *mtd, void* param)
---
> static void fixup_amd_bootblock(struct mtd_info *mtd)
146a147,173
>=20
> 		DEBUG(MTD_DEBUG_LEVEL1,
> 			"%s: JEDEC Vendor ID is 0x%02X Device ID is 0x%02X\n",
> 			map->name, cfi->mfr, cfi->id);
>=20
> 		/* AFAICS all 29LV400 with a bottom boot block have a device ID
> 		 * of 0x22BA in 16-bit mode and 0xBA in 8-bit mode.
> 		 * These were badly detected as they have the 0x80 bit set
> 		 * so treat them as a special case.
> 		 */
> 		if (((cfi->id =3D=3D 0xBA) || (cfi->id =3D=3D 0x22BA)) &&
>=20
> 			/* Macronix added CFI to their 2nd generation
> 			 * MX29LV400C B/T but AFAICS no other 29LV400 (AMD,
> 			 * Fujitsu, Spansion, EON, ESI and older Macronix)
> 			 * has CFI.
> 			 *
> 			 * Therefore also check the manufacturer.
> 			 * This reduces the risk of false detection due to
> 			 * the 8-bit device ID.
> 			 */
> 			(cfi->mfr =3D=3D CFI_MFR_MACRONIX)) {
> 			DEBUG(MTD_DEBUG_LEVEL1,
> 				"%s: Macronix MX29LV400C with bottom boot block"
> 				" detected\n", map->name);
> 			extp->TopBottom =3D 2;	/* bottom boot */
> 		} else
152a180,184
>=20
> 		DEBUG(MTD_DEBUG_LEVEL1,
> 			"%s: AMD CFI PRI V%c.%c has no boot block field;"
> 			" deduced %s from Device ID\n", map->name, major, minor,
> 			extp->TopBottom =3D=3D 2 ? "bottom" : "top");
157c189
< static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
---
> static void fixup_use_write_buffers(struct mtd_info *mtd)
168c200
< static void fixup_convert_atmel_pri(struct mtd_info *mtd, void *param)
---
> static void fixup_convert_atmel_pri(struct mtd_info *mtd)
181,184c213,228
< 	if (atmel_pri.BottomBoot)
< 		extp->TopBottom =3D 2;
< 	else
< 		extp->TopBottom =3D 3;
---
> 	/* Some chips got it backwards... */
> 	if (cfi->id =3D=3D AT49BV6416) {
> 		if (atmel_pri.BottomBoot)
> 			extp->TopBottom =3D 3;
> 		else
> 			extp->TopBottom =3D 2;
> 	} else {
> 		if (atmel_pri.BottomBoot)
> 			extp->TopBottom =3D 2;
> 		else
> 			extp->TopBottom =3D 3;
> 	}
>=20
> 	/* burst write mode not supported */
> 	cfi->cfiq->BufWriteTimeoutTyp =3D 0;
> 	cfi->cfiq->BufWriteTimeoutMax =3D 0;
187c231
< static void fixup_use_secsi(struct mtd_info *mtd, void *param)
---
> static void fixup_use_secsi(struct mtd_info *mtd)
194c238
< static void fixup_use_erase_chip(struct mtd_info *mtd, void *param)
---
> static void fixup_use_erase_chip(struct mtd_info *mtd)
209c253
< static void fixup_use_atmel_lock(struct mtd_info *mtd, void *param)
---
> static void fixup_use_atmel_lock(struct mtd_info *mtd)
213c257
< 	mtd->flags |=3D MTD_STUPID_LOCK;
---
> 	mtd->flags |=3D MTD_POWERUP_LOCK;
266c310
< 	printk(KERN_WARNING "%s: Bad 38VF640x CFI data; adjusting sector size =
from 64 to 8KiB\n", mtd->name);
---
> 	pr_warning("%s: Bad 38VF640x CFI data; adjusting sector size from 64 =
to 8KiB\n", mtd->name);
276c320
< 		printk(KERN_WARNING "%s: Bad S29GL064N CFI data, adjust from 64 to =
128 sectors\n", mtd->name);
---
> 		pr_warning("%s: Bad S29GL064N CFI data, adjust from 64 to 128 =
sectors\n", mtd->name);
287c331
< 		printk(KERN_WARNING "%s: Bad S29GL032N CFI data, adjust from 127 to =
63 sectors\n", mtd->name);
---
> 		pr_warning("%s: Bad S29GL032N CFI data, adjust from 127 to 63 =
sectors\n", mtd->name);
304a349
> 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri },
306c351,353
< 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock, NULL },
---
> 	{ CFI_MFR_AMD, CFI_ID_ANY, fixup_amd_bootblock },
> 	{ CFI_MFR_AMIC, CFI_ID_ANY, fixup_amd_bootblock },
> 	{ CFI_MFR_MACRONIX, CFI_ID_ANY, fixup_amd_bootblock },
308,313c355,360
< 	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi, NULL, },
< 	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi, NULL, },
< 	{ CFI_MFR_AMD, 0x0055, fixup_use_secsi, NULL, },
< 	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi, NULL, },
< 	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi, NULL, },
< 	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi, NULL, },
---
> 	{ CFI_MFR_AMD, 0x0050, fixup_use_secsi },
> 	{ CFI_MFR_AMD, 0x0053, fixup_use_secsi },
> 	{ CFI_MFR_AMD, 0x0055, fixup_use_secsi },
> 	{ CFI_MFR_AMD, 0x0056, fixup_use_secsi },
> 	{ CFI_MFR_AMD, 0x005C, fixup_use_secsi },
> 	{ CFI_MFR_AMD, 0x005F, fixup_use_secsi },
323c370
< 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },
---
> 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers },
325,326c372
< 	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },
< 	{ 0, 0, NULL, NULL }
---
> 	{ 0, 0, NULL }
329,332c375,378
< 	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },
< 	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock, NULL, },
< 	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },
< 	{ 0, 0, NULL, NULL }
---
> 	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock },
> 	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock },
> 	{ CFI_MFR_SST, SST49LF008A, fixup_use_fwh_lock },
> 	{ 0, 0, NULL }
341,343c387,389
< 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip, NULL },
< 	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock, NULL },
< 	{ 0, 0, NULL, NULL }
---
> 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_erase_chip },
> 	{ CFI_MFR_ATMEL, AT49BV6416, fixup_use_atmel_lock },
> 	{ 0, 0, NULL }
345a392
>=20
396a444
> 	mtd->writebufsize =3D cfi_interleave(cfi) << =
cfi->cfiq->MaxBufWriteSize;
397a446,450
> 	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): write buffer size %d\n",
> 		__func__, mtd->writebufsize);
>=20
> 	mtd->reboot_notifier.notifier_call =3D cfi_amdstd_reboot;
>=20
411c464,470
< 		if (extp->MajorVersion !=3D '1' ||
---
> 			/*
> 			 * Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3, 1.4
>  			 * see: Spec 1.3 =
http://cs.ozerki.net/zap/pub/axim-x5/docs/cfi_r20.pdf, page 19=20
>  			 *               =
http://www.spansion.com/Support/AppNotes/cfi_100_20011201.pdf
> 			 *      Spec 1.4 =
http://www.spansion.com/Support/AppNotes/CFI_Spec_AN_03.pdf, page 9
> 			 */
> 			if (extp->MajorVersion !=3D '1' ||
421c480,482
< 		}
---
>=20
> 			printk(KERN_INFO "  Amd/Fujitsu Extended Query version %c.%c.\n",
> 			       extp->MajorVersion, extp->MinorVersion);
435,437c496,499
< 			if ((bootloc !=3D 2) && (bootloc !=3D 3)) {
< 				printk(KERN_WARNING "%s: CFI does not contain boot "
< 				"bank location. Assuming top.\n", map->name);
---
> 			if ((bootloc < 2) || (bootloc > 5)) {
> 				printk(KERN_WARNING "%s: CFI contains unrecognised boot "
> 				       "bank location (%d). Assuming bottom.\n",
> 				       map->name, bootloc);
442c504
< 				printk(KERN_WARNING "%s: Swapping erase regions for broken CFI =
table.\n", map->name);
---
> 				printk(KERN_WARNING "%s: Swapping erase regions for top-boot CFI =
table.\n", map->name);
483a546,547
> struct mtd_info *cfi_cmdset_0006(struct map_info *map, int primary) =
__attribute__((alias("cfi_cmdset_0002")));
> struct mtd_info *cfi_cmdset_0701(struct map_info *map, int primary) =
__attribute__((alias("cfi_cmdset_0002")));
484a549,550
> EXPORT_SYMBOL_GPL(cfi_cmdset_0006);
> EXPORT_SYMBOL_GPL(cfi_cmdset_0701);
527,535d592
< #if 0
< 	// debug
< 	for (i=3D0; i<mtd->numeraseregions;i++){
< 		printk("%d: offset=3D0x%x,size=3D0x%x,blocks=3D%d\n",
< 		       i,mtd->eraseregions[i].offset,
< 		       mtd->eraseregions[i].erasesize,
< 		       mtd->eraseregions[i].numblocks);
< 	}
< #endif
537,540d593
< 	/* FIXME: erase-suspend-program is broken.  See
< 	   =
http://lists.infradead.org/pipermail/linux-mtd/2003-December/009001.html =
*/
< 	printk(KERN_NOTICE "cfi_cmdset_0002: Disabling erase-suspend-program =
due to code brokenness.\n");
<=20
541a595
> 	register_reboot_notifier(&mtd->reboot_notifier);
545,548c599,600
< 	if(mtd) {
< 		kfree(mtd->eraseregions);
< 		kfree(mtd);
< 	}
---
> 	kfree(mtd->eraseregions);
> 	kfree(mtd);
562,563c614,615
<  * correctly and is therefore not done	(particulary with interleaved =
chips
<  * as each chip must be checked independantly of the others).
---
>  * correctly and is therefore not done	(particularly with interleaved =
chips
>  * as each chip must be checked independently of the others).
586,587c638,639
<  * correctly and is therefore not done	(particulary with interleaved =
chips
<  * as each chip must be checked independantly of the others).
---
>  * correctly and is therefore not done	(particularly with interleaved =
chips
>  * as each chip must be checked independently of the others).
620d671
< 				spin_unlock(chip->mutex);
623c674
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
625c676
< 			spin_lock(chip->mutex);
---
> 			mutex_lock(&chip->mutex);
636,644c687,689
< 		if (mode =3D=3D FL_WRITING) /* FIXME: Erase-suspend-program appears =
broken. */
< 			goto sleep;
<=20
< 		if (!(   mode =3D=3D FL_READY
< 		      || mode =3D=3D FL_POINT
< 		      || !cfip
< 		      || (mode =3D=3D FL_WRITING && (cfip->EraseSuspend & 0x2))
< 		      || (mode =3D=3D FL_WRITING && (cfip->EraseSuspend & 0x1)
< 		    )))
---
> 		if (!cfip || !(cfip->EraseSuspend & (0x1|0x2)) ||
> 		    !(mode =3D=3D FL_READY || mode =3D=3D FL_POINT ||
> 		    (mode =3D=3D FL_WRITING && (cfip->EraseSuspend & 0x2))))
675c720
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
677c722
< 			spin_lock(chip->mutex);
---
> 			mutex_lock(&chip->mutex);
691a737,740
> 	case FL_SHUTDOWN:
> 		/* The machine is rebooting */
> 		return -EIO;
>=20
701c750
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
704c753
< 		spin_lock(chip->mutex);
---
> 		mutex_lock(&chip->mutex);
834c883
< 			asm volatile (".rep 8; nop; .endr");
---
> 			xip_iprefetch();
836,837c885,886
< 			spin_unlock(chip->mutex);
< 			asm volatile (".rep 8; nop; .endr");
---
> 			mutex_unlock(&chip->mutex);
> 			xip_iprefetch();
846c895
< 			spin_lock(chip->mutex);
---
> 			mutex_lock(&chip->mutex);
851c900
< 				spin_unlock(chip->mutex);
---
> 				mutex_unlock(&chip->mutex);
854c903
< 				spin_lock(chip->mutex);
---
> 				mutex_lock(&chip->mutex);
916c965
< 	spin_unlock(chip->mutex);  \
---
> 	mutex_unlock(&chip->mutex);  \
918c967
< 	spin_lock(chip->mutex);  \
---
> 	mutex_lock(&chip->mutex);  \
923c972
< 	spin_unlock(chip->mutex);  \
---
> 	mutex_unlock(&chip->mutex);  \
926c975
< 	spin_lock(chip->mutex);  \
---
> 	mutex_lock(&chip->mutex);  \
942c991
< 	spin_lock(chip->mutex);
---
> 	mutex_lock(&chip->mutex);
945c994
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
958c1007
< 	spin_unlock(chip->mutex);
---
> 	mutex_unlock(&chip->mutex);
1012c1061
< 	spin_lock(chip->mutex);
---
> 	mutex_lock(&chip->mutex);
1015,1017d1063
< #if 0
< 		printk(KERN_DEBUG "Waiting for chip to read, status =3D %d\n", =
chip->state);
< #endif
1021c1067
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
1025,1028d1070
< #if 0
< 		if(signal_pending(current))
< 			return -EINTR;
< #endif
1050c1092
< 	spin_unlock(chip->mutex);
---
> 	mutex_unlock(&chip->mutex);
1119c1161
< 	spin_lock(chip->mutex);
---
> 	mutex_lock(&chip->mutex);
1122c1164
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
1165c1207
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
1169c1211
< 			spin_lock(chip->mutex);
---
> 			mutex_lock(&chip->mutex);
1201c1243
< 	spin_unlock(chip->mutex);
---
> 	mutex_unlock(&chip->mutex);
1233c1275
< 		spin_lock(cfi->chips[chipnum].mutex);
---
> 		mutex_lock(&cfi->chips[chipnum].mutex);
1236,1238d1277
< #if 0
< 			printk(KERN_DEBUG "Waiting for chip to write, status =3D %d\n", =
cfi->chips[chipnum].state);
< #endif
1242c1281
< 			spin_unlock(cfi->chips[chipnum].mutex);
---
> 			mutex_unlock(&cfi->chips[chipnum].mutex);
1246,1249d1284
< #if 0
< 			if(signal_pending(current))
< 				return -EINTR;
< #endif
1256c1291
< 		spin_unlock(cfi->chips[chipnum].mutex);
---
> 		mutex_unlock(&cfi->chips[chipnum].mutex);
1311c1346
< 		spin_lock(cfi->chips[chipnum].mutex);
---
> 		mutex_lock(&cfi->chips[chipnum].mutex);
1314,1316d1348
< #if 0
< 			printk(KERN_DEBUG "Waiting for chip to write, status =3D %d\n", =
cfi->chips[chipnum].state);
< #endif
1320c1352
< 			spin_unlock(cfi->chips[chipnum].mutex);
---
> 			mutex_unlock(&cfi->chips[chipnum].mutex);
1324,1327d1355
< #if 0
< 			if(signal_pending(current))
< 				return -EINTR;
< #endif
1333c1361
< 		spin_unlock(cfi->chips[chipnum].mutex);
---
> 		mutex_unlock(&cfi->chips[chipnum].mutex);
1368c1396
< 	spin_lock(chip->mutex);
---
> 	mutex_lock(&chip->mutex);
1371c1399
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
1386d1413
< 	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, =
cfi->device_type, NULL);
1426c1453
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
1430c1457
< 			spin_lock(chip->mutex);
---
> 			mutex_lock(&chip->mutex);
1458c1485
< 	spin_unlock(chip->mutex);
---
> 	mutex_unlock(&chip->mutex);
1558c1585
< 	spin_lock(chip->mutex);
---
> 	mutex_lock(&chip->mutex);
1561c1588
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
1594c1621
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
1597c1624
< 			spin_lock(chip->mutex);
---
> 			mutex_lock(&chip->mutex);
1631c1658
< 	spin_unlock(chip->mutex);
---
> 	mutex_unlock(&chip->mutex);
1646c1673
< 	spin_lock(chip->mutex);
---
> 	mutex_lock(&chip->mutex);
1649c1676
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
1682c1709
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
1685c1712
< 			spin_lock(chip->mutex);
---
> 			mutex_lock(&chip->mutex);
1721c1748
< 	spin_unlock(chip->mutex);
---
> 	mutex_unlock(&chip->mutex);
1726c1753
< int cfi_amdstd_erase_varsize(struct mtd_info *mtd, struct erase_info =
*instr)
---
> static int cfi_amdstd_erase_varsize(struct mtd_info *mtd, struct =
erase_info *instr)
1773c1800
< 	spin_lock(chip->mutex);
---
> 	mutex_lock(&chip->mutex);
1799c1826
< 	spin_unlock(chip->mutex);
---
> 	mutex_unlock(&chip->mutex);
1809c1836
< 	spin_lock(chip->mutex);
---
> 	mutex_lock(&chip->mutex);
1827c1854
< 	spin_unlock(chip->mutex);
---
> 	mutex_unlock(&chip->mutex);
1831c1858
< static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, size_t =
len)
---
> static int cfi_atmel_lock(struct mtd_info *mtd, loff_t ofs, uint64_t =
len)
1836c1863
< static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, size_t =
len)
---
> static int cfi_atmel_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t =
len)
1855c1882
< 		spin_lock(chip->mutex);
---
> 		mutex_lock(&chip->mutex);
1869c1896
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
1873a1901
> 			set_current_state(TASK_UNINTERRUPTIBLE);
1876c1904
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
1891c1919
< 		spin_lock(chip->mutex);
---
> 		mutex_lock(&chip->mutex);
1897c1925
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
1913c1941
< 		spin_lock(chip->mutex);
---
> 		mutex_lock(&chip->mutex);
1933c1961
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
1942c1970
< 			spin_lock(chip->mutex);
---
> 			mutex_lock(&chip->mutex);
1948c1976
< 			spin_unlock(chip->mutex);
---
> 			mutex_unlock(&chip->mutex);
1967c1995
< 		spin_lock(chip->mutex);
---
> 		mutex_lock(&chip->mutex);
1977c2005,2036
< 		spin_unlock(chip->mutex);
---
> 		mutex_unlock(&chip->mutex);
> 	}
> }
>=20
>=20
> /*
>  * Ensure that the flash device is put back into read array mode =
before
>  * unloading the driver or rebooting.  On some systems, rebooting =
while
>  * the flash is in query/program/erase mode will prevent the CPU from
>  * fetching the bootloader code, requiring a hard reset or power =
cycle.
>  */
> static int cfi_amdstd_reset(struct mtd_info *mtd)
> {
> 	struct map_info *map =3D mtd->priv;
> 	struct cfi_private *cfi =3D map->fldrv_priv;
> 	int i, ret;
> 	struct flchip *chip;
>=20
> 	for (i =3D 0; i < cfi->numchips; i++) {
>=20
> 		chip =3D &cfi->chips[i];
>=20
> 		mutex_lock(&chip->mutex);
>=20
> 		ret =3D get_chip(map, chip, chip->start, FL_SHUTDOWN);
> 		if (!ret) {
> 			map_write(map, CMD(0xF0), chip->start);
> 			chip->state =3D FL_SHUTDOWN;
> 			put_chip(map, chip, chip->start);
> 		}
>=20
> 		mutex_unlock(&chip->mutex);
1978a2038,2050
>=20
> 	return 0;
> }
>=20
>=20
> static int cfi_amdstd_reboot(struct notifier_block *nb, unsigned long =
val,
> 			       void *v)
> {
> 	struct mtd_info *mtd;
>=20
> 	mtd =3D container_of(nb, struct mtd_info, reboot_notifier);
> 	cfi_amdstd_reset(mtd);
> 	return NOTIFY_DONE;
1980a2053
>=20
1985a2059,2060
> 	cfi_amdstd_reset(mtd);
> 	unregister_reboot_notifier(&mtd->reboot_notifier);
1994a2070,2071
> MODULE_ALIAS("cfi_cmdset_0006");
> MODULE_ALIAS("cfi_cmdset_0701");

------=_NextPart_000_0B20_01CCB6CE.23C14A50--
