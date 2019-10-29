Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D958CA9EC2
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 07:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1411720663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 07:00:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UwhI1TNo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1411720663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4p0nOBjt2n+izVzZ3osho4F7jIqDbLNgHuXw+CIZ8g=; b=UwhI1TNoMxlZEc
	VIgRlFqum9pVJ7gmyiwQS+b6VD4kMa8CdbBHLw8QgdjDQ/jzPMHpm3UBOrE2j0B+ybPX7i6ExYgbe
	VBx3aqn25frGiFEQKGng6zTBOVlZs5wS/iL2YJmZIUAsk1SaKr/f+5Yh2doY9wGdjiySm7E5sCoKy
	c6PZgPc7hwXsZgOcKPuqFCyhHBti+hW5K0aZqKDMIWLlVveTrjUesLkNw/N5BDfOC+mdNUbHauu+v
	vVZy69+D0hP9MQnu4RGq5EvR+3ZOD9hIpxheaF0YxczY53xcj+Kkkj+xcGZ2/yn0EIeGcDp/ajs1P
	ox3Pk+jCVAWbiDVedb1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPLTt-0007ov-VE; Tue, 29 Oct 2019 06:59:53 +0000
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJm-00042z-KQ; Tue, 29 Oct 2019 06:49:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 16/21] sh: remove __iounmap
Date: Tue, 29 Oct 2019 07:48:29 +0100
Message-Id: <20191029064834.23438-17-hch@lst.de>
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

No need to indirect iounmap for sh.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sh/include/asm/io.h | 9 ++-------
 arch/sh/mm/ioremap.c     | 4 ++--
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index ac0561960c52..1495489225ac 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -267,7 +267,7 @@ unsigned long long poke_real_address_q(unsigned long long addr,
 #ifdef CONFIG_MMU
 void __iomem *__ioremap_caller(phys_addr_t offset, unsigned long size,
 			       pgprot_t prot, void *caller);
-void __iounmap(void __iomem *addr);
+void iounmap(void __iomem *addr);
 
 static inline void __iomem *
 __ioremap(phys_addr_t offset, unsigned long size, pgprot_t prot)
@@ -328,7 +328,7 @@ __ioremap_mode(phys_addr_t offset, unsigned long size, pgprot_t prot)
 #else
 #define __ioremap(offset, size, prot)		((void __iomem *)(offset))
 #define __ioremap_mode(offset, size, prot)	((void __iomem *)(offset))
-#define __iounmap(addr)				do { } while (0)
+#define iounmap(addr)				do { } while (0)
 #endif /* CONFIG_MMU */
 
 static inline void __iomem *ioremap(phys_addr_t offset, unsigned long size)
@@ -370,11 +370,6 @@ static inline int iounmap_fixed(void __iomem *addr) { return -EINVAL; }
 #define ioremap_nocache	ioremap
 #define ioremap_uc	ioremap
 
-static inline void iounmap(void __iomem *addr)
-{
-	__iounmap(addr);
-}
-
 /*
  * Convert a physical pointer to a virtual kernel pointer for /dev/mem
  * access
diff --git a/arch/sh/mm/ioremap.c b/arch/sh/mm/ioremap.c
index d09ddfe58fd8..f6d02246d665 100644
--- a/arch/sh/mm/ioremap.c
+++ b/arch/sh/mm/ioremap.c
@@ -103,7 +103,7 @@ static inline int iomapping_nontranslatable(unsigned long offset)
 	return 0;
 }
 
-void __iounmap(void __iomem *addr)
+void iounmap(void __iomem *addr)
 {
 	unsigned long vaddr = (unsigned long __force)addr;
 	struct vm_struct *p;
@@ -134,4 +134,4 @@ void __iounmap(void __iomem *addr)
 
 	kfree(p);
 }
-EXPORT_SYMBOL(__iounmap);
+EXPORT_SYMBOL(iounmap);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
