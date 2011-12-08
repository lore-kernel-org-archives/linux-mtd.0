Received: from if01-mail-sr05-mia.mta.terra.com ([208.84.243.22])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RYlQJ-0003bE-QW
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2011 21:22:44 +0000
Received: from 1p8.tpn.terra.com (1p8.tpn.terra.com [10.235.200.37])
 by mail-sr05-mia.tpn.terra.com (Postfix) with ESMTP id 93C90700005E
 for <linux-mtd@lists.infradead.org>; Thu,  8 Dec 2011 21:22:30 +0000 (UTC)
Received: from THOR (unknown [177.18.197.19]) (authenticated user fggs)
 by 1p8.tpn.terra.com (Postfix) with ESMTPA id EC705A00000F1
 for <linux-mtd@lists.infradead.org>; Thu,  8 Dec 2011 21:22:28 +0000 (UTC)
Message-ID: <40BE7F31D03F42C2BE4F0E68243C6A8C@THOR>
From: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
To: <linux-mtd@lists.infradead.org>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com><AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com><AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com><201010221950.57594.fabio.giovagnini@aurion-tech.com><DEF16A5C46894A5DB447E0F7C81A9D5F@THOR><F8730DE65A2E4EB3BC47D4C2DC317502@THOR><BANLkTikxfRCFvijPt=pxZ8AyVL2o_Vw8ZA@mail.gmail.com>
 <91E44F522C8645C9B6F1B4063D33779C@THOR>
In-Reply-To: <91E44F522C8645C9B6F1B4063D33779C@THOR>
Subject: Re: [Help] SST39VF6401B Support
Date: Thu, 8 Dec 2011 19:21:57 -0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_087B_01CCB5DE.A70FF5F0"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_087B_01CCB5DE.A70FF5F0
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 8bit

Hi,

  I've backported every single patch for this chip, I don't know what else I 
can do, where to look at.

  The error I'm getting is: pflash: cfi_probe failed

  Attached is the map file which I found this message error.

  Here's some parts of the code, perhaps I need to modify something on this 
file...

static struct mtd_info *bcm947xx_mtd;

......................................

struct map_info bcm947xx_map = {
 name: "Physically mapped flash",
 size: WINDOW_SIZE,
 bankwidth: BUSWIDTH,
 phys: WINDOW_ADDR,
};

....................

  if ((bcm947xx_mtd = do_map_probe("cfi_probe", &bcm947xx_map)) == NULL) {
  printk(KERN_ERR "pflash: cfi_probe failed\n");
  ret = -ENXIO;
  goto fail;
 }

  I would really appreciate any help, I mean really!

Thanks in advance!

----- Original Message ----- 
From: "Flávio Silveira" <fggs@terra.com.br>
To: "yidong zhang" <zhangyd6@gmail.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, June 20, 2011 9:55 PM
Subject: Re: [Help] SST39VF6401B Support


Hi,

  Thanks for your help, I'll see if I can compile it with more debug and see
what I'm doing wrong.

  Biggest problem is this kernel that is old and I can't update, but let's
hope I can make it work!


----- Original Message ----- 
From: "yidong zhang" <zhangyd6@gmail.com>
To: "Flávio Silveira" <fggs@terra.com.br>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, June 20, 2011 12:36 AM
Subject: Re: [Help] SST39VF6401B Support


Hi
    Please see the datasheet for the erase command. Some uses 0x50
rather than 0x30, and the erase size are different. I think you may
need porting the code  listed bellow to your driver. It has been a
long time since i used this flash, so i don't remember it very well.
Using the log may help you a lot.

 static void fixup_sst39vf_rev_b(struct mtd_info *mtd)
