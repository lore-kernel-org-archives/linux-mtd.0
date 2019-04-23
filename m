Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA964C10F14
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:51:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BF7120811
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 03:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hC0sXmO9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="1FHfUtFy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BF7120811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FdWrsbjGUvxukQ++zd1W8w4Sr4MyaBOlHuWQ8i1TEQk=; b=hC0sXmO9t1U9tH
	Y6b3RFdjJn33Z4hyP0njlER1R3Drkr6DgczU6zk88GnR//hcuMojR87f73Q2L/Xo8Y7Yf0V1lMnle
	asG6EWpxOyG8jnnNQAPRlnk6lpj2UqMEORn3kZHLKwkyVLjjvIhl+tqfI6WO+zkE99O2ukElrFO9d
	mYmZMA2Gpsz880p63w6i4yTg89PV+xHD22rkWimR5J2MvDSNp0jXNATYhoINLRHoIvbGgaCagq8aX
	VUCSS6X8Tl567/Yu5nBPeye04rpPj3KpfNl6rRUQeBjWMQjhKGI40FmnllgpVs2nffWfSGh7fvco7
	nlYo3P+lGK1e7TVo3ytQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hImTI-0007wq-Qd; Tue, 23 Apr 2019 03:51:52 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hImS6-0006Ne-4g; Tue, 23 Apr 2019 03:50:41 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x3N3o2c8023044;
 Tue, 23 Apr 2019 12:50:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x3N3o2c8023044
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1555991403;
 bh=FNY6rrYiMoGD+jWcwwTPcNklqzGYY9hI0s3WFij8l94=;
 h=From:To:Cc:Subject:Date:From;
 b=1FHfUtFyY0SiKsXjLWk3/Z/TDGYdjXcM8rtYlgQhRAA7ymhB/30QNo3As0bXwA/e/
 AEQ32Bc6b9gd2+pGmAF70ERzX91lPgBWG5NCzkVF4YfmgEql2MEpaNG1J7io/ab7i0
 A1qcxsYxaQNymoLaeyL1OC4CAVoT2s4dukYC9IR6jFCehOiqTJUpjKw1mTwkCaxvJ8
 2xaC3GkbJu1vjCOBIVcG1lzrnWcUhwcBK2dg4Lm2kR7DyeoJMmrgY2OSjRvmovwaVQ
 6ueL3qERb4Uf5vvBJuxVleXemHpAhcAGrxEGSOu+ij3WRDedv0e05ubg3BXBpBgkpe
 n8gzpxdSaFfhA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>
Subject: [RESEND PATCH v3 00/11] compiler: allow all arches to enable
 CONFIG_OPTIMIZE_INLINING
Date: Tue, 23 Apr 2019 12:49:48 +0900
Message-Id: <20190423034959.13525-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_205038_488578_4AF941B7 
X-CRM114-Status: UNSURE (   7.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Major changes in v3 RESEND:
 - I accidentally dropped the first patch.
   I am resending with the correct patch set.

Major changes in v3:
 - Fix link error for arch/mips/configs/ci20_defconfig

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
  MIPS: mark __fls() and __ffs() as __always_inline
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
 arch/mips/include/asm/bitops.h      |  4 ++--
 arch/mips/kernel/cpu-bugs64.c       |  4 ++--
 arch/powerpc/kernel/prom_init.c     |  6 +++---
 arch/powerpc/mm/tlb-radix.c         | 12 ++++++------
 arch/s390/include/asm/cpacf.h       |  2 +-
 arch/x86/Kconfig                    |  3 ---
 arch/x86/Kconfig.debug              | 14 --------------
 drivers/mtd/nand/raw/vf610_nfc.c    |  2 +-
 include/linux/compiler_types.h      |  3 +--
 lib/Kconfig.debug                   | 14 ++++++++++++++
 14 files changed, 39 insertions(+), 38 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
