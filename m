Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgklR-0000kH-Ul
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 09:13:27 -0500
Date: Tue, 21 Dec 2004 15:13:12 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221141312.GB22636@wohnheim.fh-wedel.de>
References: <20041221135530.GR22636@wohnheim.fh-wedel.de>
	<20041221135705.GS22636@wohnheim.fh-wedel.de>
	<20041221140102.GT22636@wohnheim.fh-wedel.de>
	<20041221140219.GU22636@wohnheim.fh-wedel.de>
	<20041221140322.GV22636@wohnheim.fh-wedel.de>
	<20041221140446.GW22636@wohnheim.fh-wedel.de>
	<20041221140617.GX22636@wohnheim.fh-wedel.de>
	<20041221140923.GY22636@wohnheim.fh-wedel.de>
	<20041221141042.GZ22636@wohnheim.fh-wedel.de>
	<20041221141146.GA22636@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041221141146.GA22636@wohnheim.fh-wedel.de>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: [PATCH 22/22] Readahead
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Small changes to readahead functions.  I guess they can use some more,
but it was getting late and things looked too complicated.

Signed-off-by: Jörn Engel <joern@wohnheim.fh-wedel.de>
---

 blockmtd.c |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

--- linux-2.6.9cow/drivers/mtd/devices/blockmtd.c~blockmtd_readahead	2004-12-21 02:24:35.000000000 +0100
+++ linux-2.6.9cow/drivers/mtd/devices/blockmtd.c	2004-12-21 02:30:03.000000000 +0100
@@ -54,10 +54,9 @@
 
 
 #define PAGE_READAHEAD 64
-
 void cache_readahead(struct address_space *mapping, int index)
 {
-	filler_t *filler = (void*)mapping->a_ops->readpage;
+	filler_t *filler = (filler_t*)mapping->a_ops->readpage;
 	int i, pagei;
 	unsigned ret = 0;
 	unsigned long end_index;
@@ -95,17 +94,15 @@
 		ret++;
 	}
 	spin_unlock_irq(&mapping->tree_lock);
-	if (ret) {
+	if (ret)
 		read_cache_pages(mapping, &page_pool, filler, NULL);
-		//printk(KERN_INFO "Readahead [%d/%d] pages from [%d]\n",ret,PAGE_READAHEAD,index);
-	}
 }
 
 
 static struct page* page_readahead(struct address_space *mapping, int index)
 {
-	filler_t *filler = (filler_t*)(mapping->a_ops->readpage);
-	cache_readahead(mapping,index);
+	filler_t *filler = (filler_t*)mapping->a_ops->readpage;
+	cache_readahead(mapping, index);
 	return read_cache_page(mapping, index, filler, NULL);
 }
 
