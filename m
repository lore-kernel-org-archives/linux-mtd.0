Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C9CEE57F4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jvd41RFDhExkeIV/jFX0p3UsnlNtpKmrbKE0tLlqhlw=; b=FUrLs8Ji/pNq37
	nIvkadNvdT8g23uezeFTOhkIoulnpW9MHQ8BI5sawx7+dGcAWT9KiTlzeeL5ZPuISlgGl7BPqDSZH
	U3NFwjFsy3edyr0w1/Xyspdw4cg8h8kp0CFb4HB9F3Dhc0wNwJKAgCLSP1LFNyHgcbyRi0X0DDvyo
	mysiTK+S/93RIJR/3RRL+shznfkaUVlayuItvc1L4x547FITkTPFhswLgWD4A5JHGxD0emTtR208z
	ewo5crTnLlqlr0WKzOSnPgRr+nmksBkCc1H1FqVMPtcAMXAlq+o3WYqscCQZbfwJAat+OR7mSvJHA
	ZE5x5bpLJ2KKZOocZd/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXZ-00DSqd-2b;
	Fri, 08 Sep 2023 10:16:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYXW-00DSoc-0j
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 10:16:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E036B81D6A;
	Fri,  8 Sep 2023 10:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605EDC433C8;
	Fri,  8 Sep 2023 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694168195;
	bh=p5Y5K3Xbj3iXrfruziYXy2/bPOWNRacEU1TN2LbDodw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gT/7RouDaSzng4+dO2Oq3SstNK6cknSRBZbW09iClfhvgxZF1BwBs1D/uEKs05OSd
	 LBJT9OStYXFQWlJ9maLFEBcQCSoNRh2ivHzuvJkKNV32ZO7kAPxgoJYRPxfmv7plGf
	 NqdHClwyRV2GvxF9zHyQpa0GdtsQ8mj3rCcGJYJIeB638D5Czoabz1FMdNAM6y1WZ8
	 ob8klZ8pEjVEf+hzcxaCpYWOmQVKEePPSYC4HUI3wYXFzwhLJSp563AY3p2aCPXtKP
	 yCR/H8s09X5EfXFW3gQaf04Z/L27RGh4AY/4eTrIEQAyKaoePlyEsD6viKoJWHttkn
	 +wO7+B2I3QIGg==
From: Michael Walle <mwalle@kernel.org>
Date: Fri, 08 Sep 2023 12:16:21 +0200
Subject: [PATCH v3 03/41] mtd: spi-nor: xilinx: use SPI_NOR_ID() in
 S3AN_INFO()
MIME-Version: 1.0
Message-Id: <20230807-mtd-flash-info-db-rework-v3-3-e60548861b10@kernel.org>
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
X-CRM114-CacheID: sfid-20230908_031638_468994_6AFF7D8C 
X-CRM114-Status: GOOD (  10.07  )
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

In commit 59273180299a ("mtd: spi-nor: Create macros to define chip IDs
and geometries") SPI_NOR_ID() were introduced, but it did only update
the INFO() macro in core.h. Also use it in S3AN_INFO().

Signed-off-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/xilinx.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
index 00d53eae5ee8..de5189c38432 100644
--- a/drivers/mtd/spi-nor/xilinx.c
+++ b/drivers/mtd/spi-nor/xilinx.c
@@ -22,12 +22,7 @@
 		   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
 #define S3AN_INFO(_jedec_id, _n_sectors, _page_size)			\
-		.id = {							\
-			((_jedec_id) >> 16) & 0xff,			\
-			((_jedec_id) >> 8) & 0xff,			\
-			(_jedec_id) & 0xff				\
-			},						\
-		.id_len = 3,						\
+		SPI_NOR_ID(_jedec_id, 0),				\
 		.sector_size = (8 * (_page_size)),			\
 		.n_sectors = (_n_sectors),				\
 		.page_size = (_page_size),				\

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
