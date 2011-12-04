Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXD7Z-0004Iq-A5
 for linux-mtd@lists.infradead.org; Sun, 04 Dec 2011 14:32:49 +0000
Received: by ghrr19 with SMTP id r19so4544322ghr.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 06:32:48 -0800 (PST)
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Sun, 04 Dec 2011 16:33:46 +0200
In-Reply-To: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bBDBL4jp7strYiJIMBod"
Message-ID: <1323009236.9400.66.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Scott Branden <sbranden@broadcom.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Manuel Lauss <manuel.lauss@googlemail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Jiandong Zheng <jdzheng@broadcom.com>,
 Andres Salomon <dilinger@queued.net>, Olof Johansson <olof@lixom.net>,
 Jamie Iles <jamie@jamieiles.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Vimal Singh <vimal.newwork@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bBDBL4jp7strYiJIMBod
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-12-03 at 12:20 -0800, Mike Dunn wrote:
> +                       bitflips =3D max_t(unsigned int, bitflips,
> +                                        (unsigned)nb_errors);=20

You do not  need the (unsigned) cast because you use max_t().

--=20
Best Regards,
Artem Bityutskiy

--=-bBDBL4jp7strYiJIMBod
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO24TKAAoJECmIfjd9wqK0wWUP/3izt8/f1PkG1zsmQU12WMi5
IKS9CeNr8scqzERUAlz4s3sSWx7nV8Hbr6LhOPyoxcSCzI3eElB49+vT/WRup6lF
MB1cAOSVL0/86rI0qdsvz85D74HRTJepGt24dimhmtdD3JJINK6cE3rZyRabAOi0
bkMnVzvjkv0ihmtQqZWMe1Djv6/ypSvijYt4tq2ZkLG7+6vGVUyiqe9dbIyKsCYn
dM4zABZDdu3ApwBq1VQhb5sW2+O4pBSUPMbr1b63vmqcAWMjoHnqnjIlzAF8Bugj
eBQQ1Mv//BtYOr3SMIEPqraxktLRRW5fleMlJZoh83tpaKnpvPcEnsHkHQ8HTktK
86LSNMm3b8b+FhEcod1UQfHOpezlDkbTHZbDlbQkLrhY03Fm7BdHwCt5aaGxG3qs
3Reyf1aklFYe+ufX/K+0uMGfs8xhBMOm/kKKP3+wlgmAVd0kIhFO8xmyR66v05Pp
LzmLS/anmKaWz7cMUhO7G2gGKwE+N0bwLBnDZyTx5YXePgdD5hDRMnVPwF4q037F
RfCllqDk4KyvHJJ8vbaYHJhGDSb0Ld/QFUmExbSFVwwb8uNc2LR3+uyJ0nM7oAmi
0mFqeGGyAlgxTSmoJ0aMYaRT39vw2TBlOmikLHxd3RyyX6f73H7YiahHpL5getY6
vWF9J0xaqfqZJDVsrlAc
=1uj8
-----END PGP SIGNATURE-----

--=-bBDBL4jp7strYiJIMBod--
