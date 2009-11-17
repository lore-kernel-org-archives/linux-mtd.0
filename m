Received: from fgwmail5.fujitsu.co.jp ([192.51.44.35])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NAILj-0007te-Eb
	for linux-mtd@lists.infradead.org; Tue, 17 Nov 2009 07:19:44 +0000
Received: from m1.gw.fujitsu.co.jp ([10.0.50.71])
	by fgwmail5.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	nAH7JcaL027277 for <linux-mtd@lists.infradead.org> (envelope-from
	kosaki.motohiro@jp.fujitsu.com); Tue, 17 Nov 2009 16:19:38 +0900
Received: from smail (m1 [127.0.0.1])
	by outgoing.m1.gw.fujitsu.co.jp (Postfix) with ESMTP id 1A2CB45DE4F
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Nov 2009 16:19:38 +0900 (JST)
Received: from s1.gw.fujitsu.co.jp (s1.gw.fujitsu.co.jp [10.0.50.91])
	by m1.gw.fujitsu.co.jp (Postfix) with ESMTP id ED46245DE4E
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Nov 2009 16:19:37 +0900 (JST)
Received: from s1.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s1.gw.fujitsu.co.jp (Postfix) with ESMTP id D3E48E38002
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Nov 2009 16:19:37 +0900 (JST)
Received: from m105.s.css.fujitsu.com (m105.s.css.fujitsu.com [10.249.87.105])
	by s1.gw.fujitsu.co.jp (Postfix) with ESMTP id 8BB9BE38003
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Nov 2009 16:19:34 +0900 (JST)
From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/7] nandsim: Don't use PF_MEMALLOC
In-Reply-To: <20091117161551.3DD4.A69D9226@jp.fujitsu.com>
References: <20091117161551.3DD4.A69D9226@jp.fujitsu.com>
Message-Id: <20091117161843.3DE0.A69D9226@jp.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Nov 2009 16:19:33 +0900 (JST)
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	linux-mm <linux-mm@kvack.org>, linux-mtd@lists.infradead.org,
	kosaki.motohiro@jp.fujitsu.com, Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Non MM subsystem must not use PF_MEMALLOC. Memory reclaim need few
memory, anyone must not prevent it. Otherwise the system cause
mysterious hang-up and/or OOM Killer invokation.

Cc: David Woodhouse <David.Woodhouse@intel.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
---
 drivers/mtd/nand/nandsim.c |   22 ++--------------------
 1 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index cd0711b..97a8bbb 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -1322,34 +1322,18 @@ static int get_pages(struct nandsim *ns, struct file *file, size_t count, loff_t
 	return 0;
 }
 
-static int set_memalloc(void)
-{
-	if (current->flags & PF_MEMALLOC)
-		return 0;
-	current->flags |= PF_MEMALLOC;
-	return 1;
-}
-
-static void clear_memalloc(int memalloc)
-{
-	if (memalloc)
-		current->flags &= ~PF_MEMALLOC;
-}
-
 static ssize_t read_file(struct nandsim *ns, struct file *file, void *buf, size_t count, loff_t *pos)
 {
 	mm_segment_t old_fs;
 	ssize_t tx;
-	int err, memalloc;
+	int err;
 
 	err = get_pages(ns, file, count, *pos);
 	if (err)
 		return err;
 	old_fs = get_fs();
 	set_fs(get_ds());
-	memalloc = set_memalloc();
 	tx = vfs_read(file, (char __user *)buf, count, pos);
-	clear_memalloc(memalloc);
 	set_fs(old_fs);
 	put_pages(ns);
 	return tx;
@@ -1359,16 +1343,14 @@ static ssize_t write_file(struct nandsim *ns, struct file *file, void *buf, size
 {
 	mm_segment_t old_fs;
 	ssize_t tx;
-	int err, memalloc;
+	int err;
 
 	err = get_pages(ns, file, count, *pos);
 	if (err)
 		return err;
 	old_fs = get_fs();
 	set_fs(get_ds());
-	memalloc = set_memalloc();
 	tx = vfs_write(file, (char __user *)buf, count, pos);
-	clear_memalloc(memalloc);
 	set_fs(old_fs);
 	put_pages(ns);
 	return tx;
-- 
1.6.2.5
