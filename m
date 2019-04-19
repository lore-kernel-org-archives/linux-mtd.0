Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C78C282DA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A863218EA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 09:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JP3ny4gO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="XuDk5pY0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A863218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CNYGqHQbQbNLUcPnPrPtwN2ajCQZAt9yOhQcwMe928U=; b=JP3ny4gOpbktN8
	6kvtO7mKH1bhON4HVjO0AVALEIhE1SP5yz1zVEVmivzyr+H24b4O4OVDaGadXT5xAAWIQO0Bq/kjS
	kHZsyxYRVZFQ7XExOeVOtVkLDC2k8L0AXpmNmeSTUU/g5nZsY7bwe3rh8OeIR53aXsZmINYBfP9D8
	UKRCHYcYmrdfpHcGnexDttH34kvjjrk+Nc0eQ92zAK+iiwxzJfXNBtLZjKJZ8xW57b6mGCW4GXuLV
	SiBt/6XZeZVCciOrsfIq+JNT2O8qEMFP6ZAiDOmpqVo8sPiboF9KiUCYCmzlA/YrKq9pWNVNjYgxL
	mVVpzxwlnqlBLGWR4P5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHQ9G-0007W1-8A; Fri, 19 Apr 2019 09:49:34 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHQ8W-0006Yx-45; Fri, 19 Apr 2019 09:48:51 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id x3J9mDiL012304;
 Fri, 19 Apr 2019 18:48:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x3J9mDiL012304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555667295;
 bh=KIJsj9BjbJCKV5d3TQJAGFjQI0UA9lTr5KAl3uaBdzI=;
 h=From:To:Cc:Subject:Date:From;
 b=XuDk5pY0o90ECZwUqGP84ppzgA6XEFU/Q8b2Wpng7fY2TlkWcTHQKCAwfKS3dEkoJ
 /wM2hrBugVAd8GDB21Y8r0JmiV1i/gqCD2bM8RPKqcOV7FCV/a2Iu+967c3DkrjItY
 prjosvSKi8xi6N93D24mp+8Bpa0LsxVR4uwfvLM6ReLlODp1Xe6kOsbWU9InjeslPy
 yjlzg2YpxqNZbvyhGr5IALaj3VQob8rd8k4t/yp4OMWFo109A06sOFx+WGB5wXNN+x
 SclFXVMgtA/pdCK17FEbRqdD8lS8YsTeJeaU6jfT33kteQIcqOupLrNvGeHjD25cCx
 DUnO5stjBOW0A==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [PATCH v2 00/11] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
Date: Fri, 19 Apr 2019 18:47:43 +0900
Message-Id: <20190419094754.24667-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_024848_500952_F63CD5C1 
X-CRM114-Status: UNSURE (   6.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Major changes in v2:
 - Eliminate more errors and warnings
 - Delete 'depends on !MIPS'
 - Split into separate patches

Arnd Bergmann (1):
  ARM: prevent tracing IPI_CPU_BACKTRACE

Masahiro Yamada (10):
  arm64: mark (__)cpus_have_const_cap as __always_inline
  MIPS: mark mult_sh_align_mod() as __always_inline
  s390/cpacf: mark scpacf_query() as __always_inline
  mtd: rawnand: vf610_nfc: add initializer to avoid
    -Wmaybe-uninitialized
  MIPS: mark __fls() as __always_inline
  ARM: mark setup_machine_tags() stub as __init __noreturn
  powerpc/prom_init: mark prom_getprop() and prom_getproplen() as __init
  powerpc/mm/radix: mark __radix__flush_tlb_range_psize() as
    __always_inline
  powerpc/mm/radix: mark as __tlbie_pid() and friends as__always_inline
  compiler: allow all arches to enable CONFIG_OPTIMIZE_INLINING

 arch/arm/include/asm/hardirq.h      |  1 +
 arch/arm/kernel/atags.h             |  2 +-
 arch/arm/kernel/smp.c               |  6 +++++-
 arch/arm64/include/asm/cpufeature.h |  4 ++--
 arch/mips/include/asm/bitops.h      |  2 +-
 arch/mips/kernel/cpu-bugs64.c       |  4 ++--
 arch/powerpc/kernel/prom_init.c     |  6 +++---
 arch/powerpc/mm/tlb-radix.c         | 12 ++++++------
 arch/s390/include/asm/cpacf.h       |  2 +-
 arch/x86/Kconfig                    |  3 ---
 arch/x86/Kconfig.debug              | 14 --------------
 drivers/mtd/nand/raw/vf610_nfc.c    |  2 +-
 include/linux/compiler_types.h      |  3 +--
 lib/Kconfig.debug                   | 14 ++++++++++++++
 14 files changed, 38 insertions(+), 37 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
