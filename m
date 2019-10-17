Return-Path: <SRS0=Q04P=YK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4414ECE58D
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 17:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD9F32089C
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 17:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nIppQYaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD9F32089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqvVGwHby3et4ql9xtOb6NcoliGMKNtIVn049nWdVb4=; b=nIppQYaYRZ4jyZ
	rUmtsl2O3xn4OMJ5V6biI/gzrNBl2q75Q7puzoLe6PExF3Uhf86jtIMHoKxgq3xWZR6CToiaVJT2R
	DJFghkyymsA/q8YHMuYHmkB/84OU6IbEpmDvnN5OOzKYwLGLhsu34LVRTZH14NSQtg3RkCb2jF//q
	SSvAy1sENgWYl2hbd9FQMLh+Sin6rwXcJQuL0+3pUT8OaAbMWEQiycSBJrRsesXCa/ObN24BVDs6N
	NvN4zNUh/24v/ZVNzOMaBbRIqXTFFynZLP3f+4gMC+5A0CBrtcj3fg8YJX8xey118rAvfjj92udsV
	PPkYDZqYQlPUhtKj5yGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL9w9-0003fb-Vx; Thu, 17 Oct 2019 17:51:46 +0000
Received: from [2001:4bb8:18c:d7b:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL9qo-0005hq-EV; Thu, 17 Oct 2019 17:46:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 07/21] parisc: remove __ioremap
Date: Thu, 17 Oct 2019 19:45:40 +0200
Message-Id: <20191017174554.29840-8-hch@lst.de>
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

__ioremap is always called with the _PAGE_NO_CACHE, so fold the whole
thing and rename it to ioremap.  This allows allows to remove the
special EISA quirk to force _PAGE_NO_CACHE.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/parisc/include/asm/io.h | 11 +----------
 arch/parisc/mm/ioremap.c     | 10 ++++------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/parisc/include/asm/io.h b/arch/parisc/include/asm/io.h
index 93d37010b375..46212b52c23e 100644
--- a/arch/parisc/include/asm/io.h
+++ b/arch/parisc/include/asm/io.h
@@ -127,16 +127,7 @@ static inline void gsc_writeq(unsigned long long val, unsigned long addr)
 /*
  * The standard PCI ioremap interfaces
  */
-
-extern void __iomem * __ioremap(unsigned long offset, unsigned long size, unsigned long flags);
-
-/* Most machines react poorly to I/O-space being cacheable... Instead let's
- * define ioremap() in terms of ioremap_nocache().
- */
-static inline void __iomem * ioremap(unsigned long offset, unsigned long size)
-{
-	return __ioremap(offset, size, _PAGE_NO_CACHE);
-}
+void __iomem *ioremap(unsigned long offset, unsigned long size);
 #define ioremap_nocache(off, sz)	ioremap((off), (sz))
 #define ioremap_wc			ioremap_nocache
 #define ioremap_uc			ioremap_nocache
diff --git a/arch/parisc/mm/ioremap.c b/arch/parisc/mm/ioremap.c
index f29f682352f0..6e7c005aa09b 100644
--- a/arch/parisc/mm/ioremap.c
+++ b/arch/parisc/mm/ioremap.c
@@ -25,7 +25,7 @@
  * have to convert them into an offset in a page-aligned mapping, but the
  * caller shouldn't need to know that small detail.
  */
-void __iomem * __ioremap(unsigned long phys_addr, unsigned long size, unsigned long flags)
+void __iomem *ioremap(unsigned long phys_addr, unsigned long size)
 {
 	void __iomem *addr;
 	struct vm_struct *area;
@@ -36,10 +36,8 @@ void __iomem * __ioremap(unsigned long phys_addr, unsigned long size, unsigned l
 	unsigned long end = phys_addr + size - 1;
 	/* Support EISA addresses */
 	if ((phys_addr >= 0x00080000 && end < 0x000fffff) ||
-	    (phys_addr >= 0x00500000 && end < 0x03bfffff)) {
+	    (phys_addr >= 0x00500000 && end < 0x03bfffff))
 		phys_addr |= F_EXTEND(0xfc000000);
-		flags |= _PAGE_NO_CACHE;
-	}
 #endif
 
 	/* Don't allow wraparound or zero size */
@@ -65,7 +63,7 @@ void __iomem * __ioremap(unsigned long phys_addr, unsigned long size, unsigned l
 	}
 
 	pgprot = __pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY |
-			  _PAGE_ACCESSED | flags);
+			  _PAGE_ACCESSED | _PAGE_NO_CACHE);
 
 	/*
 	 * Mappings have to be page-aligned
@@ -90,7 +88,7 @@ void __iomem * __ioremap(unsigned long phys_addr, unsigned long size, unsigned l
 
 	return (void __iomem *) (offset + (char __iomem *)addr);
 }
-EXPORT_SYMBOL(__ioremap);
+EXPORT_SYMBOL(ioremap);
 
 void iounmap(const volatile void __iomem *io_addr)
 {
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
