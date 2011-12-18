Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RcFJC-0003xx-2R
 for linux-mtd@lists.infradead.org; Sun, 18 Dec 2011 11:53:38 +0000
Received: by iadk27 with SMTP id k27so6683187iad.36
 for <linux-mtd@lists.infradead.org>; Sun, 18 Dec 2011 03:53:37 -0800 (PST)
Message-ID: <1324209306.17534.2.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: gpio-nand: add device tree bindings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Date: Sun, 18 Dec 2011 13:55:06 +0200
In-Reply-To: <1324202449-13820-1-git-send-email-jamie@jamieiles.com>
References: <1324202449-13820-1-git-send-email-jamie@jamieiles.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mH3MYJMSrNyUx+te0FPq"
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mH3MYJMSrNyUx+te0FPq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2011-12-18 at 10:00 +0000, Jamie Iles wrote:
> Add device tree bindings so that the gpio-nand driver may be
> instantiated from the device tree.  This also allows the partitions
> to be specified in the device tree.
>=20
> v7:	- restore runtime device tree/non device tree detection
> v6:	- convert to mtd_device_parse_register()
> v5:	- fold dt config helpers into a single gpio_nand_of_get_config()
> v4:	- get io sync address from gpio-control-nand,io-sync-reg
> 	  property rather than a resource
> 	- clarified a few details in the binding
> v3:	- remove redundant cast and a couple of whitespace/naming
> 	  changes
> v2:	- add CONFIG_OF guards for non-dt platforms
> 	- compatible becomes gpio-control-nand
> 	- clarify some binding details
>=20
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: Scott Wood <scottwood@freescale.com>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Jamie Iles <jamie@jamieiles.com>

Looks ok to me, but would be great to have some ack from a Device tree
guy.

--=20
Best Regards,
Artem Bityutskiy

--=-mH3MYJMSrNyUx+te0FPq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7dSaAAoJECmIfjd9wqK05H8QAKUSIEgVV6SkSnDrXn/5xFb7
32cEv4/Y/mkFFg+6RioUCoDekphAWWTaNIfD7ptT6TKCeEo21mj7q5N2/qM0/w5t
4yWHvjyqLqlnDzVRzBExISoimA6ykisaFsqv1K7xiZ6rjt3/VQ3ZBkuK+dnrShOz
JGj7VuwICa0qkpC6RtKqGYKbX74hIeQ8blH0nNlGhB7N3kSFiLLeFurpT+FqYVWA
KO4UBjwpIVEfCpmeennJPaXvtlPaPzfz/JvbJXkQG3LMl00nmSgj2urOGTjkNod/
YTBlufxXZaqtdzlB5kIYparER0MfME7ihpcEJ7Yyt+fQURla0KYlfL9NRIda7kPh
IqRm1brIdyqs2LYfiOs4VD0/TDaAYvn1my8TrpVbIKll6iTjaX+tJj2BjAUCrHp5
QYB7e81eTEha24EAyBiz3Sb0CpcyhXk8ZmpLU3jjq1VJeBCmIjN5BclBoBWygzAY
oJPZt1Dl4LplBDjkpI4gZ+kuJZ0xukZ5yB1TenWtLyzG4l/fn8m3ocpkZzaL69DD
N6LLu7aXkNbzYbUrH1XRSmkbbtQ2leK52D3EH9kB/HNn9ITbUmY6RsdKAw7Klmtc
ia95fwwTq9lIzvy4nvjkuQp80p2XKDfmP0UAYB4ZPmgQsjh9RkK3GjuVwSmRKWag
YrWawNctwKSjHnJySYsH
=cSws
-----END PGP SIGNATURE-----

--=-mH3MYJMSrNyUx+te0FPq--
