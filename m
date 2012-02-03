Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtFFo-0003OS-65
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 09:16:25 +0000
Received: by dakp5 with SMTP id p5so3093759dak.36
 for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2012 01:16:23 -0800 (PST)
Message-ID: <1328260703.13362.3.camel@sauron.fi.intel.com>
Subject: Re: Comparing UBI volumes to generate patch for upgrades
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Date: Fri, 03 Feb 2012 11:18:23 +0200
In-Reply-To: <4F298507.5010600@grid-net.com>
References: <4F298507.5010600@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-87T/jUoK9i9/KtHuLzju"
Mime-Version: 1.0
Cc: mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-87T/jUoK9i9/KtHuLzju
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-01 at 10:31 -0800, Subodh Nijsure wrote:
> one option is  use VCDIFF/bsdif or variation there-of and generate a=20
> binary diff package.
>=20
> option 2 is write a tool that compares UBI volume layout for revision 1=
=20
> and UBI volume layout for revision 2 and then send that difference,=20
> along the lines of what is outlined in the paper @=20
> http://www.icmu.org/icmu2010/Papers/3-1.pdf

I guess you can do this for R/O volumes, but not R/W.

Depending on how much extra flash you have, you may do the actual update
in a power-off-tolerant manner or not.

> We are just getting started writing a tool to compare UBI volumes, but I=
=20
> want to send out querry to UBI experts to see if there are some=20
> fundamental issues with UBI that would make comparing UBI volumes and=20
> applying such a patch would be a non-starter.

I assume you are not planning to do this stuff in kernel space, right?

--=20
Best Regards,
Artem Bityutskiy


--=-87T/jUoK9i9/KtHuLzju
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK6ZfAAoJECmIfjd9wqK0ogkQALwQmkAGLtpsKHHweeqKo/Y9
vr8+fYqQ5CSIeV2+mpoF32JfkYfYH6WPGnG/XAWopXS2cRy6qbj+lQwxWiRYT7jE
EjDM48oBYq6JcyMkeZcjwiwlXsLtIPMz06qaYpu5z0GU+fxz9h6nVdBaidKWanyw
FNu6vRy1GPOEzAV5/s7Y0cs12anLBhn9NpAPUscbqkyqwCbEmIgq0qPv1SWBLKgp
y2BJNwjSozxuVU3vz+pgTGcJnBpSbxfK4vOyiJzI+Qm2PawcKCS7TLsXGDysfL5Z
06DEBJypBTJVqDDmH7rU4w1p8L2kxo+WRteevnMr7QN9SeHpoUmcL2Ibjr0gAlov
DPe0Odv/7l42G5xR9dY44PmDuRPJrpysm7IaS0K1ripHMFab+Zso6Mke7vrgAYqL
/lbZFoEY15GeesKC7Tyy5lvqgSIQ4PfzjXSRMT2rLAi4a2csZ0ZS2FFCZ+p12uNB
4rlXnctVoFMaqnWhQ/qjhbbgD7e/xDVBYQC6E86uPquAKIV4q/Jju4sisZfh6OSH
QQ4eYc94VXU8xUSaupEuHeOvF2zpp611Z7wlqzr/RtTDnjxfLNboOBC8COeAinaq
/oXPjl7DCGnDHXDqpH5ZGqq3fH+jjvuqXY9zn7VRre76HU2Sf1KnQP5bcAVJONMw
Nc8dndboUkcLU3W5hx0T
=XTML
-----END PGP SIGNATURE-----

--=-87T/jUoK9i9/KtHuLzju--
