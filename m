Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrSa0-000319-Df
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 11:38:12 +0000
Received: by lbbgg6 with SMTP id gg6so2069796lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 04:37:52 -0700 (PDT)
Message-ID: <1342611142.7530.17.camel@brekeke>
Subject: Re: [PATCH 5/5] ubi: harmonize the update of ubi->beb_rsvd_pebs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 18 Jul 2012 14:32:22 +0300
In-Reply-To: <1341389164-24409-6-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1341389164-24409-6-git-send-email-shmulik.ladkani@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Rv1QXHjodDpTqZyrer5z"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Rv1QXHjodDpTqZyrer5z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-04 at 11:06 +0300, Shmulik Ladkani wrote:
> +       need =3D ubi->avail_pebs >=3D need ? need : ubi->avail_pebs;

Changed this line to
	need =3D min_t(int, need, ubi->avail_pebs);

and pushed to the master branch. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Rv1QXHjodDpTqZyrer5z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBp7GAAoJECmIfjd9wqK0wo8P/RBSRitcLNfbpq4V10E1vzny
gmOP1+kQ0KWoXvNulKxjrt8CH2iPs/A5RNYx3BG1LgD/hXu06mc9H2tN/pZrjBzL
c8y566+B8sPM8pz/A8hxzJCo3bAyKAUaELBVs6BvGvspgiaRIsz/sOPJ+py1P1mu
AMe0uk+6dZUqeBxGtnzzxs6DxVwk7OeRcCvGnC7Ocd56F09jCT6e1+ZlWYpir2KS
U+iOuOuQvp0Vc9DnzLo+SKPghWI6qOBfvONFsWkZab7ePpvl4tUuT7xv8NlEg5DO
nt/H4OcwGGWuoNcWG9ir9fblTq+f4Fc2FJTY3bjub5aGcZOxNNf9qPb/YQFHv/sY
nrsPRJjAowvH45TkKbh0KlEDjV3PHpgdGDSlG0sTa+GuuEBSU8tG2OOBhgZwufwB
NWkQ+OsgtShq6OpaKjvlpLYyzXULvS7wNC+Psk+9tT45iaek+cthN5BjW8dLH/lX
PLTBHZ8gLSLN1Jo4RHTLRVTbwPahgdW2kZd52w6CurHmqicIg4g4Y+q79LAdnqWk
8h/nmPE7Ffr0YKZGu0uP2JqN2xyPGLGFBh4Jf8LMImZHqBoe95bLKJTCvcqjNlNt
nEYdaZgoyOnueLXoXIK8eF2BTQuUJS1sSKp/89w1kvaUh7wZPRN82QptDOU3gs+z
7lkjzU7LqorqVzkJNb2S
=leaO
-----END PGP SIGNATURE-----

--=-Rv1QXHjodDpTqZyrer5z--
