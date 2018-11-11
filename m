Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLvst-00014q-Rp
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 19:59:06 +0000
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
CC: akpm@linux-foundation.org, "Boris Brezillon" <boris.brezillon@bootlin.com>,
 "Tokunori Ikegami" <ikegami@allied-telesis.co.jp>,
 linux-mtd@lists.infradead.org, "Marek Vasut" <marek.vasut@gmail.com>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 "Chris Packham" <chris.packham@alliedtelesis.co.nz>,
 "Brian Norris" <computersforpeace@gmail.com>,
 "Cyrille Pitchen" <cyrille.pitchen@wedev4u.fr>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Joakim Tjernlund" <Joakim.Tjernlund@infinera.com>,
 "Richard Weinberger" <richard@nod.at>
Date: Sun, 11 Nov 2018 19:49:05 +0000
Message-ID: <lsq.1541965745.738336013@decadent.org.uk>
Subject: [PATCH 3.16 097/366] mtd: cfi_cmdset_0002: Change definition
 naming to retry write operation
In-Reply-To: <lsq.1541965744.387173642@decadent.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

3.16.61-rc1 review patch.  If anyone has any objections, please let me know.

------------------

From: Tokunori Ikegami <ikegami@allied-telesis.co.jp>

commit 85a82e28b023de9b259a86824afbd6ba07bd6475 upstream.

The definition can be used for other program and erase operations also.
So change the naming to MAX_RETRIES from MAX_WORD_RETRIES.

Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -42,7 +42,7 @@
 #define AMD_BOOTLOC_BUG
 #define FORCE_WORD_WRITE 0
 
-#define MAX_WORD_RETRIES 3
+#define MAX_RETRIES 3
 
 #define SST49LF004B	        0x0060
 #define SST49LF040B	        0x0050
@@ -1314,7 +1314,7 @@ static int __xipram do_write_oneword(str
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_WORD_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES)
 			goto retry;
 
 		ret = -EIO;
@@ -1765,7 +1765,7 @@ retry:
 		map_write(map, CMD(0xF0), chip->start);
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_WORD_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES)
 			goto retry;
 
 		ret = -EIO;
