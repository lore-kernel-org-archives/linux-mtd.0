Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MyKv-0006nr-AF
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 00:03:29 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: carolyn.j.smith@exgate.tek.com
In-Reply-To: <212D7E61C1F7D511B9270002A507DE7D24B628@us-bv-m10.bv.tek.com>
References: <212D7E61C1F7D511B9270002A507DE7D24B628@us-bv-m10.bv.tek.com>
Message-Id: <1054595005.1135.7.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 02 Jun 2003 17:03:26 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-Z9U03iJl1+2cLO8O3TnX"
cc: linux-mtd@lists.infradead.org
Subject: Re: 4 AM29LV800B's in 16-bit mode?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Z9U03iJl1+2cLO8O3TnX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-06-02 at 14:32, carolyn.j.smith@exgate.tek.com wrote:
> My board (Wind River's SBC8240) has 4 AM29LV800B chips in 16-bit mode
> (verified that BYTE# is high using a scope) with buswidth 64 bits for a
> total of 4 MB.

Smells like there's yet another issue dealing with interleaved chips
(already worked out two and I thought all of them were fixed).

> I am using the "jedec_probe" code. With the buswidth set to 8, the chips =
are
> not detected at all.=20

wich version of jedec_probe.c, v1.26 or later?

> With the buswidth set to 4, the chips are recognized as long as I modify =
the
> unlock addresses to be MTD_UADDR_DONT_CARE instead of
> MTD_UADDR_0x0AAA_0x0555 and MTD_UADDR_0x0555_0x02AA but erasing the
> resulting device fails in do_erase_oneblock.=20
>=20
> Any suggestions?

I'm likely the one to blame.  Unfortunately I can't look at this until
tomorrow - sorry.  Let me know the version of jedec_probe.c you have and
also send me any relevant kernel messages with MTD_DEBUG_LEVEL set to 3.

I don't even have time to look at the data sheet right now, but wanted
to let you know that someone's listening and interested in fixing this.

--=20
Thayne Harbaugh
Linux Networx

--=-Z9U03iJl1+2cLO8O3TnX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+29e9fsBPTKE6HMkRAnbiAJ9nM74CbHynuwHczC13fMSzA0B83wCfZQz3
ftbATzEm4tJjxF1F4024azU=
=OvfR
-----END PGP SIGNATURE-----

--=-Z9U03iJl1+2cLO8O3TnX--
