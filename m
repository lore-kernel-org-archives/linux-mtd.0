Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOiqp-0001xh-6F
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 11:35:57 +0000
Date: Tue, 12 Dec 2017 12:35:23 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171212123523.48185f21@xps13>
In-Reply-To: <a0267c71-4333-7dd4-dcf4-14aced37f8f9@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171130181847.0bbc58b5@xps13>
 <5bc5d326-af1f-44d2-468a-d211212c4612@prevas.dk>
 <20171201091539.5d6b7572@xps13>
 <744e99ee-91cf-28bc-21eb-c3fa01fb0a01@prevas.dk>
 <20171207213814.4c57098f@xps13>
 <26441ab5-8c70-4d7f-5e0d-bec3d59e2ef2@prevas.dk>
 <20171208102148.0a2c0fbe@xps13>
 <e1f47fe9-9b05-fdcd-b7ed-10e8cbced3a4@prevas.dk>
 <20171211105359.7eb1aeb3@xps13>
 <d0dee517-8061-5d40-aa82-6d4c5cda4fb1@prevas.dk>
 <a2502de6-b4c7-befb-6a08-de976be85d17@prevas.dk>
 <f70d94b8-5fc7-d091-9a5c-77597d2b7aa4@prevas.dk>
 <20171211150200.51c7f3b4@xps13> <20171211150929.722a361a@xps13>
 <a5fc7dea-a043-370c-b18a-eeb8f1f067f4@prevas.dk>
 <20171212095119.475de032@xps13>
 <727489cf-d1f6-8777-c6f4-981127657c9d@prevas.dk>
 <20171212111227.4946cc15@xps13>
 <e9e6bf70-918f-b750-5893-55744dc34882@prevas.dk>
 <20171212120806.7c31463f@xps13>
 <a0267c71-4333-7dd4-dcf4-14aced37f8f9@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 12 Dec 2017 12:28:46 +0100
Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:

