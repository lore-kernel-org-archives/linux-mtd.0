Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Iad-0003cF-IB
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 14:11:12 +0000
Received: by bwz1 with SMTP id 1so2079596bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 07:11:09 -0700 (PDT)
Date: Thu, 31 Mar 2011 17:17:53 +0300
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] jffs2: unused variables cleanup in jffs2_lookup and
	jffs2_readdir
Message-ID: <20110331141753.GB4144@swordfish.minsk.epam.com>
References: <20110322121102.GC5086@swordfish.minsk.epam.com>
	<1301579908.2828.83.camel@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <1301579908.2828.83.camel@localhost>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On (03/31/11 16:58), Artem Bityutskiy wrote:
> On Tue, 2011-03-22 at 14:11 +0200, Sergey Senozhatsky wrote:
> > jffs2: cleanup unused jffs2_sb_info *c variable and JFFS2_SB_INFO call =
=66rom jffs2_lookup=20
> > and jffs2_readdir
> >=20
> > Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
>=20
> I amended the commit message and pushed this to l2-mtd-2.6.git, thanks.
>=20

Sorry, next time I'll be more accurate.

Thanks,
	Sergey

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iJwEAQECAAYFAk2UjREACgkQfKHnntdSXjTTjQQA5F4KGqLhvbeo2SedRfSIODKD
lmHXeQBvwYvcUvk75RG0MM+KIs8U3qfxxkvBisPnKDD1qAiwqqAclGbxxJBokHEH
Enq4BNlu6X/LnHUgoaVEXLwyWb+wxaRAwU61gDMayD7W8o5lBuCb4UDmCi7aIFgx
TigFCJwX/LDyVAHrjik=
=JZ2r
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
