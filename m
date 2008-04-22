Received: from zigzag.lvk.cs.msu.su ([158.250.17.23])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoNrO-0006TY-4T
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 19:08:58 +0000
Received: from Debian-exim by zigzag.lvk.cs.msu.su with spam-scanned (Exim
	4.63) (envelope-from <yoush@cs.msu.su>) id 1JoNrE-0000Q5-U2
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 23:08:52 +0400
From: "Nikita V. Youshchenko" <yoush@cs.msu.su>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: support for bit-reversed CFI cmd/query
Date: Tue, 22 Apr 2008 23:08:32 +0400
References: <200802272348.13180@blacky.localdomain>
	<1208890591.9212.654.camel@pmac.infradead.org>
In-Reply-To: <1208890591.9212.654.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1644156.FvyZUbpBte";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200804222308.39071@blacky.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart1644156.FvyZUbpBte
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> On Wed, 2008-02-27 at 23:48 +0300, Nikita V. Youshchenko wrote:
> >     mtd: support for bit-reversed CFI cmd/query
> >
> >     Some embedded boards have flash chips connected with reversed bit
> > order. Example for 16-bit width:
> >      chip D0 is bus D15
> >      chip D1 is bus D14
> >      ...
> >      chip D15 is bus D0
> >     It works perfectly for data access, however probing and issuing
> > CFI commands for such chips require bit reversing. This patch adds
> > support for this.
> >
> >     Signed-off-by: Nikita Youshchenko <yoush@cs.msu.su>
>
> Am I missing something, or did you only reverse the bits on 16-bit and
> 64-bit access, and not 8-bit or 32-bit?

Hmm... Looks so :(.
The board I work with has 16-bit flash, so I could not test others.

Btw, the vendor of the board confirmed that such a strange flash chip=20
connection is 'an old hardware bug', however they decided to keep it in=20
current and future revisions of the board 'for backward compatibility'.

Is it a good idea to support such strange cases in the official kernel?
If yes, I may send an updated patch.

Nikita

--nextPart1644156.FvyZUbpBte
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBIDje3v3x5OskTLdsRApKRAJ44RmkL9Ge43tr2q3PJmckhAID7WACgzWBU
upOAcGywtaiECmuH7EIbymo=
=TW0/
-----END PGP SIGNATURE-----

--nextPart1644156.FvyZUbpBte--
