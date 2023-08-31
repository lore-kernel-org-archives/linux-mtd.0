Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D289C83F34
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpt3EYhA1734dGEFloi3S4sWTHWb0/7J2p9zFCn2paA=; b=Bhs5FjXn/79GnU
	Ade32qJjZIUxZHP9Dw4B4CmoLz3bXgs42FGbiE0laSeu1yvKNv4ziYNRvs23bJpHjY1rTJ6ME5mYU
	21ItgtNRCMFeW1Tio7GfF03jVnhVx2ldfzs0iKom7AHdq3XoxMrUnv/en6+9z3gjYm4t73GxVcCXL
	6bVw/zt1KtJtqGezegIwP7qWNjW5fE1gC+DtcR6q2ISj+W37Amz0+9iyKzribXYhsJN9xQcp5/Ffr
	5jhLSJOv2yAf+AA6fV2ZuTgsAkEqkw4aW/NOF73JTKEDIP2cfPzeKbwNGn93l1bQpSL36l4DAgdjE
	+7clS/Qxr/UTIsP98TOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgg-00FBS1-1J;
	Thu, 31 Aug 2023 11:18:10 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgV-00FBLJ-2G
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 11:18:04 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
	by andre.telenet-ops.be with bizsmtp
	id gBHs2A00b3874jb01BHsCo; Thu, 31 Aug 2023 13:17:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgC-0026up-6P;
	Thu, 31 Aug 2023 13:17:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgO-00CHXu-LD;
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
Subject: [PATCH/RFC 2/4] ARM: shmobile: rcar-gen2: Reserve boot area when SMP is enabled
Date: Thu, 31 Aug 2023 13:17:45 +0200
Message-Id: <091150233acb0557a2ad3294d67b2adb6758670c.1693409184.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693409184.git.geert+renesas@glider.be>
References: <cover.1693409184.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_041759_949917_C40F7FFA 
X-CRM114-Status: GOOD (  11.10  )
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

CPU core bringup on R-Car Gen2 SoCs uses the Cortex-A7/A15 Boot Address
Register to specify the boot area of the System CPU.  With this enabled,
when the System CPU accesses a physical address in the range from 0x0 to
0x3ffff, the top address bits are replaced by those specified in the
SBAR register.  Hence any device residing in the low 256 KiB of physical
address space cannot be accessed.

Prevent conflicts by reserving this memory region using
request_mem_region().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/pm-rcar-gen2.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c b/arch/arm/mach-shmobile/pm-rcar-gen2.c
index 7447e5fd7ed41e99..3453d5733224df44 100644
--- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
@@ -52,6 +52,11 @@ void __init rcar_gen2_pm_init(void)
 	struct resource res;
 	int error;
 
+	if (!request_mem_region(0, SZ_256K, "Boot Area")) {
+		pr_err("Failed to request boot area\n");
+		return;
+	};
+
 	for_each_of_cpu_node(np) {
 		if (of_device_is_compatible(np, "arm,cortex-a15"))
 			has_a15 = true;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
