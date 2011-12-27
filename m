Received: from mail-tul01m020-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfSRq-0000hv-Io
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 08:31:51 +0000
Received: by obcwn1 with SMTP id wn1so9210046obc.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 00:31:49 -0800 (PST)
Message-ID: <1324974817.1165.51.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: drivers return bitlip info to mtd on read
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 27 Dec 2011 10:33:37 +0200
In-Reply-To: <1324928293-17905-1-git-send-email-mikedunn@newsguy.com>
References: <1324928293-17905-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-byu9O/Ycszjs20C0TAPG"
Mime-Version: 1.0
Cc: Scott Branden <sbranden@broadcom.com>, Joern Engel <joern@logfs.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Jiandong Zheng <jdzheng@broadcom.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-byu9O/Ycszjs20C0TAPG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-12-26 at 11:38 -0800, Mike Dunn wrote:
> This patch changes the meaning of the value returned by the read() and
> read_oob() mtd driver methods.  Previously, absent a hard error, these fu=
nctions
> returned either -EUCLEAN (one or more bitflips were corrected) or 0 (no
> bitflips).  Drivers now return, absent a hard error, the maximum number o=
f
> bitflips that were corrected on any one page. =20
>=20
> This change is made possible by the fact that all calls to the driver met=
hods
> now go through mtd wrapper functions.  The values returned by those wrapp=
er
> functions have not changed, nor have their meaning.  Only the values retu=
rned to
> the mtd wrappers by the driver have changed.
>=20
> Tested with nandsim and onenand_sim.  The two drivers that were modified =
were
> compile-tested only.
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

Hi, I am not sure using the return code is a good way for this.

But please, proceed with working on your issues - this patch is not
going to hit 3.2 anyway - I think it is the 3.3 material. Linus promised
3.2 release this week, then we have the merge window, and then it is
time for further patches in this area.

I will do the other changes which I described in my cover letter. I
will also make a patch which adds a bitflips parameter to read/read_oob
and then you will implement=20

But please, just make something which works for you for now and go on
with other DoC issues you have. Meantime I'll prepare the MTD basis
for you.

I think I'll first do the 3 items I described in my series. Then I'll
add "bitflips" parameter to read/read_oob() functions, but won't
implement or ever check it. After this you'll add your code.

How does this sound to you?

--=20
Best Regards,
Artem Bityutskiy

--=-byu9O/Ycszjs20C0TAPG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO+YLhAAoJECmIfjd9wqK0NXAP/3BFtftS/Q1EGU8YDXBKEJxV
WXULJT8/RxaOLAEOgFD42EDQlonRwf1JMz7KyvSD0UgSZc4mcezrRlvG8g9XWknT
7CFAsiXu3K6N6LFS7mEPl/DCxj6GVpwEQYJMQ8+fU9DaAAEpETV9X0WC1kGfgq6Q
5bstmWrTSKDsb0nm2ooduDYzuNl0+6a6G5Oi8Seq4Ug3w+1oeslFfofBWslqWSr+
1p12kIF1HE9L34uj0BZrpozLkiCYFaJus8uBX9Dx2PibChUlT/JnLXNvWGQjzkwG
DQ/Q2LzOobWXd7vlCU4LKKEVf4bA9q2rTuAP4JCVnGWLeQJhbqpU3j+LC9GY7mw2
nX2gqiee6Q/akizSWBcOqGmySLenuUdn7FQRGPnsL/Y91REP3xkGomDMyoVqCoqO
mbQxMwHYDfQkJtbc4ZF77QkvzkZ0VlFigtiXvdqrvtXvu7USm8G4/64qiBuYbxft
8RiCXjbkdppKwdkC1IVNxE38wucRm4Ws0ONjIq94dOGNdDvt4rjSKNN/XrCnT5Yi
l9spkEkTwzXedQC28a51Pic+hg7DPAlqk6TgcRcvWBkJQb3hjh9uf8CpfKkfydVi
9gheOdXo6erW7AHXltqAmlqD7JK44/Sgci4z23BBiWzy2IHO+/uzzSk5NGDoL0K/
1f2RcnTzI7SSzR8Z8R5l
=oTLj
-----END PGP SIGNATURE-----

--=-byu9O/Ycszjs20C0TAPG--
