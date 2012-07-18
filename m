Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrRjK-0006JE-6p
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 10:43:43 +0000
Received: by lbbgg6 with SMTP id gg6so2007225lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 03:43:39 -0700 (PDT)
Message-ID: <1342607888.7530.10.camel@brekeke>
Subject: Re: [PATCH 4/5] ubi: trivial: fix comment of ubi_calculate_reserved()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 18 Jul 2012 13:38:08 +0300
In-Reply-To: <1341389164-24409-5-git-send-email-shmulik.ladkani@gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1341389164-24409-5-git-send-email-shmulik.ladkani@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-CRklGK0QfZa11sIvL4BP"
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


--=-CRklGK0QfZa11sIvL4BP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-04 at 11:06 +0300, Shmulik Ladkani wrote:
> The function name within the comment was not aligned with the actual
> function name.
>=20
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Pushed this one directly to the master branch, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-CRklGK0QfZa11sIvL4BP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBpIQAAoJECmIfjd9wqK0rj0QALWJmkzQLw6dcWOta9qHiAFd
u7eLtdbNWqz0x7TfME2Pe9BeTFR3CoIydSEXI3UunhggxYORYrddTIlQ/hDs44pO
Byfd9f499a3AoMcB9R2GLjETd0xF+orXccWLH4/uuWYMf3oWw2m8zIcdCbWefTAc
zEqzZkmKuZyj4z8iIsd7ON7aBmZpJ8m/eCZ5d5UAK68N7fI4Cv9OEXeHsRLFKufK
XTGWZpumePkwUilvnnWrzrqhwE4+uU2OHd9A9NkXOCj+LJR3iBWX3mb6oPbGyFGJ
qr+oH2lk7AbnLWARR6dLzg1j1ya0awadOzCDZTfiKFRf81b7hKxRFX9JvISANtmT
XEtsqyRNKg42HAxBDc6FvROt922ZrgsmpWSK27y2vSnXU8GqmS8/6P95wF8xK6up
VtE2+K3WYmS5jQ6djzqfqPRMUNvdPQhJCMzcrGDWLxF8ve7pKbtjz0PbSEWY5H2G
YaOjbcTJwPIAAAJJGUS6LiMSRJgWl6Y0NjnHHpuwGGysAz+u7EtSBP1mLkwzcwQG
6GSpI9IbQZnEcb0nz3UE/NRRYN/OjNhU+GfzJIw2rvZrIU0RuIjRIEPFEhYz4PT+
RE7djL82Fxz6FkcM1oqh9RoWZBJa6R7P+4/1SZ8sdupt0Wr3Cq0De04Fa8nlPcst
T2wgRe4BY8etrK241NTW
=PP6Z
-----END PGP SIGNATURE-----

--=-CRklGK0QfZa11sIvL4BP--
