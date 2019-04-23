Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89817C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:52:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B69120811
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nj01015k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="qQonU7ZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B69120811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f/DSnX0xgVylVz7BKe0rcxtTEZnKlxyPaMdJkHxJ6uY=; b=nj01015kpeFdc18PiAwR0PTZVB
	rvdW99wrNCHgezZtSC9f+c8eCxM2OCERQn24S1JA9XZcOPMf15nd5Y5APdoMH8p/Tn/nm/92GmBfW
	uR1Lh85f5THlgO/RY/h1u5IgF46dl33vK6vu18YmwvAtALsIwMOmiZzCNr7WE7gwlAvNycpQb+L1i
	g4jf16HTsCqiRAERAjOsdOHzjrkwgwZza9qbZHjVqjRHgaz22PH1hoDAjVe4Yxe5pX4r65vNuXwRU
	wOcmfwGdFcGuMy61bdsmW+vueUOtK2Q1zPs3rkwFGzB8wg3bpjw8Ue5iqULvwMVjLylUF9GGmDHjo
	tLIEmmvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hImTT-0008B5-Bs; Tue, 23 Apr 2019 03:52:03 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hImS6-0006Nd-4k; Tue, 23 Apr 2019 03:50:41 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x3N3o2cA023044;
 Tue, 23 Apr 2019 12:50:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x3N3o2cA023044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555991405;
 bh=bSpCfUAcyt+UjPMgYyZQmseLNPkdMgHIhxbhwQzsBmI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQonU7ZJ8JQuK/yYFMxbIUEgpGk8t0atMGb/Xg6wfixcHjJS4ZUo9nyW+pQqWbV8T
 OxvALrGC8d/ErgshgANG1OAY+TcpQpCqnaavYGTgwqrgaUitAzgyE/9JOFwv4BsBdG
 wbeykQA6/Q04egSC+2R80XMzpSETZsYTxdB0oHI0xSH/b0z6nhabFnafw6cY5n9tKs
 0f2/DWceDLDknEENgje4LV91UluDtdJv9N5kvqx6b3GklMOHRjgjlpHvwKHOkoiQvj
 F7yiwswgn7WygwK4jBgoIws8Okj6DQ9vW0zIHi+Rcqbu1FlYnNlSg+X3RQo8mdEc/b
 gz8IOWt3SAfsQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [RESEND PATCH v3 02/11] arm64: mark (__)cpus_have_const_cap as
 __always_inline
Date: Tue, 23 Apr 2019 12:49:50 +0900
Message-Id: <20190423034959.13525-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423034959.13525-1-yamada.masahiro@socionext.com>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_205038_490026_BC6B7327 
X-CRM114-Status: UNSURE (   7.53  )
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

If it is enabled for arm64, the following errors are reported:

In file included from ././include/linux/compiler_types.h:68,
                 from <command-line>:
./arch/arm64/include/asm/jump_label.h: In function 'cpus_have_const_cap':
./include/linux/compiler-gcc.h:120:38: warning: asm operand 0 probably doesn't match constraints
 #define asm_volatile_goto(x...) do { asm goto(x); asm (""); } while (0)
                                      ^~~
./arch/arm64/include/asm/jump_label.h:32:2: note: in expansion of macro 'asm_volatile_goto'
  asm_volatile_goto(
  ^~~~~~~~~~~~~~~~~
./include/linux/compiler-gcc.h:120:38: error: impossible constraint in 'asm'
 #define asm_volatile_goto(x...) do { asm goto(x); asm (""); } while (0)
                                      ^~~
./arch/arm64/include/asm/jump_label.h:32:2: note: in expansion of macro 'asm_volatile_goto'
  asm_volatile_goto(
  ^~~~~~~~~~~~~~~~~

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - split into a separate patch

 arch/arm64/include/asm/cpufeature.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e505e1fbd2b9..77d1aa57323e 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -406,7 +406,7 @@ static inline bool cpu_have_feature(unsigned int num)
 }
 
 /* System capability check for constant caps */
-static inline bool __cpus_have_const_cap(int num)
+static __always_inline bool __cpus_have_const_cap(int num)
 {
 	if (num >= ARM64_NCAPS)
 		return false;
@@ -420,7 +420,7 @@ static inline bool cpus_have_cap(unsigned int num)
 	return test_bit(num, cpu_hwcaps);
 }
 
-static inline bool cpus_have_const_cap(int num)
+static __always_inline bool cpus_have_const_cap(int num)
 {
 	if (static_branch_likely(&arm64_const_caps_ready))
 		return __cpus_have_const_cap(num);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
