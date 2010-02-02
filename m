Message-Id: <201002022243.o12MhCdk019188@imap1.linux-foundation.org>
Subject: [patch 5/5] mtd: change positive error return into negative in
	mtd_do_writeoob()
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 02 Feb 2010 14:43:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

The error return should be negative

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/mtdchar.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/mtdchar.c~mtd-change-positive-error-return-into-negative-in-mtd_do_writeoob drivers/mtd/mtdchar.c
--- a/drivers/mtd/mtdchar.c~mtd-change-positive-error-return-into-negative-in-mtd_do_writeoob
+++ a/drivers/mtd/mtdchar.c
@@ -373,7 +373,7 @@ static int mtd_do_writeoob(struct file *
 	if (!mtd->write_oob)
 		ret = -EOPNOTSUPP;
 	else
-		ret = access_ok(VERIFY_READ, ptr, length) ? 0 : EFAULT;
+		ret = access_ok(VERIFY_READ, ptr, length) ? 0 : -EFAULT;
 
 	if (ret)
 		return ret;
_
