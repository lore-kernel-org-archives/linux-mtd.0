Received: from moutng.kundenserver.de ([212.227.17.10])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZbij-0004ig-F7
 for linux-mtd@lists.infradead.org; Tue, 07 May 2013 06:49:54 +0000
Message-ID: <5188A3ED.4060609@blackshift.org>
Date: Tue, 07 May 2013 08:49:17 +0200
From: Marc Kleine-Budde <mkl@blackshift.org>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 08/26] mtd: maps: ixp4xx: remove unnecessary
 platform_set_drvdata()
References: <004c01ce4aec$822652d0$8672f870$@samsung.com>
In-Reply-To: <004c01ce4aec$822652d0$8672f870$@samsung.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2XRALSEKQCQFRQBBUGDPL"
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2XRALSEKQCQFRQBBUGDPL
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

On 05/07/2013 08:31 AM, Jingoo Han wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdec=
b4d
> (device-core: Ensure drvdata =3D NULL when no driver is bound).
> Thus, it is not needed to manually clear the device driver data to NULL=
=2E
>=20
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Marc Kleine-Budde <mkl@blackshift.org>


------enig2XRALSEKQCQFRQBBUGDPL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJRiKP0AAoJEF5D1i44JRMaL+YP/34ZdTSFOln8DQBskNB7azjh
SzOUk1WK+C/USOZSzGKbvi7NoRc/NGRT/q25fJqa0aawaROP3yhcvXAASRzFxzQQ
PkcSkpI6f5XGfzOV+cURlTF55WUfSe4auP+tQRK5pOyJCgnH2orogU3F/4JKUNyC
FEJswX9HwDS4n1/ltvAJUWO/+Bvj24x5aowk1OQODHEjYUdelBZKgLky35Ga3XE4
4zyhGOCtzdnrHNOgD8hyMhRV99iC3TvM9Wnm/EDUFX41fPbGB1ZYZ0inRczx8Ihy
q+nAlIqtpNNZ/9BZUIgaAuEL3TxhZk+tayu3q+hoYsOLhLXmXYAK9jp/FCeCTCzq
jG4E4WQ8w104Zx24V2kTi60QVexQ0jdWOodSKf1HzDHUVhm94WyRsYjAX3rJmuRl
j1NuS3he7Kub/jZ1yfsbfNKOUQjZwCF8+E39MViK39pOAiwzkHNSfFpCiRVHWhoO
1hEM16LwnxNuMyyj7HDuqOlCiH4giR3tDxTaM6K78E4kgPPXP/KXwwC4f/b13ss8
4+torKLduGtfluN3gaZaTmZXheWpjhoUw/+cXnPQkz0DmX/QO6Kzhl/fyZRJg+Zk
62TR1r/hSy3iSF6CHQNnMrtAEstK4fYHaZbco7keweHJkhTpSbiBfFdzUN4Z1FF3
z9pWca5wiuBLHscyyM2A
=Yv8y
-----END PGP SIGNATURE-----

------enig2XRALSEKQCQFRQBBUGDPL--
