Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E5FD41C27
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MErNFD5B7YNeHrPEZhqLGM4adQyeROtOLTZbnU1PLUk=; b=XA0yd6XqPUsQGm
	RoS+pHKXqz9/GHJzOv+1r3Nxr1UTPv/i/OLiNQXdYyVwQ9FwXGZV7b+OHXOPTjMOXKES5zfLf+zPo
	b14uwpnDGa6PxD/xxOPJhtQF5TUyDyN9S1O3JsyDBZC4tEXv1WlvSOebj1Cfb9FhRQnPvagVGgG71
	KzvKHHDWqezgNR/F3CvLB79YsnKN7m6Ig+W+2GXSG8gerRunnD8UVYeeBhApX248IwdbKyuygSSSt
	xecWjPrQy490g5QkkQjCHRLQBvrTLzl7I0BTNR0+nkM4zvUq4lPoCyEwyFYOZBSJZ+1Y1TgAgDwIe
	g23LDoYBYpFAnOYHj4qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA9A-00000006LQE-3Lvu;
	Wed, 13 Nov 2024 09:58:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA0V-00000006IaW-3gSz
	for linux-mtd@bombadil.infradead.org;
	Wed, 13 Nov 2024 09:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ONE5RIDa+M5HrCVn5iTpaeEU6VZHpy9NTdUHLDL3hak=; b=cDaWZoFfEclnpBlZaYEIgn3vvy
	eLnn5LIQfyCNQAGaaiZ81dSByPIHw4/YWGrMozOSmmrT2DCBDEW097AfDG6P3gPs0cMpk727sh8Qu
	KFWltCkVLoKbHzXbc72liI+eEAlAOAnYYoG0Uy45RFjro8XxqlrgKMjjshSFlR1NpjRybNT2ths8w
	ItHNO5zCGeeJFerVnguTUjQdJWZNvpR7rkBdWLpEtw0oDdSKGrl90Ry3A2XmDRa8aKFP1U6j3ic4q
	ayXyJ3W7S2CJb6P1N4o2LDi4UiJR5vvnLmj9vtyanrDfiqSCYbLZyk0eBN8vrN6ii/fRQ96JtVsed
	uNHpuvbw==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA0S-0000000DE6W-16Rf
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:49:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 63B31C0005;
	Wed, 13 Nov 2024 09:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731491385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONE5RIDa+M5HrCVn5iTpaeEU6VZHpy9NTdUHLDL3hak=;
	b=pdPkcgsNZr9bGMJRCtJGG6Kp9JOneqiNmeOHO3VmnQwisps53nzoczoic5DMXpqBw+a02h
	TVI3z1jLaK56EReo3fgnPg7YN2kgc4wL/W/zRjuOpb427i+FiDpEmdRpH9h2E72co2OGN4
	WtT1uTc4IHf0Xpn8ZsoWsRQBdWq3lmH4q8j7O3kcuJHzVrY3K1tEAsm6ND8nZQ+bBWc0R4
	nFQe6sDNjmxjisT94Dq19Dra0FtCQwiakMODZXcKzNaDzidcK1rXOmFRxvTRfBO3uIEvsK
	0R6sX/vctlZXoK6kMjTAAkGeLBJ54biRThG4GRxZUq8PZd0X7DMKqfXgOwMebA==
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
Subject: [PATCH v3 6/7] mtd: rawnand: davinci: Add clock resource
Date: Wed, 13 Nov 2024 10:49:37 +0100
Message-ID: <20241113094938.44817-7-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
References: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_094948_646947_A0003E93 
X-CRM114-Status: GOOD (  11.47  )
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
