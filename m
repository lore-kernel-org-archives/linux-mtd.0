Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NanAG-00071t-FE
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 09:29:25 +0000
Received: by ewy21 with SMTP id 21so1829047ewy.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 01:29:17 -0800 (PST)
Message-ID: <4B62ABC8.7080607@gmail.com>
Date: Fri, 29 Jan 2010 10:35:04 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: Change positive error return into negative in
	mtd_do_writeoob()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The error return should be negative

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
 drivers/mtd/mtdchar.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 5b081cb..01d5837 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -373,7 +373,7 @@ static int mtd_do_writeoob(struct file *file, struct mtd_info *mtd,
 	if (!mtd->write_oob)
 		ret = -EOPNOTSUPP;
 	else
-		ret = access_ok(VERIFY_READ, ptr, length) ? 0 : EFAULT;
+		ret = access_ok(VERIFY_READ, ptr, length) ? 0 : -EFAULT;
 
 	if (ret)
 		return ret;
