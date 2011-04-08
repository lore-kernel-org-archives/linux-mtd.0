Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DzN-0001jh-KG
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:52:50 +0000
Received: by vxd2 with SMTP id 2so3425399vxd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 08:52:49 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 1/3] MTD: Create Function to Perform Large Allocations
Date: Fri,  8 Apr 2011 08:51:32 -0700
Message-Id: <1302277894-26132-2-git-send-email-marathon96@gmail.com>
In-Reply-To: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
References: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Introduce a common function to handle large, contiguous kmalloc buffer
allocations by exponentially backing off on the size of the requested
kernel transfer buffer until it succeeds or until the requested
transfer buffer size falls below the page size.

This helps ensure the operation can succeed under low-memory, highly-
fragmented situations albeit somewhat more slowly.

Signed-off-by: Grant Erickson <marathon96@gmail.com>
Tested-by: Ben Gardiner <bengardiner at nanometrics.ca>
---
 drivers/mtd/mtdcore.c   |   41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/mtd.h |    2 ++
 2 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index da69bc8..6f720cc 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -638,6 +638,46 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	return ret;
 }
 
+/**
+ * mtd_kmalloc_up_to - allocate a contiguous buffer up to the specified size
+ * @size: A pointer to the ideal or maximum size of the allocation. Points
+ *        to the actual allocation size on success.
+ *
+ * This routine attempts to allocate a contiguous kernel buffer up to
+ * the specified size, backing off the size of the request exponentially
+ * until the request succeeds or until the allocation size falls below
+ * the system page size. This attempts to make sure it does not adversely
+ * impact system performance, so when allocating more than one page, we
+ * ask the memory allocator to avoid re-trying, swapping, writing back
+ * or performing I/O.
+ *
+ * This is called, for example by mtd_{read,write} and jffs2_scan_medium,
+ * to handle smaller (i.e. degraded) buffer allocations under low- or
+ * fragmented-memory situations where such reduced allocations, from a
+ * requested ideal, are allowed.
+ *
+ * Returns a pointer to the allocated buffer on success; otherwise, NULL.
+ */
+void *mtd_kmalloc_up_to(size_t *size)
+{
+	gfp_t flags = __GFP_NOWARN | __GFP_WAIT |
+		       __GFP_NORETRY | __GFP_NO_KSWAPD;
+	size_t try;
+	void *kbuf;
+
+	try = min_t(size_t, *size, KMALLOC_MAX_SIZE);
+
+	do {
+		if (try <= PAGE_SIZE)
+			flags = GFP_KERNEL;
+
+		kbuf = kmalloc(try, flags);
+	} while (!kbuf && ((try >>= 1) >= PAGE_SIZE));
+
+	*size = try;
+	return kbuf;
+}
+
 EXPORT_SYMBOL_GPL(add_mtd_device);
 EXPORT_SYMBOL_GPL(del_mtd_device);
 EXPORT_SYMBOL_GPL(get_mtd_device);
@@ -648,6 +688,7 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
 EXPORT_SYMBOL_GPL(register_mtd_user);
 EXPORT_SYMBOL_GPL(unregister_mtd_user);
 EXPORT_SYMBOL_GPL(default_mtd_writev);
+EXPORT_SYMBOL_GPL(mtd_kmalloc_up_to);
 
 #ifdef CONFIG_PROC_FS
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9d5306b..a5d31ba 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -348,7 +348,8 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int default_mtd_readv(struct mtd_info *mtd, struct kvec *vecs,
 		      unsigned long count, loff_t from, size_t *retlen);
 
+void *mtd_kmalloc_up_to(size_t *size);
+
 #ifdef CONFIG_MTD_PARTITIONS
 void mtd_erase_callback(struct erase_info *instr);
 #else
--
1.7.4.2
