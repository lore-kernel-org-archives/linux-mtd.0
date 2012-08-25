Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5FxM-0003Oa-Oc
 for linux-mtd@lists.infradead.org; Sat, 25 Aug 2012 12:59:18 +0000
Received: by bkcji2 with SMTP id ji2so865940bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 25 Aug 2012 05:59:14 -0700 (PDT)
Message-ID: <1345899551.1815.10.camel@kyv>
Subject: Re: [PATCH V4] mtd: m25p80: Make fast read configurable via DT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Vasut <marex@denx.de>
Date: Sat, 25 Aug 2012 15:59:11 +0300
In-Reply-To: <1345729313-10831-1-git-send-email-marex@denx.de>
References: <1345729313-10831-1-git-send-email-marex@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NIFaTN8RsQYwqnzWZC6I"
Mime-Version: 1.0
Cc: robherring2@gmail.com, devicetree-discuss@lists.ozlabs.org,
 linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-NIFaTN8RsQYwqnzWZC6I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 15:41 +0200, Marek Vasut wrote:
> Add DT property "m25p,fast-read" that signalises the particular
> chip supports "fast read" opcode.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: David Woodhouse <david.woodhouse@intel.com>

Does not compile if (I think) OF is not enabled.

drivers/mtd/devices/m25p80.c: In function 'm25p_probe':
drivers/mtd/devices/m25p80.c:920:2: error: implicit declaration of function=
 'of_property_read_bool' [-Werror=3Dimplicit-function-declaration]
cc1: some warnings being treated as errors
make[4]: *** [drivers/mtd/devices/m25p80.o] Error 1

--=20
Best Regards,
Artem Bityutskiy

--=-NIFaTN8RsQYwqnzWZC6I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQOMwgAAoJECmIfjd9wqK0DpQP/RKNBx5i/Flns+aZhkZg5qK4
2iis9i6cIxu9HFlIczNIK/QgdvEGyOAHNpv9rwvY1qwQLkZ22NCHvsfBh/KqhXsg
sNyURLXDDRvm0UxMY13v6BpXCTIdMkQPE60TTd6OzeVo1CP2PoNHVllRjyVNm9ku
w9cUkyHXzP8CqRjIXwHK1B4bcmNOLeuSWWyeQsr8UH4CMLaVqULedZw+DjwgN8Ge
LloIyPC1ivfRKHKEzF8G4cCoIgVjstAibAXhFGyKoR53YVkjg0YUOdnzKm3iQ1fg
Ghtd8esv/fGCscYc+k375N7xJ3PYn0ry95bu0Ak2OrazLIrlKlZJxt6yA+U/0jCt
NivxsmIWzvo+ldT1kfqq/QPo26joarwpJasudw1s5n1FsVSaAOBqYiUaJY6eouqb
EcxhH1LJXCoty+OMwDlJH/7yeppGQU1uNxnqBlARx9/0iE/rtRcwEMq8THssESGf
svQeczUBM2HURXghN2HE55cmO578iAm0uvFbsNuovMS2Fzq+KwjTCEGN6r2dYBzk
gaLWZaMMP946iSE8RuEeLuG/F/a7WwQ5zrmtfA5d8XUTomPoQWzz+vxN09DveIq+
/VqgMyOTn3KjQO7LGxd+jeAOUVZcnm4Ggn9wWOzAiGzLbNgpa7YJtT0pwkpdNTzE
QfzSKuuNuQH4Q3AWMmX3
=HKud
-----END PGP SIGNATURE-----

--=-NIFaTN8RsQYwqnzWZC6I--
