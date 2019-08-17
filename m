Return-Path: <SRS0=66Q2=WN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6187CC3A59B
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 07:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B8C21743
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 07:57:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n4vMrW2F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B8C21743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zixV5ujGh6JIsokybVrSAwlN3I+C+GDC31IWAIqAip0=; b=n4vMrW2FIvyBP3
	stHUdydB5fMDzjBiK6WRs2wdkVDvqZ0HnC6WrQvLwFxSQUt+NvRBvlHXVngF9DArWFvqJV6jvNZmd
	HuqJLXZ0cu4ocnOfDWFJCjl+WdLCa09e1w6pXk5KMOOR7E+XwbUyQD9sb4vLk6f9Ta3Jm/dbCPk8L
	Ez6UFbnhQ1kPus9dl7swYf1Irj1FeJgFw3Q9BrOcqIrpSKf6D2j/269I1MyrguCk73DoeNkRK1Ky6
	RSTXGnVJXB/GT1ebENvjwIJEcx1QWkNHhydy+6LMlGXbVeaCEKgHwBcSMV8GBAwOPKB4E8Fo+W9Nu
	w/X5GlUI1s57bA4eyEvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hytaj-0007mj-5v; Sat, 17 Aug 2019 07:57:37 +0000
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSe-0005Wn-N5; Sat, 17 Aug 2019 07:49:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 21/26] nios2: remove __iounmap
Date: Sat, 17 Aug 2019 09:32:48 +0200
Message-Id: <20190817073253.27819-22-hch@lst.de>
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

No need to indirect iounmap for nios2.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/nios2/include/asm/io.h | 7 +------
 arch/nios2/mm/ioremap.c     | 6 +++---
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/nios2/include/asm/io.h b/arch/nios2/include/asm/io.h
index d108937c321e..746853ac7d8d 100644
--- a/arch/nios2/include/asm/io.h
+++ b/arch/nios2/include/asm/io.h
@@ -26,12 +26,7 @@
 #define writel_relaxed(x, addr)	writel(x, addr)
 
 void __iomem *ioremap(unsigned long physaddr, unsigned long size);
-extern void __iounmap(void __iomem *addr);
-
-static inline void iounmap(void __iomem *addr)
-{
-	__iounmap(addr);
-}
+void iounmap(void __iomem *addr);
 
 /* Pages to physical address... */
 #define page_to_phys(page)	virt_to_phys(page_to_virt(page))
diff --git a/arch/nios2/mm/ioremap.c b/arch/nios2/mm/ioremap.c
index 7a1a27f3daa3..b56af759dcdf 100644
--- a/arch/nios2/mm/ioremap.c
+++ b/arch/nios2/mm/ioremap.c
@@ -157,11 +157,11 @@ void __iomem *ioremap(unsigned long phys_addr, unsigned long size)
 EXPORT_SYMBOL(ioremap);
 
 /*
- * __iounmap unmaps nearly everything, so be careful
+ * iounmap unmaps nearly everything, so be careful
  * it doesn't free currently pointer/page tables anymore but it
  * wasn't used anyway and might be added later.
  */
-void __iounmap(void __iomem *addr)
+void iounmap(void __iomem *addr)
 {
 	struct vm_struct *p;
 
@@ -173,4 +173,4 @@ void __iounmap(void __iomem *addr)
 		pr_err("iounmap: bad address %p\n", addr);
 	kfree(p);
 }
-EXPORT_SYMBOL(__iounmap);
+EXPORT_SYMBOL(iounmap);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
