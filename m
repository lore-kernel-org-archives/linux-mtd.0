Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZfUhQ-0004La-Gf
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2015 15:14:13 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Andrea Scian <rnd4@dave-tech.it>,
 =?UTF-8?q?Bean=20Huo=20=E9=9C=8D=E6=96=8C=E6=96=8C=20=28beanhuo=29?=
 <beanhuo@micron.com>,
 =?UTF-8?q?Karl=20Zhang=20=E5=BC=A0=E5=8F=8C=E9=94=A3=20=28karlzhang=29?=
 <karlzhang@micron.com>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Stefan Roese <sr@denx.de>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH 5/5] mtd: nand: nandsim: add support for power-cut emulation
Date: Fri, 25 Sep 2015 17:09:18 +0200
Message-Id: <1443193758-22071-6-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1443193758-22071-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for power-cut emulation on program and erase operations.

This power-cut emulation is configurable through the nandsim/powercut file
exposed in debugfs and can be triggered on erase or program operations.
The user can also specify a specific block and/or page (relative to a
block) at which he wants the power-cut to occur.

Here are some configuration examples:

disabled => the power-cut emulation is disabled
on-erase => power-cut emulation is active and triggered on all erase
            operations
on-erase:12 => power-cut emulation is active and triggered each time block
               12 is accessed
on-program => power-cut emulation is active and triggered each time a page
              is programmed
on-program::5 => power-cut emulation is active and triggered each time page
                 5 of any block is programmed
on-program:12:5 => power-cut emulation is active and triggered each time
                    page 5 of block 12 is programmed

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nandsim.c | 172 ++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 162 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index efd8763..2f3f674 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -289,6 +289,7 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 struct nandsim_debug_info {
 	struct dentry *dfs_root;
 	struct dentry *dfs_wear_report;
+	struct dentry *dfs_powercut;
 };
 
 /*
@@ -299,6 +300,24 @@ union ns_mem {
 	uint16_t *word;  /* for 16-bit word access */
 };
 
+enum ns_powercut_status {
+	NS_POWER_CUT_DISABLED,
+	NS_POWER_CUT_ON_ERASE,
+	NS_POWER_CUT_ON_PROGRAM,
+};
+
+struct ns_powercut {
+	enum ns_powercut_status status;
+	int block;
+	int page;
+};
+
+static struct ns_powercut powercut_info = {
+	.status = NS_POWER_CUT_DISABLED,
+	.block = -1,
+	.page = -1,
+};
+
 /*
  * The structure which describes all the internal simulator data.
  */
@@ -369,6 +388,7 @@ struct nandsim {
 	void *file_buf;
 	struct page *held_pages[NS_MAX_HELD_PAGES];
 	int held_cnt;
+	bool powercut;
 
 	struct nandsim_debug_info dbg;
 };
@@ -514,6 +534,78 @@ static const struct file_operations dfs_fops = {
 	.release	= single_release,
 };
 
+static ssize_t read_file_powercut(struct file *file, char __user *user_buf,
+				  size_t count, loff_t *ppos)
+{
+	char buf[32];
+	int size = 0;
+
+	switch (powercut_info.status) {
+	case NS_POWER_CUT_DISABLED:
+		size = snprintf(buf, sizeof(buf), "disabled\n");
+		break;
+	case NS_POWER_CUT_ON_ERASE:
+		size = snprintf(buf, sizeof(buf), "on-erase:%d\n",
+				powercut_info.block);
+		break;
+	case NS_POWER_CUT_ON_PROGRAM:
+		size = snprintf(buf, sizeof(buf), "on-program:%d:%d\n",
+				powercut_info.block, powercut_info.page);
+		break;
+	default:
+		break;
+	}
+
+	return simple_read_from_buffer(user_buf, size, ppos, buf, size);
+}
+
+static ssize_t write_file_powercut(struct file *file,
+				   const char __user *user_buf,
+				   size_t count, loff_t *ppos)
+{
+	char buf[32];
+	size_t buf_size;
+	char *ptr = buf;
+	long block = -1, page = -1;
+	int ret;
+
+	buf_size = min(count, (sizeof(buf) - 1));
+	if (copy_from_user(buf, user_buf, buf_size))
+		return -EFAULT;
+
+	buf[buf_size] = '\0';
+
+	if (!strncmp(buf, "disabled", sizeof("disabled") - 1)) {
+		powercut_info.status = NS_POWER_CUT_DISABLED;
+	} else if (!strncmp(buf, "on-erase", sizeof("on-erase") - 1)) {
+		strsep(&ptr, ":");
+		if (ptr)
+			ret = kstrtol(ptr, 0, &block);
+		powercut_info.status = NS_POWER_CUT_ON_ERASE;
+	} else if (!strncmp(buf, "on-program", sizeof("on-program") - 1)) {
+		strsep(&ptr, ":");
+		if (ptr) {
+			ret = kstrtol(ptr, 0, &block);
+			strsep(&ptr, ":");
+			if (ptr)
+				ret = kstrtol(ptr, 0, &page);
+		}
+		powercut_info.status = NS_POWER_CUT_ON_PROGRAM;
+	}
+
+	powercut_info.block = block;
+	powercut_info.page = page;
+
+	return count;
+}
+
+static const struct file_operations powercut_fops = {
+	.read =		read_file_powercut,
+	.write =	write_file_powercut,
+	.open =		simple_open,
+	.llseek =	default_llseek,
+};
+
 /**
  * nandsim_debugfs_create - initialize debugfs
  * @dev: nandsim device description object
@@ -546,6 +638,12 @@ static int nandsim_debugfs_create(struct nandsim *dev)
 		goto out_remove;
 	dbg->dfs_wear_report = dent;
 
+	dent = debugfs_create_file("powercut", S_IWUSR | S_IRUSR,
+				   dbg->dfs_root, dev, &powercut_fops);
+	if (IS_ERR_OR_NULL(dent))
+		goto out_remove;
+	dbg->dfs_powercut = dent;
+
 	return 0;
 
 out_remove:
@@ -1206,6 +1304,10 @@ static inline void switch_to_ready_state(struct nandsim *ns, u_char status)
 	ns->regs.row    = 0;
 	ns->regs.column = 0;
 	ns->regs.status = status;
+	if (ns->powercut) {
+		ns->powercut = false;
+		ns->regs.status |= NAND_STATUS_POWER_CUT;
+	}
 }
 
 /*
@@ -1509,29 +1611,60 @@ static void read_page(struct nandsim *ns, int num)
 /*
  * Erase all pages in the specified sector.
  */
