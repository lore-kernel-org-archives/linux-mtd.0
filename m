Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AC0C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E25D220811
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:52:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rXRqJpUQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="1P23h9vh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E25D220811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pa3atGjtK9aQE1J+a3NlLnWPxYkSVz4Zu0v0jQVcnBc=; b=rXRqJpUQuyz52kclGiyiF9Ka1U
	4UlnXw1poP76xDlS8o8p3qX5NwIyPBeS4qWklO61rm3spddmF/yWblSksqjfbNLgTEhfRpAU7YWqO
	gzzjLCRGPw7LO2u1h6frYJZJXmNuXD9d7CgGAe00A0RYFtgbh32Njd5sqnQe4r2xNdNKNYhhRunaT
	xQ4bg9MRGv6/ahNPpRI9TvvKz6AtJ+W1yihK63dol8WpSNIeUQZTPTr4RoJXH8rNSQXgLELW3Lq4U
	cMWawyYyGM2F93MJmL11IP/ZhqTSPUhIJWKnaRYu/KkA0XKBpFAWzU9OxWaweACV7OljrLStte9Ej
	S6d0ejkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hImTl-00006l-Kn; Tue, 23 Apr 2019 03:52:21 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hImSK-0006dV-Ag; Tue, 23 Apr 2019 03:50:58 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x3N3o2cE023044;
 Tue, 23 Apr 2019 12:50:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x3N3o2cE023044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555991413;
 bh=h+EwU9qqdYxQmwoBR4Te9yGMUTWayFtr2mQvRUGDY+4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1P23h9vht+/GBqnRwv/UkIJ1suM0Gl11zAvmk/8SvuVwFNSEjjcz5wleVPujRFppK
 Nx/EYAsyelP9HyPthWeDWEqGmry1y5MqVAH4kuSg33aYusbvligBz2HN/GC99w5vtM
 5Yg0icURIigmLM1gADO7WXFZwt4Hq3fD5BBu/LSkX8+UB6/Luat0ziOGN7ZMWhGLS9
 fo58H0dKM6524EBjfnfQOTOMJ1r1Ka3EpWa+TiKZiQ94Q1gXooQjZTOQDDB6tvyUPV
 0xBOTQRtogiBnMr/KZOj2ZHdEdJmH3fC/VnCXHcN5E/hwV0LkVqNuoBAt1sE3Wfa2v
 Nsv6CrzlYC6bA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [RESEND PATCH v3 06/11] MIPS: mark __fls() and __ffs() as
 __always_inline
Date: Tue, 23 Apr 2019 12:49:54 +0900
Message-Id: <20190423034959.13525-7-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423034959.13525-1-yamada.masahiro@socionext.com>
References: <20190423034959.13525-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_205053_320221_BA57A68E 
X-CRM114-Status: UNSURE (   7.87  )
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

If it is enabled for mips, the following errors are reported:

arch/mips/mm/sc-mips.o: In function `mips_sc_prefetch_enable.part.2':
sc-mips.c:(.text+0x98): undefined reference to `mips_gcr_base'
sc-mips.c:(.text+0x9c): undefined reference to `mips_gcr_base'
sc-mips.c:(.text+0xbc): undefined reference to `mips_gcr_base'
sc-mips.c:(.text+0xc8): undefined reference to `mips_gcr_base'
sc-mips.c:(.text+0xdc): undefined reference to `mips_gcr_base'
arch/mips/mm/sc-mips.o:sc-mips.c:(.text.unlikely+0x44): more undefined references to `mips_gcr_base'

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v3:
  - forcibly inline __ffs() too

Changes in v2:
  - new patch

 arch/mips/include/asm/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.h
index 830c93a010c3..9a466dde9b96 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -482,7 +482,7 @@ static inline void __clear_bit_unlock(unsigned long nr, volatile unsigned long *
  * Return the bit position (0..63) of the most significant 1 bit in a word
  * Returns -1 if no 1 bit exists
  */
-static inline unsigned long __fls(unsigned long word)
+static __always_inline unsigned long __fls(unsigned long word)
 {
 	int num;
 
@@ -548,7 +548,7 @@ static inline unsigned long __fls(unsigned long word)
  * Returns 0..SZLONG-1
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static inline unsigned long __ffs(unsigned long word)
+static __always_inline unsigned long __ffs(unsigned long word)
 {
 	return __fls(word & -word);
 }
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