> On 2017-12-12 12:08, Miquel RAYNAL wrote:
> > On Tue, 12 Dec 2017 11:55:22 +0100
> > Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:
> > =20
> >> Hi Miquel =20
> >>> Are you sure your U-Boot does actually use the BBT?
> >>>
> >>> The last two blocks (supposedly written by U-Boot) are usually
> >>> declared bad by Linux when it does not find the BBT. This is not
> >>> the case, like if the last blocks were empty.
> >>>
> >>> Could you try this, still with "ecc-none" and without the
> >>> "nand-keep-config" property: =20
> >> &nand_controller {
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "okay";
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "defaul=
t";
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&nand_pins=
>, <&nand_rb>;
> >>
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nand@0 {
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0>;
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 label =3D "pxa3xx_nand-0";
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 marvell,rb =3D <0>;
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 nand-ecc-mode =3D "none";
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 nand-on-flash-bbt;
> >>   =C2=A0=C2=A0=C2=A0 };
> >> }; =20
> >>> 1/ From U-Boot, scrub the last 4 blocks. As your NAND is 256MiB
> >>> wide with 128kiB blocks, this should do the trick:
> >>>
> >>>           nand scrub 0xFF80000 0x80000
> >>>
> >>> 2/ At this point, U-Boot should tell you it cannot find a bad
> >>> block table, a second later it will tell you that it created it
> >>> twice at the end of the NAND chip. =20
> >> Yes uboot is recreating the bbt and after a new reset it recognise
> >> the new bbt. =20
> >>> 3/ Boot Linux with ECC =3D=3D none
> >>> 4/ Dump the first page of the 4 last blocks:
> >>>
> >>>           nanddump -nop -l 0x800 -s <adddr> /dev/mtd1 =20
> >> See tracing below =20
> >>> Supposedly that /dev/mtd1 is the _last_ MTD partition of your NAND
> >>> device and <addr> being sequentially:
> >>>
> >>>           0xFF80000
> >>>           0xFFA0000
> >>>           0xFFC0000
> >>>           0xFFE0000
> >>>
> >>> Please copy/paste the overall trace without any cuts (including
> >>> U-Boot traces, literally everything).
> >>>    =20
> >>
> >> U-Boot 2017.11-00035-ge9282bb30b-dirty (Dec 12 2017 - 11:22:21
> >> +0100)
> >>
> >> SoC:=C2=A0=C2=A0 MV88F6810-A0 at 1066 MHz
> >> DRAM:=C2=A0 1 GiB (533 MHz, 16-bit, ECC not enabled)
> >> WDT:=C2=A0=C2=A0 Enabling Armada 385 watchdog.
> >> NAND:=C2=A0 PXA3xx: strength 4, ecc_stepsize 512, page_size 2048
> >> 256 MiB
> >> Bad block table found at page 131008, version 0x01
> >> Bad block table found at page 130944, version 0x01
> >> Model: Triax dvb-tc output
> >> Board: Triax dvb-tc output
> >> Net:
> >> Warning: ethernet@30000 (eth0) using random MAC address -
> >> 26:d3:56:98:ca:b4 eth0: ethernet@30000 =20
> >> =3D> nand scrub 0xFF80000 0x80000 =20
> >>
> >> NAND scrub: device 0 offset 0xff80000, size 0x80000
> >> Warning: scrub option will erase all factory set bad blocks!
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 There is no reliabl=
e way to recover them.
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Use this command on=
ly for testing purposes if you
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are sure of what yo=
u are doing!
> >>
> >> Really scrub this NAND flash? <y/N>
> >> y
> >> Erasing at 0xffe0000 -- 100% complete.
> >> OK =20
> >> =3D> boot =20
> >>
> >> Starting kernel ...
> >>
> >> [=C2=A0=C2=A0=C2=A0 0.000000] Booting Linux on physical CPU 0x0
> >> [=C2=A0=C2=A0=C2=A0 0.000000] Linux version 4.15.0-rc1-00094-g1791eb8f=
2475-dirty
> >> (skn@skn) (gcc version 7.2.0 (Arch Repository)) #30 SMP PREEMPT Tue
> >> Dec 12 09:28:30 CET 2017
> >> ...
> >> [=C2=A0=C2=A0=C2=A0 2.692801] nand: device found, Manufacturer ID: 0x2=
c, Chip ID:
> >> 0xda [=C2=A0=C2=A0=C2=A0 2.699176] nand: Micron MT29F2G08ABAEAH4
> >> [=C2=A0=C2=A0=C2=A0 2.703232] nand: 256 MiB, SLC, erase size: 128 KiB,=
 page size:
