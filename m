Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOMsb-0000do-EE
 for linux-mtd@lists.infradead.org; Sun, 09 Aug 2015 09:26:58 +0000
From: Naidu Tellapati <Naidu.Tellapati@imgtec.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: quick help - Linux MTD NAND subsystem
Date: Sun, 9 Aug 2015 09:26:27 +0000
Message-ID: <27E62D98F903554192E3C13AFCC91C3C2FB64704@hbmail01.hb.imgtec.org>
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

Hi Experts,=0A=
=0A=
Thanks in advance for your time.  In our Nand Flash Controller's Linux driv=
er I am planning to define the ecclayout as the following.=0A=
=0A=
/* 512-byte page with 4-bit BCH ECC 8-bit */=0A=
static struct nand_ecclayout oob_512_8bit_ecc4 =3D {=0A=
	.eccbytes =3D 8,=0A=
	.eccpos =3D {8, 9, 10, 11, 12, 13, 14, 15},=0A=
	.oobfree =3D { {0, 5}, {6, 2} },=0A=
};=0A=
=0A=
/* 512-byte page with 4-bit ECC, 16-bit */=0A=
static struct nand_ecclayout oob_512_16bit_ecc4 =3D {=0A=
	.eccbytes =3D 8,=0A=
	.eccpos =3D {8, 9, 10, 11, 12, 13, 14, 15},=0A=
	.oobfree =3D { {2, 6}, },=0A=
};=0A=
=0A=
/* 2048-byte page size with 4-bit ECC */=0A=
static struct nand_ecclayout oob_2048_ecc4 =3D {=0A=
	.eccbytes =3D 32,=0A=
	.eccpos =3D {=0A=
		8, 9, 10, 11, 12, 13, 14, 15,=0A=
		16, 17, 18, 19, 20, 21, 22, 23,=0A=
		24, 25, 26, 27, 28, 29, 30, 31,=0A=
		32, 33, 34, 35, 36, 37, 38, 39,=0A=
	},=0A=
	.oobfree =3D { {2, 6}, {40, 24} },=0A=
};=0A=
=0A=
Page Program sequence:=0A=
=0A=
I am taking 2K page size as an example for my discussion.=0A=
=0A=
The ECC engine inside our NAND Flash Controller generates and automatically=
 writes the ECC bytes to the OOB area along with the page data as part of P=
age Program Operation.=0A=
The ECC engine calculates ECC residue bytes on each 512 bytes of data chunk=
, 8 ECC bytes per 512 bytes of data, a total of 32 bytes of EEC per 2K page=
. =0A=
For this to happen, from the driver, we first program the Controller's spar=
e offset register (ECC_SPARE_OFFSET_REGISTER) with the offset in the spare =
area=0A=
on the flash from where the ECC bytes have to be written.=0A=
=0A=
As defined in the above ecclayout example nand_ecclayout oob_2048_ecc4, I w=
ill program the ecc spare offset 8 in the controller's register. =0A=
=0A=
Now could you please help me in understanding the following.=0A=
=0A=
1. Is it mandatory that the JFFS2 always use the following Offsets in OOB a=
rea for storing clean marker information?=0A=
   =0A=
    Nand chips with 512 byte pagesize and 16 byte OOB size   (Offset - 0x08=
 to 0x0f)=0A=
=0A=
    Nand chips with 2048 byte pagesize and 64 byte OOB size  (Offset - 0x10=
 to 0x17)=0A=
=0A=
2. If answer to point 1 is yes, as the ecclayout clashes with the JFFS2 cle=
an marker bytes, with the above 3 ecclayout definitions I think I can't use=
 JFFS2 file system=0A=
    with the above 3 ecclayout configurations. Please correct me if I am wr=
ong.=0A=
=0A=
3. If answer to point 1 is no, shall we program the JFFS2 to use the oobfre=
e (defined in ecclayout) locations for storing clean marker information.=0A=
   If yes, do we need at least 8 oobfree locations for storing clean marker=
 information.=0A=
=0A=
4. Since UBIFS does not make use of OOB area for storing file system specif=
ic information, I think I can always use UBIFS with the above 3 ecclayout d=
efinitions.=0A=
=0A=
5. If we can't support JFFS2 file system, is it acceptable to write a NAND =
Flash Controller Linux driver which works only with UBIFS and does not work=
 with JFFS2.=0A=
=0A=
6. While reading the page data, since the ECC hardware inside our Flash Con=
troller is taking care of correcting any errors detected and finally giving=
 the corrected=0A=
    data to the driver, I think I just need to stub out the following two f=
unctions. Please correct me if I am wrong.=0A=
=0A=
	img->nand.ecc.calculate =3D img_ecc_calculate;=0A=
=0A=
	img->nand.ecc.correct =3D img_ecc_correct;=0A=
=0A=
7. For regular page writes, the driver does not write any ECC data to the f=
lash. Instead we let the Controller handle all the ECC data written to the =
device.=0A=
=0A=
8. Now I am planning to implement the following function in my driver. I un=
derstand that the file system writes the clean block markers to the oobfree=
 area at=0A=
   the time of driver initialization before any page program operation from=
 the NAND Flash Controller. Hence the subsequent page program operations fr=
om the=0A=
   NAND Flash controller (page data + ECC bytes) have to ensure that the cl=
ean block marker bytes in OOB area are not disturbed. Please correct me if =
I am wrong.=0A=
=0A=
            img->nand.ecc.write_oob =3D img_write_oob;=0A=
=0A=
9. I am of the opinion that file system does not invoke the mtd->_write_oob=
() function after it has invoked page program operation. Please correct me =
if I am wrong.=0A=
   If it invokes mtd->_write_oob() after it has invoked page program operat=
ion, the nand_fill_oob function is filling 0xFF to EEC locations in the OOB=
 area.=0A=
=0A=
10. Since the nand_block_markbad_lowlevelfuntion is erasing the block befor=
e marking the block as bad  (in the OOB area), I need not to worry about EC=
C bytes in this particular case.=0A=
=0A=
Thanks and regards,=0A=
Naidu.=0A=
   =0A=
=0A=
=0A=
   =0A=
=0A=
=0A=
=0A=
