Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pwtuc-0000gX-VN
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 10:13:08 +0000
Received: by wwc33 with SMTP id 33so554601wwc.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Mar 2011 02:13:04 -0800 (PST)
Subject: Re: [PATCH] Handle high-order allocation failures in
	ubifs_jnl_write_data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <AANLkTim9F8R10hn2hSrAtXt5hsHZmTYNER5gOOy-dC9U@mail.gmail.com>
References: <AANLkTim9F8R10hn2hSrAtXt5hsHZmTYNER5gOOy-dC9U@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 08 Mar 2011 12:11:37 +0200
Message-ID: <1299579097.2754.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: t.stanislaws@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-03-04 at 17:55 -0500, Matthew L. Creech wrote:
> Running kernel 2.6.37, my PPC-based device occasionally gets an
> order-2 allocation failure in UBIFS, which causes the root FS to
> become unwritable:

Matthew, I've massaged your patch a bit. The changes I've made are as
follows.

1. Some more commentaries and some re-naming.
2. Kill the union.
4. Tweak patch commit message.
5. Allocate write reserve buffer dynamically
6. Allocate write reserve buffer only when mounting in R/W mode to
   save some RAM when we are in R/O mode.
7. Free the buffer when we are remounting to R/O mode and allocate it
   again when re-mounting to R/W mode.

The patch is below. Please, let me know if you are OK with this patch.
I've also pushed it to ubifs-2.6.git / master.



>From 7b0ebd08a562b1d78e459880fcc4282d08bcfd8b Mon Sep 17 00:00:00 2001
From: Matthew L. Creech <mlcreech@gmail.com>
Date: Fri, 4 Mar 2011 17:55:02 -0500
Subject: [PATCH] UBIFS: handle allocation failures in UBIFS write path

Running kernel 2.6.37, my PPC-based device occasionally gets an
order-2 allocation failure in UBIFS, which causes the root FS to
become unwritable:

kswapd0: page allocation failure. order:2, mode:0x4050
Call Trace:
[c787dc30] [c00085b8] show_stack+0x7c/0x194 (unreliable)
[c787dc70] [c0061aec] __alloc_pages_nodemask+0x4f0/0x57c
[c787dd00] [c0061b98] __get_free_pages+0x20/0x50
[c787dd10] [c00e4f88] ubifs_jnl_write_data+0x54/0x200
[c787dd50] [c00e82d4] do_writepage+0x94/0x198
[c787dd90] [c00675e4] shrink_page_list+0x40c/0x77c
[c787de40] [c0067de0] shrink_inactive_list+0x1e0/0x370
[c787de90] [c0068224] shrink_zone+0x2b4/0x2b8
[c787df00] [c0068854] kswapd+0x408/0x5d4
[c787dfb0] [c0037bcc] kthread+0x80/0x84
[c787dff0] [c000ef44] kernel_thread+0x4c/0x68

Similar problems were encountered last April by Tomasz Stanislawski:

http://patchwork.ozlabs.org/patch/50965/

This patch implements Artem's suggested fix: fall back to a
mutex-protected static buffer, allocated at mount time.  I tested it
by forcing execution down the failure path, and didn't see any ill
effects.

Artem: massaged the patch a little, improved it so that we'd not
allocate the write reserve buffer when we are in R/O mode.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/journal.c |   28 ++++++++++++++++++++++------
 fs/ubifs/super.c   |   18 ++++++++++++++++++
 fs/ubifs/ubifs.h   |   14 ++++++++++++++
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 914f1bd..aed25e8 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -690,7 +690,7 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 {
 	struct ubifs_data_node *data;
 	int err, lnum, offs, compr_type, out_len;
-	int dlen = UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR;
+	int dlen = COMPRESSED_DATA_NODE_BUF_SZ, allocated = 1;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 
 	dbg_jnl("ino %lu, blk %u, len %d, key %s",
@@ -698,9 +698,19 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 		DBGKEY(key));
 	ubifs_assert(len <= UBIFS_BLOCK_SIZE);
 
-	data = kmalloc(dlen, GFP_NOFS);
-	if (!data)
-		return -ENOMEM;
+	data = kmalloc(dlen, GFP_NOFS | __GFP_NOWARN);
+	if (!data) {
+		/*
+		 * Fall-back to the write reserve buffer. Note, we might be
+		 * currently on the memory reclaim path, when the kernel is
+		 * trying to free some memory by writing out dirty pages. The
+		 * write reserve buffer helps us to guarantee that we are
+		 * always able to write the data.
+		 */
+		allocated = 0;
+		mutex_lock(&c->write_reserve_mutex);
+		data = c->write_reserve_buf;
+	}
 
 	data->ch.node_type = UBIFS_DATA_NODE;
 	key_write(c, key, &data->key);
@@ -736,7 +746,10 @@ int ubifs_jnl_write_data(struct ubifs_info *c, const struct inode *inode,
 		goto out_ro;
 
 	finish_reservation(c);
-	kfree(data);
+	if (!allocated)
+		mutex_unlock(&c->write_reserve_mutex);
+	else
+		kfree(data);
 	return 0;
 
 out_release:
@@ -745,7 +758,10 @@ out_ro:
 	ubifs_ro_mode(c, err);
 	finish_reservation(c);
 out_free:
-	kfree(data);
+	if (!allocated)
+		mutex_unlock(&c->write_reserve_mutex);
+	else
+		kfree(data);
 	return err;
 }
 
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index c20c6d2..0e1c1c6 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1221,6 +1221,13 @@ static int mount_ubifs(struct ubifs_info *c)
 	if (c->bulk_read == 1)
 		bu_init(c);
 
+	if (!c->ro_mount) {
+		c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ,
+					       GFP_KERNEL);
+		if (!c->write_reserve_buf)
+			goto out_free;
+	}
+
 	c->mounting = 1;
 
 	err = ubifs_read_superblock(c);
