Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7Pej-0001xW-Le
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 11:12:42 +0000
Message-ID: <1331637313.3595.10.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: sh_flctl: Add power management support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Date: Tue, 13 Mar 2012 13:15:13 +0200
In-Reply-To: <1331393478-30850-1-git-send-email-hechtb@gmail.com>
References: <1331393478-30850-1-git-send-email-hechtb@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-y40YAjKdIhLKn4LaTOVv"
Mime-Version: 1.0
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-y40YAjKdIhLKn4LaTOVv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-03-10 at 16:31 +0100, Bastian Hecht wrote:
> All transactions with the NAND chip require a chip enable signal. So we
> wrap the runtime_pm_get()/put()s around it. As registers are cached, we
> need no suspend()/resume() callbacks.
>=20
> Signed-off-by: Bastian Hecht <hechtb@gmail.com>

Pushed to l2-mtd.git, thanks.

--=20
Best Regards,
Artem Bityutskiy

--=-y40YAjKdIhLKn4LaTOVv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXyxBAAoJECmIfjd9wqK0PpoQAL0j4ijACz6BysGaJX9AxwwU
+ETZDhmWVnFRlC1HvbnBwwiLu5G+ZEsF57+AdBgEcwNFs9z/w9O8xHFUjnbabUiw
nNhvS7tmu+ixB5sfnX/Xwsl41FxzGSObKH7MSwzrZ5919vCSQKtiC8IWjoE/uPDR
zw47UVkly8mSyvv+PTb9Wf5uZ6dfyLGo3ASv4HCiQouYznI/7Hq+UkD3ibG6WUbb
n776i+xqlXYlC+9hWDFK/xbHfA7swW1Ht6ufOk1ZbJQdpHd5UbGyGFaFbabj9o3n
O3zHSbsLKKlnPZ+RhyfGSiB9Asx6XmyP32AWnWXU+7zVBT1sP0ak8wuaFznjStio
g2q8eY+7x4RLJ0B1OaBHlhc4xw8WV0q9eM+WoqrFmmPET/gyeVEK125GLhAd9pHV
fvlge3wSTNm+pCrR62krbnivaNwY3KQGNT+8MsNHV+hDym31GAvA7NFOatyX0c9h
8FayNXwTl8qbS5nQeaXSEKDUbweWPHRm4MnjSFFnHOYMEeXDtCsJpHpCh4jSF1wl
aFUcv6aEULRGAf6BTIsQ/pkUc5iWjcCjKxVmZv+oPvA5sNQAExV8bvAcMT73ALDl
NMafSpnSdCdnQnWlY9CwHiAZMYn2IPfcsfCMAElXaI1BkD5iu5ltwPXNREM9jSVD
6Qi8izQDytX+JGpELF9m
=swLi
-----END PGP SIGNATURE-----

--=-y40YAjKdIhLKn4LaTOVv--
