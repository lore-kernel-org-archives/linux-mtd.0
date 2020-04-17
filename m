Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4691EC2BB1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 06:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14A721D82
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 06:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YnRaFe+t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F14A721D82
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QF/VqFkzgxt/zhJKVSqZbSmvSUJ9i9Kl3d1xwErpuYY=; b=YnRaFe+thejTot
	w/9exVP7lm9vIJ/WebMNMUo0OMFxofOmpc1RggPPCkY6EQYBnBAKn02oZZ+Df9/KwMQwjsX6dS1zb
	t5OAYdPIlVfFkJneSz8PtuOcBuofpUG6x7eynaBXqDEzPt9rKHCni/TwzA3+12ncq35uIW8p3JLCB
	/wdSPnmPHBgLGMCmOS/qApAvOY0R5pDQ+Sm7wqQULD8YedI5hnYFZ5VJ6tR/8WoTOEKwhyvE+107v
	FqaUx5gR+pbBNg27vn4o0hr07safp7zsVGNYrFHVIsauTkfrHenmH30WR1m4dXzIU+0nmHiXvdV13
	7276m5kjcyPoYeV3qz/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPKEO-0008PH-Nn; Fri, 17 Apr 2020 06:12:04 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPKEK-0008OB-FU
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 06:12:02 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6801E8BD026F387D94D8;
 Fri, 17 Apr 2020 14:11:51 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Fri, 17 Apr 2020 14:11:41 +0800
From: chenxiang <chenxiang66@hisilicon.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2] mtd: spi-nor: Enable locking for n25q128a11
Date: Fri, 17 Apr 2020 14:07:57 +0800
Message-ID: <1587103677-244754-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.69.192.58]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_231201_089698_68B03C91 
X-CRM114-Status: UNSURE (   7.93  )
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
Cc: john.garry@huawei.com, linux-mtd@lists.infradead.org, linuxarm@huawei.com,
 Xiang Chen <chenxiang66@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Xiang Chen <chenxiang66@hisilicon.com>

As 4bit block protection patchset for some micron models are merged,
n25q128a11 also uses 4 bit Block Protection scheme, so enable locking
for it. Tested it on n25q128a11, the locking functions work well.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Reviewed-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/micron-st.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 6c034b9..02c0b53 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -29,7 +29,9 @@ static const struct flash_info st_parts[] = {
 	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128,
 			      SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
-- 
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
