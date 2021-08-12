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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB60AC4320A
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70233603E7
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70233603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMLjbPg7BUwGALkbhMdNvCmn3EfeqbkJQdYCHFvLBA4=; b=x0uat0PgGjUwp4
	0mdmy+QZNxNWydDP0EC45q1cD4iSIGoA6LwULceZ+81x04HYrKFtFn7FjYxJCJBMRGXiyKaGjbeg6
	EUslN1UDWA/t6h9PUI+eNg+YHkzCejMjL05PKfhcm2P/gLryqF7h7L5+q3QqYaPIDT0nF5+Xp6O/g
	FWOwLjfDLyUTFzuEDX9wlFyscxHye6uLROJ7D44nVQQgIquHw9ibMyP+XiNdlaEpbgPSYTZjODJxP
	UX6d35c2RENM4xu9d37pHkQJ4AUYgOsIWKoDtrPLe9yAL5ThIFq4rGE5x/hWvttksm7wp7L9nrV7n
	0bgg1Lkph47Q+r+xp4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4w4-008s6p-Ve; Thu, 12 Aug 2021 07:15:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4kR-008pb9-N9
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:03:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id c17so783846plz.2
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vb4EGf15nEimpXwkcn1OCHfcJU0Qitp68QGq+40gZBk=;
 b=OX//T86A4dbHFqXwcM1p+JQEGzosFpXI/WeoIGjnN7w2FDlpBMhAPw9oOTkHN8BzDB
 kIXGuaKq6vkVqkk0onX6wH96LaVzdk9krH6U0BLXJ/tcwwzeHmJR8ddVKfHo0HVnLW2a
 qo7cJ8fUjgCTVq8PsHy+G10keW71ueNYEKXYb3MH6beuG4Cw8vFa1Cv6EOMVNf37G0Xs
 wQQsjrBVTWPXfko5MsZgfBetCDAku+waxtDd6h0U5kATOf8Y5kq3CFjow1DmpJdBBfzW
 19cUc+quzZp6CrZX6yJ/3WQyZFAyWNC1V/my4mfmsip7xl9iYUnLOOlVsSxmPpBfqOp2
 GhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vb4EGf15nEimpXwkcn1OCHfcJU0Qitp68QGq+40gZBk=;
 b=TYZPraVClCvSW4WQKD3L4C0HASfGwpZme2BnlRroyj0TzTnziFAnAA5Hb2j2jGIi3G
 ZbFDBX5DJCc7UQv/2auh2HU7EGtf9HdKX4TbsShmjFQhhL9l2BHIdRqz4+208uiyVs6y
 1hmrTkflG+Sg8uJcoCHwCzh9l0pZsNnDhym7XJc3f16n6erPS2WThol2PeplMlPAw066
 SWD+/zguoeOSOF9d8En6tJFeEFPflu8Gcx0yBGuCYdXfS6Gev08y2Yq6sAviiZJ/1c2m
 mlxgbxD8FO9ZtilafYzTJgX9CBH9FiZNj6R0Rj69bLTPhd1iQdw2bWz8lzMgQnfQMmxU
 Dn4A==
X-Gm-Message-State: AOAM531CKrikkv6QsORxixrvObzEHpUpskowPHGziRL12KtkeGfGkxns
 4IekbWZobA3QTjRnRz4tOOY=
X-Google-Smtp-Source: ABdhPJyTKMwPeWzmJukkx/NpkJa0rqlmrLTmZVuIdOaF2ZmpGtz5zbAbHfuAZot7ug0Fz1U3r8AdGQ==
X-Received: by 2002:a17:90b:102:: with SMTP id
 p2mr14986821pjz.126.1628751807321; 
 Thu, 12 Aug 2021 00:03:27 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:03:26 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 13/15] mtd: spi-nor: macronix: Add support for mx25uw25345g
Date: Thu, 12 Aug 2021 15:01:33 +0000
Message-Id: <20210812150135.4005-14-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000327_788576_10E5AE4C 
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

Add support for mx25uw25345g spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28439
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
mx25uw25345g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25uw25345g
zynq> hexdump mx25uw25345g 
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 0fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 7987 0001 1284 d200 04cc 4667
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 237c 0048 0000 0000 8888
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
index aef797b4d3e1..764832be1622 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -227,6 +227,11 @@ static const struct flash_info macronix_parts[] = {
 			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
 			       SPI_NOR_4B_OPCODES)
 		.fixups = &octaflash_fixups },
+	{ "mx25uw25345g", INFO(0xc28439, 0, 8 * 1024, 4096,
+			       SECT_4K | SPI_NOR_PARSE_SFDP |
+			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
+			       SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
