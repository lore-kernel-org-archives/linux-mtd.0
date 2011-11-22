Received: from ozlabs.org ([2402:b800:7003:1:1::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSy2V-0007Qj-TL
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 21:38:05 +0000
Date: Wed, 23 Nov 2011 08:37:58 +1100
From: Tony Breeds <tony@bakeyournoodle.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH] mtd: ndfc: fix typo in structure dereference
Message-ID: <20111122213757.GA25264@thor.bakeyournoodle.com>
References: <20111122043904.GA22504@thor.bakeyournoodle.com>
 <CALT56yMTWOS=-3MUrLLFY--e1NcONX-aruDYPoJapppMx3Vf4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <CALT56yMTWOS=-3MUrLLFY--e1NcONX-aruDYPoJapppMx3Vf4Q@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2011 at 12:56:43PM +0400, Dmitry Eremin-Solenikov wrote:
> On 11/22/11, Tony Breeds <tony@bakeyournoodle.com> wrote:
> > In commit 9d7948c50055e74b693ce9e99a709b2e5bbc1942 (mtd: ndfc: use
> > ofpart through generic parsing) we dereference a non pointer type
> > causing the following compiler error:
> > drivers/mtd/nand/ndfc.c: In function 'ndfc_chip_init':
> > drivers/mtd/nand/ndfc.c:191: error: invalid type argument of '->' (have
> > 'struct mtd_part_parser_data')
> >
> > Fix that.
> >
> > Signed-off-by: Tony Breeds <tony@bakeyournoodle.com>
>=20
> Acked-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Thanks.
=20
> Sometimes I wander about this serie. I tried to test most
> of the combinations, I could test at that momemt. The patches
> were split in simple chunks to simplify review and testing. They
> waited in linux-next for 2 or 3 releases. And I still see problems
> with those patches.

I actually found the problem in linux-next sometime ago, and I swear I
posted this patch but clearly I didn't.

linux-next is a great tool but even linux-next doesn't test all the
defconfigs in the kernel and therefore misses some code.

I'll talk to Stephen about adding something that will run over this
code.

Yours Tony

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJOzBY1AAoJEEsCiJRY75GKTbcP/20R1D6zaENQLV368obLwmvW
2HYofl4q76snqwwNihAfqv8aKZWZZ9BT1M4vIARdZgsP4ruIGQeHGaGyp2x5BqMp
dhnjp8k+rzSW9FT/GcUSc10B8nEAquaFsqS+Djnv9jNS9O0+mxy27tkUvDfeToVX
NZ3VhXbYzrdr8TYx9+LSNspbsJ0hcywlzijUufDjzIVpGyC4KVh2LEhJfC1EoXJG
fvyvbNmIFyCn5jxIL1TS4oEYMVwUXxtwrjgmktegSEvmKvQ5Ir+jJLjfSIN40Lg4
aYlxK1YRxD5iGRVPDAPNXxJQcoisXCKHZapUIcsdhHlpLu8miB+I4Zw0kVJJ3W/A
Q5Mn6mhK67QpejSUCn+T9moKJIA6d8IdxKl1cMPbe31NfZwakGhXBCXDoF6Wy1ts
ZhYdenOClWaW5Byiv700wloRDkVrDlH7+9k88ByHYv43TyFZMUNXnFAVngwURZKY
IIRLgz4DIW2hcC5ZdGeBBhk6iEYayQ5r+2Tvmlta7l32Qj8gTCHB5InJ7r3Fabuz
PZEJnJPTbnpaeRPsq8pgzkl+MMEeLggMFEwBXxG20hKYdpzFfPOHxeMpA33PK7Yc
eNYosse5IEz+tdLlzUiVcIXlrpqMWCpfg9omUhuCfKYr03oi9G39zycLapDR79pT
C2kAjESVC0rfyFQu6iFc
=AHeU
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
