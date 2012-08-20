Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3XVc-00063h-Hj
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 19:19:33 +0000
Received: by bkcji2 with SMTP id ji2so2310310bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 12:19:30 -0700 (PDT)
Message-ID: <1345490367.1789.8.camel@kyv>
Subject: Re: [PATCH v3 3/6] UBI: check max_beb_per1024 value in
 ubi_attach_mtd_dev
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 22:19:27 +0300
In-Reply-To: <1345478416-23900-4-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-4-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-oQFmM9n4LS6y3sR0V5Nb"
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


--=-oQFmM9n4LS6y3sR0V5Nb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 18:00 +0200, Richard Genoud wrote:
> @@ -855,6 +858,15 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi=
_num,
>  	struct ubi_device *ubi;
>  	int i, err, ref =3D 0;
> =20
> +	if ((max_beb_per1024 < 0) || (max_beb_per1024 > MAX_MTD_UBI_BEB_LIMIT))
> +		return -EINVAL;

Removed excessive brackets and pushed to linux-ubi, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-oQFmM9n4LS6y3sR0V5Nb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMo2/AAoJECmIfjd9wqK0NsAP/ijiRbX64JKgdldUrDtSXzBN
TBqBsGNK+H3BAa8muyFY2lkdspoI4WE86f/YH/26mUbRRMj3uEHxKcjLEgNPK0gE
ln92NuL5GHlB+2I+IXB4bk1Znsz32lvA7UbQG9U6RQN5VRDVMkMV8ZPkW+3DWzka
if3IsxRyN3HybBgLPKiWV05qPP4lgqnIguUY9GiG32GqzWXD5LzONPwnTOuP3QwN
wzb2CchOWGk7Y+DUC5t6BCNYjdFRtv37+1o0TNaOwg31/3jzknp7WsLp3ZhhlpBR
2cf9UBSvjmo/utdlwxWDUWlorg73nWoCnVdaWmaSFozWDakXoSxt3aiZMF90Fj8W
SbclOPQUzKR9Q4PMQcslTASTNFD/k1k7r6pktLwm+3snAYmF/Uzoh4yWxK4RLlWf
qfXEC1Ral378BSk7++CWkUR5WkYVGXDXN5idb+olHmVeMuACwHJIfHVYTZLCMoOO
ogoxX6h2yesulAh2dsqineEqmxywY2t59xRha7RkMLSevkNBVLr9B3n/BtfcuEjE
9U0oi9ASgrYSGLvjmtXwbkEtV3kzS9MPrHqYgZWvPl7FALJJ/7NI/OdYoVwVKHek
IVUGycZJ/k/MjyRxzEb/MFsvIOxkEGP6UFG88cHlUYq4atFzezLy3a7qg1ve/R1c
CintHucTdDJXXasDntyz
=ooo1
-----END PGP SIGNATURE-----

--=-oQFmM9n4LS6y3sR0V5Nb--