-static void erase_sector(struct nandsim *ns)
+static int erase_sector(struct nandsim *ns)
 {
 	union ns_mem *mypage;
 	int i;
 
+	if (powercut_info.status == NS_POWER_CUT_ON_ERASE) {
+		long block = ns->regs.row / ns->geom.pgsec;
+
+		if (powercut_info.block < 0 ||
+		    powercut_info.block == block)
+			ns->powercut = true;
+	}
+
 	if (ns->cfile) {
-		for (i = 0; i < ns->geom.pgsec; i++)
-			if (__test_and_clear_bit(ns->regs.row + i,
-						 ns->pages_written)) {
-				NS_DBG("erase_sector: freeing page %d\n", ns->regs.row + i);
+		for (i = 0; i < ns->geom.pgsec; i++) {
+			if (ns->powercut) {
+				loff_t pos = (loff_t)(ns->regs.row + i) *
+					     ns->geom.pgszoob;
+
+				/*
+				 * Corrupt all pages of the block if a
+				 * power-cut occurs in the middle of a
+				 * program operation.
+				 */
+				prandom_bytes(ns->file_buf, ns->geom.pgszoob);
+				write_file(ns, ns->cfile, ns->file_buf,
+					   ns->geom.pgszoob, pos);
+				set_bit(ns->regs.row + i, ns->pages_written);
+				NS_DBG("erase_sector (power-cut emulation): corrupting page %d\n",
+				       ns->regs.row + i);
+			} else if (__test_and_clear_bit(ns->regs.row + i,
+							ns->pages_written)) {
+				NS_DBG("erase_sector: freeing page %d\n",
+				       ns->regs.row + i);
 			}
-		return;
+		}
+
+		return ns->powercut ? -1 : 0;
 	}
 
 	mypage = NS_GET_PAGE(ns);
 	for (i = 0; i < ns->geom.pgsec; i++) {
-		if (mypage->byte != NULL) {
+		if (ns->powercut) {
+			if (mypage->byte)
+				prandom_bytes(mypage->byte, ns->geom.pgszoob);
+		} else if (mypage->byte != NULL) {
 			NS_DBG("erase_sector: freeing page %d\n", ns->regs.row+i);
 			kmem_cache_free(ns->nand_pages_slab, mypage->byte);
 			mypage->byte = NULL;
 		}
 		mypage++;
 	}
+
+	return ns->powercut ? -1 : 0;
 }
 
 /*
@@ -1543,6 +1676,24 @@ static int prog_page(struct nandsim *ns, int num)
 	union ns_mem *mypage;
 	u_char *pg_off;
 
+	if (powercut_info.status == NS_POWER_CUT_ON_PROGRAM) {
+		long block = ns->regs.row / ns->geom.pgsec;
+		long page = ns->regs.row % ns->geom.pgsec;
+
+		if (powercut_info.block < 0 ||
+		    powercut_info.block == block) {
+			if (powercut_info.page < 0 ||
+			    powercut_info.page == page) {
+				/*
+				 * Corrupt the page if a power-cut occurs in
+				 * the middle of a program operation.
+				 */
+				prandom_bytes(ns->buf.byte, ns->geom.pgszoob);
+				ns->powercut = true;
+			}
+		}
+	}
+
 	if (ns->cfile) {
 		loff_t off;
 		ssize_t tx;
@@ -1579,7 +1730,7 @@ static int prog_page(struct nandsim *ns, int num)
 				return -1;
 			}
 		}
-		return 0;
+		return ns->powercut ? -1 : 0;
 	}
 
 	mypage = NS_GET_PAGE(ns);
@@ -1603,7 +1754,7 @@ static int prog_page(struct nandsim *ns, int num)
 	for (i = 0; i < num; i++)
 		pg_off[i] &= ns->buf.byte[i];
 
-	return 0;
+	return ns->powercut ? -1 : 0;
 }
 
 /*
@@ -1681,7 +1832,8 @@ static int do_state_action(struct nandsim *ns, uint32_t action)
 				ns->regs.row, NS_RAW_OFFSET(ns));
 		NS_LOG("erase sector %u\n", erase_block_no);
 
-		erase_sector(ns);
+		if (erase_sector(ns) == -1)
+			return -1;
 
 		NS_MDELAY(erase_delay);
 
-- 
1.9.1
