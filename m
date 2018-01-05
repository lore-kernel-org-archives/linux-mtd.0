Received: from mout.web.de ([212.227.17.12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXYee-0006xc-OU
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 20:31:57 +0000
Subject: [PATCH 3/3] mtd/nand/ams-delta: Add some spaces for better code
 readability
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <8f678424-3ce1-3a4c-1b0d-f3ac9a226f00@users.sourceforge.net>
Message-ID: <9e8454a8-41aa-9afc-e2b9-c1824028f91f@users.sourceforge.net>
Date: Fri, 5 Jan 2018 21:31:30 +0100
MIME-Version: 1.0
In-Reply-To: <8f678424-3ce1-3a4c-1b0d-f3ac9a226f00@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jan 2018 21:14:20 +0100

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/nand/ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index 4f5fc104c510..9ea61271fee6 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -94,7 +94,7 @@ static void ams_delta_write_buf(struct mtd_info *mtd, const u_char *buf,
 {
 	int i;
 
-	for (i=0; i<len; i++)
+	for (i = 0; i < len; i++)
 		ams_delta_write_byte(mtd, buf[i]);
 }
 
@@ -102,7 +102,7 @@ static void ams_delta_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
 	int i;
 
-	for (i=0; i<len; i++)
+	for (i = 0; i < len; i++)
 		buf[i] = ams_delta_read_byte(mtd);
 }
 
-- 
2.15.1
