Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOZjh-0005FD-Jn
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 19:24:46 +0000
Received: by lbbgg6 with SMTP id gg6so65745lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 12:24:43 -0700 (PDT)
Message-ID: <1335727480.1942.18.camel@koala>
Subject: Re: [PATCH 7/7] mtd: driver _read() returns max_bitflips;
 mtd_read() returns -EUCLEAN
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Sun, 29 Apr 2012 22:24:40 +0300
In-Reply-To: <4F984CC9.9060701@newsguy.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
 <871unbis55.fsf@free.fr> <4F984CC9.9060701@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-avGIwBoRyDk4uY0AT5p/"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-avGIwBoRyDk4uY0AT5p/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-25 at 12:13 -0700, Mike Dunn wrote:
> Thanks for the review Robert.
>=20
> On 04/25/2012 11:27 AM, Robert Jarzmik wrote:
> >=20
> > I think you should change :
> >> - 	while (!ret && (len > 0 || ooblen > 0)) {" will exit because ret is=
 not
> > into
> >> - 	while (ret >=3D 0 && (len > 0 || ooblen > 0)) {".
> >=20
> > With that change, please add my:
> > Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
>=20
>=20
> In my exuberance, I prematurely sent the next version of the whole set.  =
Artem,
> Robert's requested change is in patch 7/7.  If no other problems come to =
light,
> maybe you could consider merging the first 6?  Then I only need to prepar=
e a
> corrected version of patch 7.

Pushed the series to l2-mtd.git, thanks! You can send the newer version
and I'll put it instead of the older one. Do not forget to add
Acked-by's when you re-send, please.

--=20
Best Regards,
Artem Bityutskiy

--=-avGIwBoRyDk4uY0AT5p/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPnZV4AAoJECmIfjd9wqK0v8MQALroFcs8YMURruRe5MLhEa8d
EAdmDohDqIQZZeReohptxXknVS3DS49y4HqLZtu0AJXsa51jLB0Nl9wue0F9ItMA
WLI2vmYAX7NQAnjfQB4154ZDFXH0xrJ3hjd2J673M9ICV0rMW4gSL336XeYXeNYl
pXWaHMqQw5gBJVLYJtpPFC9T3Ba7wqtWl4iMO4yyjK93+5Yk2NoST/lIco5bcUSy
D9KxYH3muIVoqSaW3gdo9xDLJxi1jq2QPsU1DbMueMjA8ADwNeABeXziZNmXdsY7
44iUYFo88jHLQW+R7RCvEVWYui+qW4slCgZIJ9PHL3p0d/WhRB6IWkun+v0cb1dD
37DmoTsSkGthWsAt2LpIpn71xfNM7zvgpLYd7O9lbawm0EV3mqzHClUaoYe4+25F
YmFl6EV2slyglDKDSe0c6hOnFBxFQ90FxSTgurZbJhdHGm+2tQaHuKdIFkJMXrNU
onsD10zYB7e3fCofHZ2vxLzfzzbm+UuJPl1rgoajrfZvV2sgOZrFBxRid+36UelO
ULrp5GJukvnn6CCW/be4HmDS+4iJQ32ri3EmUNuqmDMrjU2ywzrQer7T3JhKUBZo
X5ubKy/KyA06BDjyqO1UFyVYso3m9rgybMgzXawS21lpGswA2GWUP2G8OT6LoM2q
l59fTnMpUB/W4CHvKmp3
=+DJc
-----END PGP SIGNATURE-----

--=-avGIwBoRyDk4uY0AT5p/--
