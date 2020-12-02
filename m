Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC731C64E8A
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 04:03:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 552E0206F9
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 04:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 552E0206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LSxm8xuaV7Uj/sD+mSDnvUTtnqXKG4TRxOdwEJ7jlLU=; b=QWjTyUboHieNvBjbzUgVZ/jLfs
	EV2+nS3gggpIYYkS53fShkqOVNF50mT+ALCHNRNeYaOk896JD8NSAq3YXzQrW3pQ4vgG5d+Oqr3lq
	JXsK7vR8BBL/1oRhnQbHZhxxrfiLAmfq8fBVB10/bZOgrG8eNTrWUJDFq165ytFyxgbg161b6yRlH
	Z2YJQMxxhbQvB0j0qRZCBywsWQqjMkZ3xpcLHmnXjOdBmf1ROMrRTigTJOknkbVfnWRybs/HLv4c7
	74X90aK8D2gYjBUz553Ah6WH8Mp3OHs3ppwN277c1OXKXuQ9WgmEYBqySNH/i1PmPQXBzdfFS/db3
	zQaZR/Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkJKW-0003Qy-5l; Wed, 02 Dec 2020 04:01:24 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkJKS-0003QI-NO
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 04:01:22 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cm4y131Xvzhlfs;
 Wed,  2 Dec 2020 12:00:41 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 2 Dec 2020 12:00:54 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <masonccyang@mxic.com.tw>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: macronix: Add post bfpt fixup for mx25u51245g
Date: Wed, 2 Dec 2020 11:59:12 +0800
Message-ID: <1606881552-41659-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_230121_016942_5B1E7FEC 
X-CRM114-Status: GOOD (  14.77  )
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
Cc: vigneshr@ti.com, prime.zeng@huawei.com, richard@nod.at, linuxarm@huawei.com,
 yangyicong@hisilicon.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The 64MB MX66U51235F's BFPT_WORD(1) declares
BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 and it doesn't provide
a 4BAIT table, so the address width will be set to
3-byte by default after parsing BFPT, which will make
the upper memory region unusable.

As the MX66U51235F shares the same JEDEC ID with
MX25U51245G and is identified to MX25U51245G, add a
post bfpt fix hook to correct the address width in
MX25U51245G's entry will solve this issue. It won't
affect MX25U51245G which also use 4-byte address
width and the address width will be valided when
parsing its 4BAIT table.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/mtd/spi-nor/macronix.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9203aba..2b9065c 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -33,6 +33,36 @@ static struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 };
 
+static int
+mx66u51235f_post_bfpt_fixups(struct spi_nor *nor,
+			    const struct sfdp_parameter_header *bfpt_header,
+			    const struct sfdp_bfpt *bfpt,
+			    struct spi_nor_flash_parameter *params)
+{
+	/*
+	 * The 64MB MX66U51235F's BFPT_WORD(1) declares
+	 * BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 and it doesn't provide
+	 * a 4BAIT table, so the address width will be set to
+	 * 3-byte by default after parsing BFPT,  which will make
+	 * the upper memory region unusable.
+	 *
+	 * As the MX66U51235F shares the same JEDEC ID with
+	 * MX25U51245G and is identified to MX25U51245G, add a
+	 * post bfpt fix hook to correct the address width in
+	 * MX25U51245G's entry will solve this issue. It won't
+	 * affect MX25U51245G which also use 4-byte address
+	 * width and the address width will be valided when
+	 * parsing its 4BAIT table.
+	 */
+	nor->addr_width = 4;
+
+	return 0;
+}
+
+static struct spi_nor_fixups mx66u51235f_fixups = {
+	.post_bfpt = mx66u51235f_post_bfpt_fixups,
+};
+
 static const struct flash_info macronix_parts[] = {
 	/* Macronix */
 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
@@ -68,7 +98,8 @@ static const struct flash_info macronix_parts[] = {
 			      SECT_4K | SPI_NOR_4B_OPCODES) },
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
+		.fixups = &mx66u51235f_fixups },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
