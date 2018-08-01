Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkl44-0004Si-T4
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 06:56:59 +0000
Date: Wed, 1 Aug 2018 08:56:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [bug report] mtd: rawnand: allocate dynamically ONFI parameters
 during detection
Message-ID: <20180801085643.101c3132@xps13>
In-Reply-To: <20180731182654.ybi46jqvm5ygfhk7@kili.mountain>
References: <20180731182654.ybi46jqvm5ygfhk7@kili.mountain>
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

Hi Dan,

Dan Carpenter <dan.carpenter@oracle.com> wrote on Tue, 31 Jul 2018
21:26:54 +0300:

> Hello Miquel Raynal,
>=20
> This is a semi-automatic email about new static checker warnings.
>=20
> The patch 0ff393463e9c: "mtd: rawnand: allocate dynamically ONFI=20
> parameters during detection" from Jul 25, 2018, leads to the=20
> following Smatch complaint:
>=20
>     drivers/mtd/nand/raw/nand_micron.c:93 micron_nand_onfi_init()
>      warn: variable dereferenced before check 'p->onfi' (see line 91)
>=20
> drivers/mtd/nand/raw/nand_micron.c
>     90		struct nand_parameters *p =3D &chip->parameters;
>     91		struct nand_onfi_vendor_micron *micron =3D (void *)p->onfi->vendo=
r;
>                                                                  ^^^^^^^^=
^^^^^^^
> The code dereferences "p->onfi"
>=20
>     92=09
>     93		if (p->onfi) {

That's right, I'll dereference p->onfi only in this block as it's not
used elsewhere.

Thanks,
Miqu=C3=A8l
