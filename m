Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1THD7d-0001hQ-3f
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2012 12:23:17 +0000
Message-ID: <1348748593.21300.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/9] mtd: nand: improve NAND ID detection
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 27 Sep 2012 15:23:13 +0300
In-Reply-To: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
References: <1348544455-17656-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-PFPRfmd3GYY3+LqlJSDM"
Mime-Version: 1.0
Cc: Angus Clark <angus.clark@st.com>, Mike Dunn <mikedunn@newsguy.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PFPRfmd3GYY3+LqlJSDM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-24 at 20:40 -0700, Brian Norris wrote:
> Hi all,
>=20
> I've been working on some changes to nand_base.c's nand_get_flash_type()
> routine for improving its structure and readability as well as to detect =
some
> new chips. Generally, this patch series does the following:

Pushed the series to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-PFPRfmd3GYY3+LqlJSDM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQZEUxAAoJECmIfjd9wqK0bCMQAKaYbGj7zUI49s4DYJ+ClwNo
RjCNW6y8FsqDYy4/tPnHbCm/JRpDm+Vmn9jJze5Pz/BhyHFLXLIPCoc/mdH8xSUV
yEL6nMn3UWbwh2NBBEMGyP2d5uOAAH3YpH6V8M0kLgoWMpmS17iqjHKTO4jTxLys
X5F4ZIlJV8CFtYZ3eoIPRY2M09o2o9w3cuT944m1gi0grgwBO3Pem3KFsMPgvP+c
DlBXUoxNBRjxswqiBXPdmPIMKXONCj8f9faIkBrUkglYRYTmh3builUiF6oA74Di
OggxrvCGiOpFzQBgYDVgfi8octRcqssZiP/xENx695tofdFb9IQfq7se/f3G7fdT
i6Ds+DVKs+RneJYDtTp+3z9+t+yUQ5r7gzKpeSbCWk1gEzhYwD3DSg41w2Q0+iHE
TznjbrfJLCeEfkYJ0+wXro+p4+218Bes/bDrEEJmL4wZvAQzVqU6SZztLN79W1tX
bGZIID66t394wtovzUQuyMXspL8wH66zVBkaePzUY8jRRWCKyyw6aRxms+wkPmEd
3HgCWufh0XCjz3WOlGcp6JEJi41QJPjZEjqO2u38kuWq7EURIkUslFQv+YJsAATJ
VnhNhOPN7FvcYqNQrCLks1MvTR87wwmCaSbPiLENtfJ/O6X3nF0VBx0Fe/n8v2o8
XCgSou4CYiMKhgRZj957
=n8Ii
-----END PGP SIGNATURE-----

--=-PFPRfmd3GYY3+LqlJSDM--
