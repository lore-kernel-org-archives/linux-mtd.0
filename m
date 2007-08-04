Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IHFkS-0002yA-8x
	for linux-mtd@lists.infradead.org; Sat, 04 Aug 2007 05:16:37 -0400
Subject: Re: [PATCH] UBI: Don't use signed int as array index before
	testing if it is negative
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jesper Juhl <jesper.juhl@gmail.com>
In-Reply-To: <200708040125.26861.jesper.juhl@gmail.com>
References: <200708040125.26861.jesper.juhl@gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 04 Aug 2007 12:16:22 +0300
Message-Id: <1186218982.26902.47.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2007-08-04 at 01:25 +0200, Jesper Juhl wrote:
> Hi,
>=20
> I can't find anything guaranteeing that 'ubi_num' cannot be <0 in=20
> drivers/mtd/ubi/kapi.c::ubi_open_volume(), and in fact the code=20
> even tests for that and errors out if so. Unfortunately the test=20
> for "ubi_num < 0" happens after we've already used 'ubi_num' as=20
> an array index - bad thing to do if it is negative.
> This patch moves the test earlier in the function and then moves=20
> the indexing using that variable after the check. A bit safer :-)=20
>=20
>=20
> Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>

Thanks for the catch, committed to UBI git tree.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
