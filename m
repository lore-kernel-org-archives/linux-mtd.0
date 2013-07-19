Received: from mail.phycore.de ([217.6.246.34] helo=root.phytec.de)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V06l2-0001r8-CE
 for linux-mtd@lists.infradead.org; Fri, 19 Jul 2013 09:13:49 +0000
From: =?UTF-8?q?Teresa=20G=C3=A1mez?= <t.gamez@phytec.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: omap2: Fix oobfree offset
Date: Fri, 19 Jul 2013 11:13:22 +0200
Message-Id: <1374225202-26518-1-git-send-email-t.gamez@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc: tony@atomide.com, artem.bityutskiy@linux.intel.com, afzal@ti.com,
 linux-omap@vger.kernel.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The calculation of the oobfree[0].offset is wrong when using BCH8
and elm.

The layout->eccbytes is already steps*info->nand.ecc.bytes. The second
multiplication with steps is too much and will create a value
larger than the oob area.

Fixed the calculation.

Signed-off-by: Teresa G=C3=A1mez <t.gamez@phytec.de>
---
 drivers/mtd/nand/omap2.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 81b80af..922706b 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1790,7 +1790,7 @@ static int omap3_init_bch_tail(struct mtd_info *mtd=
)
 		layout->eccpos[i] =3D offset + i;
=20
 	if (info->is_elm_used && (info->nand.ecc.bytes =3D=3D BCH8_SIZE))
-		layout->oobfree[0].offset =3D 2 + layout->eccbytes * steps;
+		layout->oobfree[0].offset =3D 2 + layout->eccbytes;
 	else
 		layout->oobfree[0].offset =3D 2;
=20
--=20
1.7.0.4
