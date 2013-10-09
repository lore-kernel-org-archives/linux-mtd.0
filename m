Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTwJR-0000Yd-6y
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 16:08:37 +0000
Date: Wed, 9 Oct 2013 17:07:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131009160759.GQ21581@sirena.org.uk>
References: <1381332284-21822-1-git-send-email-sourav.poddar@ti.com>
 <1381332284-21822-2-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="fUm0f2RSYrSJjszE"
Content-Disposition: inline
In-Reply-To: <1381332284-21822-2-git-send-email-sourav.poddar@ti.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Cc: spi-devel-general@lists.sourceforge.net, computersforpeace@gmail.com,
 dwmw2@infradead.org, balbi@ti.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--fUm0f2RSYrSJjszE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 09, 2013 at 08:54:42PM +0530, Sourav Poddar wrote:

> Qspi controller also supports memory mapped read. Patch
> adds support for the same.
> In memory mapped read, controller need to be switched to a
> memory mapped port using a control module register and a qspi
> specific register or just a qspi register.
> Then the read need to be happened from the memory mapped
> address space.

Can you provide more details on what exactly this means?  Looking at the
code it looks awfully like this has the same problem that the Freescale
code had with needing to know the commands the flash needs?

I'm also concerned about the interface here, it looks like this is being
made visible to SPI devices (via a dependency on patch 3/3...) but only
as a flag they can set - how would devices know to enable this and why
would they want to avoid it?

--fUm0f2RSYrSJjszE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSVX9cAAoJELSic+t+oim9z7IP/16wi8RP/rvryAU80AletXyu
g/BdY1JMjeWqKhBYBNnSkuw0kn3ujlfeSxYJ6LXjbriBlH8DbyD2tzEGAsNqo9bI
uyaFkVR/3WWZ66e3jbgl8FuqexpW8ZtE8m4Lio3Eied/M9wKqR5WaLcMy8Zw0ZEl
noefkJx/Qr63hdWoXhPSqzZU8mQD40uhSeWvKqp9MAUjned6HJfQxPGtJNGORK89
MBPlRlEHyVDIzTip7zluYQH4c/AbLxFbkaY7CC+pZ86p3zd9MQXkWicCHbs88zs9
m9FfEngOUJxsBg/SmTwC+Y5wj0P4VoFIvJOz1RuzxnCk2NiZSqGj4ooXJv6wynE5
pCoC7R0mZqcaSjk3/ve0zkF+JOo/yhNC9JaBVr5AIg+TRxdYBgOBJuhfG4gVUmdV
0eWdxzjkAHI2mcb9KuXOXfijWccOmKPyFIDptZOKC6q6otMu/TkDufTPmsTY42jo
G/bQqkTnqlFpqBfdqdZ2rhK6mVa+ib38yCz+idsUKGjPwy5mXYV/fpTxncag/V4o
exOUgZVkkdQSkpC4K+CkTjjuPbjly3wd+im25Oxxnk1dI3HrEsIWh54oNP/JnpN5
Bfu9PKaa76Bz53YrAlLJQ+ESSlwu2TXRJ7RyNKGRyrRWPYRIwiXmi6LL78NFaPa4
oLhB7r2wUEgjZuF6Cqtv
=ICxK
-----END PGP SIGNATURE-----

--fUm0f2RSYrSJjszE--
