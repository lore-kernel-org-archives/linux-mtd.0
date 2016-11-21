Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8nyp-0002pG-JT
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2016 12:45:54 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Peter Pan <peterpansjtu@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH v3 3/7] mtd: nand: add a nand.h file to expose basic NAND stuff
Date: Mon, 21 Nov 2016 13:45:24 +0100
Message-Id: <1479732328-18363-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1479732328-18363-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1479732328-18363-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that raw NAND header has been moved to rawnand.h, we can add a new
nand.h file and define the common nand stuff in there.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 include/linux/mtd/nand.h | 477 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 477 insertions(+)
 create mode 100644 include/linux/mtd/nand.h

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
new file mode 100644
index 000000000000..e73b1598753d
--- /dev/null
+++ b/include/linux/mtd/nand.h
@@ -0,0 +1,477 @@
+/*
+ *  Copyright © 2016 - Boris Brezillon <boris.brezillon@free-electrons.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef __LINUX_MTD_NAND_H
+#define __LINUX_MTD_NAND_H
+
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/bbm.h>
+/**
+ * struct nand_memory_organization - memory organization structure
+ * @pagesize: page size
+ * @oobsize: OOB area size
+ * @eraseblocksize: erase block size
+ * @planesize: plane size
+ * @nplanes: number of planes embedded in a die
+ * @diesize: die size
+ * @ndies: number of dies embedded in the device
+ */
+struct nand_memory_organization {
+	int pagesize;
+	int oobsize;
+	int eraseblocksize;
+	size_t planesize;
+	int nplanes;
+	u64 diesize;
+	int ndies;
+};
+
+/**
+ * struct nand_bbt - bad block table structure
+ * @options: bad block specific options
+ * @td: bad block table descriptor for flash lookup.
+ * @md: bad block table mirror descriptor
+ * @bbp: bad block pattern
+ * @bbt: in memory BBT
+ */
+struct nand_bbt {
+	unsigned int options;
+	/*
+	 * Discourage new custom usages here; suggest usage of the
+	 * relevant NAND_BBT_* options instead
+	 */
+	struct nand_bbt_descr *td;
+	struct nand_bbt_descr *md;
+	struct nand_bbt_descr *bbp;
+	u8 *bbt;
+};
+
+struct nand_device;
+
+/**
+ * struct nand_ops - NAND operations
+ * @erase: erase the blocks covered by the erase_info description
+ */
+struct nand_ops {
+	int (*erase)(struct nand_device *nand, struct erase_info *einfo);
+	int (*markbad)(struct nand_device *mtd, int block);
+};
+
+/**
+ * struct nand_device - NAND device
+ * @mtd: MTD instance attached to the NAND device
+ * @memorg: memory layout
+ * @bbt: bad block table info
+ * @ops: NAND operations attached to the NAND device
+ */
+struct nand_device {
+	struct mtd_info mtd;
+	struct nand_memory_organization memorg;
+	struct nand_bbt bbt;
+
+	const struct nand_ops *ops;
+};
+
+/**
+ * mtd_to_nand - Get the NAND device attached to the MTD instance
+ * @mtd: MTD instance
+ *
+ * Returns the NAND device attached to @mtd.
+ */
+static inline struct nand_device *mtd_to_nand(struct mtd_info *mtd)
+{
+	return container_of(mtd, struct nand_device, mtd);
+}
+
+/**
+ * nand_to_mtd - Get the MTD device attached to a NAND device
+ * @nand: NAND device
+ *
+ * Returns the MTD device attached to @nand.
+ */
+static inline struct mtd_info *nand_to_mtd(struct nand_device *nand)
+{
+	return &nand->mtd;
+}
+
+/**
+ * nand_page_to_offs - Convert a page number to an absolute offset
+ * @nand: NAND device
+ * @page: page number
+ *
+ * Returns the offset pointing to the beginning of @page.
+ */
+static inline loff_t nand_page_to_offs(struct nand_device *nand, int page)
+{
+	return (loff_t)nand->memorg.pagesize * page;
+}
+
+/**
+ * nand_offs_to_page - Convert an absolute offset to a page offset
+ * @nand: NAND device
+ * @offs: absolute offset
+ *
+ * Returns the page number containing @offs.
+ */
+static inline int nand_offs_to_page(struct nand_device *nand, loff_t offs)
+{
+	u64 page = offs;
+
+	do_div(page, nand->memorg.pagesize);
+
+	return page;
+}
+
+/**
+ * nand_len_to_pages - Convert a length into a number of pages
+ * @nand: NAND device
+ * @len: length in bytes
+ *
+ * Returns the number of pages required to store @len bytes.
+ * This functions assumes your storing those data at a page-aligned offset.
+ */
+static inline int nand_len_to_pages(struct nand_device *nand, size_t len)
+{
+	return DIV_ROUND_UP(len, nand->memorg.pagesize);
+}
+
+/**
+ * nand_pages_to_len - Convert a number of pages into a length expressed in
+ *		       bytes
+ * @nand: NAND device
+ * @npages: number of pages
+ *
+ * Returns the size taken by @npages pages.
+ */
+static inline size_t nand_pages_to_len(struct nand_device *nand, int npages)
+{
+	return (size_t)npages * nand->memorg.pagesize;
+}
+
+/**
+ * nand_page_size - Get NAND page size
+ * @nand: NAND device
+ *
+ * Returns the page size.
+ */
+static inline size_t nand_page_size(struct nand_device *nand)
+{
+	return nand->memorg.pagesize;
+}
+
+/**
+ * nand_per_page_oobsize - Get NAND OOB size
+ * @nand: NAND device
+ *
+ * Returns the OOB size.
+ */
+static inline int nand_per_page_oobsize(struct nand_device *nand)
+{
+	return nand->memorg.oobsize;
+}
+
+/**
+ * nand_per_page_oobsize - Get NAND erase block size
+ * @nand: NAND device
+ *
+ * Returns the erase block size.
+ */
+static inline size_t nand_eraseblock_size(struct nand_device *nand)
+{
+	return nand->memorg.eraseblocksize;
+}
+
+/**
+ * nand_page_to_offs - Convert an eraseblock number to an absolute offset
+ * @nand: NAND device
+ * @block: eraseblock number
+ *
+ * Returns the offset pointing to the beginning of @block.
+ */
+static inline loff_t nand_eraseblock_to_offs(struct nand_device *nand,
+					     int block)
+{
+	return (loff_t)nand->memorg.eraseblocksize * block;
+}
+
+/**
+ * nand_offs_to_eraseblock - Convert an absolute offset to an eraseblock offset
+ * @nand: NAND device
+ * @offs: absolute offset
+ *
+ * Returns the eraseblock number containing @offs.
+ */
+static inline int nand_offs_to_eraseblock(struct nand_device *nand, loff_t offs)
+{
+	u64 block = offs;
+
+	do_div(block, nand->memorg.eraseblocksize);
+
+	return block;
+}
+
+/**
+ * nand_len_to_eraseblocks - Convert a length into a number of erablocks
+ * @nand: NAND device
+ * @len: length in bytes
+ *
+ * Returns the number of eraseblocks required to store @len bytes.
+ * This functions assumes your storing those data at an eraseblock-aligned
+ * offset.
+ */
+static inline int nand_len_to_eraseblocks(struct nand_device *nand, size_t len)
+{
+	return DIV_ROUND_UP(len, nand->memorg.eraseblocksize);
+}
+
+/**
+ * nand_eraseblocks_to_len - Convert a number of eraseblocks into a length
+ *			     expressed in bytes
+ * @nand: NAND device
+ * @nblocks: number of eraseblocks
+ *
+ * Returns the size taken by @nblock pages.
+ */
+static inline size_t nand_eraseblocks_to_len(struct nand_device *nand,
+					     int nblocks)
+{
+	return (size_t)nblocks * nand->memorg.eraseblocksize;
+}
+
+/**
+ * nand_per_eraseblock_oobsize - Get the amount of OOB bytes in an eraseblock
+ * @nand: NAND device
+ *
+ * Returns the OOB size per eraseblock.
+ */
+static inline int nand_per_eraseblock_oobsize(struct nand_device *nand)
+{
+	int pagesperblock = nand->memorg.eraseblocksize /
+			    nand->memorg.pagesize;
+
+	return nand->memorg.oobsize * pagesperblock;
+}
+
+/**
+ * nand_eraseblock_to_page - Convert an eraseblock number to a page number
+ * @nand: NAND device
+ * @block: eraseblock number
+ *
+ * Returns the page number assigned to the first page of @block eraseblock.
+ */
+static inline int nand_eraseblock_to_page(struct nand_device *nand, int block)
+{
+	int pagesperblock = nand->memorg.eraseblocksize /
+			    nand->memorg.pagesize;
+
+	return block * pagesperblock;
+}
+
+/**
+ * nand_page_to_eraseblock - Convert a page number to an eraseblock number
+ * @nand: NAND device
+ * @page: page number
+ *
+ * Returns the eraseblock number containing @page.
+ */
+static inline int nand_page_to_eraseblock(struct nand_device *nand, int page)
+{
+	int pagesperblock = nand->memorg.eraseblocksize /
+			    nand->memorg.pagesize;
+
+	return page / pagesperblock;
+}
+
+/**
+ * nand_eraseblocks_per_die - Get the number of eraseblocks per die
+ * @nand: NAND device
+ *
+ * Returns the number of eraseblocks per die.
+ */
+static inline int nand_eraseblocks_per_die(struct nand_device *nand)
+{
+	u64 nblocks = nand->memorg.diesize;
+
+	do_div(nblocks, nand->memorg.eraseblocksize);
+
+	return nblocks;
+}
+
+/**
+ * nand_eraseblocks_per_die - Get the number of eraseblocks per die
+ * @nand: NAND device
+ *
+ * Returns the number of eraseblocks per die.
+ */
+static inline u64 nand_diesize(struct nand_device *nand)
+{
+	return nand->memorg.diesize;
+}
+
+/**
+ * nand_ndies - Get the total of dies
+ * @nand: NAND device
+ *
+ * Returns the number of dies exposed by @nand.
+ */
+static inline int nand_ndies(struct nand_device *nand)
+{
+	return nand->memorg.ndies;
+}
+
+/**
+ * nand_die_to_offs - Convert a die number to an absolute offset
+ * @nand: NAND device
+ * @die: die number
+ *
+ * Returns the offset pointing to the beginning of @die.
+ */
+static inline loff_t nand_die_to_offs(struct nand_device *nand, int die)
+{
+	return (loff_t)nand->memorg.diesize * die;
+}
+
+/**
+ * nand_offs_to_die - Convert an absolute offset to a die number
+ * @nand: NAND device
+ * @offs: absolute offset
+ *
+ * Returns the die number containing @offs.
+ */
+static inline int nand_offs_to_die(struct nand_device *nand, loff_t offs)
+{
+	return div64_u64((u64)offs, nand->memorg.diesize);
+}
+
+/**
+ * nand_ndies - Get the total number of erasablocks
+ * @nand: NAND device
+ *
+ * Returns the number of eraseblocks exposed by @nand.
+ */
+static inline int nand_neraseblocks(struct nand_device *nand)
+{
+	u64 nblocks = nand->memorg.ndies * nand->memorg.diesize;
+
+	do_div(nblocks, nand->memorg.eraseblocksize);
+
+	return nblocks;
+}
+
+/**
+ * nand_register - Register a NAND device
+ * @nand: NAND device
+ *
+ * Register a NAND device.
+ * This function is just a wrapper around mtd_device_register()
+ * registering the MTD device attached to @nand.
+ */
+static inline int nand_register(struct nand_device *nand)
+{
+	return mtd_device_register(&nand->mtd, NULL, 0);
+}
+
+/**
+ * nand_unregister - Unregister a NAND device
+ * @nand: NAND device
+ *
+ * Unregister a NAND device.
+ * This function is just a wrapper around mtd_device_unregister()
+ * unregistering the MTD device attached to @nand.
+ */
+static inline void nand_unregister(struct nand_device *nand)
+{
+	mtd_device_unregister(&nand->mtd);
+}
+
+/**
+ * nand_read - Read data from NAND
+ * @nand: NAND device
+ * @offs: offset you want to read data from
+ * @ops: options describing what you want to read (in-band/out-of-band data)
+ *	 and how (raw or normal mode)
+ *
+ * Read data from NAND.
+ */
+static inline int nand_read(struct nand_device *nand, loff_t offs,
+			    struct mtd_oob_ops *ops)
+{
+	return mtd_read_oob(&nand->mtd, offs, ops);
+}
+
+/**
+ * nand_write - Write data to NAND
+ * @nand: NAND device
+ * @offs: offset you want to write data to
+ * @ops: options describing what you want to write (in-band/out-of-band data)
+ *	 and how (raw or normal mode)
+ *
+ * Read data from NAND.
+ */
+static inline int nand_write(struct nand_device *nand, loff_t offs,
+			     struct mtd_oob_ops *ops)
+{
+	return mtd_write_oob(&nand->mtd, offs, ops);
+}
+
+/**
+ * nand_erase - Erase a NAND portion
+ * @nand: NAND device
+ * @einfo: erase information
+ * @force: whether bad or protected blocks should be erased or not
+ *
+ * Erase the NAND portion described by @einfo. If @force is passed, bad and
+ * reserved block checking is bypassed and the implementation is asked to
+ * force the erasure.
+ */
+static inline int nand_erase(struct nand_device *nand,
+			     struct erase_info *einfo,
+			     bool force)
+{
+	if (!force)
+		return mtd_erase(&nand->mtd, einfo);
+
+	return nand->ops->erase(nand, einfo);
+}
+
+/**
+ * nand_markbad - Write a bad block marker to a block
+ * @nand: NAND device
+ * @block: block to mark bad
+ *
+ * Mark a block bad. This function is not using the BBT.
+ */
+static inline int nand_markbad(struct nand_device *nand, int block)
+{
+	return nand->ops->markbad(nand, block);
+}
+
+/**
+ * nand_set_of_node - Attach a DT node to a NAND device
+ * @nand: NAND device
+ * @np: DT node
+ *
+ * Attach a DT node to a NAND device.
+ */
+static inline void nand_set_of_node(struct nand_device *nand,
+				    struct device_node *np)
+{
+	mtd_set_of_node(&nand->mtd, np);
+}
+
+/**
+ * nand_get_of_node - Retrieve the DT node attached a NAND device
+ * @nand: NAND device
+ *
+ * Returns the DT node attached to @nand.
+ */
+static inline struct device_node *nand_get_of_node(struct nand_device *nand)
+{
+	return mtd_get_of_node(&nand->mtd);
+}
+#endif /* __LINUX_MTD_NAND_H */
-- 
2.7.4
