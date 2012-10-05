Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TJw8S-0004ul-Gp
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 00:51:26 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Subject: Re: m25p80: missing MTD owner
Date: Fri, 5 Oct 2012 02:51:18 +0200
References: <50694DCB.6010303@parrot.com>
In-Reply-To: <50694DCB.6010303@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201210050251.18859.marex@denx.de>
Cc: =?iso-8859-1?q?Gr=E9gor_Boirie?= <gregor.boirie@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Gr=E9gor Boirie,

> Hi all,
>=20
> It seems possible to unload m25p80 module while a JFFS2 partition is
> still mounted onto flash. This produces oops when MTD layer tries to
> access underlying device later on.
>=20
> A quick look at m25p_probe shows that "owner" field of allocated mtd
> device structure is left uninitialized, preventing MTD layer from
> incrementing module usage count. This patch for v3.4.11 solves the issue
> for me :
>=20
> @@ -873,6 +873,7 @@ static int __devinit m25p_probe(struct spi_device *sp=
i)
>         else
>                 flash->mtd.name =3D dev_name(&spi->dev);
>=20
> +       flash->mtd.owner =3D THIS_MODULE;
>         flash->mtd.type =3D MTD_NORFLASH;
>         flash->mtd.writesize =3D 1;
>         flash->mtd.flags =3D MTD_CAP_NORFLASH;
>=20
>=20
> Regards.

Do you mind submitting a proper patch via git send-email please?

Best regards,
Marek Vasut
