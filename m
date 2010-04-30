Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7oLd-0007gT-02
	for linux-mtd@lists.infradead.org; Fri, 30 Apr 2010 11:25:33 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Date: Fri, 30 Apr 2010 16:55:25 +0530
Subject: JFFS2 summary support : problem
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030D6E2ACD@dbde02.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am working on TI OMAP3 platform and was looking to reduce the JFFS2 mount=
 time (NAND).=20

I have selected CONFIG_JFFS2_SUMMARY, but not working fully, its giving ECC=
 error (at end of this email) after add a new file in JFFS2.=20

Without this option its working fine; but taking long time to mount. Please=
 let me know if I am missing anything -http://dev.omapzoom.org/pub/scm/inte=
gration/kernel-omap3.git

[*] JFFS2 summary support (EXPERIMENTAL)
i.e. CONFIG_JFFS2_SUMMARY=3Dy
=3D> I have created and flushed jffs2 image with summary nodes, as-
sumtool -n -e 0x20000 -p -i rootdir.jffs2 -o rootdir-sum.jffs2


# mount -t jffs2 /dev/mtdblock4 /mnt
JFFS2 notice: (640) jffs2_build_xattr_subsystem: complete building xattr su=
bsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orpha=
n) found.
# umount /mnt
=3D=3D> I checked this multiple time and no issue.=20

#=20
# mount -t jffs2 /dev/mtdblock4 /mnt
JFFS2 notice: (644) jffs2_build_xattr_subsystem: complete building xattr su=
bsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orpha=
n) found.
# vi /mnt/test.c (created a new file)
# umount /mnt

# mount -t jffs2 /dev/mtdblock4 /mnt
mtd->read(0x1fb04 bytes from 0x8de04fc) returned ECC error
mtd->read(0x9a74 bytes from 0x8df658c) returned ECC error
Empty flash at 0x08df6588 ends at 0x08df6800
JFFS2 notice: (656) jffs2_build_xattr_subsystem: complete building xattr su=
bsystem, 0 of xdatum (0 unchecked, 0 orphan) and 0 of xref (0 dead, 0 orpha=
n) found.
mtd->read(0x7bc bytes from 0x8df6844) returned ECC error

Is there another way to fix the problem? Am I missing any patch or missing =
any configuration?

Thanks & regards,
Ghorai
