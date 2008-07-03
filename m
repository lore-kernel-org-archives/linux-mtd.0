From: "Kamat, Nishant" <nskamat@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 3 Jul 2008 04:18:39 -0500
Subject: RE: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <DFEF307E035C8647B119E6A60DB62D4AE47C155A@dlee02.ent.ti.com>
In-Reply-To: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Kyungmin Park <kmpark@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


> Kyungmin Park on July 02, 2008 4:57 AM, wrote:
>
> Hi,
>
> It's should be sent to MTD list. and we also fix the NOR similar ways.
> It's already posted but not committed.


Posting the patch on MTD list. Please merge.

---< Cut here >---

From: Nishant Kamat <nskamat@ti.com>

This patch fixes the omap2 nand driver code that allows
reading of partition data from board info.

The parse_mtd_partitions() function no longer returns a
negative error in case cmdline is not passed.
See commit: b0d06afb607

Signed-off-by: Nishant Kamat <nskamat@ti.com>
---
 drivers/mtd/nand/omap2.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Index: linux-omap-ti.ldp/drivers/mtd/nand/omap2.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-omap-ti.ldp.orig/drivers/mtd/nand/omap2.c     2008-06-30 22:01:50=
.000000000 +0530
+++ linux-omap-ti.ldp/drivers/mtd/nand/omap2.c  2008-06-30 22:03:34.4464714=
69 +0530
@@ -699,7 +699,7 @@
        err =3D parse_mtd_partitions(&info->mtd, part_probes, &info->parts,=
 0);
        if (err > 0)
                add_mtd_partitions(&info->mtd, info->parts, err);
-       else if (err < 0 && pdata->parts)
+       else if (pdata->parts)
                add_mtd_partitions(&info->mtd, pdata->parts, pdata->nr_part=
s);
        else
 #endif
