Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IapA0-0006Jz-2D
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 04:55:55 -0400
Subject: RE: [PATCH try 2] MTD: OneNAND: fix numerous races
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <00fa01c80098$152a45a0$e1ac580a@swcenter.sec.samsung.co.kr>
References: <1190382415.14370.207.camel@sauron>
	<1190388606.14370.212.camel@sauron>
	<00fa01c80098$152a45a0$e1ac580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Thu, 27 Sep 2007 11:55:26 +0300
Message-Id: <1190883326.12445.6.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-27 at 08:50 +0900, Kyungmin Park wrote:
> > -	ret =3D mtd->write(mtd, from, len, retlen, pbuf);
> > +	ops.len =3D len;
> > +	ops.ooblen =3D 0;
> > +	ops.databuf =3D pbuf;
>=20
> It should be ops.datbuf.

Ops, I had OTP disabled when compiled it. Thanks! Will resend a fixed
version.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
