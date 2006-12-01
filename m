Received: from mgw-ext04.nokia.com ([131.228.20.96])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gq5B4-0001WJ-2x
	for linux-mtd@lists.infradead.org; Fri, 01 Dec 2006 04:59:33 -0500
Subject: RE: NOR read/write beyond end of flash partition
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tigadi Kiran-r10350c <R10350C@freescale.com>
In-Reply-To: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD89156A1@zin33exm21.fsl.freescale.net>
References: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD89156A1@zin33exm21.fsl.freescale.net>
Content-Type: text/plain; charset=utf-8
Date: Fri, 01 Dec 2006 11:59:20 +0200
Message-Id: <1164967160.20337.8.camel@sauron>
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

On Fri, 2006-12-01 at 15:18 +0530, Tigadi Kiran-r10350c wrote:
> Hi Artem,
>=20
> As write routine implementation has -ENOSPC, I created patch with read ro=
utine returning same value.
>=20
> So, please let me know which patch is valid?

Pardon? I think there is no need in a patch and mtd_read() is ok as it
is.


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
