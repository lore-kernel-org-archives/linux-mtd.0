Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDzKT-00079G-Kf
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 03:36:06 -0500
Subject: RE: [RFC PATCH] [MTD] OneNAND: Error message printing and bad
	blockscan	errors
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <003c01c748f8$5ded23a0$c7a3580a@swcenter.sec.samsung.co.kr>
References: <45B0F546.8030406@nokia.com> <45C341FC.50805@nokia.com>
	<003c01c748f8$5ded23a0$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 Feb 2007 10:35:48 +0200
Message-Id: <1170664548.3628.69.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	'Adrian Hunter' <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Kyungmin,

On Mon, 2007-02-05 at 16:36 +0900, Kyungmin Park wrote:
> > What is the status of this?
>=20
> I'm not determine how to handle this one.
> As your opinion, It is one approach which separate the wait function for
> normal and bbt.
> Basically, you want to see what is happen when error occurs. however it's
> not useless for normal users
>=20
> Another approaches are adding new ioctl as "ERRORGETSTATS" or sysfs
> interface.
> The former is more simple and latter needs more works.

All we wanted is not to be silent in case of sever errors. We hit this
in practice, so the demand in the patch is quite practical.

If you do not want to print errors on scanning phase, looks fair enough,
just add an if there. But Adrian found out that there are more
difference between the wait functions in case of scanning and normal
operations - at least because they react on errors differently. It is a
good reason to have 2 separate function, what he did.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
