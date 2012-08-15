Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1e68-0004pf-NU
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 13:57:25 +0000
Message-ID: <1345039326.3393.143.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] mtd_is_partition: struct mtd_info should be const
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 15 Aug 2012 17:02:06 +0300
In-Reply-To: <1341937423-16516-2-git-send-email-richard.genoud@gmail.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-2-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GOkORIRCXrHMmQ7piVjG"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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


--=-GOkORIRCXrHMmQ7piVjG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-07-10 at 18:23 +0200, Richard Genoud wrote:
> struct mtd_info is not modified by mtd_is_partition so it should be a
> const.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

I've pushed this and the next MTD patches to linux-ubi, thank you! I
hope David does not mind if it goes in via the MTD, or if he could take
them to the mtd tree, then I cold merge the mtd tree to the UBI tree.
But this is not your pain.

--=20
Best Regards,
Artem Bityutskiy

--=-GOkORIRCXrHMmQ7piVjG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQK6veAAoJECmIfjd9wqK07IwP/iA85DptxDjl5q/uBrY6offe
G76aRipyw5Yrgb3WIoi9EFk4pPoJIJf490UcFrIWDCxP3eT/QUIOyKhbEmJD3q6W
0yQEFaK74/gtTSG5skyCtGEXBpvx+nPfeS95qPJ40ji+qUmqxJgZKqANcwLJQ7Rf
2rEOgUK17c0miI5YrtAnPq42CHmKkB0eguzuF2K5gjbU3lrAn+UwDbLKLrw9GHoQ
HfKND2kodLV2YQXLU2HsIgYVFpboX30QYu5pIVQDLy7hKYcE4e4OOK06VNcbjRUy
Hlysjtm8oMECorTO8vLqS19Rzb8eHs5n0EAc8zsPH3j59H0yaRuu43dN0XMAeSwt
2pEOz5jfjGxx8eTuQD8rZwY3a96cwcMrxO/oQxLe/wKrPmv2ZkIdxCBrTOBwwHKA
6C637hW75D/jUKUITHZYqlzPaIaTwAT5D/dvPCp17ge0h6sQol2sCjM5yXVIM1IU
RXvDmfT/VxYn3fW55+Cp0YM4HlnyfADbs+J4daqBaXoeSlW0IheRTRtQpuxSQQRF
Lcb2w4ic6SLXOSuAI17oUI8UAfAJlg/xUF3NXrE8j9BHPWEmKamk9XtLQ/uCEGlB
3u65dJMq068PTs9iXY6I9zJrle3hFFVloaW8ajUUWWnK3VonDOqq8TSVjlzts2GR
+NKhyEOnVFJA0RpYToUr
=O+yV
-----END PGP SIGNATURE-----

--=-GOkORIRCXrHMmQ7piVjG--
