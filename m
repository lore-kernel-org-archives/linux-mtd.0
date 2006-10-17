Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZr80-0001wK-7Z
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 11:45:23 -0400
Subject: Re: [PATCH] [MTD] [CORE]: Fix MEMGETOOBSEL and ECCGETLAYOUT ioctls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610171720200.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610171720200.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Oct 2006 18:45:11 +0300
Message-Id: <1161099911.3260.97.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard,

On Tue, 2006-10-17 at 17:27 +0200, Ricard Wanderlof wrote:
> Hi,
>=20
> This is my first patch submission, so please correct me if I've done=20
> anything stupid or just plain wrong. :-)
>=20
>=20
> 1. The ECCGETLAYOUT ioctl copy_to_user() call has a superfluous '&'=20
> causing the resulting information to be garbage rather than the intended=20
> mtd->ecclayout.
>=20
> 2. The MEMGETOOBSEL misses copying mtd->ecclayout->eccbytes so the
> resulting field of the returned structure contains garbage.

the patch looks OK, but it does not apply to the mtd git kernel. Will
you mind to send a patch against mtd-2.6.git please?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
