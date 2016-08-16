Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZjAn-0007pZ-J2
 for linux-mtd@lists.infradead.org; Tue, 16 Aug 2016 18:33:13 +0000
Date: Tue, 16 Aug 2016 19:32:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com
Message-ID: <20160816183247.GA9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-6-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t+hlxQ2APDzOSz17"
Content-Disposition: inline
In-Reply-To: <1469830393-13295-6-git-send-email-kdasu.kdev@gmail.com>
Subject: Re: [PATCH v5 5/8] Documentation: dt: spi: Add Broadcom NSP, NS2 SoC
 bindings
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--t+hlxQ2APDzOSz17
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2016 at 06:13:10PM -0400, Kamal Dasu wrote:

>   BSPI : Broadcom SPI in combination with the MSPI hw IP provides acceleration
> -        for flash reads and be configured to do single, double, quad lane
> -        io with 3-byte and 4-byte addressing support.
> +	for flash reads and be configured to do single, double, quad lane
> +	io with 3-byte and 4-byte addressing support.

Please squash this and the other reindentation into the commit adding
the binding in the first place.

--t+hlxQ2APDzOSz17
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXs1xOAAoJECTWi3JdVIfQA74H/1VdkHF706PdhRKzyy/X9JrY
D8PrPpijRGf4aX654vUW3We8Y1EgVgLWtp9GJ072fVRWzdXI7S/Q6Vv1OuqEReJM
vcurv9Jwp8cmb6DevzTFF+6V1Lf+rIkzV7PCwqYW3R7u9gs5cULd+ngnjb6DYOOP
NKiTXEKnzWrssOeZua0MQpcJ31cjhRbUqXdYEK8vDvPOB8vlNSrfLMmKiv1IMx+X
5dNMH7BG0+jWCkIDRvCeac9MNY7Mp/O0PQ5aFA5Wvs4S4ckrww3ffiq5/texmlI2
HVy5McM4eKKV0XpM7CeDdcthOGAsKJHKjsWqqA3CXP/a6fddU1ooaOgbikzXapI=
=I2bw
-----END PGP SIGNATURE-----

--t+hlxQ2APDzOSz17--
