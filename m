Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkIqt-0000OQ-OF
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 07:55:11 -0400
Subject: Re: UBI: Cannot create static volumes when FTL is enabled
From: Artem Bityutskiy <dedekind@infradead.org>
To: John Smith <john@arrows.demon.co.uk>
In-Reply-To: <1178365169.3659.76.camel@sauron>
References: <Pine.LNX.4.33.0705042249130.30496-100000@arrows.demon.co.uk>
	<1178365169.3659.76.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 May 2007 14:54:58 +0300
Message-Id: <1178366098.3659.93.camel@sauron>
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

On Sat, 2007-05-05 at 14:39 +0300, Artem Bityutskiy wrote:
> So you see that dynamic volumes are mapped to the MTD device model quite
> nicely: mtd device size =3D volume size.
>=20
> Size of static volumes depends on how much data you put there. And since
> MTD infrastructure assumes that MTD device sizes are stable, there is no
> good and nice way to emulate MTD devices on top of static volumes,
> unless MTD subsystem is somehow re-designed.
>=20
> But anyway, you have found a bug. I am going to disable MTD device
> emulation for static volumes.

Although it still would be nice to have MTD device emulation for static
volumes. May be we have the same semantics as dynamic volumes if they
are used via gluebi. It needs more thinking.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
