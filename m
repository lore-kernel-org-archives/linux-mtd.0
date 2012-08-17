Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2LwL-00059j-7T
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 12:46:13 +0000
Message-ID: <1345207843.27859.73.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Fri, 17 Aug 2012 15:50:43 +0300
In-Reply-To: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ykXSBkCTMWOaEHHN7sa4"
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


--=-ykXSBkCTMWOaEHHN7sa4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-16 at 13:22 -0500, Brent Taylor wrote:
> I'm developing on custom hardware using an at91sam9g45 processor with
> 64 MB of RAM and 64 MB of NOR flash running Linux 3.0.13.
>=20
> I'm doing some power-cycle testing and after several hours, UBIFS
> failed to mount the root partition and printed the message
> "grab_empty_leb: could not find an empty LEB".  The system boots and
> starts a script that will power cycle the board anytime between 10 and
> 20 seconds after the script has started.  Just before a power cycle
> occurs, syslog and our main process are the only processes that could
> be writing to disk. =20
>=20
> I then checked http://git.infradead.org/users/dedekind/ubifs-v3.0.git
> to see if there was a patch and couldn't find anything describing my
> exact problem.  I generated a patch from commit
> 02f8c6aee8df3cdc935e9bdd4f2d020306035dbe to
> a0c2d5050bd191e53a761381027c8e5ab8e25336 (see attached ubifs.3.0.diff)
> and rebuilt the kernel.  If there was a patch for my issue, I was
> expecting the root partition to be recovered but it wasn't.  I'm
> currently running the same test with the patched kernel.  Below is the
> information from the patched kernel.
>=20
> If there is any more information I need to provide, please let me
> know.
>=20
Do you have a possibility to share the broken image?

--=20
Best Regards,
Artem Bityutskiy

--=-ykXSBkCTMWOaEHHN7sa4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLj4jAAoJECmIfjd9wqK05pMQAI6f2jw21AfzXc8fPiu6z2en
8XzSgcVjKICAs24fX/9q+KZWUALkK+8idfzAQ4iUkx1l0zV9DuGTe0lbQ14m4raZ
+8mEeKJi155Tkj0E3H+vNlkSaG+NgrSe+bPBE6AYw81vTBV3Au0b3CbuBXZDqHZc
WJ5unibOmZQuwxzPQJJSi+3RFWz1qLxDdF5bDCnBVjc9nuhV5b8zTvjPLeLej3z4
6/Ccn7++ZXNaBzqtG3DHxSJd6isL/K+3qdQCZI4KHggwYMtPjoxo/JK4gFdLSbVl
HQZUqfiF5DitA5DlEcLCsy0nwxhjjDN0QaBs4/NuVX50Sc40rvLFqLcwGbsVK4yb
1Q1LKBBD04LwkWqFD1EKt0Ans4exgRo/o+dxruxhiEx+hAMQPumfRWQnvsHT4EVd
Xy5+j6/w0l+5XTv+1OXQyvVzLtdfo3jpffQvT+I5/MdnRBGjwzRiAE+h+IRh6aNI
LlWWVzGSfbv6meI1dD4aIxQlQRiMRN8SUniBlfeZe4LCSONebFWkqmJPZg7nXIeY
on5SwVEPs/f77gAjPw3tOBQLj7XayqqRoLQcTd7WykHPnvSN2qf11SquRYszOwy5
mu2SsfP6yogloWXDCfiaf62VTGk4QuQvGvJOGq6D3CDyYW3mhQBkdE9W/z2j2V9F
MS5XgxyyS72jXl02KEnS
=ClzC
-----END PGP SIGNATURE-----

--=-ykXSBkCTMWOaEHHN7sa4--
