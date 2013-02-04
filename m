Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2JL2-00012T-NW
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 10:31:49 +0000
Message-ID: <1359973902.13791.35.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 1/2] UBIFS: fix use of freed ubifs_orphan objects
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adam Thomas <adamthomas1111@gmail.com>
Date: Mon, 04 Feb 2013 12:31:42 +0200
In-Reply-To: <1359844351-5889-2-git-send-email-adamthomas1111@gmail.com>
References: <510BC1D9.8040308@intel.com>
 <1359844351-5889-1-git-send-email-adamthomas1111@gmail.com>
 <1359844351-5889-2-git-send-email-adamthomas1111@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-oMS5GCS9TVYUOWqmR2KH"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-oMS5GCS9TVYUOWqmR2KH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2013-02-02 at 22:32 +0000, Adam Thomas wrote:
> The last orphan in the cnext list has its cnext set to NULL. Because
> of that, ubifs_delete_orphan assumes that it is not on the cnext list
> and frees it immediately instead of adding it to the dnext list. The
> freed orphan is later modified by write_orph_node.
>=20
> This can cause various inconsistencies including directory entries
> that cannot be removed and this error:
>=20
> UBIFS error (pid 20685): layout_cnodes: LPT out of space at LEB 14:129009=
 needing 17, done_ltab 1, done_lsave 1
>=20
> This is a regression introduced by
> "7074e5eb UBIFS: remove invalid reference to list iterator variable".
>=20
> This change adds an explicit flag to ubifs_orphan indicating whether
> it is pending commit.
>=20
> Signed-off-by: Adam Thomas <adamthomas1111@gmail.com>

Pushed both to linux-ubifs.git, added 'Cc: stable@vger.kernel.org'.

--=20
Best Regards,
Artem Bityutskiy

--=-oMS5GCS9TVYUOWqmR2KH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD44OAAoJECmIfjd9wqK0LYgP/28rH0ZYj65xv3bNdrOLb8cF
Rs8ydb0ZGKfPQLXJ3tPJsBH3Wxr3xy1pprbdIcSWq06ecjVvzQXc9JMxFvTXQAIH
DWZTY7CODVoVcvJebQPoBlwxXRaGyEwE+yT8q9LPjINAZEsj2vbLM1+m1ghVr8rY
GC5d9YYFp7wn4Dhfw3HZWtLZzXAWxtp/jr8GBpLtNiUq/BKwzbDN7lVQDMDWy6Qf
YzUGb2nd7ucTHI0cHklgT5RE38HxuAw6QG1c5sXoEAzytHqpb40rCGxCZUWdoMSQ
UvPLY+p9DOzqK0j710UC7FHPJsTAhK9thoMHjg6TIvgQglgBJ6B/pbGJ1uCQmvGo
SsTdhdvcxH+LyEL1CQW2M58AzMEeXoqIbTO2J39x1ckIhn+fTsFuGTYaxdlCPsCE
VcwRPnQxj7HeBbw6IV4MIUi0Jr3vXInzpLkFHpxSxMKTLj7QCC9hJhUUgzGIDYS/
KtZqfacYhynkY78nDu1zdCXsLtovAjd/sPu/lZclsJ72svdYiLikf9rweTe7y1I3
76ssCdL6tO4ZugJNz0MZcIyofDkzqGChhjtFUgV2DGDpUe0++qnzWxgfD5cINPpB
8eNu9o/61AOnVFXRYV7ylVz3ZkHobGeCaXjX8QTsT7wEgxDjBXtLtNg41qV55kbn
8CyK0N/qvdH4ajx31/zC
=gjPS
-----END PGP SIGNATURE-----

--=-oMS5GCS9TVYUOWqmR2KH--
