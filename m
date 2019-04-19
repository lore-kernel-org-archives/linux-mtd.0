Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C69EC282DF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:52:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37551218EA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EbgTNgJZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="lNyrmzkr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37551218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hpa50VRGV5xMBnRouLFSU+YvjH3CcL26rfLJL2LpyG0=; b=EbgTNgJZqtIkvW+0mPAShsDYb8
	RsZWdumTLA5mipxTB/UVgph/VtJ/Sfyrh82siyntfb5dnVN/9Uxz9HWCCu7iOpafZskPoFnx6zG8l
	kmdjBYKGHx4oYW1ef2Ca0RX+/Uh/52Ap8EZaVJJ6GVy+NLVYq18DjT1yKot2C5Yzv0bulKB/WcFsF
	4DCJfLEEYWsNU9v7LhtA/s1cAC5EnewTPMoeInwOW7NFMy2ajBCPxqR+A6UXP6wlg1OffrcF7j1Fl
	GsiOM0xU5bbp1ocOZ23aI30zCDoIrkDaafybGdTLPfl0pYTGhAu5ICIDbS/Csn6ZBWBPCNhOvxhL2
	Nnh7mR6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHQBq-0003Rt-E7; Fri, 19 Apr 2019 09:52:14 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHQ8a-0006aH-8d; Fri, 19 Apr 2019 09:48:59 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id x3J9mDiS012304;
 Fri, 19 Apr 2019 18:48:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x3J9mDiS012304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555667305;
 bh=anDfa6W5ONHce754PAdi2seOW7FOosRRq63TZhqjhq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lNyrmzkrEzGdMdwdrwqYzWssnU73a1VE4o5EHE/QGOpC5eRh1jIeLJfgHCUNbbRZf
 P4fGEzjVdDAQfOVvzk/YsYpkQSYmCLsf5To/YlPN73ztVlDU5Rh0r5JUcnC7G2OsOH
 VpYq4BJw/uwG7phH5Dp3rCKdJXd2RgEb6fCPq33mQopk0novAobnQfoJYb7nbXZnRF
 nnYQf7w/ZMmRIpCQTlT1WW5gkd5vsBLTsbmcT0wM640XY3LvoLoK5l/zP7v2pWaHEO
 dfocS5SF1QPcvAXyAd/v2vXtMjwQNe50qA+EoOFt9UiQb0LoAZmVqQz/T9z9k1Oaa2
 SCp/R5bpxgF9A==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [PATCH v2 07/11] ARM: mark setup_machine_tags() stub as __init
 __noreturn
Date: Fri, 19 Apr 2019 18:47:50 +0900
Message-Id: <20190419094754.24667-8-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190419094754.24667-1-yamada.masahiro@socionext.com>
References: <20190419094754.24667-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_024852_739738_B46446D6 
X-CRM114-Status: UNSURE (   8.63  )
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

If it is enabled for arm, Clang build results in the following modpost
warning:

WARNING: vmlinux.o(.text+0x1124): Section mismatch in reference from the function setup_machine_tags() to the function .init.text:early_print()
The function setup_machine_tags() references
the function __init early_print().
This is often because setup_machine_tags lacks a __init
annotation or the annotation of early_print is wrong.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - new patch

 arch/arm/kernel/atags.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/atags.h b/arch/arm/kernel/atags.h
index 201100226301..067e12edc341 100644
--- a/arch/arm/kernel/atags.h
+++ b/arch/arm/kernel/atags.h
@@ -5,7 +5,7 @@ void convert_to_tag_list(struct tag *tags);
 const struct machine_desc *setup_machine_tags(phys_addr_t __atags_pointer,
 	unsigned int machine_nr);
 #else
-static inline const struct machine_desc *
+static inline const struct machine_desc * __init __noreturn
 setup_machine_tags(phys_addr_t __atags_pointer, unsigned int machine_nr)
 {
 	early_print("no ATAGS support: can't continue\n");
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
