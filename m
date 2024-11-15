Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9365AD637DA
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MErNFD5B7YNeHrPEZhqLGM4adQyeROtOLTZbnU1PLUk=; b=XHuZ2z49eJAR6M
	Qvh0dLF9vMz7R0Eiia8PPTxsJ/Wu5PUHNmP6e8KQb8RbPRn3rS+PKOcqLMhYL8yhnILUdtidorPm1
	lsTqNhY0OPRWXZy+130ZGvhfeE9IS7BT1Q5LRI6zkRXnQDUeMXC4uBi6wsXY2oif/tlZPKXUFOZB0
	8R9IABPJpCDdQ8PToeBxmkLcUTQv+d1bJ3uY1NEYWn47A0n2zYPOhiqOkbC7eza84gcHVNvATK5Ip
	2/Hq+NAF0OWaUSGu/HGmMJFTRJ9mRCf6Kd5IbgD6wMlTQlILgZPEuOYtky9jHKmqSX7J6JSfbehOW
	UZvEKu0faHLIHjgi3hCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLZ-00000002ncr-3mnB;
	Fri, 15 Nov 2024 13:26:49 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLR-00000002nUt-1Ni5
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 13:26:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 789FE2000E;
	Fri, 15 Nov 2024 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731677200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONE5RIDa+M5HrCVn5iTpaeEU6VZHpy9NTdUHLDL3hak=;
	b=LOPrsKU7gTXIZaZmRF+IRCmbUd0+NVzRXSjTADyKtUipBc5z0VFcVRXW2mi6eH9LaS9c3m
	fhv18d1YRJkJzHB3zP8u/eWuDRmcqZgIFLbzqy9oMWYZSv2cIGHsxt6OocGKby587vOLxb
	lhPVmJgnM3zKSG60ll3ZtflV4IaxFVW5/bAKqz+wxi8Yqu+2oLkXE1AkOj1m2RzMtflQBT
	8AxqObCZ4l12kFmMeuqczwS1H+JE1y7VxJBAM/iD7Ew2HWRYg6BpAAChQAsyXFZZl0HHw6
	5cVrhegjUJZNAoo5hApMUp5kbThVKkzk80FcH1/VzINYUFrV1NFjiQn2tLWHDw==
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
Subject: [PATCH v4 09/10] mtd: rawnand: davinci: Add clock resource
Date: Fri, 15 Nov 2024 14:26:30 +0100
Message-ID: <20241115132631.264609-10-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052641_505992_9CD2665A 
X-CRM114-Status: GOOD (  11.26  )
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

NAND controller has a reference clock inherited from the AEMIF
(cf. Documentation/devicetree/bindings/memory-controllers/ti-aemif.txt)
This clock isn't used yet by the driver.

Add a struct clock in the struct davinci_nand_info so it can be used
to compute timings.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3c0efbdd789e..563045c7ce08 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -10,6 +10,7 @@
  *   Dirk Behme <Dirk.Behme@gmail.com>
  */
 
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -117,6 +118,8 @@ struct davinci_nand_info {
 	uint32_t		mask_cle;
 
 	uint32_t		core_chipsel;
+
+	struct clk		*clk;
 };
 
 static DEFINE_SPINLOCK(davinci_nand_lock);
@@ -822,6 +825,10 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return -EADDRNOTAVAIL;
 	}
 
+	info->clk = devm_clk_get_enabled(&pdev->dev, "aemif");
+	if (IS_ERR(info->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(info->clk), "failed to get clock");
+
 	info->pdev		= pdev;
 	info->base		= base;
 	info->vaddr		= vaddr;
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
