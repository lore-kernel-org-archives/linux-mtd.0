Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D68C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 13:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKNhp9XjmHCf6Pq4ZUh7ZVRoVTT4EfBKlFAyiia7ZUc=; b=VObSxJlnsLLzlS
	Pq+4BiD/8qyjL5TCjwy8vJi65ECclGCcF99A0Ino4tVkhpx05yEHU2dlkYvWyVqVx4emJThLpXAMO
	wXCOGR4BzONYoCrl4HIMhzteBtXYy2CTEPIecK8GeA7oQtpjUVA0r/7HlWpuql4ME1cv/pvtMYIBO
	a7iTaLKyTl39QU/Op9RoGPv9XWCAAFP/h0xi1CuisdKp5A2DGPHL2rVkDAKW+8SZx74ZV8OiVoWRJ
	QV3IHNATEiVvYSjU8WDBXmILAtITTEyZyIYUqt1Fwnlg6Nv7NmPuDPk9jJp/pIKUHEoxYwl/K68tw
	DHJQLQun9WVj0niQ/ZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iEU-003sz0-1d;
	Wed, 08 Nov 2023 13:04:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iEL-003sqF-25;
	Wed, 08 Nov 2023 13:04:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EF897B81C6B;
	Wed,  8 Nov 2023 13:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9689C433C9;
	Wed,  8 Nov 2023 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448663;
	bh=kegMIl+DMnSqVAHEcD2O4VmQR89XR3LaLbspvw04Tng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eNsPlZDJtmEkAPMbBG5R4qhHte1qNJj5hivdXnhMnQEYxjWoPW4joiDtxOU68W74A
	 xYdGgBhCICOT3rUTOeUYm0Hc/0LeKHn3J/Gekc8+KTnNnPXVjHuBsHwOaN69BFuuvL
	 wN1TtfsrekXIsK010uWdjCGU5Ld5U7BPhDH+yIeFwi0DnKAb/YUl2oaW2yuZulDgnz
	 pUDyk70EhXQiruCjugsUuCxET23RnQ3wREunYYRXMrJO64AqO0M74uvMADhK6JM0RJ
	 aJLD9+iPedZDT4sOV2VEhIsUeQxuPkYhEBdNhQp3p2/UHNMVvYSvjwsw+1CsJtL+wm
	 Cl+RPNk7mv6uQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	Helge Deller <deller@gmx.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Timur Tabi <timur@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	David Woodhouse <dwmw2@infradead.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Al Viro <viro@zeniv.linux.org.uk>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-bcachefs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 22/22] Makefile.extrawarn: turn on missing-prototypes globally
Date: Wed,  8 Nov 2023 13:58:43 +0100
Message-Id: <20231108125843.3806765-23-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_050425_975067_5D282453 
X-CRM114-Status: GOOD (  19.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Over the years we went from > 1000 of warnings to under 100 earlier
this year, and I sent patches to address all the ones that I saw with
compile testing randcom configs on arm64, arm and x86 kernels. This is a
really useful warning, as it catches real bugs when there are mismatched
prototypes. In particular with kernel control flow integrity enabled,
those are no longer allowed.

I have done extensive testing to ensure that there are no new build
errors or warnings on any configuration of x86, arm and arm64 builds.
I also made sure that at least the both the normal defconfig and an
allmodconfig build is clean for arc, csky, loongarch, m68k, microblaze,
openrisc, parisc, powerpc, riscv, s390, and xtensa, with the respective
maintainers doing most of the patches.

At this point, there are five architectures with a number of known
regressions: alpha, nios2, mips, sh and sparc. In the previous version
of this patch, I had turned off the missing prototype warnings for the 15
architectures that still had issues, but since there are only five left,
I think we can leave the rest to the maintainers (Cc'd here) as well.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: linux-alpha@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Link: https://lore.kernel.org/lkml/20230810141947.1236730-1-arnd@kernel.org/
Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.extrawarn | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 2fe6f2828d37..c9725685aa76 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -17,6 +17,8 @@ KBUILD_CFLAGS += -Wno-format-security
 KBUILD_CFLAGS += -Wno-trigraphs
 KBUILD_CFLAGS += $(call cc-disable-warning,frame-address,)
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
+KBUILD_CFLAGS += -Wmissing-declarations
+KBUILD_CFLAGS += -Wmissing-prototypes
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
@@ -95,10 +97,8 @@ export KBUILD_EXTRA_WARN
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wextra -Wunused -Wno-unused-parameter
-KBUILD_CFLAGS += -Wmissing-declarations
 KBUILD_CFLAGS += $(call cc-option, -Wrestrict)
 KBUILD_CFLAGS += -Wmissing-format-attribute
-KBUILD_CFLAGS += -Wmissing-prototypes
 KBUILD_CFLAGS += -Wold-style-definition
 KBUILD_CFLAGS += -Wmissing-include-dirs
 KBUILD_CFLAGS += $(call cc-option, -Wunused-but-set-variable)
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
