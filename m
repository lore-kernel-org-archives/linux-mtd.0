Subject: RE: [PATCH] [MTD] [NAND] nand_ecc.c: adding support for 512 byte ecc
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Singh, Vimal" <vimalsingh@ti.com>
In-Reply-To: <19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
References: <19F8576C6E063C45BE387C64729E739403CD517C16@dbde02.ent.ti.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1A@dbde02.ent.ti.com>
	, <ac9c93b10808211139t69d3ce6euaac35368f1514931@mail.gmail.com>
	<19F8576C6E063C45BE387C64729E739403CD517C1B@dbde02.ent.ti.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 22 Aug 2008 09:07:03 +0300
Message-Id: <1219385223.18027.105.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Frans Meulenbroeks <fransmeulenbroeks@gmail.com>,
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

On Fri, 2008-08-22 at 11:09 +0530, Singh, Vimal wrote:
> +       rp16 =3D 0;
> +       rp17 =3D 0; /* to make cmpiler happy */
Please, use

uint32_t uninitialized_var(rp17);

to avoid unnecessary initialization to 0 and avoid gcc warning as well.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
