Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5173DD637CE
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUkUluKzwmxiXpcHDwhTO37L0QUlYbOFFuhAAJYTg7c=; b=x41/LUPnwsvQvd
	WxiScaTwhWvb8AEOp2pNjKusfRAEDvTHidtCXFeMXzANBr50eD2PS6twrU1xGZ8dgaz1JeeOfqq3q
	H0GO7lUt81mvNsOcr3mK/UYt4cknr/UnUv+JrpfvhIu13iohpZgPl1qXySX46VUlMRGnOTfmfLpXN
	FgYOznytNwFhCWn2BFZ8b+k9r5T0Zk2nA+hHvAG+Q03YldiMR2+KkyvtHtVhnXkkTEgPtgPetdoVR
	E6wyh01hVuc61xxqDsPAVz5Uk1waWJ3QY54U/7Z3Hjmga3cNEAqe/hGSLyTtzDbVl6YmMilqKoSnD
	eVO8eggXbT9LKR8lf6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLU-00000002nYR-0MlX;
	Fri, 15 Nov 2024 13:26:44 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLQ-00000002nTf-2z8o
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 13:26:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id C31252000C;
	Fri, 15 Nov 2024 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731677199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=khZM5fFii6r1q+Z9uZi3Zgk6G9+0lCTuTox0qCES4xo=;
	b=ZynOMVZYONl3nqhnxXedxdo+koInvhB99WVhHxixqXffEeAOqMJ424OiX/aiy1p9x5xm8l
	JVHGqAf3YbhcY0aPRuTkG2+ymtVHaaB9C5TjYKTwbyKejt6x+46Ar8GCxyWOr9v9xL5tH3
	I/1/Rv25ffbONC7afgOBleYVrRqo8dgfjJyDnilaTFvOmsgO/5YA8Z4lrEu2mZOEuO6nkl
	uIOiB58q8wem4Y8kZ/JtWbZAkRVijpfXXEBUYdZ94YyR+TuH9QskbRXSwiMjLd4BUT7wqy
	DROgIlPuE69uoZcGPnPHdMqUHZELPuxyByS5pY73NCSjtWeRNcCF/yfBfjJwNQ==
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
Subject: [PATCH v4 08/10] mtd: rawnand: davinci: Order headers alphabetically
Date: Fri, 15 Nov 2024 14:26:29 +0100
Message-ID: <20241115132631.264609-9-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052640_899242_BBBF215A 
X-CRM114-Status: UNSURE (   7.96  )
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
