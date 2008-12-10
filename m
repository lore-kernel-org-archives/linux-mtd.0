Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAMbn-0002mu-Lx
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 10:48:00 +0000
Subject: Re: [PATCH] new-utils: fix up build system
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1228829890-27302-1-git-send-email-vapier@gentoo.org>
References: <1228829890-27302-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 12:45:07 +0200
Message-Id: <1228905907.13686.240.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Nicolas Pitre <nico@cam.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-12-09 at 08:38 -0500, Mike Frysinger wrote:
> The previous change with CFLAGS handling was not entirely correct.  So fi=
x
> CFLAGS/CPPFLAGS/LDFLAGS to work like standard build systems (i.e. autotoo=
ls)
> and change `ranlib` to $(RANLIB) to fix cross-compiling.
>=20
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
