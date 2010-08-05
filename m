Received: from moutng.kundenserver.de ([212.227.17.8])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ogxsq-0001XG-VD
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 10:41:09 +0000
From: =?UTF-8?q?Andreas=20Bie=C3=9Fmann?= <biessmann@corscience.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] atmel_nand: Fix warning: 'part_probes' defined but not used
Date: Thu,  5 Aug 2010 12:38:41 +0200
Message-Id: <1281004721-397-1-git-send-email-biessmann@corscience.de>
In-Reply-To: <1279099026-24298-1-git-send-email-biessmann@corscience.de>
References: <1279099026-24298-1-git-send-email-biessmann@corscience.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Brownell <dbrownell@users.sourceforge.net>, trivial@kernel.org,
	Sandeep Paulraj <s-paulraj@ti.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
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
 Resent this patch as a trivial one cause it does only fix a warning whic=
h is
 seen in very rare cases. There is no functionality change here! I think =
this
 is the definition of a trivial patch.

 In addition no one has commented my last submission of this patch.

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