286 {
287         struct map_info *map = mtd->priv;
288         struct cfi_private *cfi = map->fldrv_priv;
289
290         fixup_old_sst_eraseregion(mtd);
291
292         cfi->addr_unlock1 = 0x555;
293         cfi->addr_unlock2 = 0x2AA;
294
295         cfi->sector_erase_cmd = CMD(0x50);
296 }
297
298 static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd)
299 {
300         struct map_info *map = mtd->priv;
301         struct cfi_private *cfi = map->fldrv_priv;
302
303         fixup_sst39vf_rev_b(mtd);
304
305         /*
306          * CFI reports 1024 sectors (0x03ff+1) of 64KBytes
(0x0100*256) where
307          * it should report a size of 8KBytes (0x0020*256).
308          */
309         cfi->cfiq->EraseRegionInfo[0] = 0x002003ff;
310         pr_warning("%s: Bad 38VF640x CFI data; adjusting sector
size from 64 to 8KiB\n", mtd->name);
311 }
312


2011/6/20 Flávio Silveira <fggs@terra.com.br>:
> Hi,
>
> I'm attaching some other files to see if it helps finding what's wrong.
>
> Thanks in advance!
>
> ----- Original Message ----- From: "Flávio Silveira" <fggs@terra.com.br>
> To: "Fabio Giovagnini" <fabio.giovagnini@aurion-tech.com>;
> <linux-mtd@lists.infradead.org>
> Cc: "yidong zhang" <zhangyd6@gmail.com>; <David.Woodhouse@intel.com>;
> "Wolfram Sang" <w.sang@pengutronix.de>; <yegorslists@googlemail.com>;
> "Guillaume LECERF" <glecerf@gmail.com>; <taliaferro62@gmail.com>
> Sent: Wednesday, June 15, 2011 9:55 PM
> Subject: Re: [Help] SST39VF6401B Support
>
>
> Hi guys,
>
> I've tested this patch on kernel 2.6.23 (actually it's called 2.6.24.111)
> and didn't work.
>
> Below are my diffs and I can post original files as well, please help me
> make it work!
>
> Thanks in advance!
>
> cfi_util.c
>
> 29a30,107
>>
>> int __xipram cfi_qry_present(struct map_info *map, __u32 base,
>> struct cfi_private *cfi)
>> {
>> int osf = cfi->interleave * cfi->device_type; /* scale factor */
>> map_word val[3];
>> map_word qry[3];
>>
>> qry[0] = cfi_build_cmd('Q', map, cfi);
>> qry[1] = cfi_build_cmd('R', map, cfi);
>> qry[2] = cfi_build_cmd('Y', map, cfi);
>>
>> val[0] = map_read(map, base + osf*0x10);
>> val[1] = map_read(map, base + osf*0x11);
>> val[2] = map_read(map, base + osf*0x12);
>>
>> if (!map_word_equal(map, qry[0], val[0]))
>> return 0;
>>
>> if (!map_word_equal(map, qry[1], val[1]))
>> return 0;
>>
>> if (!map_word_equal(map, qry[2], val[2]))
>> return 0;
>>
>> return 1; /* "QRY" found */
>> }
>> EXPORT_SYMBOL_GPL(cfi_qry_present);
>>
>> int __xipram cfi_qry_mode_on(uint32_t base, struct map_info *map,
>> struct cfi_private *cfi)
>> {
>> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
>> if (cfi_qry_present(map, base, cfi))
>> return 1;
>> /* QRY not found probably we deal with some odd CFI chips */
>> /* Some revisions of some old Intel chips? */
>> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
>> if (cfi_qry_present(map, base, cfi))
>> return 1;
>> /* ST M29DW chips */
>> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);
>> if (cfi_qry_present(map, base, cfi))
>> return 1;
>> /* some old SST chips, e.g. 39VF160x/39VF320x */
>> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0xAA, 0x5555, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x55, 0x2AAA, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x98, 0x5555, base, map, cfi, cfi->device_type, NULL);
>> if (cfi_qry_present(map, base, cfi))
>> return 1;
>> /* SST 39VF640xB */
>> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0xAA, 0x555, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x55, 0x2AA, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);
>> if (cfi_qry_present(map, base, cfi))
>> return 1;
>> /* QRY not found */
>> return 0;
>> }
>> EXPORT_SYMBOL_GPL(cfi_qry_mode_on);
>>
>> void __xipram cfi_qry_mode_off(uint32_t base, struct map_info *map,
>> struct cfi_private *cfi)
>> {
>> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
>> /* M29W128G flashes require an additional reset command
>> when exit qry mode */
>> if ((cfi->mfr == CFI_MFR_ST) && (cfi->id == 0x227E || cfi->id == 0x7E))
>> cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> }
>> EXPORT_SYMBOL_GPL(cfi_qry_mode_off);
>>
>
> cfi_cmdset_0002.c
>
> 219a220,253
>>
>> static void fixup_old_sst_eraseregion(struct mtd_info *mtd)
>> {
>> struct map_info *map = mtd->priv;
>> struct cfi_private *cfi = map->fldrv_priv;
>>
>> /*
>> * These flashes report two seperate eraseblock regions based on the
>> * sector_erase-size and block_erase-size, although they both operate on
>> the
>> * same memory. This is not allowed according to CFI, so we just pick
>> the
>> * sector_erase-size.
>> */
>> cfi->cfiq->NumEraseRegions = 1;
>> }
>>
>> static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
>> {
>> struct map_info *map = mtd->priv;
>> struct cfi_private *cfi = map->fldrv_priv;
>>
>> fixup_old_sst_eraseregion(mtd);
>>
>> cfi->addr_unlock1 = 0x555;
>> cfi->addr_unlock2 = 0x2AA;
>> }
>>
>> /* Used to fix CFI-Tables of chips without Extended Query Tables */
>> static struct cfi_fixup cfi_nopri_fixup_table[] = {
>> { CFI_MFR_SST, 0x235C, fixup_sst39vf_rev_b, NULL, }, // SST39VF3202B
>> { CFI_MFR_SST, 0x235D, fixup_sst39vf_rev_b, NULL, }, // SST39VF3201B
>> { CFI_MFR_SST, 0x236C, fixup_sst39vf_rev_b, NULL, }, // SST39VF6402B
>> { CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // SST39VF6401B
>> { 0, 0, NULL, NULL }
>> };
>>
>
>
> ----- Original Message ----- From: "Fabio Giovagnini"
> <fabio.giovagnini@aurion-tech.com>
> To: <linux-mtd@lists.infradead.org>
> Cc: "yidong zhang" <zhangyd6@gmail.com>; <David.Woodhouse@intel.com>;
> "Wolfram Sang" <w.sang@pengutronix.de>; <yegorslists@googlemail.com>;
> "Guillaume LECERF" <glecerf@gmail.com>; <taliaferro62@gmail.com>
> Sent: Friday, October 22, 2010 2:50 PM
> Subject: Re: [Help] SST39VF6401B Support
>
>
> Hi Guys,
> As Gullelm remeber for sure, I used the jedec probe for such a flash in a
> very
> old 2.6 kernel.
>
> Now I'm migrating to the newets one kernel.
> Do you tell me how the kernel will be updated with the last mtd stuff
> developed; or in place of it how to patch a standard kernel?
>
> Thanks a lot and sorry for my question if it is improper
>
>
> In data venerdì 22 ottobre 2010 17:42:39, yidong zhang ha scritto:
> : > On Fri, Oct 22, 2010 at 11:36 PM, Guillaume LECERF <glecerf@gmail.com>
> wrote:
>>
>> > 2010/10/22 yidong zhang <zhangyd6@gmail.com>:
>> >>> Could you try setting cif->cfiq->EraseRegionInfo[0] to 0x02003FF in
>> >>> fixup_sst39vf_rev_b() ?
>> >>
>> >> Hi
>> >> how about this attached patch.
>> >
>> > If it works for you, I'll send a patch series for SST 39VF640xB and
>> > 38VF640x, because both chips needs 0x50 as erase command.
>>
>> Sorry, i cannot test it right now. I will sent the result as soon as i
>> can.
>>
>> > --
>> > Guillaume LECERF
>> > GeeXboX developer - www.geexbox.org
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> --
> Ing. Fabio Giovagnini
>
> Aurion s.r.l.
> P.I e C.F.
> 00885711200
> skype: aurion.giovagnini
> Tel. +39.051.594.78.24
> Cell. +39.335.83.50.919
> www.aurion-tech.com
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

------=_NextPart_000_087B_01CCB5DE.A70FF5F0
Content-Type: application/octet-stream;
	name="bcm947xx-flash.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="bcm947xx-flash.c"

/*=0A=
 * Flash mapping for BCM947XX boards=0A=
 *=0A=
 * Copyright (C) 2008, Broadcom Corporation=0A=
 * All Rights Reserved.=0A=
 * =0A=
 * THIS SOFTWARE IS OFFERED "AS IS", AND BROADCOM GRANTS NO WARRANTIES =
OF ANY=0A=
 * KIND, EXPRESS OR IMPLIED, BY STATUTE, COMMUNICATION OR OTHERWISE. =
BROADCOM=0A=
 * SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTIES OF MERCHANTABILITY, =
FITNESS=0A=
 * FOR A SPECIFIC PURPOSE OR NONINFRINGEMENT CONCERNING THIS SOFTWARE.=0A=
 *=0A=
 * $Id: bcm947xx-flash.c,v 1.5 2008/03/25 01:27:49 Exp $=0A=
 */=0A=
=0A=
#include <linux/module.h>=0A=
#include <linux/types.h>=0A=
#include <linux/kernel.h>=0A=
#include <linux/init.h>=0A=
#include <asm/io.h>=0A=
#include <linux/mtd/mtd.h>=0A=
#include <linux/mtd/map.h>=0A=
#include <linux/mtd/partitions.h>=0A=
#include <linux/config.h>=0A=
#include <linux/squashfs_fs.h>=0A=
#include <linux/jffs2.h>=0A=
#include <linux/crc32.h>=0A=
#include <linux/vmalloc.h>=0A=
=0A=
#include <typedefs.h>=0A=
#include <bcmnvram.h>=0A=
#include <bcmutils.h>=0A=
#include <hndsoc.h>=0A=
#include <sbchipc.h>=0A=
#include <siutils.h>=0A=
#include <trxhdr.h>=0A=
=0A=
/* Global SB handle */=0A=
extern void *bcm947xx_sih;=0A=
extern spinlock_t bcm947xx_sih_lock;=0A=
=0A=
/* Convenience */=0A=
#define sih bcm947xx_sih=0A=
#define sih_lock bcm947xx_sih_lock=0A=
=0A=
=0A=
#define WINDOW_ADDR 0x1fc00000=0A=
#define WINDOW_SIZE 0x400000=0A=
#define BUSWIDTH 2=0A=
=0A=
/* e.g., flash=3D2M or flash=3D4M */=0A=
static int flash =3D 0;=0A=
module_param(flash, int, 0);=0A=
static int __init=0A=
bcm947xx_setup(char *str)=0A=
{=0A=
	flash =3D memparse(str, &str);=0A=
	return 1;=0A=
}=0A=
__setup("flash=3D", bcm947xx_setup);=0A=
=0A=
static struct mtd_info *bcm947xx_mtd;=0A=
=0A=
=0A=
#if LINUX_VERSION_CODE < 0x20212 && defined(MODULE)=0A=
#define init_bcm947xx_map init_module=0A=
#define cleanup_bcm947xx_map cleanup_module=0A=
#endif=0A=
=0A=
=0A=
#define ROUTER_NETGEAR_WGR614L           1=0A=
#define ROUTER_NETGEAR_WNR834B           2=0A=
#define ROUTER_NETGEAR_WNDR3300          3=0A=
#define ROUTER_NETGEAR_WNR3500L          4=0A=
#define ROUTER_NETGEAR_WNR2000V2         5=0A=
#define ROUTER_NETGEAR_WNDR3400          6=0A=
#define ROUTER_NETGEAR_WNDR4000          7=0A=
#define ROUTER_BELKIN_F5D8235V3          8=0A=
#define ROUTER_BELKIN_F7D3301_3302_4302  9=0A=
=0A=
/* Belkin series */=0A=
#define TRX_MAGIC_F7D3301              0x20100322      /* Belkin Share =
Max; router's birthday ? */=0A=
#define TRX_MAGIC_F7D3302              0x20090928      /* Belkin Share; =
router's birthday ? */=0A=
#define TRX_MAGIC_F7D4302              0x20091006      /* Belkin Play; =
router's birthday ? */=0A=
#define TRX_MAGIC_F5D8235V3            0x00017116      /* Belkin =
F5D8235-4v3 */=0A=
#define TRX_MAGIC_QA                   0x12345678      /* cfe: It's QA =
firmware */=0A=
=0A=
/* Netgear wgr614 */=0A=
#define WGR614_CHECKSUM_BLOCK_START    0x003A0000=0A=
#define WGR614_CHECKSUM_OFF            0x003AFFF8=0A=
#define WGR614_FAKE_LEN                0x00000004  //we fake checksum =
only over 4 bytes (HDR0)=0A=
#define WGR614_FAKE_CHK                0x02C0010E=0A=
=0A=
static int get_router (void)=0A=
{=0A=
	uint boardnum =3D bcm_strtoul( nvram_safe_get( "boardnum" ), NULL, 0 );	=0A=
		=0A=
	if ( (boardnum =3D=3D 8 || boardnum =3D=3D 01)=0A=
	  && nvram_match ("boardtype", "0x0472")=0A=
	  && nvram_match ("cardbus", "1") ) {=0A=
		return ROUTER_NETGEAR_WNR834B;	  //Netgear WNR834B, Netgear WNR834Bv2=0A=
	}=0A=
=0A=
	if ( boardnum =3D=3D 01=0A=
	  && nvram_match ("boardtype", "0x0472")=0A=
	  && nvram_match ("boardrev", "0x23") ) {=0A=
		return ROUTER_NETGEAR_WNDR3300;  //Netgear WNDR-3300	=0A=
	}	=0A=
	=0A=
	if ( (boardnum =3D=3D 83258 || boardnum =3D=3D 01)  //or 001 or 0x01=0A=
	  && (nvram_match ("boardtype", "0x048e") || nvram_match ("boardtype", =
"0x48E"))=0A=
	  && (nvram_match ("boardrev", "0x11") || nvram_match ("boardrev", =
"0x10"))=0A=
	  && (nvram_match ("boardflags", "0x750") || nvram_match ("boardflags", =
"0x0750"))=0A=
	  &&  nvram_match ("sdram_init", "0x000A") ) {=0A=
		return ROUTER_NETGEAR_WGR614L;  //Netgear WGR614v8/L/WW 16MB ram, cfe =
v1.3 or v1.5=0A=
	}=0A=
	=0A=
	if ( (boardnum =3D=3D 1 || boardnum =3D=3D 3500)=0A=
	  && nvram_match ("boardtype", "0x04CF")=0A=
	  && (nvram_match ("boardrev", "0x1213") || nvram_match ("boardrev", =
"02")) ) {	=0A=
		return ROUTER_NETGEAR_WNR3500L;  //Netgear WNR3500v2/U/L=0A=
	}=0A=
	=0A=
	if ( boardnum =3D=3D 1=0A=
	  && nvram_match ("boardtype", "0xE4CD")=0A=
	  && nvram_match ("boardrev", "0x1700") ) {=0A=
		return ROUTER_NETGEAR_WNR2000V2;  //Netgear WNR2000v2	=0A=
	}=0A=
	=0A=
	if ( boardnum =3D=3D 01=0A=
	  && nvram_match("boardtype", "0xb4cf")=0A=
	  && nvram_match("boardrev", "0x1100")) {=0A=
		return ROUTER_NETGEAR_WNDR3400;  //Netgear WNDR3400	=0A=
	}=0A=
	=0A=
	if ( boardnum =3D=3D 01=0A=
	  && nvram_match("boardtype", "0xF52C")=0A=
	  && nvram_match("boardrev", "0x1101")) {=0A=
		return ROUTER_NETGEAR_WNDR4000;  //Netgear WNDR4000	=0A=
	}=0A=
	=0A=
	if (nvram_match("boardtype", "0xa4cf")=0A=
	  && nvram_match("boardrev", "0x1100")) {=0A=
		return ROUTER_BELKIN_F5D8235V3;  //F5D8235v3=0A=
	}	=0A=
	=0A=
	if (nvram_match("boardtype", "0xa4cf")=0A=
	  && nvram_match("boardrev", "0x1102")) {=0A=
		return ROUTER_BELKIN_F7D3301_3302_4302;  //Belkin F7D3301v1 /F7D3302v1 =
/ F7D4302v1=0A=
	}=0A=
	=0A=
	return 0;=0A=
}=0A=
=0A=
static void bcm47xx_map_copy_from(struct map_info *map, void *to, =
unsigned long from, ssize_t len)=0A=
{=0A=
	if (len=3D=3D1) {=0A=
		memcpy_fromio(to, map->virt + from, len);=0A=
	} else {=0A=
		int i;=0A=
		u16 *dest =3D (u16 *) to;=0A=
		u16 *src  =3D (u16 *) (map->virt + from);=0A=
		for (i =3D 0; i < (len / 2); i++) {=0A=
			dest[i] =3D src[i];=0A=
		}=0A=
		if (len & 1)=0A=
			*((u8 *)dest+len-1) =3D src[i] & 0xff;=0A=
	}=0A=
}=0A=
=0A=
=0A=
struct map_info bcm947xx_map =3D {=0A=
	name: "Physically mapped flash",=0A=
	size: WINDOW_SIZE,=0A=
	bankwidth: BUSWIDTH,=0A=
	phys: WINDOW_ADDR,=0A=
};=0A=
=0A=
=0A=
#ifdef CONFIG_MTD_PARTITIONS=0A=
=0A=
static struct mtd_partition bcm947xx_parts[] =3D {=0A=
	{ name: "cfe",	offset: 0, size: 0, },=0A=
	{ name: "linux", offset: 0, size: 0, },=0A=
	{ name: "rootfs", offset: 0, size: 0, },=0A=
	{ name: "nvram", offset: 0, size: 0, },=0A=
	{ name: "ddwrt", offset: 0, size: 0, },=0A=
	{ name: NULL, },=0A=
};=0A=
=0A=
static int __init=0A=
find_cfe_size(struct mtd_info *mtd, size_t size)=0A=
{=0A=
	struct trx_header *trx;=0A=
	unsigned char buf[512];=0A=
	int off;=0A=
	size_t len;=0A=
	int blocksize;=0A=
=0A=
	trx =3D (struct trx_header *) buf;=0A=
=0A=
	blocksize =3D mtd->erasesize;=0A=
	if (blocksize < 0x10000)=0A=
		blocksize =3D 0x10000;=0A=
//	printk(KERN_EMERG "blocksize is %d\n",blocksize);=0A=
	for (off =3D 0; off < size; off +=3D 64*1024) {=0A=
		memset(buf, 0xe5, sizeof(buf));=0A=
//		printk(KERN_EMERG "scan at 0x%08x\n",off);=0A=
		/*=0A=
		 * Read into buffer =0A=
		 */=0A=
		if (mtd->read(mtd, off, sizeof(buf), &len, buf) ||=0A=
		    len !=3D sizeof(buf))=0A=
			continue;=0A=
			=0A=
		switch (le32_to_cpu(trx->magic)) {=0A=
		 /* found a TRX header */	=0A=
		case TRX_MAGIC:=0A=
			goto found;=0A=
			break;=0A=
		/* found a Belkin TRX header */=0A=
		case TRX_MAGIC_F7D3301:=0A=
		case TRX_MAGIC_F7D3302:=0A=
		case TRX_MAGIC_F7D4302:=0A=
		case TRX_MAGIC_F5D8235V3:=0A=
		case TRX_MAGIC_QA:=0A=
			if (get_router() =3D=3D ROUTER_BELKIN_F7D3301_3302_4302=0A=
				|| get_router() =3D=3D ROUTER_BELKIN_F5D8235V3) {=0A=
				printk(KERN_EMERG  "Found Belkin TRX magic\n");=0A=
				goto found;=0A=
			}=0A=
			break;=0A=
		}=0A=
=0A=
	}=0A=
=0A=
	printk(KERN_EMERG =0A=
	       "%s: Couldn't find bootloader size\n",=0A=
	       mtd->name);=0A=
	return -1;=0A=
=0A=
 found:=0A=
	printk(KERN_EMERG  "bootloader size: %d\n", off);=0A=
	printk(KERN_EMERG  "nvram size: %d\n", NVRAM_SPACE);=0A=
	return off;=0A=
=0A=
}=0A=
=0A=
=0A=
/*=0A=
 * Copied from mtdblock.c=0A=
 *=0A=
 * Cache stuff...=0A=
 * =0A=
 * Since typical flash erasable sectors are much larger than what Linux's=0A=
 * buffer cache can handle, we must implement read-modify-write on flash=0A=
 * sectors for each block write requests.  To avoid over-erasing flash =
sectors=0A=
 * and to speed things up, we locally cache a whole flash sector while =
it is=0A=
 * being written to until a different sector is required.=0A=
 */=0A=
=0A=
static void erase_callback(struct erase_info *done)=0A=
{=0A=
	wait_queue_head_t *wait_q =3D (wait_queue_head_t *)done->priv;=0A=
	wake_up(wait_q);=0A=
}=0A=
=0A=
static int erase_write (struct mtd_info *mtd, unsigned long pos, =0A=
			int len, const char *buf)=0A=
{=0A=
	struct erase_info erase;=0A=
	DECLARE_WAITQUEUE(wait, current);=0A=
	wait_queue_head_t wait_q;=0A=
	size_t retlen;=0A=
	int ret;=0A=
=0A=
	/*=0A=
	 * First, let's erase the flash block.=0A=
	 */=0A=
=0A=
	init_waitqueue_head(&wait_q);=0A=
	erase.mtd =3D mtd;=0A=
	erase.callback =3D erase_callback;=0A=
	erase.addr =3D pos;=0A=
	erase.len =3D len;=0A=
	erase.priv =3D (u_long)&wait_q;=0A=
=0A=
	set_current_state(TASK_INTERRUPTIBLE);=0A=
	add_wait_queue(&wait_q, &wait);=0A=
=0A=
	ret =3D mtd->erase(mtd, &erase);=0A=
	if (ret) {=0A=
		set_current_state(TASK_RUNNING);=0A=
		remove_wait_queue(&wait_q, &wait);=0A=
		printk (KERN_WARNING "erase of region [0x%lx, 0x%x] "=0A=
				     "on \"%s\" failed\n",=0A=
			pos, len, mtd->name);=0A=
		return ret;=0A=
	}=0A=
=0A=
	schedule();  /* Wait for erase to finish. */=0A=
	remove_wait_queue(&wait_q, &wait);=0A=
=0A=
	/*=0A=
	 * Next, writhe data to flash.=0A=
	 */=0A=
=0A=
	ret =3D mtd->write (mtd, pos, len, &retlen, buf);=0A=
	if (ret)=0A=
		return ret;=0A=
	if (retlen !=3D len)=0A=
		return -EIO;=0A=
	return 0;=0A=
}=0A=
=0A=
=0A=
=0A=
=0A=
static int __init=0A=
find_root(struct mtd_info *mtd, size_t size, struct mtd_partition *part)=0A=
{=0A=
	struct trx_header trx, *trx2;=0A=
	unsigned char buf[512], *block;=0A=
	int off, blocksize;=0A=
	u32 i, crc =3D ~0;=0A=
	size_t len;=0A=
	struct squashfs_super_block *sb =3D (struct squashfs_super_block *) buf;=0A=
=0A=
	blocksize =3D mtd->erasesize;=0A=
	if (blocksize < 0x10000)=0A=
		blocksize =3D 0x10000;=0A=
=0A=
	for (off =3D 0; off < size; off +=3D 64*1024) {=0A=
		memset(&trx, 0xe5, sizeof(trx));=0A=
//		printk(KERN_EMERG "scan root at 0x%08x\n",off);=0A=
=0A=
		/*=0A=
		 * Read into buffer =0A=
		 */=0A=
		if (mtd->read(mtd, off, sizeof(trx), &len, (char *) &trx) ||=0A=
		    len !=3D sizeof(trx))=0A=
			continue;=0A=
=0A=
		switch (le32_to_cpu(trx.magic)) {=0A=
		 /* found a TRX header */	=0A=
		case TRX_MAGIC:=0A=
			goto found;=0A=
			break;=0A=
		/* found a Belkin TRX header */=0A=
		case TRX_MAGIC_F7D3301:=0A=
		case TRX_MAGIC_F7D3302:=0A=
		case TRX_MAGIC_F7D4302:=0A=
		case TRX_MAGIC_F5D8235V3:=0A=
		case TRX_MAGIC_QA:=0A=
			if (get_router() =3D=3D ROUTER_BELKIN_F7D3301_3302_4302=0A=
				|| get_router() =3D=3D ROUTER_BELKIN_F5D8235V3) {=0A=
				printk(KERN_EMERG  "Found Belkin TRX magic\n");=0A=
				goto found;=0A=
			}=0A=
			break;=0A=
		}=0A=
	}=0A=
=0A=
	printk(KERN_EMERG =0A=
	       "%s: Couldn't find root filesystem\n",=0A=
	       mtd->name);=0A=
	return -1;=0A=
=0A=
 found:=0A=
	part->offset =3D le32_to_cpu(trx.offsets[2]) ? : =0A=
		le32_to_cpu(trx.offsets[1]);=0A=
	part->size =3D le32_to_cpu(trx.len); =0A=
=0A=
	part->size -=3D part->offset;=0A=
	part->offset +=3D off;=0A=
 =0A=
	if (part->size =3D=3D 0)=0A=
		return 0;=0A=
	=0A=
	if (mtd->read(mtd, part->offset, sizeof(buf), &len, buf) || len !=3D =
sizeof(buf))=0A=
		return 0;=0A=
=0A=
	if (*((__u32 *) buf) =3D=3D SQUASHFS_MAGIC) {=0A=
		printk(KERN_EMERG  "%s: Filesystem type: squashfs, size=3D0x%x\n", =
mtd->name, (u32) sb->bytes_used);=0A=
=0A=
		/* Update the squashfs partition size based on the superblock info */=0A=
		part->size =3D sb->bytes_used;=0A=
		//part->size =3D part->size + 1024; /* uncomment for belkin v2000 ! */=0A=
		len =3D part->offset + part->size;=0A=
		len +=3D  (mtd->erasesize - 1);=0A=
		len &=3D ~(mtd->erasesize - 1);=0A=
		part->size =3D len - part->offset;=0A=
		printk(KERN_EMERG "partition size =3D %d\n",part->size);=0A=
	} else if (*((__u16 *) buf) =3D=3D JFFS2_MAGIC_BITMASK) {=0A=
		printk(KERN_EMERG  "%s: Filesystem type: jffs2\n", mtd->name);=0A=
=0A=
		/* Move the squashfs outside of the trx */=0A=
		part->size =3D 0;=0A=
	} else {=0A=
		printk(KERN_EMERG  "%s: Filesystem type: unknown\n", mtd->name);=0A=
		return 0;=0A=
	}=0A=
=0A=
	if (trx.len !=3D part->offset + part->size - off) {=0A=
		/* Update the trx offsets and length */=0A=
		trx.len =3D part->offset + part->size - off;=0A=
//		printk(KERN_EMERG "update crc32\n");=0A=
		/* Update the trx crc32 */=0A=
		for (i =3D (u32) &(((struct trx_header *)NULL)->flag_version); i <=3D =
trx.len; i +=3D sizeof(buf)) {=0A=
//			printk(KERN_EMERG "read from %d\n",off + i);=0A=
			if (mtd->read(mtd, off + i, sizeof(buf), &len, buf) || len !=3D =
sizeof(buf))=0A=
				return 0;=0A=
			crc =3D crc32_le(crc, buf, min(sizeof(buf), trx.len - i));=0A=
		}=0A=
		trx.crc32 =3D crc;=0A=
=0A=
//			printk(KERN_EMERG "malloc\n",off + i);=0A=
		/* read first eraseblock from the trx */=0A=
		trx2 =3D block =3D vmalloc(mtd->erasesize);=0A=
		if (mtd->read(mtd, off, mtd->erasesize, &len, block) || len !=3D =
mtd->erasesize) {=0A=
			printk(KERN_EMERG "Error accessing the first trx eraseblock\n");=0A=
			vfree(block);=0A=
			return 0;=0A=
		}=0A=
		=0A=
		printk(KERN_EMERG "Updating TRX offsets and length:\n");=0A=
		printk(KERN_EMERG "old trx =3D [0x%08x, 0x%08x, 0x%08x], len=3D0x%08x =
crc32=3D0x%08x\n", trx2->offsets[0], trx2->offsets[1], trx2->offsets[2], =
trx2->len, trx2->crc32);=0A=
		printk(KERN_EMERG "new trx =3D [0x%08x, 0x%08x, 0x%08x], len=3D0x%08x =
crc32=3D0x%08x\n",   trx.offsets[0],   trx.offsets[1],   trx.offsets[2], =
  trx.len, trx.crc32);=0A=
=0A=
		/* Write updated trx header to the flash */=0A=
		memcpy(block, &trx, sizeof(trx));=0A=
		if (mtd->unlock)=0A=
			mtd->unlock(mtd, off, mtd->erasesize);=0A=
		erase_write(mtd, off, mtd->erasesize, block);=0A=
		if (mtd->sync)=0A=
			mtd->sync(mtd);=0A=
		vfree(block);=0A=
		printk(KERN_EMERG "Done\n");=0A=
		=0A=
		/* Write fake Netgear checksum to the flash */		=0A=
		if (get_router() =3D=3D ROUTER_NETGEAR_WGR614L) {=0A=
		/*=0A=
		 * Read into buffer =0A=
		 */=0A=
		block =3D vmalloc(mtd->erasesize);=0A=
		if (mtd->read(mtd, WGR614_CHECKSUM_BLOCK_START, mtd->erasesize, &len, =
block) ||=0A=
		    len !=3D mtd->erasesize) {=0A=
			printk(KERN_EMERG "Error accessing the WGR614 checksum eraseblock\n");=0A=
			vfree(block);=0A=
			}=0A=
			else {=0A=
			char imageInfo[8];=0A=
			u32 fake_len =3D le32_to_cpu(WGR614_FAKE_LEN);=0A=
			u32 fake_chk =3D le32_to_cpu(WGR614_FAKE_CHK);=0A=
			memcpy(&imageInfo[0], (char *)&fake_len, 4);=0A=
			memcpy(&imageInfo[4], (char *)&fake_chk, 4);=0A=
			char *tmp;	=0A=
			tmp =3D block + ((WGR614_CHECKSUM_OFF - WGR614_CHECKSUM_BLOCK_START) =
% mtd->erasesize);=0A=
			memcpy( tmp, imageInfo, sizeof( imageInfo ) );=0A=
			if (mtd->unlock)=0A=
				mtd->unlock(mtd, WGR614_CHECKSUM_BLOCK_START, mtd->erasesize);=0A=
			erase_write(mtd, WGR614_CHECKSUM_BLOCK_START, mtd->erasesize, block);=0A=
			if (mtd->sync)=0A=
				mtd->sync(mtd);=0A=
			vfree(block);=0A=
			printk(KERN_EMERG "Done fixing WGR614 checksum\n");		  =0A=
			}=0A=
		}	=0A=
		=0A=
		=0A=
	}=0A=
	=0A=
	return part->size;=0A=
}=0A=
=0A=
struct mtd_partition * __init=0A=
init_mtd_partitions(struct mtd_info *mtd, size_t size)=0A=
{=0A=
	int cfe_size;=0A=
=0A=
	int board_data_size =3D 0; // e.g Netgear 0x003e0000-0x003f0000 : =
"board_data", we exclude this part from our mapping=0A=
	int jffs_exclude_size =3D 0;  // to prevent overwriting len/checksum on =
e.g. Netgear WGR614v8/L/WW=0A=
	=0A=
	switch (get_router()) {=0A=
		case ROUTER_NETGEAR_WGR614L:=0A=
		case ROUTER_NETGEAR_WNR834B:=0A=
		case ROUTER_NETGEAR_WNDR3300:=0A=
		case ROUTER_NETGEAR_WNR3500L:=0A=
			board_data_size =3D 4 * 0x10000;  //Netgear: checksum is @ 0x003AFFF8 =
for 4M flash=0A=
			jffs_exclude_size =3D 0x10000;    //or checksum is @ 0x007AFFF8 for =
8M flash=0A=
			break;	=0A=
		case ROUTER_NETGEAR_WNR2000V2:	=0A=
			board_data_size =3D 0x10000;=0A=
			break;=0A=
		case ROUTER_NETGEAR_WNDR3400:	//Netgear: checksum is @ 0x0070FFF8 @ 8M =
flash, but can be overwritten=0A=
		case ROUTER_NETGEAR_WNDR4000:	//Netgear: checksum is @ 0x0073FFF8 @ 8M =
flash, but can be overwritten=0A=
			board_data_size =3D 0x10000;=0A=
			break;=0A=
	}=0A=
=0A=
	if ((cfe_size =3D find_cfe_size(mtd,size)) < 0)=0A=
		return NULL;=0A=
=0A=
	/* boot loader */=0A=
	bcm947xx_parts[0].offset =3D 0;=0A=
	bcm947xx_parts[0].size   =3D cfe_size;=0A=
=0A=
	/* nvram */=0A=
	if (cfe_size !=3D 384 * 1024) {=0A=
		bcm947xx_parts[3].offset =3D size - ROUNDUP(NVRAM_SPACE, =
mtd->erasesize);=0A=
		bcm947xx_parts[3].size   =3D ROUNDUP(NVRAM_SPACE, mtd->erasesize);=0A=
	} else {=0A=
		/* nvram (old 128kb config partition on netgear wgt634u) */=0A=
		bcm947xx_parts[3].offset =3D bcm947xx_parts[0].size;=0A=
		bcm947xx_parts[3].size   =3D ROUNDUP(NVRAM_SPACE, mtd->erasesize);=0A=
	}=0A=
=0A=
	/* linux (kernel and rootfs) */=0A=
	if (cfe_size !=3D 384 * 1024) {=0A=
		bcm947xx_parts[1].offset =3D bcm947xx_parts[0].size;=0A=
		bcm947xx_parts[1].size   =3D (bcm947xx_parts[3].offset - =
bcm947xx_parts[1].offset) - board_data_size;=0A=
	} else {=0A=
		/* do not count the elf loader, which is on one block */=0A=
		bcm947xx_parts[1].offset =3D bcm947xx_parts[0].size + =0A=
			bcm947xx_parts[3].size + mtd->erasesize;=0A=
		bcm947xx_parts[1].size   =3D (((size - bcm947xx_parts[0].size) - =
(2*bcm947xx_parts[3].size)) - mtd->erasesize) - board_data_size;=0A=
	}=0A=
=0A=
	/* find and size rootfs */=0A=
	if (find_root(mtd,size,&bcm947xx_parts[2])=3D=3D0) {=0A=
		/* entirely jffs2 */=0A=
		bcm947xx_parts[4].name =3D NULL;=0A=
		bcm947xx_parts[2].size =3D (size - bcm947xx_parts[2].offset) - =
bcm947xx_parts[3].size;=0A=
	} else {=0A=
		/* legacy setup */=0A=
		/* calculate leftover flash, and assign it to the jffs2 partition */=0A=
		if (cfe_size !=3D 384 * 1024) {=0A=
			bcm947xx_parts[4].offset =3D bcm947xx_parts[2].offset + =0A=
				bcm947xx_parts[2].size;=0A=
			if ((bcm947xx_parts[4].offset % mtd->erasesize) > 0) {=0A=
				bcm947xx_parts[4].offset +=3D mtd->erasesize - =0A=
					(bcm947xx_parts[4].offset % mtd->erasesize);=0A=
			}=0A=
			bcm947xx_parts[4].size =3D ((bcm947xx_parts[3].offset - =
bcm947xx_parts[4].offset) - board_data_size) - jffs_exclude_size;=0A=
		} else {=0A=
			bcm947xx_parts[4].offset =3D bcm947xx_parts[2].offset + =0A=
				bcm947xx_parts[2].size;=0A=
			if ((bcm947xx_parts[4].offset % mtd->erasesize) > 0) {=0A=
				bcm947xx_parts[4].offset +=3D mtd->erasesize - =0A=
					(bcm947xx_parts[4].offset % mtd->erasesize);=0A=
			}=0A=
			bcm947xx_parts[4].size =3D (((size - bcm947xx_parts[3].size) - =
bcm947xx_parts[4].offset) - board_data_size) - jffs_exclude_size;=0A=
		}=0A=
		/* do not make zero size jffs2 partition  */=0A=
		if (bcm947xx_parts[4].size < mtd->erasesize) {=0A=
			bcm947xx_parts[4].name =3D NULL;=0A=
		}=0A=
	}=0A=
=0A=
	return bcm947xx_parts;=0A=
}=0A=
=0A=
#endif=0A=
=0A=
static int __init=0A=
init_bcm947xx_map(void)=0A=
{=0A=
	ulong flags;=0A=
 	uint coreidx;=0A=
	chipcregs_t *cc;=0A=
	uint32 fltype;=0A=
	uint window_addr =3D 0, window_size =3D 0;=0A=
	size_t size;=0A=
	int ret =3D 0;=0A=
#ifdef CONFIG_MTD_PARTITIONS=0A=
	struct mtd_partition *parts;=0A=
	int i;=0A=
#endif=0A=
=0A=
	spin_lock_irqsave(&sih_lock, flags);=0A=
	coreidx =3D si_coreidx(sih);=0A=
=0A=
	/* Check strapping option if chipcommon exists */=0A=
	if ((cc =3D si_setcore(sih, CC_CORE_ID, 0))) {=0A=
		fltype =3D readl(&cc->capabilities) & CC_CAP_FLASH_MASK;=0A=
		if (fltype =3D=3D PFLASH) {=0A=
			bcm947xx_map.map_priv_2 =3D 1;=0A=
			window_addr =3D 0x1c000000;=0A=
			bcm947xx_map.size =3D window_size =3D 32 * 1024 * 1024;=0A=
			if ((readl(&cc->flash_config) & CC_CFG_DS) =3D=3D 0)=0A=
				bcm947xx_map.bankwidth =3D 1;=0A=
		}=0A=
	} else {=0A=
		fltype =3D PFLASH;=0A=
		bcm947xx_map.map_priv_2 =3D 0;=0A=
		window_addr =3D WINDOW_ADDR;=0A=
		bcm947xx_map.size =3D window_size =3D WINDOW_SIZE;=0A=
	}=0A=
=0A=
	si_setcoreidx(sih, coreidx);=0A=
	spin_unlock_irqrestore(&sih_lock, flags);=0A=
=0A=
	if (fltype !=3D PFLASH) {=0A=
		printk(KERN_ERR "pflash: found no supported devices\n");=0A=
		ret =3D -ENODEV;=0A=
		goto fail;=0A=
	}=0A=
=0A=
	bcm947xx_map.virt =3D ioremap(window_addr, window_size);=0A=
	if (bcm947xx_map.virt =3D=3D NULL) {=0A=
		printk(KERN_ERR "pflash: ioremap failed\n");=0A=
		ret =3D -EIO;=0A=
		goto fail;=0A=
	}=0A=
=0A=
	if ((bcm947xx_mtd =3D do_map_probe("cfi_probe", &bcm947xx_map)) =3D=3D =
NULL) {=0A=
		printk(KERN_ERR "pflash: cfi_probe failed\n");=0A=
		ret =3D -ENXIO;=0A=
		goto fail;=0A=
	}=0A=
=0A=
	bcm947xx_mtd->owner =3D THIS_MODULE;=0A=
=0A=
	/* override copy_from routine */=0A=
// 	bcm947xx_map.copy_from =3D bcm47xx_map_copy_from;=0A=
=0A=
	/* Allow size override for testing */=0A=
	size =3D flash ? : bcm947xx_mtd->size;=0A=
=0A=
	printk(KERN_NOTICE "Flash device: 0x%x at 0x%x\n", size, window_addr);=0A=
=0A=
#ifdef CONFIG_MTD_PARTITIONS=0A=
	parts =3D init_mtd_partitions(bcm947xx_mtd, size);=0A=
	for (i =3D 0; parts[i].name; i++);=0A=
	ret =3D add_mtd_partitions(bcm947xx_mtd, parts, i);=0A=
	if (ret) {=0A=
		printk(KERN_ERR "pflash: add_mtd_partitions failed\n");=0A=
		goto fail;=0A=
	}=0A=
#endif=0A=
=0A=
	return 0;=0A=
=0A=
 fail:=0A=
	if (bcm947xx_mtd)=0A=
		map_destroy(bcm947xx_mtd);=0A=
	if (bcm947xx_map.map_priv_1)=0A=
		iounmap((void *) bcm947xx_map.map_priv_1);=0A=
	bcm947xx_map.map_priv_1 =3D 0;=0A=
	return ret;=0A=
}=0A=
=0A=
static void __exit=0A=
cleanup_bcm947xx_map(void)=0A=
{=0A=
#ifdef CONFIG_MTD_PARTITIONS=0A=
	del_mtd_partitions(bcm947xx_mtd);=0A=
#endif=0A=
	map_destroy(bcm947xx_mtd);=0A=
	iounmap((void *) bcm947xx_map.map_priv_1);=0A=
	bcm947xx_map.map_priv_1 =3D 0;=0A=
}=0A=
=0A=
module_init(init_bcm947xx_map);=0A=
module_exit(cleanup_bcm947xx_map);=0A=

------=_NextPart_000_087B_01CCB5DE.A70FF5F0--
