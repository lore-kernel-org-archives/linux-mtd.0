Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFCCCEDD89
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 12:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MimAYf1yfGohktquBayXlv0fj2gKjXnEIUCl7t/Cp7o=; b=j3PwXmsj+hHxOq
	sYCC02elWIJSTvM2e1Ztm4b7A1EoJkHEcPyAXNRtieFEs4+KLDBOew67MU3hG7mKDbFGUPXxi8edo
	uvEKz4K9grEZNGWzxyjQjQsD8kc3gjHU+WS2CgHXLJJ8CFPCfDMozDaW+wySLfzf9RF/0hwxcm0kU
	jBhbbCDLOewRbtKbP6w8Aflrp/BYTWtCWBPmT/tfv58dnot8FK8EX6qwQBedM9ZoLwVTlPgfXyRqz
	e6D90zCJpEYWrI5OcUHa7Ie6AJiJBFB8QCYIUIJaGMgceIvOjqOtimAe6Y1V70gwOCWgqmDnNXoNa
	QfcH9ubUidIOQCUx0mSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8q-00000009HjB-4BiV;
	Wed, 09 Oct 2024 12:50:13 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syW8m-00000009HeX-3ZhS
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 12:50:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 199251C000A;
	Wed,  9 Oct 2024 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728478204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mium5UPs3hxCmP4znQTZCQCZtM1o02IGqGj2nlYd6Jc=;
	b=hiNCMZYqjK/QBIsaBqW7CeKhdmhFWf6T2nvNad+5O+OXWntyZSy+EvnR+3CVDrZ8cr6CkC
	LoHrpggFA8lpE632Jjdc+ZN0iUbasTLLUri/ji0eMX2J9J/E5O93F5tCEosEFNw02V3leU
	B4NA+hfreuFgoX+pza2myDpOOVnjxCYpzo3sKi50NnUvA+C+KjVLZHs33ELyBlbjVfntZ6
	Ir9IEtRsNGMk9sZf3y2GqnUBCvB9cLjvHiys5cvlAGgcuGOmY3MXp0+D1+/udowcsWV7lx
	tEeoTmu7LEoe+PX2vWGEmk08V9SJF2L/b7VfMffK/dgyr/Anbh2DrEVQ7w9TCw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Steam Lin <stlin2@winbond.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] mtd: spi-nand: winbond: Fix 512GW and 02JW OOB layout
Date: Wed,  9 Oct 2024 14:49:59 +0200
Message-ID: <20241009125002.191109-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009125002.191109-1-miquel.raynal@bootlin.com>
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_055009_383094_C5A296B7 
X-CRM114-Status: GOOD (  10.50  )
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

Both W25N512GW and W25N02JW chips have 64 bytes of OOB and thus cannot
use the layout for 128 bytes OOB. Reference the correct layout instead.

Fixes: 6a804fb72de5 ("mtd: spinand: winbond: add support for serial NAND flash")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6b520b68407e..4e765cec0a3b 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -189,7 +189,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N512GW",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x20),
 		     NAND_MEMORG(1, 2048, 64, 64, 512, 10, 1, 1, 1),
@@ -198,7 +198,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25n02kv_ooblayout, w25n02kv_ecc_get_status)),
+		     SPINAND_ECCINFO(&w25m02gv_ooblayout, w25n02kv_ecc_get_status)),
 	SPINAND_INFO("W25N02KWZEIR",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xba, 0x22),
 		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
