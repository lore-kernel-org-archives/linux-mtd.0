Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F43C4361B
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 20:23:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5FA22388C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 20:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5FA22388C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ami.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AddmzmlSgFOd0kcyHgEd5khy7vGJ7kOolc35QcR2N0I=; b=vb8gsxKwQnUwP8AXWvjSjO0s3
	hVPNkW+cczcnZE/2x/ZjtO3HA/ShUf9+wO1OlDwW8A3yxUqaGug0D7R1ycPXe+lYM+eWfERGsg2X7
	ciJSIBuGXvLaYqhVsly036t3sCIgWUUxB1TwA6OVMlqQmZGkLqQO/o7GYOGmOBtixtvnqcGfpsgzS
	I6vVDPzu2cFNj9RWIAzD0IsaahG6KVMuFzqQVG7KhvLnl5G8y8k0oQw2Gt1ob/33HnSBrn8SgzawP
	zU6cYzSsAV67sMdRCUctWjlulLrgGHLAsnDdoV75ldc35JscyB6AvplJtClzx0Wkv9NmMMBD8CjJi
	yZT5J27NQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmjVm-00030r-7h; Tue, 08 Dec 2020 20:23:02 +0000
Received: from atlmailgw1.ami.com ([63.147.10.40])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmjVj-00030M-D4
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 20:23:00 +0000
X-AuditID: ac1060b2-a93ff700000017ec-f2-5fcfe0a123aa
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 9F.DB.06124.2A0EFCF5; Tue,  8 Dec 2020 15:22:58 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Tue, 8 Dec 2020 15:22:57 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH,Aspeed, v1 1/1] mtd: spi-nor: add Micron MT25QL01G flash
Date: Tue, 8 Dec 2020 15:22:20 -0500
Message-ID: <20201208202220.30302-2-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208202220.30302-1-hongweiz@ami.com>
References: <20201208202220.30302-1-hongweiz@ami.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFLMWRmVeSWpSXmKPExsWyRiBhgu6iB+fjDWbeF7HYdZnD4vf5v8wW
 u5uWsVt8XOLgwOJxtX0Xu8fFj8eYPTYvqfe482MpYwBLFJdNSmpOZllqkb5dAlfGnq7FTAVt
 HBUPl11kbWA8zNbFyMkhIWAiMeHtZCCbi0NIYBeTxMWVJ5kgnJ2MEs2/5jCCVLEJqEns3TyH
 CcQWEdCXeN9+G6yDWWAKo0TrqTVgRcICHhL7fy1hB7FZBFQkrrV9AWvgFTCVeLPoGAvEOnmJ
 1RsOMIPYnAJmEgtmN7GC2EJANU/uvWCGqBeUODnzCVg9s4CExMEXEHEhAVmJW4ceM0HMUZR4
 8Os76wRGgVlIWmYhaVnAyLSKUSixJCc3MTMnvdxQLzE3Uy85P3cTIyQ8N+1gbLlofoiRiYPx
 EKMEB7OSCK+a1Nl4Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryr3I/GCwmkJ5akZqemFqQWwWSZ
 ODilGhiFQgPMbl+b86Ffdd7eWPGqDfdZLj1blebdw9fD1nBWW+fg7fmBZ1fvDeW40/Vkiibj
 zp8Z3atPNxTd45Pnf3FMtyUn/d/VvytEo664c5lc59dSb47ZkprcJXPTxMqr9+Bic667J/be
 ep63e0XMEzde0+/Rs5+/7+93yvhfovaphv/Ltuq0+htKLMUZiYZazEXFiQA53pcQPQIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_152259_557053_A5A797C6 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: Andrew Jeffery <andrew@aj.id.au>, linux-mtd <linux-mtd@lists.infradead.org>,
 Hongwei Zhang <hongweiz@ami.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add Micron MT25QL01G flash, used on AST2600 board.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 99ce971ebc6d..800890038c39 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2312,6 +2312,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
+	{ "mt25ql01g",   INFO(0x21ba20, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
 			      NO_CHIP_ERASE) },
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
