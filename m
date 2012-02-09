Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvSkx-00021V-5g
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 12:05:43 +0000
Received: by pbcun1 with SMTP id un1so285956pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 04:05:41 -0800 (PST)
Message-ID: <1328789269.22240.83.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] libmtd: perform device checking first
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 09 Feb 2012 14:07:49 +0200
In-Reply-To: <1328789146.22240.82.camel@sauron.fi.intel.com>
References: <1328736382-5798-1-git-send-email-computersforpeace@gmail.com>
 <1328789146.22240.82.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QalU9LiOybDcqicEo+Ix"
Mime-Version: 1.0
Cc: Brian Foster <brian.foster@maxim-ic.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QalU9LiOybDcqicEo+Ix
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-02-09 at 14:05 +0200, Artem Bityutskiy wrote:
> On Wed, 2012-02-08 at 13:26 -0800, Brian Norris wrote:
> > If we don't check for the MTD before calling `legacy_get_dev_info1', we=
 may
> > get errors like:
> >=20
> > libmtd: MTD subsystem is old and does not support sysfs, so MTD charact=
er device nodes have to exist
> > libmtd: error!: "/dev/mtd2" is not a character device
> > mtdinfo: error!: libmtd failed get MTD device 2 information
> >          error 22 (Invalid argument)
> >=20
> > So reverse the order of these two checks.
> >=20
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>=20
> Looks good, thanks, but could you please send a version which applies to
> mtd-utils.git? The 3rd patch in this series does not apply.

Actually, I've pushed patches 1 and 2, would you please re-send the 3rd
one?

--=20
Best Regards,
Artem Bityutskiy

--=-QalU9LiOybDcqicEo+Ix
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPM7cVAAoJECmIfjd9wqK04fMP/RQL5uG7LeOzi+BQLbn7ykt/
zckKP5i/cfQORIiRnzjO2NjQEbqDr+vjrp+0CDdpDJ3onXvwMthW9ypHf4PiBb14
FcngsM0z4+0UySwmdQKYG8uB0/WhoTNJCRRSgKE26pGl2U88DvbDnqxdxDyZnK81
Toh7NKBbyJ2Tk3LXIVWjKJ6Hs6HuxrvGIYoFa8F8srfV5HRbXG1pU1cI91kUXT4g
OYGgNZhHyJACeToWsbZw+hQezt9bga+KEll8VpITZZSxu7j1EAb1I90i25sQ3f4M
i9NiZGLdX2Rk/hjFTslGLTo3AerbmPjxFiKgU80+/WH3iwSEg+DmEgQ34BF3TcgC
/3wnhq2LZzSKL/hgtL24FYH71dCz5cPp6A8B4+HKhCKqEOzV1b7jD/uLueiy0mGk
walP/+AQzILR0BVrhbBj0RjxA7g0YRcfrHIJPhQiCNrfz7E5vkFn52Xis8lWIPOe
kOZ9a5UfNV/Bt9mqhKgpihwTSWA8XOX5FYPBssyBvhrfYG4d3ma2D9oK3gXVOJLJ
gTcOkkFW+J1ppezVp6N0NrAivPskbasIEP55XPcvOqV6DhKbUZjApvAJCTO3buet
jpeMuJ0Jm4hkS7spc3wAKjAFLm+evJV4AB/UlkTUq01qSM24PrkyTMTnqM4vgZAF
IvDWRw54jM5uObduQgwt
=nYVx
-----END PGP SIGNATURE-----

--=-QalU9LiOybDcqicEo+Ix--
