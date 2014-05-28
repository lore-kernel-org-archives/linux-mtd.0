Received: from mailrelay007.isp.belgacom.be ([195.238.6.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpkVv-0004GD-8o
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 20:31:57 +0000
Date: Wed, 28 May 2014 22:31:28 +0200
From: Fabian Frederick <fabf@skynet.be>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/1] drivers/mtd/devices/phram.c: replace kmalloc/strcpy by
 kstrdup
Message-Id: <20140528223128.c83c3fddac5553ebd315ddf9@skynet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Joern Engel <joern@lazybastard.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Cc: Joern Engel <joern@lazybastard.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Fabian Frederick <fabf@skynet.be>
---
 drivers/mtd/devices/phram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 2cceebf..3bac7da 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -181,12 +181,10 @@ static int parse_name(char **pname, const char *token)
 	if (len > 64)
 		return -ENOSPC;
 
-	name = kmalloc(len, GFP_KERNEL);
+	name = kstrdup(token, GFP_KERNEL);
 	if (!name)
 		return -ENOMEM;
 
-	strcpy(name, token);
-
 	*pname = name;
 	return 0;
 }
-- 
1.9.1
