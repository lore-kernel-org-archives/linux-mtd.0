Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SLwT6-0003MY-EL
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 13:04:44 +0000
Message-ID: <1335099872.4879.19.camel@golum>
Subject: Re: [PATCH] [JFFS2] check xattr data integrity during the scan.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Date: Sun, 22 Apr 2012 16:04:32 +0300
In-Reply-To: <1334175816-20688-1-git-send-email-jcd@tribudubois.net>
References: <1334175816-20688-1-git-send-email-jcd@tribudubois.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-fTP9Vs/Q944NfVmwiqC+"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-fTP9Vs/Q944NfVmwiqC+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-11 at 22:23 +0200, Jean-Christophe DUBOIS wrote:
> If the system was powered off while JFFS2 was creating or moving
> (GC) an extended attribute node, it might happen at next reboot
> that the node CRC is OK but the data (name and value) might be
> incomplete and therefore corrupted.
>=20
> During the mount scan we need to check the xattr data integrity to
> weed out bad ones and keep good ones (whith an earlier version).
>=20
> Whitout this check the xattr data integrity problem was detected
> a lot later and was not cured automatically (-EIO was returned).
>=20
> Signed-off-by: Jean-Christophe DUBOIS <jcd@tribudubois.net>
> ---

AFAIR, the whole idea of having 2 CRC checksums in JFFS2 nodes is to
speed up scanning. E.g., if we hit an inode node, we check only
"node_crc" to validate the "metadata", insert the inode to the in-memory
data structures, and read the next node. We do not check the data CRC
(data_crc), otherwise scanning would be much slower. If the data are
corrupted, we notice this later, wen reading it.

The same is done for xattrs - during scanning we do not check the data
payload.

I do not say this is ideal design, but it is how it is. So I do not
think your patch should be merged.

--=20
Best Regards,
Artem Bityutskiy

--=-fTP9Vs/Q944NfVmwiqC+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlAHgAAoJECmIfjd9wqK0Bf0QALg7rFs+WqeleHBNlr4ihouL
xuTdF+J2tUJ5nwlCWzH7jEba630zDpWbj9uWRbEhH/ThvLicViU6NRq/XxLH92Wk
RXCW0o8iq7Y1B4FUr1CwbIzxlTTZvwf7lp9rQpfmwCxMazXENKjwd6JtFmLEmA+l
T3lwDLXTAMqh3teKPXNKpJuZwkZW4pWQ98edh/FYTaza3geuOOF3wFc+qo4pwVx1
6ozYSctINQXyvnZXN12MImc0OqYhNxjCK6KdPp8qipa4YcH/t65nZFwrRvyrkMA5
XK4MyW3aCCRbebduyhlrdfXxzKN0k+0lv9tHjZJBb9wBDU2LxkmmR8iJRLXLD6t+
+o3CzaNDtq2Iw0TctRTY3fQFFaDnXiiSw7HIJ+XqodNit6DVx8XukPMmdMtE55VF
qEivSTEOe9yNAjMZJ3J162GpgV0jPsQtzFeCAwbsXXmapFBVzG2AuIelA4jIzwAJ
ZN2nBwDrGadrA+pQJ42G974M2M6Ue9JsUj1wTXIyFEx50kTT8JKFtINuiz17X0qq
YxwQKyqIkGGs73GfwE0bWBlF+TUkLf85vbkd0vDhxjWnDCa05RQ95Ri2Bw933whc
NqKF3WAAFP/5BNS4xG11QoTbkGvMFPRgaT/ad3B0YHaAqVB6gQcyVQDMbR8nH1Li
FuC5CN0c6qZ7QYr13D1n
=czW0
-----END PGP SIGNATURE-----

--=-fTP9Vs/Q944NfVmwiqC+--
