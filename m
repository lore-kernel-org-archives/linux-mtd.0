Received: from moutng.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OYy66-0003NR-GZ
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2010 09:17:47 +0000
From: =?UTF-8?q?Andreas=20Bie=C3=9Fmann?= <biessmann@corscience.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] atmel_nand: Fix warning: 'part_probes' defined but not used
Date: Wed, 14 Jul 2010 11:17:06 +0200
Message-Id: <1279099026-24298-1-git-send-email-biessmann@corscience.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	=?UTF-8?q?Andreas=20Bie=C3=9Fmann?= <biessmann@corscience.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes

drivers/mtd/nand/atmel_nand.c:372: warning: 'part_probes' defined but not=
 used

which is issued when CONFIG_MTD_PARTITIONS is defined but
CONFIG_MTD_CMDLINE_PARTS not.

Signed-off-by: Andreas Bie=C3=9Fmann <biessmann@corscience.de>
---
 drivers/mtd/nand/atmel_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.=
c
index 04d3088..ccce0f0 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -364,7 +364,7 @@ static void atmel_nand_hwctl(struct mtd_info *mtd, in=
t mode)
 	}
 }
=20
-#ifdef CONFIG_MTD_PARTITIONS
+#ifdef CONFIG_MTD_CMDLINE_PARTS
 static const char *part_probes[] =3D { "cmdlinepart", NULL };
 #endif
=20
--=20
1.7.1
