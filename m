Received: from inet-tsb5.toshiba.co.jp ([202.33.96.24] helo=imx2.toshiba.co.jp)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5tq0-0003ll-7i
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2013 08:06:38 +0000
From: <katsuki.uwatoko@toshiba.co.jp>
To: <vikram186@gmail.com>
Subject: Re: [PATCH] mtd: nand: support BENAND (Built-in ECC NAND)
Date: Thu, 14 Feb 2013 08:06:29 +0000
Message-ID: <F3B6523425E7914AA6214ED358D820AF267473BB@TGXML341.toshiba.local>
References: <F3B6523425E7914AA6214ED358D820AF25D9879D@TGXML316.toshiba.local>
 <511BC9FD.1040600@gmail.com>
In-Reply-To: <511BC9FD.1040600@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <34EA5CD540936B4CB385DBA70DD0268A@toshiba.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vikram,=20

Thank you for comments.

> > +
> > +		/* check BENAND (embedded ECC) */
> > +		if (id_data[0] =3D=3D NAND_MFR_TOSHIBA &&
> > +		    (id_data[4] & 1 << 7))
>=20
> Can the (1 << 7) be made as some macro, with an understandable name?

I will fix this.

> > +			pr_warn("CONFIG_MTD_BENAND not enabled\n");
> > +			BUG();
>=20
> Should you really BUG here?

I think so, because this does not happen.=20
If CONFIG_MTD_NAND_BENAND is not enabled, nobody sets NAND_ECC_BENAND. =20

> If IS_ENABLED is used, the above would go off.

I will rewrite this driver by using "IS_ENABLED" and resend it.

Thanks again,
--=20
UWATOKO Katsuki=
