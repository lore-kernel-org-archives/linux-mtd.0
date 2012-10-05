Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TK4Gy-0003UR-RH
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 09:32:45 +0000
Message-ID: <1349429559.20373.78.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: onenand: Make flexonenand_set_boundary static
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Date: Fri, 05 Oct 2012 12:32:39 +0300
In-Reply-To: <1348294351-27182-1-git-send-email-sachin.kamat@linaro.org>
References: <1348294351-27182-1-git-send-email-sachin.kamat@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/7HHR3e0GeTpbyboQkvo"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, patches@linaro.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/7HHR3e0GeTpbyboQkvo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-09-22 at 11:42 +0530, Sachin Kamat wrote:
> Fixes the following sparse warning:
> drivers/mtd/onenand/onenand_base.c:3697:5: warning:
> symbol 'flexonenand_set_boundary' was not declared. Should it be static?
>=20
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-/7HHR3e0GeTpbyboQkvo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQbqk3AAoJECmIfjd9wqK0HkUP/3d093U4L2H+si4AJ1wjBeE5
GEbpxRBJPQuB2pL1WAHZHaUqi9zbNguOMYgwi1ek+KxbvtVWcZYykFRvYkQjp8S5
c6E/LKREiPXWDJs03GcFL+CigoQ7w9NkUd17makx3nIb5tZA6TubtMMHWrqpS+SJ
nFHw8AH9fJCyySDnczQH8k7Ap17KcKM2RiCXN7Q9cLFOvMEwKGv2YyYS1F3Ikeue
M6MmTwo2D/a3HJOE+8uWdNipQSoeKUi1ENSBQNerN6UasG4dpYZVDih/rOfq5roR
entOwe9Wy3KN4LdhRZ9rQBLGBnTYRSK6YbfodLf4f70+RfLYb7aFMREWfC2WuowA
J1W3wuFYhb+TAC/7HrCvi75qP/sBDaH4Qv//buo22twIHjOq114UIpook0LflH/s
8h8RoC0ofHcd4VM1/VkXBIKhkRIxKBoLn2avPycr/ZOhr9HRgxHtB5S9WTPTDJ77
/e7rONhXRwJ6r0M+I+cg4SFSlPud2Hw6FZJGc+g8+ixOQprgx//TUs9gUCGTIjR+
JJOTP3riNdxQHIyRDNgrmyqp3VfsWatyZpmNzDni4WXpRiZpan3hLiYyxCIKde66
0OYjWWe+kdhzZGk5LA/BtYAQyghmwPClGdcL4GjUYh/c/z0meO0iDoHTgVYWMiS6
pF/y+8EreoY9M3RRtHlL
=N9G1
-----END PGP SIGNATURE-----

--=-/7HHR3e0GeTpbyboQkvo--
