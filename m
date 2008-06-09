Received: from smtpeu1.atmel.com ([195.65.72.27] helo=bagnes.atmel.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5kXq-0003ZP-Om
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 16:48:35 +0000
Date: Mon, 9 Jun 2008 18:49:05 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [patch 2.6.26-rc5-git] at91_nand speedup via {read,write}s{b,w}()
Message-ID: <20080609184905.3457c528@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <20080609133124.0eb97e25@hskinnemo-gx745.norway.atmel.com>
References: <200806090313.28515.david-b@pacbell.net>
	<20080609133124.0eb97e25@hskinnemo-gx745.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: Nicolas Ferre <nicolas.ferre@rfo.atmel.com>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>, kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Haavard Skinnemoen <haavard.skinnemoen@atmel.com> wrote:
> which is a 6.8% speedup. I guess hardware ECC helps...though I can't
> seem to get it to work properly. Is there anything I need to do besides
> flash_eraseall when changing the ECC layout?

Turns out there's an AP7000 errata that hasn't made it to the data
sheet yet. The IC designers have already come up with a workaround,
which I've implemented below. This brings the time down to

real	2m0.934s
user	0m0.140s
sys	2m0.700s

which is a nice improvement.

Haavard

=46rom 57d4f806c28a068baae12558794733e838016a71 Mon Sep 17 00:00:00 2001
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Date: Mon, 9 Jun 2008 18:31:25 +0200
Subject: [PATCH] atmel_nand: Work around AT32AP7000 errata

The ALE signal isn't correctly wired up to the ECC controller on the
AP7000, so it starts calculating ECC during the address cycles.

Work around this by resetting the ECC controller between the address and
data cycles.

Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |   25 +++++++++++++++++++++++--
 1 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index d9f7a5d..b769ef3 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -33,6 +33,7 @@
 #include <asm/io.h>
=20
 #include <asm/arch/board.h>
+#include <asm/arch/cpu.h>
=20
 #ifdef CONFIG_MTD_NAND_ATMEL_ECC_HW
 #define hard_ecc	1
@@ -264,6 +265,19 @@ static int atmel_nand_read_page(struct mtd_info *mtd,
 	uint8_t *ecc_pos;
 	int stat;
=20
+	/*
+	 * Errata: ALE is incorrectly wired up to the ECC controller
+	 * on the AP7000, so it will include the address cycles in the
+	 * ECC calculation.
+	 *
+	 * Workaround: Reset the parity registers before reading the
+	 * actual data.
+	 */
+	if (cpu_is_at32ap7000()) {
+		struct atmel_nand_host *host =3D chip->priv;
+		ecc_writel(host->ecc, CR, ATMEL_ECC_RST);
+	}
+
 	/* read the page */
 	chip->read_buf(mtd, p, eccsize);
=20
@@ -377,9 +391,16 @@ static int atmel_nand_correct(struct mtd_info *mtd, u_=
char *dat,
 }
=20
 /*
- * Enable HW ECC : unsused
+ * Enable HW ECC : unused on most chips
  */
-static void atmel_nand_hwctl(struct mtd_info *mtd, int mode) { ; }
+static void atmel_nand_hwctl(struct mtd_info *mtd, int mode)
+{
+	if (cpu_is_at32ap7000()) {
+		struct nand_chip *nand_chip =3D mtd->priv;
+		struct atmel_nand_host *host =3D nand_chip->priv;
+		ecc_writel(host->ecc, CR, ATMEL_ECC_RST);
+	}
+}
=20
 #ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] =3D { "cmdlinepart", NULL };
--=20
1.5.5.3
