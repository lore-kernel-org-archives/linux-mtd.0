Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7o4f-0004QM-6e
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 13:17:05 +0000
Message-ID: <1331731119.3730.17.camel@sauron.fi.intel.com>
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matej Kupljen <matej.kupljen@gmail.com>
Date: Wed, 14 Mar 2012 15:18:39 +0200
In-Reply-To: <CAHMF36H_+ohHph_mn+iaVnH9Z_WQR0bkQT8Fv8s8cTHE5vV+fg@mail.gmail.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
 <1331628462.12037.56.camel@sauron.fi.intel.com>
 <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
 <1331727617.3730.5.camel@sauron.fi.intel.com>
 <CAHMF36H_+ohHph_mn+iaVnH9Z_WQR0bkQT8Fv8s8cTHE5vV+fg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RbSSjfnOntSTFsGTnpwQ"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RbSSjfnOntSTFsGTnpwQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-03-14 at 13:55 +0100, Matej Kupljen wrote:
> What do you mean by that?
> Still boot it from MMC, but then mount the UBIFS on some different
> point and start testing?=20

I guess I meant to somehow make sure that UBIFS exclusively owns the mtd
device and no one or nothing accesses it.

But I really do not know - the issues you report do not look like UBIFS
issues - the data on the flash is corrupted somehow - dunno how. There
are billions hypothetical reasons. It may be that your DRAM has a
problem, or DMA, or whatever. You can try to disable various parts of SW
(drivers, user-space apps) and see if it helps, and may be somehow find
what triggers the issue.

> Which tests to do?

Well, you can try the ones you used, or the fsstress test from the LTP
project, or I'd recommend to try the integck test from mtd-utils.

--=20
Best Regards,
Artem Bityutskiy

--=-RbSSjfnOntSTFsGTnpwQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYJqvAAoJECmIfjd9wqK0CDkQAM/mTqBBv+mkBgUi4wvtRgcQ
kwzkV0WR7PuEQz1GUzODDKrvu8lJwnahULzOtSB1jlDUszOV5PsC8SozWiwD4WBi
oaS+AiK+aZnZtWhgNn1KjkMJcTbrcGBpuD3UH4/ngMhp5HkWzwoIx6SB2KCDd9Nq
VxSuHyG2wng/xM5V9jZIcAqBPc2vALFj9b2muGBFSEJw+MaixTFl/ZQPfuim56a/
0VkgU+MsKKNxiopqHQ7BiMesgT1jG2sEn4bojx9XZMvTzC2Kl5jP2k4AIcS+BrUE
k52f8MMLhqUEy9KMUu0YHm0t89IYNh8VFPi/UNbf+ruylQfr7NqaXIWvDu9YBD1k
N3pxzTp9sRYozymwjJSTb9rdBT4Eg3iDju+JnS7eD1lxr3whrUwiO9LlAFKJISqT
fUJxkHN+h27/pJCI0OzQHkOOFMQ2lq4VfZfTzac2xHAaRyLZApUWg6DD8KgRFUrp
T2Som0AdbsOpysXfwz+xp4faLXN+mVe/OyO81oBtrr1HgJdwePHoxY+go7bhZllS
wObGX9Ezzc/ZIrvYax17MzUb1iXlZWBdEVeGGyvU2EW9VXTlEfM9XWYmlTNXkCPh
dGu+Tnz/r5cZa5BLG+VICiTj/CdnDq12Ir9y2ZN5Xmm2NiEIGe0myt4ID8PTsnRd
wyE7v1dRjSltroXaZm88
=APnE
-----END PGP SIGNATURE-----

--=-RbSSjfnOntSTFsGTnpwQ--
