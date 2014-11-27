Received: from blu004-omc1s33.hotmail.com ([65.55.116.44])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xtvrb-0001Fc-8v
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 09:59:51 +0000
Message-ID: <BLU171-W77C69784D46C17C50C23B4C2710@phx.gbl>
From: William Smith <terminalnt@outlook.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: nand_do_read_oob() has a bug?
Date: Thu, 27 Nov 2014 09:59:29 +0000
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

Linux3.18-rc6=2C nand_base.c=0A=
=0A=
In nand_do_read_oob()=2C there's a while() loop to deal with continuous mul=
tiple oob read operation.=0A=
=0A=
Assume that:=0A=
=A0 =A0 ops->mode =3D MTD_OPS_PLACE_OOB=3B=0A=
=A0 =A0 ops->ooblen> mtd->oobsize=3B=0A=
=A0 =A0 ops->ooboffs !=3D 0=3B=0A=
then:=0A=
=A0 =A0 len =3D mtd->oobsize=3B=0A=
=0A=
in while() loop:=0A=
=A0 =A0 len =3D min(len=2C readlen)=3B // here=2C len =3D mtd->oobsize=0A=
=A0 =A0 buf =3D nand_transfer_oob(chip=2C buf=2C ops=2C len)=3B=0A=
in function nand_transfer_oob():=0A=
=A0 =A0 memcpy(oob=2C chip->oob_poi + ops->ooboffs=2C len)=3B // here=2C le=
n =3D mtd->oobsize=0A=
=0A=
If the ops->ooboffs is none zero=2C then the copy operation will exceed the=
 (chip->oob_poi + mtd->oobsize)=2C some useless bytes will be copy into buf=
=2C right?=0A=
Is this a bug?=0A=
=0A=
 		 	   		  =
