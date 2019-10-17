Return-Path: <SRS0=Q04P=YK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE48FECE58E
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 17:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEA8A2089C
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 17:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="REAtxYan"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEA8A2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/IfYi92iaLcaIevm/Lhy+T5mhkSW6tbEs9OVpcdDKk=; b=REAtxYan4/Uiep
	puEwj0636EyISL9kK7ULyIHOvPQJ1CgxCH+6S1Es+j/677eF3mKgu4w2DaUqj/GO8pjVNKuHD0BDb
	/jXtGi9JXaEhT5LbO3gvR5jRZd0Dkzv1REix3nKUo1P7q6nJhvmFZV6KcGxZAxFWOYx0TDKZEHsw1
	lnt3HMY0f0Hz73fN3dfOIW4gPvrScVML6uU409kSxpIOfFyTsJs8JBnTBb8EA/159xnUasM5/Dw95
	FqqXjWmjgFoIn6P2MtIZ/GC/OheLR8LYMvCPfb/okkY0V3sMLQh/ZM9tX2oY7Ucif7vZHn9UNstYc
	QVUqRPi+pqB27rARxILA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL9yV-0005xv-D9; Thu, 17 Oct 2019 17:54:11 +0000
Received: from [2001:4bb8:18c:d7b:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL9r1-0005xj-Af; Thu, 17 Oct 2019 17:46:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 11/21] asm-generic: don't provide ioremap for CONFIG_MMU
Date: Thu, 17 Oct 2019 19:45:44 +0200
Message-Id: <20191017174554.29840-12-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017174554.29840-1-hch@lst.de>
References: <20191017174554.29840-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

All MMU-enabled ports have a non-trivial ioremap and should thus provide
the prototype for their implementation instead of providing a generic
one unless a different symbol is not defined.  Note that this only
affects sparc32 nds32 as all others do provide their own version.

Also update the kerneldoc comments in asm-generic/io.h to explain the
situation around the default ioremap* implementations correctly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/nds32/include/asm/io.h    |  2 ++
 arch/sparc/include/asm/io_32.h |  1 +
 include/asm-generic/io.h       | 29 ++++++++---------------------
 3 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/arch/nds32/include/asm/io.h b/arch/nds32/include/asm/io.h
index 16f262322b8f..fb0e8a24c7af 100644
--- a/arch/nds32/include/asm/io.h
+++ b/arch/nds32/include/asm/io.h
@@ -6,6 +6,7 @@
 
 #include <linux/types.h>
 
+void __iomem *ioremap(phys_addr_t phys_addr, size_t size);
 extern void iounmap(volatile void __iomem *addr);
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
@@ -80,4 +81,5 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
 #define writew(v,c)	({ __iowmb(); writew_relaxed((v),(c)); })
 #define writel(v,c)	({ __iowmb(); writel_relaxed((v),(c)); })
 #include <asm-generic/io.h>
+
 #endif /* __ASM_NDS32_IO_H */
diff --git a/arch/sparc/include/asm/io_32.h b/arch/sparc/include/asm/io_32.h
index df2dc1784673..9a52d9506f80 100644
--- a/arch/sparc/include/asm/io_32.h
+++ b/arch/sparc/include/asm/io_32.h
@@ -127,6 +127,7 @@ static inline void sbus_memcpy_toio(volatile void __iomem *dst,
  * Bus number may be embedded in the higher bits of the physical address.
  * This is why we have no bus number argument to ioremap().
  */
+void __iomem *ioremap(phys_addr_t offset, size_t size);
 void iounmap(volatile void __iomem *addr);
 /* Create a virtual mapping cookie for an IO port range */
 void __iomem *ioport_map(unsigned long port, unsigned int nr);
diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index a98ed6325727..6a5edc23afe2 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -922,28 +922,16 @@ static inline void *phys_to_virt(unsigned long address)
 /**
  * DOC: ioremap() and ioremap_*() variants
  *
- * If you have an IOMMU your architecture is expected to have both ioremap()
- * and iounmap() implemented otherwise the asm-generic helpers will provide a
- * direct mapping.
+ * Architectures with an MMU are expected to provide ioremap() and iounmap()
+ * themselves.  For NOMMU architectures we provide a default nop-op
+ * implementation that expect that the physical address used for MMIO are
+ * already marked as uncached, and can be used as kernel virtual addresses.
  *
- * There are ioremap_*() call variants, if you have no IOMMU we naturally will
- * default to direct mapping for all of them, you can override these defaults.
- * If you have an IOMMU you are highly encouraged to provide your own
- * ioremap variant implementation as there currently is no safe architecture
- * agnostic default. To avoid possible improper behaviour default asm-generic
- * ioremap_*() variants all return NULL when an IOMMU is available. If you've
- * defined your own ioremap_*() variant you must then declare your own
- * ioremap_*() variant as defined to itself to avoid the default NULL return.
+ * ioremap_wc() and ioremap_wt() can provide more relaxed caching attributes
+ * for specific drivers if the architecture choses to implement them.  If they
+ * are not implemented we fall back to plain ioremap.
  */
 #ifndef CONFIG_MMU
-
-/*
- * Change "struct page" to physical address.
- *
- * This implementation is for the no-MMU case only... if you have an MMU
- * you'll need to provide your own definitions.
- */
-
 #ifndef ioremap
 #define ioremap ioremap
 static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
@@ -954,14 +942,13 @@ static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
 
 #ifndef iounmap
 #define iounmap iounmap
-
 static inline void iounmap(void __iomem *addr)
 {
 }
 #endif
 #endif /* CONFIG_MMU */
+
 #ifndef ioremap_nocache
-void __iomem *ioremap(phys_addr_t phys_addr, size_t size);
 #define ioremap_nocache ioremap_nocache
 static inline void __iomem *ioremap_nocache(phys_addr_t offset, size_t size)
 {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
