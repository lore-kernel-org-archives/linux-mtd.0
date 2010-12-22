Received: from if04-mail-sr03-mia.mta.terra.com ([208.84.243.50])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVRnF-0006S0-Jg
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2010 16:44:02 +0000
Received: from 12y.terra.com (12y.tpn.terra.com [10.235.200.45])
	by mail-sr03-mia.tpn.terra.com (Postfix) with ESMTP id 6DDEE3004654
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2010 16:43:59 +0000 (UTC)
Received: from THOR (unknown [189.35.37.231]) (authenticated user fggs)
	by 12y.terra.com (Postfix) with ESMTPA id B7FC1280000F8
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Dec 2010 16:43:58 +0000 (UTC)
Message-ID: <4AF29211F3A744AF96CFEAB3B5A7339F@THOR>
From: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
To: <linux-mtd@lists.infradead.org>
Subject: Trying to patch dd-wrt kernel to support SST39VF6401B
Date: Wed, 22 Dec 2010 14:43:50 -0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_031C_01CBA1E6.A58D9320"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_031C_01CBA1E6.A58D9320
Content-Type: text/plain;
	format=flowed;
	charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit

Hi, I'm trying to patch this kernel (2.6.26) with the patch provided by 
Guillaume Lecerf for current kernel.

I'm stuck with patching cfi_util.c file, as it's very different. Can 
somebody help?

Patch and cfi_util.c attached! 

------=_NextPart_000_031C_01CBA1E6.A58D9320
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
	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);

	/* Read in the Extended Query Table */
	for (i=3D0; i<size; i++) {
		((unsigned char *)extp)[i] =3D
			cfi_read_query(map, base+((adr+i)*ofs_factor));
	}

	/* Make sure it returns to read mode */
	cfi_send_gen_cmd(0xf0, 0, base, map, cfi, cfi->device_type, NULL);
	cfi_send_gen_cmd(0xff, 0, base, map, cfi, cfi->device_type, NULL);

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

------=_NextPart_000_031C_01CBA1E6.A58D9320
Content-Type: application/octet-stream;
	name="cfi_util-add-support-for-switc.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cfi_util-add-support-for-switc.patch"

cfi_util: add support for switching SST 39VF6401B chips into QRY mode=0A=
=0A=
From: Guillaume LECERF <glecerf@gmail.com>=0A=
=0A=
Signed-off-by: Guillaume LECERF <glecerf@gmail.com>=0A=
---=0A=
 drivers/mtd/chips/cfi_util.c |    7 +++++++=0A=
 1 files changed, 7 insertions(+), 0 deletions(-)=0A=
=0A=
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c=0A=
index e503b2c..e41561e 100644=0A=
--- a/drivers/mtd/chips/cfi_util.c=0A=
+++ b/drivers/mtd/chips/cfi_util.c=0A=
@@ -77,6 +77,13 @@ int __xipram cfi_qry_mode_on(uint32_t base, struct =
map_info *map,=0A=
 	cfi_send_gen_cmd(0x98, 0x5555, base, map, cfi, cfi->device_type, NULL);=0A=
 	if (cfi_qry_present(map, base, cfi))=0A=
 		return 1;=0A=
+	/* 39VF6401B */=0A=
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);=0A=
+	cfi_send_gen_cmd(0xAA, 0x555, base, map, cfi, cfi->device_type, NULL);=0A=
+	cfi_send_gen_cmd(0x55, 0x2AA, base, map, cfi, cfi->device_type, NULL);=0A=
+	cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);=0A=
+	if (cfi_qry_present(map, base, cfi))=0A=
+		return 1;=0A=
 	/* QRY not found */=0A=
 	return 0;=0A=
 }=0A=

------=_NextPart_000_031C_01CBA1E6.A58D9320--
