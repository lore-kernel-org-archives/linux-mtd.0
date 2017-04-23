Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d2EIS-0006yV-78
 for linux-mtd@lists.infradead.org; Sun, 23 Apr 2017 09:59:15 +0000
Date: Sun, 23 Apr 2017 11:58:45 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Dipen.Dudhat@freescale.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, mark.marshall@omicronenergy.com,
 b44839@freescale.com, prabhakar@freescale.com
Subject: tango_nand: is logic right in error cases? (was Re: fsl_ifc_nand:
 are blank pages protected by ECC?)
Message-ID: <20170423095845.GA8692@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <20170421154903.2782cd06@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Maybe I figured it out. Unfortunately, it is only compile tested. Does
> > it look approximately right?
>=20
> Yep that's definitely better. Just one thing missing (see below),
> otherwise it looks good.

I'm copying from tango_nand, therefore I had to check tango_nand, too.

static int check_erased_page(struct nand_chip *chip, u8 *buf)
{
=2E..
                res =3D nand_check_erased_ecc_chunk(buf, pkt_size, ecc, ecc=
_size,
                                                  meta, meta_len,
                                                  chip->ecc.strength);
                if (res < 0)
                        mtd->ecc_stats.failed++;
                else
                        mtd->ecc_stats.corrected +=3D res;

                bitflips =3D max(res, bitflips);
=2E..
        return bitflips;
}

static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
                           u8 *buf, int oob_required, int page)
{
=2E..
        res =3D decode_error_report(nfc);
        if (res < 0) {
                chip->ecc.read_oob_raw(mtd, chip, page);
                res =3D check_erased_page(chip, buf);
        }

        return res;
}


So nand_check_erased_ecc_chunk() returns < 0 (failed ECC), but then we
perform max() with bitflips (lets say 1, correctable ECC) and return
1? tango_read_page then returns 1 (correctable ECC) forgetting about
failed ECC...?

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj8etUACgkQMOfwapXb+vL3fQCgvyDB57AMY3YlLOfIfDRi40K6
Y/kAn0SNrI/KVeDUiNeccmOxJxq72yua
=2LxE
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
