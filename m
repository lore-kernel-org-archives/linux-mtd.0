Message-ID: <1359966688.13791.16.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: set the Golois Field bit for mx6q's BCH
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Mon, 04 Feb 2013 10:31:28 +0200
In-Reply-To: <1359093848-22301-1-git-send-email-b32955@freescale.com>
References: <1359093848-22301-1-git-send-email-b32955@freescale.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hwS3X8rFeNLweyBXi2h1"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hwS3X8rFeNLweyBXi2h1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-01-25 at 14:04 +0800, Huang Shijie wrote:
> +#define BF_BCH_FLASH0LAYOUT0_GF(v, x)				\
> +	((GPMI_IS_MX6Q(x) && ((v) =3D=3D 14))			\
> +		? (((1) << MX6Q_BP_BCH_FLASH0LAYOUT0_GF_13_14)	\
> +			& MX6Q_BM_BCH_FLASH0LAYOUT0_GF_13_14)	\
> +		: 0						\
> +	)

Did you consider using static inline functions instead of macro
definitions? The added value would be at least type-checking. You would
also probably use names better than "v" and "x", you could even have
commentaries. Please, consider doing this.

Anyway, pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-hwS3X8rFeNLweyBXi2h1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD3HgAAoJECmIfjd9wqK0u48P/jY0N5hvEea75Ke3pF6OQyXA
mbxooDMFJ3jgCrf+Z94uMQp+qlhAEHfl8DFjl0fZIngRoznGgV4f7eKzf+/giv9t
tp2lYLvHB5pNesxQ/+Weg4qlAmoUHKnLPqEe03RO2fH+EBdKVauaP3ztn6C9ORj1
gVMK9pNy5I65VIg4dBzo1sK+BWIq1DR1NIguRsZC6Nz8pJIICAIPyaYEHe0gMpUD
YqYAqks1Of2kfa5BiDgaiGHq85g+xUYmzi6wdlql1xIWFcc0YRA/YHeLSo0yx8k8
NsLKqFpgSAk9fkxKNFcLLMAt9d0wO6X9yxxV2OgTgiP2QdwR1fXbmSwe0U38TkIH
FkRhpnAK4CKL124NA9r7FS20AnGJvwL71lkqIw66LslKFSYl5NMxtrL2JVoz3AQH
PD4qS9cFkBq9expcxt4I+G92vJIaoGVNpBqbnfslWNCOYgXDRazzdYWr7PHIS3nQ
ib6il4KpEnEnXcnlwFuFfMiAnw9ark6xYCFGkBwpZ7aG1iz6Q8VHJhCqKymU/Yoi
JXLhkLGM480OshldGSgsntW3nrIpX9k4lIOHVmSyxyNdiQIeOhNW3yZ6sB8eeJ+o
MqD3pbjiwdCeJ1wkH4WvnCCf9rW98ygsNLZwmXHFw/tURm7OkVqU/H8sDCQwV3oC
xExjxoXspoXkzNLmEN7o
=zvGI
-----END PGP SIGNATURE-----

--=-hwS3X8rFeNLweyBXi2h1--
