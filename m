Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB72AC83F33
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuGnxa4TzZzd3EE7P6TCqjlydIaYdcAJWH8yUnawoGs=; b=agIo1CSyEi4uaN
	+TGV3V4mHFF5EqOk//DQxXZKjBP9el2lLm6EoT/kncLpm6O6pVn4Pgoxguxf3X/5hEmVO5AWmGbrC
	t3PDPQSi5+TMeyKMDuTs4x1qk7IqRismmyc43y0Iw0jiK6ExFwlUHsSwzUe7IZ910QPmpl/HAE9SA
	OLvKdRelyXRas2gP+aWGJgp1gNWuaErN8/VTno0/1mAOHbQyuV6JyUAkPeAYXxpqMKOsySOnq8wnv
	ODKFin9/GhctPOXNXd5To9XABJqq3kd7amq6bYpoEsaHZA1JR3SGbK11JKqyng0E99x3g1DLb/gcr
	mHPVAmreDZKpMheDmSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgd-00FBPv-1X;
	Thu, 31 Aug 2023 11:18:07 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgV-00FBLK-2J
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 11:18:03 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
	by andre.telenet-ops.be with bizsmtp
	id gBHs2A00d3874jb01BHsCq; Thu, 31 Aug 2023 13:17:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgC-0026uz-7u;
	Thu, 31 Aug 2023 13:17:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgO-00CHY3-NZ;
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
Subject: [PATCH/RFC 4/4] ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled
Date: Thu, 31 Aug 2023 13:17:47 +0200
Message-Id: <20eb4e7fca9c41a34500fc5984602b41006b4575.1693409184.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693409184.git.geert+renesas@glider.be>
References: <cover.1693409184.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_041759_939676_8C8820A6 
X-CRM114-Status: GOOD (  13.34  )
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

CPU core bringup on SH-Mobile AG5 uses the SYS Boot Address (SBAR) and
Address Translation Area (APARMBAREA) registers to specify the base
address and size of the boot area of the System CPU.  With this enabled,
when the System CPU accesses a physical address in the range from zero
up to the configured size, the top address bits are replaced by those
specified in the SBAR register.  Hence any device residing in this low
part of physical address space cannot be accessed.

Prevent conflicts by reserving this memory region using
request_mem_region().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/smp-sh73a0.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-shmobile/smp-sh73a0.c b/arch/arm/mach-shmobile/smp-sh73a0.c
index 453d488650295842..3757aed64c4241a5 100644
--- a/arch/arm/mach-shmobile/smp-sh73a0.c
+++ b/arch/arm/mach-shmobile/smp-sh73a0.c
@@ -44,10 +44,16 @@ static int sh73a0_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 static void __init sh73a0_smp_prepare_cpus(unsigned int max_cpus)
 {
-	void __iomem *ap = ioremap(AP_BASE, PAGE_SIZE);
-	void __iomem *sysc = ioremap(SYSC_BASE, PAGE_SIZE);
+	void __iomem *ap, *sysc;
+
+	if (!request_mem_region(0, SZ_4K, "Boot Area")) {
+		pr_err("Failed to request boot area\n");
+		return;
+	};
 
 	/* Map the reset vector (in headsmp.S) */
+	ap = ioremap(AP_BASE, PAGE_SIZE);
+	sysc = ioremap(SYSC_BASE, PAGE_SIZE);
 	writel(0, ap + APARMBAREA);      /* 4k */
 	writel(__pa(shmobile_boot_vector), sysc + SBAR);
 	iounmap(sysc);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
