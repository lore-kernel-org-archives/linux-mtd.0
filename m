Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VX7LJ-0006o1-3B
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 10:31:42 +0000
Date: Fri, 18 Oct 2013 11:31:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131018103114.GJ2443@sirena.org.uk>
References: <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
 <525FD715.50703@ti.com> <20131017123850.GN2443@sirena.org.uk>
 <20980858CB6D3A4BAE95CA194937D5E73EA27E10@DBDE04.ent.ti.com>
 <20131017234230.GZ2443@sirena.org.uk> <5260B3AE.9070308@ti.com>
 <CA+7tXihUBXK61cRDmn3tnY9FM7FUSZrhPpLry2VAfvwWJpJ6gQ@mail.gmail.com>
 <5260D0C7.4000805@ti.com> <5260E2F7.4020404@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="yDGiozl9PhqVu2MD"
Content-Disposition: inline
In-Reply-To: <5260E2F7.4020404@ti.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Cc: Peter Korsgaard <peter@korsgaard.com>, Trent Piepho <tpiepho@gmail.com>,
 "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--yDGiozl9PhqVu2MD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 18, 2013 at 12:57:51PM +0530, Sourav Poddar wrote:

> 3. For filling memory mapped register in qspi controller, we can
> pass that information
>     from dt rather than hardcoding as macros.

Or from the flash driver at runtime...

>     4b.
>         Roadblock:
>         Runtime clock management is handle by SPI framework, so while
>         doing memory read, where we bypass SPI framework, clocks will be
>         disable and we will get an abort while doing memcpy.

>        Possible solution:
>            As suggested by Trent, we can keep the SPI controller
> clocks always ON ?

At the SPI layer I would keep the clocks on while the driver has a
region mapped for the flash layer.  The flash layer can then decide when
to keep the region mapped, for example it could do so whenever the
device is opened.

--yDGiozl9PhqVu2MD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSYQ3vAAoJELSic+t+oim9RUMQAI8S43d9x4HpFvogqyHK1B49
185301vSNxfnXOruJl4HdCYdBg2RtLZwI96w7AUuOyL2TRGUvjegqw0Semw8+QO1
oiUk42PDY4yQfKR98bb+yR7t6F+93VKd26dnwqG63FulhLLVDpF2b9BlAmnUBggs
Bi9jtK4jvESmxMF8FsYIk+chrH5OulvULgZB30cqVrXAHKlFwrO9HYo2RDDSah4n
bL33d45b/4W5Q+n+EkMKgCd1A4muAtdPJtfB+5CWP4gmVUuzv5xwUS2q7+bwxb08
gl/IORGkkf4rPqPrI1Cm6MZ9ILWe4boFhDkEzuG35TvJ23/sa2UyjzOtOKsWChYt
aYz+RKORkw+2M0hOOtDCK7sFT+ov7QE3VGY8Z4nNv9Df1aUnbs1uk/285/bzjPq0
WfTkhGr8h2bBNsfcQ1KKCvAse/AVjIjQXk6v+An4fybs3Giqktix1PTb8ix2JZ6Z
PBRL4XPJsgLyvrRGGKVoh4RCNV+YUVI3zR1zjfwD4ooz37AQ5yVq3hyoPn1wwkN4
oY8NmR3E/vHfmrKI+vQN4lrJ8416MQ3gbNTAT+Zc8sAA7hA4azpmU5KdwVINVeK6
+bHKaREftz4mzs73+DoOFIjojO3ubeFWhcfPKTgJ4zmxQ+DHHqHLRK3bPhnULigJ
kOW1ip/CL2t/fnPYaxEL
=0lJg
-----END PGP SIGNATURE-----

--yDGiozl9PhqVu2MD--
