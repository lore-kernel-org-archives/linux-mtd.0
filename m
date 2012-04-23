Received: from portal.weinmann.de ([62.8.140.122])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SMC6A-0001TL-Vn
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 05:46:08 +0000
From: "Voss, Nikolaus" <N.Voss@weinmann.de>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 23 Apr 2012 07:45:59 +0200
Subject: [PATCH (mtd-utils)] mtd_write: fall back to old method on ENOMEM
Message-ID: <EF2E73589CA71846A15D0B2CDF79505D0905DB465E@wm021.weinmann.com>
Content-Language: de-DE
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

MEMWRITE ioctl tries to kmalloc the whole data. With usual
eraseblock sizes of 128 KiB, on memory constrained systems
this can easily lead to ENOMEM due to memory fragmentation
even if there are plenty of free pages left e.g.:

--------------------------------------------------------------

libmtd: error!: MEMWRITE ioctl failed for eraseblock 55 (mtd6)
        error 12 (Cannot allocate memory)
ubiformat: error!: cannot write eraseblock 55
           error 12 (Cannot allocate memory)

Kernel log:
[   67.870000] Normal: 85*4kB 37*8kB 15*16kB 4*32kB 8*64kB 0*128kB 0*256kB
0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 1516kB
[   67.870000] 11214 total pagecache pages
[   67.873000] 16384 pages of RAM
[   67.873000] 493 free pages
[   67.873000] 1067 reserved pages
[   67.873000] 887 slab pages
[   67.873000] 6266 pages shared=20
[   67.873000] 0 pages swap cached

--------------------------------------------------------------

In such a case, it is better to write slower than not at all.

Signed-off-by: Nikolaus Voss <n.voss@weinmann.de>
---
 lib/libmtd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 9b247ae..9d24ef0 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1151,7 +1151,7 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_inf=
o *mtd, int fd, int eb,
 	ret =3D ioctl(fd, MEMWRITE, &ops);
 	if (ret =3D=3D 0)
 		return 0;
-	else if (errno !=3D ENOTTY && errno !=3D EOPNOTSUPP)
+	else if (errno !=3D ENOTTY && errno !=3D EOPNOTSUPP && errno !=3D ENOMEM)
 		return mtd_ioctl_error(mtd, eb, "MEMWRITE");
=20
 	/* Fall back to old methods if necessary */
--=20
1.7.5.4
