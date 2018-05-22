Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL1k1-0005Q4-Da
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 07:29:56 +0000
Date: Tue, 22 May 2018 09:29:41 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cardoen Pieter <P.Cardoen@TELEVIC.com>
Cc: "richard@nod.at" <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Boris Brezillon
 <Boris.Brezillon@bootlin.com>
Subject: Re: ubi0 warning: 0xc02d6658: error -74 (ECC error) while reading
 64 bytes from PEB
Message-ID: <20180522092941.05c3c223@xps13>
In-Reply-To: <AM0PR0702MB36185844E179A06774067996FF940@AM0PR0702MB3618.eurprd07.prod.outlook.com>
References: <AM0PR0702MB3618DC80EB44C036F19CABEBFF910@AM0PR0702MB3618.eurprd07.prod.outlook.com>
 <AM0PR0702MB36185844E179A06774067996FF940@AM0PR0702MB3618.eurprd07.prod.outlook.com>
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

Hi Pieter,

Please always add Boris in cc please.

On Tue, 22 May 2018 07:19:54 +0000, Cardoen Pieter
<P.Cardoen@TELEVIC.com> wrote:

> Dear
>=20
>=20
> Can someone advice me with this question. It is blocking me and I don't k=
now how to debug this. =20
>=20
>=20
> I am currently trying to use the mainline kernel on a custom imx6ul board=
 with an SLC NAND flash device (29F4G08ABADAH4). When the rootfs is mounted=
, I get continuously ECC errors (see log below).
>=20
> I am however sure that the rootfs is programmed. The device boots with an=
 older kernel version on the same device.
>=20
> I also noticed that with my previous kernel version, it used mtd->_read i=
n function mtd_read while now it is using mtd->_read_oob.
>=20
> =C2=A0When the gpmi driver is loaded, the device gets scanned for bad blo=
cks. In that case nand_read_oob is executed and this results in a call to n=
and_do_read_oob:
> =C2=A0
> =C2=A0=C2=A0=C2=A0 if (!ops->datbuf)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D nand_do_read_oob(mtd, =
from, ops);
> =C2=A0=C2=A0=C2=A0 else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D nand_do_read_ops(mtd, =
from, ops);
>=20
> Can someone assist me how to debug this issue?

As requested in a previous thread by Boris, can you please share the
exact version of each kernel you used there? What version work, what
version does not.

Thanks,
Miqu=C3=A8l
