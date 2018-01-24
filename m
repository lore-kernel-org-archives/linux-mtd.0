Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eeHyR-0007Nl-TY
 for linux-mtd@lists.infradead.org; Wed, 24 Jan 2018 10:08:09 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23991025AbeAXKH4IwC-V (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Wed, 24 Jan 2018 11:07:56 +0100
Date: Wed, 24 Jan 2018 11:07:54 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Borislav Petkov <bp@suse.de>, Ingo Molnar <mingo@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH v2 2/3] devres: Add devm_ioremap_shared_resource()
Message-ID: <20180124100754.GC19593@lenoch>
References: <20180124100604.GA19593@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180124100604.GA19593@lenoch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement managed ioremap function for shared resources.

Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
---
 Changes:
 - v2: Rebased on top of PATCH v2 1/3

 include/linux/io.h |  8 +++++++-
 lib/devres.c       | 22 ++++++++++++++--------
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/include/linux/io.h b/include/linux/io.h
index 2aea3363bfb2..2b9eb48e0f49 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -79,10 +79,16 @@ void __iomem *devm_ioremap_nocache(struct device *dev, resource_size_t offset,
 				   resource_size_t size);
 void __iomem *devm_ioremap_wc(struct device *dev, resource_size_t offset,
 				   resource_size_t size);
-void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res);
+#define devm_ioremap_resource(dev, res) \
+	__devm_ioremap_resource(dev, res, false)
+#define devm_ioremap_shared_resource(dev, res) \
+	__devm_ioremap_resource(dev, res, true)
+void __iomem *__devm_ioremap_resource(struct device *dev, struct resource *res,
+				      bool shared);
 void devm_iounmap(struct device *dev, void __iomem *addr);
 int check_signature(const volatile void __iomem *io_addr,
 			const unsigned char *signature, int length);
+
 void devm_ioremap_release(struct device *dev, void *res);
 
 void *devm_memremap(struct device *dev, resource_size_t offset,
diff --git a/lib/devres.c b/lib/devres.c
index 5f2aedd58bc5..7711ff40a572 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -22,6 +22,9 @@ static int devm_ioremap_match(struct device *dev, void *res, void *match_data)
  * @size: Size of map
  *
  * Managed ioremap().  Map is automatically unmapped on driver detach.
+ *
+ * When possible, use devm_ioremap_resource() or
+ * devm_ioremap_shared_resource() instead.
  */
 void __iomem *devm_ioremap(struct device *dev, resource_size_t offset,
 			   resource_size_t size)
@@ -116,13 +119,14 @@ void devm_iounmap(struct device *dev, void __iomem *addr)
 EXPORT_SYMBOL(devm_iounmap);
 
 /**
- * devm_ioremap_resource() - check, request region, and ioremap resource
+ * __devm_ioremap_resource() - check, request region, and ioremap resource
  * @dev: generic device to handle the resource for
  * @res: resource to be handled
+ * @shared: region is not requested when true
  *
- * Checks that a resource is a valid memory region, requests the memory
- * region and ioremaps it. All operations are managed and will be undone
- * on driver detach.
+ * Checks that a resource is a valid memory region, eventually requests the
+ * memory region and ioremaps it. All operations are managed and will be
+ * undone on driver detach.
  *
  * Returns a pointer to the remapped memory or an ERR_PTR() encoded error code
  * on failure. Usage example:
@@ -132,7 +136,8 @@ EXPORT_SYMBOL(devm_iounmap);
  *	if (IS_ERR(base))
  *		return PTR_ERR(base);
  */
-void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res)
+void __iomem *__devm_ioremap_resource(struct device *dev, struct resource *res,
+				      bool shared)
 {
 	resource_size_t size;
 	const char *name;
@@ -148,7 +153,7 @@ void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res)
 	size = resource_size(res);
 	name = res->name ?: dev_name(dev);
 
-	if (!devm_request_mem_region(dev, res->start, size, name)) {
+	if (!shared && !devm_request_mem_region(dev, res->start, size, name)) {
 		dev_err(dev, "can't request region for resource %pR\n", res);
 		return IOMEM_ERR_PTR(-EBUSY);
 	}
@@ -156,13 +161,14 @@ void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res)
 	dest_ptr = devm_ioremap(dev, res->start, size);
 	if (!dest_ptr) {
 		dev_err(dev, "ioremap failed for resource %pR\n", res);
-		devm_release_mem_region(dev, res->start, size);
+		if (!shared)
+			devm_release_mem_region(dev, res->start, size);
 		dest_ptr = IOMEM_ERR_PTR(-ENOMEM);
 	}
 
 	return dest_ptr;
 }
-EXPORT_SYMBOL(devm_ioremap_resource);
+EXPORT_SYMBOL(__devm_ioremap_resource);
 
 #ifdef CONFIG_HAS_IOPORT_MAP
 /*
-- 
2.15.1
