Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9331C43465
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 11:22:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C5420874
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 11:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AcG0QYEc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yadro.com header.i=@yadro.com header.b="gEyRH8dG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C5420874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yadro.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bnrYSLdywKL1a7h/jbVJ9DOTUmf2u3c9m8Tn8owoLnc=; b=AcG0QYEcy9tLwt67f1I6cf6bR
	EnkOir4b4GAAmh7bxDxW/wI6/I90E/Y4ujhqjuF/0JzbE8xZBHlMC9E+11PfX7kfJr8nrqU6oHyHc
	UMQSSADBWdScPA4G+5emp9cv16dnbfZexGsHy+5DvVivx3u4WleyXrAkJKTE6AZnTwvC63BkW6144
	xvDWXkNHSMfen28fOKl+9loX6rQo1LwayHF3HiHDdGFpeplM+3wfOtaCtBjmaEgfl5xS4flzSWrvx
	2EBeg94umuYJnaMTDyLAYwu7gXA3ic4eb7PEe5Vhv5pt0G8OmTMmnXfPmiLkXnSqWFotVGHDVDzZ2
	4ZjQ3aYrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKJsx-0002V7-UH; Mon, 21 Sep 2020 11:21:31 +0000
Received: from mta-02.yadro.com ([89.207.88.252] helo=mta-01.yadro.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJsq-0002Sm-FN
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 11:21:26 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0ECCA57526;
 Mon, 21 Sep 2020 11:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1600687280; x=1602501681; bh=nnOj6MFAVv+oGP+mdBYK4SKBtK5bLxUUMPQ
 FQit6vVE=; b=gEyRH8dGUTJs4U2DHLBKBINxASizyoLVxIfV3gKWVXyeZFRXyI4
 C0WAvkWO28kaKg3aED3DDgdVSG3+G1ImhVA0MtKOF5Hn+GCh35iuPsY5TDb2GUnQ
 zu8uZmMrSDKab3F36pH0acA2eAUqeudUsGQyzypkhKeYr78slClHAx9Y=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J4916GsHIa4g; Mon, 21 Sep 2020 14:21:20 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id F205852ACE;
 Mon, 21 Sep 2020 14:21:19 +0300 (MSK)
Received: from localhost.dev.yadro.com (10.199.3.38) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Mon, 21 Sep 2020 14:21:19 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: [RESEND PATCH 2/2] mtd: spi-nor: enable lock interface for macronix
 chips
Date: Mon, 21 Sep 2020 14:24:50 +0300
Message-ID: <20200921112450.4824-3-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200921112450.4824-1-i.mikhaylov@yadro.com>
References: <20200921112450.4824-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
X-Originating-IP: [10.199.3.38]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_072124_832137_030CA3AB 
X-CRM114-Status: GOOD (  13.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Ivan Mikhaylov <i.mikhaylov@yadro.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add locks for whole macronix chip series with BP0-2 and BP0-3 bits.

Tested with mx25l51245g(BP0-3).

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 drivers/mtd/spi-nor/macronix.c | 75 ++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 96735d83c77c..80de43eb05d6 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -37,53 +37,78 @@ static const struct flash_info macronix_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
 	{ "mx25l2005a",  INFO(0xc22012, 0, 64 * 1024,   4, SECT_4K) },
-	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8, SECT_4K) },
-	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16, 0) },
-	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
-	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
+	{ "mx25l4005a",  INFO(0xc22013, 0, 64 * 1024,   8,
+			      SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "mx25l8005",   INFO(0xc22014, 0, 64 * 1024,  16,
+			      SPI_NOR_HAS_LOCK) },
+	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32,
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64,
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64,
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4,
+			      SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
-	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
-	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
-	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
+	{ "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8,
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16,
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
+	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256,
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
 	{ "mx25r3235f",  INFO(0xc22816, 0, 64 * 1024,  64,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512,
-			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
 		.fixups = &mx25l25635_fixups },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512,
-			      SECT_4K | SPI_NOR_4B_OPCODES) },
+			      SECT_4K | SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
-	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
+	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512,
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
 	{ "mx25l51245g", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024,
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			      SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx66u51235f", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP) },
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048,
-			      SPI_NOR_QUAD_READ) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK |
+			      SPI_NOR_4BIT_BP) },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
2.21.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
