Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrTye-0005R6-LS
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 13:07:43 +0000
Received: by lbbgg6 with SMTP id gg6so2173658lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 06:07:37 -0700 (PDT)
Message-ID: <1342616525.7530.22.camel@brekeke>
Subject: Re: [PATCH] remove invalid reference to list iterator variable
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 18 Jul 2012 16:02:05 +0300
In-Reply-To: <1341753582-3943-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1341753582-3943-1-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-W1ZXQZNbbYwATuKYkB/h"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-W1ZXQZNbbYwATuKYkB/h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-07-08 at 15:19 +0200, Julia Lawall wrote:
> If list_for_each_entry, etc complete a traversal of the list, the iterato=
r
> variable ends up pointing to an address at an offset from the list head,
> and not a meaningful structure.  Thus this value should not be used after
> the end of the iterator.

Thanks Julia - this one is very useful!

--=20
Best Regards,
Artem Bityutskiy

--=-W1ZXQZNbbYwATuKYkB/h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBrPNAAoJECmIfjd9wqK0vSQP/1sK+Khr5PKw7rAu0dY8QdGz
QwLgLJ/+9ghWSi2KB1hqjxyUpMgKF1t4mIuh8VjKyCPVQqe2btm5+L4ke2+6pNvE
wMDpZopVMk+IlrGVydKUBL/PX/MguHtPPgqSPXfC/neAjorptia1SphytNY8mLnW
k/q7GxLPwUkeym9aCTY/JNUfiR8I2Z4kL+riYfkgIL90jTbNvJXu4TLBqdiLxwiL
TorlnBbNc5d3rAC5CNmGgjZWrPvtEqhv90Nkgb/gb3DozGsYN5nFMpsLph4vgcG8
sSoUJN0zd9k0+wXmVg8NnUuBGWOorp49MO694uL1BmT2wqoeQq3KTZA2WoZzeDZU
/L0dcCz7wxBRfCdfCwjeQjvk5E/74eRlwcnbtPMz1YvhSiIU5AxqgJEFbkwmK1pI
mL4xQV2/9YLvAQnxQuMaPGJxQQupFDU9kVbn7uoF6sb2RY/X3gQSVukiJ5bgT21E
gX+FsHAOseZ8XfVKxrmC7XhPbVhTtkENJ7W6NMXakreK+ALCXzAKmhbLIl8kj9JC
j6wpr2DoCThR6Qhtsi8ebPrAAZmjt8WN8ni/PxXwjA3lSFqIs+k4ERJJdtjFZPCv
NQ714ftunLxmsHZoPUMXmDwSqFlSLOdnFsHrqNCG1dDYx+35rf3r6PDg2ywOgI+l
rQ/i8+hfnknDX0hK6QDL
=vjnG
-----END PGP SIGNATURE-----

--=-W1ZXQZNbbYwATuKYkB/h--
