Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VlFuu-000814-4Z
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2013 10:30:52 +0000
Date: Tue, 26 Nov 2013 10:30:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Sourav Poddar <sourav.poddar@ti.com>
Message-ID: <20131126103029.GY14725@sirena.org.uk>
References: <1385451313-1875-1-git-send-email-sourav.poddar@ti.com>
 <1385451313-1875-4-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="oIZeFZfK2rom9VmH"
Content-Disposition: inline
In-Reply-To: <1385451313-1875-4-git-send-email-sourav.poddar@ti.com>
Subject: Re: [PATCH 03/17] spi/qspi: parse register by name.
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


--oIZeFZfK2rom9VmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2013 at 01:04:59PM +0530, Sourav Poddar wrote:
> Modify the qspi driver to parse reg information by name.

This presumably needs an update to the device tree bindings so that
there's a name defined?

--oIZeFZfK2rom9VmH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlHhBAAoJELSic+t+oim9Mz4P/3N0XCBKRpJme13yeLRDAonY
fOZOfhM08o2NPC7soiA+Whx1WGeeICfRpxuhm6vxuxDImOCB1E64P3Mx+zwFdajM
TILNQGcqIt4rulgoph/P6qG1SoU9wlUlHtff1GLBAnkB4UwIQe+oqI77onoPwtLq
zjMYWRmyuQCAKb/tLqsimTmtohiW27UxUB4Et180tcWIJW+OtqaKoKf7TFH/Tbh3
o3wOqnn+sDoTQT4sCmrTJvd8YeODeb/HeQl4EYNBqRSBh/Yu07vrxAp7yqqnBdlg
hTYpaqXzL/iaYRXh6oXaWph+5Dlrf4MC89rU5lAJbMOnCZpRNbqtyFEZVbYuDPCW
80DjLh7vjcEggklEuo3gqXBg2unC+dOfquniGVtxt0JAhb9bjddaR1nE9amVzg7B
3TXuiASiyD3Nlbx5gYe64ngJg5Zo8/5N0HzUnve5WmXHWuR+BCEVSpjRAbzeV2jG
7OSsLbXBJoQcDZ9YxGGzVx7UOnZtSub8nbO5pIs+zHOzEZx5pH8lC4J3X7pM861F
yl1EwLGgN0NehPIgYQx7BDWzivElzOZ8O39L5ONDkgXbJV2/0i2OKXXKk0I16mdP
dP2NaLq78sBo9zV1zv8O8omUoXkBymvpWiUu2SjG1OxlRfBvS+nSxnt0SY3rhvxB
TeKTAbY6opyKDN4RCy8h
=kpaE
-----END PGP SIGNATURE-----

--oIZeFZfK2rom9VmH--
