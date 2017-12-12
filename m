Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOhYT-0005oM-Jm
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 10:12:55 +0000
Date: Tue, 12 Dec 2017 11:12:27 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171212111227.4946cc15@xps13>
In-Reply-To: <727489cf-d1f6-8777-c6f4-981127657c9d@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128150417.17d53b5a@xps13>
 <1e2bea86-e429-e3c4-a6e4-c2c82457a061@prevas.dk>
 <20171129090305.0174246d@xps13>
 <aeb06060-015e-85b4-5b6d-4427dfd1e11a@prevas.dk>
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

Hello Sean,

On Tue, 12 Dec 2017 09:56:19 +0100
Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:

> Hi Miquel,
> >> Boot log:
> >> [=C2=A0=C2=A0=C2=A0 2.692856] nand: device found, Manufacturer ID: 0x2=
c, Chip ID:
> >> 0xda [=C2=A0=C2=A0=C2=A0 2.699231] nand: Micron MT29F2G08ABAEAH4
> >> [=C2=A0=C2=A0=C2=A0 2.703286] nand: 256 MiB, SLC, erase size: 128 KiB,=
 page size:
> >> 2048, OOB size: 64
> >> [=C2=A0=C2=A0=C2=A0 2.711135] nand: NAND_ECC_NONE selected by board dr=
iver. This
> >> is not recommended!
> >> [=C2=A0=C2=A0=C2=A0 2.718730] nand: WARNING: pxa3xx_nand-0: the ECC us=
ed on your
> >> system is too weak compared to the one required by the NAND chip
> >> [=C2=A0=C2=A0=C2=A0 2.732632] Bad block table not found for chip 0
> >> [=C2=A0=C2=A0=C2=A0 2.739609] Bad block table not found for chip 0
> >> [=C2=A0=C2=A0=C2=A0 2.744250] Scanning device for bad blocks
> >> [=C2=A0=C2=A0=C2=A0 2.985502] Bad block table written to 0x00000ffe000=
0, version
> >> 0x01 [=C2=A0=C2=A0=C2=A0 2.992760] Bad block table written to 0x00000f=
fc0000,
> >> version 0x01
> >>
> >> Nanddump:
> >> root@output-module:~# nanddump -oa /dev/mtd1
> >> ECC failed: 0
> >> ECC corrected: 0
> >> Number of bad blocks: 0
> >> Number of bbt blocks: 0
> >> Block size 131072, page size 2048, OOB size 64
> >> Dumping data starting at 0x00000000 and ending at 0x0ff00000...
> >> UBIXS...
> >>
> >> I guess it's safe to say something is not right with ECC enabled. =20
> >>>> Then please do a raw dump with nanddump from Linux. =20
> > Thanks for testing this, but I _really_ need the entire output of
> >
> >          nanddump -o -n -p -l 0x800 /dev/mtd1 =20
> root@output-module:~# nanddump -o -n -p -l 0x800 /dev/mtd1
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00000000 and ending at 0x00000800...

[...]

>  =C2=A0 OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>  =C2=A0 OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>  =C2=A0 OOB Data: c1 eb aa 03 d3 5c d8 ae fa fd ba 34 2a a5 20 38
>  =C2=A0 OOB Data: fd 0b 22 59 c1 8c 3c a5 a4 62 df f2 d4 7e ff ff

This is exactly what the driver expects, an empty spare area (free OOB)
of 32B, 30B of ECC and 2B lost.

Are you sure your U-Boot does actually use the BBT?

The last two blocks (supposedly written by U-Boot) are usually declared
bad by Linux when it does not find the BBT. This is not the case, like
if the last blocks were empty.

Could you try this, still with "ecc-none" and without the
"nand-keep-config" property:

1/ From U-Boot, scrub the last 4 blocks. As your NAND is 256MiB
wide with 128kiB blocks, this should do the trick:

        nand scrub 0xFF80000 0x80000

2/ At this point, U-Boot should tell you it cannot find a bad block
table, a second later it will tell you that it created it twice at the
end of the NAND chip.

3/ Boot Linux with ECC =3D=3D none
4/ Dump the first page of the 4 last blocks:

        nanddump -nop -l 0x800 -s <adddr> /dev/mtd1

Supposedly that /dev/mtd1 is the _last_ MTD partition of your NAND
device and <addr> being sequentially:

        0xFF80000
        0xFFA0000
        0xFFC0000
        0xFFE0000

Please copy/paste the overall trace without any cuts (including U-Boot
traces, literally everything).

Thanks for your effort,
Miqu=C3=A8l
