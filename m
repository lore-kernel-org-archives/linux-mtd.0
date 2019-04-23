Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0261C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:51:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB66A20811
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j9DaVCax";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="afqDfXVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB66A20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6VL8hYSovJ3SEoFCWbE3WmLu1U6BgNYwRa6f+TMFWR4=; b=j9DaVCax9BrNZOmDYRaave94b1
	Ea98ifRaoxHj4pk67kaDsvSYeo3stHR4/5Pv42/5cLL+WxflGn7oTbqg31xj2OiUfWRgswWh82mfl
	Z8HfPvxdr7gx61xM9YC6sZgIfgYOuL4oAivLlJz653CQgzLoi1824bTJzVL/jfCJxnZ8zPM/5WmuZ
	MgcKvuesu0XQ47IeZM8E2xtrjnjno2T/DU1AaEOgod9ui3RI6gEqLjk7wz3agb6Oljy/e7KqrRxay
	TXxxI5wSDCr/T/Pdq1Y7FHKVwf2RVlz7j1ZgX452/Qh+5WTDJ0veWiaWPiEwjlZfczIgRCIjHXGYE
	WAMtRBvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hImT7-0007hH-EV; Tue, 23 Apr 2019 03:51:41 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hImS6-0006Nf-4j; Tue, 23 Apr 2019 03:50:41 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x3N3o2cB023044;
 Tue, 23 Apr 2019 12:50:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x3N3o2cB023044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555991406;
 bh=Uo1hU/pOzqv1Q6UwWPC8xpA1XS41uzJeh8wwHc0qw10=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=afqDfXVjkaU0um6ru4UQMMi/0BjTNH297qWtGHSlxZheAmZyP7g2xdSoWOVya1o3F
 wGNcrJgeLRi6N/dbYoVHmPyHDzsnc2AU0bWQ+9qUTrdrQivAR0riQON09o58AWsOGr
 3MiTJC5LhBxOf783Kh7T5ogQtLBRlDPZpIjEknU13Pb5R24UeulQjWWACsWqksWNy/
 MOi4jEYXLWhhh0fOsa98tELQZ7ialZWJGxUV2Bf+R1moCuqtuvyxDYXI3zc0pibOqZ
 Ia4mCuwX/wsrlpQjBMZfH8khciAtejgbm1rP56cXK3ZONAbZKMksvRc2KMzhxqMxfc
 n907v8qlw7Oqw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [RESEND PATCH v3 03/11] MIPS: mark mult_sh_align_mod() as
 __always_inline
Date: Tue, 23 Apr 2019 12:49:51 +0900
Message-Id: <20190423034959.13525-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423034959.13525-1-yamada.masahiro@socionext.com>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_205038_491535_A42D696D 
X-CRM114-Status: UNSURE (   7.48  )
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

If it is enabled for mips, the following error is reported:

arch/mips/kernel/cpu-bugs64.c: In function 'mult_sh_align_mod.constprop':
arch/mips/kernel/cpu-bugs64.c:33:2: error: asm operand 1 probably doesn't match constraints [-Werror]
  asm volatile(
  ^~~
arch/mips/kernel/cpu-bugs64.c:33:2: error: asm operand 1 probably doesn't match constraints [-Werror]
  asm volatile(
  ^~~
arch/mips/kernel/cpu-bugs64.c:33:2: error: impossible constraint in 'asm'
  asm volatile(
  ^~~
arch/mips/kernel/cpu-bugs64.c:33:2: error: impossible constraint in 'asm'
  asm volatile(
  ^~~

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3: None
Changes in v2:
  - split into a separate patch

 arch/mips/kernel/cpu-bugs64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cpu-bugs64.c b/arch/mips/kernel/cpu-bugs64.c
index bada74af7641..c04b97aace4a 100644
--- a/arch/mips/kernel/cpu-bugs64.c
+++ b/arch/mips/kernel/cpu-bugs64.c
@@ -42,8 +42,8 @@ static inline void align_mod(const int align, const int mod)
 		: "n"(align), "n"(mod));
 }
 
-static inline void mult_sh_align_mod(long *v1, long *v2, long *w,
-				     const int align, const int mod)
+static __always_inline void mult_sh_align_mod(long *v1, long *v2, long *w,
+					      const int align, const int mod)
 {
 	unsigned long flags;
 	int m1, m2;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
