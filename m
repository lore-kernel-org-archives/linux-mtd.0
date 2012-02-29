Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2hQH-0005fl-8b
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 11:10:17 +0000
Received: by iaky10 with SMTP id y10so8363280iak.36
 for <linux-mtd@lists.infradead.org>; Wed, 29 Feb 2012 03:10:15 -0800 (PST)
Message-ID: <1330513959.3545.95.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] jffs2: make jffs2_initxattrs() static
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nikola Pajkovsky <n.pajkovsky@gmail.com>
Date: Wed, 29 Feb 2012 13:12:39 +0200
In-Reply-To: <f9b5e6546e83e808193657a574801ba60471cc9d.1329677282.git.n.pajkovsky@gmail.com>
References: <f9b5e6546e83e808193657a574801ba60471cc9d.1329677282.git.n.pajkovsky@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-TXpaw5Zl6dEuoWOhxib2"
Mime-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-TXpaw5Zl6dEuoWOhxib2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-02-19 at 19:51 +0100, Nikola Pajkovsky wrote:
> Signed-off-by: Nikola Pajkovsky <n.pajkovsky@gmail.com>
> ---
>  fs/jffs2/security.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've amended your patch to fix the following checkpatch.pl warning:

---------------------------------------------------------------------------=
-----

checkpatch.pl results for patch "[PATCH] jffs2: make jffs2_initxattrs() sta=
tic"

WARNING:LONG_LINE: line over 80 characters
#20: FILE: fs/jffs2/security.c:26:
+static int jffs2_initxattrs(struct inode *inode, const struct xattr *xattr=
_array,

total: 0 errors, 1 warnings, 8 lines checked

---------------------------------------------------------------------------=
-----

and pushed to l2-mtd.git, thanks.

--=20
Best Regards,
Artem Bityutskiy

--=-TXpaw5Zl6dEuoWOhxib2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPTggnAAoJECmIfjd9wqK04AYP/2rMTSF/SCNwzscjRP49NiRh
GWzyKiOqVv72PI+DKzIOLeD+IiZ99cwW3K8O9zmboeyCf8DYDW8DtlOm9VI6KzEy
UFyTNNc3V1HarMcseBiPDEWHIWABs36BhoZp5PF+aTomw/swkO1w6T+YbX9w7LsT
8rO/FVTiJzTt7L6ImbtynHbFxcFAvqFaiuD3QLg2z3Z6D9ChYHBQKl+E/QUlC3eN
XPJcuBjne2VsPD/HrGoqn3//ekyPJPO4ujaoA1DFYTwpmJLHoUs/vG/q8X5v21fz
A7fbVJFm8CEJoRzFihnCeYIFEuUY7zaIFlj72S/jtgwhzYhctvXmxYFnm7mG0DHt
4P7P6U20gxySnOS59GZlLujRyalLZ9l6H/fKwUDFlogXmO2Ql339HaZhmffSE3Pb
5JU9LE3yR6evPLYR5XDVP8YLeZPPVFtAEOirKCUwAmjfFswc0F7djQFLFKEoToyv
IRKwSQsaw4YqE2BB+ZpWGvugwkvLhccdtyxTJCvoxsv/E+LwDsBQj65M0AfRReRU
pIO8O7LN/7Fa7T2FMdkO7U0mNIt/KAcnPnVtYc+qYRZhqoeHY+K714PVYVdX7A7P
612THk4ynmGRCe/YJXRstPanHlJV7McYysG7tpVoUfQpbWc5akQG/WbVCPWmbfOY
fNRfRwYA4BJlIrGNWROI
=U0pc
-----END PGP SIGNATURE-----

--=-TXpaw5Zl6dEuoWOhxib2--
