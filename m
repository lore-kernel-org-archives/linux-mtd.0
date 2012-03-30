Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDcce-0006o1-IN
 for linux-mtd@lists.infradead.org; Fri, 30 Mar 2012 14:16:13 +0000
Message-ID: <1333117156.5440.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Fri, 30 Mar 2012 17:19:16 +0300
In-Reply-To: <4F64F17C.2070409@newsguy.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com> <4F64F17C.2070409@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-AcSEB4nRy9vkY4nLhbVP"
Mime-Version: 1.0
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-AcSEB4nRy9vkY4nLhbVP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-03-17 at 13:18 -0700, Mike Dunn wrote:
>=20
> If I do go ahead, I can first post patches that fixes the two patches
> already
> pushed to l2-mtd, or Artem can just pull them out and I'll start from
> scratch.
> I personally prefer the former, since it's easier for me, plus it
> would be
> illustrative of the change of plans.=20

We can do this during the post-rc1 cycle. It is my fault that I did not
weed them out in time, but this does not look fatal.

--=20
Best Regards,
Artem Bityutskiy

--=-AcSEB4nRy9vkY4nLhbVP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPdcDkAAoJECmIfjd9wqK0cyoQAL9RFqTiiGPIgEdh/kiLoc5b
v4tv9hNufrfL3yuukR7BgZYCo3zRL9J9op4yNH/EdMekUSeVCnQQ9uZAL7bQB274
4FQvRl1fUY3gNvuIdXsTGJGd3CFXa6IPOd66lCZUMdT3GF6wzYLCsXSu5ILfdwPt
A23vur2YACs2sr73FurQX0Mm1CIDmfhDY7zFONiF1s4W6yt2gPxFDc7IM3OE3Cli
t4jmtFuCseSCjRAHSQ9QFbCpWPfTVQ8FXA5Ow9u1XiBw0JcwE5ImTT6981VzJkwo
m0KGO1WHwRrnTtZlwNKibkQPvA28udx9+TjQegKpCtd6jLl1bMchwNu5NICVPp2u
rMGVJMGp811s4bomVwRKfLnW1wTD/bk+ZVp/JmNh+/b4LivgeGCjEV+QtLzj9+pn
hPtZL60AyZA/QSt4Xlp2/1K9SNj2di+lXR62LLDYwE5Io/+Zgqr0mM/oFyBm0CVo
/vd/mjqsxSC/YZ5YTpk4yRF0TGlwhkdgtAdNnYx06wnXyML78BomngvgvfoLF6NU
PwKZIlG39m74yZWQ1exswljDWF+Of1SZVS8etYEyIL2r9FeuJ0DXhEYqXsGyXf22
gDCHLuZHdLWJZ6Pks82FhH0yrZwpS+GF552JvxklaTGR8d5XXMgFxFkng2zjW+eb
llky236rtCtAqIO2tQ+I
=RdMf
-----END PGP SIGNATURE-----

--=-AcSEB4nRy9vkY4nLhbVP--
