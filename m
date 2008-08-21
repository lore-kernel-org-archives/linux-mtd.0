Subject: RE: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Singh, Vimal" <vimalsingh@ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 21 Aug 2008 13:55:03 +0300
Message-Id: <1219316103.18027.60.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	frans <fransmeulenbroeks@gmail.com>,
	Woodhouse <dwmw2@infradead.org>, David@mgw-mx06.nokia.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> +	/* 256 or 512 bytes/ecc  */
> +	uint32_t j =3D(((struct nand_chip *)mtd->priv)->ecc.size)/256;

It's certainly faster to use >> 8 instead. At least on x86 GCC would not
optimize this for you if the kernel is compiles with -Os, it would use
idiv instead.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
