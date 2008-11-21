Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L3TTi-0004z8-Dp
	for linux-mtd@lists.infradead.org; Fri, 21 Nov 2008 10:43:11 +0000
Subject: Re: [PATCH mtd-utils] fix CFLAGS handling wrt cross compilation
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0811191752l69f5f93eg72692338ce2c6892@mail.gmail.com>
References: <alpine.LFD.2.00.0811191321420.27509@xanadu.home>
	<8bd0f97a0811191752l69f5f93eg72692338ce2c6892@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 21 Nov 2008 12:41:00 +0200
Message-Id: <1227264060.3954.55.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-11-19 at 20:52 -0500, Mike Frysinger wrote:
> On Wed, Nov 19, 2008 at 13:31, Nicolas Pitre wrote:
> > Let's have the "new ubi-utils" makefile handle CFLAGS like the other
> > makefiles.  This is important when cross compiling and CFLAGS is
> > externally provided. Without this, local include files are not found du=
e
> > to the various -I arguments which are then lost.
> >
> > Signed-off-by: Nicolas Pitre <nico@marvell.com>
>=20
> i dont think sticking CFLAGS into CPPFLAGS is right.  they're separate
> on purpose.  you also break custom CPPFLAG injection here ... CPPFLAGS
> should be treated just like CFLAGS: appended, not strictly set.

May be, I'm bad in Makefile stuff. But this is what the rest of Makefile
files in mtd-utils do, so I've applied Nicolas' patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
