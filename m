Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5FTA-0001VO-9I
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 12:28:05 +0000
Received: by bkcji2 with SMTP id ji2so861542bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 05:28:01 -0700 (PDT)
Message-ID: <1345897677.1815.6.camel@kyv>
Subject: Re: [PATCH] UBI : erase free PEB with bitflip in EC header
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Sat, 25 Aug 2012 15:27:57 +0300
In-Reply-To: <1345644226-32555-1-git-send-email-matthieu.castet@parrot.com>
References: <1345644226-32555-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-WJiWa4y8sVpPzP5CNfa7"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WJiWa4y8sVpPzP5CNfa7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 16:03 +0200, Matthieu CASTET wrote:
> Without this patch, these PEB are not scrubbed until we put data in them.
> Bitflip can accumulate latter and we can loose the EC header (but VID hea=
der
> should be intact and allow to recover data)
>=20
> Signed-off-by: Matthieu Castet <matthieu.castet@parrot.com>

Pushed to linux-ubi, thanks! Also added:
Cc: stable@vger.kernel.org

--=20
Best Regards,
Artem Bityutskiy

--=-WJiWa4y8sVpPzP5CNfa7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQOMTOAAoJECmIfjd9wqK0OjMP/1vRWZK1KDlBfaOVWB8yJyJV
AhSywzLBgHLZew6WvRb1moDQ/RNd/gsMohcJw6t7slr3dOGQYm2otlw02TwEVBIo
/ZLOoaHbFXOPAehcYR2wk6iei7HPD0grvsCJwrRZNw4GbWulvbXoncRta5i5qyu+
wmlUqq84o8OoqK1Jt7gBxmZ0IzFj/oy7mjkpu3pZDQcADor4gMgvl1EBwA3HQLiD
/xMFWleHyK+y9SFKKqKHSjF6G/ZO/RxuKq9qV0uqy5J8jTU3qED9VvS5sZFz/E4P
6ZLdmTIhTKAJeKrj/GsOlVh22s0sUs2EnUc23TvrxWSric6oS5XJkR7Q8B8W5UWQ
+5h3m0CEDbZFQapan84GE/Ao7tkEFhWgEi7yE0jC/fmQLbOpbfsw/QqsIcnw4poS
++i5NpQAcRbAAKPgC4sDR5HY+BnMOJs3RC0XS4RHRsGM5M8CubHIeJiVvC2GlpR1
XsKww3CHA2jqcOUT6Wg9teOZDG3tLdVozS+IeoO855DnPcpd+aIK6bK59xXHKd5T
ywdK1U4leApGEdbgyhTpplGvsK59S4oNlqYGHV037V89rS2jqQIgGW2bzeCQ8z3e
G4+lXSbduymx9OOU2ufsVzImLOXmMUsf04jb6E6bTFRuLSCtxpHSx0VxqspNPpgb
h2wBJcDBFHrn/5Bj/uoc
=sT1p
-----END PGP SIGNATURE-----

--=-WJiWa4y8sVpPzP5CNfa7--
