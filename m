Return-Path: <SRS0=SnlB=FI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F64FC4361A
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 16:12:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C4E72223E
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 16:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C4E72223E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=howYiMjGUigBPhJOV9JPzmu/n0fLszGnJ9jf+JVNL0Q=; b=SsciaV/32Q7lR9ePP2pFoSBFs6
	+smHYSNuZdhDRXAtnaV4RqhCH/1G6T1yzG0LqdGPW+g+2MoSEpwtBJJ+FuGnjWaFyqa9cPaFLNEjb
	Qw4OCX9mCUjqCku75bDQL3OQD1dIX8wJ5jfzHvHHSU/4V0Cik6NlkRS3uWAqDH5Tkc6gcw89+M+Zu
	+LI+eWr89Ok326I5fw1mEFAWU8CnAo5hxrrRV51JzL4VWtgIVJ+ppQUEq01Mvy5tWVbk2qWztM/s7
	MmzezGzpj833cb3mC5PPO3q/Pcz/+tjGw0JulqIziw1wsRzofEbb9MkKCi20tQTgPToRldHZe9Z2l
	EVzr2R3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klDgW-0003Dx-Bg; Fri, 04 Dec 2020 16:11:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klDgR-0003DF-QF; Fri, 04 Dec 2020 16:11:48 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] [for NAND] ARM: s3c: gta02: fix for missing
 linux/mtd/nand_ecc.h
Date: Fri,  4 Dec 2020 17:10:12 +0100
Message-Id: <20201204161137.2729220-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_111148_018693_97EBC53F 
X-CRM114-Status: GOOD (  13.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

The header file got renamed, so any file including it needs to
be adapted to avoid:

arch/arm/mach-s3c/mach-gta02.c:40:10: fatal error: 'linux/mtd/nand_ecc.h' file not found

Fixes: 3f27bb3e3777 ("mtd: nand: ecc-hamming: Move Hamming code to the generic NAND layer")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
It's currently broken in -next because of the change in the
MTD NAND driver. Please add this patch to the same branch or
fold it into the patch that broke it.
---
 arch/arm/mach-s3c/common-smdk-s3c24xx.c | 2 +-
 arch/arm/mach-s3c/mach-anubis.c         | 2 +-
 arch/arm/mach-s3c/mach-at2440evb.c      | 2 +-
 arch/arm/mach-s3c/mach-bast.c           | 2 +-
 arch/arm/mach-s3c/mach-gta02.c          | 2 +-
 arch/arm/mach-s3c/mach-jive.c           | 2 +-
 arch/arm/mach-s3c/mach-mini2440.c       | 2 +-
 arch/arm/mach-s3c/mach-osiris.c         | 2 +-
 arch/arm/mach-s3c/mach-qt2410.c         | 2 +-
 arch/arm/mach-s3c/mach-rx3715.c         | 2 +-
 arch/arm/mach-s3c/mach-vstms.c          | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-s3c/common-smdk-s3c24xx.c b/arch/arm/mach-s3c/common-smdk-s3c24xx.c
index f860d8bcba0e..6d124bbd384c 100644
--- a/arch/arm/mach-s3c/common-smdk-s3c24xx.c
+++ b/arch/arm/mach-s3c/common-smdk-s3c24xx.c
@@ -20,7 +20,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/io.h>
 
diff --git a/arch/arm/mach-s3c/mach-anubis.c b/arch/arm/mach-s3c/mach-anubis.c
index 90e3fd98a3ac..04147cc0adcc 100644
--- a/arch/arm/mach-s3c/mach-anubis.c
+++ b/arch/arm/mach-s3c/mach-anubis.c
@@ -34,7 +34,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <net/ax88796.h>
diff --git a/arch/arm/mach-s3c/mach-at2440evb.c b/arch/arm/mach-s3c/mach-at2440evb.c
index 5fa49d4e2650..c6a5a51d84aa 100644
--- a/arch/arm/mach-s3c/mach-at2440evb.c
+++ b/arch/arm/mach-s3c/mach-at2440evb.c
@@ -35,7 +35,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include "devs.h"
diff --git a/arch/arm/mach-s3c/mach-bast.c b/arch/arm/mach-s3c/mach-bast.c
index 328f5d9ae9f9..27e8d5950228 100644
--- a/arch/arm/mach-s3c/mach-bast.c
+++ b/arch/arm/mach-s3c/mach-bast.c
@@ -24,7 +24,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
diff --git a/arch/arm/mach-s3c/mach-gta02.c b/arch/arm/mach-s3c/mach-gta02.c
index 3c75c7d112ea..aec8b451c016 100644
--- a/arch/arm/mach-s3c/mach-gta02.c
+++ b/arch/arm/mach-s3c/mach-gta02.c
@@ -37,7 +37,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
 
diff --git a/arch/arm/mach-s3c/mach-jive.c b/arch/arm/mach-s3c/mach-jive.c
index 2a29c3eca559..0785638a9069 100644
--- a/arch/arm/mach-s3c/mach-jive.c
+++ b/arch/arm/mach-s3c/mach-jive.c
@@ -40,7 +40,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include "gpio-cfg.h"
diff --git a/arch/arm/mach-s3c/mach-mini2440.c b/arch/arm/mach-s3c/mach-mini2440.c
index dc22ab839b95..4100905dfbd0 100644
--- a/arch/arm/mach-s3c/mach-mini2440.c
+++ b/arch/arm/mach-s3c/mach-mini2440.c
@@ -44,7 +44,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include "gpio-cfg.h"
diff --git a/arch/arm/mach-s3c/mach-osiris.c b/arch/arm/mach-s3c/mach-osiris.c
index 81744ca67d1d..3aefb9d22340 100644
--- a/arch/arm/mach-s3c/mach-osiris.c
+++ b/arch/arm/mach-s3c/mach-osiris.c
@@ -33,7 +33,7 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include "cpu.h"
diff --git a/arch/arm/mach-s3c/mach-qt2410.c b/arch/arm/mach-s3c/mach-qt2410.c
index 151e8e373d40..f88b961798fd 100644
--- a/arch/arm/mach-s3c/mach-qt2410.c
+++ b/arch/arm/mach-s3c/mach-qt2410.c
@@ -21,7 +21,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-s3c/mach-rx3715.c b/arch/arm/mach-s3c/mach-rx3715.c
index a03662a47b38..9fd2d9dc3689 100644
--- a/arch/arm/mach-s3c/mach-rx3715.c
+++ b/arch/arm/mach-s3c/mach-rx3715.c
@@ -22,7 +22,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 
 #include <asm/mach/arch.h>
diff --git a/arch/arm/mach-s3c/mach-vstms.c b/arch/arm/mach-s3c/mach-vstms.c
index 05f19f5ffabb..ec024af7b0ce 100644
--- a/arch/arm/mach-s3c/mach-vstms.c
+++ b/arch/arm/mach-s3c/mach-vstms.c
@@ -16,7 +16,7 @@
 #include <linux/io.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
-#include <linux/mtd/nand_ecc.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/partitions.h>
 #include <linux/memblock.h>
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
