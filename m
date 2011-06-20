Received: from if05-mail-sr04-mia.mta.terra.com ([208.84.243.61])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QYUuv-0008PV-1P
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 03:12:51 +0000
Message-ID: <F8730DE65A2E4EB3BC47D4C2DC317502@THOR>
From: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
To: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>,
	"Fabio Giovagnini" <fabio.giovagnini@aurion-tech.com>,
	<linux-mtd@lists.infradead.org>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com><AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com><AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com><201010221950.57594.fabio.giovagnini@aurion-tech.com>
	<DEF16A5C46894A5DB447E0F7C81A9D5F@THOR>
In-Reply-To: <DEF16A5C46894A5DB447E0F7C81A9D5F@THOR>
Subject: Re: [Help] SST39VF6401B Support
Date: Mon, 20 Jun 2011 00:12:14 -0300
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0792_01CC2EDE.B57E6A40"
Cc: yidong zhang <zhangyd6@gmail.com>, David.Woodhouse@intel.com,
	Wolfram Sang <w.sang@pengutronix.de>, yegorslists@googlemail.com,
	Guillaume LECERF <glecerf@gmail.com>, taliaferro62@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0792_01CC2EDE.B57E6A40
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 8bit

Hi,

  I'm attaching some other files to see if it helps finding what's wrong.

  Thanks in advance!

----- Original Message ----- 
From: "Flávio Silveira" <fggs@terra.com.br>
To: "Fabio Giovagnini" <fabio.giovagnini@aurion-tech.com>; 
<linux-mtd@lists.infradead.org>
Cc: "yidong zhang" <zhangyd6@gmail.com>; <David.Woodhouse@intel.com>; 
"Wolfram Sang" <w.sang@pengutronix.de>; <yegorslists@googlemail.com>; 
"Guillaume LECERF" <glecerf@gmail.com>; <taliaferro62@gmail.com>
Sent: Wednesday, June 15, 2011 9:55 PM
Subject: Re: [Help] SST39VF6401B Support


Hi guys,

  I've tested this patch on kernel 2.6.23 (actually it's called 2.6.24.111)
and didn't work.

  Below are my diffs and I can post original files as well, please help me
make it work!

Thanks in advance!

cfi_util.c

29a30,107
> int __xipram cfi_qry_present(struct map_info *map, __u32 base,
>         struct cfi_private *cfi)
> {
>  int osf = cfi->interleave * cfi->device_type; /* scale factor */
>  map_word val[3];
>  map_word qry[3];
>
>  qry[0] = cfi_build_cmd('Q', map, cfi);
>  qry[1] = cfi_build_cmd('R', map, cfi);
>  qry[2] = cfi_build_cmd('Y', map, cfi);
>
>  val[0] = map_read(map, base + osf*0x10);
>  val[1] = map_read(map, base + osf*0x11);
>  val[2] = map_read(map, base + osf*0x12);
>
>  if (!map_word_equal(map, qry[0], val[0]))
>   return 0;
>
>  if (!map_word_equal(map, qry[1], val[1]))
>   return 0;
>
>  if (!map_word_equal(map, qry[2], val[2]))
>   return 0;
>
>  return 1;  /* "QRY" found */
> }
> EXPORT_SYMBOL_GPL(cfi_qry_present);
>
> int __xipram cfi_qry_mode_on(uint32_t base, struct map_info *map,
>         struct cfi_private *cfi)
> {
>  cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
>  if (cfi_qry_present(map, base, cfi))
>   return 1;
>  /* QRY not found probably we deal with some odd CFI chips */
>  /* Some revisions of some old Intel chips? */
>  cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
>  if (cfi_qry_present(map, base, cfi))
>   return 1;
>  /* ST M29DW chips */
>  cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);
>  if (cfi_qry_present(map, base, cfi))
>   return 1;
>  /* some old SST chips, e.g. 39VF160x/39VF320x */
>  cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0xAA, 0x5555, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0x55, 0x2AAA, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0x98, 0x5555, base, map, cfi, cfi->device_type, NULL);
>  if (cfi_qry_present(map, base, cfi))
>   return 1;
>  /* SST 39VF640xB */
>  cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0xAA, 0x555, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0x55, 0x2AA, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);
>  if (cfi_qry_present(map, base, cfi))
>   return 1;
>  /* QRY not found */
>  return 0;
> }
> EXPORT_SYMBOL_GPL(cfi_qry_mode_on);
>
> void __xipram cfi_qry_mode_off(uint32_t base, struct map_info *map,
>           struct cfi_private *cfi)
> {
>  cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>  cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
>  /* M29W128G flashes require an additional reset command
>     when exit qry mode */
>  if ((cfi->mfr == CFI_MFR_ST) && (cfi->id == 0x227E || cfi->id == 0x7E))
>   cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
> }
> EXPORT_SYMBOL_GPL(cfi_qry_mode_off);
>

