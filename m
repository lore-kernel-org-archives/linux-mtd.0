Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4230C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 13:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsZwA2ouxX3WUbF2DZifq7zONrPyENyaWEVdDTWb6Mw=; b=4IHlRMGbmvdOv1
	RmIXu4p2k/tNTbiCmvaYnq7SDnpyW4CCQ+n6MX7EJiIUjbr43RTsIPLVY3X8RUZMVCWap+qq2NmIN
	gRsJFufg3krwCqEMVAQbmo6GZP1S/pXoXj5SvIt0nhZe2j+kBx/GAha6kS1XHTDGUCiQy6Rf8uLOe
	MGuUi0Hqj7ufr7IDqIr79RRFBPMqM6MSy6Xu7rPfsg8IsEX2ibQ3ElrgN28+r49WtQgWRCPLW/iDF
	d9ItAyuqC1CK945W1eobgp701FbtrjnvQZB2dHxBBCSVHBBF1SZN+OyXsKV64SvscqYj6twtC2sV7
	CUwdNtx393dBx3DMkugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iAi-003pj7-27;
	Wed, 08 Nov 2023 13:00:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iAd-003pes-2Z;
	Wed, 08 Nov 2023 13:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3F15ACE109D;
	Wed,  8 Nov 2023 13:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3C9C43395;
	Wed,  8 Nov 2023 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448431;
	bh=K9YdPzoARD4njnEo80jUrY+DZkb+0aAdqYzClA8UgAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HyUdTwUXtZOlnyvxdNKc+kj+jb0JvSjpSyNuNfinD/hOMX3R5j5WCRvrkFeKCIoaK
	 dck1LhuXouzgxrjEZ+GfXmwACWuIHu7Z5T4tv5Ur3mBUern292mV3o4hHeM6goJmTl
	 07hDeR7Iqhwa3/f+qzmGQajf1dFdpx/z/q8jYxJI4nnayQSqsNQMlgpL0fthML/+e1
	 RUA1p/Ek88IwoPkFfFrEZT9/Y2MOyc8v/2srZE3JErq77d73XQLbdWL9p5SFFwRzqp
	 V4Zk/JhktD/mAeNqOSIIMV3pGJDyvfJKmq7usGaEaG4ltRDerYT+4+zq3kRGWGhqoG
	 rX6LOl910Dk3Q==
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
	linux-mtd@lists.infradead.org
Subject: [PATCH 06/22] [RESEND] stackleak: add declarations for global functions
Date: Wed,  8 Nov 2023 13:58:27 +0100
Message-Id: <20231108125843.3806765-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_050036_205940_5080DF72 
X-CRM114-Status: GOOD (  13.77  )
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

With -Wmissing-prototypes enabled, the stackleak code produces a couple of
warnings that have no declarations because they are only called from assembler:

stackleak.c:127:25: error: no previous prototype for 'stackleak_erase' [-Werror=missing-prototypes]
stackleak.c:139:25: error: no previous prototype for 'stackleak_erase_on_task_stack' [-Werror=missing-prototypes]
stackleak.c:151:25: error: no previous prototype for 'stackleak_erase_off_task_stack' [-Werror=missing-prototypes]
stackleak.c:159:49: error: no previous prototype for 'stackleak_track_stack' [-Werror=missing-prototypes]

Add declarations to the stackleak header to shut up the warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/stackleak.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/stackleak.h b/include/linux/stackleak.h
index c36e7a3b45e7..3be2cb564710 100644
--- a/include/linux/stackleak.h
+++ b/include/linux/stackleak.h
@@ -14,6 +14,7 @@
 
 #ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 #include <asm/stacktrace.h>
+#include <linux/linkage.h>
 
 /*
  * The lowest address on tsk's stack which we can plausibly erase.
@@ -76,6 +77,11 @@ static inline void stackleak_task_init(struct task_struct *t)
 # endif
 }
 
+asmlinkage void noinstr stackleak_erase(void);
+asmlinkage void noinstr stackleak_erase_on_task_stack(void);
+asmlinkage void noinstr stackleak_erase_off_task_stack(void);
+void __no_caller_saved_registers noinstr stackleak_track_stack(void);
+
 #else /* !CONFIG_GCC_PLUGIN_STACKLEAK */
 static inline void stackleak_task_init(struct task_struct *t) { }
 #endif
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
