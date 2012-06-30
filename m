Message-ID: <1341066171.2115.10.camel@koala>
Subject: Re: [PATCH v10] MTD: LPC32xx MLC NAND driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Sat, 30 Jun 2012 17:22:51 +0300
In-Reply-To: <4FEEF1D0.5060404@antcom.de>
References: <1340834129-15545-1-git-send-email-stigge@antcom.de>
 <1340973434.3070.168.camel@sauron.fi.intel.com>
 <4FEEF1D0.5060404@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xFB3RXy3K1uLTNY1P3zN"
Mime-Version: 1.0
Cc: srinivas.bakki@nxp.com, lars@metafoo.de, linux@arm.linux.org.uk,
 Alexandre Pereira da Silva <aletes.xgr@gmail.com>, linux-doc@vger.kernel.org,
 leiwen@marvell.com, devicetree-discuss@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, hechtb@googlemail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-xFB3RXy3K1uLTNY1P3zN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-06-30 at 14:32 +0200, Roland Stigge wrote:
> Hi Artem!
>=20
> Thanks for the notes!
>=20
> On 29/06/12 14:37, Artem Bityutskiy wrote:
> > Successfully built configuration
> > "arm-lpc32xx_defconfig,arm,arm-unknown-linux-gnueabi-", results:
> >=20
> > --- before_patching.log +++ after_patching.log @@ @@=20
> > +drivers/mtd/nand/lpc32xx_mlc.c: In function 'lpc32xx_nand_probe':=20
> > +drivers/mtd/nand/lpc32xx_mlc.c:679:10: warning: variable 'sr' set
> > but not used [-Wunused-but-set-variable]=20
> > +drivers/mtd/nand/lpc32xx_mlc.c:561:24: error: bad constant
> > expression [sparse]
>=20
> This is because sparse doesn't understand this local variable:
>=20
> uint8_t buf[mtd->writesize];

mtd->writesize is typically 2048KiB (or even larger, there are MLCs with
4 and 8 KiB NAND page size). You cannot allocate that much on the stack,
linux kernel stack size is very small - only 8KiB, and there are people
who use even 4KiB stacks. So this have to be fixed.

> The above construction is quite convenient for this case and I'd
> prefer this to allocating another buffer dynamically.

Yes, in userspaces it is, but unfortunately in the kernel we cannot
afford allocating that much on the stack.

--=20
Best Regards,
Artem Bityutskiy

--=-xFB3RXy3K1uLTNY1P3zN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7wu7AAoJECmIfjd9wqK08yAQANJrEzyK2uBqqRwRtRdmtJ9H
pSgfhNPQzJz3h+er6hn2vhLJrBZ3bpkjR06xu7Kwv9XiJrq4vH+DGcwlCLC8ZYcj
qcReLu7h/oj9siySTRKmoMrP+NuabqZBqXX27/1FUBFUXKVvo28ktagIxq+YBHHS
LZWEhDNppqIA/JdFbzZduVlWz/RqmdvRc6sNFVTA5QzUbTyvY+tfgf3BJFmhqMgO
j38BGTAgtT+ZPf/z/y75qSBvT1SVRfsO98dtkbPcF7KW803imktRH9Il+wGDU8SY
YdBsrdP9mxh9YBP5mvXBDJzqAnfmWMMh1Cn7F4BxRK1Qa7Zz+O5D5T0IwuHugexC
5ap6cjTthYSOyJxBF3t8uQG57MpgfEbk1bxppFNKg5X1ZaSTzTaE8SCikvVAR0Fz
WaRfvOq2pDoQhNRHVEgIsLtw7MF143EwRUlqAzqHVb/twRjjLbl54mHWedy9mxiU
2Wk+EY6mlKEGRs13+mQpb3WvEj5aqoteAkl4sG2Xa2NNG7IgbQBSO6huJxPKdpsg
+s134GqL17VhBxA8INS7kDwl5SWCZoVMoFZm/eaYH2QGj0altuMB3XaEf3TDjDij
GzVQjKQcxfQxp+DgklV0oKEkKqhdTLJdJ1szD9IJcl8xFX5YwfMZwC3oia/dmSQ6
W0WxQx7aaeAhTT9j5Spa
=Mn+m
-----END PGP SIGNATURE-----

--=-xFB3RXy3K1uLTNY1P3zN--
