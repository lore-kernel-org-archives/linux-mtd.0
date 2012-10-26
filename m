Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TRkON-0000qT-82
 for linux-mtd@lists.infradead.org; Fri, 26 Oct 2012 13:56:08 +0000
Message-ID: <1351259788.1823.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mkfs.ubifs: Improve error handling of is_contained()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Date: Fri, 26 Oct 2012 16:56:28 +0300
In-Reply-To: <1350388261.25368.92.camel@lnxprebble2.se.axis.com>
References: <1350388261.25368.92.camel@lnxprebble2.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SukdTtPH+uPLyL4qAceP"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-SukdTtPH+uPLyL4qAceP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-16 at 13:51 +0200, Marcus Prebble wrote:
> mtd: mtd-utils/mkfs.ubifs: Improve error handling of is_contained()
>=20
> The is_contained() function returns -1 if an error occurs when
> canonicalizing the output file path/root directory. This resulted in the
> confusing error message 'Error: The output file cannot be in the UBIFS
> root' when specifying a non-existent directory for the output.
> This patch changes the error handling to display a different error
> message for the case when is_contained() returns -1.
> Additionally it frees all memory allocated by is_contained().
>=20
> Signed-off-by: Marcus Prebble <marcus.prebble@axis.com>

Pushed to mtd-utils.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-SukdTtPH+uPLyL4qAceP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQipaMAAoJECmIfjd9wqK0Y3MQAJ24KeS97YnnTlgacYdScak+
rYPXiIOn41baafuN4bfkkXSnKEEQGeo3NO8u1lmeHpzJRMvytjnI7cBWlwd+y2yZ
IkWKyHQB9K76IrhXqmW+1zXoQgt0iE9/hMPQpNBR/pseC6hZqfoKbmRnAsFfIKHX
OrbTG9mDpLElpArKRiJezdJEP5UsNPkueSPzVKlHbC6yKpcuyf76PuFxyckKFMkM
KH5VShE4F0pLqysy1fZD6znTIXLCLt4I+Am6v3hdXlXibdLsLqmsUPDl5QmE0noN
FLJYc3wgVEysBLVAfquvx7Lpl7b372fwqRNkbLlnG1TnmXFUsHYVc03S1W7h2FPo
uJ6lvR91WyiFL9khCuza3SZ8LXqIDnYLZDCvENHRaBI8VanObJeftW8+KroTtMfm
qrZSRFXk0rCDp7CqwjkX1prf0EJaSc6YIQ4RcwZZTw+ZOkJlYU0pXk+qdyvX5rrr
+6ULX7nbSFWF5tU2guh5ms0MR0S1EQE+Rgl1PyHJELHvtevnktKAYf1/3gva69nU
Nd7btz1LQ0i/Qyo5H/AOqUuSCbvc/ROdYltegHfmje7TNHa6x/5lOOCqZOqJYMjX
Sq2Avan7tKmhGCs+mKkcceOP8iF39SyqJXu8+RZYHRg8jKGBsmCx3TUnnYh+P8I1
gBsAdjnizM0gE24jqmqR
=li3y
-----END PGP SIGNATURE-----

--=-SukdTtPH+uPLyL4qAceP--
