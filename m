Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B5EC38142
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Jan 2023 03:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VGi+j5d/JayoP6YsocB1KVdOevFvnG6x3RJBC5lCJp4=; b=4UG8rtyHKT/6pE
	1XX046e7NsV9Emp3DtUsjJetU8DpJoys+KKzHyVffAEv0D1ruYHF3MpW6ul7440uHTA4CBC0lGhEH
	IzwKRCTcx6+8T1ChTINoL5FJ1lhpFBp8YzVQp5OL0qkyVso/Vo8YwESJulUkumOry28MGMDL+f3Af
	SEL1123KtOi5ZYaw3k0O3tPyWv+klNEWe9K9Fg8Yb0/c7clnm4zjFM8c7bqaLfG0fnLXbn9FvQJat
	N+Y+U31b938Rao1yHIcUXyI0AT98uotVuUdO2yUR7Sf7TT8ShB6ArotU7q27ekHkl8/ZZ3oZPw+0f
	TCqNWBks+xpV0ABbVtOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLc4u-00H75b-04; Sat, 28 Jan 2023 03:40:32 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLc4q-00H74v-H3
	for linux-mtd@lists.infradead.org; Sat, 28 Jan 2023 03:40:30 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=guoheyi@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VaGFfVQ_1674877199;
Received: from fdadf40dcbca.tbsite.net(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0VaGFfVQ_1674877199)
          by smtp.aliyun-inc.com;
          Sat, 28 Jan 2023 11:40:19 +0800
From: Heyi Guo <guoheyi@linux.alibaba.com>
To: linux-kernel@vger.kernel.org
Cc: Heyi Guo <guoheyi@linux.alibaba.com>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] drivers/spi-nor: add support for Winbond w25q01jv
Date: Sat, 28 Jan 2023 11:39:57 +0800
Message-Id: <20230128033957.125853-1-guoheyi@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_194028_778447_6EA32F62 
X-CRM114-Status: UNSURE (   7.84  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Winbond W25Q01JV is a 128MB SPI-NOR flash chip.

Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>

--
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/spi-nor/winbond.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index ca39acf4112c8..0cd49f534bf8d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -142,6 +142,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
+	{ "w25q01jv", INFO(0xef4021, 0, 64 * 1024, 2048)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
