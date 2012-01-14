Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rm5f4-0006LT-Rc
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 15:36:55 +0000
Received: by iakl21 with SMTP id l21so7092141iak.36
 for <linux-mtd@lists.infradead.org>; Sat, 14 Jan 2012 07:36:53 -0800 (PST)
Message-ID: <1326555513.14299.7.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubi: Use UBI_LAYOUT_VOLUME_{TYPE, ALIGN}
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Sat, 14 Jan 2012 17:38:33 +0200
In-Reply-To: <4F11A06A.3040703@nod.at>
References: <1326214623-15938-1-git-send-email-richard@nod.at>
 <1326553866.14299.0.camel@sauron.fi.intel.com> <4F11A06A.3040703@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tQ3Bw2JuPA3Veu3HuBnw"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tQ3Bw2JuPA3Veu3HuBnw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-01-14 at 16:34 +0100, Richard Weinberger wrote:
> Am 14.01.2012 16:11, schrieb Artem Bityutskiy:
> > On Tue, 2012-01-10 at 17:57 +0100, Richard Weinberger wrote:
> >> UBI_LAYOUT_VOLUME_TYPE and UBI_LAYOUT_VOLUME_ALIGN are currently
> >> defined but not used.
> >> Use them at least once. 8-)
> >>
> >> Signed-off-by: Richard Weinberger <richard@nod.at>
> >=20
> > Hi Richard,
> >=20
> > This will break backward compatibility - older and current kernels whic=
h
> > do not have this patch will error out when the find a volume without a
> > name. The right way to do this would be to change the UBI format
> > version, but you would need a really strong reason for this.
> >=20
>=20
> Sorry, this comment makes absolutely no sense.
>=20
> Did you mean my other patch?
> But still, the other patch also does *not* allow volumes without names.

Yes, sorry, ignore this one - I've pushed your patch.

(Embarrassed)

--=20
Best Regards,
Artem Bityutskiy

--=-tQ3Bw2JuPA3Veu3HuBnw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPEaF5AAoJECmIfjd9wqK0RDIQALcT+QDV7l30nvxambxixukZ
iuaJIxnyvDOWOtmaOIms8/rlu8C9t//2F5PRzz0Mwc1wOj9RHdwy9ZeJEB6iGMDH
XpWBNULwzb5DY6RvIo6Iv5IdleDEaz3ZR7JfPO2hbUuGW3+QEJusic12nDfJvC0A
0FclZyES4QZzUuRg/DqDAIZDm1GEHC0zRuSVpsqZQNMrap17bAT5EDYMPVrsLIAO
QIP5jj5e//DNzFxi6ckaL02xqMYfq/FMuoVvDKQkLNe3YQSU6WwMoEGCVYP5kj4W
RGAomlT+zKFMnK5QFr3V4G3p9PAZX0pGqfiNUphoL52RHQMKluRDbFMaQwZiWKA+
ZUDDeVwHD085YEN7WbIZw+OhOcN1LAopVc0xbbZf2HCuvIVLYE6MmK3GNITNcmdf
0NAHPCkodRECODfKOKzFC9QU1pDRz462dbAki5uKQJQ+lHz4XDgemEp1uOK7KwHV
JxYgTvzvOk0QQeIF0UaBIZNHQfV6Zpv3zrNJk/gQLoLRePBiRZeHV4/GjhJ9Sdyj
HOrfxl8ATgpLJkolJAIqNjzFEwDFfFYaWUeimYXlgExehGWe4emfB/GyQ0zCry0K
knA5VZygX7iryT843826tdjrmyXchokxJ2OokQj8uZ/GjweFhCEYgTWeETvx7ca0
hxUSpMHyUL37XmkGU4YY
=iQry
-----END PGP SIGNATURE-----

--=-tQ3Bw2JuPA3Veu3HuBnw--
