Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F33C77B7A
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jun 2023 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=325ZYGl6sRKvaKIo983g9C3EDWyW770QxDedrOOtQuU=; b=J8V4ISBACTztuI
	6TnzqhKi6FVuw7DqQIHbJAIZDK4VjzVIcz3W/Ed+xdFvbF9ySvkHiU+4KseeOuiWGqzqI3/KLTPyL
	7g1KLdLhFCkRlqI6QPbjfUYoU01QAvadvBzhpq6aJGjfOpsc0GjKGAlnCeMj+uWTThsOcRXvEpwii
	TEHDzrx74kAzDtIU8FXJr5U16exCKMWFza667RkaMYN9W6pxXWqMA0yyvQPOzgZi1ST7GtKP9UVCY
	xGSPy4vO8CZtc7ca9Hb2mx9zLhiwdDA0bqAgCTi8isSZaOwKlidkOyLvszNcAQ05wY+cD+R6qU0QL
	oehZcNDYVI0pHA3tVE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5WMI-00ALSg-1j;
	Sat, 03 Jun 2023 18:52:14 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5WME-00ALQm-21
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jun 2023 18:52:12 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b1a653b409so34681631fa.0
        for <linux-mtd@lists.infradead.org>; Sat, 03 Jun 2023 11:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685818323; x=1688410323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVCFwjGtpwprYLjtBrAT6zq/xb5rEV/ncNaFrZP9KRU=;
        b=gUAEX6vDsrln5TO0L630UD+tbFkCagBbM/81AjHDqaZtV/Lka6IqJgNG9xwA6xwTGU
         u8OaT50OERaBTe8mVNin7cjw1+CWQlzmF2AarrGtSEiq8sYgLHeMocmQHmwXkdF2gcrx
         rJpcLsmgpVSbsSqmNFh20hZIIe/UQpDMSIJzPL09APwrI0w2As5Q87T0urWK+XOIjIZq
         I4HdBe5yx3JyaetV44is+aFPRcs0R5aXDWjbVK2Mii+Rbova2Vk1kmApcpqk06H54iEU
         WdV1EPqf4QF3Awr5tnWqvNnRD08Jn4wRSWTcH9+WlNbcjyZXb6PeKLOQrvWYmzxF0mif
         c/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685818323; x=1688410323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVCFwjGtpwprYLjtBrAT6zq/xb5rEV/ncNaFrZP9KRU=;
        b=DdMmC3E8A4OJLkRHkD3z+qCHQCdPCmU3BRO4KHkPEJoDBq7AlyONaUaw59Rqxj0XxU
         eUqLcmmhZ4EnEo9tAt8NGN4Cxxpkw/WcOGyLxYc34pfsmNDuMu5i/nEFMOehmy85RGpZ
         qF3kyWGA72Kwidebq6ozqeYMCrSL5MCyxFLa6R0Oh1hslNjzLlJ4Do7Z6VXmHEIC6B7V
         BbCNmTlx8NSmQpRycLCQ/yWCq/ZkSqUWRNcuOP7g9SVGeRJwD8qhdKHClObRh0jJJrDr
         96aqwY128uqiyrBbuxYmcRB8T/eZv+SrnMgvYpTxlAGc0RgQJI6L8GPJwygBO4keavpm
         NUFA==
X-Gm-Message-State: AC+VfDygtcTFrlbFfM35V15ZuSKK9Ahy/aukTU6H0gYEpYXfDcqM0dV/
	QEuP67ZgrPh/m9vYHmh7DEkAYQ==
X-Google-Smtp-Source: ACHHUZ5GS7A/Q98iY8fbP73Fo2+ci44tAmX6nk4BKVdaht3xDxOCxeErsr1g3hfkSq6Q03MVUr7XZA==
X-Received: by 2002:a2e:88da:0:b0:295:9906:64e4 with SMTP id a26-20020a2e88da000000b00295990664e4mr1010923ljk.2.1685818323316;
        Sat, 03 Jun 2023 11:52:03 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id p24-20020a2ea418000000b002a9ec7c0b4csm723753ljn.10.2023.06.03.11.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 11:52:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] mtd: chips: Use SPDX license headers
