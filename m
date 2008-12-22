Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LEeUY-00046L-Dv
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2008 06:42:14 +0000
Subject: Re: [PATCH v2] unify all common build system parts
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1229634318-12997-1-git-send-email-vapier@gentoo.org>
References: <1229634318-12997-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Mon, 22 Dec 2008 08:42:23 +0200
Message-Id: <1229928143.2756.26.camel@sauron>
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

On Thu, 2008-12-18 at 16:05 -0500, Mike Frysinger wrote:
> Rather than duplicating the same thing over and over in every Makefile,
> move it all to common.mk.
>=20
> Other things fixed here:
>  - doing subdirs in parallel
>  - fix src!=3Dbuild compiling in subdirs

Thanks, tested, pushed.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