> >> 2048, OOB size: 64
> >> [=C2=A0=C2=A0=C2=A0 2.710928] nand: NAND_ECC_NONE selected by board dr=
iver. This
> >> is not recommended!
> >> [=C2=A0=C2=A0=C2=A0 2.718523] nand: WARNING: pxa3xx_nand-0: the ECC us=
ed on your
> >> system is too weak compared to the one required by the NAND chip
> >> [=C2=A0=C2=A0=C2=A0 2.731429] Bad block table not found for chip 0
> >> [=C2=A0=C2=A0=C2=A0 2.737384] Bad block table not found for chip 0
> >> [=C2=A0=C2=A0=C2=A0 2.742024] Scanning device for bad blocks
> >> [=C2=A0=C2=A0=C2=A0 2.891818] Bad block table written to 0x00000ffe000=
0, version
> >> 0x01 [=C2=A0=C2=A0=C2=A0 2.898837] Bad block table written to 0x00000f=
fc0000,
> >> version 0x01 [=C2=A0=C2=A0=C2=A0 2.905152] 2 cmdlinepart partitions fo=
und on MTD
> >> device pxa3xx_nand-0 [=C2=A0=C2=A0=C2=A0 2.911708] Creating 2 MTD part=
itions on
> >> "pxa3xx_nand-0": [=C2=A0=C2=A0=C2=A0 2.917130] 0x000000000000-0x000000=
100000 :
> >> "uboot" [=C2=A0=C2=A0=C2=A0 2.922512] 0x000000100000-0x000010000000 : =
"ubi0"
> >> ...
> >> output-module login: root
> >> Password:
> >> root@output-module:~#
> >> root@output-module:~# nanddump -nop -l 0x800 -s 0xFF80000 /dev/mtd1
> >> Block size 131072, page size 2048, OOB size 64
> >> Dumping data starting at 0x0ff80000 and ending at 0x0ff80800...
> >> root@output-module:~# nanddump -nop -l 0x800 -s 0xFFA0000 /dev/mtd1
> >> Block size 131072, page size 2048, OOB size 64
> >> Dumping data starting at 0x0ffa0000 and ending at 0x0ffa0800...
> >> root@output-module:~# nanddump -nop -l 0x800 -s 0xFFC0000 /dev/mtd1
> >> Block size 131072, page size 2048, OOB size 64
> >> Dumping data starting at 0x0ffc0000 and ending at 0x0ffc0800...
> >> root@output-module:~# nanddump -nop -l 0x800 -s 0xFFE0000 /dev/mtd1
> >> Block size 131072, page size 2048, OOB size 64
> >> Dumping data starting at 0x0ffe0000 and ending at 0x0ffe0800...
> >> root@output-module:~# reboot
> >> ...
> >> U-Boot 2017.11-00035-ge9282bb30b-dirty (Dec 12 2017 - 11:22:21
> >> +0100)
> >>
> >> SoC:=C2=A0=C2=A0 MV88F6810-A0 at 1066 MHz
> >> DRAM:=C2=A0 1 GiB (533 MHz, 16-bit, ECC not enabled)
> >> WDT:=C2=A0=C2=A0 Enabling Armada 385 watchdog.
> >> NAND:=C2=A0 PXA3xx: strength 4, ecc_stepsize 512, page_size 2048
> >> 256 MiB
> >> Bad block table not found for chip 0
> >> Bad block table not found for chip 0
> >> Scanning device for bad blocks
> >> Bad block table written to 0x00000ffe0000, version 0x01
> >> Bad block table written to 0x00000ffc0000, version 0x01
> >>
> >> If I reboot uboot is unable recognise the bbt, but recreates it.
> >> But the kernel is scanning on every boot.
> >> Am I doing anything wrong in the nanddump command? =20
> > I did not realize your NAND had 2 partitions (I though /dev/mtd0 was
> > something else). =20
> Sorry i should have said that :-)
> >
> > In Linux, the offset your give to nanddump is from the beginning of
> > the MTD device, not the NAND device. Because /dev/mtd1 starts at
> > 0x100000 (8 blocks are used for U-Boot), you have to substract
> > 0x100000 from the offsets I gave you otherwise you read beyond the
> > device (ie. nothing).
> >
> > Please try again with:
> >
> >          0xFE80000
> >          0xFEA0000
> >          0xFEC0000
> >          0xFEE0000 =20
> root@wandboard:~# nanddump -nop -l 0x800 -s 0xFE80000 /dev/mtd1
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x0fe80000 and ending at 0x0fe80800...
> root@wandboard:~# nanddump -nop -l 0x800 -s 0xFEA0000 /dev/mtd1
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x0fea0000 and ending at 0x0fea0800...
> root@wandboard:~# nanddump -nop -l 0x800 -s 0xFEC0000 /dev/mtd1
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x0fec0000 and ending at 0x0fec0800...
> root@wandboard:~# nanddump -nop -l 0x800 -s 0xFEE0000 /dev/mtd1
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x0fee0000 and ending at 0x0fee0800...
>=20

Failure is on me for this one: Linux marks the block containing the BBT
as bad to avoid user accesses on it, please use --bb=3Ddumpbad in the
nanddump command.

Once you will have the trace, please do the same again without
on-flash-bbt, this way we can compare both U-Boot and Linux layouts and
find what is wrong.

Thank you,
Miqu=C3=A8l
