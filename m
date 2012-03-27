Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SCRht-0005gF-R7
 for linux-mtd@lists.infradead.org; Tue, 27 Mar 2012 08:24:46 +0000
Message-ID: <1332836863.31549.9.camel@sauron.fi.intel.com>
Subject: Re: [patch] Add a encryption key parameter to the compress /
 decompress function.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Tue, 27 Mar 2012 11:27:43 +0300
In-Reply-To: <alpine.DEB.2.00.1203252302310.5527@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
 <1332511796.18717.72.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
 <1332521515.22278.2.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203252302310.5527@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-jxGyBJwZuv+P9U6RDpJw"
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


--=-jxGyBJwZuv+P9U6RDpJw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-03-25 at 23:11 +0200, Joel Reardon wrote:
> Compress and decompress now have an extra u8 *key field, and NULL is
> passed wherever it is used. Later this will be used for an encryption key
> for the data being compressed/decompressed (and NULL if no cryptographic =
operations should be done.)
>=20
> Signed-off-by: Joel Reardon <reardonj@inf.ethz.ch>
>=20
> From 650a52b5301778cf2f0c17ed993a104a4473a8fb Mon Sep 17 00:00:00 2001
> From: Joel Reardon <jreardon@fatbottomsworth.(none)>
> Date: Sun, 25 Mar 2012 23:06:03 +0200
> Subject: [PATCH] Added a key parameter to de/compress.

If I use git-am I will get the above "From" etc stuff in the commit
message, which is not what was intended. Just send the 'git
format-patch' output "as-is".

>=20
> ---
>  fs/ubifs/compress.c |    8 ++++++--
>  fs/ubifs/file.c     |    5 +++--
>  fs/ubifs/journal.c  |    7 ++++---
>  fs/ubifs/ubifs.h    |    4 ++--
>  4 files changed, 15 insertions(+), 9 deletions(-)
>=20
> diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
> index 11e4132..d1812fa 100644
> --- a/fs/ubifs/compress.c
> +++ b/fs/ubifs/compress.c
> @@ -82,6 +82,8 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_=
TYPES_CNT];
>   * @out_len: output buffer length is returned here
>   * @compr_type: type of compression to use on enter, actually used compr=
ession
>   *              type on exit
> + * @key: a pointer to a key-sized buffer to use as the encryption key. i=
f NULL
> + *      then no encryption is performed.

This is confusing. In UBIFS we already have notion of "key" with
established meaning, defined in fs/ubifs/key.h. Would you please use a
different term, e.g., "encryption key", "crypto-key", for better
readability. The same for the variable name - to avoid ambiguity, use
something like 'cryptokey' or at least 'ckey' or something else.

Also, the comment says "key-sized" buffer, which is also confusing.
Either do not say anything about the size or define it better.

--=20
Best Regards,
Artem Bityutskiy

--=-jxGyBJwZuv+P9U6RDpJw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPcXn/AAoJECmIfjd9wqK0dqEQAJfcFGuUzyIPqN9Zjn4A+/RR
8ADfXZDEPkQthGNfsc6gjyS94B9jxsTZcB5JKcayuncXUQ3TzHARIJCOgX3ri13P
hLWbdB96FPSvWU7+iqlOIfV/uJTnT0Zz+C02VFTJsaOW5s29/xrU4manTVd31BUa
7NKgiZWuyMQvsGryj87XwJRoFHwtyRXk+hh0FvS8+RaIDZAGvlBsLVARJ9A5o7mV
R3XIOMTM9bo5roLbAGEVN9hxMyvvW7QHo3tOOtHWPOU+Y1A7r9AYhpnZliT/QtGd
PngXtG2Tgi5sxjajWu24zk00v7nqOxUS4deWJLrFa4MwQ5pefXBP9udO9Rmmmn1L
9FFFpsaUWDuy5cIMEUwqsQhhkBaP6peenyDbUIOWXM6+gbL2l+MSGaavFIjLVpjk
nK2nGDmmnEwJeARyo/c7l8RfndlnLx+xbfAsvMLDSptRAwGx6XvegIliyKkLTSBY
zH1JJe3kd+ntyS+jy4AEV8YXQhGgj53F2lceCnGTCnIISH2qx6BdWl3kLotyKOzb
ygHu+8UhqphIPtro06tWNG2MWGd71t4xF/Pq6TGSK9rDr7+1/FC4E7kPWMKj+kw0
3EIe5bKh6ft+/18wBBnv29HWRmBs+lSigMiC5jmVRcSAWxzV8MOXpCf7KSIr9Nk6
8Jban0uR2KXwCVkk4DOM
=HYKJ
-----END PGP SIGNATURE-----

--=-jxGyBJwZuv+P9U6RDpJw--
