Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4sRb-0000WO-Fh
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 11:52:56 +0000
Message-ID: <1345809464.2848.298.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: maps: pci: remove dead code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 24 Aug 2012 14:57:44 +0300
In-Reply-To: <1344675523-27452-1-git-send-email-w.sang@pengutronix.de>
References: <1344675523-27452-1-git-send-email-w.sang@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UPRrd6tRmKxHwYsD9WtS"
Mime-Version: 1.0
Cc: Russell King <linux@arm.linux.org.uk>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UPRrd6tRmKxHwYsD9WtS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-08-11 at 10:58 +0200, Wolfram Sang wrote:
> Removes disabled printk (which should be dev_dbg these days) as well
> as #if 0 blocks (which are trivial to reimplement if ever needed) to
> meet basic CodingStyle guidelines.
>=20
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-UPRrd6tRmKxHwYsD9WtS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2w4AAoJECmIfjd9wqK0w5YQAMJLAVrqbYJjMAPPUHo7oCKX
UH7qU8IVJfaipyHnjFUnLbxejpIiT+BDytqSvwvDKdxbHOGyiA4L63HdPC+Y2owj
5AuAuEpwgaRpaQ7ZAFou7Edg7KFQRZs2A3t+fWJTFTZTu+76DzYcIYN1olN1uvPj
jlw9E77h/tYI9A+y6w5mYHwcdvSTHvAsS9p+mrO3fnaRIztVVPw5k4PQcmcIx1e+
+3kTntaq7A7GN6ZEgB+dUGxTI58EZfC+LzFEe7HLMV1B+b3D3sU4zoaEdcjQ8EBB
QRzpoGLJXQimQsOawuC8lsOkX+6HIVLnR0tgHErpIsd7eADp4nqa6imVWZ4KmHR5
MMCHdZ3LZREwbHVQh5ztrWDwOtomXFzzaou8ZyePdyqSM++yushtVYjR09bqy31F
ThZscMYtp89KtOmJ2BhoCWmJE0WDAg8oh1EpeV50GTbVyzUJ08fR88rRsjCHD2aJ
SVhl13fKNOmrWpR9TBx2OkHwPXZHGvmWkSCBKmxkVWyBZAsITaCle9Pc4MqRSWMi
++N31jVLBuwKmAhqFWOZW/h67+ksjrjfiTKeX4A+oPKJpKX1W4p4emon2IMqcmYz
hxEU8B+2vc2d/At1R7KKzP/1BDjEUt5jnrOV16D/TTH/8tyHsGTTIkoMsDn2Y+EH
bvccRrGv373VgpCf+OqI
=KzlE
-----END PGP SIGNATURE-----

--=-UPRrd6tRmKxHwYsD9WtS--
