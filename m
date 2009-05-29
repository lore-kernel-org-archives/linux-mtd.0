Received: from caladan.roxor.cx ([82.238.123.217])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MA216-0003Tz-AI
	for linux-mtd@lists.infradead.org; Fri, 29 May 2009 13:21:07 +0000
Date: Fri, 29 May 2009 15:20:59 +0200
From: =?utf-8?B?QXVyw6lsaWVuIEfDiVLDlE1F?= <ag@debian.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: UBIFS: "sync" mount option does not work
Message-ID: <20090529132059.GA11054@roxor.cx>
References: <20090528170621.GJ18372@roxor.cx>
	<1243591249.11172.106.camel@localhost.localdomain>
	<1243591427.11172.108.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline
In-Reply-To: <1243591427.11172.108.camel@localhost.localdomain>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mtd@lists.infradead.org, Adrian.Hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

On Fri, May 29, 2009 at 01:03:47PM +0300, Artem Bityutskiy wrote:
> Please, use this patch as a band-aid so far. Not sure it'll
> land upstream in this form.

Sure, thanks a lot!
It works fine and it is now integrated to the kernel of my custom
board.

Cheers,
--=20
 .''`.   Aur=C3=A9lien G=C3=89R=C3=94ME
: :'  :
`. `'`   Debian Developer
  `-     Unix Sys & Net Admin

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkof4TsACgkQI2xgxmW0sWJhKQCfTvY1WxCHj/FtLjQxLrlCpNUx
/g8An12vZpt33NkSlUbJK0mlWWMzUxTe
=w0pc
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
