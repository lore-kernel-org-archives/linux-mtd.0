Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dY645-0004ej-Pq
 for linux-mtd@lists.infradead.org; Thu, 20 Jul 2017 07:40:07 +0000
Date: Thu, 20 Jul 2017 09:39:34 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ARM - IMX - NAND - Kernel 4.x - ONFI PARAMETER PAGE FAILS TO
 READ !
Message-ID: <20170720093934.139d2d19@bbrezillon>
In-Reply-To: <D24E577EA1E37B4788A3BFBC418F14A707591CE0@wetsrvex01.loepfe.com>
References: <D24E577EA1E37B4788A3BFBC418F14A707591CE0@wetsrvex01.loepfe.com>
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

On Thu, 20 Jul 2017 06:13:53 +0000
"Vellemans, Noel" <Noel.Vellemans@visionBMS.com> wrote:

> Hi All
> =C2=A0
> I've  running 2.6.35.x for some time now on our IMX53 custom boards ( boo=
ting from nand)
> =C2=A0
> Recently I  started in UPGRADING the kernel to a more recent version ( 4.=
4.75 and/or a 4.12 series kernel).
> Al fine so far.
> =C2=A0
> I'm using 10 boards (100% identical boards) =C2=A0to test drive the new k=
ernel.
> 9 out of the 10 boards are running fine with this new KERNEL , 1 board is=
 failing to recognize the NAND-FLASH ( 8 bits , 2 chips , hardware ECC enab=
led, Micron MT29F16G08ABACAWP) with this NEW kernel ( with the old kernel a=
ll seems to be fine...)
>=20
> =C2=A0The reason for this failure is that when trying to read the ONFI-Pa=
rameter PAGE, there seems to be a one BYTE offset into the bytes READ from =
the NAND-CHIP ( command NAND_CMD_PARAM)
> For 9 of the 10 boards... the data read back STARTS ( as specified ) with=
 ONFI ( and are working fine for multiple days.. )
> =C2=A0
> For the failing CPU/BOARD it starts with NFI ( O is missing) ( all 256 by=
tes are shifted one byte , or otherwise said, the FIRST byte is missing ...=
 ( if the First Byte would be there all would be OK.. so it is no rubbish..=
=C2=A0))
> =C2=A0
> Reading Manufacturer ID: 0x2c, Chip ID: 0x48 , is working... reading ONFI=
 PARAMETER PAGE... is failing ! ( with the 4.4.x-kernel)=C2=A0
> =C2=A0
> I do have swapped the FLASHES =C2=A0and the ERROR stays with the CPU/BOAR=
D.
> =C2=A0
> { Note putting the OLD kernel back ... 2.6.35.x .. and all is working fin=
e.. must be related to NEW-kernel drivers , but could be a silicon bug trig=
gered by some exception=C2=A0if you ask me .. been digging for more than a =
week on this}
> =C2=A0
> I've been cross checking ERATA's but can not find anything that would fit.
> I've been triple checking each NFC register as well .. all registers are =
setup correctly =C2=A0( comparing good/ bad board.=3D> same register settin=
gs) =C2=A0!
> =C2=A0
> =C2=A0
> Any clue ? any hints .. to get me =C2=A0going =C2=A0( as said before,=C2=
=A0=C2=A0i've been searching for one week on this.. no luck so far, in unde=
rstanding / solving the issue .. ! )
>=20
> Details ? ( please see below)
> =C2=A0
> Just for info, type of NAND used ( 2 chips , 8 bit mode) :
> nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x48
> nand: Micron MT29F16G08ABACAWP
> nand: 2048 MiB, SLC, erase size: 512 KiB, page size: 4096, OOB size: 224
> =C2=A0
>=20
> At the error the  Kernel bails out with :=20
>=20
> [    1.646968] nand: Could not find valid ONFI parameter page; aborting
> [    1.653593] nand: No NAND device found
>=20
>=20
> When looking up good ( working) vs  BAD ( not working) .. I come to this.=
 ( I've added some printk's to show the error details)
>=20
> * For a good 'one '  I get this DUMP of the ONFI-parameters-read-back
>=20
> [    2.909684] NAND_CMD_PARAM- data[0] =3D 0x4F =3D> O=20
> [    2.914510] NAND_CMD_PARAM- data[1] =3D 0x4E =3D> N=20
> [    2.919232] NAND_CMD_PARAM- data[2] =3D 0x46 =3D> F=20
> [    2.923986] NAND_CMD_PARAM- data[3] =3D 0x49 =3D> I
> [    2.928706] NAND_CMD_PARAM- data[4] =3D 0x1E
> [    2.933456] NAND_CMD_PARAM- data[5] =3D 0x00
> [    2.938175] NAND_CMD_PARAM- data[6] =3D 0x58
> ..
> ... some bytes/lines are stripped here
> ..
> [    4.149180] NAND_CMD_PARAM- data[254] =3D 0x20 (crc is/or should be he=
re on this offset)
> [    4.154101] NAND_CMD_PARAM- data[255] =3D 0x12 (crc is/or should be he=
re on this offset)
>=20
> =20
> =20
>=20
> * For the bad-one ( on kernel 4.12 / 4.4.x , but working on 2.6.35). I ge=
t this DUMP of the ONFI-parameters-read-back
>=20
>=20
> [    1.819926] NAND_CMD_PARAM- data[0] =3D 0x4E =3D>N
> [    1.824666] NAND_CMD_PARAM- data[1] =3D 0x46 =3D> F
> [    1.829405] NAND_CMD_PARAM- data[2] =3D 0x49 =3D> I
> [    1.834143] NAND_CMD_PARAM- data[3] =3D 0x1E
> [    1.838882] NAND_CMD_PARAM- data[4] =3D 0x00
> [    1.843619] NAND_CMD_PARAM- data[5] =3D 0x58
> ..
> ... some bytes/lines are stripped here
> ..
> [   3.053545] NAND_CMD_PARAM- data[253] =3D 0x20 ????? ( crc byte also on=
 the wrong offset!!!)
> [    3.058458] NAND_CMD_PARAM- data[254] =3D 0x12 (crc is/or should be he=
re on this offset)
> [    3.063371] NAND_CMD_PARAM- data[255] =3D 0x4F ( O of the second ONFI =
parameter block)

Hm, it seems you're missing the first byte. It might be that your
controller is configured in some kind of EDO mode, and I'm pretty sure
the param page should be read in mode 0 (this implies EDO mode
disabled).

Maybe you can try playing with NFC_V3_DELAY_LINE, but honestly, I don't
know the MXC NAND controller enough to tell what could explain this
behavior.

>=20
> =20
>=20
>=20
> The strange thing is 9 out of 10 boards are OK , but 1 out of 10 is BAD .=
.. on these recent kernels.
>=20
> When running the older 2.6.35 kernel.. even on this BAD-board (lets say) =
.. all is working fine.
>=20
> Best Regards
> Noel
>=20
