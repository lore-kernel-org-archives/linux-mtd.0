Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GdRvD-0002eZ-N4
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 09:39:04 -0400
Subject: Re: /proc/mtd and flash information
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <1161955396.7638.57.camel@shinybook.infradead.org>
References: <Pine.LNX.4.64.0610271433390.25906@lnxricardw.se.axis.com>
	<1161955396.7638.57.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Oct 2006 16:38:50 +0300
Message-Id: <1161956330.3080.11.camel@sauron>
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

On Fri, 2006-10-27 at 16:23 +0300, David Woodhouse wrote:
> On Fri, 2006-10-27 at 14:44 +0200, Ricard Wanderlof wrote:
> > It seems to me that /proc/mtd is a little short on information.
> >=20
> > It would be nice to see the type of media (NOR, NAND etc), write and oo=
b=20
> > size (for NAND), perhaps a couple of other things for NAND such as the=20
> > number of bad blocks within a partition.=20
>=20
> Sensible idea, but do it with class_devices in sysfs.

Yeah, definitely. /proc is not the right place for this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
