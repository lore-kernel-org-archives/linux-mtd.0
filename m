Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDzRz-0007U0-LP
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 03:43:50 -0500
Subject: RE: [PATCH] [JFFS2] use MTD_OOB_AUTO
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <003e01c748ff$8822c970$c7a3580a@swcenter.sec.samsung.co.kr>
References: <20070202164729.11475.8623.sendpatchset@localhost.localdomain>
	<003b01c748f5$55ae1d50$c7a3580a@swcenter.sec.samsung.co.kr>
	<1170663136.3628.45.camel@sauron>
	<003e01c748ff$8822c970$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 Feb 2007 10:43:38 +0200
Message-Id: <1170665018.3628.77.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-02-05 at 17:27 +0900, Kyungmin Park wrote:
>=20
> > > const static =3D> static const
> >=20
> > You keep me busy :-)
> >=20
> > const is "type qualifier", static is "storage class=20
> > specifier" (C99, 6.7). The order may be arbitrary.
> >=20
>=20
> Yes, I know it. In fact. it's minor issue.
> I just saw the some works convert from "const static" to "static const" i=
n
> LKML.

Kyungmin,

if you kindly pointed me the LKML posts, I would be grateful!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
