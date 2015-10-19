Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zo7iq-0001I0-Aw
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2015 10:31:21 +0000
Date: Mon, 19 Oct 2015 13:20:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [patch] mtd/docg3: off by one in doc_register_sysfs()
Message-ID: <20151019102005.GF26688@mwanda>
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

Smatch found a bug in the error handling:

	drivers/mtd/devices/docg3.c:1634 doc_register_sysfs()
	error: buffer overflow 'doc_sys_attrs' 4 <= 4

The problem is that if the very last device_create_file() fails, then we
are beyond the end of the array.  Actually, any time i == 3 then there
is a problem.  We can fix this an simplify the code at the same time by
moving the !ret conditions out of the for loops and using a goto
instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index f00d0da..c3a2695 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1620,20 +1620,30 @@ static struct device_attribute doc_sys_attrs[DOC_MAX_NBFLOORS][4] = {
 static int doc_register_sysfs(struct platform_device *pdev,
 			      struct docg3_cascade *cascade)
 {
-	int ret = 0, floor, i = 0;
 	struct device *dev = &pdev->dev;
+	int floor;
+	int ret;
+	int i;
 
-	for (floor = 0; !ret && floor < DOC_MAX_NBFLOORS &&
-		     cascade->floors[floor]; floor++)
-		for (i = 0; !ret && i < 4; i++)
+	for (floor = 0;
+	     floor < DOC_MAX_NBFLOORS && cascade->floors[floor];
+	     floor++) {
+		for (i = 0; i < 4; i++) {
 			ret = device_create_file(dev, &doc_sys_attrs[floor][i]);
-	if (!ret)
-		return 0;
+			if (ret)
+				goto remove_files;
+		}
+	}
+
+	return 0;
+
+remove_files:
 	do {
 		while (--i >= 0)
 			device_remove_file(dev, &doc_sys_attrs[floor][i]);
 		i = 4;
 	} while (--floor >= 0);
+
 	return ret;
 }
 
