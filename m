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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB9CC432BE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:06:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F099D60E09
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F099D60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h82wIMRg2X5Pe0cQWgSqxKf41nSnqo/eu5gVFsvVKWc=; b=C//9uE45SfExsh
	oAXxLfzTVfVW5kq9lIn5h7Lt9NH1LMU0ejwo6rJTZbgwjA8tpLcaDZuSugoJNoxyPh4cV84olwWTJ
	FG54N8Jv9rW0dvY9nVxVvIBjc0lHDZnDsxcmg8w7nIbg5Yd/A8yVMrRL9Z7CAw+BBJgmjeQiIk1ir
	3e+Vn4SiO7S33LkA+yqafUsLVRC4OVMiSWyHQd/XfTHJeaJ2xRfXkxZ8Rp1+dngrIi7AfO8Hd1/iC
	pvpdnGcJbxfGaGWOzN9EOzfC9vIkIMBqL1+EvLuG/AEAPVIY7S4bYbYV2txFuz4sdy64yOFoERBeQ
	adSOFjbUk4Cb0IItRTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4mS-008qDg-6i; Thu, 12 Aug 2021 07:05:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4k8-008pWV-9N
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:03:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id a20so6130408plm.0
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tjv9m0jW87xZ4B3fxldj0vq3QYAZ+2FjcLReDNNKzYI=;
 b=t3fQONG0lX2FdR4DGy2qRRc66kTZDiGzV5tTruVnCjuKyeGaTV1/P6yI7uAH90fkMo
 9Mmq4Xsd4VTsuwZSzWAcl8ymkjAraW/TfyEr8whpvHXdpDVreCk0gRLULd/KO/GFU1Ws
 SuRekotpEkcmQZrCvDyqn9SpX21bzdNi0JaE+X+PDzrx7lvtA09+6Smvb32KJTAfsvuU
 nxBbN8QWr7tSDSYtCbdshdsnOGWHI1I6oPbM8ARnXxzt2h4kagBUUBKTY4VHH/o42rkS
 INLy4Xe+/kNREWoWA0hFiOi+JmM7t7M8w1POjHCKtv5i2XhCICs25GZz5isRBvTAH0+Y
 ySuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tjv9m0jW87xZ4B3fxldj0vq3QYAZ+2FjcLReDNNKzYI=;
 b=OaJNbZjqP07QZu4Rc77ijNDv0gaMLRl1ty+GUtkhRZsGpGJhFneTSHS9ISUcQNkoDB
 LKV6JlXQFhAwv4OuqN1g6NIZWMHKYoUJd1huAKw1Cz9DsXs7FATQEXyHCOKR0QpHf3oA
 vAC1YSfmMLhJjJXYaZfHFKMU+QLPGFfP68ycwlUAQKAzIk3LNgUz9sfK5rLjwS2z2wRp
 Z75uatHsJGqK9YypT1Jxb4e1Ftr/4xRw5ryJF4VHNjIcsQ3sC4jCxVXjjqWkobTqHl7d
 Q8ne/0cBYRft4XrOtI7tlDqLc5QkeFBu3Qt+F1n8VFUSj3/CFo+J8Qun2Y7KAjN8ioV8
 FRag==
X-Gm-Message-State: AOAM530jeKS6J/dgMi7D3KW+kD410kYPL/JmzwFSUOyHi796KfWvFdti
 +vcE0dqQDEUney/De/A8MJ8=
X-Google-Smtp-Source: ABdhPJxqOMn1Y2AEMgvUaUfbKrdUahhuMpqBBG2QJtByDrwOkKCLcR3fvZh3bzlEzInCCtKIiRhryQ==
X-Received: by 2002:a17:90a:150d:: with SMTP id
 l13mr2843429pja.93.1628751787275; 
 Thu, 12 Aug 2021 00:03:07 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:03:06 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 06/15] mtd: spi-nor: macronix: Add support for mx66um1g45g
Date: Thu, 12 Aug 2021 15:01:26 +0000
Message-Id: <20210812150135.4005-7-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000308_377245_C1F02E66 
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

Add support for mx66um1g45g spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2803b
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
mx66um1g45g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx66um1g45g
zynq> hexdump mx66um1g45g 
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 3fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 7989 0001 128d e200 02cc 4467
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
0000130 3514 809c 0643 000f dc21 ffff          
000013c

 drivers/mtd/spi-nor/macronix.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 28cff9843781..d9ffba32dde1 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -192,6 +192,11 @@ static const struct flash_info macronix_parts[] = {
 				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
 				 SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
 		.fixups = &octaflash_fixups },
+	{ "mx66um1g45g", INFO(0xc2803b, 0, 32 * 1024, 4096,
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
