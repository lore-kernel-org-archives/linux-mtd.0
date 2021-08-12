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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033EFC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6E8360EB2
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6E8360EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHWP+EqTFkAVcEbH1P3JLdrjLOhk4BL3+2pB6381sDY=; b=d9070Ds377JsmF
	1f6i/T0/u43jNeuXmoEfawoTP0kvlf6Y6vkytq/8NDSjEe6paaw/WBoZ5gzWiFabmHXHX7ybnWeNV
	UXyatJbvd246n2v12/VdkQHolxlHaO64C1nXS0mA/kX6M8ZS82+jA7tuTASFnOVhq7Tnuc3GZG53P
	566NSXwb1fKbevbrEMV9Mnbh1m/0gGXqOp3h0M0+1e1255y4f6asUmFCbbzzUeosRyv5G3SVI20/l
	yisEiFL2Fu3ubZsb6SZ9B/vxHs9Hv+YoDwBUCLcwAQWdt2quEvwKKMub4oZH+PEU6Ax2ntDo56dw+
	bhNNBYRnSS4fCkmdeiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4kL-008pZX-QL; Thu, 12 Aug 2021 07:03:21 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4jw-008pTO-Jg
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:02:57 +0000
Received: by mail-pj1-x1029.google.com with SMTP id oa17so7869954pjb.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DcrKtuEV0EN88KyVzSy2enNkvxWC2san2vLL9moX6HA=;
 b=P6hfWK93meo1BFuoC3P4YYgQPW5aJBAimtwhkrYbkz4wWMd8X+aU2k1qjVaZWW5LUG
 xiz0c79nD8tLtGOv4/p/KJ/gv6O3iOocyT+EO4cafmcHaUL5ylC/uXCqz/atCuzY7hBc
 SS2iOh+vErTzWfonBq/dKgVdsZWLRGmk70TglLEzwiLInKDXvWTlL/YS7mK2iGeeIewK
 dJwO+dyPIU8NWqeK2Vc5rBuHr45fJF3AjwFhZBC3Mlls0uuc1Iag3fqX3O7AEx+vfeeu
 rz1PrYvAZQ54YKIW9sbEUv/bH8SXAhrv11uxnqrprjJx7wuA/jMcP6DoaisKLJOuYUam
 dJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DcrKtuEV0EN88KyVzSy2enNkvxWC2san2vLL9moX6HA=;
 b=bW+FTK9dk/juw6cLMzubmZXM5cBN2iork90WyCv4GOWkQzTJbXlXvftGH60ZZuy3Vf
 Y3EhYD5+8FWJHQ05XzKeQXOLspubjh4gMPoA8UvVIumgsI2Uetgj7LGfYLc1L2tE4Ny8
 0XgCJVdpLAHKDvy3MI7BTfq+vOlV8W5keYZtbfw25F9KCz7dDhb6Zea7XDdJnndZpTnY
 /9nUP3zQF/vVWAqjabDcQcHVipZGMklRjfygWnuHzHM1KevZRdvXGiKkUo9MWpswu1dr
 9ep+C1NevjW8XWZNZ11NLqyp0ryaPUpDEc4JfBfrqKj6d0DhIeQZwwVj80QnVaoIjLRx
 g2rw==
X-Gm-Message-State: AOAM531gWoMKnTJmDfa9R2tZEZdOIieCRg9KKfAhHprL8z3wP8w15UHc
 QrGJPCJD/csORcasO/H3fwk=
X-Google-Smtp-Source: ABdhPJyVgCa3xSTtRfkDRElP1mAL9NyLEVXMM8ylUqhMbN+1ievZlBNTjL1eY8Dclr5zuZiNxxAbqA==
X-Received: by 2002:a05:6a00:1646:b029:3c3:2636:8d5d with SMTP id
 m6-20020a056a001646b02903c326368d5dmr2727627pfc.3.1628751774780; 
 Thu, 12 Aug 2021 00:02:54 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:02:54 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 02/15] mtd: spi-nor: macronix: Add support for mx66lm1g45g
Date: Thu, 12 Aug 2021 15:01:22 +0000
Message-Id: <20210812150135.4005-3-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000256_684751_78B2E743 
X-CRM114-Status: GOOD (  11.48  )
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

Add support for mx66lm1g45g spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2853b
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
mx66lm1g45g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx66lm1g45g
zynq> hexdump mx66lm1g45g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 3fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 6987 0001 1282 e200 02cc 3867
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
index 0fe5c9c8de8d..f3c7a89b7380 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -172,6 +172,11 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx66u2g45g",	 INFO(0xc2253c, 0, 64 * 1024, 4096,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mx66lm1g45g", INFO(0xc2853b, 0, 32 * 1024, 4096,
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
