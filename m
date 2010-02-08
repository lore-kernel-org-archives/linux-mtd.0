Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NeRx0-00021s-2k
	for linux-mtd@lists.infradead.org; Mon, 08 Feb 2010 11:38:50 +0000
Received: by ewy23 with SMTP id 23so680828ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Feb 2010 03:38:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <56a87efc1002011415v19439bfq6e459070533b745d@mail.gmail.com>
References: <56a87efc1002011415v19439bfq6e459070533b745d@mail.gmail.com>
Date: Mon, 8 Feb 2010 12:38:43 +0100
Message-ID: <804f0d21002080338v76dcf651l76e585f40b3afe03@mail.gmail.com>
Subject: Re: Partitions not created following 2.6.28 -> 2.6.31 update
From: Arno Steffen <arno.steffen@googlemail.com>
To: Ryan Thompson <i@ry.ca>
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

Same for me on a OMAP design. The flash partitons has been set in
arch/arm/mach-omap2/<boardname<-flash.c, but this is not available in 2.6.3=
2.

How to deal with that?

Arno

2010/2/1 Ryan Thompson <i@ry.ca>:
> Hi all,
>
> I'm in the process of updating my kernel to 2.6.31 from 2.6.28. I am
> running custom PowerPC 4xx hardware with CFI NOR flash. Flash itself
> works, but after the kernel update, my partitions are no longer being
> created. Detailed info below:
>
> My device tree (dts) is set up roughly like this:
>
> =A0FLASH: flash@f0000000 {
> =A0 =A0 /* ...snip hw params... */
> =A0 =A0 uboot@0 {
> =A0 =A0 =A0 =A0 reg =3D <0x0 0xE0000>;
> =A0 =A0 =A0 =A0 label =3D "uboot";
> =A0 =A0 };
>
> =A0 =A0 ubootenv@e0000 {
> =A0 =A0 =A0 =A0 reg =3D <0xE0000 0x20000>;
> =A0 =A0 =A0 =A0 label =3D "ubootenv";
> =A0 =A0 };
>
> =A0 =A0 /* Other similar partitions */
> =A0};
>
> Under 2.6.28, this would give me the following kernel messages on boot:
>
> =A0f0000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D1024
> =A0cmdlinepart partition parsing not available
> =A0RedBoot partition parsing not available
> =A0Creating 10 MTD partitions on "f0000000.flash":
> =A00x00000000-0x000e0000 : "uboot"
> =A00x000e0000-0x00100000 : "ubootenv"
> =A0.
> =A0.
>
> And there would be corresponding mtd(block)? devices for each partition.
>
> Under 2.6.31, the flash itself is still probed, but the output is
> slightly different, and the partitions are not created:
>
> =A0f0000000.flash: Found 1 x16 devices at 0x0 in 16-bit bank
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Intel/Sharp Extended Query Table at 0x010A
> =A0Using buffer write method
> =A0Using auto-unlock on power-up/resume
> =A0cfi_cmdset_0001: Erase suspend on write enabled
> =A0erase region 0: offset=3D0x0,size=3D0x20000,blocks=3D1024
> =A0cmdlinepart partition parsing not available
> =A0RedBoot partition parsing not available
>
> I have not changed the device tree.
>
> In my kernel .config, I have (still) enabled CONFIG_MTD_{PARTITIONS,
> PHYSMAP, PHYSMAP_OF, OF_PARTS, CHAR, BLOCK}, and have not changed
> these options. The only MTD or flash options that make config changed
> when I ran it on 2.6.31 were the new MTD_TESTS, and MTD_LPDDR, both of
> which are disabled.
>
> mtd_debug used to say:
> =A0mtd.type =3D MTD_NORFLASH
> =A0mtd.flags =3D MTD_WRITEABLE | MTD_BIT_WRITEABLE
> =A0mtd.size =3D 917504 (896K)
> =A0mtd.erasesize =3D 131072 (128K)
> =A0mtd.writesize =3D 1
> =A0mtd.oobsize =3D 0
> =A0mtd.ecctype =3D (unknown ECC type - new MTD API maybe?)
> =A0regions =3D 0
>
> Now it outputs:
> =A0mtd.type =3D MTD_NORFLASH
> =A0mtd.flags =3D MTD_WRITEABLE | MTD_BIT_WRITEABLE
> =A0mtd.size =3D 134217728 (128M)
> =A0mtd.erasesize =3D 131072 (128K)
> =A0mtd.writesize =3D 1
> =A0mtd.oobsize =3D 0
> =A0mtd.ecctype =3D (unknown ECC type - new MTD API maybe?)
> =A0regions =3D 1
>
> =A0region[0].offset =3D 0x00000000
> =A0region[0].erasesize =3D 131072 (128K)
> =A0region[0].numblocks =3D 1024
> =A0region[0].regionindex =3D 0
>
> If I read from /dev/mtdblock0, I see my u-boot image, so flash itself
> still works. The problem is, the kernel isn't splitting it into
> separate mtd devices per the DTB like it did before the update.
>
> The char/block device nodes 1..n all return ENODEV on open(), which is
> no great surprise given the above information.
>
> Any advice on how to get my partitions back would be appreciated!
> Hopefully I'm missing something obvious.
>
> Thanks,
> - R
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
