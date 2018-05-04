Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEUrM-0001BZ-Qt
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 07:10:31 +0000
Date: Fri, 4 May 2018 09:10:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, "David Woodhouse" <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: fix command xtype in BCH write hook
Message-ID: <20180504091001.3e6650d6@xps13>
In-Reply-To: <f1b88811dd88481da1c1b84341bbc9a5@svr-chch-ex1.atlnz.lc>
References: <20180503100027.16229-1-miquel.raynal@bootlin.com>
 <f1b88811dd88481da1c1b84341bbc9a5@svr-chch-ex1.atlnz.lc>
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

Hi Chris,

On Fri, 4 May 2018 00:06:48 +0000, Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi Miquel,
>=20
> On 03/05/18 22:00, Miquel Raynal wrote:
> > One layout supported by the Marvell NAND controller supports NAND pages
> > of 2048 bytes, all handled in one single chunk when using BCH with a
> > strength of 4-bit per 512 bytes. In this case, instead of the generic
> > XTYPE_WRITE_DISPATCH/XTYPE_LAST_NAKED_RW couple, the controller expects
> > to receive XTYPE_MONOLITHIC_RW.
> >=20
> > This fixes problems at boot like:
> >=20
> > [    1.315475] Scanning device for bad blocks
> > [    3.203108] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
> > [    3.209564] nand_bbt: error while writing BBT block -110
> > [    4.243106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
> > [    5.283106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
> > [    5.289562] nand_bbt: error -110 while marking block 2047 bad
> > [    6.323106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
> > [    6.329559] nand_bbt: error while writing BBT block -110
> > [    7.363106] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
> > [    8.403105] marvell-nfc f10d0000.flash: Timeout waiting for RB signal
> > [    8.409559] nand_bbt: error -110 while marking block 2046 bad
> > ...
> >=20
> > Fixes: 02f26ecf8c772 ("mtd: nand: add reworked Marvell NAND controller =
driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> For the following combinations
>=20
> SoC             NAND                    Size     EB      Page OOB
> ---             ----                    ----     --      ---- ---
> Armada-385      Micron MT29F8G08ABACAWP 1024 MiB 256 KiB 4096 224
> Armada-385      Micron MT29F2G08ABAEAWP 256 MiB  128 KiB 2048 64
> Armada-385      Macronix MX30LF2G18AC   256 MiB  128 KiB 2048 64
> Armada-98DX4251 AMD/Spansion S34ML08G2  1024 MiB 128 KiB 2048 128
> Armada-98DX4251 Macronix MX60LF8G18AC   1024 MiB 128 KiB 2048 64
> Armada-98DX4251 Micron MT29F8G08ABABAWP 1024 MiB 512 KiB 4096 224
>=20
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Thank you very much for testing all this!

>=20
> I do have one platform that passes the initial detection but starts to=20
> report ubifs errors when mounted.
>=20
> Armada-98DX4251 Micron MT29F8G08ABACAWP 1024 MiB 256 KiB 4096 224
>=20
> This is probably unrelated to this particular fix. It may be as simple=20
> as something not catering for the Armada-98DX4251 SoC or a genuine=20
> difference between Armada-98DX4251 and Armada-385. 4.16.4 with=20
> pxa3xx_nand works with this combination.

Can you please share more details: the device tree (at least the NAND
node), the strength requested, the boot log, the errors?

Are you sure Linux ECC configuration is aligned with the bootloader's?

Thanks,
Miqu=C3=A8l


--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
