Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjphq-0008Mg-P7
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 10:42:43 +0000
Message-ID: <1340794001.29342.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] of: mtd: nuke useless const qualifier
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Grant Likely
 <grant.likely@secretlab.ca>
Date: Wed, 27 Jun 2012 13:46:41 +0300
In-Reply-To: <1338991161-18176-1-git-send-email-dedekind1@gmail.com>
References: <1338991161-18176-1-git-send-email-dedekind1@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3kEA6zTfH/2ICJsU6Qb4"
Mime-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3kEA6zTfH/2ICJsU6Qb4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 16:59 +0300, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>=20
> This patch does the following:
>  -const int of_get_nand_ecc_mode(struct device_node *np)
>  +int of_get_nand_ecc_mode(struct device_node *np)
>=20
> because:
> 1. it is probably just a typo?
> 2. it causes warnings like this when people assing the returned
>    value to an 'int' variable:
>    include/linux/of_mtd.h:14:18: warning: type qualifiers ignored on func=
tion return type [-Wignored-qualifiers]
>=20
> Remove also the unnecessary "extern" qualifier to be consistent with othe=
r
> declarations in this file.
>=20
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Ping

--=20
Best Regards,
Artem Bityutskiy

--=-3kEA6zTfH/2ICJsU6Qb4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6uSRAAoJECmIfjd9wqK0LLYQAIiji/O2JcJuDGwrjqXZYIsw
TWmNnbhFkqJrQJdhij2zqE+iVDJ2Ctu//j0rnWsJrqmxJcw1oxu7XxKErfQ7QbZw
RGk64soojaUD9bG+SLAgRgEzETxRuLUbZ5cMnUDxPwU3wRs2I+VCZtkFvMU5agJW
RlhB/7gFwNVjHULOKiuYDhjC7d5M+6SZEgmnG4eK+C64/HYq7juXYsddeZcD2HAU
Jw79jYo/K86r8U9Hq6YA/aj8Ro8NEdyeG5JH/bQ9eMgwkL/MWhwZ/5XiyYnxOCiu
R6dPR6xXPSQ8LJnubR2rHDd6euNDLo9wHWIClWBmLe3ZWxAOKtm/O4dBENA/nRTw
TDu5O6Qq/YWpxXGPV2TPJ9PHhjuwr9Wvil1vOH01uCQLKpc5Fev5rcoqE9FxYaad
d0o19k91gWQE4zAs+c6t7ZO/MBuVhgAUBHquMzD0sf2Lvt6JlqHwmhlzAgr1SEsf
6gZeIY5sjBAp68vkOO8breQBzt4Fzyu7fq2fVP61NlzWUQPHYKaFUgnbji2StjWn
1MRE5ljIOUM8rZbL58RMCl4GCgPiloTelE3jwuLoBo0EbAu3eAtUeJ+rXy0tHR6k
ai+MhjjF/WaqFDNp7mrG0Z79c8HwNcoux6pEAnSTKgcGmBSL8cIShqwV5JUqf5Tw
FA4OP1PGdfVrxIEDTaFl
=AXsE
-----END PGP SIGNATURE-----

--=-3kEA6zTfH/2ICJsU6Qb4--
