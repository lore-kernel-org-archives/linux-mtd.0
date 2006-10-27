Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GdSG3-00035N-Rj
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 10:00:33 -0400
Subject: Re: mtd-utils/flash_erase modifications
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610271446220.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610261052070.25906@lnxricardw.se.axis.com>
	<1161952796.3080.8.camel@sauron>
	<Pine.LNX.4.64.0610271446220.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 27 Oct 2006 16:59:44 +0300
Message-Id: <1161957584.3080.19.camel@sauron>
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

On Fri, 2006-10-27 at 14:56 +0200, Ricard Wanderlof wrote:
> > Err, are you talking about flash_erase?
>=20
> Yes ... ?

I just thought that it works only with one eraseblock.

> I think it would be nice to have all the functionality in the same=20
> utility. After all, the functionality is really the same.

I personally fully agree with you oat this point. Would be nice to have
Josh's comment as he mostly cares about the user-space utilities.

> 2. modify flash_eraseall to handle partial erases, change name to
>     flash_erase (and throw out the old flash_erase).
I would be happier with this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
