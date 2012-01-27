Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqmLH-0002yj-EG
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 13:59:52 +0000
Received: by pbdx9 with SMTP id x9so2029408pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 05:59:50 -0800 (PST)
Message-ID: <1327672893.29385.1.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] mtd/spear_smi: release memory region during remove
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
Date: Fri, 27 Jan 2012 16:01:33 +0200
In-Reply-To: <1327055719-17644-1-git-send-email-sr@denx.de>
References: <1327055719-17644-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zVrGUPiZ0pod2DnS/gZH"
Mime-Version: 1.0
Cc: Shiraz Hashim <shiraz.hashim@st.com>,
 spear--sw-devel@lists.codex.cro.st.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zVrGUPiZ0pod2DnS/gZH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-20 at 11:35 +0100, Stefan Roese wrote:
> From: Shiraz Hashim <shiraz.hashim@st.com>
>=20
> Driver must cleanup all held resources during remove. It wasn't
> releasing requested memory region.

Pushed to l2-mtd, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-zVrGUPiZ0pod2DnS/gZH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIq49AAoJECmIfjd9wqK0SkgP/0u7j9ZqXuFqClX8Pzr+exgw
lis4rrmoHhf8sTL7HC7B9gNO1uEgNmh4dwKrO22eZqqF8Xqs200/KsGn5s3UD8GB
aX0haGb3c0/we1SNeysNQFH7/+HmbjzAMSmjwSSZgRcAiAF+L9uY+pbD7Vyjdz/f
kSP+D/h5Dj12go7U9wXLPi0SRwbGGgl9LVDV2tSFsBDNTBIZVguNahTHsWFcKzzv
zMGzehvUxdxtvIq5JtAjhXcdAv1O7wdu+b4eRtgbJ8Me342yJD81llUyLjtl1i9E
Lhe+VpBiUAn+MtQSvYLSoky2UEIHcUQBQlIwDB68oYXiZ8jCR+yO46N3GifdKoOk
FroRLAKrIYqtotsSemqFTGu0ONawIuTaT8rvhrzZy+vvEMhGenlWXl0ASeSt4zgD
1/jWAyD3O8PSgkyVPXJoSCuVoV8lMi4PXny5JGIDUfltr8kpjWjcJeCjZB8udS0R
bVnOhe3ySrusPrbi8qJIhVm5d6dpjdHgO0NM+4jd9nKjy09J7eMMjBAxFfaA5DTl
lZLDrWata/RuQAsSLL8JBMKJp0pRm1ZEmhLndtIw/NqmuCQQTaQS1uuiKbqrmM2a
eebYV2CumLXu92/f+bcHeIopsehNNlaGOokcOwbgBpENSz1GCLk/x1P5U0SG6o16
ObnhmrzhzspiKyXmKlkz
=7m3o
-----END PGP SIGNATURE-----

--=-zVrGUPiZ0pod2DnS/gZH--
