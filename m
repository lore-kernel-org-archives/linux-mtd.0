Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946B4D5CC92
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2024 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUkUluKzwmxiXpcHDwhTO37L0QUlYbOFFuhAAJYTg7c=; b=LlaoxAnbViBii7
	3OLtbluYhCDdMRxX6ytDISQFA902dx99sso9TMSzEXRjTVFmjNbFBhWy6x1bSLIIC2XIu6NhBLCNG
	WLzvzjs+uIiMYJoHWPlZpa7e3r1JUKuvy2/pOrwovV07N0WT1avnL61zxL6jNf5JpJZjXF9wl6C2X
	wc7BRSyFv7FmbMhjHP2FRRLG4/FXDZVOs/nNvRvz4lLaw/OYr/tShyIoEDWgCfr9zzYxXzNFJS+3A
	2C7KbhU4ouEVVO9n/NsKPjasXIOsh0pQLOiHp1WnwNsqHCEVFjcsEZ6cnAFz/OjJ5naPKx7udZ56X
	jJS8nwxG+6z6EgvJiWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t66Ns-000000002M2-3VWV;
	Wed, 30 Oct 2024 10:57:04 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66EY-000000000P5-3i9j
	for linux-mtd@lists.infradead.org;
	Wed, 30 Oct 2024 10:47:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id C87FBC0009;
	Wed, 30 Oct 2024 10:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730285245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=khZM5fFii6r1q+Z9uZi3Zgk6G9+0lCTuTox0qCES4xo=;
	b=j2Wzx280k2XQM968sbuT1U2dYsnCPm2HLQU44ngdEJm5ohLBShOcnDn0Q8BiPY4sDbgywE
	vQ0iBf2JEtODkaqrQVeN2/BgUMxAfCjO5MG06L6KxFxBqhR8LpJRNiDcdsclMgTZh4hn3e
	I8dZbmyPUNWZoxXuR50KbLCpc2XnpGplT3QV9fclVnA/T5umEx3j5Dvet1COyfBQKpGele
	xaMxoqjVViK93DS3kgwOCpSU1NE3s2Yv3XOx3J6Jt2LoRX/Tyepf5p4aM3ojMnCZsbSTTl
	HZK+QqgIL/fo3mR6lyGQB89GBkcz9ndKpELVpfAlIPVmzPMtbKX7xz0PNXge3g==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH 3/5] mtd: rawnand: davinci: Order headers alphabetically
Date: Wed, 30 Oct 2024 11:47:15 +0100
Message-ID: <20241030104717.88688-4-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030104717.88688-1-bastien.curutchet@bootlin.com>
References: <20241030104717.88688-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_034727_118400_385A74D5 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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

Order headers alphabetically for better readability.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 392678143a36..3c0efbdd789e 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -10,15 +10,15 @@
  *   Dirk Behme <Dirk.Behme@gmail.com>
  */
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #define NRCSR_OFFSET		0x00
 #define NANDFCR_OFFSET		0x60
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
