Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5ErD-0007cS-GK
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 11:48:53 +0000
Received: by bkcji2 with SMTP id ji2so855670bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 04:48:49 -0700 (PDT)
Message-ID: <1345895326.1815.4.camel@kyv>
Subject: Re: [PATCH v3 10/10] mtd: nand: omap2: use gpmc provided irqs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Afzal Mohammed <afzal@ti.com>
Date: Sat, 25 Aug 2012 14:48:46 +0300
In-Reply-To: <c5a608a70a875191e1323958c74fb2ac8dfa34b3.1344609341.git.afzal@ti.com>
References: <cover.1344609341.git.afzal@ti.com>
 <c5a608a70a875191e1323958c74fb2ac8dfa34b3.1344609341.git.afzal@ti.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/uxSJ0+p92TXOJM09xU6"
Mime-Version: 1.0
Cc: tony@atomide.com, artem.bityutskiy@linux.intel.com, ivan.djelic@parrot.com,
 linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/uxSJ0+p92TXOJM09xU6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-21 at 15:14 +0530, Afzal Mohammed wrote:
> GPMC platform initialization provides it's clients
> with interrupts that can be used through struct
> resource. Make use of it for irq mode functionality.
>=20
> Also now write protect disable is done by GPMC,
> hence remove it.
>=20
> Signed-off-by: Afzal Mohammed <afzal@ti.com>

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

--=20
Best Regards,
Artem Bityutskiy

--=-/uxSJ0+p92TXOJM09xU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQOLueAAoJECmIfjd9wqK0YwQP/232SMimRqDgehn69+IwaLsI
AI1Yaqe2SGUNe69iMdcFBLckCB7nHpstSNWYka6QRtpmsfBD3rcvXEXq04cneSz2
t8PZXHnq0aeuVakVt/t0GIiSfKgngIagfBBCRhKYtyh1P59RLKB+UfQfCA7YeVE5
57MDx1RAK9bz228uaIHEukvtaidvxgA3ZeMMrmm4u8BkgElCAkIvgPuIWoFfu9Qe
8T3iuF2jJff6QEisSpFNjLmKX6UdjQYY0njiHhPimSa8moWZrsCTuZDKPqCC7ZMx
2XFor6SGn7d716/dZYnhC4KDI9FHVpD5PihWoh3hkaXRLAM0SLUCiI6jE6r3JlfE
CwnZ0tYwCc9aXOE8GG04fYnaySt9JbfykT/yMSag2q3gIxzkJiiEM239CpqH+wpF
2/A9iTjm1Vwlxpr3wyw045XoQ8J19PeXPew/jLmQzJp0zBn4O9N0X5yMyscmw64m
AhfutzvXjE3wntYIxNQZs0PYK97XyGZsCGfKimkjlo79fX+rWgvlM1fN/yrgdvG9
zqmZeHLM0Q4fOl4dzwprPRXqXAEFJEKqbbjLHowzLyXJwlkyhNyu/dPLvEF0fdu6
eyrgmT5RDlixJHV0sD7c68bpjp6VrxPrAYBdSYEuMvQhScfx6YzHqpQqITw9IZ15
H8cts8G4zLW9YqrGd0r1
=/nwL
-----END PGP SIGNATURE-----

--=-/uxSJ0+p92TXOJM09xU6--
