Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62CBCA9EC2
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 07:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1D9120830
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 07:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ps6iK98E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1D9120830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wG8HJz1fyJqln2YVeiF4NcUfoJHI5eQ0+c9UdfznCfI=; b=ps6iK98EM3r7TC
	u9rS5Jt4tzJj9ydo/J6/8qQBHUF7HjgX9vILGnnYlIlUpaUoCGqZYMhGb5k56DpfIgS1DI9+1adr5
	ZpJxAKrjM8Tk+61w2DmS6rRMOH6/IqhL5mIDWWN0/7ICY3gq57gcWD3F5MFm1GEqueFRaecDJEfzv
	4R8/3LYymcY8PG7wwZfBmJSnjEhqMYuusezmgaP92M5VTVOUT9UmNWmFrEiw9iUNgTAkhYrDt7Rr/
	MxsK8XUPjQiIIvQdJAuMdNGfN/eK4qq58yTfrofhx4PZz5zShRsmCdy1VONsEYpYj1B+Ww6SuJYYE
	744llaa7+0Jw63zdh9Jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPLVS-0001yV-6h; Tue, 29 Oct 2019 07:01:30 +0000
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJw-0004D0-K2; Tue, 29 Oct 2019 06:49:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 19/21] nds32: use generic ioremap
Date: Tue, 29 Oct 2019 07:48:32 +0100
Message-Id: <20191029064834.23438-20-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191029064834.23438-1-hch@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
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

Note that the io.h include in pgtable.h had to be removed to not create
an include loop.  As far as I can tell there was no need for it to
start with.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/nds32/Kconfig               |  1 +
 arch/nds32/include/asm/io.h      |  3 +-
 arch/nds32/include/asm/pgtable.h |  4 ++-
 arch/nds32/mm/Makefile           |  3 +-
 arch/nds32/mm/ioremap.c          | 62 --------------------------------
 5 files changed, 6 insertions(+), 67 deletions(-)
 delete mode 100644 arch/nds32/mm/ioremap.c

diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
index fbd68329737f..12c06a833b7c 100644
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@ -20,6 +20,7 @@ config NDS32
 	select GENERIC_CLOCKEVENTS
 	select GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_SHOW
+	select GENERIC_IOREMAP
 	select GENERIC_LIB_ASHLDI3
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_CMPDI2
diff --git a/arch/nds32/include/asm/io.h b/arch/nds32/include/asm/io.h
index fb0e8a24c7af..e57378d04006 100644
--- a/arch/nds32/include/asm/io.h
+++ b/arch/nds32/include/asm/io.h
@@ -6,8 +6,6 @@
 
 #include <linux/types.h>
 
-void __iomem *ioremap(phys_addr_t phys_addr, size_t size);
-extern void iounmap(volatile void __iomem *addr);
 #define __raw_writeb __raw_writeb
 static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
@@ -80,6 +78,7 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
 #define writeb(v,c)	({ __iowmb(); writeb_relaxed((v),(c)); })
 #define writew(v,c)	({ __iowmb(); writew_relaxed((v),(c)); })
 #define writel(v,c)	({ __iowmb(); writel_relaxed((v),(c)); })
+
 #include <asm-generic/io.h>
 
 #endif /* __ASM_NDS32_IO_H */
diff --git a/arch/nds32/include/asm/pgtable.h b/arch/nds32/include/asm/pgtable.h
index 0588ec99725c..6fbf251cfc26 100644
--- a/arch/nds32/include/asm/pgtable.h
+++ b/arch/nds32/include/asm/pgtable.h
@@ -12,7 +12,6 @@
 #include <asm/nds32.h>
 #ifndef __ASSEMBLY__
 #include <asm/fixmap.h>
-#include <asm/io.h>
 #include <nds32_intrinsic.h>
 #endif
 
@@ -130,6 +129,9 @@ extern void __pgd_error(const char *file, int line, unsigned long val);
 #define _PAGE_CACHE		_PAGE_C_MEM_WB
 #endif
 
+#define _PAGE_IOREMAP \
+	(_PAGE_V | _PAGE_M_KRW | _PAGE_D | _PAGE_G | _PAGE_C_DEV)
+
 /*
  * + Level 1 descriptor (PMD)
  */
diff --git a/arch/nds32/mm/Makefile b/arch/nds32/mm/Makefile
index bd360e4583b5..897ecaf5cf54 100644
--- a/arch/nds32/mm/Makefile
+++ b/arch/nds32/mm/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y				:= extable.o tlb.o \
-				   fault.o init.o ioremap.o mmap.o \
+obj-y				:= extable.o tlb.o fault.o init.o mmap.o \
                                    mm-nds32.o cacheflush.o proc.o
 
 obj-$(CONFIG_ALIGNMENT_TRAP)	+= alignment.o
diff --git a/arch/nds32/mm/ioremap.c b/arch/nds32/mm/ioremap.c
deleted file mode 100644
index 690140bb23a2..000000000000
--- a/arch/nds32/mm/ioremap.c
+++ /dev/null
@@ -1,62 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-// Copyright (C) 2005-2017 Andes Technology Corporation
-
-#include <linux/vmalloc.h>
-#include <linux/io.h>
-#include <linux/mm.h>
-#include <asm/pgtable.h>
-
-void __iomem *ioremap(phys_addr_t phys_addr, size_t size);
-
-static void __iomem *__ioremap_caller(phys_addr_t phys_addr, size_t size,
-				      void *caller)
-{
-	struct vm_struct *area;
-	unsigned long addr, offset, last_addr;
-	pgprot_t prot;
-
-	/* Don't allow wraparound or zero size */
-	last_addr = phys_addr + size - 1;
-	if (!size || last_addr < phys_addr)
-		return NULL;
-
-	/*
-	 * Mappings have to be page-aligned
-	 */
-	offset = phys_addr & ~PAGE_MASK;
-	phys_addr &= PAGE_MASK;
-	size = PAGE_ALIGN(last_addr + 1) - phys_addr;
-
-	/*
-	 * Ok, go for it..
-	 */
-	area = get_vm_area_caller(size, VM_IOREMAP, caller);
-	if (!area)
-		return NULL;
-
-	area->phys_addr = phys_addr;
-	addr = (unsigned long)area->addr;
-	prot = __pgprot(_PAGE_V | _PAGE_M_KRW | _PAGE_D |
-			_PAGE_G | _PAGE_C_DEV);
-	if (ioremap_page_range(addr, addr + size, phys_addr, prot)) {
-		vunmap((void *)addr);
-		return NULL;
-	}
-	return (__force void __iomem *)(offset + (char *)addr);
-
-}
-
-void __iomem *ioremap(phys_addr_t phys_addr, size_t size)
-{
-	return __ioremap_caller(phys_addr, size,
-				__builtin_return_address(0));
-}
-
-EXPORT_SYMBOL(ioremap);
-
-void iounmap(volatile void __iomem * addr)
-{
-	vunmap((void *)(PAGE_MASK & (unsigned long)addr));
-}
-
-EXPORT_SYMBOL(iounmap);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
