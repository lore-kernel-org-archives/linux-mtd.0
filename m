Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SQx1l-0004bJ-1k
 for linux-mtd@lists.infradead.org; Sun, 06 May 2012 08:41:13 +0000
Received: by lbbgg6 with SMTP id gg6so3607140lbb.36
 for <linux-mtd@lists.infradead.org>; Sun, 06 May 2012 01:41:10 -0700 (PDT)
Message-ID: <1336293478.2801.4.camel@brekeke>
Subject: Re: [PATCH 1/2] MIPS: Kbuild: remove -Werror
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Date: Sun, 06 May 2012 11:37:58 +0300
In-Reply-To: <alpine.LFD.2.00.1205060925070.3701@eddie.linux-mips.org>
References: <1335534510-12573-1-git-send-email-dedekind1@gmail.com>
 <4F9AD14E.9060008@gmail.com>
 <alpine.LFD.2.00.1205060754390.19691@eddie.linux-mips.org>
 <1336289676.1996.3.camel@koala>
 <alpine.LFD.2.00.1205060925070.3701@eddie.linux-mips.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zx+FSKpyo6Iigd1GpIWq"
Mime-Version: 1.0
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ralf Baechle <ralf@linux-mips.org>, David Daney <ddaney.cavm@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zx+FSKpyo6Iigd1GpIWq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-05-06 at 09:32 +0100, Maciej W. Rozycki wrote:
>  And my opinion is based on experience.  Please check the LMO archives fo=
r=20
> why Ralf added this option in the first place -- many years ago.  It's=
=20
> probably recorded in the git repository too (I'm not sure if the option=
=20
> was added before or after we moved away from CVS, but in any case old=20
> change logs have been imported when our current repo was created).

We need to figure out how to make -Werror be applied only when we do not
have W=3D[123].

--=20
Best Regards,
Artem Bityutskiy

--=-zx+FSKpyo6Iigd1GpIWq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPpjhmAAoJECmIfjd9wqK0Iu0P/ResM+xG1yFV6VxH307EfkB7
9PUcwBdciN88g2XvYKvDAGJTN4o2uVRAHVtDuob76yp1o+YbHSHtKWQnu++nFZGF
EyVFWpNXFALhJ+tP8GiwZe+t4GGXb5iFWkDMZKGTYz1TokXeHF7uOtH9LbTMss8P
hFgkfD9VmaN1BE5HHWndQH5MkQPG6nB0z/L03SzZd5VR7BZcKYYyEbb1wsq4awHD
AeO6wpqS5ILtv81lmX5AT2eXbEfMOouXitfgf7VTort2A2KVV0zxBfORqUO+jvvx
rPt/dXwYzgJRfOjLly+VUJ0A+2h9nHqGZqNnu6wyh7vfKhWRRSgv1aJkBNCNV0dL
87YGbF1i09hViFUXo9p1gHpcAVKP58T3VQcFg0RmfeBEtKMud9iehiOO7Lb8MPxk
J/Td7Ehy9z1Kb+WYd2hWUeFA+7dJVl/5B8GT0sN4K6Zj9007nj67Dt/vqXPF0/Tf
VMKzAB8sD1JCehj0YFI1vJPN/A+YN+zOmKVkUE5K5Lpa8AygzMeTHrmNCXNTivhd
7MbTAWhGf1VKtmeI7ZqHaR3imxb6H5wuxnx8LuTSFhaYm1rLWOamMxcKBgSwAAfu
X+vyZz/t+gNvqJ0bJF6Gf9PyBMYdyDOctBZcNvVjFkUQnBKu7AIpIpx9e/XVGVUD
FYT3A9ldZOgDu4KVgvHS
=gV0L
-----END PGP SIGNATURE-----

--=-zx+FSKpyo6Iigd1GpIWq--
