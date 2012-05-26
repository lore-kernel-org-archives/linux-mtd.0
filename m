Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SYHXs-0000qN-1S
 for linux-mtd@lists.infradead.org; Sat, 26 May 2012 14:00:40 +0000
Received: by lbbgg6 with SMTP id gg6so1560390lbb.36
 for <linux-mtd@lists.infradead.org>; Sat, 26 May 2012 07:00:38 -0700 (PDT)
Message-ID: <1338040835.2525.41.camel@koala>
Subject: Re: Resizing of an existing UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
Date: Sat, 26 May 2012 17:00:35 +0300
In-Reply-To: <4FBF5B20.50406@aimvalley.nl>
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com>
 <4FBF5B20.50406@aimvalley.nl>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-gXBJ53aGeLZul0jllrlz"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-gXBJ53aGeLZul0jllrlz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 12:12 +0200, Norbert van Bolhuis wrote:
> This is not a problem for a UBIFS being created dynamically, so with
> ubiformat + ubiattach + ubimkvol ? In this case the size of the lprops
> area is determined by the total amount of LEBs of the MTD partition ?

No, it is set according to the --max-leb-cnt parameter. Then UBIFS will
be able to grow up to "--max-leb-cnt" easily.

> A UBIFS volume can then be resized with ubirsvol as long as it does not
> conflict with other volumes and does not exceed the total amount of
> LEBs of the MTD partition ?

Yes, and if you resize withing '--max-leb-cnt', the UBIFS will
automatically resize itself.

http://linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt

--=20
Best Regards,
Artem Bityutskiy

--=-gXBJ53aGeLZul0jllrlz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPwOIDAAoJECmIfjd9wqK0QuUQALblNwBbrvZ032Ulzzwlr2eB
QtcSw9ZkGqGTbAcU6zc/iJWUpLeGY7gHIMO5yawPSk+mSxw+gc/dzBvk485O0gk+
MT/gAAGqtTSpTekOzZXqboAKD3QFELZ8d3+sdiVa0oEbpAfXyVIg6X7ph/4qx+hm
thmUkYtHeWMzH36025SEDqC1/dnK7nZyVvpWvKLQNd4I0Cmv9JzqnYquk7v2wmAY
mEnkkY7tgtGAtFVvANyfQ3fG3glAl8+nzfkfM0EsyYJfUTOBhX07HleSnHbNYL7J
84/WD9xMLe33sNuAhYyhtGmEdaSm5AW8qikATt7p8P4dF4xPlixK/+Zd3b1Fc1pp
/shYBKe8ITK+3evs29cMiyURKic3yQ3LiLLt8zzfqLtb4TzRCy2hUBaAIvTG4qPb
rRe8QGjn8ITzH6Uo3W7EUfX/LM+5RLKW/0RPyjdQIu6sru0bIyGVdLf4tX+hXVNI
DfnpfoZO4TZifr7CQ2FR9H3Nb3+TFtMcK2zkqXGZc5vPsMSUAKaSm7/z8jQBxQg8
980pQLYkr6DGDdhnZRUt+sd0zIfly4REyzel7/wK9QI753klrniC2vVAqMXjNG8P
IZ5zk+7OtY8ZNDg8Gyaldo4O0afH3BY3X5Z6jzzy7jrAlwHeCbzVQQI95be5j5lp
OlUDHDVblBz6L7Uvvdsj
=bSnM
-----END PGP SIGNATURE-----

--=-gXBJ53aGeLZul0jllrlz--
