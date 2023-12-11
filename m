Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBB0C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lqRK0oQNtciRmKFrwT5CngwrPwoYeFpZzIlsy/e7UE=; b=tF9gihkOupoqWl
	uAhzanxcMiBVpDgQ/87R/UsuGVCcvYPyCxnRyDNh/LTkBr5rX8TN6xp06kN+gjCWQ9lIAu7qO4Qtg
	ejd/OfyV+8Dwq72PqZBreCpfzNymqTNDFSO6wTW2Zx/0e9TRrhH4QFarGglr4QqCpw8ADKtqia2kZ
	DO/if/NUblPrp2AWVse5Sq087ernii0VUqhdt5PtboIqS3OZhrGI8RAZR9JAAeH+6IIhxafulZIuC
	VKM7MCUAdGMeGP5s1TsaghJV96BzRo8tIK6joPKflHYp6jyKexjfca4oG7W5rp0KW4KxbzZlxDs/U
	jJcDsN8v4NoIfVtZ3Q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChxm-005KJx-01;
	Mon, 11 Dec 2023 15:12:54 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChxe-005KDW-35
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 15:12:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86060E0002;
	Mon, 11 Dec 2023 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702307562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AK2BzAx/YAHFbh+6Z+0veROK6HPT0/oAubfaxj7UV2s=;
	b=HztDremxIKWyhs4ljQkUaZkbUnkwWn3NamgaEJlyhZLnq7OoF09J2svtlEqppxF+2rFsmS
	FNMGnqBM38azQmBQUAq/NYb8lNmqBEBsaWeCZFspt0Xg3hYHkLJpZMgjMOBI153sp/nTF1
	l7oUhk9myflVEYuLZh8u25rzeHSv/7yyonWorOnDUgCWHI0rwIxfjBaI3/y0y/dfcLGlYd
	pXUqTfZ4d1pRpLAlaVvuVyf5bl2c4/bOnlI/IOwEXBbuE3gEYCubQegSqP/ILiyd2gUqCY
	tSXqIC+Qbr/PG+7ES0+Tt0GkMzm3ENvr/yj/MKDjwUL4Is0B36EMq1qiWd7L4A==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [RFC PATCH 1/6] block: partitions: efi: Move efi.h header to include/linux/gpt.h
Date: Mon, 11 Dec 2023 16:12:37 +0100
Message-ID: <20231211151244.289349-2-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211151244.289349-1-romain.gantois@bootlin.com>
References: <20231211151244.289349-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_071247_272244_A8CB2EC6 
X-CRM114-Status: GOOD (  12.37  )
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

The GPT parser located in the block layer defines all of the GPT-specific
data structures and logic that are necessary to parse this kind of
partition table. However, it is also specifically tailored for block
devices.

Assuming that different GPT parsers will be implemented in other kernel
subsystems, it is desirable to create a common set of GPT struct
definitions, macros and helpers, so as to limit code reuse between parsers.

As a first step towards this common codebase, this commit moves the efi.h
header, that contains GPT-specific definitions, to include/linux/gpt.h.

There is no functional change.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 MAINTAINERS                                   | 3 ++-
 block/partitions/efi.c                        | 2 +-
 block/partitions/msdos.c                      | 2 +-
 block/partitions/efi.h => include/linux/gpt.h | 0
 4 files changed, 4 insertions(+), 3 deletions(-)
 rename block/partitions/efi.h => include/linux/gpt.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97f51d5ec1cf..22e37e2ea1ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9233,7 +9233,8 @@ GUID PARTITION TABLE (GPT)
 M:	Davidlohr Bueso <dave@stgolabs.net>
 L:	linux-efi@vger.kernel.org
 S:	Maintained
-F:	block/partitions/efi.*
+F:	block/partitions/efi.c
+F:	include/linux/gpt.h
 
 HABANALABS PCI DRIVER
 M:	Oded Gabbay <ogabbay@kernel.org>
diff --git a/block/partitions/efi.c b/block/partitions/efi.c
index 5e9be13a56a8..db50c3f2bab3 100644
--- a/block/partitions/efi.c
+++ b/block/partitions/efi.c
@@ -87,8 +87,8 @@
 #include <linux/ctype.h>
 #include <linux/math64.h>
 #include <linux/slab.h>
+#include <linux/gpt.h>
 #include "check.h"
-#include "efi.h"
 
 /* This allows a kernel command line option 'gpt' to override
  * the test for invalid PMBR.  Not __initdata because reloading
diff --git a/block/partitions/msdos.c b/block/partitions/msdos.c
index b5d5c229cc3b..d0376cf27448 100644
--- a/block/partitions/msdos.c
+++ b/block/partitions/msdos.c
@@ -27,9 +27,9 @@
  */
 #include <linux/msdos_fs.h>
 #include <linux/msdos_partition.h>
+#include <linux/gpt.h>
 
 #include "check.h"
-#include "efi.h"
 
 /*
  * Many architectures don't like unaligned accesses, while
diff --git a/block/partitions/efi.h b/include/linux/gpt.h
similarity index 100%
rename from block/partitions/efi.h
rename to include/linux/gpt.h
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
