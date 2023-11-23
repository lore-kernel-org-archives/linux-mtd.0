Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEF5C5AD4C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Nov 2023 11:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWOpSlvxL+iq4dk1qlg6DNxU0oTFOwNqO4OB5l/7I/M=; b=Py/lLqpQymFLJA
	albIuNE1jqNKqcTEB74qchgPXeSI8C+iCcmBeBgOK7pQ1EQH/Fq2XarlU8/AsjWBM0ks9QPegqlXK
	0vzH1FGtMb61PI292o2y6NL5IV0uBqoPPhSTPMSYmmn6wxWgrYVZAeCadDTjM4AljGCeuM1BRQQCa
	VKVh58qk2U3hev6Dj64QosPulPK6mk6zX3bxKc/2AA5shrFcfWfKGoPWhBi/4vc1zgzQhkwc/rQIm
	W1M7/iwF+ZrV35sQR7hLkU6AqBR7c+7+U9EFSB+GqUDxYUPKWrGPt2Hr+XNwTdgkK2UchPZp5WSAF
	gbU8F+naGb19mx5UqI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67X5-004T0I-1E;
	Thu, 23 Nov 2023 11:06:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67X1-004SxD-1O
	for linux-mtd@lists.infradead.org;
	Thu, 23 Nov 2023 11:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 03DAFB82B66;
	Thu, 23 Nov 2023 11:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43DDC43395;
	Thu, 23 Nov 2023 11:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700737561;
	bh=9L6ia8ZbTYYVbHNB3z9LNyIFtb/pxWEiG5AGGJleqic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0VyQ7PVXrgpHxXuRmTV8Wg6u7K/HjAAIEfu11YSMUUXsJVeV978M2gskJD8Avjb9
	 ZB5kV6SE67ZAx7fc43cvAKQQcnfZ1BWg4eFGZWUJqIa5on//kgER/9tce+AIoFXgWk
	 zowoZ5/rblNmUh7+n5DSkzof8B68ftWfi/4Bm3uFFM0OiYY9QfU9s/13gVPYGrLWfP
	 dYIN19g0XPcGf5Nmb7Sg/RV1aH2dS4Rz+E9fs2rc8A8QVIcjSUPFmn5jrJzTXH3nKB
	 fJcaV7yYwcK455NpW2ijR7YUCQVt+9Wq2658RaYTVnp6PTXXmkAhjphLHV/fQylLef
	 elAqGL5fRFABA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Matt Turner <mattst88@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	Rich Felker <dalias@libc.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-usb@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Kees Cook <keescook@chromium.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 6/6] Makefile.extrawarn: turn on missing-prototypes globally
Date: Thu, 23 Nov 2023 12:05:06 +0100
Message-Id: <20231123110506.707903-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123110506.707903-1-arnd@kernel.org>
References: <20231123110506.707903-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_030603_733778_FDA75538 
X-CRM114-Status: GOOD (  18.02  )
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
index 1527199161d7..8e9170f932ea 100644
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
