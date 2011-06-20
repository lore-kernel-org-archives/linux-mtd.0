Received: from if02-mail-sr07-mia.mta.terra.com ([208.84.243.34])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QYoKS-0004Cw-8u
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 23:56:32 +0000
Message-ID: <91E44F522C8645C9B6F1B4063D33779C@THOR>
From: =?iso-8859-1?Q?Fl=E1vio_Silveira?= <fggs@terra.com.br>
To: "yidong zhang" <zhangyd6@gmail.com>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com><AANLkTinQ=vHZgQ5B2YnsDkKzmCD288JwzTUgTUP-9whV@mail.gmail.com><AANLkTimUVCRZLQma2xRChr51y1Fi5E2p31qFQS=B20Sw@mail.gmail.com><201010221950.57594.fabio.giovagnini@aurion-tech.com><DEF16A5C46894A5DB447E0F7C81A9D5F@THOR><F8730DE65A2E4EB3BC47D4C2DC317502@THOR>
	<BANLkTikxfRCFvijPt=pxZ8AyVL2o_Vw8ZA@mail.gmail.com>
In-Reply-To: <BANLkTikxfRCFvijPt=pxZ8AyVL2o_Vw8ZA@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
Date: Mon, 20 Jun 2011 20:55:52 -0300
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

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
