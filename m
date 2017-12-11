Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOOfA-0007Iv-6p
 for linux-mtd@lists.infradead.org; Mon, 11 Dec 2017 14:02:35 +0000
Date: Mon, 11 Dec 2017 15:02:00 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171211150200.51c7f3b4@xps13>
In-Reply-To: <f70d94b8-5fc7-d091-9a5c-77597d2b7aa4@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
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

On Mon, 11 Dec 2017 14:22:18 +0100
Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:

> Hi Miquel,
> >>> Actually, if you look carefully to the trace behind, you are not
> >>> using the same bad block table with the bootloader ("Bad block
> >>> table not found for chip 0") so the core then reads the OOB area
> >>> of every first page for each block and looks at the first OOB
> >>> bytes for the bad block markers. If there was data there, the
> >>> block will be declared as bad. =20
> >> With the new NFC driver, is the bad block table located elsewhere?
> >> I have not done any changes to my bootloader when i did the switch
> >> to the new driver,
> >> so i guess it should work as before. =20
> >>> Can you please check that by using the configuration that actually
> >>> boots and use nanddump in raw mode with the OOB area (options -n
> >>> and -o)
> >>> to show us the content of the first page of any block of the last
> >>> NAND MTD device?
> >>>
> >>> =20
> >> Will do
> >> =20
> > Dumped from uboot: =20
> > =3D> nand dump.oob 0xffc0000 =20
> > Page 0ffc0000 dump:
> > OOB:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31 74 62 42 56 4d 01 ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff =20
> > =3D> nand dump.oob 0xffe0000 =20
> > Page 0ffe0000 dump:
> > OOB:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4d 56 42 62 74 30 01 ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ff ff ff ff ff ff ff ff
> >
> > I have tried to dump some random pages, and they all contain 0xFF's.
> > I'll try to trace what the NFC driver is reading from the OOBs.
> > =20
> What function is called in the marvel_nand.c driver here [1].
>  From my tracing i can see:
> mtd->_read_oob(mtd, from, ops);
> ->=C2=A0=C2=A0=C2=A0 marvell_nfc_hw_ecc_bch_read_oob
> ->=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 marvell_nfc_hw_ecc_bch_read_page =
=20
> marvell_nfc_hw_ecc_bch_read_page is returning 0 (bitflips)
> But the mtd->_read_oob is returning -74.

This means the hardware detected an ECC error (and the page was not
empty).

>=20
> Some of the tracing:
> [=C2=A0=C2=A0=C2=A0 2.947220] Scanning device for bad blocks
> [=C2=A0=C2=A0=C2=A0 2.951334] mtd_read_oob
> [=C2=A0=C2=A0=C2=A0 2.953874] marvell_nfc_hw_ecc_bch_read_oob
> [=C2=A0=C2=A0=C2=A0 2.958393] marvell_nfc_hw_ecc_bch_read_page: max_bitfl=
ips: 0,
> page 0x0 [=C2=A0=C2=A0=C2=A0 2.965034] marvell_nfc_hw_ecc_bch_read_oob: r=
eturns 0
> [=C2=A0=C2=A0=C2=A0 2.970194] mtd_read_oob: ret_code -74
> [=C2=A0=C2=A0=C2=A0 2.983669] Bad eraseblock 0 at 0x000000000000

This behavior is "normal", it is because the number of failure has
been incremented (probably by marvell_nfc_hw_ecc_correct()).


Can you hack the code right before this line [1] and add:
1/ A dump of both the data buffer and the oob buffer (entirely)
2/ Add a memset(mtd->oob_poi, 0xff, mtd->oobsize) conditionally until
the probe is finished (you may want to add a global boolean value that
changes its state after the nand_scan_tail() call).

Then please do a raw dump with nanddump from Linux.


Also, please try booting without the nand-keep-config property.

Thank you,
Miqu=C3=A8l

[1]
https://github.com/miquelraynal/linux/blob/marvell/nand-next/nfc-rework/dri=
vers/mtd/nand/marvell_nand.c#L1351
