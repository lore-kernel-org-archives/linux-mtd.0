Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7R12-0004VL-Uo
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:39:49 +0000
Message-ID: <1331642471.3595.33.camel@sauron.fi.intel.com>
Subject: Re: MTD API locking and concurrency
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Tue, 13 Mar 2012 14:41:11 +0200
In-Reply-To: <87obs1rr4b.fsf@free.fr>
References: <87obs1rr4b.fsf@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6EX4gHTHv6Zd2km0FfLr"
Mime-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6EX4gHTHv6Zd2km0FfLr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 06:45 +0100, Robert Jarzmik wrote:
> Hi,
>=20
> I came across a concurrent usage of my MTD driver by UBIFS by doing
> an IOC_UBI_UPVOL. As my chip doesn't support multiple requests at a time,=
 I need
> to protect the access to chip registers.
>=20
> I wonder if mtd api function can be called in interrupt context.

No, this is not explicitely documented and you are welcome to send a
patch which adds a comment to mtd.h, but all the MTD API functions are
supposed to be called from sleeping context. IOW, the caller should keep
in mind that these functions may sleep.

--=20
Best Regards,
Artem Bityutskiy

--=-6EX4gHTHv6Zd2km0FfLr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPX0BnAAoJECmIfjd9wqK0NvkQAIKRO6ot5jVl1RJ7chMsRNB1
1QwQFdyh4WkMLebaK/n3E6n7Fgk9KxwyxDsG6FsTZdjW4wXui52+/9ld8jPb3rc+
2aJfvuZjjMffRQ6wX9QUFUVVmtxfUdUK2PDTTgYIkaJdEm7yaxT6efezW0+UvB40
jdL+RHRseyphBidMEQTrtyQrxgkr8+B75j2/DL5ViBfRwTW3AfyePRhPqNayMjKH
NzKkS6WDs8AbsGl5P7iGNbibnsnZSvCU2327ukF/oT6N5UOJUoJJoiYZid1ZaK5r
mgwi1z5bSAeWqqjY7xwJFxPfg5+tbqOZTR3qRmTPvtko2y97oErvori0YzXi0Cgx
AJSvM0qfjXkF/Kd5r0WywUH6PRZbUHu7Op4+4AuAlG2cet/IjIhxZyoWAh2CzZPc
UAtsDJw+CwxF7lkZras/VD/fFiM2rRF4A4kPNt45+tYtJAWSyWDPg0cGgoT2QPOs
CVNI8zyO5f2W0IkuCcDse3GAC5Orf7tNlUfI/dATO/i5XMa6E+V9l4VUfnJEaRUa
eIlhH6tKEkncKtb4zvDUpbdkS5QfF/8O+68aiP6+U9k1luFf+L0/Kjtnz5Fhd3bw
2QbkVotlpaQJnO2M0dk1VCDj0MPnRUbxtq2R8s7x4EwHyFCNouSJ71evfbwOCT/M
hA26wtjALD5W+JysLubk
=//fM
-----END PGP SIGNATURE-----

--=-6EX4gHTHv6Zd2km0FfLr--
