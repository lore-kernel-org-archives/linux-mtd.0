Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF56C83F01
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 11:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWwiR6W0xerXNyAH+hq0IZHTJwb15civkkFUA7U1cbM=; b=fFs7o/bJfbam4/
	C2EYJ9iu9Qb1147dk6fCO/d9zQ11zbrfOq4Cf+jYavvhmEdQ7IdW9Cy4PvfLOF+KtzqDAjbvhOtlq
	KPMH3KAGDNeVLfs93fyIMEAgSt+6GqfQSb4aHweuDpjJHPKIfdyPfI4bcPHlI/Ks/ifEft0JrIgxz
	SnIZ7+6nwtiPF3bqZCLb30chmynNXHQJaucJR+rCeSwJYCE5TpDH9cMT+yt+Oyrh+SmSdqwqJxgFK
	L8c7yOfeTOzE1TZiSY6XnOr/a64uzzYa6HKzdocqWlAlXPzsvLDlKpcoPZ3iXCnioo2+RvHtymxJG
	epMpzz3RR69WEn+DOhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgZ-00FBOY-2O;
	Thu, 31 Aug 2023 11:18:03 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfgV-00FBLL-2C
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 11:18:01 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
	by andre.telenet-ops.be with bizsmtp
	id gBHs2A00Z3874jb01BHsCm; Thu, 31 Aug 2023 13:17:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgC-0026um-5n;
	Thu, 31 Aug 2023 13:17:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbfgO-00CHXr-KP;
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
Subject: [PATCH 1/4] ARM: shmobile: rcar-gen2: Remove unneeded once handling
Date: Thu, 31 Aug 2023 13:17:44 +0200
Message-Id: <116ef21e5f495432d913315bdc25fbc30edcf2e1.1693409184.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693409184.git.geert+renesas@glider.be>
References: <cover.1693409184.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_041759_864663_62ADC555 
X-CRM114-Status: GOOD (  11.03  )
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

rcar_gen2_pm_init() is only called from the
smp_operations.smp_prepare_cpus() callback, which is called at most
once.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/mach-shmobile/pm-rcar-gen2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-shmobile/pm-rcar-gen2.c b/arch/arm/mach-shmobile/pm-rcar-gen2.c
index 672081405a7ed7aa..7447e5fd7ed41e99 100644
--- a/arch/arm/mach-shmobile/pm-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/pm-rcar-gen2.c
@@ -46,16 +46,12 @@ void __init rcar_gen2_pm_init(void)
 {
 	void __iomem *p;
 	u32 bar;
-	static int once;
 	struct device_node *np;
 	bool has_a7 = false;
 	bool has_a15 = false;
 	struct resource res;
 	int error;
 
-	if (once++)
-		return;
-
 	for_each_of_cpu_node(np) {
 		if (of_device_is_compatible(np, "arm,cortex-a15"))
 			has_a15 = true;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
