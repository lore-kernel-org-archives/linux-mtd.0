Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvp9k-0008OO-En
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 13:05:21 +0000
Message-ID: <1358428005.2731.246.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: bcm47xxpart: simplify size calculation to one
 loop
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Date: Thu, 17 Jan 2013 15:06:45 +0200
In-Reply-To: <50F7F3EB.9080801@hauke-m.de>
References: <1357484916-29965-1-git-send-email-zajec5@gmail.com>
 <1358426286.2731.245.camel@sauron.fi.intel.com>
 <50F7F3EB.9080801@hauke-m.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-vfKdcpXEHbmWmpmMl0J4"
Mime-Version: 1.0
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-vfKdcpXEHbmWmpmMl0J4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-01-17 at 13:51 +0100, Hauke Mehrtens wrote:
> This is a unrelated problem. There is a fix [0] in the mips tree on
> its way into linus tree. As a workaround activate CONFIG_GPIOLIB.
>=20
> Hauke
>=20
> [0]: https://patchwork.linux-mips.org/patch/4759/

Thanks Hauke,

I've added your patch to my quick-fixes, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-vfKdcpXEHbmWmpmMl0J4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9/dlAAoJECmIfjd9wqK03zUQAL53PEDp8lmzCA9nIarX0/5U
VR5Hn8UUo3sSyNBgprkCfs7mBxM7ZvGmqd5muGgKTbFMHl2HnB86eKW9Kx95+jrN
H/s4Xbm7ftLaJSGIwmGX3vlGGPIUqpsWn8ASOOu2uKjTxU02ViJHgNpPqB2uuWfw
jQTnhsvyF4EH7XZCvMW5ZFHNHiNZ80Wd0ZGJF479EeDjipEISgK/RsCkpgeSjI/W
oqk3WDXCAImgcVB764hbG6WlBebQE7p0KOLD4L2x4KVFldyO75HbznrI0CFUGCUP
XTdMDrTxBMy2UDlhteHXqwdwBruf+yEqqLA653cOcOVa1ItufC9Oi6W2eJm38CyT
YaSf91ddarFzJl2O/5G0cafKDnTs3RmKvqI/2fN2pDWMfMr89X10OxLPHMV+BLS+
NXdsbb0YZWk51PgBiBfCTBjcADGmb4PN0kWV5gfL200TGul9QC1UORzZ4b8mRObD
+pgvVdY7W3NeFnc0TO6SWLK4ex6Z+JDeYuM7YgGgmqZQwYTGktmd+sM8BMXUL8NJ
wFztg7o11YnCDzCfk3jmi7sz1zOh6ShYjlAJrTchTIN7YMk+ks9y2P0yxKCSLyyT
0TtllfvAUNxWzseBEyxZ90EgDMYS0lHWyW7ia018y0A8w/gIL43Qxt1Xgzz4yXGL
1dGcFHgQZCLDquD9tdt9
=rZLR
-----END PGP SIGNATURE-----

--=-vfKdcpXEHbmWmpmMl0J4--
