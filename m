Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2nM3-0000o0-Qr
	for linux-mtd@lists.infradead.org; Thu, 13 Dec 2007 12:40:02 +0000
Subject: Re: mtd-utils-1.1.0: build error
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0712131319400.12929@lnxricardw.se.axis.com>
References: <31E09F73562D7A4D82119D7F6C17298603002AFD@sinse303.ap.infineon.com>
	<Pine.LNX.4.63.0712131159320.13593@redbean.intranet.gw-instruments.de>
	<Pine.LNX.4.64.0712131319400.12929@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 13 Dec 2007 14:39:03 +0200
Message-Id: <1197549543.25999.22.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: KokHow.Teh@infineon.com, linux-mtd@lists.infradead.org,
	Peter Wippich <pewi@gw-instruments.de>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-12-13 at 13:21 +0100, Ricard Wanderlof wrote:
> On Thu, 13 Dec 2007, Peter Wippich wrote:
>=20
> > This one should go into the FAQ...., it's a commmon pitfall. I'm not su=
re
> > if this is already fixed in 1.1.0, but at least in a recent GIT version
> > you can add WITHOUT_XATTR=3D1 to the make command to compile without
> > Posix ACL (which, IMHO, should be the default because I never came acro=
ss
> > any embedded system which uses Posix ACLs).
>=20
> I agree, or at least something should be done to make the error=20
> clearer.

The MTD web site can be cloned from git://git.infradead.org/mtd-www.git

Feel free to send a patch which will add a FAQ entry about this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
