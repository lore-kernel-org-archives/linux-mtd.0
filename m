Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LB2L9-0001UE-VT
	for linux-mtd@lists.infradead.org; Fri, 12 Dec 2008 07:21:36 +0000
Subject: Re: [PATCH] unify all common build system parts
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1228944506-5792-1-git-send-email-vapier@gentoo.org>
References: <1228944506-5792-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 12 Dec 2008 09:19:05 +0200
Message-Id: <1229066345.13686.413.camel@sauron>
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

On Wed, 2008-12-10 at 16:28 -0500, Mike Frysinger wrote:
> Rather than duplicating the same thing over and over in every Makefile, m=
ove
> it all to common.mk.
>=20
> Other things fixed here:
>  - doing subdirs in parallel
>  - fix src!=3Dbuild compiling in subdirs
>=20
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

I've tried do test your patch and found an issue.

$ make
... build is ok ...
$ make install DESTDIR=3D/home/dedekind/tmp/
... error ...

Could you please take a look at this?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
