Subject: Re: [PATCH] MTD: fix dataflash 64-bit divisions
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.2.00.0812171205290.30035@xanadu.home>
References: <1229532627.17960.37.camel@sauron>
	<alpine.LFD.2.00.0812171205290.30035@xanadu.home>
Content-Type: text/plain; charset=utf-8
Date: Thu, 18 Dec 2008 08:20:07 +0200
Message-Id: <1229581207.17960.55.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: David Brownell <david-b@pacbell.net>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-17 at 12:15 -0500, Nicolas Pitre wrote:
> > -		pageaddr =3D instr->addr / priv->page_size;
> > +		tmp =3D instr->len;
> > +		do_div(tmp, priv->page_size);
> > +		pageaddr =3D tmp;
>=20
> Here I suggest you include <linux/math64.h> and use this instead:
>=20
> 	pageaddr =3D div_u64(instr->addr, priv->page_size);

Indeed, these div_u64()/div_u64_rem() functions seem to be nicer. Never
used them before.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
