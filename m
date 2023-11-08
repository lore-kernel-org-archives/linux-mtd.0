Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759E9C05022
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 13:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOh/oklFE8LGzut3+zrWdp2WRU456fqY91kqg7ZugAw=; b=rLBNgq8XDJDgfw
	lNaHS84JhhUA2iqkyQoWTpPyR3kO3h+fsKCbt8mIBtvwSjS2xduoP92uj1rgoQKa8RFoNaoct7uy9
	Ux+wuhJqfVizQx+xhUbAmSgX+F76ygIdE3ctOt98NqtEnZg0N7p+7SU6NxWHSDAhO1P6WdlcVLHA1
	rHpKUFwhzlf2aFcA4ysb1bbJcG6FISxKeuji62jkS7dIgK5es4pQ2BfKpNBCeMuTyQYM8Nn8EtfvI
	7sdeK30bCDDYgaDkclqxshh6YRGNKT+MtLH7CyPzFYft7h5QrmHVa1u8HtPEdyhc/0FWYWvHug2IK
	LF208tG3pfdYDsM9hmow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iAD-003pNB-16;
	Wed, 08 Nov 2023 13:00:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iA7-003pJH-0m;
	Wed, 08 Nov 2023 13:00:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D151615BA;
	Wed,  8 Nov 2023 13:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A176C433D9;
	Wed,  8 Nov 2023 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448402;
	bh=lWSNAkUa9zp9KaZHQMU5GW4zFS42gSKCMng8P6T4A2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6dgTgqdrhjCu/me4BW5zxGXxjkr3PVJ1avxPAZ6so0kvLG8+yeKS1POYYVMevcff
	 ej2TK9Qha2L8Mi7XQdRSl+xglVkhgvVrVNZW+ORQMvL9bwQhn8LizVhhMSOgSPns7u
	 JJyzzo+WsONP/YGaENuw0woNnreq3zT9OSDFf0LY703y2te6yNDmw7EQyq7guOhrXC
	 ObIXRkM7LuyUPJ5UZPajzeSUMzXsZ/oTNFS2AJ66D/lUMhyNIjeaTtoFkQGGCIJgxj
	 RCicg9Ci7MtSk8h1rZwozbVS6sb/U0v0rjiKUe13d/py/jMXF9uCJB9/QPCiHgI0di
	 LaebSIFDWfJMQ==
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
Subject: [PATCH 04/22] [RESEND] time: make sysfs_get_uname() function visible in header
Date: Wed,  8 Nov 2023 13:58:25 +0100
Message-Id: <20231108125843.3806765-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_050003_370981_495A75B1 
X-CRM114-Status: GOOD (  14.31  )
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

This function is defined globally in clocksource.c and used conditionally
in clockevent.c, which the declaration hidden when clockevent support
is disabled. This causes a harmless warning in the definition:

kernel/time/clocksource.c:1324:9: warning: no previous prototype for 'sysfs_get_uname' [-Wmissing-prototypes]
 1324 | ssize_t sysfs_get_uname(const char *buf, char *dst, size_t cnt)

Move the declaration out of the #ifdef so it is always visible.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/time/tick-internal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index 649f2b48e8f0..481b7ab65e2c 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -56,7 +56,6 @@ extern int clockevents_program_event(struct clock_event_device *dev,
 				     ktime_t expires, bool force);
 extern void clockevents_handle_noop(struct clock_event_device *dev);
 extern int __clockevents_update_freq(struct clock_event_device *dev, u32 freq);
-extern ssize_t sysfs_get_uname(const char *buf, char *dst, size_t cnt);
 
 /* Broadcasting support */
 # ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
@@ -197,3 +196,5 @@ void hrtimers_resume_local(void);
 #else
 #define JIFFIES_SHIFT	8
 #endif
+
+extern ssize_t sysfs_get_uname(const char *buf, char *dst, size_t cnt);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
