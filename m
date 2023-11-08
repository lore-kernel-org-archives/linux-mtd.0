Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7D2C4167D
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 13:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ri1oLDGph8h7GgytoSSlCIaIr0gD4yb/sEBdR4x11Xg=; b=ulTNUUJJtOmRv8
	GFjelwCgZbh/xYkjbSNASY2xuGpXBO2YKGHhWoyWivGh/OBRS6wF4e7QxnFj0E+lhPx6+xEK5WWZO
	FKyMliCXDPQ4JNS4Awv/hbmIZXsvJRm2Q6LieCgOgyWnoA3NYQBO1dM4A2cLOHC1mGFZ4GrU8vrwg
	27KH2sMkWaW4Nwr58DLTMWQHKIsI9Yt8BwNENbw6i5yfYu5P7SxDvD3G+63VVtc3OajoI4AVGrJ2b
	lHDKflQAmYm59D7w4unApoy0WT1DGNmuKiJ3bq5D7WQVWR8sYh0LmMnIbgcdYAfuXtk4alkaka94x
	V/8EHYpaF50TzznTIgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iDE-003rt7-0l;
	Wed, 08 Nov 2023 13:03:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iDB-003rqr-2A;
	Wed, 08 Nov 2023 13:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n8VbDfB1THuS40zTwMT1gS25/+RJvBHGREisAcNOM9Y=; b=eC0d++MQFnLuWveaSyshCGZv7h
	/9Zf8tWFCohWoEvtLr+kv7jCDXUwztWiDVB2KcCTrqW9mO23NYPNcLIm1HJqk+wMJ74FIk6TsRymL
	Ezq++ibyqu8U4HITWnb6kx7UyS3plDa8mIoT2Dtzu4sOVuI1+yGb1hWkO2BBOrHqGzi7Jq5CJg76H
	yeOZ6b7GLU0jAH2+J4GYogcs2LJy88hWNJCL9vEfbhsLuBzexFbqgbzDgw+6oN3gFi3W4ytsPxsPb
	IlLwmggxGyOO6N/R0a1wlFj/pv6Wlu2hiplA2J5AZL58nDWdl7HEkEqaTsBY8uMAuW2k851FZYaCY
	BBvsH+VA==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iD8-00DUkF-0t;
	Wed, 08 Nov 2023 13:03:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F2379B81C63;
	Wed,  8 Nov 2023 13:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF2DC433B7;
	Wed,  8 Nov 2023 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448578;
	bh=IRNty8bJM+niG8y7TBztVYxFiP9MOAPlR8MjQa49+Bw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tmkBSJz3VYamotMcUSRYyVTJpKvyfH4SHq0C7FsCwyVNJ4KSrjVdqRD1v6Vxxe82p
	 MDc+Ta93r+CP7Di/Lj3tgf4btUtVcvWpA5v1wYl+QZ79Q5M8Wxv+Nw37+wWUZQ0Ko+
	 HwJSB2Gx0RTGQ5mb+Isxh4TM28m0294JSbD9RIqZp4BVElmbGaNHuRy/I5r+moeoP1
	 jCPaRo+RI83CtzxivdPD9wuzUbwRYtugqoZQvm3FEgnbzPIOJkizQnk58xDA/6Fp2d
	 /ZO83W53G1V8AJ7fPeSVog3x78qsVn62ZKg1xrU4i9wzYrO9YJLHj3O6H5fDNPp6Ge
	 1WoDxE5NsDvGw==
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
Subject: [PATCH 16/22] bcachefs: mark bch2_target_to_text_sb() static
Date: Wed,  8 Nov 2023 13:58:37 +0100
Message-Id: <20231108125843.3806765-17-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_130310_488384_3DA163FD 
X-CRM114-Status: GOOD (  14.70  )
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

bch2_target_to_text_sb() is only called in the file it is defined in,
and it has no extern prototype:

fs/bcachefs/disk_groups.c:583:6: error: no previous prototype for 'bch2_target_to_text_sb' [-Werror=missing-prototypes]

Mark it static to avoid the warning and have the code better optimized.

Fixes: bf0d9e89de2e ("bcachefs: Split apart bch2_target_to_text(), bch2_target_to_text_sb()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/bcachefs/disk_groups.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/disk_groups.c b/fs/bcachefs/disk_groups.c
index d613695abf9f..1f334124055b 100644
--- a/fs/bcachefs/disk_groups.c
+++ b/fs/bcachefs/disk_groups.c
@@ -580,7 +580,7 @@ void bch2_target_to_text(struct printbuf *out, struct bch_fs *c, unsigned v)
 	}
 }
 
-void bch2_target_to_text_sb(struct printbuf *out, struct bch_sb *sb, unsigned v)
+static void bch2_target_to_text_sb(struct printbuf *out, struct bch_sb *sb, unsigned v)
 {
 	struct target t = target_decode(v);
 
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
