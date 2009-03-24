Received: from mta-blr1.sasken.com ([203.200.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lm97g-0003hX-0W
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 16:05:10 +0000
From: Ravi Vasarla <ravi.vasarla@sasken.com>
To: Juergen Beisert <jbe@pengutronix.de>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Date: Tue, 24 Mar 2009 21:33:00 +0530
Subject: RE: DOC2000 flash: Do I miss something?
Message-ID: <022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624083@EXGMBX01.sasken.com>
References: <200903230852.02597.jbe@pengutronix.de>
	<200903241349.58312.jbe@pengutronix.de>
	<022F54DCE6CCCD45A5F9DF0B0B7BFEEB0635624082@EXGMBX01.sasken.com>,
	<200903241500.20730.jbe@pengutronix.de>
In-Reply-To: <200903241500.20730.jbe@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I guess, I'v overlooked the ioctl in given option. Anyway nice to hear that=
 your problem seems to resolve.

Regards,
Ravi

________________________________________
From: Juergen Beisert [jbe@pengutronix.de]
Sent: Tuesday, March 24, 2009 19:30
To: linux-mtd@lists.infradead.org
Cc: Ravi Vasarla
Subject: Re: DOC2000 flash: Do I miss something?

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
                struct nand_oobinfo *oobsel =3D forcejffs2 ? &jffs2_oobinfo=
 : &yaffs_oobinfo;

                if (autoplace) {
                        fprintf(stderr, "Autoplacement is not possible for =
legacy -j/-y options\n");
                        goto restoreoob;
                }
                if ((old_oobinfo.useecc =3D=3D MTD_NANDECC_AUTOPLACE) && !f=
orcelegacy) {
                        fprintf(stderr, "Use -f option to enforce legacy pl=
acement on autoplacement enabled mtd device\n");
                        goto restoreoob;
                }
                if (meminfo.oobsize =3D=3D 8) {
                        if (forceyaffs) {
                                fprintf (stderr, "YAFSS cannot operate on 2=
56 Byte page size");
                                goto restoreoob;
                        }
                        /* Adjust number of ecc bytes */
                        jffs2_oobinfo.eccbytes =3D 3;
                }

                if (ioctl (fd, MEMSETOOBSEL, oobsel) !=3D 0) {  <----- this=
 one fails
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
SASKEN BUSINESS DISCLAIMER
-------------------------
This message may contain confidential, proprietary or legally privileged in=
formation. In=20
case you are not the original intended Recipient of the message, you must n=
ot, directly or=20
indirectly, use, Disclose, distribute, print, or copy any part of this mess=
age and you are=20
requested to delete it and inform the sender. Any views expressed in this m=
essage are=20
those of the individual sender unless otherwise stated. Nothing contained i=
n this message=20
shall be construed as an offer or acceptance of any offer by Sasken Communi=
cation=20
Technologies Limited ("Sasken") unless sent with that express intent and wi=
th due=20
authority of Sasken. Sasken has taken enough precautions to prevent the spr=
ead of=20
viruses. However the company accepts no liability for any damage caused by =
any virus=20
transmitted by this email
