Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv80C-0008SS-NT
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 13:56:05 +0000
Received: by pbdx9 with SMTP id x9so683768pbd.36
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2012 05:56:03 -0800 (PST)
Message-ID: <1328709486.22240.65.camel@sauron.fi.intel.com>
Subject: RE: Userspace write to UBI partitions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Wed, 08 Feb 2012 15:58:06 +0200
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD332A14AAF7D@dekaexchange07.deka.local>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
 <1328702346.22240.48.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1202081316510.22001@lnxricardw.se.axis.com>
 <0A40042D85E7C84DB443060EC44B3FD332A14AAF7D@dekaexchange07.deka.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FeaZkz33xLS8T8h5qbub"
Mime-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricardw@axis.com>,
 'Ricard Wanderlof' <ricard.wanderlof@axis.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FeaZkz33xLS8T8h5qbub
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-02-08 at 08:49 -0500, Atlant Schmidt wrote:
> All:
>=20
>   But there are times when you really want a block erased
>   and erased NOW; in that case, "unmap" isn't what you
>   want as it only schedules the PEB for erasure at some
>   future time. And if a power cut intervenes, that
>   scheduling for erasure may be lost and the ultimate
>   erasure may not take place for a long, long time.
>=20
>   So if you really intended to destroy the data, "unmap"
>   is not the correct function to call.

In this case you should first unmap and than map:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_map

--=20
Best Regards,
Artem Bityutskiy

--=-FeaZkz33xLS8T8h5qbub
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPMn9uAAoJECmIfjd9wqK0O2gQAK37TNq0qmZWg0zUKVPKH5Fr
1kuZk0YiVwyeZMviaQgqU6s1lsl6eSVzRm0uGA/B7TkoOzCusWRBQxbtsGDYP8BK
GRss3PuULVTqgNpBvVWv/KCQwVZq9MS8NliiYtKP2QTyLxclYQxRvNHmPY1JXKYx
a+xR5URkXoG9+wIIScRk3r802JgebQMJEyErHXFPw0KfgLzUWw5v7iAt3+VmHjok
+FqzOPs44BeQK0/PTfaQOzUkhS4JHGqCC+Jl6kDbWmvB23rKtn/RYYNMldoS64HH
NtZHkCVRJwGWeDv0YXiZQLGkYEloatYw9YZCy4ysIac9joDuRHUwpTZot01gkKNA
CLJ8eCaquI9qJGlA4m6IVfdg8o+YhUxdJv3WKh40udcSXsuuBt/UGJjgbyXDBWMT
7Ny+FiWXw/wggATK3q0EEVhwTAX/naA/1Oqi39O2gXaNB2yjQPWhJQLRRROltSZk
98ZPngEWv5lKpA+lpBwFz6gOqtQMnFf240WfNxj5SGaZM01WJPS5gZoGmBhvaxLP
Y2AyFoRpuXwrMtUBsaHSOFqD4dUlV/NxjkXOtTPGgPtMicS7M6E0Qu617FGMJvZN
47i5tKPMbYqA0TgcLIZbvmyLgDUriT+J0f/zNXVleJ03AdW/+KZ21niePSVCErdS
HQYbrEB49srsE/ARUFNO
=KBSV
-----END PGP SIGNATURE-----

--=-FeaZkz33xLS8T8h5qbub--
