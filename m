Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrWjp-0004ot-37
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 16:04:34 +0000
Received: by bkcji2 with SMTP id ji2so1531494bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 09:04:22 -0700 (PDT)
Message-ID: <1342627126.9105.1.camel@brekeke>
Subject: Re: [PATCH] fs/ubifs/orphan.c: remove invalid reference to list
 iterator variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 18 Jul 2012 18:58:46 +0300
In-Reply-To: <1341818834-2101-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1341818834-2101-1-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-s0KIsc7aJHo7+lU1zOK6"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-s0KIsc7aJHo7+lU1zOK6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-09 at 09:27 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> If list_for_each_entry, etc complete a traversal of the list, the iterato=
r
> variable ends up pointing to an address at an offset from the list head,
> and not a meaningful structure.  Thus this value should not be used after
> the end of the iterator.  Replace a field access from orphan by NULL in t=
wo
> places.

Pushed to linux-ubifs.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-s0KIsc7aJHo7+lU1zOK6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBt02AAoJECmIfjd9wqK0x8AP+QGUZ/4APMpNKqkDAB97n81t
/kUaueQslsGHXI2eW7JDxj9CWLMkkVNGQYu5Z+gurpAYmF3L04GnZ15PgjBVfuQJ
v6yS6T5L1pPdRcIjOgrFjFG+gJIbKyV9Ua2zf2DNIMTiOdDY1WWgx0EeT7c31T3C
VxTka/Li6RaKTp2XIj8fp5QBIR464btU36l4hf8v+eeci6TgcuX0/189fOOQVuu/
LBqGb6DKN9NOz1BtcpP3EhgEdsOh1w3EC7MpOzZbA+/wECz94Pv/WpTaUSju1OJY
asSEvYoZEeEZdON8jyPjw89bCzzE+WXhXKfh0CV6m2SjBX39p3WQ1PnbOB0M0Hv1
dXK/FnL+noI8Sjjo+fMnF4w6WefpBjVPVo1Meb04yJO6GyLA4CcLzPYQyfnVYdvO
UhtNEHbNiAaMgddg1nY4upgpug4lhCvvwrLHHikLXzPh4Hi+fHDwIDBImdOJPCrK
KYjRgUiFvpITAD4NTXV/y/Gq9pU8utCmbfBGFyNJ6sKk9EZjQF65iU1e0+jcnck1
QlBxvgO9X6m/Y4XCq3ah95XmxNakPvV4MPlRSzEeuzbMCz4a08sKcePRfHbsCZ7M
+ysg+9bA/vOlw5BV9BjWxnPr1vRE7KpWDYJzr5LIR1tkn1sWNcuAmbWw7Cde4zGe
h8HOQlmbQOQJPzDtd0fD
=dDVt
-----END PGP SIGNATURE-----

--=-s0KIsc7aJHo7+lU1zOK6--
