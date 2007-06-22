Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1gs4-0002bl-3v
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 07:00:17 -0400
Subject: Re: Real-time flash simulator
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20070622102444.GD17988@lazybastard.org>
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
	<1182499773.4403.76.camel@sauron>
	<467B952E.30308@informatik.tu-chemnitz.de>
	<20070622093945.GC17988@lazybastard.org>
	<467BA051.50202@informatik.tu-chemnitz.de>
	<20070622102444.GD17988@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Fri, 22 Jun 2007 13:59:54 +0300
Message-Id: <1182509994.4403.81.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Martin =?ISO-8859-1?Q?D=E4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-06-22 at 12:24 +0200, J=C3=B6rn Engel wrote:
> On Fri, 22 June 2007 12:11:29 +0200, Martin D=C3=A4umler wrote:
> >=20
> > that is right! The idea is to use a (not specified) file system which=20
> > performs in-place updates on top of this layer. This layer should map
> > logical to physical erase units. So, wear-levelling possibly could be
> > used to "displace" garbage collection. The goal is to decrase latency
> > and above all make it more deterministic.
>=20
> Sounds just like FAT on smartmedia.  Worst case latency is both
> deterministic and low.  Random writes of small blocks are also
> prohibitively slow.  Works great when writing few large files, like jpg
> images in digital cameras.

It is about EB mappings, not FTL.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
