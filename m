Message-Id: <201007202224.o6KMO0oR021381@imap1.linux-foundation.org>
Subject: [patch 1/4] mtd/sst25l: check for null consistently
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 20 Jul 2010 15:23:59 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: Artem.Bityutskiy@nokia.com, akpm@linux-foundation.org,
	andre@bluewatersys.com, linux-mtd@lists.infradead.org, error27@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Dan Carpenter <error27@gmail.com>

The rest of the function assumes that "data" can be null.  I don't know
the code well enough to say whether it can actually be null, but there is
no harm in checking here.

Signed-off-by: Dan Carpenter <error27@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Andre Renaud <andre@bluewatersys.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/devices/sst25l.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/devices/sst25l.c~mtd-sst25l-check-for-null-consistently drivers/mtd/devices/sst25l.c
--- a/drivers/mtd/devices/sst25l.c~mtd-sst25l-check-for-null-consistently
+++ a/drivers/mtd/devices/sst25l.c
@@ -454,7 +454,7 @@ static int __init sst25l_probe(struct sp
 						  parts, nr_parts);
 		}
 
-	} else if (data->nr_parts) {
+	} else if (data && data->nr_parts) {
 		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
 			 data->nr_parts, data->name);
 	}
_
