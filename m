Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZH0d-0004Wm-QX
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 08:10:44 +0000
Message-ID: <1353053478.3618.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] ubi-tests/integ: Add PRIxxx_t defines.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bill Pringlemeir <bpringle@sympatico.ca>
Date: Fri, 16 Nov 2012 10:11:18 +0200
In-Reply-To: <BLU0-SMTP308EDE3F432519B05D37A0B8640@phx.gbl>
References: <BLU0-SMTP308EDE3F432519B05D37A0B8640@phx.gbl>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3nXZuOPU7BPnJtOeALhI"
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


--=-3nXZuOPU7BPnJtOeALhI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-05 at 13:04 -0500, Bill Pringlemeir wrote:
> Message-ID: <87ehk7nc1l.fsf@sympatico.ca>
> User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3Dus-ascii
> --text follows this line--
> I doubt this is the 'correct' solution, but it does show the issue.
>=20
> common.h is shadowed by local copy of the same name.
> Also include inttype.h in case the c library does not.
>=20
> Signed-off-by: Bill Pringlemeir <bpringlemeir@nbsps.com>

Instead, I just pushed a huge commit which changes ubi-tests so that
they use the top-level common.h. Now everything compiles fine. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-3nXZuOPU7BPnJtOeALhI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpfUmAAoJECmIfjd9wqK0dXAP/jbrqiSTxwT8l3QH7vpROTCS
WQyK68Weu8T2Frmrot/Lo8gM+lS02bKbkNe4J08TkwHPj2oglNltL+dPZNCeYRd2
bq7yT0uDZrn1YqBSwjkdTIFcuQyzyurOw409bvHmoai+++fJ/v2X8J0q1c3jMWGq
L3jdY4AibHYNmvevlfxyO5ygE4W98X3Se+w55AoJshFvjIrgA24ZebNcykrQASbg
apmDoWsfu3qJqf3wTu6V2FlMk0A89tgFp6d4pyCEa6d9Zl1mu3+7AnjH2xbVOoct
COZNq2z/H9KFu10pS+GvXLELj32Ma7kAn3c/0/ORups9pKem9WhP5nSfbCxkm4bu
V2kk8JaUvpQ6Od0BafPqnjUEYlJBYU5hJM9P6WHXP6UoTJIhpzNO4Kl2HEdkf42g
3gNbvQ5CyYirKJJCu64M7E8Iqugcpbfh5bhHYGtZgPX84snzi/ngREsPqxfJvsB7
YKVlHuuuCnxRGq82RjnxbTX+1KysWSCmJ2HCo2j3Aw6cLZVTzpQg26SIrUIVP6NK
forr3v3CVdnZboTHNCvwz/c9S6qMiUC8ZDinDT8LgBGAkhKGVS++p5GDABkLU1sp
Ev3ekGwzku1TJIvkA44V08WI/116KhAU8uvoOSQYpUC2Zj700N35y0wNrMUV96nw
Lahokk3RQ8zrGAa2HrV4
=wrUc
-----END PGP SIGNATURE-----

--=-3nXZuOPU7BPnJtOeALhI--
