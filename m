Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C851EC83F10
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VNOnVQPEaspiLCCCf1cpH6Z7+oKU2LTILPm9TjIt+kE=; b=28kI68Zbq7kU+1
	0Ck8nPr7G+r1bccKvQkNO8dAx58HSvzlKigkgtazb7jao8kvn72I1RWxZSkBtLwRee1QpDXUVuSeg
	Oj8XwiZqkwyGGTazkEqk/w1/xTh0hN/yrac1UYGso91P2CSHRD9n3xdj/8eSjwzJE3pQasZ6Q+QRj
	yZ6Pxbigk8MuMDgBtrzgZgpG2VDE/ZSSQeNYtQ5UEOuewJb1RhC7WePtd2v4xxozbJzayZiePAy4O
	aduX9Go8Nj8v34XpE5tIzDbD8deaIUH2jcedsbdINdmHJdMHHt8V3xatPpCk2aefVdkSAque0/voF
	NCFROtV0CW6IAj1VW8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfga-00FBP9-1u;
	Thu, 31 Aug 2023 11:18:04 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgV-00FBLS-23
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 11:18:01 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
	by albert.telenet-ops.be with bizsmtp
	id gBHs2A00c3874jb06BHs8g; Thu, 31 Aug 2023 13:17:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgC-0026us-75;
	Thu, 31 Aug 2023 13:17:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgO-00CHXz-MS;
	Thu, 31 Aug 2023 13:17:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/4] ARM: shmobile: r8a7779: Reserve boot area when SMP is enabled
Date: Thu, 31 Aug 2023 13:17:46 +0200
Message-Id: <924961188abdf2adb52167edb7ed848a6efcca39.1693409184.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693409184.git.geert+renesas@glider.be>
References: <cover.1693409184.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_041759_813306_65929658 
X-CRM114-Status: GOOD (  12.91  )
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

CPU core bringup on R-Car H1 uses the ARM Reset Vector Address Register
(AVECR) to specify the base address and size of the boot area of the
System CPU.  With this enabled, when the System CPU accesses a physical
address in the range from zero up to the configured size, the top
address bits are replaced by those specified in the AVECR register.
Hence any device residing in this low part of physical address space
cannot be accessed,

Prevent conflicts by reserving this memory region using
request_mem_region().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/smp-r8a7779.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/smp-r8a7779.c b/arch/arm/mach-shmobile/smp-r8a7779.c
index 1bc609986c160d2b..2b1b8248450c8dd2 100644
--- a/arch/arm/mach-shmobile/smp-r8a7779.c
+++ b/arch/arm/mach-shmobile/smp-r8a7779.c
@@ -38,7 +38,14 @@ static int r8a7779_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 static void __init r8a7779_smp_prepare_cpus(unsigned int max_cpus)
 {
-	void __iomem *base = ioremap(HPBREG_BASE, 0x1000);
+	void __iomem *base;
+
+	if (!request_mem_region(0, SZ_4K, "Boot Area")) {
+		pr_err("Failed to request boot area\n");
+		return;
+	};
+
+	base = ioremap(HPBREG_BASE, 0x1000);
 
 	/* Map the reset vector (in headsmp-scu.S, headsmp.S) */
 	writel(__pa(shmobile_boot_vector), base + AVECR);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
