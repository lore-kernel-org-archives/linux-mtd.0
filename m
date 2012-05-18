Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVLSn-0005qf-2Q
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:35:17 +0000
Message-ID: <1337341125.2483.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: fix memory leak on error path
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sidney Amani <seed95@gmail.com>
Date: Fri, 18 May 2012 14:38:45 +0300
In-Reply-To: <1337245412-22222-1-git-send-email-seed95@gmail.com>
References: <1337245412-22222-1-git-send-email-seed95@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Agdbn6riBGKeLgTsK4kO"
Mime-Version: 1.0
Cc: Ben Gardiner <bengardiner@nanometrics.ca>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Agdbn6riBGKeLgTsK4kO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-17 at 19:03 +1000, Sidney Amani wrote:
> UBIFS leaks memory on error path in 'mount_ubifs()'. In case of failure i=
n
> 'ubifs_lpt_init()' or 'ubifs_fixup_free_space()', it does not call
> 'ubifs_lpt_free()' whereas LPT data structures can potentially be allocat=
ed.
> The amount of memory leaked can be quite high -- see 'ubifs_lpt_init()'.
>=20
> The bug was introduced when moving the LPT initialisation earlier in the
> mount process (commit '781c5717a95a74b294beb38b8276943b0f8b5bb4').
>=20
> CC: Ben Gardiner <bengardiner@nanometrics.ca>
> Signed-off-by: Sidney Amani <seed95@gmail.com>

I've replied to you with the counter-proposal patches which I think
should fix this issue in a bit better way. Please, take a look - If you
are fine with that, I can push it.

--=20
Best Regards,
Artem Bityutskiy

--=-Agdbn6riBGKeLgTsK4kO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtjTGAAoJECmIfjd9wqK0mesQAKRuy3KIrOyaHq2Viwnqr90/
GMXvzsALc+A39sxKNytQtJqQjhv/0t/uotEP6jah5pMxO5VOMWw188jUfAsHDifd
x265IuakPimkmhQbdFKNNX0OWD7vdKWH1nvvKrEkUjGqHo9oHXmaNJxjJQYBGsOu
RlSS+KQalvjgkiBUI88tp20+mLP+QVauizUu2liDf3avlGc/X8QGyf2zOMV138uS
Lx0u1IQfU8+vVaHtqmKJNEhPMTIs6Q8Z0BfQouU210uLFOV0siyufCsaVzsjqWSX
20P9Kt3xLeN+yTpe8zl5eyeDEdiRJEdfwaOY/TDTgQNxhLF81Ru+BdQ/2xoiCog6
QypZKxlD9vkOZjjSDpgDyclmWL+DiGV9dlClXqM67ZufzxSgDLqSO5lh56W1CPw1
y4gcgm4tqCfz1NJ4/J1Quor3VA0iU8mLnjzVF8GrbgJMa37xTykU57PwPcNK5xbz
OiSj29p/IqAPSA5WFgo0MzLldLXQZ+WGi0PvGy/Nr+667YEL2Pf8J33DiGDFMbB7
r/r7+bCNADkWF2oY5G05Rv3JWUqN21se5sfnCJ6EKi17aEsj8uV6F6hMb3nKlzb0
sLRbFUhVBrZL9/U6U0MXxH7Ale4EWCLz7iMcfRe3SAjaW7fpjWB6gJaNf5pgqmGa
Yh7ZCg49cE1iHmlB+9n2
=MU3h
-----END PGP SIGNATURE-----

--=-Agdbn6riBGKeLgTsK4kO--
