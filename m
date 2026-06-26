Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D756CDE008
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2026 02:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3f+zRv4fVwBkSaJJMYB+3uK9e+mBRQbZyeiodthukmk=; b=U0MlhwzYomfqn0
	A6xQDxIn1egqrfauVeC3VR7FOyTXaZJZ2Hd9+YMGP4l69wSXIJGCHx+lSlA5ty6ujqw/UMIXCnNnx
	rc/D7x8Y3/e1Bq1W9g11ozyiRyh6kgM70eU93u+rSxgH4FGDQ2BnMpkS4iFa/vAD0XA03BAK+IrOh
	TUm1fHibKUeN4L/pUykz/Z0m9p8LorJ0+xp43nSHloeuEAiMDycZEcbDyYKdEBT7bKfrnXiWeJMRF
	Of/uWDBf4qO2sdC7z8GrfzpIZJExHatg+vnpufI02h/1w8YuuQ72K4A9Ow+N0PPl1f+bpZrvnrS4Z
	Tr2r2vpZAxJIfXtORnwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwCO-0000000AGey-3xct;
	Fri, 26 Jun 2026 02:21:44 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcwCL-0000000AGb5-2g7Q
	for linux-mtd@lists.infradead.org;
	Fri, 26 Jun 2026 02:21:43 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 206992C027A;
	Fri, 26 Jun 2026 14:21:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1782440484;
	bh=787TA31ow522P3gYjbe5mCzHHdwOw6x3hhOe0SEd5Z0=;
	h=From:To:Cc:Subject:Date:From;
	b=YBz4p1cvnOHdqEezhnL1iHTReDmnsu+V9jZIOuQc4PweaeCI/puYFF+FM2n2YwiIc
	 httdyxNh0jSILCLkNp1hy+/4T14pEPkKnU7xYZOx5PWowotrGL6WAfffijkQBSyYAz
	 BpTaYPi4sYpIudbhBveVO3L8pTw5k4OX33QrCQCQoClt9RspI/sFncwgAeQzRmraOu
	 MVO9nRX2WSV+z9s1ESZ7c7FEovcQFPV5ezmWsQ8/XOt5+OaRe+Zw9jp8ScpXpVf8Wt
	 vDpnpmrsF0hydvMtJw6h/FOG1BSEPRXGoP3VYlrshhmprAMHnNBdWLda/ME+Ni6Owu
	 jEO5Sop3Sb5tA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6a3de2230000>; Fri, 26 Jun 2026 14:21:23 +1200
Received: from ronand-dl.ws.atlnz.lc (ronand-dl.ws.atlnz.lc [10.33.12.18])
	by pat.atlnz.lc (Postfix) with ESMTP id E286613ED95;
	Fri, 26 Jun 2026 14:21:23 +1200 (NZST)
Received: by ronand-dl.ws.atlnz.lc (Postfix, from userid 1930)
	id DF4064E2026; Fri, 26 Jun 2026 14:21:23 +1200 (NZST)
From: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
To: pratyush@kernel.org,
	mwalle@kernel.org,
	takahiro.kuwano@infineon.com
Cc: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Subject: [PATCH v2 1/3] Revert "mtd: spi-nor: remove Fujitsu MB85RS1MT support"
Date: Fri, 26 Jun 2026 14:21:07 +1200
Message-ID: <20260626022108.1963271-2-ronan.dalton@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=TI3mSEla c=1 sm=1 tr=0 ts=6a3de223 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=FelO9ux0wxsA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=bUQKSiCPAAAA:8 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=P8ycfbC0-FjMsUKx_IAA:9 a=3ZKOabzyN94A:10 a=1CNFftbPRP8L7MoqJWF3:22 a=-fHZXUhsFbuwFN3fwQAr:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_192142_158461_5A9FD765 
X-CRM114-Status: GOOD (  16.36  )
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

This reverts commit d9cd5c9a6fe26d544551cfaa94fb0abc50c0b895.

The commit that removed support for this chip claimed that the at25
driver was the correct driver to use for this chip. However, the at25
driver exposes the chip as an NVMEM device, not a MTD device, so it's
not a suitable replacement for users that want to mount a file system
over the chip.

Revert the change that removed support for the MB85RS1MT FRAM chip.

Signed-off-by: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
Changes in v2:
- No changes

 drivers/mtd/spi-nor/Makefile  |  1 +
 drivers/mtd/spi-nor/core.c    |  1 +
 drivers/mtd/spi-nor/core.h    |  1 +
 drivers/mtd/spi-nor/fujitsu.c | 21 +++++++++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 drivers/mtd/spi-nor/fujitsu.c

diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
index 5dd9c35f6b6f..9216a5a29a2b 100644
--- a/drivers/mtd/spi-nor/Makefile
+++ b/drivers/mtd/spi-nor/Makefile
@@ -5,6 +5,7 @@ spi-nor-objs			+= atmel.o
 spi-nor-objs			+= eon.o
 spi-nor-objs			+= esmt.o
 spi-nor-objs			+= everspin.o
+spi-nor-objs			+= fujitsu.o
 spi-nor-objs			+= gigadevice.o
 spi-nor-objs			+= intel.o
 spi-nor-objs			+= issi.o
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..d5ebbfd3fa7f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2009,6 +2009,7 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_eon,
 	&spi_nor_esmt,
 	&spi_nor_everspin,
+	&spi_nor_fujitsu,
 	&spi_nor_gigadevice,
 	&spi_nor_intel,
 	&spi_nor_issi,
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index ba2d1a862c9d..a4d906e6d07d 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -606,6 +606,7 @@ extern const struct spi_nor_manufacturer spi_nor_atmel;
 extern const struct spi_nor_manufacturer spi_nor_eon;
 extern const struct spi_nor_manufacturer spi_nor_esmt;
 extern const struct spi_nor_manufacturer spi_nor_everspin;
+extern const struct spi_nor_manufacturer spi_nor_fujitsu;
 extern const struct spi_nor_manufacturer spi_nor_gigadevice;
 extern const struct spi_nor_manufacturer spi_nor_intel;
 extern const struct spi_nor_manufacturer spi_nor_issi;
diff --git a/drivers/mtd/spi-nor/fujitsu.c b/drivers/mtd/spi-nor/fujitsu.c
new file mode 100644
index 000000000000..69cffc5c73ef
--- /dev/null
+++ b/drivers/mtd/spi-nor/fujitsu.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2005, Intec Automation Inc.
+ * Copyright (C) 2014, Freescale Semiconductor, Inc.
+ */
+
+#include <linux/mtd/spi-nor.h>
+
+#include "core.h"
+
+static const struct flash_info fujitsu_nor_parts[] = {
+	/* Fujitsu */
+	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1)
+		FLAGS(SPI_NOR_NO_ERASE) },
+};
+
+const struct spi_nor_manufacturer spi_nor_fujitsu = {
+	.name = "fujitsu",
+	.parts = fujitsu_nor_parts,
+	.nparts = ARRAY_SIZE(fujitsu_nor_parts),
+};
-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
