Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6y6u-0001r6-9K
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 06:20:12 +0000
Message-ID: <1346307912.2848.526.camel@sauron.fi.intel.com>
Subject: Re: ubifs crash with two cases( switched to readonly, recover fail )
From: Artem Bityutskiy <dedekind1@gmail.com>
To: yw100.lee@samsung.com
Date: Thu, 30 Aug 2012 09:25:12 +0300
In-Reply-To: <0M9H00J7TVR5KUC0@mailout3.samsung.com>
References: <0M9H00J7TVR5KUC0@mailout3.samsung.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0s6wwf/ptCN6COKpXSZk"
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


--=-0s6wwf/ptCN6COKpXSZk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-29 at 02:18 +0000, =EC=9D=B4=EC=96=91=EC=9A=B0 wrote:
> ....
> [    5.965000] UBI error: ubi_io_read: error -74 while reading 68
> bytes from PEB 385:2776, read 68 bytes

Looks like your flash cannot read non-512-bytes-aligned data chunks.
Check your NAND driver. Try to run mtd tests:
http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

--=20
Best Regards,
Artem Bityutskiy

--=-0s6wwf/ptCN6COKpXSZk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPwdIAAoJECmIfjd9wqK0/w8P/iXpgiMH3gadtxzueDU2QyWD
xURSMaOr/gPT6BwA40p4X7ji4DKrykDsWwz4DplpXmd+ksnj0uv3TxEn0Doc6wHl
XqQ+SYBLdFeEfR3PrwBCql8p8RvmN11rNiHfxRfKdR/mxBc+/MWE29i3koX5rjyW
H0TUI8mHf319/XR6zYw+1uerrIlQPWfKasjIjZOVbuMFsOfD9QOCuhOSHaSwY9qJ
+EyH6bNWHB93cQ70RFKxsGshySZ2kzAKMJmCSgCRjJzbAfOXcv0TW4pypg7Y+i+G
aA9Q4m2VGLbRNvDipyDAXkRzFOsyvlAytvZ+Jna3TjwyXEjCEv6PEjOrCUkMxPs9
8DY1XlAdlIdZF0hKfI5un931tIX2TILRs9yDRXwa+cwH3OSHY5ypRxXSGvJw6oIX
kp3o1BmNCIe9vLsikSGI/zeVgLD1MshyKwBATAsQxOVDFkglVmwQ4j22HcWxMvUl
4LcDGw1Tl8g3Mqxl8rK3vvtF/wuR3NXbCmeogcd8PkwO1obaOLYyvaflpU223yR7
n38nJ6gOE+rOT6hHzn1QwdvKIrYsp5vdQpI3Yl7sPf6ZwfOSSArn0qcesYWSs9Rr
sLDUr9gvy3z0qZM/+/eWEDh8s0fQ/2okEXvgMFeB2Hbr4c0WSZO/FGsmxEJSAA9r
gFTnZ/9CoxK1hOQZYBIU
=DiUU
-----END PGP SIGNATURE-----

--=-0s6wwf/ptCN6COKpXSZk--
