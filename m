Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EB5CD4F54
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 16:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikw5sceaTwXGJM/lKYzQClKnkIbgLFjW7GiA4lQMy+8=; b=BFBBpi94lu+iaJ
	gEj1LqPSLHUJW9f1l2+465/VJvAQ/hmJ6AeMw6jprWP15KcHQtp2qfVpE2j+s6mRYldSHloq7QLv/
	Zhv9UUu3lcH6wUs7EpsWMtsrAd6rIQ+o2InWBLk5YcSUr8W7ccfZp6VoyjnFUaosEPiyEAYo1RHnI
	Rn3NxGd86RuY0DM22twT2JNCJ+39WVlN3tiY9xZdJ7D2anDspiNdosB3Tbn6Q01EYs22Vtt3ukwir
	aDIFcYZ6ahvnIaaKD6SCwPzxUAFiO4YMBorjY6sLjnxdBYu6r90zEavM3/Fgg87auykpKqQLwDgo6
	ou1XmKOMeZ1ZvXFgJSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT06I-00000007t2Y-121u;
	Fri, 29 May 2026 16:30:22 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT06F-00000007t0a-1lqC
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 16:30:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 856AFC62462;
	Fri, 29 May 2026 16:30:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C74EE601FA;
	Fri, 29 May 2026 16:30:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55ABA10888CC6;
	Fri, 29 May 2026 18:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780072217; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lgdiO3aZNk41NZamSPA1ZPEFzEUzPqxYcHHOBzZNsnY=;
	b=hcAxgKPnksVp9dFX/J7K+ldpVTY1UJQTBnTzLv/NtLO4SyLDuvP6j1qhc1LaB2xnX6ebfm
	pTtY4e7u9UETUoXIublwFGCpg81ask40py6Az7iGfU+DSpLAIpYp0XdlEg4h3pLjR8gOFX
	i+x3Hupoic8EDgVwHZtwFDd7v3yuOTbeI2Tc3qmyGlvRUH6hzKPkOgYC3ZsZpbBsiDRa11
	Twby6swkuBahACrq7S36ywpJmG3Y4rvbcT/UgLLbsECPFESCpJPqdhkqlnBgvF3QyD8Yzf
	XuHmy4dYjwkXkZXuAlCoEZ9LPmnTN8KifXCzEnP86gX/g3zrcMwV+o4JPh20Sg==
From: "Miquel Raynal (DAVE)" <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 18:29:57 +0200
Subject: [PATCH 2/3] mtd: rawnand: pl353: Make sure we use the monolithic
 helpers for raw accesses
MIME-Version: 1.0
Message-Id: <20260529-dave-upstream-nand-fixes-v1-2-8c72aa23aee2@bootlin.com>
References: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
In-Reply-To: <20260529-dave-upstream-nand-fixes-v1-0-8c72aa23aee2@bootlin.com>
To: Michal Simek <michal.simek@amd.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Andrea Scian <andrea.scian@dave.eu>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_093019_622881_1FC175A1 
X-CRM114-Status: GOOD (  10.70  )
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

Any access not using the hardware ECC engine should be monolithic
because the controller has its very own way of handling the end of a
transaction during operation configuration, so we cannot easily make
repeated reads.

This has the side effect of fixing support for software ECC engines.

Suggested-by: Andrea Scian <andrea.scian@dave.eu>
Cc: stable@vger.kernel.org
Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
Signed-off-by: Miquel Raynal (DAVE) <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 986019b42153..a941b5c836a3 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -917,7 +917,6 @@ static int pl35x_nand_init_hw_ecc_controller(struct pl35x_nandc *nfc,
 	chip->ecc.steps = mtd->writesize / chip->ecc.size;
 	chip->ecc.read_page = pl35x_nand_read_page_hwecc;
 	chip->ecc.write_page = pl35x_nand_write_page_hwecc;
-	chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 	pl35x_smc_set_ecc_pg_size(nfc, chip, mtd->writesize);
 
 	nfc->ecc_buf = devm_kmalloc(nfc->dev, chip->ecc.bytes * chip->ecc.steps,
@@ -984,7 +983,6 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 	case NAND_ECC_ENGINE_TYPE_NONE:
 	case NAND_ECC_ENGINE_TYPE_SOFT:
 		dev_dbg(nfc->dev, "Using software ECC (Hamming 1-bit/512B)\n");
-		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
 		break;
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
 		dev_dbg(nfc->dev, "Using hardware ECC\n");
@@ -998,6 +996,9 @@ static int pl35x_nand_attach_chip(struct nand_chip *chip)
 		return -EINVAL;
 	}
 
+	chip->ecc.read_page_raw = nand_monolithic_read_page_raw;
+	chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
+
 	return 0;
 }
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
