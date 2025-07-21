Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C76C83F1A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 11:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LH7ImFzfeCIkc9LvHr2J2W2mEPMeQ3NbUaSkCHrJxqI=; b=fysXfGfGB1TSdi
	kdLJGEag7UFRLpCmVwXrg/zquJhNW3Vx/9G3Gq/thi2cPcjyC6q215DoaUDMNEFezmfY3NzUTRKAs
	DJUQggcqvkGLsQwZIoh/Kgo90yNhkF6GhL8glQHpGtWbqOfkNg0v9mhb5H7sP1voULw0W/p2EdRqw
	wTd7xPUVH9keaBc6tbekRQyCoSt5lA7XJDnT8YvCZxmwibN+DHrW7Fs1Ag0cG2HVG6s+gO4doXn2i
	wEhGC+fwBBQjUjUTFOf/N33IHheVLuJgGJRODFlPTUT47MCdLYxB8nnSWVCcdxUL9zFA5aTrw4xa3
	dicoXb5adVgVJkTXTNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udosH-0000000H8VQ-1gR5;
	Mon, 21 Jul 2025 11:40:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udo0R-0000000GzGJ-2mSd;
	Mon, 21 Jul 2025 10:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1753094667; x=1784630667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eeZcPHFZpOhD4zGpk7fZOIrm0FhI2Ay4ZWryebwV3e4=;
  b=Wfl9Sn/5JOZlcqCkIeOnI0UnMfVQR2V9hG9F1IIp0NTQsuSo1Zgd0tMX
   RgkYvJk0sLbJfGx3pV4KAdaJ2ExNPSHucCgiTP8Tv1AaqeNOWUjkyG+Zy
   0Zply/9Mr97GJnwqXkwyq6rPGshse6unpYsSb9IgYAsSbz2AqRmPgVbsT
   KBsA0oVORNtOwAHjSLbu3CkFUuB7cl7usX/s5QgtnIx51nWueusoDITHw
   zMTIQGrbvpE8mxElEhMShVOuYzMQG+Ue13U6s8/v69fvoz0VGHvxvElwz
   VWFXdoosVOZC6ZXXkBo70IfeXfTYiWZJ2rrRoFrS8rD7E39kCxsUwVwWe
   g==;
X-CSE-ConnectionGUID: CsUIskr/T/eitnidkJP48g==
X-CSE-MsgGUID: 0iSy9X3VQZalEvopVExI4A==
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="44829020"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Jul 2025 03:44:23 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 21 Jul 2025 03:44:05 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 21 Jul 2025 03:44:00 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <dan.carpenter@linaro.org>,
	<bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
	"Zixun LI" <admin@hifiphile.com>, Ada Couprie Diaz <ada.coupriediaz@arm.com>
Subject: [PATCH] mtd: rawnand: atmel: set pmecc data setup time
Date: Mon, 21 Jul 2025 16:13:40 +0530
Message-ID: <20250721104340.113581-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_034427_948240_7181C1CD 
X-CRM114-Status: GOOD (  10.30  )
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

Setup the pmecc data setup time as 3 clock cycles for 133MHz as recommended
by the datasheet.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Reported-by: Zixun LI <admin@hifiphile.com>
Closes: https://lore.kernel.org/all/c015bb20-6a57-4f63-8102-34b3d83e0f5b@microchip.com
Suggested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 drivers/mtd/nand/raw/atmel/pmecc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index 3c7dee1be21d..0b402823b619 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -143,6 +143,7 @@ struct atmel_pmecc_caps {
 	int nstrengths;
 	int el_offset;
 	bool correct_erased_chunks;
+	bool clk_ctrl;
 };
 
 struct atmel_pmecc {
@@ -843,6 +844,10 @@ static struct atmel_pmecc *atmel_pmecc_create(struct platform_device *pdev,
 	if (IS_ERR(pmecc->regs.errloc))
 		return ERR_CAST(pmecc->regs.errloc);
 
+	/* pmecc data setup time */
+	if (caps->clk_ctrl)
+		writel(PMECC_CLK_133MHZ, pmecc->regs.base + ATMEL_PMECC_CLK);
+
 	/* Disable all interrupts before registering the PMECC handler. */
 	writel(0xffffffff, pmecc->regs.base + ATMEL_PMECC_IDR);
 	atmel_pmecc_reset(pmecc);
@@ -896,6 +901,7 @@ static struct atmel_pmecc_caps at91sam9g45_caps = {
 	.strengths = atmel_pmecc_strengths,
 	.nstrengths = 5,
 	.el_offset = 0x8c,
+	.clk_ctrl = true,
 };
 
 static struct atmel_pmecc_caps sama5d4_caps = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
