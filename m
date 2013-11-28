Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlzGC-0000Ss-Vi
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 10:55:53 +0000
Date: Thu, 28 Nov 2013 10:55:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131128105530.GM14725@sirena.org.uk>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-3-git-send-email-sourav.poddar@ti.com>
 <20131126102951.GX14725@sirena.org.uk> <52948451.3060706@ti.com>
 <20131126122159.GB14725@sirena.org.uk> <5296CAEA.3030002@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="tk6QM1MMR8QQKbMj"
Content-Disposition: inline
In-Reply-To: <5296CAEA.3030002@ti.com>
Subject: Re: [PATCH 02/17] spi/spi.h: Add configure from slave support.
Cc: devicetree@vger.kernel.org, computersforpeace@gmail.com, balbi@ti.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 bcousson@baylibre.com, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tk6QM1MMR8QQKbMj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2013 at 10:17:38AM +0530, Sourav Poddar wrote:
> On Tuesday 26 November 2013 05:51 PM, Mark Brown wrote:

> >The name isn't the issue, it's the fact that you're passing a completely
> >unspecified blob of data.

> May be, what you are suggesting here is to we should define a flash
> information
> structure and should pass that structure here ?

Possibly, that's definitely moving towards adding more structure.

--tk6QM1MMR8QQKbMj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlyEeAAoJELSic+t+oim96GQP/iASfWIVHbhAk8as26Z7reY8
penXnPrmu2GN7av2+AcKa1JUMSwyM7t6UuHcN2U0VhPXqpWyOArIHvtkkjGiTjpe
a+9sU1DM2yR6YoCbidn57v4ucHeqobYx9frG7o6QjoJwo8sJPgfYF3bqZdIrqVY+
DwDYEJo0a5q8kbD0JY3KWTy5Me+EdNIBYjdvAqmn5UQI7LRPgAZtcZwJjkQsoJN9
j+omIjbl+mDfykUJ1NTh03DB5NjET4/D695w0TDlQ3MBM0SPNd7vI/ORnrWlhweQ
2QZ/4YqezO8VGjWFmGfjrwWwEiSNBgRTvkq3RJQj9VoS2F97lGujHEmbKuvBrqKk
RI830+mAr8hdrwPbwcqFrsgFXNrOApMjber5byw7DpDbkN8hP3RW7Mf18HY5ncME
RTnNum3PjqB1ygOgnccPeLxmIVtpmenfuLNBJSib9szYdYwQebLJPpYPPx84c7FF
ArCr6Hu7LXUk4b2gIAeqU02zIy9Jf2i+6i38DgYWH9EYA7uW3zhMCcPZKd6CRfFr
a+nHgy7YcfjIj0DNtMZnkg0itNYrMrhWAgdyCFeUrrslLsoeRYzDoxO0+PQYBGvv
62ddEic4ncLuVPPHi5q4cerLy6r3YHYFa9FVnfvxMO9oEsFvJzI1fJJ6c1OECaEz
jL9udRa0ZXVn2IOQav/K
=agxX
-----END PGP SIGNATURE-----

--tk6QM1MMR8QQKbMj--
