Message-ID: <1340768732.2317.3.camel@koala>
Subject: Re: [PATCH v11 0/4] MTD: at91: Add PMECC support for at91 nand
 flash driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Wed, 27 Jun 2012 06:45:32 +0300
In-Reply-To: <1340618866-28776-1-git-send-email-josh.wu@atmel.com>
References: <1340618866-28776-1-git-send-email-josh.wu@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9IHQqbUloH0JX/Pn8nUB"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, jack.lan@freescale.com, nick.spence@freescale.com,
 tie-fei.zang@freescale.com, nicolas.ferre@atmel.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, scottwood@freescale.com,
 Dipen.Dudhat@freescale.com, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9IHQqbUloH0JX/Pn8nUB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-25 at 18:07 +0800, Josh Wu wrote:
> Those patches is based on v3.5-rc4
>=20
> Changes since v10,
> 	add one more patch in this patch set, which add 'int' return value for w=
rite_page()/write_page_raw() functions in structure of nand_ecc_ctrl.
> 	Instead of calling BUG(), atmel_nand_pmecc_write_page() will return -EIO=
 when time out to read the pmecc status register.
> 	increase the time-out duration to 100ms, which has more toleration.
> 	add oob_required argument for pmecc read/write functions to align with v=
3.5-rc4.

Please, send patches against the l2-mtd.git tree, not against the
upstream tree.

--=20
Best Regards,
Artem Bityutskiy

--=-9IHQqbUloH0JX/Pn8nUB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6oHcAAoJECmIfjd9wqK0AYoQAJMTSCBaS06kxcgcX95wJggJ
CwpNcWi6CcQQcoHTVnmXrTRrJniONAAVIUh9sYKYdUWJcmXnrL3pU1vaLKpzwJ08
ZTmqhh2dEePH4W+aZ/BWDFfKghs/IDf1AEJf2ooSrCf5dsWLbrhA5CtfuoLS+yFB
2J7gkcvUzmv1MEantKPVZ0fT1gLaj5DwD5mwre/xshTLuYhv1PgfhiJd0I1vzVV+
76DG949FhfViwoAy5fWTWXFdf7TRH6X950kxYdRFMwBa/k64ka4EJ7Wn7iNlWAzA
ZKvE4ggqtgflGp34FH43viFsUAcPMBOWCPt/GwUwdokCCpNuAbJYy5HOpZSi6/KH
h8qt8nPR5SLKdfj4vpPMoCqsBF+2TJ+272XsyectqhkYx/Z2p0wHVT2uvyHwn4Gq
4f3SYOncJObEzNAof6wBBXaaw7jkN2nYt2v4y03CnrkzuH/H3JuGiDdlooFyH7sk
ZMsTvE4+Y9pJsQ+No0Xg4N689bRjESWCd2f1EP7/tWqj88Xbvxk+EWpeVUdw6VZw
G16HrsPJkqGUTFleIusvwQVtZBQzek7+1U7VoscMRfYuR9h2SBIlVHJNNLeVmTWE
C5B5QwEqEaFEIMzKqxne5ybYHDelpExwXob/rB1XQaZ2B0JG2URLwd5IEovJQ4Ry
P9vUY0eU+4kBtmC9J2fP
=oL5e
-----END PGP SIGNATURE-----

--=-9IHQqbUloH0JX/Pn8nUB--
