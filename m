Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE786C282DA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:50:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6CEC218EA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UW08KhDG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="xlbpCLxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6CEC218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i1enIYmmeCuhJyKYHF1XaoMkDP/fT0Vdlv+SXOYO5p4=; b=UW08KhDGP/joIgcphtgoMEv1UF
	jOco3EMq3jSIZ0kakNN4TgQVoeYn9pOY+GnRw87V6uPmAHqKR820nuCBU+P+JFE1Y2vws01od7Am4
	+eh9FBeI7/G/PUJGHALC/qVwdWWBZ/snOpfGsMT/F00TtkOjTIP/Saz9FJeuU026xAsxE55QCblX9
	N5mknXxDiq+VnZ2JHohUkWUrokibr8TJEfAERjn1DmDjG9q1+wNxFt/WNpL/LGWH/3u6CYCEqPCYc
	EID1P5yb9whjxZWXLXUjh0kPNUmv3S/0o8E2QND/FmBP14Qt8Pcr9LwsJzR5uYJrwZpT3opWhQRhi
	xtCqcfSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHQ9f-00082L-5Y; Fri, 19 Apr 2019 09:49:59 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHQ8a-0006aI-8e; Fri, 19 Apr 2019 09:48:55 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id x3J9mDiT012304;
 Fri, 19 Apr 2019 18:48:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x3J9mDiT012304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555667306;
 bh=IOsaHpZ2TEvCn87/LKuhI8uONRrcYXXxxmJ0Uzy6UC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xlbpCLxWCESSMUFlvymWfpdpzfmpBy5siuyjRgmVq4MOlmuBdkmCkRFunf/87D+Au
 1teXLYsl6q34ChxzjyXvCzlsrJoL0QOmDdvA0PYKn2s1+aBZS8pV9I/KELak7OVTyN
 f+VByoV8WYlJ6z4urXSwQi4RsjLCqrlJSjUWFxWAb45SNg+iZ3uNlUqnCLxkfLrQG1
 kxiV8SvJ3aboun9kg5RdF9krWujMw6/u9rYWCOyqvYXry6TeFjPgzW0890xmD08dSR
 elm5jorLBqWDwDRISFcXPZ/HHz5Wd55C/sWn9rwGPBvO8yd/UGH/PczDNCg0HckLw/
 OS+qlLF7podNA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [PATCH v2 08/11] powerpc/prom_init: mark prom_getprop() and
 prom_getproplen() as __init
Date: Fri, 19 Apr 2019 18:47:51 +0900
Message-Id: <20190419094754.24667-9-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190419094754.24667-1-yamada.masahiro@socionext.com>
References: <20190419094754.24667-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_024852_721487_B7B2B46A 
X-CRM114-Status: UNSURE (   8.66  )
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

If it is enabled for powerpc, the following modpost warnings are
reported:

WARNING: vmlinux.o(.text.unlikely+0x20): Section mismatch in reference from the function .prom_getprop() to the function .init.text:.call_prom()
The function .prom_getprop() references
the function __init .call_prom().
This is often because .prom_getprop lacks a __init
annotation or the annotation of .call_prom is wrong.

WARNING: vmlinux.o(.text.unlikely+0x3c): Section mismatch in reference from the function .prom_getproplen() to the function .init.text:.call_prom()
The function .prom_getproplen() references
the function __init .call_prom().
This is often because .prom_getproplen lacks a __init
annotation or the annotation of .call_prom is wrong.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - split into a separate patch

 arch/powerpc/kernel/prom_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index f33ff4163a51..241fe6b7a8cc 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -501,14 +501,14 @@ static int __init prom_next_node(phandle *nodep)
 	}
 }
 
-static inline int prom_getprop(phandle node, const char *pname,
-			       void *value, size_t valuelen)
+static inline int __init prom_getprop(phandle node, const char *pname,
+				      void *value, size_t valuelen)
 {
 	return call_prom("getprop", 4, 1, node, ADDR(pname),
 			 (u32)(unsigned long) value, (u32) valuelen);
 }
 
-static inline int prom_getproplen(phandle node, const char *pname)
+static inline int __init prom_getproplen(phandle node, const char *pname)
 {
 	return call_prom("getproplen", 2, 1, node, ADDR(pname));
 }
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
