Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9fu7-0003Qq-TP
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 13:12:04 +0000
Subject: Re: ubi-utils updates for gcc-4.3.x
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tom Rini <trini@embeddedalley.com>
In-Reply-To: <1228734052.13686.103.camel@sauron>
References: <20081208080138.GJ15204@smtp.west.cox.net>
	<1228734052.13686.103.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Mon, 08 Dec 2008 15:09:42 +0200
Message-Id: <1228741782.13686.124.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-12-08 at 13:00 +0200, Artem Bityutskiy wrote:
> >From man scanf:
>=20
> RETURN VALUE
> These  functions  return  the  number  of input items successfully
> matched and assigned, which can be fewer than provided for, or even zero
> in the event of an early matching failure.
>=20
> The value EOF is returned if the end of input is reached before either
> the first successful conversion or a matching failure occurs.  EOF is
> also returned  if a read error occurs, in which case the error indicator
> for the stream (see ferror(3)) is set, and errno is set indicate the
> error.
>=20
> On this basis, I would say you should test for EOF, not for 0.
>=20
> > +		if (!scanf("%3s", buf))
> > +			return 0;
>=20
> Similarly.
>=20

If you are fine with this, I may amend your patch and push it, because
otherwise it looks OK for me.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