Date: Sat,  3 Jun 2023 20:52:00 +0200
Message-Id: <20230603185200.3571174-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_115210_701177_39EA58BA 
X-CRM114-Status: GOOD (  17.57  )
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

Some of the files in mtd/chips do not have a SPDX license
header, presumably because the text string "GPL'd" didn't
parse with Thomas rulesets for magic license tagging.

Fix this, the code is initially from RedHat which clearly
targeted the Linux kernel and intended it to be GPLv2.

In any case the original author appears to be David
Woodhouse who can then confirm this.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 3 ++-
 drivers/mtd/chips/cfi_cmdset_0002.c | 3 +--
 drivers/mtd/chips/cfi_cmdset_0020.c | 3 ++-
 drivers/mtd/chips/cfi_probe.c       | 3 ++-
 drivers/mtd/chips/cfi_util.c        | 3 +--
 drivers/mtd/chips/gen_probe.c       | 2 +-
 drivers/mtd/chips/jedec_probe.c     | 3 ++-
 drivers/mtd/chips/map_ram.c         | 3 ++-
 drivers/mtd/chips/map_rom.c         | 3 ++-
 9 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 02aaf09d6f5c..c10693ba265b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -1,8 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Common Flash Interface support:
  *   Intel Extended Vendor Command Set (ID 0x0001)
  *
- * (C) 2000 Red Hat. GPL'd
+ * (C) 2000 Red Hat.
  *
  *
  * 10/10/2000	Nicolas Pitre <nico@fluxnic.net>
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 67453f59c69c..153fb8d0008e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Common Flash Interface support:
  *   AMD & Fujitsu Standard Vendor Command Set (ID 0x0002)
@@ -16,8 +17,6 @@
  * 25/09/2008 Christopher Moore: TopBottom fixup for many Macronix with CFI V1.0
  *
  * Occasionally maintained by Thayne Harbaugh tharbaugh at lnxi dot com
- *
- * This code is GPL
  */
 
 #include <linux/module.h>
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index d35df526e0a6..60c7f6f751c7 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -1,8 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Common Flash Interface support:
  *   ST Advanced Architecture Command Set (ID 0x0020)
  *
- * (C) 2000 Red Hat. GPL'd
+ * (C) 2000 Red Hat.
  *
  * 10/10/2000	Nicolas Pitre <nico@fluxnic.net>
  * 	- completely revamped method functions so they are aware and
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index cf426956454c..a04b6174181c 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -1,6 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
    Common Flash Interface probe code.
-   (C) 2000 Red Hat. GPL'd.
+   (C) 2000 Red Hat.
 */
 
 #include <linux/module.h>
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 6a6a2a21d2ed..140c69a67e82 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -1,11 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Common Flash Interface support:
  *   Generic utility functions not dependent on command set
  *
  * Copyright (C) 2002 Red Hat
  * Copyright (C) 2003 STMicroelectronics Limited
- *
- * This code is covered by the GPL.
  */
 
 #include <linux/module.h>
diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 4d4f97841016..9e53fcd7600d 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -1,7 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Routines common to all CFI-type probes.
  * (C) 2001-2003 Red Hat, Inc.
- * GPL'd
  */
 
 #include <linux/kernel.h>
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 6f7e7e1b3fe5..23c32fe584b7 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1,6 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
    Common Flash Interface probe code.
-   (C) 2000 Red Hat. GPL'd.
+   (C) 2000 Red Hat.
    See JEDEC (http://www.jedec.org/) standard JESD21C (section 3.5)
    for the standard this probe goes back to.
 
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index c37fce926864..e8dd6496927e 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -1,6 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Common code to handle map devices which are simple RAM
- * (C) 2000 Red Hat. GPL'd.
+ * (C) 2000 Red Hat.
  */
 
 #include <linux/module.h>
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index 20e3604b4d71..0823b15aaadb 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -1,6 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Common code to handle map devices which are simple ROM
- * (C) 2000 Red Hat. GPL'd.
+ * (C) 2000 Red Hat.
  */
 
 #include <linux/module.h>
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
