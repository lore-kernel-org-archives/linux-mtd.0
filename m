Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv6AP-0001Ns-HD
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 11:58:30 +0000
Received: by pbdx9 with SMTP id x9so589267pbd.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 03:58:28 -0800 (PST)
Message-ID: <1328702434.22240.50.camel@sauron.fi.intel.com>
Subject: Re: Userspace write to UBI partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 08 Feb 2012 14:00:34 +0200
In-Reply-To: <Pine.LNX.4.64.1202080834220.17234@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
 <20120207190938.7a59fae9@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202080834220.17234@lnxricardw.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lxa0dVqWRqTjpn2ouulP"
Mime-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lxa0dVqWRqTjpn2ouulP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-08 at 08:35 +0100, Ricard Wanderlof wrote:
> On Tue, 7 Feb 2012, Shmulik Ladkani wrote:
>=20
> >> I'll try this out. In the meantime, there doesn't seem to be an ioctl =
for
> >> erasing blocks?
> >>
> > Well, another option would be using Gluebi - (CONFIG_MTD_UBI_GLUEBI).
> > It exposes a "regular" mtd for every existing volume.
> >
> > You'd be able to work using standard mtd interfaces on it (mtdchar
> > ioctls, e.g. MEMERASE, or even the mtdblock abstraction).
>=20
> For other reasons, gluebi is not a viable alternative for us. Mainly=20
> because it puts an mtd device on _every_ ubi volume, meaning that volumes=
=20
> can't be removed or resized while gluebi is enabled.

I do not recommend to use gluebi in general - it is just a hack, but the
limitation you brought up is fixable if you really need to :-)

--=20
Best Regards,
Artem Bityutskiy

--=-lxa0dVqWRqTjpn2ouulP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMmPiAAoJECmIfjd9wqK0BDsQALIbGQybixZgAcvQmSLqeeAk
JqoNiHHb48dJpIF01o+jnda2ImyvIY7+L4hz1eoI5KWl+d9on25P3FE2xomYf9dW
FLtwn+c3ds7RvXEet7YRrG+OwQ46piQbQaZgBrK0V4gU7cBFt5XOTSDS34p0hS7a
DTZsNQmEwo4d0FPYgwVE0aVbi031N+m2wqakb5A9JUo2c/6+8LGIV02k4n33+KQB
9NtUHofi7aKzcsQFN2m0Cp9cxvzme7yp0u3XgjJCz51GqY+Z1OBPkbpygxfzBM8R
JVRHKr9HuEawbnrUvwgHUtQoI1HzXZtJiXqzkPqUWDqalN5gb/oJTwyDEykz/+/1
durJdns3caC7d/HH5RDhkoFE37bJPUJfteRX1zHMVkrEA9lp/TVbjsauy6x9YY2r
hMxe5q2TijfW1orlPS/umGpZGo2Iq1o3Gziv0dsumho461A/uAMv6gGQPkYPTCsM
DuASZec0959p4jFJ9nGocLZobhuwquDkuGJq1ayUvXXPAWejUeifnxpZ6bl1YLiE
f9+A2Jq+hltCZQDYhCgpjzCyG0V3awu7C+3b3u07zOGHynUbQo3b4iFIXFvfYbxe
xMUdIMEi+Jb+1fGDps7t6OXug/kwkzlNUQ8074oHEa2KfaFb58dqCDZYqvfW1D1k
4xSMtoJvJvXlmb32+7OF
=Un17
-----END PGP SIGNATURE-----

--=-lxa0dVqWRqTjpn2ouulP--
