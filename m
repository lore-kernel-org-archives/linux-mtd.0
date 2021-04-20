Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52979C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 06:32:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91EF0610CC
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 06:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91EF0610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqyCFz4nd2/85LnajwHmhLhFJKdPRSWMASXOsXxLelA=; b=jwiqAUON+ReoI7lR7emrXolI+l
	zxmqrYcix55+/MAvyMSNl3ZZ3RCCK9eo0WhCg4cPvstCfrnBEIlB5Q8fFkFipmYZV224iMdrTmqo4
	Nt3hNxmU6/+9EgahCPkysJl4O/bpzsn9eLsnjg9UpGpAX9QN9gSOCTD40VrrZG+Ee8NXltEls8uh6
	xYM931d301xQhawFSaAJ/rBv6Zn+sz72+ukBWZmm0CZQtHBCNWsDZsOELGiryqfyO+tyfDLRk7+DE
	zrmEHencAR4XLhNBOpcduuadZODp4OqOOuxbmnHkiFTWt62NuK4NH+RWPDd6y9Zy99zFFZZSGf+TM
	u0RqohjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYjv3-00BMQK-23; Tue, 20 Apr 2021 06:31:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjuU-00BMGD-79
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 06:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7tuz1rA8xKi4H1hB95mXFi86puX4+Khx5Hj9y1cTpMg=; b=c9kLIkOYoxBRJP+B6nxiquZ+xL
 BgQPYnpyRn7tedqO894w16wbhBbSwqnkHhXVwDF52GwUa/nBJktyI94gFfDA2jEvdVefTFrC5qQ5k
 72r0NhC1jF24Z5bTeiigbycCyTZwfq4mbGqaGnt8iTFEVJ0RjCJtN91PHvjbW9Euz2ebDyD1kIXnk
 k9Zlofh+YbmVepvLux3wnHlm2Pj9mdFaAEIer/XmYI7mgPm6R9UsmqUDze1l61qkxOgdw2EOZq26U
 s3Tw/BwOfMX4xPvUzG8zfDeaoLvCJW7nFfHKHHi3rXRun1aLcIBuuT1QFjImY7TndSEdhmqE3adyZ
 h2N7zDMA==;
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYjuQ-00BqhG-QM
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 06:30:56 +0000
Received: from localhost.localdomain ([172.17.195.94])
 by TWHMLLG3.macronix.com with ESMTP id 13K6UM7d083760;
 Tue, 20 Apr 2021 14:30:36 +0800 (GMT-8)
 (envelope-from zhengxunli@mxic.com.tw)
From: Zhengxun Li <zhengxunli@mxic.com.tw>
To: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, broonie@kernel.org,
 jaimeliao@mxic.com.tw, Zhengxun Li <zhengxunli@mxic.com.tw>
Subject: [PATCH v3 2/3] mtd: spi-nor: macronix: add support for Macronix
 octaflash series
Date: Tue, 20 Apr 2021 14:29:38 +0800
Message-Id: <1618900179-14546-3-git-send-email-zhengxunli@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618900179-14546-1-git-send-email-zhengxunli@mxic.com.tw>
References: <1618900179-14546-1-git-send-email-zhengxunli@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com 13K6UM7d083760
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_233055_155781_412FC726 
X-CRM114-Status: UNSURE (   8.21  )
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

Add 1.8V and 3V Octal NOR Flash IDs.
MX25 series : Serial NOR Flash.
MX66 series : Serial NOR Flash with stacked die.
LM/UM series : Up to 250MHz clock frequency with both DTR/STR operation.
LW/UW series : Support simultaneous Read-while-Write operation in multiple
	       bank architecture. Read-while-write feature which means read
	       data one bank while another bank is programing or erasing.

MX25LM : 3.0V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7841/MX25LM51245G,%203V,%20512Mb,%20v1.1.pdf

MX25UM : 1.8V Octal I/O
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7525/MX25UM51245G%20Extreme%20Speed,%201.8V,%20512Mb,%20v1.0.pdf

MX66LM : 3.0V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7929/MX66LM1G45G,%203V,%201Gb,%20v1.1.pdf

MX66UM : 1.8V Octal I/O with stacked die
 -https://www.mxic.com.tw/Lists/Datasheet/Attachments/7721/MX66UM1G45G,%201.8V,%201Gb,%20v1.1.pdf

MX25LW : 3.0V Octal I/O with Read-while-Write
MX25UW : 1.8V Octal I/O with Read-while-Write
MX66LW : 3.0V Octal I/O with Read-while-Write and stack die
MX66UW : 1.8V Octal I/O with Read-while-Write and stack die

About LW/UW series, please contact us freely if you have any
questions. For adding Octal NOR Flash IDs, we have validated
each Flash on plateform zynq-picozed.

Signed-off-by: Zhengxun Li <zhengxunli@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 100 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 881eaf8..8c1cf1b 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -203,6 +203,106 @@ static void octaflash_post_sfdp_fixup(struct spi_nor *nor)
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mx66lm2g45g", INFO(0xc2853c, 0, 64 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66lm1g45g", INFO(0xc2853b, 0, 32 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66lw1g45g", INFO(0xc2863b, 0, 32 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25lm51245g", INFO(0xc2853a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25lw51245g", INFO(0xc2863a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25lm25645g", INFO(0xc28539, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25lw25645g", INFO(0xc28639, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66um2g45g", INFO(0xc2803c, 0, 64 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66uw2g345g", INFO(0xc2843c, 0, 64 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66uw2g345gx0", INFO(0xc2943c, 0, 64 * 1024, 4096,
+				 SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+				 SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66um1g45g", INFO(0xc2803b, 0, 32 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66um1g45g40", INFO(0xc2808b, 0, 32 * 1024, 4096,
+				SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+				SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx66uw1g45g", INFO(0xc2813b, 0, 32 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25um51245g", INFO(0xc2803a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw51245g", INFO(0xc2813a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw51345g", INFO(0xc2843a, 0, 16 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25um25645g", INFO(0xc28039, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw25645g", INFO(0xc28139, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25um25345g", INFO(0xc28339, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw25345g", INFO(0xc28439, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw12845g", INFO(0xc28138, 0, 4 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw12a45g", INFO(0xc28938, 0, 4 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw12345g", INFO(0xc28438, 0, 4 * 1024, 4096,
+			       SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw6445g", INFO(0xc28137, 0, 2 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
+	{ "mx25uw6345g", INFO(0xc28437, 0, 2 * 1024, 4096,
+			      SECT_4K | SPI_NOR_OCTAL_DTR_READ |
+			      SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
