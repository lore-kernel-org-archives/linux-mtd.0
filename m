Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA846CA9EC2
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 06:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95391204FD
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 06:51:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cg+rUk0h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95391204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kc9ckz4qwiYDNIWOjxIW4RDOlk/nRcjn/0dFVNDL3Dg=; b=Cg+rUk0h2HJChT
	PeyHc16NA01eDF8xc4B2cziS76XoRThy5i84uhmSOtCVNngeXE/JYTjJrh/fEuQ/MLEBQIfFqs6cx
	O92HOuVp0rkiQ+xqQ8v4x9lLjRe16l2xuKKFZWvIfICokEd3FDXH/BvVtm7qmHVWxDTqOcNug7KHR
	UqYMauZfLRsqKILg4Q4Nsjpzts2YXqrz8PNL3R1FuZpToDdqqDpcvVuBzJDG3PPzD6zpGiU7tDSOW
	DSPEWKjGKT+F+rQLo9xGYtEkj0SVf6Rpr5GifCq6WMTcDvrsQVKxAw/TfO27qa01qq4FmCPmxtYGZ
	lz6AkWI/3LwBg6UjZgbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPLLq-00071h-EE; Tue, 29 Oct 2019 06:51:34 +0000
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPLJ7-0003K7-QE; Tue, 29 Oct 2019 06:48:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 03/21] ia64: rename ioremap_nocache to ioremap_uc
Date: Tue, 29 Oct 2019 07:48:16 +0100
Message-Id: <20191029064834.23438-4-hch@lst.de>
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

On ia64 ioremap_nocache fails if attributes don't match.  Not other
architectures does this, and we plan to get rid of ioremap_nocache.
So get rid of the special semantics and define ioremap_nocache in
terms of ioremap as no portable driver could rely on the behavior
anyway.

However x86 implements ioremap_uc in a similar way as the ia64
version of ioremap_nocache, in that it ignores the firmware tables.
Switch ia64 to override ioremap_uc instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/ia64/include/asm/io.h | 6 +++---
 arch/ia64/mm/ioremap.c     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/ia64/include/asm/io.h b/arch/ia64/include/asm/io.h
index 54e70c21352a..fec9df9609ed 100644
--- a/arch/ia64/include/asm/io.h
+++ b/arch/ia64/include/asm/io.h
@@ -256,16 +256,16 @@ static inline void outsl(unsigned long port, const void *src,
 # ifdef __KERNEL__
 
 extern void __iomem * ioremap(unsigned long offset, unsigned long size);
-extern void __iomem * ioremap_nocache (unsigned long offset, unsigned long size);
+extern void __iomem * ioremap_uc(unsigned long offset, unsigned long size);
 extern void iounmap (volatile void __iomem *addr);
 static inline void __iomem * ioremap_cache (unsigned long phys_addr, unsigned long size)
 {
 	return ioremap(phys_addr, size);
 }
 #define ioremap ioremap
-#define ioremap_nocache ioremap_nocache
+#define ioremap_nocache ioremap
 #define ioremap_cache ioremap_cache
-#define ioremap_uc ioremap_nocache
+#define ioremap_uc ioremap_uc
 #define iounmap iounmap
 
 /*
diff --git a/arch/ia64/mm/ioremap.c b/arch/ia64/mm/ioremap.c
index 0c0de2c4ec69..a09cfa064536 100644
--- a/arch/ia64/mm/ioremap.c
+++ b/arch/ia64/mm/ioremap.c
@@ -99,14 +99,14 @@ ioremap (unsigned long phys_addr, unsigned long size)
 EXPORT_SYMBOL(ioremap);
 
 void __iomem *
-ioremap_nocache (unsigned long phys_addr, unsigned long size)
+ioremap_uc(unsigned long phys_addr, unsigned long size)
 {
 	if (kern_mem_attribute(phys_addr, size) & EFI_MEMORY_WB)
 		return NULL;
 
 	return __ioremap_uc(phys_addr);
 }
-EXPORT_SYMBOL(ioremap_nocache);
+EXPORT_SYMBOL(ioremap_uc);
 
 void
 early_iounmap (volatile void __iomem *addr, unsigned long size)
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
