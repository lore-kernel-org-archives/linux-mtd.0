Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tj6xa-0000yk-1o
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2012 11:28:15 +0000
Message-ID: <1355398149.3400.47.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] block2mtd: throttle writes by calling
 balance_dirty_pages_ratelimited.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: NeilBrown <neilb@suse.de>
Date: Thu, 13 Dec 2012 13:29:09 +0200
In-Reply-To: <20121212193215.645da577@notabene.brown>
References: <20121212193215.645da577@notabene.brown>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Mq+iaXYt9dXaBFDHb54j"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@lazybastard.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Mq+iaXYt9dXaBFDHb54j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-12-12 at 19:32 +1100, NeilBrown wrote:
>=20
> If you create a block2mtd device that is larger than main memory,
> and write to all of it, then lots of pages will be dirtied but
> they will never be flushed out as nothing calls any variant of
> balance_dirty_pages.
>=20
> It would be nice to call set_page_dirty_balance(), but that isn't exporte=
d,
> so just call balance_dirty_pages_ratelimited() directly.
>=20
> Signed-off-by: NeilBrown <neilb@suse.de>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Mq+iaXYt9dXaBFDHb54j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQybwFAAoJECmIfjd9wqK0aCgQALfCsMgt3VMDlnEt871opmHk
6Mui4CPbJiLkfQiG5XqcRHZRZ6JCI33kVfCm25MWD+xA4KZ5SMh3Oud+2zK2QSN2
KwyfQH/YY7SgEMleU02Qta33Ev5Z/rBxptCiXWFJ7j/p2qhZGl7i+lY/SoLTE4Sf
UrrtyWBWVWPtwXccyAxt6MVoizAXaXqJ78LlNS7apfbk/izVdKTdXpbcot3Z1iQI
4iU3Qo1aEY6Ezb40Hs3PGVi+KrVOHQocVzDqeZ0ex9Xi4d6wsAQiN9nOq2GZW1tn
cr0oTYbQxVpj36vZyzX+ZIb8nD+ReBnXP8AghbhgDUlfACd3eGrIE/Z4O7Kh0e6c
i6jG8OE9ltaseWZyd/TsNhgP6YoyMomaOhf3mTuRsylgGSh8HqmoKweUXkRnSAa1
RgDc7dUDckZl+nC1JJWXZjCBavt/8yF33d4Jn3lCOyfZFR9LF5x7j7tDve/BnpRv
z3h6fd4J2Gg4n8iqSWcnp7CjY/hpbid8Dy9bPvDpehHRlbQ4xoV0BdattYErJkJ8
NFZqEh8x90FXXxxWnvZAOYZmk4EDjiiXL0V93ezXRpBdO8Jb6aDjhKYU/tTMvmik
QEl3kfjfwvBrlQlqGHdCrYGVl9DDqFvLgs8ztx9ks2BGP0WmLZYqUiq5DQHFOqY9
MiQdXECdVkyanVG5mcAZ
=1kEM
-----END PGP SIGNATURE-----

--=-Mq+iaXYt9dXaBFDHb54j--
