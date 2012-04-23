Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMCN2-0003cg-Tt
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 06:03:33 +0000
Received: by lagy4 with SMTP id y4so9949161lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 23:03:30 -0700 (PDT)
Message-ID: <1335160854.28267.30.camel@brekeke>
Subject: Re: [PATCH] jffs2: refactor csize in jffs2_do_read_inode_internal()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xi Wang <xi.wang@gmail.com>
Date: Mon, 23 Apr 2012 09:00:54 +0300
In-Reply-To: <8EF5D079-1EBB-46D7-9A0A-A6054D94C958@gmail.com>
References: <1334011379-24445-1-git-send-email-xi.wang@gmail.com>
 <1335095871.2097.3.camel@golum>
 <8EF5D079-1EBB-46D7-9A0A-A6054D94C958@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+2xSWfrbvPF3l5ZLJM9N"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+2xSWfrbvPF3l5ZLJM9N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-23 at 01:43 -0400, Xi Wang wrote:
> On Apr 22, 2012, at 7:57 AM, Artem Bityutskiy wrote:
>=20
> > Please, introduce the variable in a separate patch.
>=20
> Okay.
>=20
> > WRT the csize check - you should compare it to something more sensible
> > than INT_MAX - try to dig the code and find out what is maximum value
> > JFFS2 expects.=20
>=20
> KMALLOC_MAX_SIZE - 1 is the smallest number I can find, since the code
> calls `kmalloc(csize + 1)'.  Does that look good?

I think JFFS2 has its own limit on the maximum size of the symlink
target. Probably it is PAGE_CACHE_SIZE, but not sure.

--=20
Best Regards,
Artem Bityutskiy

--=-+2xSWfrbvPF3l5ZLJM9N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPlPAWAAoJECmIfjd9wqK06EEQAJ8rxOp/342JzrxIS0xLo+6I
VHWhWsAjFNkYoYB+GOesy9yq5KYKclWSEQshNeROAZGP0+dq9wENYMa8EhFjnkNX
DFVNWHhAfbVBqYuXjalhMs0D4WKZ/LaMllF/9HSZiS3/ErIUjRT1QTOQh27RKeuh
HmOdSajDo8JPjiw66klrMvUvtLoJQQdCQF8khfAnniGGYf+1r10Mdq6yT21e75El
zVbCXESLpY4XPJMvaNddFN5AcUkn1cCYLNXhNDOgRG14KC8YPH3UjY39DJ+K+us+
PQAHd3fqmUxMDJrpZBEGNbKMAmnFPnfxq5ldPfj5ZDJsB8XP4OtrnZwyQsTsGtNa
cShfoFxkfGu8i+oQvGMzw4g3u1u1SHONCLYqp3KCcvlmBz22s8PufQ9hfcH8jkD3
Sq0hKYb+rp7mL7CZcQ5hzQji2GJ0lAUpYuZZWAMFFFDA9ECSPZMf6ThV0qW7NiUE
wXfS8N4qWvF5/V2hkguTPMWb5caOB5YzNcTkTZV7jEyKM9rf4TwVul+Iqtd9iwLZ
/vSJ+mjtkveFtRaVdHkVOd7Ms+iBmnVM8FFaDQ0hLsrxZnJj1FxoHAs11XGC2nnp
/Pg6r+HVhrcQU4+UXiBGWqARcbkoaaQzLzv66lsynIluNMrowhn8i+XiIJsWKfOH
W669dRl/+DPMGvPriUxD
=Tanc
-----END PGP SIGNATURE-----

--=-+2xSWfrbvPF3l5ZLJM9N--
