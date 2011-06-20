Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYVIG-00007I-3d
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 03:36:58 +0000
Received: by qyg14 with SMTP id 14so920395qyg.15
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Jun 2011 20:36:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <F8730DE65A2E4EB3BC47D4C2DC317502@THOR>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com>
	<AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com>
	<201010221950.57594.fabio.giovagnini@aurion-tech.com>
	<DEF16A5C46894A5DB447E0F7C81A9D5F@THOR>
	<F8730DE65A2E4EB3BC47D4C2DC317502@THOR>
Date: Mon, 20 Jun 2011 11:36:51 +0800
Message-ID: <BANLkTikxfRCFvijPt=pxZ8AyVL2o_Vw8ZA@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
From: yidong zhang <zhangyd6@gmail.com>
To: =?ISO-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
    Please see the datasheet for the erase command. Some uses 0x50
rather than 0x30, and the erase size are different. I think you may
need porting the code  listed bellow to your driver. It has been a
long time since i used this flash, so i don't remember it very well.
Using the log may help you a lot.

 static void fixup_sst39vf_rev_b(struct mtd_info *mtd)
286 {
287         struct map_info *map =3D mtd->priv;
288         struct cfi_private *cfi =3D map->fldrv_priv;
289
290         fixup_old_sst_eraseregion(mtd);
291
292         cfi->addr_unlock1 =3D 0x555;
293         cfi->addr_unlock2 =3D 0x2AA;
294
295         cfi->sector_erase_cmd =3D CMD(0x50);
296 }
297
298 static void fixup_sst38vf640x_sectorsize(struct mtd_info *mtd)
299 {
300         struct map_info *map =3D mtd->priv;
301         struct cfi_private *cfi =3D map->fldrv_priv;
302
303         fixup_sst39vf_rev_b(mtd);
304
305         /*
306          * CFI reports 1024 sectors (0x03ff+1) of 64KBytes
(0x0100*256) where
307          * it should report a size of 8KBytes (0x0020*256).
308          */
309         cfi->cfiq->EraseRegionInfo[0] =3D 0x002003ff;
310         pr_warning("%s: Bad 38VF640x CFI data; adjusting sector
size from 64 to 8KiB\n", mtd->name);
311 }
312


2011/6/20 Fl=E1vio Silveira <fggs@terra.com.br>:
> Hi,
>
> =A0I'm attaching some other files to see if it helps finding what's wrong=
.
>
> =A0Thanks in advance!
>
> ----- Original Message ----- From: "Fl=E1vio Silveira" <fggs@terra.com.br=
>
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
> =A0I've tested this patch on kernel 2.6.23 (actually it's called 2.6.24.1=
11)
> and didn't work.
>
> =A0Below are my diffs and I can post original files as well, please help =
me
> make it work!
>
> Thanks in advance!
>
> cfi_util.c
>
> 29a30,107
>>
>> int __xipram cfi_qry_present(struct map_info *map, __u32 base,
>> =A0 =A0 =A0 =A0struct cfi_private *cfi)
>> {
>> =A0int osf =3D cfi->interleave * cfi->device_type; /* scale factor */
>> =A0map_word val[3];
>> =A0map_word qry[3];
>>
>> =A0qry[0] =3D cfi_build_cmd('Q', map, cfi);
>> =A0qry[1] =3D cfi_build_cmd('R', map, cfi);
>> =A0qry[2] =3D cfi_build_cmd('Y', map, cfi);
>>
>> =A0val[0] =3D map_read(map, base + osf*0x10);
>> =A0val[1] =3D map_read(map, base + osf*0x11);
>> =A0val[2] =3D map_read(map, base + osf*0x12);
>>
>> =A0if (!map_word_equal(map, qry[0], val[0]))
>> =A0return 0;
>>
>> =A0if (!map_word_equal(map, qry[1], val[1]))
>> =A0return 0;
>>
>> =A0if (!map_word_equal(map, qry[2], val[2]))
>> =A0return 0;
>>
>> =A0return 1; =A0/* "QRY" found */
>> }
>> EXPORT_SYMBOL_GPL(cfi_qry_present);
>>
>> int __xipram cfi_qry_mode_on(uint32_t base, struct map_info *map,
>> =A0 =A0 =A0 =A0struct cfi_private *cfi)
>> {
>> =A0cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> =A0cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
>> =A0if (cfi_qry_present(map, base, cfi))
>> =A0return 1;
>> =A0/* QRY not found probably we deal with some odd CFI chips */
>> =A0/* Some revisions of some old Intel chips? */
>> =A0cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> =A0cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
>> =A0cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
>> =A0if (cfi_qry_present(map, base, cfi))
>> =A0return 1;
>> =A0/* ST M29DW chips */
>> =A0cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> =A0cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL)=
;
>> =A0if (cfi_qry_present(map, base, cfi))
>> =A0return 1;
>> =A0/* some old SST chips, e.g. 39VF160x/39VF320x */
>> =A0cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> =A0cfi_send_gen_cmd(0xAA, 0x5555, base, map, cfi, cfi->device_type, NULL=
);
>> =A0cfi_send_gen_cmd(0x55, 0x2AAA, base, map, cfi, cfi->device_type, NULL=
);
>> =A0cfi_send_gen_cmd(0x98, 0x5555, base, map, cfi, cfi->device_type, NULL=
);
>> =A0if (cfi_qry_present(map, base, cfi))
>> =A0return 1;
>> =A0/* SST 39VF640xB */
>> =A0cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> =A0cfi_send_gen_cmd(0xAA, 0x555, base, map, cfi, cfi->device_type, NULL)=
;
>> =A0cfi_send_gen_cmd(0x55, 0x2AA, base, map, cfi, cfi->device_type, NULL)=
;
>> =A0cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL)=
;
>> =A0if (cfi_qry_present(map, base, cfi))
>> =A0return 1;
>> =A0/* QRY not found */
>> =A0return 0;
>> }
>> EXPORT_SYMBOL_GPL(cfi_qry_mode_on);
>>
>> void __xipram cfi_qry_mode_off(uint32_t base, struct map_info *map,
>> =A0 =A0 =A0 =A0 =A0struct cfi_private *cfi)
>> {
>> =A0cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>> =A0cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
>> =A0/* M29W128G flashes require an additional reset command
>> =A0 =A0when exit qry mode */
>> =A0if ((cfi->mfr =3D=3D CFI_MFR_ST) && (cfi->id =3D=3D 0x227E || cfi->id=
 =3D=3D 0x7E))
>> =A0cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
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
>> =A0 struct map_info *map =3D mtd->priv;
>> =A0 struct cfi_private *cfi =3D map->fldrv_priv;
>>
>> =A0 /*
>> =A0 =A0* These flashes report two seperate eraseblock regions based on t=
he
>> =A0 =A0* sector_erase-size and block_erase-size, although they both oper=
ate on
>> the
>> =A0 =A0* same memory. This is not allowed according to CFI, so we just p=
ick
>> the
>> =A0 =A0* sector_erase-size.
>> =A0 =A0*/
>> =A0 cfi->cfiq->NumEraseRegions =3D 1;
>> }
>>
>> static void fixup_sst39vf_rev_b(struct mtd_info *mtd, void *param)
>> {
>> =A0 struct map_info *map =3D mtd->priv;
>> =A0 struct cfi_private *cfi =3D map->fldrv_priv;
>>
>> =A0 fixup_old_sst_eraseregion(mtd);
>>
>> =A0 cfi->addr_unlock1 =3D 0x555;
>> =A0 cfi->addr_unlock2 =3D 0x2AA;
>> }
>>
>> /* Used to fix CFI-Tables of chips without Extended Query Tables */
>> static struct cfi_fixup cfi_nopri_fixup_table[] =3D {
>> =A0 { CFI_MFR_SST, 0x235C, fixup_sst39vf_rev_b, NULL, }, // SST39VF3202B
>> =A0 { CFI_MFR_SST, 0x235D, fixup_sst39vf_rev_b, NULL, }, // SST39VF3201B
>> =A0 { CFI_MFR_SST, 0x236C, fixup_sst39vf_rev_b, NULL, }, // SST39VF6402B
>> =A0 { CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // SST39VF6401B
>> =A0 { 0, 0, NULL, NULL }
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
> Thanks a =A0lot and sorry for my question if it is improper
>
>
> In data venerd=EC 22 ottobre 2010 17:42:39, yidong zhang ha scritto:
> : > On Fri, Oct 22, 2010 at 11:36 PM, Guillaume LECERF <glecerf@gmail.com=
>
> wrote:
>>
>> > 2010/10/22 yidong zhang <zhangyd6@gmail.com>:
>> >>> Could you try setting cif->cfiq->EraseRegionInfo[0] to 0x02003FF in
>> >>> fixup_sst39vf_rev_b() ?
>> >>
>> >> Hi
>> >> =A0how about this attached patch.
>> >
>> > If it works for you, I'll send a patch series for SST 39VF640xB and
>> > 38VF640x, because both chips needs 0x50 as erase command.
>>
>> Sorry, i cannot test it right now. =A0I will sent the result as soon as =
i
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
