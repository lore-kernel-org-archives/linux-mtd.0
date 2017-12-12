Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOgI3-0005T1-Fp
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 08:51:53 +0000
Date: Tue, 12 Dec 2017 09:51:19 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171212095119.475de032@xps13>
In-Reply-To: <a5fc7dea-a043-370c-b18a-eeb8f1f067f4@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <2d491047-cd55-5a0a-83ec-58365f3bf3ff@prevas.dk>
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

Hi Sean,

On Tue, 12 Dec 2017 09:44:43 +0100
Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:

> Hi Miquel,
>=20
> >> This behavior is "normal", it is because the number of failure has
> >> been incremented (probably by marvell_nfc_hw_ecc_correct()).
> >>
> >>
> >> Can you hack the code right before this line [1] and add:
> >> 1/ A dump of both the data buffer and the oob buffer (entirely)
> >> 2/ Add a memset(mtd->oob_poi, 0xff, mtd->oobsize) conditionally
> >> until the probe is finished (you may want to add a global boolean
> >> value that changes its state after the nand_scan_tail() call). =20
> > Instead of hacking this way, to boot until you get a prompt, you may
> > add this property to the nand controller node:
> >
> > nand-ecc-mode =3D "none";
> >
> > Then please use nanddump over a programmed page, including the OOB
> > area.
> >
> > =20
> Boot log:
> [=C2=A0=C2=A0=C2=A0 2.692856] nand: device found, Manufacturer ID: 0x2c, =
Chip ID:
> 0xda [=C2=A0=C2=A0=C2=A0 2.699231] nand: Micron MT29F2G08ABAEAH4
> [=C2=A0=C2=A0=C2=A0 2.703286] nand: 256 MiB, SLC, erase size: 128 KiB, pa=
ge size:
> 2048, OOB size: 64
> [=C2=A0=C2=A0=C2=A0 2.711135] nand: NAND_ECC_NONE selected by board drive=
r. This is
> not recommended!
> [=C2=A0=C2=A0=C2=A0 2.718730] nand: WARNING: pxa3xx_nand-0: the ECC used =
on your
> system is too weak compared to the one required by the NAND chip
> [=C2=A0=C2=A0=C2=A0 2.732632] Bad block table not found for chip 0
> [=C2=A0=C2=A0=C2=A0 2.739609] Bad block table not found for chip 0
> [=C2=A0=C2=A0=C2=A0 2.744250] Scanning device for bad blocks
> [=C2=A0=C2=A0=C2=A0 2.985502] Bad block table written to 0x00000ffe0000, =
version 0x01
> [=C2=A0=C2=A0=C2=A0 2.992760] Bad block table written to 0x00000ffc0000, =
version 0x01
>=20
> Nanddump:
> root@output-module:~# nanddump -oa /dev/mtd1
> ECC failed: 0
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 0
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00000000 and ending at 0x0ff00000...
> UBIXS...
>=20
> I guess it's safe to say something is not right with ECC enabled.
> >> Then please do a raw dump with nanddump from Linux.

Thanks for testing this, but I _really_ need the entire output of

        nanddump -o -n -p -l 0x800 /dev/mtd1

Thank you,
Miqu=C3=A8l
