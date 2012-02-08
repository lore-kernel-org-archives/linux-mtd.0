Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv691-00013P-VZ
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 11:57:04 +0000
Received: by dakp5 with SMTP id p5so502772dak.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 03:57:01 -0800 (PST)
Message-ID: <1328702346.22240.48.camel@sauron.fi.intel.com>
Subject: Re: Userspace write to UBI partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 08 Feb 2012 13:59:06 +0200
In-Reply-To: <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bO6l2qLxKafSxccHcUZ5"
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


--=-bO6l2qLxKafSxccHcUZ5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-02-07 at 17:36 +0100, Ricard Wanderlof wrote:
> > If dynamic, have you tried setting the UBI_VOL_PROP_DIRECT_WRITE
> > property by issuing a UBI_IOCSETVOLPROP volume ioctl?
> > (formerly named UBI_PROP_DIRECT_WRITE and UBI_IOCSETPROP)
>=20
> Thanks for the pointer, I've never noticed this ioctl before.
>=20
> I'll try this out.

It should help.

>  In the meantime, there doesn't seem to be an ioctl for=20
> erasing blocks?

In UBI it is called "unmap" instead of "erase":

http://www.linux-mtd.infradead.org/doc/ubi.html#L_unmap

--=20
Best Regards,
Artem Bityutskiy

--=-bO6l2qLxKafSxccHcUZ5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMmOKAAoJECmIfjd9wqK02akP/3HdV+Z0QBCZMUvAdOBaDKBt
HA0BzhSXLHMzXjLYUF4SxLwxeNVjNwRP23CCsy010ZsKkkNnLcTlpuOfKZAQL5Y1
0KWv6c1vpbIp1S3TdAu34YYs7R7LKmloWiZeT10SbZUxFlYQhKHkYZMXs0KsUD3s
Q8/dxnLwpOQdaCkGdajXhQPp0u8AFhz0XGxcd/+ognm8wrjZ1DfIFm8wnhdQS4lD
1kjpBrv2/Rr6iv5YjGI7pYKZyyzyTDZWabqCTG+BD+oJo+5OltQlgJmqKtgHM1FF
qvKjHmLnSY/gRMpFZ+Xnqz+T31O2LzgSxdXrueA9ggJurzTnXRNoZYZOA75jAxPj
uW0BUouTbviEsEEKpnpG+0dE8IJmxgCU5LJ6lUPufKovrdPcLK4fX/D7lmKX0jVe
RiqjHRs862J1jLjE0lQfrrpE7dUxG/poZYdazu73VumZ+7K0BQod7Wv+fdztUJpw
qF0Wp3SSoZunhjHXzF0XEg2W4MWMW7RyjiJyqRBNzUhVNw7Cbv3LfHWHs7P1RH7i
yXeEs6le2BISFV8V7Qyti+lxo0pqMnP1w9QeldXsqwbR67ueJZOWAon3lUpj6Vr7
XLxtaBQHnskQo9QkPb3GMNOzLHq9J3UBWcqPMpI+iTp5ty6wWtt6aXgcgsgjpsE9
dbPbV/NSW5urukXQCjTp
=BKny
-----END PGP SIGNATURE-----

--=-bO6l2qLxKafSxccHcUZ5--
