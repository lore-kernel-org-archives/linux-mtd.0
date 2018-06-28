Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYVU0-0004jt-Ma
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2018 11:53:06 +0000
Date: Thu, 28 Jun 2018 12:52:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 00/14] ARM: pxa: switch to DMA slave maps
Message-ID: <20180628115250.GE14040@sirena.org.uk>
References: <20180617170217.24177-1-robert.jarzmik@free.fr>
 <20180618104159.24b9fffb@bbrezillon>
 <87d0wnrhqz.fsf@belgarion.home>
 <20180625130704.GQ9413@sirena.org.uk>
 <87r2ksl0wa.fsf@belgarion.home>
 <45a4e773-aaa3-6d43-f02d-5056a2a265d4@zonque.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline
In-Reply-To: <45a4e773-aaa3-6d43-f02d-5056a2a265d4@zonque.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 27, 2018 at 11:03:16PM +0200, Daniel Mack wrote:
> On Wednesday, June 27, 2018 05:11 PM, Robert Jarzmik wrote:
> > Mark Brown <broonie@kernel.org> writes:

> > Anyways, the immutable branch doesn't contain the specific ASoC patch "ASoC:
> > pxa: remove the dmaengine compat need", and up to my better understanding
> > neither does your for-next branch.

> > So until I see it in your branch it will dwelve happily in pxa/for-next. If it
> > has to be routed through your tree, so that Daniel can work on ASoC pxa, I'd
> > like to know at -rc4 time so that I drop it from my pxa/for-next branch.

> Ah, yes. The series I just posted depends on that.

Ugh, please resend this patch so I know what's going on :(  My
understanding was that I was pulling a tag with the dependencies.

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAls0zBEACgkQJNaLcl1U
h9CqMAf/YnJSuYfkDLsMJj+Ma+azKxHUUSNo2TTk7zLNL2f7sFayIkYng3Go7cw4
KcZhV5KILOySk00mHN8RmO+kW/j1sipOD9MaNoQfr3omL0upYyaa9gTs5SHm1e7o
s5yeLUrFCn1V0gSsuIsgEHDS0tA7h9V8p9ATAMRZcs94Zho490r/VeKya9Ouqxhw
qVYrApADDxxyvoiZ0W7SdfWYvottnqzNzZFAmTtEmbj7AAQcKI0fcn6tTlAZUcuj
fW9A4GdAvv+xZGHgD496oLaIe3yP4rhGpz6gIvmtFxBMJCU0BAEL5Rc/JVh7d/gG
RGrTKKeFKpwFciY7VgyEDzR/QQfJEQ==
=OPKL
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
