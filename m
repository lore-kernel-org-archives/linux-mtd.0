Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Skcin-00050E-7n
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 15:02:57 +0000
Message-ID: <1340982422.3070.226.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: add minimal amount of reserved erase blocks in
 Kconfig
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 29 Jun 2012 18:07:02 +0300
In-Reply-To: <CACQ1gAgF8pUZJUHOOpohhNSC54X+Y72YymupxOMxnpJ8wgss+g@mail.gmail.com>
References: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
 <1340894351.3070.121.camel@sauron.fi.intel.com>
 <CACQ1gAjLdR-ZRUS6gxMrJzVpRdvdMK2JRceyiFmeSq-FQkZbZg@mail.gmail.com>
 <1340900549.3070.130.camel@sauron.fi.intel.com>
 <CACQ1gAgGbYvTO=_vVW11Ru9OXpra7oiJinbpX=DBiOHmoUtA8g@mail.gmail.com>
 <1340979030.3070.216.camel@sauron.fi.intel.com>
 <CACQ1gAgF8pUZJUHOOpohhNSC54X+Y72YymupxOMxnpJ8wgss+g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pBtcLmnxF2LNZ+ZOiecs"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-pBtcLmnxF2LNZ+ZOiecs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-29 at 16:57 +0200, Richard Genoud wrote:
> 2012/6/29 Artem Bityutskiy <dedekind1@gmail.com>:
> >> I was thinking that instead of giving to ubiattach the MBB, we could
> >> give it the MBB percentage (maximum bad blocks percentage of the whole
> >> flash device).
> >> From this % and the whole flash size, we get the MBB number, and set
> >> beb_rsvd_level for each MTD part.
> >
> > Well, I thought that it may be not flexible enough for some people,
> > because you cannot give 1.5%, since flaoting-point arithmetic in the
> > kernel is not used.
> So there's 2 ways to bypass that :
> - use per-1024 instead of percent =3D> the default value would be 20.
> - let ubiattach do the conversion from MBB% to MBB
> I like the 1st one because it gives a number close to what we have in
> the datasheets.
> What do you think ?

Yeah, probably, centi-percents would be OK.

--=20
Best Regards,
Artem Bityutskiy

--=-pBtcLmnxF2LNZ+ZOiecs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7cSWAAoJECmIfjd9wqK0H6gQAMtjmZiBQBrzI0qIxyMcBJ29
SsgG1fqZRjaAuLrOOa/TyMf1IbeG52ZPxadgVeNP1E9clkG977mIRkvOwi2DpZ8L
S2cXo6MvgGw0C7CIKWBoj/r/ehoNjOjDGKApnZZNrNV9nR5FQ9RVCjktBCnkJ7wA
PN07wE7DiFfXtm2I3X5NKWiqrU6WHOhivYmtr6zjWC9Md5REYY5m3NpFFM4gGa/6
fwpfL0AYkWTVlMTegXqKLo9bB4Q4FJFnpPA64y0+/bCJ6pQumsr8fMOz54rnLXzt
5upXJu7UNiu9/it9lcTIY5E4f1G84uTrq90bE8BJWpCfMIIsg+1ZTc8h253tqESy
8njUR/X+V2DDSGT6FsBlOEemb/2pK0PEr/tQkpHeyowDRzUDJBws5d6Ome7NAftm
QdK6fJfCIPO2XYUKZ0g+ejWGeMKAaMbq4ILtHBcDco9Qp8jrBOh7W44Ik004HaZs
tqxhALRQv1R4TfKFUUOXlNII2KWETnaFP1Bvbljq0XEaignQt2Bl2HNrRXZxoa6Z
tENpuQAGbJPN9oXhkT7DEYvXEtG3JYTtTcoMYy8vNhFt7PK4k3gYDGVsWS4+B6UE
sISUuR7Kl4nm17j2ZTBTDQ8mMkC7abYdU3gcKRx2IDhDRt/Yna32Tdc3ktAHQHsv
aOlRc5lryHnuj+QQjTNz
=9oW0
-----END PGP SIGNATURE-----

--=-pBtcLmnxF2LNZ+ZOiecs--