@@ -1490,6 +1497,7 @@ out_wbufs:
 out_cbuf:
 	kfree(c->cbuf);
 out_free:
+	kfree(c->write_reserve_buf);
 	kfree(c->bu.buf);
 	vfree(c->ileb_buf);
 	vfree(c->sbuf);
@@ -1528,6 +1536,7 @@ static void ubifs_umount(struct ubifs_info *c)
 	kfree(c->cbuf);
 	kfree(c->rcvrd_mst_node);
 	kfree(c->mst_node);
+	kfree(c->write_reserve_buf);
 	kfree(c->bu.buf);
 	vfree(c->ileb_buf);
 	vfree(c->sbuf);
@@ -1613,6 +1622,10 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 		goto out;
 	}
 
+	c->write_reserve_buf = kmalloc(COMPRESSED_DATA_NODE_BUF_SZ, GFP_KERNEL);
+	if (!c->write_reserve_buf)
+		goto out;
+
 	err = ubifs_lpt_init(c, 0, 1);
 	if (err)
 		goto out;
@@ -1677,6 +1690,8 @@ out:
 		c->bgt = NULL;
 	}
 	free_wbufs(c);
+	kfree(c->write_reserve_buf);
+	c->write_reserve_buf = NULL;
 	vfree(c->ileb_buf);
 	c->ileb_buf = NULL;
 	ubifs_lpt_free(c, 1);
@@ -1720,6 +1735,8 @@ static void ubifs_remount_ro(struct ubifs_info *c)
 	free_wbufs(c);
 	vfree(c->orph_buf);
 	c->orph_buf = NULL;
+	kfree(c->write_reserve_buf);
+	c->write_reserve_buf = NULL;
 	vfree(c->ileb_buf);
 	c->ileb_buf = NULL;
 	ubifs_lpt_free(c, 1);
@@ -1950,6 +1967,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	mutex_init(&c->mst_mutex);
 	mutex_init(&c->umount_mutex);
 	mutex_init(&c->bu_mutex);
+	mutex_init(&c->write_reserve_mutex);
 	init_waitqueue_head(&c->cmt_wq);
 	c->buds = RB_ROOT;
 	c->old_idx = RB_ROOT;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 3624950..8c40ad3 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -151,6 +151,12 @@
  */
 #define WORST_COMPR_FACTOR 2
 
+/*
+ * How much memory is needed for a buffer where we comress a data node.
+ */
+#define COMPRESSED_DATA_NODE_BUF_SZ \
+	(UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR)
+
 /* Maximum expected tree height for use by bottom_up_buf */
 #define BOTTOM_UP_HEIGHT 64
 
@@ -1005,6 +1011,11 @@ struct ubifs_debug_info;
  * @bu_mutex: protects the pre-allocated bulk-read buffer and @c->bu
  * @bu: pre-allocated bulk-read information
  *
+ * @write_reserve_mutex: protects @write_reserve_buf
+ * @write_reserve_buf: on the write path we allocate memory, which might
+ *                     sometimes be unavailable, in which case we use this
+ *                     write reserve buffer
+ *
  * @log_lebs: number of logical eraseblocks in the log
  * @log_bytes: log size in bytes
  * @log_last: last LEB of the log
@@ -1256,6 +1267,9 @@ struct ubifs_info {
 	struct mutex bu_mutex;
 	struct bu_info bu;
 
+	struct mutex write_reserve_mutex;
+	void *write_reserve_buf;
+
 	int log_lebs;
 	long long log_bytes;
 	int log_last;
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
