Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBPvW-0007Pe-LG
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 02:56:22 -0400
Subject: Re: Query regarding JFFS2 init
From: Artem Bityutskiy <dedekind@infradead.org>
To: Meeta Mishra <Meeta.Mishra@gnss.com>
In-Reply-To: <9D98C51005D80D43A19A3DF329A61D6901A91C05@INDEXCH2003.gmi.domain>
References: <9D98C51005D80D43A19A3DF329A61D6901A91C05@INDEXCH2003.gmi.domain>
Content-Type: text/plain; charset=utf-8
Date: Thu, 19 Jul 2007 09:55:34 +0300
Message-Id: <1184828134.3531.175.camel@sauron>
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

On Thu, 2007-07-19 at 11:08 +0530, Meeta Mishra wrote:
> Hi,
>=20
> I want to know what actually happens when sbin/init is invoked in JFFS2.
>=20
>=20
> I'm using small page Nand device with a 12MB JFFS2 partition (which has
> 5.6 MB JFFS2 image). Kernel boots up from Nand flash and comes to
> sbin/init; the total execution of sbin/init is taking 13 sec (which
> seems huge to me).=20
>=20
> I traced the read calls during sbin/init execution and found that approx
> 13 MB of data is being read which is taking approx 7.8 sec (out of 13
> sec).  Does anyone has any idea about the 13 MB data that's being read?

13 Megs are read because of checking - JFFS2 has to check all data just
after it has been mounted.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
