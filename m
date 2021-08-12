Return-Path: <SRS0=P+6h=ND=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	DATE_IN_FUTURE_06_12,DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C824C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05BB760E09
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05BB760E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRO7h0LlYMxaGhxFpOl4HwfLcea5G+4hd4jm59UeZgc=; b=T6PVnrmEPo3uuP
	ZZ1aj1fxpWIvCFb1+6295UMVpHUghTaxJMmpFxZM7VbDUp1J2eiQ8kpXjjpaqHa5OFGYORel2+TvT
	AUPfR1GOeUTUFg87N0zTUAnkGircs+e/ITsZt9UdBu+BpGMRtVL5VMTi8TyBd/WygH5A4MryfB5GE
	Zm/I4Wyen/PD+tiXcjJtHrHOTu3MBP5qulCfzVPjh2nyYA4qazS+WHhKdLr2jNwg22yxuwIAx4EjJ
	vQIzmDcZ3i7dp35XfDpdwa8egVYgO71S2A1shSnanHDx8b7yvHBE2sQ1UxbelfRpsQmimroW84Nf0
	jLthanylN+67QC5cFU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4kd-008pdx-96; Thu, 12 Aug 2021 07:03:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4jy-008pUL-V5
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:03:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id q2so6045170plr.11
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RGLEmuaNVnnv4mR0hMBwGqQs2u8g34lBoP9IKSg6Z/4=;
 b=RReS9fKyvWcNmhoXGXbd+J/9fbTqtzlyFTLu1AIuTubfMkDrUauluRX9nMQwRlXzWA
 eZVaLk+XEkcKRQRqeXIl0+1BEOQFNoEbzID78roUljrU+Q8BMfjslRTSpzQG9BeWVbVz
 E8jJ1qnFdoX5cbjsBw06ts9dZjocsAnwGmuMZNxugQ3Jv2g3fdqOcLlQdkJxPTcBgMHt
 qbFymMh0L5H6G8Z1JWgLmEhUAAQD/jzWI5SWld6uPwIHeHN65eXFArwiUTOLGhQvFXOa
 v1mIWSwU9OKmdYZJCrofrnA3my/wu9JPdHcR7KaEjHcf+snfMmKX+dDJWDhqhjWKQ1Ib
 KmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RGLEmuaNVnnv4mR0hMBwGqQs2u8g34lBoP9IKSg6Z/4=;
 b=icAlKL3djSPFvCPM+URZ/GES4gLIRsfKs3JMraEDA6ERg/Y9LBn1OstdfMYGTScmDr
 +wi3+BM1yxRTeXOq8oFR+zj+ReDMk+aO6s0DNnI1ZvUiGwX83MQRTakGmFbJqe7wlZri
 pyAinU1hwHSsV1V7yuxdaTDXOPQ3WLEX23aVHjud5if3qvR6dFRj8b4+DhNEja056sKx
 O73C5syEK8rROSm8Okh63GvFPtxZ3Y1pPCq5x15nVlfE31QOwGRcOT8H1lQl7PfOUpks
 ZyQgznydQt6nhBuVLSE25N434JkoBilkfu2Z3AjuQ351XrPz1VSDomgueFp6qqZJPuUd
 s7Xw==
X-Gm-Message-State: AOAM533x8uiAvb70z0gVKIIcvUbbs7qUf8A8mu0r6vPJN/s0o7idZFJs
 UCeRg0rVRX/gFY068gSuonM=
X-Google-Smtp-Source: ABdhPJyL7ymGBGF1Z0adgExAeCxV+uhWFlpajRynAEYmjTrzpbsyiZiuBgCTmD1tiCDfVXT5l7VjEg==
X-Received: by 2002:a17:90a:716:: with SMTP id
 l22mr2901025pjl.128.1628751778007; 
 Thu, 12 Aug 2021 00:02:58 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:02:57 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 03/15] mtd: spi-nor: macronix: Add support for mx25lm25645g
Date: Thu, 12 Aug 2021 15:01:23 +0000
Message-Id: <20210812150135.4005-4-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000259_043374_45F1B7ED 
X-CRM114-Status: GOOD (  11.43  )
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

Add support for mx25lm25645g spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28539
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
mx25lm25645g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx25lm25645g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25lm25645g
zynq> hexdump mx25lm25645g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 0fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 6987 0001 1282 d200 02cc 3867
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 a37c 0048 0000 0000 6666
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0000 0000
0000130 3514 001c 0643 000f dc21 ffff          
000013c

 drivers/mtd/spi-nor/macronix.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index f3c7a89b7380..8308bd7b953e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -177,6 +177,11 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
 			      SPI_NOR_4B_OPCODES)
 		.fixups = &octaflash_fixups },
+	{ "mx25lm25645g", INFO(0xc28539, 0, 8 * 1024, 4096,
+			      SECT_4K | SPI_NOR_PARSE_SFDP |
+			      SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
+			      SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
