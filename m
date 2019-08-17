Return-Path: <SRS0=66Q2=WN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81729C3A59B
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 07:54:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528E421743
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Aug 2019 07:54:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mdSAc388"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528E421743
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvEWoYRBnZsw26VZ4/onQjlMG9Giu00tSlI6WYBRbTU=; b=mdSAc388gYi7gH
	wmiwL9M2bnOFrWL26xOcovhVAZ+0NOUIxkxf4BMRFGt9TBooxHqywhEnaP65+EC7d/AsCvm6jbnoX
	Exdtmvjhuu9b7+iERZN1J4CR0NsjSNWqHFFaW1yNmzlsgaMdT4gfrkMPnfL0LTh2zlCo0+XJqpubq
	gymvpSpVaPjiZuY8Of3NOIOjFHxy+QIqiUpaqneYSPai13nxnli4yVEwik/f+xu8ln7UyCRHQ6oNb
	SWaDL3qqt6x+214qlBhOKI1ervg5vXM82XjieI5jEf24PQD0ishLCAShYYF5VBovpuCwERTvaZDlk
	f8Ckx3/yHt5RZwcFfJKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hytXD-0002oC-H7; Sat, 17 Aug 2019 07:53:59 +0000
Received: from [2001:4bb8:18c:28b5:44f9:d544:957f:32cb] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hytSH-00059n-FF; Sat, 17 Aug 2019 07:48:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 14/26] asm-generic: don't provide __ioremap
Date: Sat, 17 Aug 2019 09:32:41 +0200
Message-Id: <20190817073253.27819-15-hch@lst.de>
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

__ioremap is not a kernel API, but used for helpers with differing
semantics in arch code.  We should not provide it in as-generic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/io.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index b83e2802c969..d02806513670 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -963,15 +963,6 @@ static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
 }
 #endif
 
-#ifndef __ioremap
-#define __ioremap __ioremap
-static inline void __iomem *__ioremap(phys_addr_t offset, size_t size,
-				      unsigned long flags)
-{
-	return ioremap(offset, size);
-}
-#endif
-
 #ifndef iounmap
 #define iounmap iounmap
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
