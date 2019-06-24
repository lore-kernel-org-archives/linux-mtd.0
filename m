Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C7FC43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 16:16:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C4320663
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 16:16:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="URvnkosp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C4320663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zte.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HTHknXQiqDPxDaPvnVPEaOf5a3A0k9HmOcSh7gYH188=; b=URv
	nkospi5BihmtaIFRVtvDaEAIS+mtkFEsgc+FErBB4X9/SHJNsu/H57WFkf8rQVNxvHSIu9ykCBSDc
	5KK8pCgorgRNWCYfO5zgGVRSQwtzt5TUqZcVp/RGpXrSUw70R9SbNvOl02PihWOnNOi3J4cEp1ahc
	4TAQUkMv5VmnAfF2U1Rh+aB76988pcGHpA73yHB7r9GmjFrY8DLJOp9Io2RLK9NqGTu+aLZMkU6pg
	CmOnEoIbobh8ChblBPx3JSlRK2v1KdLKEm0ashtmMSexTYmmqwfTwR6a8B6DtnZlE2GyRvdctlaWT
	3DNRzKU32vWJpHb5GpTEHygi4kuG1wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfRe9-0008Ru-Tw; Mon, 24 Jun 2019 16:16:45 +0000
Received: from smtprz15.163.net ([106.3.154.248] helo=smtp.tom.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfRe6-0008R8-Iu
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 16:16:44 +0000
Received: from my-app01.tom.com (my-app01.tom.com [127.0.0.1])
 by freemail01.tom.com (Postfix) with ESMTP id 6C2261C81AAE
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2019 00:00:59 +0800 (CST)
Received: from my-app01.tom.com (HELO smtp.tom.com) ([127.0.0.1])
 by my-app01 (TOM SMTP Server) with SMTP ID -357582952
 for <linux-mtd@lists.infradead.org>;
 Tue, 25 Jun 2019 00:00:59 +0800 (CST)
Received: from antispam1.tom.com (unknown [172.25.16.55])
 by freemail01.tom.com (Postfix) with ESMTP id 63C4A1C81A90
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2019 00:00:59 +0800 (CST)
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
 by antispam1.tom.com (Postfix) with ESMTP id 046B3100197E
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jun 2019 00:00:58 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at antispam1.tom.com
Received: from antispam1.tom.com ([127.0.0.1])
 by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSaJ1cSP9yNE for <linux-mtd@lists.infradead.org>;
 Tue, 25 Jun 2019 00:00:56 +0800 (CST)
Received: from localhost (unknown [222.209.17.143])
 by antispam1.tom.com (Postfix) with ESMTPA id 7BCBF100177F;
 Tue, 25 Jun 2019 00:00:55 +0800 (CST)
From: Liu Xiang <liu.xiang6@zte.com.cn>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4] mtd: spi-nor: fix nor->addr_width when its value
 configured from SFDP does not match the actual width
Date: Tue, 25 Jun 2019 00:00:46 +0800
Message-Id: <1561392046-10487-1-git-send-email-liu.xiang6@zte.com.cn>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_091642_818284_953A61EB 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 liuxiang_1999@126.com, Liu Xiang <liu.xiang6@zte.com.cn>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

IS25LP256 gets BFPT_DWORD1_ADDRESS_BYTES_3_ONLY from BFPT table for
address width. But in actual fact the flash can support 4-byte address.
Use a post bfpt fixup hook to overwrite the address width advertised by
the BFPT.

Suggested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>

---

Changes in v4:
 update the comment suggested by Tudor.
---
 drivers/mtd/spi-nor/spi-nor.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7..ce153c4 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1687,6 +1687,28 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 		.flags = SPI_NOR_NO_FR | SPI_S3AN,
 
 static int
+is25lp256_post_bfpt_fixups(struct spi_nor *nor,
+			   const struct sfdp_parameter_header *bfpt_header,
+			   const struct sfdp_bfpt *bfpt,
+			   struct spi_nor_flash_parameter *params)
+{
+	/*
+	 * IS25LP256 supports 4B opcodes, but the BFPT advertises a
+	 * BFPT_DWORD1_ADDRESS_BYTES_3_ONLY address width.
+	 * Overwrite the address width advertised by the BFPT.
+	 */
+	if ((bfpt->dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) ==
+		BFPT_DWORD1_ADDRESS_BYTES_3_ONLY)
+		nor->addr_width = 4;
+
+	return 0;
+}
+
+static struct spi_nor_fixups is25lp256_fixups = {
+	.post_bfpt = is25lp256_post_bfpt_fixups,
+};
+
+static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
 			    const struct sfdp_bfpt *bfpt,
@@ -1827,7 +1849,8 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 			SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_4B_OPCODES) },
+			SPI_NOR_4B_OPCODES)
+			.fixups = &is25lp256_fixups },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25wp064",  INFO(0x9d7017, 0, 64 * 1024, 128,
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
