Received: from mail.free-electrons.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eJfyz-0006jF-F0
 for linux-mtd@lists.infradead.org; Tue, 28 Nov 2017 13:31:37 +0000
Date: Tue, 28 Nov 2017 14:30:55 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech (KREV)" <krev@triax.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171128143055.1ff22979@xps13>
In-Reply-To: <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
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


> > Also, what kernel are you using ? =20
> 4.14.0 :-)

Good !

> [=C2=A0=C2=A0=C2=A0 2.288684] pxa3xx-nand f10d0000.flash: This platform c=
an't do DMA
> on this device

FYI, this is normal, the NAND controller does not have any DMA feature
on Armada 38x (NFCv2).

> [=C2=A0=C2=A0=C2=A0 2.296924] nand: device found, Manufacturer ID: 0x2c, =
Chip ID:
> 0xda [=C2=A0=C2=A0=C2=A0 2.303311] nand: Micron MT29F2G08ABAEAH4
> [=C2=A0=C2=A0=C2=A0 2.307334] nand: 256 MiB, SLC, erase size: 128 KiB, pa=
ge size:
> 2048, OOB size: 64
> [=C2=A0=C2=A0=C2=A0 2.314939] pxa3xx-nand f10d0000.flash: ECC strength 16=
, ECC step=20
> size 2048

In theory, Marvell NAND flash controller does support 16-bit strength
per 512 bytes over 2048 bytes pages. However, this controller driver
(pxa3xx_nand) does not. See [1] for the supported configurations.

The ECC strength shown here is probably the best to use with this type
of NAND device but I suggest you try with 4b/512B by using these two
properties like in [2]:

        nand-ecc-strength =3D <4>;
        nand-ecc-step-size =3D <512>;


Thanks,
Miqu=C3=A8l

[1]
http://elixir.free-electrons.com/linux/v4.14/source/drivers/mtd/nand/pxa3xx=
_nand.c#L1575

[2]
http://elixir.free-electrons.com/linux/v4.14/source/arch/arm/boot/dts/armad=
a-385-db-ap.dts#L172
