Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzrDE-0000wS-2P
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:19:12 +0000
Date: Fri, 20 Nov 2015 19:18:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Michal Suchanek <hramrach@gmail.com>, martin@sperl.org
Message-ID: <20151120191842.GE1929@sirena.org.uk>
References: <564CEB61.2000601@gmail.com> <20151120000226.GP64635@google.com>
 <564EC4E0.90602@gmail.com>
 <CAFSsGVsJBi6yPin7X9MCS8LD6nygjynfgDgFicjojkm0rOJSJw@mail.gmail.com>
 <20151120123540.GC1929@sirena.org.uk> <564F6D99.8090203@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Content-Disposition: inline
In-Reply-To: <564F6D99.8090203@gmail.com>
Subject: Re: RfC: Handle SPI controller limitations like maximum message length
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2015 at 07:59:37PM +0100, Heiner Kallweit wrote:

> OK, I interpret this as:
> Controller drivers shall return 0 only if the complete message was
> transferred successfully.

Yes.

> If  a controller driver returns an error it has the option to set
> actual_length to what was transferred successfully.

It should always do this.

> This means we can't use patch 4 from Michal because it bails out as soon
> as the underlying SPI transfer returns an error.

I haven't seen that patch.

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWT3IRAAoJECTWi3JdVIfQuGMH/2oxTqqEZD9ZmWHsk5wrtpgp
eMSO2a9Kg4/C/EYxZGf4qH7+84pyfjWHIbJLNsBVuUQwyCrv3WlT5WkRpcoNmxYR
BcC4RnAeM9ps98wyI8bA7I6yIbQH6SZ2TmDCgF2fR+7JRSWdLkby/ZIlI96K8PDF
QnwBS5NInMS6h8wQWWueClyoJ7Qevz1TchOd/m+QjxjAdF3dpbKw/BK8Z8oLYH5X
euZPt4onah86GW55RrjWii7Kcajc490fnanufcQqaXG1i+XClq7bXw4e9ls0ejKe
79FygmoJ6xUUQ4VWtfrS2MSFaGPdIA48h3LgiUOfALtnvcONRuFzMfynk3X6C74=
=BnPl
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
