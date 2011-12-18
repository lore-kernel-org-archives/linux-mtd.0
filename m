Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RcFDI-0003Yt-Cj
 for linux-mtd@lists.infradead.org; Sun, 18 Dec 2011 11:47:32 +0000
Received: by iadk27 with SMTP id k27so6677672iad.36
 for <linux-mtd@lists.infradead.org>; Sun, 18 Dec 2011 03:47:32 -0800 (PST)
Message-ID: <1324208942.17534.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] plat_ram: call mtd_device_register only if partition
 data exists
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ilya Yanok <yanok@emcraft.com>
Date: Sun, 18 Dec 2011 13:49:02 +0200
In-Reply-To: <4EED171F.2080904@emcraft.com>
References: <1323733076-6301-1-git-send-email-yanok@emcraft.com>
 <1324135902.4240.46.camel@sauron.fi.intel.com>
 <4EED171F.2080904@emcraft.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-VstWNN/oTMe0pAp1Nynq"
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


--=-VstWNN/oTMe0pAp1Nynq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2011-12-18 at 02:26 +0400, Ilya Yanok wrote:
> Hi Artem,
>=20
> On 17.12.2011 19:31, Artem Bityutskiy wrote:
> >> mtd_device_parse_register() registers the device as a whole if no
> >> partition data is passed so there is no reason to call
> >> mtd_device_register() after that.
> >>
> >> Signed-off-by: Ilya Yanok <yanok@emcraft.com>
> >=20
> > This seems to be a bug-fix, right? What happens without this patch?
>=20
> Right.
>=20
> > We end up with 2 MTD equivalent MTD devices?
>=20
> Yes (only second one shown in /proc/mtd) and a warning for kobject:
>=20
> kobject (cf2c10e0): tried to init an initialized object, something is
> seriously wrong.

OK, then I'll ping David Woodhouse to merge this before 3.2 release.
Taken to l2-mtd-2.6.git so far, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-VstWNN/oTMe0pAp1Nynq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO7dMuAAoJECmIfjd9wqK08AgP/0uVn3fbkKXrsAZq4ZuJdjHk
8vk2J3Hkn92CmaHB8YAUxyZPCajHIklOaFfsd74m1q8+0sbMN/9JMFUNyMqzg3jf
FXeSXg4uCI0aAFbgXY5O8kPyuZNZxIJWJjm66gKziYOHVS5N1deb1tcqyXZ3A5fq
qVAjk4rz2bATXC6qL1tbnDV+SgmyUuWMrZtkY6HcpTA3hFFyAIfaraHR2UqElKpg
FFmZ+gNMs2nDXDX85Zw+HxZzyREMZ16QCNrYK6zk5m5tko2L1dy28NKmc5KlB+BA
XhAbF7wiWrl4wmy2wHdDkfRZlFIcMRa7w/yxVYJPOg+5QGnnkJLuRvE0mRscVCqq
SJJzto840XuuSCVHE2eAXlPwglcTIzWpeTYhuW/TSMT/nmmmU3Jm+yOO+/9/9ABG
v+k0MVjnK2GpS6NCCzlhAfLLRfd+YFT3NxqTImjDMP94142krTNSsFLVJRwObJyA
ub+n1C5bfNxqQD+FKwobjzOGsQotlkuU4F8R7ZB+lbA60QfeR8qXteFmCPxzV5Pi
MYJqM12BEbj866tR1wiFARfcq4Tq/qcbzZZsJbQJ4Lggno8oKGSQl3v+wfxcDt0y
3hgWAHsqUHSRwvNXqx+u/QNBtsFHmQvAZ6N1aGr0ZUO76GYaTSfZQi4q30L4ujB0
8nzHB6Ksa87gtNCkNaTH
=572K
-----END PGP SIGNATURE-----

--=-VstWNN/oTMe0pAp1Nynq--