cfi_cmdset_0002.c

219a220,253
> static void fixup_old_sst_eraseregion(struct mtd_info *mtd)
> {
>    struct map_info *map = mtd->priv;
>    struct cfi_private *cfi = map->fldrv_priv;
>
>    /*
>     * These flashes report two seperate eraseblock regions based on the
>     * sector_erase-size and block_erase-size, although they both operate 
> on the
>     * same memory. This is not allowed according to CFI, so we just pick 
> the
>     * sector_erase-size.
>     */
>    cfi->cfiq->NumEraseRegions = 1;
> }
>
> static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
> {
>    struct map_info *map = mtd->priv;
>    struct cfi_private *cfi = map->fldrv_priv;
>
>    fixup_old_sst_eraseregion(mtd);
>
>    cfi->addr_unlock1 = 0x555;
>    cfi->addr_unlock2 = 0x2AA;
> }
>
> /* Used to fix CFI-Tables of chips without Extended Query Tables */
> static struct cfi_fixup cfi_nopri_fixup_table[] = {
>    { CFI_MFR_SST, 0x235C, fixup_sst39vf_rev_b, NULL, }, // SST39VF3202B
>    { CFI_MFR_SST, 0x235D, fixup_sst39vf_rev_b, NULL, }, // SST39VF3201B
>    { CFI_MFR_SST, 0x236C, fixup_sst39vf_rev_b, NULL, }, // SST39VF6402B
>    { CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // SST39VF6401B
>    { 0, 0, NULL, NULL }
> };
>


----- Original Message ----- 
From: "Fabio Giovagnini" <fabio.giovagnini@aurion-tech.com>
To: <linux-mtd@lists.infradead.org>
Cc: "yidong zhang" <zhangyd6@gmail.com>; <David.Woodhouse@intel.com>;
"Wolfram Sang" <w.sang@pengutronix.de>; <yegorslists@googlemail.com>;
"Guillaume LECERF" <glecerf@gmail.com>; <taliaferro62@gmail.com>
Sent: Friday, October 22, 2010 2:50 PM
Subject: Re: [Help] SST39VF6401B Support


Hi Guys,
As Gullelm remeber for sure, I used the jedec probe for such a flash in a
very
old 2.6 kernel.

Now I'm migrating to the newets one kernel.
Do you tell me how the kernel will be updated with the last mtd stuff
developed; or in place of it how to patch a standard kernel?

Thanks a  lot and sorry for my question if it is improper


In data venerdì 22 ottobre 2010 17:42:39, yidong zhang ha scritto:
: > On Fri, Oct 22, 2010 at 11:36 PM, Guillaume LECERF <glecerf@gmail.com>
wrote:
> > 2010/10/22 yidong zhang <zhangyd6@gmail.com>:
> >>> Could you try setting cif->cfiq->EraseRegionInfo[0] to 0x02003FF in
> >>> fixup_sst39vf_rev_b() ?
> >>
> >> Hi
> >>  how about this attached patch.
> >
> > If it works for you, I'll send a patch series for SST 39VF640xB and
> > 38VF640x, because both chips needs 0x50 as erase command.
>
> Sorry, i cannot test it right now.  I will sent the result as soon as i
> can.
>
> > --
> > Guillaume LECERF
> > GeeXboX developer - www.geexbox.org
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ing. Fabio Giovagnini

Aurion s.r.l.
P.I e C.F.
00885711200
skype: aurion.giovagnini
Tel. +39.051.594.78.24
Cell. +39.335.83.50.919
www.aurion-tech.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

------=_NextPart_000_0792_01CC2EDE.B57E6A40
Content-Type: application/octet-stream;
	name="cfi_cmdset_0002.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cfi_cmdset_0002.c"

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
#define MANUFACTURER_AMD	0x0001=0A=
#define MANUFACTURER_ATMEL	0x001F=0A=
#define MANUFACTURER_SST	0x00BF=0A=
#define SST49LF004B	        0x0060=0A=
#define SST49LF040B	        0x0050=0A=
#define SST49LF008A		0x005a=0A=
#define AT49BV6416		0x00d6=0A=
#define MANUFACTURER_SAMSUNG    0x00ec=0A=
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
	 * These flashes report two seperate eraseblock regions based on the=0A=
	 * sector_erase-size and block_erase-size, although they both operate =
on the=0A=
	 * same memory. This is not allowed according to CFI, so we just pick =
the=0A=
	 * sector_erase-size.=0A=
	 */=0A=
	cfi->cfiq->NumEraseRegions =3D 1;=0A=
}=0A=
=0A=
static void fixup_sst39vf(struct mtd_info *mtd, void *param)=0A=
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
static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)=0A=
{=0A=
	struct map_info *map =3D mtd->priv;=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
=0A=
	fixup_old_sst_eraseregion(mtd);=0A=
=0A=
	cfi->addr_unlock1 =3D 0x555;=0A=
	cfi->addr_unlock2 =3D 0x2AA;=0A=
}=0A=
=0A=
/* Used to fix CFI-Tables of chips without Extended Query Tables */=0A=
static struct cfi_fixup cfi_nopri_fixup_table[] =3D {=0A=
	{ MANUFACTURER_SST, 0x234A, fixup_sst39vf, NULL, }, // SST39VF1602=0A=
	{ MANUFACTURER_SST, 0x234B, fixup_sst39vf, NULL, }, // SST39VF1601=0A=
	{ MANUFACTURER_SST, 0x235A, fixup_sst39vf, NULL, }, // SST39VF3202=0A=
	{ MANUFACTURER_SST, 0x235B, fixup_sst39vf, NULL, }, // SST39VF3201=0A=
	{ MANUFACTURER_SST, 0x235C, fixup_sst39vf_rev_b, NULL, }, // =
SST39VF3202B=0A=
	{ MANUFACTURER_SST, 0x235D, fixup_sst39vf_rev_b, NULL, }, // =
SST39VF3201B=0A=
	{ MANUFACTURER_SST, 0x236C, fixup_sst39vf_rev_b, NULL, }, // =
SST39VF6402B=0A=
	{ MANUFACTURER_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // =
SST39VF6401B=0A=
	{ 0, 0, NULL, NULL }=0A=
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
#if !FORCE_WORD_WRITE=0A=
	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL, },=0A=
#endif=0A=
	{ CFI_MFR_ATMEL, CFI_ID_ANY, fixup_convert_atmel_pri, NULL },=0A=
	{ 0, 0, NULL, NULL }=0A=
};=0A=
static struct cfi_fixup jedec_fixup_table[] =3D {=0A=
	{ MANUFACTURER_SST, SST49LF004B, fixup_use_fwh_lock, NULL, },=0A=
	{ MANUFACTURER_SST, SST49LF040B, fixup_use_fwh_lock, NULL, },=0A=
	{ MANUFACTURER_SST, SST49LF008A, fixup_use_fwh_lock, NULL, },=0A=
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
		/*=0A=
		 * It's a real CFI chip, not one for which the probe=0A=
		 * routine faked a CFI structure. So we read the feature=0A=
		 * table from it.=0A=
		 */=0A=
		__u16 adr =3D primary?cfi->cfiq->P_ADR:cfi->cfiq->A_ADR;=0A=
		struct cfi_pri_amdstd *extp;=0A=
=0A=
		extp =3D (struct cfi_pri_amdstd*)cfi_read_pri(map, adr, sizeof(*extp), =
"Amd/Fujitsu");=0A=
		if (!extp) {=0A=
			kfree(mtd);=0A=
			return NULL;=0A=
		}=0A=
=0A=
		if (extp->MajorVersion !=3D '1' ||=0A=
		  (extp->MinorVersion < '0' || extp->MinorVersion > '4')) {=0A=
				if (cfi->mfr =3D=3D MANUFACTURER_SAMSUNG &&=0A=
				  (extp->MajorVersion =3D=3D '3' && extp->MinorVersion =3D=3D '3')) {=0A=
					printk(KERN_NOTICE "  Newer Samsung flash detected, "=0A=
					       "should be compatibile with Amd/Fujitsu.\n");=0A=
				}=0A=
				else if (cfi->mfr =3D=3D MANUFACTURER_SAMSUNG && extp->MajorVersion =
=3D=3D '0') {=0A=
					printk(KERN_NOTICE "  Newer Samsung flash detected, "=0A=
					       "should be compatibile with Amd/Fujitsu.\n");=0A=
					switch (cfi->id) {=0A=
						case 0x257e:=0A=
						case 0x22e2:=0A=
						extp->MajorVersion =3D '1';=0A=
						break;=0A=
					}=0A=
				}=0A=
				else {=0A=
					printk(KERN_ERR "  Unknown Amd/Fujitsu Extended Query "=0A=
				       "version %c.%c.\n",  extp->MajorVersion,=0A=
				       extp->MinorVersion);=0A=
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
=0A=
		cfi_fixup(mtd, cfi_nopri_fixup_table);=0A=
=0A=
		if (!cfi->addr_unlock1 || !cfi->addr_unlock2) {=0A=
		kfree(mtd);=0A=
		return NULL;=0A=
		}=0A=
		/* Modify the unlock address if we are in compatibility mode */=0A=
		if (	/* x16 in x8 mode */=0A=
			((cfi->device_type =3D=3D CFI_DEVICETYPE_X8) &&=0A=
				(cfi->cfiq->InterfaceDesc =3D=3D 2)) ||=0A=
			/* x32 in x16 mode */=0A=
			((cfi->device_type =3D=3D CFI_DEVICETYPE_X16) &&=0A=
				(cfi->cfiq->InterfaceDesc =3D=3D 4)))=0A=
		{=0A=
			cfi->addr_unlock1 =3D 0xaaa;=0A=
			cfi->addr_unlock2 =3D 0x555;=0A=
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
				map_write(map, CMD(0x30), chip->in_progress_block_addr);=0A=
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
		map_write(map, CMD(0x30), chip->in_progress_block_addr);=0A=
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
			map_write(map, CMD(0x30), adr);=0A=
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
	map_write(map, CMD(0x30), adr);=0A=
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

------=_NextPart_000_0792_01CC2EDE.B57E6A40
Content-Type: application/octet-stream;
	name="cfi_util.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cfi_util.c"

/*
 * Common Flash Interface support:
 *   Generic utility functions not dependant on command set
 *
 * Copyright (C) 2002 Red Hat
 * Copyright (C) 2003 STMicroelectronics Limited
 *
 * This code is covered by the GPL.
 *
 * $Id: cfi_util.c,v 1.10 2005/11/07 11:14:23 gleixner Exp $
 *
 */

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <asm/io.h>
#include <asm/byteorder.h>

#include <linux/errno.h>
#include <linux/slab.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/mtd/xip.h>
#include <linux/mtd/mtd.h>
#include <linux/mtd/map.h>
#include <linux/mtd/cfi.h>
#include <linux/mtd/compatmac.h>

int __xipram cfi_qry_present(struct map_info *map, __u32 base,
			     struct cfi_private *cfi)
{
	int osf =3D cfi->interleave * cfi->device_type;	/* scale factor */
	map_word val[3];
	map_word qry[3];

	qry[0] =3D cfi_build_cmd('Q', map, cfi);
	qry[1] =3D cfi_build_cmd('R', map, cfi);
	qry[2] =3D cfi_build_cmd('Y', map, cfi);

	val[0] =3D map_read(map, base + osf*0x10);
	val[1] =3D map_read(map, base + osf*0x11);
	val[2] =3D map_read(map, base + osf*0x12);

	if (!map_word_equal(map, qry[0], val[0]))
		return 0;

	if (!map_word_equal(map, qry[1], val[1]))
		return 0;

	if (!map_word_equal(map, qry[2], val[2]))
		return 0;

	return 1; 	/* "QRY" found */
}
EXPORT_SYMBOL_GPL(cfi_qry_present);

int __xipram cfi_qry_mode_on(uint32_t base, struct map_info *map,
			     struct cfi_private *cfi)
{
	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
	if (cfi_qry_present(map, base, cfi))
		return 1;
	/* QRY not found probably we deal with some odd CFI chips */
	/* Some revisions of some old Intel chips? */
	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
	if (cfi_qry_present(map, base, cfi))
		return 1;
	/* ST M29DW chips */
	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);
	if (cfi_qry_present(map, base, cfi))
		return 1;
	/* some old SST chips, e.g. 39VF160x/39VF320x */
	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0xAA, 0x5555, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x55, 0x2AAA, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x98, 0x5555, base, map, cfi, cfi->device_type, NULL);
	if (cfi_qry_present(map, base, cfi))
		return 1;
	/* SST 39VF640xB */
	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0xAA, 0x555, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x55, 0x2AA, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);
	if (cfi_qry_present(map, base, cfi))
		return 1;
	/* QRY not found */
	return 0;
}
EXPORT_SYMBOL_GPL(cfi_qry_mode_on);

void __xipram cfi_qry_mode_off(uint32_t base, struct map_info *map,
			       struct cfi_private *cfi)
{
	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
	/* M29W128G flashes require an additional reset command
	   when exit qry mode */
	if ((cfi->mfr =3D=3D CFI_MFR_ST) && (cfi->id =3D=3D 0x227E || cfi->id =
=3D=3D 0x7E))
		cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
}
EXPORT_SYMBOL_GPL(cfi_qry_mode_off);

struct cfi_extquery *
__xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const =
char* name)
{
	struct cfi_private *cfi =3D map->fldrv_priv;
	__u32 base =3D 0; // cfi->chips[0].start;
	int ofs_factor =3D cfi->interleave * cfi->device_type;
	int i;
	struct cfi_extquery *extp =3D NULL;

	printk(" %s Extended Query Table at 0x%4.4X\n", name, adr);
	if (!adr)
		goto out;

	extp =3D kmalloc(size, GFP_KERNEL);
	if (!extp) {
		printk(KERN_ERR "Failed to allocate memory\n");
		goto out;
	}

#ifdef CONFIG_MTD_XIP
	local_irq_disable();
#endif

	/* Switch it into Query Mode */
	cfi_qry_mode_on(base, map, cfi);
	/* Read in the Extended Query Table */
	for (i=3D0; i<size; i++) {
		((unsigned char *)extp)[i] =3D
			cfi_read_query(map, base+((adr+i)*ofs_factor));
	}

	/* Make sure it returns to read mode */
	cfi_qry_mode_off(base, map, cfi);

#ifdef CONFIG_MTD_XIP
	(void) map_read(map, base);
	asm volatile (".rep 8; nop; .endr");
	local_irq_enable();
#endif

 out:	return extp;
}

