Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfUhL-0004KR-Gd
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 15:14:08 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?q?Bean=20Huo=20=E9=9C=8D=E6=96=8C=E6=96=8C=20=28beanhuo=29?=
 <beanhuo@micron.com>,
 =?UTF-8?q?Karl=20Zhang=20=E5=BC=A0=E5=8F=8C=E9=94=A3=20=28karlzhang=29?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 4/5] mtd: nand: nandsim: implement ->get_status()
Date: Fri, 25 Sep 2015 17:09:17 +0200
Message-Id: <1443193758-22071-5-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need to implement a specific ->get_status() function to support
power-cut emulation.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nandsim.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index b16d70a..efd8763 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -347,7 +347,7 @@ struct nandsim {
 	/* NAND flash internal registers */
 	struct {
 		unsigned command; /* the command register */
-		u_char   status;  /* the status register */
+		int      status;  /* the status register */
 		uint     row;     /* the page number */
 		uint     column;  /* the offset within page */
 		uint     count;   /* internal counter */
@@ -2221,6 +2221,13 @@ static void ns_nand_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 	return;
 }
 
+static int ns_nand_get_status(struct mtd_info *mtd)
+{
+	struct nandsim *ns = ((struct nand_chip *)mtd->priv)->priv;
+
+	return ns->regs.status;
+}
+
 /*
  * Module initialization function
  */
@@ -2256,6 +2263,7 @@ static int __init ns_init_module(void)
 	chip->write_buf  = ns_nand_write_buf;
 	chip->read_buf   = ns_nand_read_buf;
 	chip->read_word  = ns_nand_read_word;
+	chip->get_status = ns_nand_get_status;
 	chip->ecc.mode   = NAND_ECC_SOFT;
 	/* The NAND_SKIP_BBTSCAN option is necessary for 'overridesize' */
 	/* and 'badblocks' parameters to work */
-- 
1.9.1
