Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC2AEE57EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9s/h+tt8W0vuSC11hix6Ateia6t0tlG9tSwsFYyQ5e8=; b=rdt0K9mNYshTbB
	FgeipOQcnycVUbQeeltIxFhONPhkp45nJrgZkTuvPZTfpEgEati99fFtmIXUUOtJ0G4OoIafE7DtL
	jQdZmvhS1ShRmcZIYkFGFR6eG5LLTjRVS2YSDHOAJlcejSYaRNSsxbHl/n3+P5NlLuPd5Q6RbPNTl
	dSIcSld9MMU6xliIrnw4u+0pMmolokSAeA833KOpY7tDBBNb6VVZ40SEILFUL+SyxNZt1VuibKPK/
	o7B+JJabaQjD6QRE5bPqXRr7Fa7ae8Dt+jy7fSmO/0O9DNJKSl23ktQYjG6agi5tES2cxdBXIPNW+
	FVHMzSkGd84G1bxrb2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXb-00DSrQ-2F;
	Fri, 08 Sep 2023 10:16:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXY-00DSpn-2U
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:16:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 627E6B81F50;
	Fri,  8 Sep 2023 10:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824EEC433CD;
	Fri,  8 Sep 2023 10:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168197;
	bh=lcpDq0H9ggD7EJQL+rHqYJynDJl6I9MlMvuqVhqa+Cc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kruitFOlAS2BZNbzxqA8xz4XJkka8peHpMj4Mq7AXFWRZgMLy3mQp3wiSDWwSJdz/
	 OSAtAJUgrhEd73TZWSTcd40VW84k0ZIGTiewX6IXkTAk+/Nc4SEEhkRJ8lyONYCSzl
	 5OzgGshb9idDittPIXZWJ5XeggbNCBkMe95Rc//Odkgstu1XbArtkBKScEm/XgmbJ2
	 Zz+60euOY6ewK9asVtsSlt9PtQ2wr2cJy6EVRRMxxWanc49FHyW9EBR8+aLULeYigj
	 myvuXepRfms3JX1AMlJtf0H5h3E2s/C/PXHI98JbAlYXEE17TaMdXK2sksOGmbvjMu
	 dzSiURL4kCj/w==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:22 +0200
Subject: [PATCH v3 04/41] mtd: spi-nor: xilinx: remove addr_nbytes from
 S3AN_INFO()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-4-e60548861b10@kernel.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
In-Reply-To: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_031640_954300_A6645251 
X-CRM114-Status: UNSURE (   9.47  )
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

The default value of addr_nbytes is already 3. Drop it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/xilinx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index de5189c38432..34267591282c 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -27,7 +27,6 @@
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\
 		.n_banks = 1,						\
-		.addr_nbytes = 3,					\
 		.flags = SPI_NOR_NO_FR
 
 /* Xilinx S3AN share MFR with Atmel SPI NOR */

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
