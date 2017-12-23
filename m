Date: Sat, 23 Dec 2017 15:57:09 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
Message-ID: <20171223155709.2ba16e95@xps13>
In-Reply-To: <87k1xdblxf.fsf@belgarion.home>
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171214070930.0b885f6d@bbrezillon>
 <877etkecig.fsf@belgarion.home> <20171218092535.2ca1fe13@xps13>
 <87y3lxccr7.fsf@belgarion.home>
 <20171220224121.2cb6f690@bbrezillon>
 <87lghucykr.fsf@belgarion.home>
 <20171222222441.0fd77df9@bbrezillon>
 <20171222233730.68d9cb9d@xps13> <87k1xdblxf.fsf@belgarion.home>
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

Hi Robert,

On Sat, 23 Dec 2017 14:42:20 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Miquel RAYNAL <miquel.raynal@free-electrons.com> writes:
>=20
> I removed a lot of people from the recipients, as this is a debug
> session.

Sure!

>=20
> >> > Now I get a lot of these message which I didn't have before :
> >> > [   26.897372] ubi0 warning: ubi_io_read: error -74 (ECC error)
> >> > while reading 126976 bytes from PEB 242:4096, read only 126976 =20
> >> Looks like a mismatch in the ECC config. Can you check the ecc
> >> strength/step_size in both situation (old driver vs new driver)? =20
> >
> > For that, you might want to add traces in marvell_nand_ecc_init()
> > and marvell_nand_hw_ecc_ctrl_init().
> > =20
> >> Could you also dump the NDCR register in both cases? =20
> >
> > NDCR register (as well as NDCBx registers) will appear if you let
> >
> >     #define DEBUG
> >
> > at the beginning of the driver.
> >
> > Also, can you please give us the entire dmesg (I mean the boot, not
> > the flow of UBIFS errors of course). =20
> Here it comes in [3]. I suspect the BBT parser here, here is the
> extract that _might_ be relevant:
> [    3.372907] nand: ->exec_op() parser: pattern not found!

Indeed this might be the problem, it means there is one scenario that
should be handled by the parser that is missing. I am really
interrogative about which one it is and to discover it, can you rebuild
with

        #define DEBUG

in drivers/mtd/nand/nand_base.c too.

This way the core will display the patterns it try to find a match for.

Also to ease the understanding, you might add a dump_stack() right
next to this error message.


> [    3.378445] marvell-nfc pxa3xx-nand:=20
> ... repeats many times ...
> [    3.666571] Bad block table not found for chip 0
> [    3.671368] Scanning device for bad blocks
> [    3.675540] nand: nand_do_read_oob: from =3D 0x00000000, len =3D 64
> [    3.681688] marvell-nfc pxa3xx-nand:=20
> [    3.681688] NDCR:  0x9d079fff
> [    3.681688] NDCB0: 0x000d3000
> [    3.681688] NDCB1: 0x00000000
> [    3.681688] NDCB2: 0x00000000
> [    3.681688] NDCB3: 0x00000000
> [    3.700570] Bad eraseblock 0 at 0x000000000000
>=20
> My configuration is :
>  - make zylonite_defconfig
>  - apply patch in [1] for arch/arm/mach-pxa
>  - apply patch in [2] for drivers/mtd
>  - run the test (make zylonite_defconfig; make;
> do_the_test_with_jenkins) That should give you all my setup
> information, ie. platform_data, ECC and BBT settings (ie. the
> "MBBbt0" pattern).

This is probably a typo, because we expect the pattern to be "MVBbt0"?

>=20
> Cheers.
>=20



Thanks for the help,
Miqu=C3=A8l


--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
