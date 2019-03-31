Return-Path: <SRS0=WHT+=SC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78FDC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 07:43:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CBF02070B
	for <linux-mtd@archiver.kernel.org>; Sun, 31 Mar 2019 07:43:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OSup/bpW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CBF02070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zte.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zwld8/wqPGREBHCSePCf3qSD2AxvVnRzt4vX0TTuxFI=; b=OSu
	p/bpWDTlNT+hkEd8zsadY6jeAiy6fI7DsN/0BBKzvQI9ziO2RO4Pq1W3MnCeZu6eCDmE9AknWtetO
	AZNMwCf06tGW9/7t7eMUumKYWMOndmY8reW2YGHAMml9WliFB6C1nIElokiByOBCFWlUmJIMx+Uyz
	nRSFKfUL8h++Jm87phOPNDmHyOW/4LwURBDVeY4QyEj8aYbNsngP2HmKY5joTcQ8z4tGwx+OpUUo5
	U06s62XXX5FTLrcFUKEsovySXB+1rK9xpE4AYnZh4ipRbTRZpJ0OeHoGrMrHSTq58lueHsLje1na6
	KUV4whA7ZPxaov96CN3YGzOktY7bh/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAV7Q-00060r-CW; Sun, 31 Mar 2019 07:43:04 +0000
Received: from smtprz15.163.net ([106.3.154.248] helo=smtp.tom.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAV7M-000600-Pt
 for linux-mtd@lists.infradead.org; Sun, 31 Mar 2019 07:43:03 +0000
Received: from 172.25.16.147 (unknown [172.25.16.147])
 by freemail01.tom.com (Postfix) with ESMTP id E49451C85F20
 for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2019 15:42:50 +0800 (CST)
Received: from 172.25.16.90 (HELO smtp.tom.com) ([172.25.16.90])
 by localhost (TOM SMTP Server) with SMTP ID -294487056
 for <linux-mtd@lists.infradead.org>;
 Sun, 31 Mar 2019 15:42:50 +0800 (CST)
Received: from antispam1.tom.com (unknown [172.25.16.55])
 by freemail01.tom.com (Postfix) with ESMTP id DA2A81C85F42
 for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2019 15:42:50 +0800 (CST)
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
 by antispam1.tom.com (Postfix) with ESMTP id 6289D100186C
 for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2019 15:42:50 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at antispam1.tom.com
Received: from antispam1.tom.com ([127.0.0.1])
 by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 38RqktdqEq6b for <linux-mtd@lists.infradead.org>;
 Sun, 31 Mar 2019 15:42:49 +0800 (CST)
Received: from localhost (unknown [222.209.17.169])
 by antispam1.tom.com (Postfix) with ESMTPA id 89C501001870;
 Sun, 31 Mar 2019 15:42:48 +0800 (CST)
From: Liu Xiang <liu.xiang6@zte.com.cn>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtd: spi-nor: fix nor->addr_width when its value
 configured from SFDP does not match the actual width
Date: Sun, 31 Mar 2019 15:42:37 +0800
Message-Id: <1554018157-10860-1-git-send-email-liu.xiang6@zte.com.cn>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_004301_024689_6E8FBFEE 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, Liu Xiang <liu.xiang6@zte.com.cn>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, liuxiang_1999@126.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some is25lp256 get BFPT_DWORD1_ADDRESS_BYTES_3_ONLY from BFPT table for
address width. But in actual fact the flash can support 4-byte address.
So we should fix it.

Suggested-by: Boris Brezillon <bbrezillon@kernel.org>
Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
---

Changes in v3:
 add a fixup for is25lp256 to solve the address width problem.

 drivers/mtd/spi-nor/spi-nor.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd..d252a66 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1682,6 +1682,28 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 		.flags = SPI_NOR_NO_FR | SPI_S3AN,
 
 static int
+is25lp256_post_bfpt_fixups(struct spi_nor *nor,
+			   const struct sfdp_parameter_header *bfpt_header,
+			   const struct sfdp_bfpt *bfpt,
+			   struct spi_nor_flash_parameter *params)
+{
+	/*
+	 * IS25LP256 supports 4B opcodes.
+	 * Unfortunately, some devices get BFPT_DWORD1_ADDRESS_BYTES_3_ONLY
+	 * from BFPT table for address width. We should fix it.
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
@@ -1818,7 +1840,8 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
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