EXPORT_SYMBOL(cfi_read_pri);

void cfi_fixup(struct mtd_info *mtd, struct cfi_fixup *fixups)
{
	struct map_info *map =3D mtd->priv;
	struct cfi_private *cfi =3D map->fldrv_priv;
	struct cfi_fixup *f;

	for (f=3Dfixups; f->fixup; f++) {
		if (((f->mfr =3D=3D CFI_MFR_ANY) || (f->mfr =3D=3D cfi->mfr)) &&
		    ((f->id  =3D=3D CFI_ID_ANY)  || (f->id  =3D=3D cfi->id))) {
			f->fixup(mtd, f->param);
		}
	}
}

EXPORT_SYMBOL(cfi_fixup);

int cfi_varsize_frob(struct mtd_info *mtd, varsize_frob_t frob,
				     loff_t ofs, size_t len, void *thunk)
{
	struct map_info *map =3D mtd->priv;
	struct cfi_private *cfi =3D map->fldrv_priv;
	unsigned long adr;
	int chipnum, ret =3D 0;
	int i, first;
	struct mtd_erase_region_info *regions =3D mtd->eraseregions;

	if (ofs > mtd->size)
		return -EINVAL;

	if ((len + ofs) > mtd->size)
		return -EINVAL;

	/* Check that both start and end of the requested erase are
	 * aligned with the erasesize at the appropriate addresses.
	 */

	i =3D 0;

	/* Skip all erase regions which are ended before the start of
	   the requested erase. Actually, to save on the calculations,
	   we skip to the first erase region which starts after the
	   start of the requested erase, and then go back one.
	*/

	while (i < mtd->numeraseregions && ofs >=3D regions[i].offset)
	       i++;
	i--;

	/* OK, now i is pointing at the erase region in which this
	   erase request starts. Check the start of the requested
	   erase range is aligned with the erase size which is in
	   effect here.
	*/

	if (ofs & (regions[i].erasesize-1))
		return -EINVAL;

	/* Remember the erase region we start on */
	first =3D i;

	/* Next, check that the end of the requested erase is aligned
	 * with the erase region at that address.
	 */

	while (i<mtd->numeraseregions && (ofs + len) >=3D regions[i].offset)
		i++;

	/* As before, drop back one to point at the region in which
	   the address actually falls
	*/
	i--;

	if ((ofs + len) & (regions[i].erasesize-1))
		return -EINVAL;

	chipnum =3D ofs >> cfi->chipshift;
	adr =3D ofs - (chipnum << cfi->chipshift);

	i=3Dfirst;

	while(len) {
		int size =3D regions[i].erasesize;

		ret =3D (*frob)(map, &cfi->chips[chipnum], adr, size, thunk);

		if (ret)
			return ret;

		adr +=3D size;
		ofs +=3D size;
		len -=3D size;

		if (ofs =3D=3D regions[i].offset + size * regions[i].numblocks)
			i++;

		if (adr >> cfi->chipshift) {
			adr =3D 0;
			chipnum++;

			if (chipnum >=3D cfi->numchips)
			break;
		}
	}

	return 0;
}

