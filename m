Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T482Z-0000kX-VR
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 10:20:00 +0000
Message-ID: <1345631059.2848.136.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 2/5] dtype parameter is obsolete
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 13:24:19 +0300
In-Reply-To: <1345627680-8166-3-git-send-email-richard.genoud@gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-3-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qMWNMarJu29u1BkBHSkl"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qMWNMarJu29u1BkBHSkl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 11:27 +0200, Richard Genoud wrote:
> @@ -1114,7 +1114,6 @@ int ubi_leb_change_start(libubi_t desc, int fd,
> int lnum, int bytes, int dtype)
>         memset(&req, 0, sizeof(struct ubi_leb_change_req));
>         req.lnum =3D lnum;
>         req.bytes =3D bytes;
> -       req.dtype =3D dtype;=20
I've also changed this:

+         req.dtype =3D 3

just like comment on top of 'struct ubi_leb_change_req' in ubi-user.h
recommends.

--=20
Best Regards,
Artem Bityutskiy


--=-qMWNMarJu29u1BkBHSkl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNLNTAAoJECmIfjd9wqK0EecQAJIwWXQrE0UTPOLwF6DNVt7i
gCQA2Nfa5XUUs1UaTz7oJVf1x+xmSgeCGMagfVOCWlsDfQj2LV0PJpMmtS2umDnV
/Yjn5pLzlmu1trCed19JoigSeuFhreF+a/RupXubVDgoPYJj8Dkl182NG08GZVhb
fUn19ojfGJHUvPuCqFkDNd5gtC6K8bC7SDhqubMu78pMzF4N8kbrlljT9xEvdjrt
UOEyivC9mW0PMJs0NjybppLBOHGYpEXYAXHxjOtmeIm1bMUDzjVRZd+J/56xrIkx
9m3fu7ifgpLlGwkgPJcA6LM1r71W8CMdtez+H8V65ChKhwTvPkaAVdOmH3EUqKvo
ae3VVGRtKtTI9xhzPQLahSrHsP0TWfNblhRtwazl7DZNYXjAmJZpqCwfhjjXSFH7
I6+h7/ByKxVXd/Ep9oTstxmjS5Y+vWFitijz7RtqHn0kPfvL6Nji5tOEgstfsn+g
HpmNx9AgXoFjo0abPOYACkbFFUUU8TEA8ufOfedAObykLmb/wd2DZxd4Wzfzx6Ha
iOff+2FPSoe2fotKp4AZ4AwiwrGCdDx/U31DqyHuXAK7UMaYkRQnsZgAg5WdmZYd
SAHpAvLQMicnzDQ/Sy3KN80iYkZdriXm9DyXO2P5k4Jhh1kwjXgvr3MVmVJl9bQO
VuI/95WToHAeXWmxyZ4F
=tQJA
-----END PGP SIGNATURE-----

--=-qMWNMarJu29u1BkBHSkl--
