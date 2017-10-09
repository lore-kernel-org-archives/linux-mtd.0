Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1Z7V-00028i-S6
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 14:33:28 +0000
Subject: Re: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <20170626111947.17092-1-richard@nod.at>
 <13583464.gMdCSCRoQZ@blindfold>
 <897ef011-81e9-1fda-9474-6ac999ea0674@pengutronix.de>
 <3091124.OyALdOhNVz@blindfold>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <dc5ff68a-db60-2773-7648-1cc1c0e29a87@pengutronix.de>
Date: Mon, 9 Oct 2017 16:32:58 +0200
MIME-Version: 1.0
In-Reply-To: <3091124.OyALdOhNVz@blindfold>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="m6vU5eO2WOrrDSkqjM6fmwnLXMN9Xs3g4"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--m6vU5eO2WOrrDSkqjM6fmwnLXMN9Xs3g4
Content-Type: multipart/mixed; boundary="xvKUThr5jPAahv4jiRfw1GW45K8Sem7Wv";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Message-ID: <dc5ff68a-db60-2773-7648-1cc1c0e29a87@pengutronix.de>
Subject: Re: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
References: <20170626111947.17092-1-richard@nod.at>
 <13583464.gMdCSCRoQZ@blindfold>
 <897ef011-81e9-1fda-9474-6ac999ea0674@pengutronix.de>
 <3091124.OyALdOhNVz@blindfold>
In-Reply-To: <3091124.OyALdOhNVz@blindfold>

--xvKUThr5jPAahv4jiRfw1GW45K8Sem7Wv
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 10/09/2017 04:06 PM, Richard Weinberger wrote:
> Am Montag, 9. Oktober 2017, 15:59:44 CEST schrieb Marc Kleine-Budde:
>>>> What happended to this patch? It's not on mainline (and thus not on =
the
>>>> stable branches). Was there a better fix?
>>>
>>> Since the patch is non-trivial I hoped to get a review or tested-by.
>>> Therefore I didn't merge it so far.
>>
>> What do you expect from proper testing?
>=20
> Well, are you using this patch in production?

Not yet, $CUSTOMER is still using an even older kernel ... :(

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--xvKUThr5jPAahv4jiRfw1GW45K8Sem7Wv--

--m6vU5eO2WOrrDSkqjM6fmwnLXMN9Xs3g4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE4bay/IylYqM/npjQHv7KIOw4HPYFAlnbiJoACgkQHv7KIOw4
HPZpIQgAuow+dOHeWzz5xavsO2QIRAEIbD41RTFI0Rq35G7U7DnmSlzAwNO/gv4h
msW/4m32xs/6XeOKQMcvlzB73V8QXmitaThpD7fBExbr/vGd506T3fYEEwW6OUJ9
KFYUlqKOwLuqGxYmaejtxT/zgMzxTFMv1Fbsg8H2w44FWAmUOxl5UhaH2N7ZS8Cf
MdANSsz40SLRkFgm7PjqlCZ54tAaKVwEnjwwYSJ085H4+lrLvy3eIaPyjnS/jzEn
Bgl6agtcNgk/gB0nE+0FBq3+kadBXbJvd643OC2agAK9eHz3kMc7l0zzioFxlPF9
ouMtZdyfaI1kmP6yh7kPA5M4EhoNUg==
=iu+/
-----END PGP SIGNATURE-----

--m6vU5eO2WOrrDSkqjM6fmwnLXMN9Xs3g4--
