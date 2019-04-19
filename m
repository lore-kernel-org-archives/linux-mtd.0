Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457B8C282DA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:52:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12C67218EA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:52:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TPIKQ/NW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="B0BQlA/P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12C67218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X2XSpxBMZnmIMeCR5WxckgwirhFzIAqVKtnZ0MSXXTw=; b=TPIKQ/NWjwFQHknremckwL3oPf
	J+DRlzUHVaXpdtETPVpsN5Nu0RdIUTZhh9dfUiMT2GUw8p7A//stmOks3+KDRCnLOgsrwbUBTXp+o
	ll0N4pSFj+Sm5IleYECLE0pq2e1pYCuwfX/6wQ1ZnCLPGya3IqA9c+gzL6aUroB4v8GkHrzLdB9lj
	WR1mn/kQSa2mMg3HAy3lgFdGvnuXt1rbWBKYBQvBNmBGGyQPxUZ/Bl0Boxo9RwOo7iFXu5IQm+mou
	KzFN0gvSGzAFug1nkWPmkKfYmGpP9veLRrIGZ7xjDyGcgFial87tRCnQJ1PGYVPN4hFe5YnTxHj0p
	5+vHjUJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHQCN-0004Fg-Qj; Fri, 19 Apr 2019 09:52:47 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHQ8a-0006aK-Bj; Fri, 19 Apr 2019 09:49:00 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id x3J9mDiV012304;
 Fri, 19 Apr 2019 18:48:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x3J9mDiV012304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555667309;
 bh=sNr4ub5sQxS+0LMMMb+j8VzxalFAFd/JYoE5EUyoP38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B0BQlA/PTYdRhr/cnabblYMwAYhKD6J8OBAnfSjQcaEkjG6yjSsJYkeL42KRC579r
 PNg66kXGfTKg1PT7Mcezea0Le+TIG2L3R4/go1gHcEczBgXpsHfXnTklxKr73FcJpB
 pgKBhSPoXPMW7FmxAXFP1oXRnpOJMTmVFfi2T1b21yJJ50Dxj8uphUr9arAF2VZ5Gt
 iFyTtCd7tSUQLuAgFMsInuQd7Zi7f4y+HfXk6okijLRI07aBA/2tsWZxCbHUU5cMYd
 OpHcQiZWhdNji5KDIWUGz0avKi8LtEztXO2FBxeNaT2m5466QUP8yjbxpOEGypVmOj
 xzYLsSTkB+gRA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [PATCH v2 10/11] powerpc/mm/radix: mark as __tlbie_pid() and friends
 as__always_inline
Date: Fri, 19 Apr 2019 18:47:53 +0900
Message-Id: <20190419094754.24667-11-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190419094754.24667-1-yamada.masahiro@socionext.com>
References: <20190419094754.24667-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_024852_774096_446F838F 
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
 Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Ingo Molnar <mingo@redhat.com>, linux-mtd@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This prepares to move CONFIG_OPTIMIZE_INLINING from x86 to a common
place. We need to eliminate potential issues beforehand.

If it is enabled for powerpc, the following errors are reported:

arch/powerpc/mm/tlb-radix.c: In function '__tlbie_lpid':
arch/powerpc/mm/tlb-radix.c:148:2: warning: asm operand 3 probably doesn't match constraints
  asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
  ^~~
arch/powerpc/mm/tlb-radix.c:148:2: error: impossible constraint in 'asm'
arch/powerpc/mm/tlb-radix.c: In function '__tlbie_pid':
arch/powerpc/mm/tlb-radix.c:118:2: warning: asm operand 3 probably doesn't match constraints
  asm volatile(PPC_TLBIE_5(%0, %4, %3, %2, %1)
  ^~~
arch/powerpc/mm/tlb-radix.c: In function '__tlbiel_pid':
arch/powerpc/mm/tlb-radix.c:104:2: warning: asm operand 3 probably doesn't match constraints
  asm volatile(PPC_TLBIEL(%0, %4, %3, %2, %1)
  ^~~

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - new patch

 arch/powerpc/mm/tlb-radix.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/tlb-radix.c b/arch/powerpc/mm/tlb-radix.c
index a2b2848f0ae3..14ff414d1545 100644
--- a/arch/powerpc/mm/tlb-radix.c
+++ b/arch/powerpc/mm/tlb-radix.c
@@ -90,8 +90,8 @@ void radix__tlbiel_all(unsigned int action)
 	asm volatile(PPC_INVALIDATE_ERAT "; isync" : : :"memory");
 }
 
-static inline void __tlbiel_pid(unsigned long pid, int set,
-				unsigned long ric)
+static __always_inline void __tlbiel_pid(unsigned long pid, int set,
+					 unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -106,7 +106,7 @@ static inline void __tlbiel_pid(unsigned long pid, int set,
 	trace_tlbie(0, 1, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbie_pid(unsigned long pid, unsigned long ric)
+static __always_inline void __tlbie_pid(unsigned long pid, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -136,7 +136,7 @@ static inline void __tlbiel_lpid(unsigned long lpid, int set,
 	trace_tlbie(lpid, 1, rb, rs, ric, prs, r);
 }
 
-static inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
+static __always_inline void __tlbie_lpid(unsigned long lpid, unsigned long ric)
 {
 	unsigned long rb,rs,prs,r;
 
@@ -239,7 +239,7 @@ static inline void fixup_tlbie_lpid(unsigned long lpid)
 /*
  * We use 128 set in radix mode and 256 set in hpt mode.
  */
-static inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
+static __always_inline void _tlbiel_pid(unsigned long pid, unsigned long ric)
 {
 	int set;
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
