Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyNuw-0001ZH-GM
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 17:50:16 +0000
Date: Mon, 16 Nov 2015 17:49:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Message-ID: <20151116174942.GG31303@sirena.org.uk>
References: <56104E88.3040807@gmail.com> <20151112185926.GC8456@google.com>
 <20151113194031.GI8456@google.com>
 <20151113221228.GT12392@sirena.org.uk>
 <20151113225113.GJ8456@google.com>
 <20151113231410.GV12392@sirena.org.uk>
 <20151113234857.GK8456@google.com>
 <564A101F.9090807@osg.samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline
In-Reply-To: <564A101F.9090807@osg.samsung.com>
Subject: Re: spi: OF module autoloading is still broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2015 at 02:19:27PM -0300, Javier Martinez Canillas wrote:
> On 11/13/2015 08:48 PM, Brian Norris wrote:

> > (I believe I avoided this in the first place for mostly-aesthetic
> > reasons; technically this allows people to put garbage in their DT, like
> > "garbage,spi-nor". It's unclear whether "garbage" becomes part of the
> > mythical DT ABI [1].)

> I don't believe your examples are part of the mythical DT ABI. What I
> understand is that an ABI is whatever is documented in the DT binding
> docs but the only document that mentions the m25p80 is:

> Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt

Not really, in practice an ABI is something that people notice breaking.
This means that if enough people ship an undocumented ABI (or it goes
into important enough products) it's just as good as something that's
documented, perhaps better than something that's documented and nobody
ever uses as an ABI.

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWShc2AAoJECTWi3JdVIfQSxEH/3DFrfWHEtn7oil6vsHnhQe3
ZmNzLGDe7bz8CE8MVgbiGIGq/E1eOsfrjIzcYfegm5qpZfQqMtURxhFCFheTVyWC
lObqsQIoeQOZWM2aJeUcGhFx+bsGf9dxoiD41D7c5YRAM8G9ew4PNM6CnnxvE4tT
K/dWeUa0POsVy8Zgprt84L0BeR/2CL0x0h9vJatunqnFALrOHC2ldy3ha3hpuRIE
VmXj2mscs0J0FSBDtE5pWcznqfgnrYCSa8BEOL6uzbrkcLmcJts93njI1I0QihJo
Iu9RjclTxQ5Pa17QFIlrZ2ABVHUbRMthkAeevdCC4NK3RLjfGEluez/rar0vCgA=
=BsWT
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
