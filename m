Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fCudQ-0005EJ-NY
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2018 22:17:34 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Steve deRosier
 <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Tobi Wulff <Tobi.Wulff@alliedtelesis.co.nz>
Subject: NAND ecc-strength (was Re: NAND timeout issues with blank chip and
 Marvell NFC)
Date: Sun, 29 Apr 2018 22:17:08 +0000
Message-ID: <2847aa9260084a6da170afe239a33d36@svr-chch-ex1.atlnz.lc>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

Hi Boris & all,=0A=
=0A=
Permit me a slight tangent.=0A=
=0A=
On 27/04/18 18:16, Boris Brezillon wrote:=0A=
>> The one problem it does have in this configuration is the familiar=0A=
>> "nand: WARNING: pxa3xx_nand-0: the ECC used on your system is too weak=
=0A=
>> compared to the one required by the NAND chip". From what I read in the=
=0A=
>> Marvell datasheet even though the chip requires 8-bits of ECC per 540=0A=
>> bytes of data the 16-bits per 2048 bytes of data implemented by the=0A=
>> controller should satisfy this.=0A=
 >=0A=
> No, it's not true. Well, it will work for some time, and then fail when=
=0A=
> too many erase cycles have been done on a block. You should always try=0A=
> to at least meet the chip requirements. Anyway, that's not really the=0A=
> issue here.=0A=
> =0A=
>> If I set marvell,nand-keep-config or nand-ecc-strength =3D <8>. I get EC=
C=0A=
>> errors reported (probably due to the change in configuration) and=0A=
>> ultimately the mount fails "mount: mounting ubi0:user on /flash failed:=
=0A=
>> Invalid argument" I haven't really dug into where that's coming from.=0A=
 >=0A=
> For the ECC change, that's not surprising, since u-boot probably writes=
=0A=
> things in the 4bit/512 config.=0A=
> =0A=
=0A=
So this raises a bit of concern. A certain NAND flash vendor has =0A=
released an end of life notice for some of their chips (I won't name =0A=
them specifically because I'm not sure if there is a NDA in place). The =0A=
suggested replacement part requires 8bit/540byte ECC whereas the old one =
=0A=
required 4bit/540byte.=0A=
=0A=
The first problem I face is how do we handle the possibility of having =0A=
either chip installed. Since the current dtb has ecc-strength =3D <4> do =
=0A=
we need the bootloader to modify this on the fly this based on some =0A=
identifier that distinguishes old from new? Or is there some way of =0A=
saying ecc-strength =3D <pick a value appropriate for the chip>.=0A=
=0A=
The second problem is that, if I understand correctly, the Marvell NFCv2 =
=0A=
BCH implementation is always 16bit/2048bytes. So even if I get the dts =0A=
to say the right thing the hardware based ECC will ignore it.=0A=
