Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSL4w-0007JT-A5
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 04:34:33 +0000
Received: by laap9 with SMTP id p9so962005laa.36
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2012 21:34:12 -0700 (PDT)
Message-ID: <1336624262.1936.27.camel@brekeke>
Subject: Re: ubifs_jnl_update and extended attribute inode removal
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Date: Thu, 10 May 2012 07:31:02 +0300
In-Reply-To: <4FAB33B2.80104@grid-net.com>
References: <4FAB33B2.80104@grid-net.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-M6Uu9vBPzQh7mCw+zmWa"
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


--=-M6Uu9vBPzQh7mCw+zmWa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 20:19 -0700, Subodh Nijsure wrote:
> Easy way to describe this is: I create 100 files, assign then extended=
=20
> attribute, and remember what the xattr was, it always stays the same.=20
> However now if I delete some of these files randomly some of the files=
=20
> end up having wrong xattr.

I guess this happens only when you do a power cut? I need to look
closer, but quick feed-back is that there is probably a bug in the
journal reply - when we see a deleted inode in the journal - we remove
it from TNC, and we probably forget to look-up for all its xattrs?
Really need to look closer.

Would you prepare a description how I could reproduce this?

Please, go ahead with submitting your older patches, do not cook them
forever in your tree. Then you may start working on other issues.

--=20
Best Regards,
Artem Bityutskiy

--=-M6Uu9vBPzQh7mCw+zmWa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPq0SGAAoJECmIfjd9wqK0q7oP/AwfJHJHLCEQDTecF31MfemA
/tnoFPOMVUBrblOTd3IZItIqjTpuBNtegV5U3eP9MgOqW+md6PINs62scJLI4V2S
TNBWAmM54T5WCxgyT0qvs1ow5K39smbDRPh8P1jIKBWjZcSt5ML0f4JSxCoMg3Pa
rG6dBN6UA/M846oyqQMLnjPPdgzzzKMUiOsN98Q0d3s3xCfkO7qMOOTxfDQG/GZn
v1i/EHGyumKeUW7AbzimTkQ3u/w9K1bHRwWqDQ7Xw5nx/zpy2ERIu+NKJhIcYdbk
aSlZCSUiT5wxC211eGXbgri9p//vC5HgEEeJL9WZHj504rDiKfOFZ7iLaDbGFd+5
CJ3+KoksKQKoCZ3JYiH5rErsmHRInKze0LIU9jZnBnaGA96ZJ+pBEaNujR9CYEaq
0zOoGr27Ul35kUlSLMN64GsHFwueFblT+smPSbbQ8dPrwspzE8uiCWe8+STcu5ZK
XAPVemZ3HzT+Vcj5MMt8G3zkxh1ykZOm9xq7g8g7WeFKSy3ojJhUegDQguCwPzYM
5h4YeuMS3dqbfkytiLVkSD2rv1NC04rxU8PyIUa4WXSxKR4jUX2gx3exkx/WdFdY
DlBJecBY6XassnbgHxFV9/JLIUAa1X2i11zhGPI/gMrzATLdgOG5EUUZZNgEhbf9
M0wS/edDg5I9K5jaK6vs
=r1fw
-----END PGP SIGNATURE-----

--=-M6Uu9vBPzQh7mCw+zmWa--
