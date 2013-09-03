Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VGzcA-0005vo-Ei
 for linux-mtd@lists.infradead.org; Tue, 03 Sep 2013 23:02:28 +0000
Date: Wed, 4 Sep 2013 00:01:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <20130903230158.GK3084@sirena.org.uk>
References: <1376216117-5864-1-git-send-email-wangyuhang2014@gmail.com>
 <1378028181-5409-1-git-send-email-wangyuhang2014@gmail.com>
 <522613F7.908@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="PNftq4k6NuHCGvy8"
Content-Disposition: inline
In-Reply-To: <522613F7.908@wwwdotorg.org>
Subject: Re: [PATCH] spi: quad: fix the name of DT property
Cc: devicetree@vger.kernel.org, tomasz.figa@gmail.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, pekon@ti.com,
 wangyuhang <wangyuhang2014@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--PNftq4k6NuHCGvy8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2013 at 10:53:11AM -0600, Stephen Warren wrote:

> I would have preferred my original wording rather than the unqualified
> "MOSI"/"MISO", since the meaning of those terms depends on whether
> you're looking at the host controller or the device, but I guess we can

No, MOSI and MISO have fixed meanings at all ends - they expand to
Master Out Slave In and Master In Slave Out so it's always clear which
side should be transmitting.

--PNftq4k6NuHCGvy8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSJmpjAAoJELSic+t+oim921kP/1WDKnJY4Q1Lh6tq5h14Gm3I
cqvNxB+U7E2HXAYPFW0pmbY/hSqEeeN5c3i9O6S7/22aKjL6XPcVgQiYh6syFz3v
1cehSDBk6dTi4BMcjfe7rEj+I2HFufYPIustzBykWXZew4WpTrzEfcnrZoBx/cVr
8BYWq9QsydRyIwdK2yQ+K/fjzl33CZfhivTRfCCPWosKIZc/H1wRNYTCf5o5BmAv
+/QgLNnCQWVwxvtTIzP8SiD5uLO76LxHqL95IYi/shl8UDQ00uZ0Y4rWVqrxx4rJ
Ew8qHgPFx3/F2u+JfBew4FPzIpcDMzmhifVGvMaodmGrzpEBgzzvkDrJdvbf42Oe
utPjIA+HpBlvHsFhxiMvSwuZSgHIZiC3M1VW4g3Gh7vc+4rCi9yBGRqoGbEwhQFC
aaV94iJU0bkvLzFPncM3RVs2VsJQkgQucZdYzmzILnE2hAtoFZ+DeXJb+bN1d4oK
JrumM25osh4k5XZJzd7e6oAVqMOCgmAdBs2d26nGr+02fUgNnWEHGFD4EZM89p2U
HFy8HU61Ek4Ffd0eurvoWY2+ufJyTQEvFz4xrmLdceBcS6ou/yb2QvCqcPwAA/FS
kkB9NUg5A1U1sUTxWPLUrveLYJABVzY/dtmHxrgze3iJY6s6dIV072Df/vo4BG/u
LuFkm6MBYXvmBNga+dk9
=06Un
-----END PGP SIGNATURE-----

--PNftq4k6NuHCGvy8--
