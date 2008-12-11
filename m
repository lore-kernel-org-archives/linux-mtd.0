Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAera-00072m-GJ
	for linux-mtd@lists.infradead.org; Thu, 11 Dec 2008 06:17:30 +0000
Subject: Re: [PATCH] unify all common build system parts
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1228944506-5792-1-git-send-email-vapier@gentoo.org>
References: <1228944506-5792-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 11 Dec 2008 08:14:57 +0200
Message-Id: <1228976097.13686.373.camel@sauron>
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

I'm sorry, but frankly, I am very bad in Makefile stuff, so I cannot
really review your patch. So let's hope other people do this and wait a
little. If they do not, I'll try to do what I can later.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
