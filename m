Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEYuA-0006tN-Tg
 for linux-mtd@lists.infradead.org; Mon, 22 Oct 2018 12:02:46 +0000
Date: Mon, 22 Oct 2018 13:01:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh R <vigneshr@ti.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Julien Su <juliensu@mxic.com.tw>,
 Mason Yang <masonccyang@mxic.com.tw>, zhengxunli@mxic.com.tw,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH RFC 00/18] mtd: spi-nor: Proposal for 8-8-8 mode support
Message-ID: <20181022120137.GB2103@sirena.org.uk>
References: <20181012084825.23697-1-boris.brezillon@bootlin.com>
 <20181019122527.GJ5895@sirena.org.uk>
 <20181019145920.43f9d5ec@bbrezillon>
 <20181021133600.GE8554@sirena.org.uk>
 <20181022102126.529bebb3@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <20181022102126.529bebb3@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 22, 2018 at 10:21:26AM +0200, Boris Brezillon wrote:

> So, if you don't mind, I'll ask him to send a new version addressing
> this problem (which should make our patches almost identical, except for
> the naming: OCTAL vs OCTO), and I'll put my R-b.

That sounds great, I'll apply them on a branch and give you a pull
request after the merge window.

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvNvCAACgkQJNaLcl1U
h9AxIAf/a+aK0JfS5lRufKxh5fsMZyuthbErj4s8esW+le06XHmo7SsKal4tQHTA
xruzl8tdgaWO7Q4vaIwVE6ZAonLYakKjKYazNE/kMB9BaPS0vDjyUd1IQcvDRC9H
SVViXGzka1PU3WP1Efb6p31nAnyNjqVYjPRit5EKDAMQZ2C7aQMX0lRZL2OpGIoj
KgEp4/KfZKsLbU/UQobMvpwvElNAj5WVwSxuu7/CbMTwxK9TZMSd/zkUEtu508s3
pmeqzyRylcJd8sG1Cjmeu9Yh7Z749T8DNz7s9L+jNKdGonW55aU5PxomVqem+SfQ
RiraRTTS+8Qs+8U8UihVQc71uiZpCA==
=MFZR
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
