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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D77C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3D9603E7
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B3D9603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCQwemYz8PkuNsEQBo07v3b8OWoFzuNs7p3BI62TbIw=; b=muxLsDH4yPjsnN
	jpY6qrYGhBgxoIScdn4yWDAIzyroLo7UZPcZ6cDpt5eimZ314ZvksfDZ0Pi3sTXJ4spNJEhTqTT9k
	Ksx5OsTaapV5PLFIazgW2WXlKXizryWo9AeBThkHAoQZcgmvbn3LElQiSmaezS/asgdGdc+8DvJDA
	bIfQcVcJsy9YsoVAMrKWiDhs1JLrVPp4ai1GJRVbZrJBN/Me69RqXdL+J7OTnNlOWO2005AV2N/PZ
	X+pEX9tmrQpCAbgEURWuQs2B/T1/EccIgpdCJGQkzla0t1JQJOK2waaPYOYBVLPFZwX1LiGoec39P
	Q7F0EsCaVmhZQVCA7PKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4yD-008sSA-PQ; Thu, 12 Aug 2021 07:17:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4kV-008pbk-0p
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:03:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id b7so6076137plh.7
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=04ma0zdR/qHLRU2SqYgZf/6QZ5K/X58K+Cf2FYupRfc=;
 b=tvz9tH+09ugGtc25QMMG5gf71lWwPWwLF4jAPCZKWyHnPFdbbDcBVm2Sw0xmpvWhtu
 Z1qaT1d58bXPSCfyeYaHuiDQO3uJ+M4S+tTsTbnzG9jvUBqafwtAqjMunIyQ33vYg1BT
 qjMclfPHTUmFMGq3A8n+aaXdmB6Bst1+4LA4cI1I2Z/aEjQh7Dp2MNu7b2WYRfht7Tlx
 U79caLfGwnpM96cNetBeOV0wUbV6mj9Am9RS6juEw0dBQalb03ANipuhuo82TAuk/tcQ
 /VoBlZRSlTCEDSjOO/XAfux4eLeQao+jBqLvW3OJNJuPgKMT54qWWRae09pblGqpE8Tm
 a/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=04ma0zdR/qHLRU2SqYgZf/6QZ5K/X58K+Cf2FYupRfc=;
 b=YIfnJUjgZEUliEOtoOkGH1jTEmQ7SZe8Nb60M+9UrobgweNgKiodq3tU4KDu7BW+ra
 0nqqaOvmAQvYQAz5TeBOiOETY2u+WsJ+PrZwajwdXZ9rhtOmKY7iSUtbrUQQd1/8pyRP
 qukrbSKNZTsi5N+cV18tGZuFDZfI75q8IP0p8PmyqBQa9mZz9Bqs7gHkQTRkkSRmdmSh
 TvWqJD3LLMHow3+mpDnms234bnB5gYV4/NgHf+g3vtPXvRoGwPZHcoN93HswOmknxd+n
 /qzbMF44nRA0fCH4oL6V/0AmkPLt8QxK8vFeNloKIIBAV2OtmzKQ7rJSD/FUwk0qa1+R
 YduQ==
X-Gm-Message-State: AOAM5310CnTJ2k3xpPhmMfGumCNlbfvciBPbwuJVF7PwvKj7+5NMK3T4
 yMRniCPbr39BFKAtm66+Gnw=
X-Google-Smtp-Source: ABdhPJyMRWG8s1tjxKjhISO91pibepe7qdAM6p0wFM+3Zayn9MRiLpJFNLeTh11EkAsDZgRTzJD4HQ==
X-Received: by 2002:a17:903:2345:b029:12d:33e5:d8aa with SMTP id
 c5-20020a1709032345b029012d33e5d8aamr2473648plh.18.1628751810023; 
 Thu, 12 Aug 2021 00:03:30 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:03:29 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 14/15] mtd: spi-nor: macronix: Add support for mx25uw6445g
Date: Thu, 12 Aug 2021 15:01:34 +0000
Message-Id: <20210812150135.4005-15-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000331_107704_6AD5415A 
X-CRM114-Status: GOOD (  11.45  )
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

Add support for mx25uw6445g spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28137
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx25uw6445g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25uw6445g
zynq> hexdump mx25uw6445g 
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 03ff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 7989 0001 128d c400 04cc 4667
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 a37c 0048 0000 0000 8888
0000090 0000 0000 0000 4000 d10f f3ff d10f f3ff
00000a0 0500 9000 0500 b100 2b00 9500 2b00 9600
00000b0 7172 b803 7172 b803 0000 0000 a390 8218
00000c0 c000 9669 0000 0000 0000 0000 7172 9800
00000d0 7172 b800 7172 9900 0000 0000 7172 9800
00000e0 7172 f800 7172 9900 7172 f900 0000 0000
00000f0 0000 0000 1501 d001 7172 d806 0000 5086
0000100 0000 0106 0000 0000 0002 0301 0200 0000
0000110 0000 0106 0000 0000 0000 0672 0200 0000
0000120 ee00 69c0 7272 7171 d800 f6f7 0a00 0000
0000130 4514 8098 0643 000f dc21 ffff

 drivers/mtd/spi-nor/macronix.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 764832be1622..01537b5af132 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -232,6 +232,11 @@ static const struct flash_info macronix_parts[] = {
 			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
 			       SPI_NOR_4B_OPCODES)
 		.fixups = &octaflash_fixups },
+	{ "mx25uw6445g", INFO(0xc28137, 0, 2 * 1024, 4096,
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
