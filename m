Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1es7km-000203-HX
 for linux-mtd@lists.infradead.org; Sat, 03 Mar 2018 14:03:14 +0000
Received: by mail-pl0-x244.google.com with SMTP id bb3-v6so7299869plb.2
 for <linux-mtd@lists.infradead.org>; Sat, 03 Mar 2018 06:03:00 -0800 (PST)
Date: Sat, 3 Mar 2018 19:32:33 +0530
From: Arushi Singhal <arushisinghal19971997@gmail.com>
To: boris.brezillon@free-electrons.com
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Subject: [PATCH] mtd: nand: Added spaces around ('=' and '<')
Message-ID: <20180303140233.GA9634@seema-Inspiron-15-3567>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add spaces around ('=' and '<'),  to conform to the Linux
kernel coding style. Issue found using checkpatch.

Signed-off-by: Arushi Singhal <arushisinghal19971997@gmail.com>
---
 drivers/mtd/nand/ams-delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index d60ada4..9de6572 100644
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
2.7.4
