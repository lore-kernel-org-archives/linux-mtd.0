Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOTPd-0007cU-9q
 for linux-mtd@lists.infradead.org; Wed, 17 Oct 2012 13:11:53 +0000
Message-ID: <1350479529.5769.155.camel@sauron.fi.intel.com>
Subject: Re: GPMI NAND crashes with UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marex@denx.de>
Date: Wed, 17 Oct 2012 16:12:09 +0300
In-Reply-To: <201210111355.33836.marex@denx.de>
References: <201210050345.49507.marex@denx.de>
 <1349954707.12014.14.camel@sauron.fi.intel.com>
 <201210111355.33836.marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-TAX0Yopd1BHfufPzWNUb"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-TAX0Yopd1BHfufPzWNUb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-10-11 at 13:55 +0200, Marek Vasut wrote:
> Dear Artem Bityutskiy,
>=20
> > On Fri, 2012-10-05 at 03:45 +0200, Marek Vasut wrote:
> > > Hello guys,
> > >=20
> > > I tried integck from mtd-utils 1.5.0 on GPMI NAND driver since I susp=
ect
> > > it still has issues with UBI. See the outcome for yourself, log
> > > attached. Any suggestions would be very appreciated.
> > >=20
> > > :~/mtd-utils-1.5.0/tests/fs-tests/integrity# ./integck /media
> >=20
> > Wait, you have power-cut emulation enabled, did you deliberately enable
> > it via UBIFS debugfs files?
>=20
> I enabled this:
> echo 1 > /sys/kernel/debug/ubifs/tst_recovery

Then this is expected behavior. You can run integck with -p, then it
will be aware for the power-cut emulation and will continue running.

--=20
Best Regards,
Artem Bityutskiy

--=-TAX0Yopd1BHfufPzWNUb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfq6pAAoJECmIfjd9wqK07wkP/iRkn6/rJ1X4OhK7EUdIUODd
Vxw49P//ZFFBswOirvNe/lX7hqhx/dN4hCViWP9qzCbAzn6spLcIjFrbS3efx64A
ZV1r983cjApGnnfECqU8ySPuDoW4K4+Q3BWQIDjeAnaEjiCf+QUB8KPD0bui6M8+
0hBtw1QKq1nkRw+AcFyXy/w0dAsuqDef5XPSJ8sTMhvwaHAjw4dOxtlMLO9BoISy
61/hlDGrXoEyNNCeJUj6E6IdtiE74KsR0Hd3uwMbVIBWcEFHSRDXY+5Zmp8zp5Gz
wUpiTMPUeLzvsJV2XildZnCBaH4XfQdGxpp+LqzeJ14/3BZWV7RmibW2uP/dfkAW
xli1Uyk9WMnyvwPCd2tUY1iB7XRYOzF0Hq0qr5LPQoanPAXXQ0yJO5t/+qOnzskB
PjCSgzaK95w3gnAfBRxJt8+UZ0XzckKyK16Vuy3eI/eGMJ4HFVeY5QPDyPqui4QC
rtEZH6+zvlpi8xbi75wnus6PioN8zDlpK2pyn+8yHS5I0lNPrr4+/6tkfsDo5+8b
nCxuio6ezaw3aAbZRCnBJaR2FLJQppnYYUJT6gEA1NfPRRZBAv+3+Fzq6lEFq+sT
DjuBB6I5NrdDldbF3mi6CPF3pjeYReUyB29SfioE7LWDyVwAkJ3sivgv3xFF6C8y
+ur2M2B4dCZvM1Jage/i
=oAed
-----END PGP SIGNATURE-----

--=-TAX0Yopd1BHfufPzWNUb--
