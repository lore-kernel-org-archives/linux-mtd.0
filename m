Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L3TRL-0004mq-N9
	for linux-mtd@lists.infradead.org; Fri, 21 Nov 2008 10:40:44 +0000
Subject: Re: [PATCH mtd-utils] fix CFLAGS handling wrt cross compilation
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.2.00.0811191321420.27509@xanadu.home>
References: <alpine.LFD.2.00.0811191321420.27509@xanadu.home>
Content-Type: text/plain; charset=utf-8
Date: Fri, 21 Nov 2008 12:38:42 +0200
Message-Id: <1227263922.3954.53.camel@sauron>
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

On Wed, 2008-11-19 at 13:31 -0500, Nicolas Pitre wrote:
> Let's have the "new ubi-utils" makefile handle CFLAGS like the other=20
> makefiles.  This is important when cross compiling and CFLAGS is=20
> externally provided. Without this, local include files are not found due=20
> to the various -I arguments which are then lost.
>=20
> Signed-off-by: Nicolas Pitre <nico@marvell.com>

Applied, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
