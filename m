Received: from mail1.bemta5.messagelabs.com ([195.245.231.141])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dY4j7-0004D6-J1
 for linux-mtd@lists.infradead.org; Thu, 20 Jul 2017 06:14:23 +0000
Received: from wetsrvex01.loepfe.com (wetsrvex01.loepfe.com [10.55.2.117])
 by wetsrvsepp01.loepfe.com (Postfix) with ESMTPS
 for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2017 08:13:54 +0200 (CEST)
From: "Vellemans, Noel" <Noel.Vellemans@visionBMS.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ARM - IMX - NAND - Kernel 4.x - ONFI PARAMETER PAGE FAILS TO READ !
Date: Thu, 20 Jul 2017 06:13:53 +0000
Message-ID: <D24E577EA1E37B4788A3BFBC418F14A707591CE0@wetsrvex01.loepfe.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All
=A0
I've  running 2.6.35.x for some time now on our IMX53 custom boards ( booti=
ng from nand)
=A0
Recently I  started in UPGRADING the kernel to a more recent version ( 4.4.=
75 and/or a 4.12 series kernel).
Al fine so far.
=A0
I'm using 10 boards (100% identical boards) =A0to test drive the new kernel=
.
9 out of the 10 boards are running fine with this new KERNEL , 1 board is f=
ailing to recognize the NAND-FLASH ( 8 bits , 2 chips , hardware ECC enable=
d, Micron MT29F16G08ABACAWP) with this NEW kernel ( with the old kernel all=
 seems to be fine...)

=A0The reason for this failure is that when trying to read the ONFI-Paramet=
er PAGE, there seems to be a one BYTE offset into the bytes READ from the N=
AND-CHIP ( command NAND_CMD_PARAM)
For 9 of the 10 boards... the data read back STARTS ( as specified ) with O=
NFI ( and are working fine for multiple days.. )
=A0
For the failing CPU/BOARD it starts with NFI ( O is missing) ( all 256 byte=
s are shifted one byte , or otherwise said, the FIRST byte is missing ... (=
 if the First Byte would be there all would be OK.. so it is no rubbish..=
=A0))
=A0
Reading Manufacturer ID: 0x2c, Chip ID: 0x48 , is working... reading ONFI P=
ARAMETER PAGE... is failing ! ( with the 4.4.x-kernel)=A0
=A0
I do have swapped the FLASHES =A0and the ERROR stays with the CPU/BOARD.
=A0
{ Note putting the OLD kernel back ... 2.6.35.x .. and all is working fine.=
. must be related to NEW-kernel drivers , but could be a silicon bug trigge=
red by some exception=A0if you ask me .. been digging for more than a week =
on this}
=A0
I've been cross checking ERATA's but can not find anything that would fit.
I've been triple checking each NFC register as well .. all registers are se=
tup correctly =A0( comparing good/ bad board.=3D> same register settings) =
=A0!
=A0
=A0
Any clue ? any hints .. to get me =A0going =A0( as said before,=A0=A0i've b=
een searching for one week on this.. no luck so far, in understanding / sol=
ving the issue .. ! )

Details ? ( please see below)
=A0
Just for info, type of NAND used ( 2 chips , 8 bit mode) :
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x48
nand: Micron MT29F16G08ABACAWP
nand: 2048 MiB, SLC, erase size: 512 KiB, page size: 4096, OOB size: 224
=A0

At the error the  Kernel bails out with :=20

[    1.646968] nand: Could not find valid ONFI parameter page; aborting
[    1.653593] nand: No NAND device found


When looking up good ( working) vs  BAD ( not working) .. I come to this. (=
 I've added some printk's to show the error details)

* For a good 'one '  I get this DUMP of the ONFI-parameters-read-back

[    2.909684] NAND_CMD_PARAM- data[0] =3D 0x4F =3D> O=20
[    2.914510] NAND_CMD_PARAM- data[1] =3D 0x4E =3D> N=20
[    2.919232] NAND_CMD_PARAM- data[2] =3D 0x46 =3D> F=20
[    2.923986] NAND_CMD_PARAM- data[3] =3D 0x49 =3D> I
[    2.928706] NAND_CMD_PARAM- data[4] =3D 0x1E
[    2.933456] NAND_CMD_PARAM- data[5] =3D 0x00
[    2.938175] NAND_CMD_PARAM- data[6] =3D 0x58
..
... some bytes/lines are stripped here
..
[    4.149180] NAND_CMD_PARAM- data[254] =3D 0x20 (crc is/or should be here=
 on this offset)
[    4.154101] NAND_CMD_PARAM- data[255] =3D 0x12 (crc is/or should be here=
 on this offset)

=20
=20

* For the bad-one ( on kernel 4.12 / 4.4.x , but working on 2.6.35). I get =
this DUMP of the ONFI-parameters-read-back


[    1.819926] NAND_CMD_PARAM- data[0] =3D 0x4E =3D>N
[    1.824666] NAND_CMD_PARAM- data[1] =3D 0x46 =3D> F
[    1.829405] NAND_CMD_PARAM- data[2] =3D 0x49 =3D> I
[    1.834143] NAND_CMD_PARAM- data[3] =3D 0x1E
[    1.838882] NAND_CMD_PARAM- data[4] =3D 0x00
[    1.843619] NAND_CMD_PARAM- data[5] =3D 0x58
..
... some bytes/lines are stripped here
..
[   3.053545] NAND_CMD_PARAM- data[253] =3D 0x20 ????? ( crc byte also on t=
he wrong offset!!!)
[    3.058458] NAND_CMD_PARAM- data[254] =3D 0x12 (crc is/or should be here=
 on this offset)
[    3.063371] NAND_CMD_PARAM- data[255] =3D 0x4F ( O of the second ONFI pa=
rameter block)

=20


The strange thing is 9 out of 10 boards are OK , but 1 out of 10 is BAD ...=
 on these recent kernels.

When running the older 2.6.35 kernel.. even on this BAD-board (lets say) ..=
 all is working fine.

Best Regards
Noel
