Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Skbzg-0005Fn-7L
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 14:16:20 +0000
Message-ID: <1340979626.3070.220.camel@sauron.fi.intel.com>
Subject: Re: Loosed files after umount/mount
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andreas Friesen <andreas.friesen@hbm.com>
Date: Fri, 29 Jun 2012 17:20:26 +0300
In-Reply-To: <87fw9e8p81.wl%andreas.friesen@hbm.com>
References: <CAMU=cjyiX2KnntUFYYa-fwi0QAKX-Um1gE8tpNLwNiNsbj8O1Q@mail.gmail.com>
 <1340794858.29342.55.camel@sauron.fi.intel.com>
 <87fw9e8p81.wl%andreas.friesen@hbm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-k9EEMsrWOcQXkQbf8AXU"
Mime-Version: 1.0
Cc: Andreas Friesen <ndrs.frsn@googlemail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-k9EEMsrWOcQXkQbf8AXU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-29 at 11:03 +0200, Andreas Friesen wrote:
> At Wed, 27 Jun 2012 14:00:58 +0300,
> Artem Bityutskiy wrote:
> >=20
> > [1  <text/plain; UTF-8 (quoted-printable)>]
> > On Mon, 2012-06-18 at 22:29 +0200, Andreas Friesen wrote:
> > > Hello,
> > >=20
> > > I'm experiencing a strange problem with JFFS2 using Linux
> > > 3.1.5, 3.4 from kernel.org.git on PowerPC. After unmounting and
> > > remounting the filesystem,
> > > directory is empty.
> >=20
> > So is it 3.4 or 3.1.5?
>=20
> The board is a MPC5200B board  with NOR Flash (like IceCube)
> I have seen the problem in 3.1.5 and 3.4.

Can you try running UBI tests and see what happens? They are in
mtd-utils/tests/ubi AFAIR.

Also, is there any kernel which worked for you? Can you bisect?

--=20
Best Regards,
Artem Bityutskiy

--=-k9EEMsrWOcQXkQbf8AXU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7bmqAAoJECmIfjd9wqK0ojQP/jq+OOnIkKAvPrn2BHU/nsa8
Axf2VhkgIiuHwCwWBVotJ7EkESXleAZ/k3OuHqqPDg1VtqkHxdNe1BkxQDVQ0yLP
/6C+RrTf46hjyXCwpxEZKr30D1e24fw5EBgMptjjimN8zgb5zXn5aw7zLyD4iDqF
mMfY3MXs7qGc0ZMA3HOMgQtuyYPVvQmW4bPqqgt+bSoDhPvbEKV0Dp14SSaFtlPo
Lu3Vxvp4pDVzlm0BN9lGmzyqnioConamKbRwriMdNEhIEe2KAlPAP7qi6lLxw+GT
i8s4MaVjiT8O8zY41A1CSms71BcA8lq/PHfa7pQoxEqbFzCehJhrVEU0KEq/WSmY
7J2sAqS8gV6iYo/7p6PlaUIRshMz3mRMqQYA4zaHRSXhu6YvWdcZOhXh72I6AYyG
yGJgyr/xwT26vI1KGuCZclSbqQ4sc9SfW4hi9WcRPbXCOOp5/T5dru2qoY95sHeS
//2Y76CNqtUNgEINzZAzjk0WQgh+dEGgLhZywuKrZIC7FfOgbqDgCVuR9pc3cp66
l4DP5OMS0p8FXOwzGTTjOrlr1Xu2/1DCe+M60pg1qaa0KVPJ0Aq4rkoAiQ8Hp118
IKA2FICXms8Imf2Wp2hOSYxHqDRJY20fmzTN3zPaRJI1h8gMjCEbTHWA2SRoL5OF
6sfUmFB+uWFIa38RF5t1
=S5Bh
-----END PGP SIGNATURE-----

--=-k9EEMsrWOcQXkQbf8AXU--
