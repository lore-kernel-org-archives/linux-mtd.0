Received: from agminet01.oracle.com ([141.146.126.228])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GcECv-0003tp-UE
	for linux-mtd@lists.infradead.org; Tue, 24 Oct 2006 00:48:11 -0400
Date: Mon, 23 Oct 2006 21:48:26 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: fix printk format warning
Message-Id: <20061023214826.d54fc7c6.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: akpm <akpm@osdl.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Randy Dunlap <randy.dunlap@oracle.com>

(may be a gcc phenomenon)
Fix printk format warning:
drivers/mtd/maps/physmap.c:93: warning: long long unsigned int format, long unsigned int arg (arg 2)

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---

 drivers/mtd/maps/physmap.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

--- linux-2619-rc3-pv.orig/drivers/mtd/maps/physmap.c
+++ linux-2619-rc3-pv/drivers/mtd/maps/physmap.c
@@ -89,7 +89,7 @@ static int physmap_flash_probe(struct pl
 		return -ENODEV;
 
        	printk(KERN_NOTICE "physmap platform flash device: %.8llx at %.8llx\n",
-	    (unsigned long long)dev->resource->end - dev->resource->start + 1,
+	    (unsigned long long)(dev->resource->end - dev->resource->start + 1),
 	    (unsigned long long)dev->resource->start);
 
 	info = kmalloc(sizeof(struct physmap_flash_info), GFP_KERNEL);


---
