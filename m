Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B150AC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 02:56:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84477207E8
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 02:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KzQS81C9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84477207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=bitland.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TWJIapI8nSzLLOYyHagE2pzJvzBQtm0uTpZATAvAGMs=; b=KzQS81C9DtldWf
	O0ZK48WOLhWogyejcR9oiJhX9W+0PDHGg7RECyZDalB8yAk9N5ikE9K03VNih2FlqswqnsvzGSyE9
	rhBfHRsRzIeNzSdLuDXwsakGcV97WOCgKpED/nN0a79QBoQ6EeCg79eOSHIeVg9mElDzqJ0DUDq5m
	Yt3Sx5C0ip5RmB6kDht+K1iJODxBEs/mkG7CoFCu10zQnIrX7MOyaaZLvAucKP1U72rSndXdZvjSi
	pHE6aESd5uSDvOI0Oay0Qa75BM/eY/bcHqM7CogO5/wH91j4HCVqjzZ7SLSTOPDARxuRHUfMTI5rC
	0zC1JYCaorTkeN3GbmYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je8iN-0005TR-Gu; Thu, 28 May 2020 02:56:15 +0000
Received: from smtpbg704.qq.com ([203.205.195.105] helo=smtpproxy21.qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je8iH-0005DL-3O
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 02:56:13 +0000
X-QQ-mid: bizesmtp17t1590634531t4kkroiy
Received: from localhost.localdomain (unknown [119.145.4.99])
 by esmtp6.qq.com (ESMTP) with 
 id ; Thu, 28 May 2020 10:55:05 +0800 (CST)
X-QQ-SSF: 01400000008000Z0ZM30B00A0000000
X-QQ-FEAT: uJKlVohL8WrUmw5d04dFFrqzkgAeOWXIToTH7WzM6KcwWQSN0b8y8Nxejvw4W
 dkt5TuBcZ6dSar9Sn5vl7VTFkOol1StpX7ZF/mnKXyE8OYCcuO8FNNDKwXpab5SbP9gEURx
 YTgfzdqC8MA4dIM1uYrYzVoVIZQW4Lz33KCTt436b837Ezg9bUPLg9kAoXieHoIo7zOW4ce
 tqnKj9cCJL/ozufCUTaYtR0waY9RnlQI+B5gtPQOKvy4Me8jOXS1iiIe+w1yvZMVpraJ3k5
 XZlUnjviXASmwOoB8zwodEFsH5T/LfIDH43iGpGUjkCOTk27zDOZhxwV8bNi5DyPiqm5OIT
 nVr1LHYvFEvPCT9wPs=
X-QQ-GoodBg: 2
From: wuxy@bitland.com.cn
To: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, drinkcat@chromium.org,
 linux-mtd@lists.infradead.org, stlin2@winbond.com
Subject: [PATCH] [v3]mtd: spi-nor: winbond: add 1.8v SPI NOR Flash IDs
Date: Thu, 28 May 2020 10:55:03 +0800
Message-Id: <20200528025503.24003-1-wuxy@bitland.com.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bitland.com.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_195609_205345_7E0062B5 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: wuxy <wuxy@bitland.corp-partner.google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: wuxy <wuxy@bitland.corp-partner.google.com>

Winbond has new 1.8V SPI NOR Flash IDs,we need to use the SPI
flash IDs in kukui series,this patch can support the new flash IDs.

TEST=boot to shell,get the spi information from 'dmesg'.

Signed-off-by: Xingyu Wu <wuxy@bitland.corp-partner.google.com>
Signed-off-by: ST Lin <stlin2@winbond.com>

This patch copied from:https://patchwork.ozlabs.org/patch/1150756/,
The original patch is invalid,so re-submit a new patch for this.
---
 drivers/mtd/spi-nor/winbond.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 17deabad57e1..cda4f8847bd6 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -61,6 +61,15 @@ static const struct flash_info winbond_parts[] = {
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
+	{ "w25q64jwxxIM", INFO(0xef8017, 0, 64 * 1024, 128,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q128jwxxIM", INFO(0xef8018, 0, 64 * 1024, 256,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q256jwxxIM", INFO(0xef8019, 0, 64 * 1024, 512,
+			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			    SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 };
 
 /**
-- 
2.20.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
