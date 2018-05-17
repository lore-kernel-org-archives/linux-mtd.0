Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJIUc-0007lz-J2
 for linux-mtd@lists.infradead.org; Thu, 17 May 2018 12:58:52 +0000
Date: Thu, 17 May 2018 14:58:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cardoen Pieter <P.Cardoen@TELEVIC.com>
Cc: "han.xu@nxp.com" <han.xu@nxp.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@wedev4u.fr"
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI nand flash ECC errors with mainline kernel
Message-ID: <20180517145837.18b0eb42@xps13>
In-Reply-To: <HE1PR0702MB36280A19BA89FA74BB3AACE8FF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
References: <HE1PR0702MB362877849767B637814CF9B6FF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
 <20180515135900.3bf24b98@xps13>
 <HE1PR0702MB36288289EA58B7D0B5368A9FFF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
 <20180515153622.738a3f53@xps13>
 <HE1PR0702MB3628CC11A1E13A0C740F1CDDFF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
 <HE1PR0702MB36280A19BA89FA74BB3AACE8FF930@HE1PR0702MB3628.eurprd07.prod.outlook.com>
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

Hi Cardoen,

FYI your emails are still not reaching the MTD ML.

On Thu, 17 May 2018 07:45:43 +0000, Cardoen Pieter
<P.Cardoen@TELEVIC.com> wrote:

> Dear Miquel
>=20
>=20
> I've been continuing debugging. When the gpmi driver is loaded, the devic=
e gets scanned for bad blocks. In that case nand_read_oob is executed and t=
his results in a call to nand_do_read_oob:
>=20
>=20
>     if (!ops->datbuf)
>         ret =3D nand_do_read_oob(mtd, from, ops);
>     else
>         ret =3D nand_do_read_ops(mtd, from, ops);
>=20
>=20
> But if the nand flash gets mounted, nand_read_oob is also executed but it=
 results in nand_do_read_ops and I don't see that the read functions of the=
 gpmi driver are executed.
>=20
>=20
> Hopefully, this can help to find the solution of this issue.

Unfortunately I doubt this is the root cause for the ECC errors neither.

Could you also please answer Boris's questions:

> > Which version works? Is this a vendor tree or a mainline kernel? Looks
> > like the version that fails is 4.15. Are you sure the ECC config is
> > exactly the same between the old and new kernel?

Thanks,
Miqu=C3=A8l
