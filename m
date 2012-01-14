Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rm5I7-0004lr-Si
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 15:13:12 +0000
Received: by iakl21 with SMTP id l21so7061531iak.36
 for <linux-mtd@lists.infradead.org>; Sat, 14 Jan 2012 07:13:11 -0800 (PST)
Message-ID: <1326554080.14299.2.camel@sauron.fi.intel.com>
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexandre Gambier <a.gambier@ftemaximal.fr>
Date: Sat, 14 Jan 2012 17:14:40 +0200
In-Reply-To: <4F0D4405.2060800@ftemaximal.fr>
References: <4F0C3339.6070909@ftemaximal.fr> <1326230599.2335.4.camel@koala>
 <4F0D4405.2060800@ftemaximal.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-plAXKZ9XBc1MQqFP61dC"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-plAXKZ9XBc1MQqFP61dC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-01-11 at 09:10 +0100, Alexandre Gambier wrote:
> >> hi everyone,
> >>
> >> I use UBI volume and UBIFS on top of a NAND device with an embedded
> >> video meter.
> >> Everything works fine except that when a UBI volume is mounted the
> >> following warning is outputted :
> >> "UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PE=
B
> >> handling, reserved 0, need 20"
> > Looks like the pool of reserved PEBs is fully used. Fo how long have yo=
u
> > been using this flash?
> This is a brand new flash...I've been using it for 2 months.

OK, in this case this is most probably because you specified too large
sizes in your ubinize.cfg. So that your volumes take all eraseblocks.
Try to make some volumes smaller.

--=20
Best Regards,
Artem Bityutskiy

--=-plAXKZ9XBc1MQqFP61dC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPEZvgAAoJECmIfjd9wqK0puAQALJdEBZclohfxcKbJ5LmwAUn
dzBFrOnOcsvINk6tjvjTcbRhOTxSkirDVwaM9dz7IqZr1a4EgdXZZqrUcDv0PafF
+YRGVninePofYWCZDu+Xew1JIULY6FW3CoSDV3UFgsecq3634SWh9ZQpvFauiQXs
o0ChHhCA4+u8UcbYA4p3FodTJY0yAu+ivC408ljwAGFjXG9/knS0Nh+GtGdaxVwn
482IyS4gv8rKwM0Z9ixLwiNIAoLE4OgMPOQAQw/h/b8CDG2OGVW1pK+/fYajUJt4
uixOo4anSWO3uyJAm56apLKK/Uvo8+vGdu4DiHxNWgnWFciWBjaMrAnte1YbQ7IM
TPSZLt630bGc+Qy53Ukf35npdz7y4qx2h77HVNQquNtyP6vYATP/iDnJ21I4bso3
jnqYk1wu1fMe+aoeVJSxqI/Tk55EDrA9FLX7xTIBoak9E5PbdN2ldqaS+VVqDykZ
T9cmBadbDxZPPSlJ7dxFXWDrWdpZ35kEB3zl+dondRKVuMzAvg22zGy+6Qui/2iV
gz0bnymTXOhownmWLECLNcN4+y9UjjvuqKweKtlyfRS5OOqCaZ3vQvrfWpHYyAlK
V/gtvEmQ1zvLGqT795K5Oq7TsNb0B0DNIV4I7KvoXers8totnZN+ZQ00DiD7sbeE
I+ywRPknbhFDMrJyB9S+
=+59k
-----END PGP SIGNATURE-----

--=-plAXKZ9XBc1MQqFP61dC--
