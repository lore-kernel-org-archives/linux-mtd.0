Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A88C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H7t87aUx1GvSxlOVK3QlKK0PNJEZSoejDXxt8q/xfzw=; b=YHiIvqEcVHcjUF
	NtEgCA3CjVZ80+tbAr+EyNXb3RWeNBtrcfebC46p8kIMcJY/Ec4m2CPsY87ZrqtxJCyNyuh+R7ctH
	oFp5NZxSk0wqo78WNwQqgH+KVv6YY6TmDSgrO59lwmniZTZeeAn17x4XS33BRTgBFmjdCuMtN0mEa
	VSS+I3Vsui5WCsV8i9UV6k9H+ndyI5bKuzUP5tMth9GtKPRMq4z7ZwhR5rAKDiMenukWct3RrEZlV
	RwmCraFLZLhI/k4ndRiIOQYVZd72C9+Tl6ypsesifiZ8ZB0s0kYGzbIKI2d/GPa8/hf2ofBdWegMK
	OBaf/OpRct/0rsE3r9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jLE-003zIH-0S;
	Wed, 08 Nov 2023 14:15:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iDC-003rrC-2N;
	Wed, 08 Nov 2023 13:03:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10F00B81C66;
	Wed,  8 Nov 2023 13:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA9AC433C9;
	Wed,  8 Nov 2023 13:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448592;
	bh=8u/is9yGIjCKvKH616JPDZxQp4kevRf+hbF66shzciw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rEbp+ATJ8TL9tb/LlyZhDPrzGSoac6GqEtllIoknZuh3HS0PBjJ7Uq/p/fm1nXndd
	 5z95k+15Z7EVhKI2k5WFN6+zT6Dcx9LlXxtd8jGTglWA4ZtuBnSsS18mrcef8iCZsu
	 ZdGdKwnX74k42PjMs3bX54mFIVVH+UaUx6HnTk2bpX6YvZuyIqNVw1i69bKcDM+kx8
	 0QhbxPOnkVCFn+1IoJLaaDxqLtMx+o9VlbUNRag9/FUeK+64zJfYk6BL3buGhjE4FE
	 mVN9tNfFpgp0GOm3gK9WgCB6E7ONWa5a1WiaxBVRuDniK5TMae0M2X3SRFJE7qtIKk
	 B7Fo7+w6HCt9A==
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
Subject: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
Date: Wed,  8 Nov 2023 13:58:38 +0100
Message-Id: <20231108125843.3806765-18-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_050315_112581_09C5DB3A 
X-CRM114-Status: GOOD (  14.48  )
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

Allmodconfig kernels produce a missing-prototypes warning:

arch/powerpc/platforms/ps3/gelic_udbg.c:239:6: error: no previous prototype for 'udbg_shutdown_ps3gelic' [-Werror=missing-prototypes]

Move the declaration from a local header to asm/ps3.h where it can be
seen from both the caller and the definition.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/ps3.h               | 6 ++++++
 arch/powerpc/platforms/ps3/gelic_udbg.c      | 1 +
 drivers/net/ethernet/toshiba/ps3_gelic_net.h | 6 ------
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/ps3.h b/arch/powerpc/include/asm/ps3.h
index a5f36546a052..d13d8fdc3411 100644
--- a/arch/powerpc/include/asm/ps3.h
+++ b/arch/powerpc/include/asm/ps3.h
@@ -514,4 +514,10 @@ u64 ps3_get_spe_id(void *arg);
 
 void ps3_early_mm_init(void);
 
+#ifdef CONFIG_PPC_EARLY_DEBUG_PS3GELIC
+void udbg_shutdown_ps3gelic(void);
+#else
+static inline void udbg_shutdown_ps3gelic(void) {}
+#endif
+
 #endif
diff --git a/arch/powerpc/platforms/ps3/gelic_udbg.c b/arch/powerpc/platforms/ps3/gelic_udbg.c
index 6b298010fd84..a5202c18c236 100644
--- a/arch/powerpc/platforms/ps3/gelic_udbg.c
+++ b/arch/powerpc/platforms/ps3/gelic_udbg.c
@@ -14,6 +14,7 @@
 #include <linux/ip.h>
 #include <linux/udp.h>
 
+#include <asm/ps3.h>
 #include <asm/io.h>
 #include <asm/udbg.h>
 #include <asm/lv1call.h>
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.h b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
index 0d98defb011e..0ec7412febc7 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.h
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
@@ -346,12 +346,6 @@ static inline void *port_priv(struct gelic_port *port)
 	return port->priv;
 }
 
-#ifdef CONFIG_PPC_EARLY_DEBUG_PS3GELIC
-void udbg_shutdown_ps3gelic(void);
-#else
-static inline void udbg_shutdown_ps3gelic(void) {}
-#endif
-
 int gelic_card_set_irq_mask(struct gelic_card *card, u64 mask);
 /* shared netdev ops */
 void gelic_card_up(struct gelic_card *card);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
