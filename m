Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6M8h-0005n0-QF
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2012 13:47:32 +0000
Message-ID: <1346161948.2848.403.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI:Force ubi driver load after mtd device drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiang Lu <lu.jiang@windriver.com>
Date: Tue, 28 Aug 2012 16:52:28 +0300
In-Reply-To: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
References: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GFtYv5YoOug8bIsrFbTY"
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


--=-GFtYv5YoOug8bIsrFbTY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-08 at 10:31 +0800, Jiang Lu wrote:
> To implement rootfs on mtd device with UBIFS, kernel need create a
> UBIFS device when booting:

Pushed to linux-ubi.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-GFtYv5YoOug8bIsrFbTY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPM0cAAoJECmIfjd9wqK0nd4QANCJNPzMWR9wjQVpHieafdkJ
Tn+Ia64oE8Ve485FLarM95r7FKyjJAtQMCckvVzUATscZLqAxU8PriWt6eIQ6xh8
4a3v8adAgtZlxj811YMyM153/I70IVJnopSayBRF5KRyWFwMsfm10GRdlLI27i4o
t9mhtOMfTQGp18D7oElgGVkpIlFKzoILSmLWgPjd2Em7lStqTIzou9QTE14mToNG
GKbQwalsXYlJIhik2MSaHoAW2hAcbcMdQ9ZlWdBo8fZYHn5vy8vipTtfpaxk9cqV
IhI2TJnPiITPon462s5W9r7pprceObL2qWU6XwxuB946+PjBVawG0G91UCKIPrwl
hnj8nsVeCIcCIqF3e8A3MSpY3z3t9jvmpmfFn/U7YmdVMX/S+bKC9BC3eCzeykfS
y2iHUvs+/o4lLtdeQSJNtVba2iKTTqzViFfNmlYI58nLmBoV092Om3ADudY0X9Tv
sxngsCLK4c6EiykLHx/H6E9ic6ewKPXhK2GzzuC5jP8joc7c0+7YmA0+tUI/bwlP
pyDlZtcwooojj58HtiruBRnHFVmAGo5Cy/5LVE2EsW7reqdE6gbUuKIhBrju2DLE
LvtVXSvTAA0kA2S7xvZQPz8EVSDhU2nqFcP15Cz5g93jI6aQ6p5KgKKJ/rwSiZPc
K1IXoCf8ioXWu00BOJKo
=XeID
-----END PGP SIGNATURE-----

--=-GFtYv5YoOug8bIsrFbTY--
