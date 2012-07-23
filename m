Received: from opensource.wolfsonmicro.com ([80.75.67.52])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1StO3N-0006Hd-1r
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2012 19:12:25 +0000
Date: Mon, 23 Jul 2012 20:12:18 +0100
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v2 1/2] mtd: maps: physmap: Add VPP regulator control
Message-ID: <20120723191218.GC12438@opensource.wolfsonmicro.com>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
 <1342617721-14715-2-git-send-email-pawel.moll@arm.com>
 <20120723174605.GA23707@sirena.org.uk>
 <1343067861.19880.30.camel@hornet>
 <20120723183230.GA12438@opensource.wolfsonmicro.com>
 <1343068929.19880.36.camel@hornet>
 <20120723184550.GB12438@opensource.wolfsonmicro.com>
 <1343070299.19880.41.camel@hornet>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline
In-Reply-To: <1343070299.19880.41.camel@hornet>
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 23, 2012 at 08:04:59PM +0100, Pawel Moll wrote:
> On Mon, 2012-07-23 at 19:45 +0100, Mark Brown wrote:

> #ifdef CONFIG_REGULATOR
>         /* If we're using the regulator framework, try to fetch a regulator */
>         host->vcc = regulator_get(&dev->dev, "vmmc");
>         if (IS_ERR(host->vcc))
>                 host->vcc = NULL;
>         else {
>                 int mask = mmc_regulator_get_ocrmask(host->vcc);

Oh, yeah.  Well, MMC regulator integration has historically been
entertaining so I guess any move towards standardisation is good :/

> > It'll happen if anyone does the work; I've not currently got any useful
> > systems that run DT and don't have a particularly large amount of spare
> > time.  People were muttering about it, though, for much the reasons you
> > mentioned.

> Ok, I take the hint, will look into it.

That'd be great, people were really talking about it so it may be that
someone will get to it soon, I don't know though.

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQDaDkAAoJEBus8iNuMP3dE7MP/3tFL3vJNBXPSKfDLsxYqzLj
SIzBB0Z5Ji0FmhkFktD22VM2nECYw1QeCDDY4H6ejMN0Ala8YlnfmS60n0GsbyQl
6ygOmHThcePTb5y2iz5AuR6w9IG6ZQcZCj8wAtWgiFO+78qGdMK9Hm0RWRDLcsQm
MX/Emql1hkd5FZZ12Caq8b4FcYRhGohDXwU4LuieSVtqgJonThmfTNtpZTpA802m
OjgevqT2tOSw8FNxIqd0/FiAFy6GO2bAAHUmjeo6AYqT+cPzUJOr4jZN4OGVcwKj
AGOj7pUjBvAbTChWrGMVYOLSd4wEPiuVe84xqgCAksEpVCtu+SwX4TIYVsiBIhGe
Slvqbc6oelNnm5WyyMHsvhDfDDDOnBVJscvgj07ra5R1O/dAExZ3h3Fhe+TllNKe
FECMlvWAMebOqTIrQmgemgsax3OSsc4hk1i72jcBHv3tlNpRPc3uPDvoX0wpmtbt
nwNvu11HD5BqZfxmCPcirUOZ5bNyOaD2JaiFaV/3LCja8e7QTA3eIOtMyHxbShJt
lq7eYWxL+LCqkjRJP4N0N9XaePhcDAEOMMLjZP1OV4zIiiF4py286urMWiCrduhq
p0BO8CSuMhDXvAGY/v+dGK0E6tKHGl5q+sGSyC3KDooxE2YHiB806+v371oH1JVL
m+pCNiTIh/ks/GCSjvRZ
=TUb/
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
