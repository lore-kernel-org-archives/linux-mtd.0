Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVPr3-0000ed-Le
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 21:07:02 +0000
Date: Thu, 4 Aug 2016 22:06:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, f.fainelli@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, vikram.prakash@broadcom.com,
 andy.fung@broadcom.com, jon.mason@broadcom.com, jchandra@broadcom.com
Message-ID: <20160804210634.GM10383@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-2-git-send-email-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S6vg04ofUPzW4qJg"
Content-Disposition: inline
In-Reply-To: <1469830393-13295-2-git-send-email-kdasu.kdev@gmail.com>
Subject: Re: [PATCH v5 1/8] Documentation: dt: spi: Add BRCMSTB SoC bindings
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--S6vg04ofUPzW4qJg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 29, 2016 at 06:13:06PM -0400, Kamal Dasu wrote:
> Added device tree bindings documentation for SoCs supported by the
> new spi-bcm-qspi, spi-brcmstb-qspi driver.

Please submit patches using subject lines reflecting the style for the
subsystem.  This makes it easier for people to identify relevant
patches.  Look at what existing commits in the area you're changing are
doing and make sure your subject lines visually resemble what they're
doing.

--S6vg04ofUPzW4qJg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXo65ZAAoJECTWi3JdVIfQ0RcIAIC75PdJeT/Rh9c9nigHaC1+
jJqVsplM/OVdpKfl5B5myWYSM9ybSv4SU7CUk/z+G/cq0gr0uaGe5xfd9CFAknAl
TwXpktvlftEshv66o4iN9zHMJ59vn50w/4i4vpzsl/iCTakCKoX1qDFFQ4Y3y65K
obYKwLEsFRKhfvopnhX70g9rjYsy2nz+W9fVerY1z/QSinuU5Uy+ODFvPOv8IgTM
olItl7/60Cj+QAaqcTznS6aQxOSN9wwjD0MOkGbLIhHEGvPGlhw7n1i9STZQ7fzs
ieJ3SR2jt2oTn6OT9BlR4cQV9h9A0Hk6c/iS7zUJJreILQ1sJQrF8zey7/lqXEs=
=mcDh
-----END PGP SIGNATURE-----

--S6vg04ofUPzW4qJg--
