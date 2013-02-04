Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2HvG-0006N7-FD
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 09:01:07 +0000
Message-ID: <1359968568.13791.31.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2 3/6] mtd: bcm47xxnflash: fix message
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Mon, 04 Feb 2013 11:02:48 +0200
In-Reply-To: <CACna6ry0B9nPZDUEDgYZnqM7YsGeDkWG9r6eKihbK+=WLqUcLw@mail.gmail.com>
References: <1359368750-19763-3-git-send-email-zajec5@gmail.com>
 <1359966902.13791.19.camel@sauron.fi.intel.com>
 <CACna6ry0B9nPZDUEDgYZnqM7YsGeDkWG9r6eKihbK+=WLqUcLw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kEI95Ce27i6qHGWjAx7f"
Mime-Version: 1.0
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kEI95Ce27i6qHGWjAx7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-02-04 at 09:42 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2013/2/4 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Mon, 2013-01-28 at 11:25 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> From: Hauke Mehrtens <hauke@hauke-m.de>
> >>
> >> This is not a serial flash driver, but a nand flash driver
> >>
> >> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> >> ---
> >> V2: break line to match 80 chars
> >
> > When sending v2 for individual patches, please, remember 2 things:
> >
> > 1. Keep them part of the original thread (ensure correct In-Reply-To:).
>=20
> Whoops, I've to learn how to make that with git send-email.

 --in-reply-to=3D<identifier>

Pick the identifier from the Message-ID tag of the e-mail you are
replying to. E.g., save the e-mail as hauke.mbox file and do:

$ grep -i '^Message-ID:' hauke.mbox
Message-Id: <1359045599-1305-2-git-send-email-hauke@hauke-m.de>

which means that for this one the 'git send-email' option will be:

--in-reply-to=3D"<1359045599-1305-2-git-send-email-hauke@hauke-m.de>"

> > 2. Add your own signed-off-by.
>=20
> It was so trivial... I wasn't sure if it's worth signing-it-by... ;)

Signed-off-by is not about how big were your changes, it roughly
speaking means that you confirm that the source of this patch for you is
Hauke Mehrtens.

See Documentation/SubmittingPatches

The Signed-off-by: tag indicates that the signer was involved in the
development of the patch, or that he/she was in the patch's delivery
path.

I googled a bit and found also this:

http://kerneltrap.org/files/Jeremy/DCO.txt

which gives additional clue about what can be behind SOB.

--=20
Best Regards,
Artem Bityutskiy

--=-kEI95Ce27i6qHGWjAx7f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD3k4AAoJECmIfjd9wqK0lBsP/3gVD/DTcTwcM2S1KTqVOscC
F8My3/UT6oM1JO4W3+H3jvSm3yE2x+2I3wXywc2c7SHOyUKt+Nl60eKiiJWm0taa
5O1QIadTH4xWYV8l+Hnvi5vv2LWhlpfgClccDnV2RXE+E8O7QeyTcZGX58EGCV2e
Cox4R8a5n9psHRW9aPlZffLAzvhT5Vru6cvfNPINin490eLucwT92Vizul6T/GiT
/mTPseaMn1to0+LhelGQvZn42UCoeGo5BDGUeESgiUjMp9PbAO7hIJ2nKrZlM3z8
GeEWvjiymJrUOYWq8D83c1qObRy651eFlsmLzMLL5Rl5J5A4YeP8km2XSDS1WZev
VVsnwELLRfkpc9+alrJIRiyIjfqmQrblddpLd7f5lezerqVlQfbIzNUjMO4gpae+
dcbjpXZIGPr4BjTUzcnmoxgAWU6dIWvI8ycBa2X8e3aupWNE0cFjQi+CkDkBcko6
0LlzfzU0vcU0+L40pgje3ltzO2cuFCKlbG9b9DxQa8dGukDNMggbEWEaA17EebDY
zzpUTyW5xfpbMdD7BPRHyjeJ/Xr2PSUJu1qkOaPX2xuj0VdD/3iVEX+XWdG0Hw5o
ZiDyxA1dp7D1va5SG37+cyxBMFciEObwHUHaRz1spVkBhBdvzTVdFjNzT/ikLvNc
2WiknimCNpWeSfY3FLI5
=Q4wG
-----END PGP SIGNATURE-----

--=-kEI95Ce27i6qHGWjAx7f--
