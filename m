Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SCBtg-0008TA-Fl
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2012 15:31:52 +0000
Message-ID: <1332776084.22278.60.camel@sauron.fi.intel.com>
Subject: Re: [patch] Move CRC computation to separate function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Mon, 26 Mar 2012 18:34:44 +0300
In-Reply-To: <alpine.DEB.2.00.1203252234440.5527@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
 <1332511796.18717.72.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
 <1332521515.22278.2.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203252234440.5527@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Wknu3DTQczVIxEZBCwBt"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
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


--=-Wknu3DTQczVIxEZBCwBt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-03-25 at 22:38 +0200, Joel Reardon wrote:
> CRC computation now an inline header function which will be used in
> multiple places in the future.
>=20
> --
This will make git-am ignore Signed-off-by. Also, please, subject UBIFS
patches with an "UBIFS:" prefix. The good way to send a patch is to use
git format-patch and then git send-email or just insert it to the
message body as-is.

The best way to make sure you send patches correctly is to send to
yourself, then save, then try to apply with 'git am' and look at the
results.

> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>
>=20
>  fs/ubifs/io.c   |    4 +---
>  fs/ubifs/misc.h |   15 +++++++++++++++
>  2 files changed, 16 insertions(+), 3 deletions(-)

> +/**
> + * ubifs_set_crc - computes and writes the crc for a ubifs node to the c=
ommon
> + * header.
> + * @node: the data node
> + */
The comment is not good. I've amended it and pushed the patch, thanks!

> +static inline void ubifs_set_node_crc(void *node)
...

--=20
Best Regards,
Artem Bityutskiy

--=-Wknu3DTQczVIxEZBCwBt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPcIyVAAoJECmIfjd9wqK0pa0QAMlmr9NVKQH+bbDOqf2OD0dM
E6BVl/CsZVqSgmpE0ByBtwWMN6pC2AsrJoqFNUSIyzH304oIR88dgN3xgP4dGAc9
kF0J/jzDQMCKD3jtxuVMBHWGn14SAxOeNwWevyDLnqkNDi5Y5iFfPnVA99xtOOZz
y4+w4LLWbmum39o0zd1UlmX9b2eylIBUW+vS4jYFUFT83pPdxGjCELRNFXT1xbQC
h8dTi71qE8eQ36WRRF8cOjyPbu1soHT7pemafxkC8DayIwX+emj+Lluoc71ImBb7
EwWskfNVqvOr/evimiUUL/i9fCjdrpJC62ads3w9q3RTtUQfMCmUFNDKPNHDqiVO
XXkGOrs2L3XYCiN8gat5NCcSIieMKQsj4THohcqy9XyUpc/h4h+b1Bgv++dUW71Z
6mGcaGlLiIiRjJr0x5y8puzCCGh9cJu1UGzgtfexKKDG9YOTl/YbFZi2v7X0HoYD
DCZc98S/KNxJ+NcDyiiY7ztwCMQMJ2B54jDcH6anT+T3NnnGbHLu5WIrN2bFtJCr
ua+xXcVjsZecjYSDjODjLQIYBmMPgF+ObwIhsSAAlbbr84R7oN5aWs5vl2f8N9Rv
ZkRK630S7C+9iUUEqPj6n87SJX3sOG8oU8cHyeO6ybeQV6ZHfgKJbcs28/lPrBXB
nmfgGKhRihGlall4sGQ9
=GQ9x
-----END PGP SIGNATURE-----

--=-Wknu3DTQczVIxEZBCwBt--
