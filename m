Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3B0C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA1F320B1F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EqMDQG6p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="xm48M3KR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA1F320B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gPrZokso5het3dyfQgX+9mXVR6GaZTHsdyMq/Bt928s=; b=EqMDQG6pGCSnBqMy45Ap0u6rz8
	OymIshtlUksjZz7t2UPxkNlrrLAEwnb7M0pUUGdWeqSkgyZmNOyIhUETOCmmbBEAyYV8ROtQIsdcw
	r4qXIpAVTFLhWBH2+mw7f7Jl4hLQ1cPlv6NJKp2B4wcpk7M5J9PKdrQM1gx7B2LsJ1leO8TCUg7RG
	ct5o3MtdrYhL4OJAlj0pvcFMclK8jmpWUUZEZzFf9lCSU99gBnR4wiYUXHDoxTQS/WXcgpUEHEhGL
	MUWvkdGT97S94ARfxGhV5Hot5Sey6h5iRLtdUnvhQOEogn6REFyBc+zsdLhyi4lJCfzW2sLwYANn7
	or7NdPkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIm1p-0000kL-0X; Tue, 23 Apr 2019 03:23:29 +0000
Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIm0M-0007MK-2B; Tue, 23 Apr 2019 03:22:08 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id x3N3L8LJ031384;
 Tue, 23 Apr 2019 12:21:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x3N3L8LJ031384
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555989678;
 bh=dlukBYO6sgrMJOkaTgBisXwB5sU3qv4thlZ8O2ehfGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xm48M3KRfOyJ5kQVTw4Ovn149SHzUzjXnB91gR/MwjfLF0ptp5BEUN0KLVknYLbrp
 2X/icDCYfRB9UYEbC3NAUGKwCdyo8dDDhGSx5tTGtY5HP4wqmdSP34dZKju4n+Gge+
 49so/3DvgiDJ/GVfMURchnCnlw9DNnZeiui7LkTskHswqEbB0x2gtSC2rxId3AjZBR
 GGo7gUXhxNWh5yHM3nD+kCXE9yK+n2f0qxD3hgG6HSsvsfV/vYDp6FrtitJ2VYs22S
 56kVXNRMf3PkQZYnDbPEP33MV+F6/q6okJweuR2UIDtfb+ST3kPAUvQaC9zZcF4djh
 8B1WciaXUL4Dw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [PATCH v3 08/10] powerpc/mm/radix: mark
 __radix__flush_tlb_range_psize() as __always_inline
Date: Tue, 23 Apr 2019 12:21:04 +0900
Message-Id: <20190423032106.11960-9-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423032106.11960-1-yamada.masahiro@socionext.com>
References: <20190423032106.11960-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_202158_927522_F6275BAD 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mathieu Malaterre <malat@debian.org>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
place. We need to eliminate potential issues beforehand.

If it is enabled for powerpc, the following error is reported:

arch/powerpc/mm/tlb-radix.c: In function '__radix__flush_tlb_range_psize':
arch/powerpc/mm/tlb-radix.c:104:2: error: asm operand 3 probably doesn't match constraints [-Werror]
  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
  ^~~
arch/powerpc/mm/tlb-radix.c:104:2: error: impossible constraint in 'asm'

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - split into a separate patch

 arch/powerpc/mm/tlb-radix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/tlb-radix.c b/arch/powerpc/mm/tlb-radix.c
index 6a23b9ebd2a1..a2b2848f0ae3 100644
--- a/arch/powerpc/mm/tlb-radix.c
+++ b/arch/powerpc/mm/tlb-radix.c
@@ -928,7 +928,7 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 	tlb->need_flush_all = 0;
 }
 
-static inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
+static __always_inline void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 				unsigned long start, unsigned long end,
 				int psize, bool also_pwc)
 {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
