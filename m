Message-ID: <1413564096.23022.5.camel@decadent.org.uk>
Subject: Re: [PATCH v2 1/5] m25p80,spi-nor: Fix module aliases for m25p80
From: Ben Hutchings <ben@decadent.org.uk>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 17 Oct 2014 18:41:36 +0200
In-Reply-To: <20141017163500.GJ22169@norris-Latitude-E6410>
References: <1412043222.9388.81.camel@decadent.org.uk>
 <1412043295.9388.82.camel@decadent.org.uk>
 <20141010045126.GB22169@norris-Latitude-E6410>
 <20141017162335.GG22169@norris-Latitude-E6410>
 <20141017163500.GJ22169@norris-Latitude-E6410>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-fFnBafOMOPVR+og7RyXN"
Mime-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ian Campbell <ijc@hellion.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huang Shijie <shijie8@gmail.com>, linux-arm-kernel@lists.infradead.org,
 debian-kernel <debian-kernel@lists.debian.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-fFnBafOMOPVR+og7RyXN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-10-17 at 09:35 -0700, Brian Norris wrote:
> On Fri, Oct 17, 2014 at 09:23:35AM -0700, Brian Norris wrote:
> > On Thu, Oct 09, 2014 at 09:51:26PM -0700, Brian Norris wrote:
> > > On Tue, Sep 30, 2014 at 03:14:55AM +0100, Ben Hutchings wrote:
> > > > m25p80's device ID table is now spi_nor_ids, defined in spi-nor.  T=
he
> > > > MODULE_DEVICE_TABLE() macro doesn't work with extern definitions, b=
ut
> > > > its use was also removed at the same time.  Now if m25p80 is built =
as
> > > > a module it doesn't get the necessary aliases to be loaded
> > > > automatically.
> > > >=20
> > > > A clean solution to this will involve defining the list of device
> > > > IDs in spi-nor.h and removing struct spi_device_id from the spi-nor
> > > > API, but this is quite a large change.
> > > >=20
> > > > As a quick fix suitable for stable, copy the device IDs back into
> > > > m25p80.
> > > >=20
> > > > Fixes: 03e296f613af ("mtd: m25p80: use the SPI nor framework")
> > > > Cc: stable <stable@vger.kernel.org> # 3.16.x: 32f1b7c8352f: mtd: mo=
ve support for struct flash_platform_data into m25p80
> > > > Cc: stable <stable@vger.kernel.org> # 3.16.x
> > > > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > >=20
> > > Can I get any acks/tested-by's? I'll try to test this out when I get
> > > back to the office, but I'd like to be able to send this in the 3.18
> > > cycle still.
> >=20
> > Applied this patch to l2-mtd/master. Thanks!
>=20
> Scratch that; I took Rafal's rebased version found at:
>=20
>   git://git.infradead.org/users/rafal/mtd.git

Thanks!

Ben.

--=20
Ben Hutchings
Life is what happens to you while you're busy making other plans.
                                                               - John Lenno=
n

--=-fFnBafOMOPVR+og7RyXN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVEFGxee/yOyVhhEJAQrVWw/+J56ism4EWSLwGNBVxSKlK22EPkmOq/zv
91TcgqpF1y7WtvIDSnmaknUdO3qcFH/2gCfKtke/u0KKGsGnuTmtQoTd2jxmaDZB
yxbGr5YmeENhloDLQBwRSbzFsd2/kA5qNhu7xujpxCGg3ZyVCTZcSyKTJGo6m7+Y
9uusG5Q04VKbfySC8/fRt/vIqARQQscsApf9ruJLAZeJTd8MIuEho1/+XhG1nEBS
W3DH+SXEjsCEXcGso6vXSRouF8Rv4fysZmVShxuKQkD0xzGPTmDZdNxAQnim1SsE
+CSQQG+UT3QS01hKDKN+JNBGRGeiPJ2SuqAFKAAp6MBALfoLjgH7B7UPmmclfq2o
KFnWCKUS8mW4ob7hlok7DYsLq2t3qPZRdgYMCwBoy5Rq5EUhoL5FcpMVT1q7T057
dMlddsPvlLgeYx0mJ1rFbn1W71ClKFxb7mrSusvbvAYLRDCsxsWkpAajfUdlw3jO
18s7nqfuWicewfvgwh94RJxthINUyzHPwWa3TuQjZ4gm/mKUlgKSnkZ9KZJYHopw
BzgAX7Xni4BG2X1tpVkcs6oj2QhH5jX+AiQK0/Np8tVHjbNLdnjHASKhML8wHDp2
zhwVj1iQEDNCxNnyNHTsA/AKrzcSk/YMb10zLaA9haZFDttspM2ewW5bOXzuqe4A
/a1DtvWUZwk=
=PxVS
-----END PGP SIGNATURE-----

--=-fFnBafOMOPVR+og7RyXN--
