Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrS5h-0003Xe-2t
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 11:06:51 +0000
Received: by lbbgg6 with SMTP id gg6so2033662lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 04:06:45 -0700 (PDT)
Message-ID: <1342609272.7530.14.camel@brekeke>
Subject: Re: [PATCH 2/5] ubi: Limit amount of reserved eraseblocks for bad
 PEB handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 18 Jul 2012 14:01:12 +0300
In-Reply-To: <1342607317.7530.9.camel@brekeke>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1341389164-24409-3-git-send-email-shmulik.ladkani@gmail.com>
 <1342607317.7530.9.camel@brekeke>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1QRPEq3gGp2nYrI/8Hy4"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
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


--=-1QRPEq3gGp2nYrI/8Hy4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-18 at 13:28 +0300, Artem Bityutskiy wrote:
> >       ubi->bad_peb_count +=3D 1;
> >       ubi->good_peb_count -=3D 1;
> >       ubi_calculate_reserved(ubi);
> We do not need to call this function from here, right?

Err, sorry, it _is_ needed!

--=20
Best Regards,
Artem Bityutskiy

--=-1QRPEq3gGp2nYrI/8Hy4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBpd4AAoJECmIfjd9wqK0UosQAKuV33VSodFvel02zwb/5T89
VgeulBO/S1jVAkYzSQKYKqVRdUMdIZHrxXgyq4BxfRoT6ZPvUgrVJqkExBg4fDSb
OtM6odLuvWa/GEGzQCkjc3siRHkT1mF8TM4YLScBdPZzvT7zpdO0bqLi6zhRnr9Q
XMs/Zsdp3X6GdbtTZCf5MlascD0Ituk7GerWs6mZP6Bj3+Noi5zfa4HJ5M8rIxNZ
LU/72W8omGgj25MVVOK6I9JPwLxhXjRJAi1cu2BfIAuoCTiBgFYy04qB8k4h0m7s
FmFqmBKBrgy9An2eQHX2MmP8w4o+vRtxtL4Oe0N0r9CHlASK51NP8DW9E7RKtip/
lL1l2AQSmqyiScapjuS7dUE1fLq0OdBCj0yHHFfzER4ReHGOJ2pxdCTTtYrP+/VY
83sLHo32cPz1WU0epjCb/PY2qnUQywSm5xRTidYQ3ZQyvl6snqln3dNq11NdOQS5
Elw3tPRLBaxJkad/czwSwWHVa49LVLlHjhxyRkOt2dGpqoRAMw0m8jEDHABHFZ0E
hmxW/gQb2ZcH1xDC+krZjYBo0py2IOCHeu6o3+5IW+IBhyj86hGKKS6pfB+2ssRk
BP1dPk/aCiwAMquc3RdGgv/KbI6wDriFN85PspZZFiNYOqHl7cOcqH9l4OL4fMxD
Os+CcOkn2EQs93TQlY3r
=x/f5
-----END PGP SIGNATURE-----

--=-1QRPEq3gGp2nYrI/8Hy4--
