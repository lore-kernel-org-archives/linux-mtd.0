Received: from smtprelay06.ispgateway.de ([80.67.31.102])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WU33N-0007PU-LQ
 for linux-mtd@lists.infradead.org; Sat, 29 Mar 2014 23:52:47 +0000
Received: from [78.43.41.9] (helo=abel)
 by smtprelay06.ispgateway.de with esmtpsa (SSLv3:AES128-SHA:128)
 (Exim 4.68) (envelope-from <daniel@vangerpen.de>) id 1WU32y-0004MO-M3
 for linux-mtd@lists.infradead.org; Sun, 30 Mar 2014 00:52:20 +0100
Date: Sun, 30 Mar 2014 00:52:10 +0100
From: Daniel van Gerpen <daniel@vangerpen.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi-utils: Fix file descriptor leaks in libubi
Message-ID: <20140330005210.6df43941@abel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Daniel van Gerpen <daniel@vangerpen.de>
---
 ubi-utils/libubi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 598191e..c2d67af 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -419,6 +419,11 @@ static int vol_node2nums(struct libubi *lib, const char *node, int *dev_num,
 		errno = ENODEV;
 		return -1;
 	}
+	
+	if (close(fd)) {
+		sys_errmsg("close failed on \"%s\"", file);
+		return -1;
+	}
 
 	*dev_num = i;
 	*vol_id = minor - 1;
@@ -910,6 +915,11 @@ int ubi_probe_node(libubi_t desc, const char *node)
 	fd = open(file, O_RDONLY);
 	if (fd == -1)
 		goto out_not_ubi;
+	
+        if (close(fd)) {
+		sys_errmsg("close failed on \"%s\"", file);
+		return -1;
+	}
 
 	return 2;
 
-- 
1.8.3.2
