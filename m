Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HF9zP-0002EW-TP
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 09:11:11 -0500
Subject: Re: [PATCH] eXcite nand flash driver
From: Artem Bityutskiy <dedekind@infradead.org>
To: Thomas Koeller <thomas.koeller@baslerweb.com>
In-Reply-To: <1170942627.4884.89.camel@zod.rchland.ibm.com>
References: <200702080157.25432.thomas.koeller@baslerweb.com>
	<1170942627.4884.89.camel@zod.rchland.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Feb 2007 15:55:40 +0200
Message-Id: <1170942940.7984.5.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-02-08 at 07:50 -0600, Josh Boyer wrote:
> > +	/* free the common resources */
> > +	if (likely(this->regs)) {
> > +		iounmap(this->regs);
> > +		this->regs =3D NULL;
> > +	}
>=20
> Same likely usage comment as above.

I agree, this function will be called one or very few times, so  this
hint is not reasonable in this case.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
