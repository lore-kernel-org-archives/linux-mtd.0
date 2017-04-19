Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0oUg-0002gE-8b
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 12:14:00 +0000
Date: Wed, 19 Apr 2017 14:13:32 +0200
From: Pavel Machek <pavel@ucw.cz>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@atmel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, mark.marshall@omicronenergy.com,
 b44839@freescale.com, prabhakar@freescale.com
Subject: fsl_ifc_nand: are blank pages protected by ECC?
Message-ID: <20170419121332.GA26979@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

We have some problems with fsl_ifc_nand ... in the old kernels, but
this one does not seem to be fixed in v4.11, either.

UBIFS complains:

UBIFS error (pid 931): ubifs_scan: corrupt empty space at LEB 282:252630
UBIFS error (pid 931): ubifs_scanned_corruption: corruption at LEB 282:252630
UBIFS error (pid 931): ubifs_scanned_corruption: first 1322 bytes from LEB 282:252630
UBIFS error (pid 931): ubifs_scan: LEB 282 scanning failed

Possible explanation is here:

https://e2e.ti.com/support/dsp/davinci_digital_media_processors/f/716/t/289605

# I see on the forum that this issue has been raised before - my
# understanding is that the omap2 nand driver does not perform ECC
# detection/correction on empty pages so when UBIFS checks the empty
# space data and doesn't read all 0xFF then it fails and mounts
# read-only. I didn't find any good solution - only a workaround to
# remove the UBIFS check..

So I checked fsl_ifc_nand.c in v4.11-rc, and yes, it seems to have the
same problem:

			if (errors == 15) {
	                        /*
                                 * Uncorrectable error.
                                 * OK only if the whole page is blank.
                                 *
                                 * We disable ECCER reporting due to...
                                 * erratum IFC-A002770 -- so report it now if we
                                 * see an uncorrectable error in ECCSTAT.
                                 */
                                if (!is_blank(mtd, bufnum))
                                        ctrl->nand_stat |=
                                                IFC_NAND_EVTER_STAT_ECCER;
                                break;
                        }

is_blank() checks for all 0xff's, so single-bit 0xfe in the data will
result in_blank() == 0 and uncorrectable error being signaled.

Should the driver be modified somehow?

Thanks,
									Pavel

--
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj3VGwACgkQMOfwapXb+vKGzACgnx3tKXhpFJ76rCDJBQ+xWKk9
yocAni3o2lhs0GWEe8pISrcmKUoOUYjO
=4p9S
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
