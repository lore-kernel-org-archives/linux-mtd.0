Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB02C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBbbjH6/+VMGlrLxo8XoMtszOKKwJSIBrKG/WVK1atk=; b=iODfL6ZNNW9Opj
	h833Px9qphRdEWsERcxXEPdMNesszGdhsGiLeypfJhOJIk2fwzXrGEjSMy/70YopgYmEfOErPkpfJ
	vnRk5RpMXpqECblpI9nl3MMz3JG+mD3Vqx6uNHKu2dkQ3G0LbY/gItS9hN1TcOBwn1EcWHQ+4wvWe
	MYIM94EthnDwvgFqxz7seXXHG+69SkP3kqfHfSpMiBsf0Z1D2QwV/FnZ+DCbk87Lj/76vHPltb33A
	ILPeXBGPm67i+57JIVDawDJOXWFiZLz8GuEu01skELcENC4KIe0uH1PnAq82GzSaoP1UqAI9tH9KU
	FCBZqJUQeja3t8xz1/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iCe-003rJY-0C;
	Wed, 08 Nov 2023 13:02:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iCW-003rCB-28;
	Wed, 08 Nov 2023 13:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CD0F2B81C62;
	Wed,  8 Nov 2023 13:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B392C433AB;
	Wed,  8 Nov 2023 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448550;
	bh=FgQWzkXF32qk/tCKQVUHf66ICQzLmXK/yCMtqaYVSN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATCV0SJUwSUIUcmIUsNFO1nBVzSdvp/LWTE5vG4buRgpe3Rwh1Y3dyl+cAW9SJEPK
	 LgX1p25vA4s2+ADl72IXSQOOTjzHz5keTaVsHX8pgaq1IEPWWxeKlMtMVMVaC2vQKe
	 Ws6+2JIfEnZ/R4XXaQ+IRWTmsubg+Hdo1lbZXemwfoXinRx3ZmHg94gmpjM/za6cnA
	 1ZY2IWqHrjYbCn3e3pFdfryRLkTz+IvcfC2uUzHfAFoLwSxsHbxMw7BDYe27fzcOJI
	 /AFASuBgsZvOI7gHnDAux0k0HCEaJF6CKhwJwUqhhusQZYHGKC4wMrmpGOYPfPqRmz
	 7w6Vzgrt36F+g==
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
Subject: [PATCH 14/22] arch: add missing prepare_ftrace_return() prototypes
Date: Wed,  8 Nov 2023 13:58:35 +0100
Message-Id: <20231108125843.3806765-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_050233_003582_D9AFD95B 
X-CRM114-Status: GOOD (  16.55  )
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

The prototype for prepare_ftrace_return() is architecture specific and
can't be in a global header. Since it's normally called from assembly,
it doesn't really need a prototype, but we get a warning if it's missing:

arch/csky/kernel/ftrace.c:147:6: error: no previous prototype for 'prepare_ftrace_return' [-Werror=missing-prototypes]
arch/microblaze/kernel/ftrace.c:22:6: error: no previous prototype for 'prepare_ftrace_return' [-Werror=missing-prototypes]
arch/mips/kernel/ftrace.c:305:6: error: no previous prototype for 'prepare_ftrace_return' [-Werror=missing-prototypes]

Add the prototypes for the three architectures that don't already have
one in asm/ftrace.h.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/include/asm/ftrace.h       | 4 ++++
 arch/microblaze/include/asm/ftrace.h | 1 +
 arch/mips/include/asm/ftrace.h       | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/arch/csky/include/asm/ftrace.h b/arch/csky/include/asm/ftrace.h
index 9b86341731b6..fd215c38ef27 100644
--- a/arch/csky/include/asm/ftrace.h
+++ b/arch/csky/include/asm/ftrace.h
@@ -26,5 +26,9 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 
 struct dyn_arch_ftrace {
 };
+
+void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
+			   unsigned long frame_pointer);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __ASM_CSKY_FTRACE_H */
diff --git a/arch/microblaze/include/asm/ftrace.h b/arch/microblaze/include/asm/ftrace.h
index 6a92bed37794..4ca38b92a3a2 100644
--- a/arch/microblaze/include/asm/ftrace.h
+++ b/arch/microblaze/include/asm/ftrace.h
@@ -10,6 +10,7 @@
 #ifndef __ASSEMBLY__
 extern void _mcount(void);
 extern void ftrace_call_graph(void);
+void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr);
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE
diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
index db497a8167da..dc025888f6d2 100644
--- a/arch/mips/include/asm/ftrace.h
+++ b/arch/mips/include/asm/ftrace.h
@@ -85,6 +85,10 @@ struct dyn_arch_ftrace {
 };
 
 #endif /*  CONFIG_DYNAMIC_FTRACE */
+
+void prepare_ftrace_return(unsigned long *parent_ra_addr, unsigned long self_ra,
+			   unsigned long fp);
+
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_FUNCTION_TRACER */
 #endif /* _ASM_MIPS_FTRACE_H */
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
