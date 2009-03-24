Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lm7B5-0000oX-2X
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 14:00:33 +0000
From: Juergen Beisert <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 24 Mar 2009 15:00:20 +0100
References: <200903230852.02597.jbe@pengutronix.de>
	<200903241349.58312.jbe@pengutronix.de>
	<022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624082@EXGMBX01.sasken.com>
In-Reply-To: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624082@EXGMBX01.sasken.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200903241500.20730.jbe@pengutronix.de>
Subject: Re: DOC2000 flash: Do I miss something?
Cc: Ravi Vasarla <ravi.vasarla@sasken.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Dienstag, 24. M=E4rz 2009, Ravi Vasarla wrote:
> Check the MTD drivers write size, usually pagesize is same as the
> writesize. In nandwrite.c the ioctl will fired only when passed the option
> like -a (autoplace) -n (noecc) passed. I guess it should not give below
> error with -j option. Check with the latest version of mtd-util of
> nandwrite.c file

$ nandwrite -j /dev/mtd1 /root.jffs2 (from ftp://ftp.infradead.org/pub/mtd-=
utils/mtd-utils-1.2.0.tar.bz2)

fails in this block (from nandwrite.c):

[...]
	/*
	 * force oob layout for jffs2 or yaffs ?
	 * Legacy support
	 */
	if (forcejffs2 || forceyaffs) {
		struct nand_oobinfo *oobsel =3D forcejffs2 ? &jffs2_oobinfo : &yaffs_oobi=
nfo;

		if (autoplace) {
			fprintf(stderr, "Autoplacement is not possible for legacy -j/-y options\=
n");
			goto restoreoob;
		}
		if ((old_oobinfo.useecc =3D=3D MTD_NANDECC_AUTOPLACE) && !forcelegacy) {
			fprintf(stderr, "Use -f option to enforce legacy placement on autoplacem=
ent enabled mtd device\n");
			goto restoreoob;
		}
		if (meminfo.oobsize =3D=3D 8) {
			if (forceyaffs) {
				fprintf (stderr, "YAFSS cannot operate on 256 Byte page size");
				goto restoreoob;
			}
			/* Adjust number of ecc bytes */
			jffs2_oobinfo.eccbytes =3D 3;
		}

		if (ioctl (fd, MEMSETOOBSEL, oobsel) !=3D 0) {  <----- this one fails
			perror ("MEMSETOOBSEL");
			goto restoreoob;
		}
	}
[...]

Hmm, "Legacy support" sounds more like "do not use in recent implementations
any more".

BTW: Simply erasing, mounting, untar my rootfilesystem into the DOC works w=
ithout these
CLEANMARKER and ECC error messages.

Regards,
Juergen