EXPORT_SYMBOL(cfi_varsize_frob);

MODULE_LICENSE("GPL");

------=_NextPart_000_0792_01CC2EDE.B57E6A40
Content-Type: application/octet-stream;
	name="gen_probe.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="gen_probe.c"

/*=0A=
 * Routines common to all CFI-type probes.=0A=
 * (C) 2001-2003 Red Hat, Inc.=0A=
 * GPL'd=0A=
 * $Id: gen_probe.c,v 1.24 2005/11/07 11:14:23 gleixner Exp $=0A=
 */=0A=
=0A=
#include <linux/kernel.h>=0A=
#include <linux/slab.h>=0A=
#include <linux/module.h>=0A=
#include <linux/mtd/mtd.h>=0A=
#include <linux/mtd/map.h>=0A=
#include <linux/mtd/cfi.h>=0A=
#include <linux/mtd/gen_probe.h>=0A=
=0A=
static struct mtd_info *check_cmd_set(struct map_info *, int);=0A=
static struct cfi_private *genprobe_ident_chips(struct map_info *map,=0A=
						struct chip_probe *cp);=0A=
static int genprobe_new_chip(struct map_info *map, struct chip_probe *cp,=0A=
			     struct cfi_private *cfi);=0A=
=0A=
struct mtd_info *mtd_do_chip_probe(struct map_info *map, struct =
chip_probe *cp)=0A=
{=0A=
	struct mtd_info *mtd =3D NULL;=0A=
	struct cfi_private *cfi;=0A=
=0A=
	/* First probe the map to see if we have CFI stuff there. */=0A=
	cfi =3D genprobe_ident_chips(map, cp);=0A=
=0A=
	if (!cfi)=0A=
		return NULL;=0A=
=0A=
	map->fldrv_priv =3D cfi;=0A=
	/* OK we liked it. Now find a driver for the command set it talks */=0A=
=0A=
	mtd =3D check_cmd_set(map, 1); /* First the primary cmdset */=0A=
	if (!mtd)=0A=
		mtd =3D check_cmd_set(map, 0); /* Then the secondary */=0A=
=0A=
	if (mtd) {=0A=
		if (mtd->size > map->size) {=0A=
			printk(KERN_WARNING "Reducing visibility of %ldKiB chip to %ldKiB\n",=0A=
			       (unsigned long)mtd->size >> 10,=0A=
			       (unsigned long)map->size >> 10);=0A=
			mtd->size =3D map->size;=0A=
		}=0A=
		return mtd;=0A=
	}=0A=
=0A=
	printk(KERN_WARNING"gen_probe: No supported Vendor Command Set =
found\n");=0A=
=0A=
	kfree(cfi->cfiq);=0A=
	kfree(cfi);=0A=
	map->fldrv_priv =3D NULL;=0A=
	return NULL;=0A=
}=0A=
EXPORT_SYMBOL(mtd_do_chip_probe);=0A=
=0A=
=0A=
static struct cfi_private *genprobe_ident_chips(struct map_info *map, =
struct chip_probe *cp)=0A=
{=0A=
	struct cfi_private cfi;=0A=
	struct cfi_private *retcfi;=0A=
	unsigned long *chip_map;=0A=
	int i, j, mapsize;=0A=
	int max_chips;=0A=
=0A=
	memset(&cfi, 0, sizeof(cfi));=0A=
=0A=
	/* Call the probetype-specific code with all permutations of=0A=
	   interleave and device type, etc. */=0A=
	if (!genprobe_new_chip(map, cp, &cfi)) {=0A=
		/* The probe didn't like it */=0A=
		printk(KERN_DEBUG "%s: Found no %s device at location zero\n",=0A=
		       cp->name, map->name);=0A=
		return NULL;=0A=
	}=0A=
=0A=
#if 0 /* Let the CFI probe routine do this sanity check. The Intel and =
AMD=0A=
	 probe routines won't ever return a broken CFI structure anyway,=0A=
	 because they make them up themselves.=0A=
      */=0A=
	if (cfi.cfiq->NumEraseRegions =3D=3D 0) {=0A=
		printk(KERN_WARNING "Number of erase regions is zero\n");=0A=
		kfree(cfi.cfiq);=0A=
		return NULL;=0A=
	}=0A=
#endif=0A=
	cfi.chipshift =3D cfi.cfiq->DevSize;=0A=
=0A=
	if (cfi_interleave_is_1(&cfi)) {=0A=
		;=0A=
	} else if (cfi_interleave_is_2(&cfi)) {=0A=
		cfi.chipshift++;=0A=
	} else if (cfi_interleave_is_4((&cfi))) {=0A=
		cfi.chipshift +=3D 2;=0A=
	} else if (cfi_interleave_is_8(&cfi)) {=0A=
		cfi.chipshift +=3D 3;=0A=
	} else {=0A=
		BUG();=0A=
	}=0A=
=0A=
	cfi.numchips =3D 1;=0A=
=0A=
	/*=0A=
	 * Allocate memory for bitmap of valid chips.=0A=
	 * Align bitmap storage size to full byte.=0A=
	 */=0A=
	max_chips =3D map->size >> cfi.chipshift;=0A=
	if (!max_chips) {=0A=
		printk(KERN_WARNING "NOR chip too large to fit in mapping. Attempting =
to cope...\n");=0A=
		max_chips =3D 1;=0A=
	}=0A=
=0A=
	mapsize =3D (max_chips + BITS_PER_LONG-1) / BITS_PER_LONG;=0A=
	chip_map =3D kzalloc(mapsize, GFP_KERNEL);=0A=
	if (!chip_map) {=0A=
		printk(KERN_WARNING "%s: kmalloc failed for CFI chip map\n", =
map->name);=0A=
		kfree(cfi.cfiq);=0A=
		return NULL;=0A=
	}=0A=
=0A=
	set_bit(0, chip_map); /* Mark first chip valid */=0A=
=0A=
	/*=0A=
	 * Now probe for other chips, checking sensibly for aliases while=0A=
	 * we're at it. The new_chip probe above should have let the first=0A=
	 * chip in read mode.=0A=
	 */=0A=
=0A=
	for (i =3D 1; i < max_chips; i++) {=0A=
		cp->probe_chip(map, i << cfi.chipshift, chip_map, &cfi);=0A=
	}=0A=
=0A=
	/*=0A=
	 * Now allocate the space for the structures we need to return to=0A=
	 * our caller, and copy the appropriate data into them.=0A=
	 */=0A=
=0A=
	retcfi =3D kmalloc(sizeof(struct cfi_private) + cfi.numchips * =
sizeof(struct flchip), GFP_KERNEL);=0A=
=0A=
	if (!retcfi) {=0A=
		printk(KERN_WARNING "%s: kmalloc failed for CFI private structure\n", =
map->name);=0A=
		kfree(cfi.cfiq);=0A=
		kfree(chip_map);=0A=
		return NULL;=0A=
	}=0A=
=0A=
	memcpy(retcfi, &cfi, sizeof(cfi));=0A=
	memset(&retcfi->chips[0], 0, sizeof(struct flchip) * cfi.numchips);=0A=
=0A=
	for (i =3D 0, j =3D 0; (j < cfi.numchips) && (i < max_chips); i++) {=0A=
		if(test_bit(i, chip_map)) {=0A=
			struct flchip *pchip =3D &retcfi->chips[j++];=0A=
=0A=
			pchip->start =3D (i << cfi.chipshift);=0A=
			pchip->state =3D FL_READY;=0A=
			init_waitqueue_head(&pchip->wq);=0A=
			spin_lock_init(&pchip->_spinlock);=0A=
			pchip->mutex =3D &pchip->_spinlock;=0A=
		}=0A=
	}=0A=
=0A=
	kfree(chip_map);=0A=
	return retcfi;=0A=
}=0A=
=0A=
=0A=
static int genprobe_new_chip(struct map_info *map, struct chip_probe *cp,=0A=
			     struct cfi_private *cfi)=0A=
{=0A=
	int min_chips =3D (map_bankwidth(map)/4?:1); /* At most 4-bytes wide. */=0A=
	int max_chips =3D map_bankwidth(map); /* And minimum 1 */=0A=
	int nr_chips, type;=0A=
=0A=
	for (nr_chips =3D max_chips; nr_chips >=3D min_chips; nr_chips >>=3D 1) =
{=0A=
=0A=
		if (!cfi_interleave_supported(nr_chips))=0A=
		    continue;=0A=
=0A=
		cfi->interleave =3D nr_chips;=0A=
=0A=
		/* Minimum device size. Don't look for one 8-bit device=0A=
		   in a 16-bit bus, etc. */=0A=
		type =3D map_bankwidth(map) / nr_chips;=0A=
=0A=
		for (; type <=3D CFI_DEVICETYPE_X32; type<<=3D1) {=0A=
			cfi->device_type =3D type;=0A=
=0A=
			if (cp->probe_chip(map, 0, NULL, cfi))=0A=
				return 1;=0A=
		}=0A=
	}=0A=
	return 0;=0A=
}=0A=
=0A=
typedef struct mtd_info *cfi_cmdset_fn_t(struct map_info *, int);=0A=
=0A=
extern cfi_cmdset_fn_t cfi_cmdset_0001;=0A=
extern cfi_cmdset_fn_t cfi_cmdset_0002;=0A=
extern cfi_cmdset_fn_t cfi_cmdset_0020;=0A=
=0A=
static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,=0A=
						  int primary)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	__u16 type =3D primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;=0A=
#ifdef CONFIG_MODULES=0A=
	char probename[16+sizeof(MODULE_SYMBOL_PREFIX)];=0A=
	cfi_cmdset_fn_t *probe_function;=0A=
=0A=
	sprintf(probename, MODULE_SYMBOL_PREFIX "cfi_cmdset_%4.4X", type);=0A=
=0A=
	probe_function =3D __symbol_get(probename);=0A=
	if (!probe_function) {=0A=
		request_module(probename + sizeof(MODULE_SYMBOL_PREFIX) - 1);=0A=
		probe_function =3D __symbol_get(probename);=0A=
	}=0A=
=0A=
	if (probe_function) {=0A=
		struct mtd_info *mtd;=0A=
=0A=
		mtd =3D (*probe_function)(map, primary);=0A=
		/* If it was happy, it'll have increased its own use count */=0A=
		symbol_put_addr(probe_function);=0A=
		return mtd;=0A=
	}=0A=
#endif=0A=
	printk(KERN_NOTICE "Support for command set %04X not present\n", type);=0A=
=0A=
	return NULL;=0A=
}=0A=
=0A=
static struct mtd_info *check_cmd_set(struct map_info *map, int primary)=0A=
{=0A=
	struct cfi_private *cfi =3D map->fldrv_priv;=0A=
	__u16 type =3D primary?cfi->cfiq->P_ID:cfi->cfiq->A_ID;=0A=
=0A=
	if (type =3D=3D P_ID_NONE || type =3D=3D P_ID_RESERVED)=0A=
		return NULL;=0A=
=0A=
	switch(type){=0A=
		/* We need these for the !CONFIG_MODULES case,=0A=
		   because symbol_get() doesn't work there */=0A=
#ifdef CONFIG_MTD_CFI_INTELEXT=0A=
	case 0x0001:=0A=
	case 0x0003:=0A=
	case 0x0200:=0A=
		return cfi_cmdset_0001(map, primary);=0A=
#endif=0A=
#ifdef CONFIG_MTD_CFI_AMDSTD=0A=
	case 0x0002:=0A=
	case 0x0701:=0A=
		return cfi_cmdset_0002(map, primary);=0A=
#endif=0A=
#ifdef CONFIG_MTD_CFI_STAA=0A=
	case 0x0020:=0A=
		return cfi_cmdset_0020(map, primary);=0A=
#endif=0A=
	default:=0A=
		return cfi_cmdset_unknown(map, primary);=0A=
	}=0A=
}=0A=
=0A=
MODULE_LICENSE("GPL");=0A=
MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");=0A=
MODULE_DESCRIPTION("Helper routines for flash chip probe code");=0A=

------=_NextPart_000_0792_01CC2EDE.B57E6A40--
