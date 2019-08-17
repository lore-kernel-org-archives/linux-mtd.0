Return-Path: <SRS0=66Q2=WN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC28C3A59B
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 07:59:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E8D621743
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 07:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y7O/e66H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E8D621743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XT7WbCmjkcrPTdlm3TekZW7dXAd1xvSoykdd8ib206c=; b=Y7O/e66HLX71dR
	pdwhdOnazpQwwWZ/PB+mUKDWAADBFMnKDIRHR1ZOngIpE+9H0n55mU2TG8QH0aSsycl5SUQBDZg0L
	QHcZ5oEInWXTY1ZNnRDbOJVNN4seu1fj3AVpYTqVwPAm0bhPBF/3OxC+adbsjLLo4yOCsba9+K+/l
	rWKSsMX2GTMyjdHN46g9yPiulUzbJv3lorDtRRgJrOo7fUkl52TDjkVfnPNyV3sKU6ffPyj5A9Dia
	9OQnnRJQUCnz0ye0lyUlK4k9Vfw7ETzfpu+A6NkUNSkPio+muF3kMc2AzIXqwwPWZVfLZHYOASOSO
	6DO+hZp2NbDXQ0+nayKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hytcm-0001Yi-3Q; Sat, 17 Aug 2019 07:59:44 +0000
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSr-0005ig-CV; Sat, 17 Aug 2019 07:49:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 25/26] csky: use generic ioremap
Date: Sat, 17 Aug 2019 09:32:52 +0200
Message-Id: <20190817073253.27819-26-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817073253.27819-1-hch@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
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

Use the generic ioremap_prot and iounmap helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/csky/Kconfig               |  1 +
 arch/csky/include/asm/io.h      |  7 ------
 arch/csky/include/asm/pgtable.h |  4 ++++
 arch/csky/mm/ioremap.c          | 42 ---------------------------------
 4 files changed, 5 insertions(+), 49 deletions(-)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 3973847b5f42..da09c884cc30 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -17,6 +17,7 @@ config CSKY
 	select IRQ_DOMAIN
 	select HANDLE_DOMAIN_IRQ
 	select DW_APB_TIMER_OF
+	select GENERIC_IOREMAP
 	select GENERIC_LIB_ASHLDI3
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
diff --git a/arch/csky/include/asm/io.h b/arch/csky/include/asm/io.h
index 800985af1c44..10e09299c912 100644
--- a/arch/csky/include/asm/io.h
+++ b/arch/csky/include/asm/io.h
@@ -8,13 +8,6 @@
 #include <linux/types.h>
 #include <linux/version.h>
 
-extern void __iomem *ioremap(phys_addr_t offset, size_t size);
-
-extern void iounmap(void *addr);
-
-extern int remap_area_pages(unsigned long address, phys_addr_t phys_addr,
-		size_t size, unsigned long flags);
-
 /*
  * I/O memory access primitives. Reads are ordered relative to any
  * following Normal memory access. Writes are ordered relative to any prior
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index c429a6f347de..b5f605b9810c 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -86,6 +86,10 @@
 #define PAGE_USERIO	__pgprot(_PAGE_PRESENT | _PAGE_READ | _PAGE_WRITE | \
 				_CACHE_CACHED)
 
+#define _PAGE_IOREMAP \
+	(_PAGE_PRESENT | __READABLE | __WRITEABLE | _PAGE_GLOBAL | \
+	 _CACHE_UNCACHED | _PAGE_SO)
+
 #define __P000	PAGE_NONE
 #define __P001	PAGE_READONLY
 #define __P010	PAGE_COPY
diff --git a/arch/csky/mm/ioremap.c b/arch/csky/mm/ioremap.c
index 8473b6bdf512..65614f65ce48 100644
--- a/arch/csky/mm/ioremap.c
+++ b/arch/csky/mm/ioremap.c
@@ -3,50 +3,8 @@
 
 #include <linux/export.h>
 #include <linux/mm.h>
-#include <linux/vmalloc.h>
 #include <linux/io.h>
 
-#include <asm/pgtable.h>
-
-void __iomem *ioremap(phys_addr_t addr, size_t size)
-{
-	phys_addr_t last_addr;
-	unsigned long offset, vaddr;
-	struct vm_struct *area;
-	pgprot_t prot;
-
-	last_addr = addr + size - 1;
-	if (!size || last_addr < addr)
-		return NULL;
-
-	offset = addr & (~PAGE_MASK);
-	addr &= PAGE_MASK;
-	size = PAGE_ALIGN(size + offset);
-
-	area = get_vm_area_caller(size, VM_ALLOC, __builtin_return_address(0));
-	if (!area)
-		return NULL;
-
-	vaddr = (unsigned long)area->addr;
-
-	prot = __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE |
-			_PAGE_GLOBAL | _CACHE_UNCACHED | _PAGE_SO);
-
-	if (ioremap_page_range(vaddr, vaddr + size, addr, prot)) {
-		free_vm_area(area);
-		return NULL;
-	}
-
-	return (void __iomem *)(vaddr + offset);
-}
-EXPORT_SYMBOL(ioremap);
-
-void iounmap(void __iomem *addr)
-{
-	vunmap((void *)((unsigned long)addr & PAGE_MASK));
-}
-EXPORT_SYMBOL(iounmap);
-
 pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 			      unsigned long size, pgprot_t vma_prot)
 {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
