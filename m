Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EFBC61D85
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Nov 2023 11:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bxyL+Tm+JQSAcVxd+Hg1Y+NBhl+wFI9igcqC3JO3Xbo=; b=idGlAZQUezys4n
	RS+H45KGiDuPiq+O9WMGNdLx52jjkYQVaV7e1+rI+hp5leulz7dvj3HuDAGozWVF62OmnrbwxmLJC
	8Jp+nK0Q3nr9c2cLcsE3wjs9sA6fJPVwp4HVS26RUswrNppal3mcMshKRSu+z8hk9OQ13q1AwFgDH
	u5BENvVVBy4KNhagVZYwCN+JOCad4stuFZ4JYwaP17SKe6HQqthmkG7Q3Jl74wOj43RZuXj5eH2i+
	e/pSWBDkH+Ye2NitGLNHx5hfOn3rYyPch5pUUwGn0yGgEJL3tdSAAbT26V1hssnmae+mc27FDiySb
	YPpracLiye44seQR4xMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67WT-004Sei-22;
	Thu, 23 Nov 2023 11:05:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67WQ-004Scq-1m
	for linux-mtd@lists.infradead.org;
	Thu, 23 Nov 2023 11:05:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79F28CE274E;
	Thu, 23 Nov 2023 11:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C85C433C7;
	Thu, 23 Nov 2023 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700737521;
	bh=kmSnZk3RczC2wW7hFftznkdHr9ZkDg70PDOUA+ZVjaE=;
	h=From:To:Cc:Subject:Date:From;
	b=M9YhBGVoZhY2hbzM62ATfyVt/7tQ/oQ/qZpdbJ2qea36LpolKDbmowhX0AC5g7lLk
	 sieaJZf1+aJIe6RlnZFwpUWbe/PNidPyvX1032SN/Lwqzuba5orpijIZqVQRxHnO8W
	 LRftkoW7bXxIrXatQbuFQGzAdw2elNRJIxC3rIjn2qQVQcfC9JkzCiX6xGNFCITeE3
	 AOg4JIWtddSPTOo6FzQGoFztM6o4Hy4i/nts34VgnTPpGB8h4PDw8YDdN3d0w6RELS
	 lnxhloqHqGtyXUCmF3Imyl4OpgK7uvUX4NtIedFziLAPEYOAuGarmedGM1FejKTB+G
	 xC85zbozSZrPA==
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
	x86@kernel.org
Subject: [PATCH v3 0/6] Treewide: enable -Wmissing-prototypes
Date: Thu, 23 Nov 2023 12:05:00 +0100
Message-Id: <20231123110506.707903-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_030527_045914_AB79A643 
X-CRM114-Status: GOOD (  19.33  )
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

Hi Andrew,

I think all other patches I have sent for -Wmissing-prototypes have made it
into linux-next by now, these ones either got an Ack from the respective
maintainers, or never got a reply. I just merged a few patches from my
previous series into the asm-generic tree, these are not in linux-next
today but should be for the next next. I also resent the powerpc patches
to make sure they get merged soon.

Can you pick these six up into -mm for v6.8?

Quoting from my description to patch 6/6:
  "At this point, there are five architectures with a number of known
   regressions: alpha, nios2, mips, sh and sparc. In the previous version
   of this patch, I had turned off the missing prototype warnings for the 15
   architectures that still had issues, but since there are only five left,
   I think we can leave the rest to the maintainers (Cc'd here) as well."

The series is also likely to cause occasional build regressions on linux-next
as developers add new code that misses prototypes. Hopefully this should
be resolved by the time the patches make it into a release and everyone
gets the warnings right away.

    Arnd

Arnd Bergmann (6):
  ida: make 'ida_dump' static
  jffs2: mark __jffs2_dbg_superblock_counts() static
  sched: fair: move unused stub functions to header
  x86: sta2x11: include header for sta2x11_get_instance() prototype
  usb: fsl-mph-dr-of: mark fsl_usb2_mpc5121_init() static
  Makefile.extrawarn: turn on missing-prototypes globally

 arch/x86/pci/sta2x11-fixup.c     |  1 +
 drivers/usb/host/fsl-mph-dr-of.c |  2 +-
 fs/jffs2/debug.c                 |  2 +-
 kernel/sched/fair.c              | 13 -------------
 kernel/sched/sched.h             | 11 +++++++++++
 lib/test_ida.c                   |  2 +-
 scripts/Makefile.extrawarn       |  4 ++--
 7 files changed, 17 insertions(+), 18 deletions(-)

-- 
2.39.2

Cc: "David S. Miller" <davem@davemloft.net>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rich Felker <dalias@libc.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: x86@kernel.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
