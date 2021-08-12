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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1C3C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:05:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9564860E09
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9564860E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGiGH9NFaI9xcybu6E0d37NUVMSSqbN1ShLId0sCxFI=; b=oO5qzz57yp9Cwe
	CQw+3Q12zmQ4TsGRJeMQIeYATkybiBGH1KjrrWZbftWTRQht8gbfCcgV4BoYcS4Cxs7oib66w1n02
	6U9eyuOINPui4NRnJTKxdCOp+XHYPf7Xtt3F7V4quZ+2SgL2SWk+5d5fmsTUw1I3XGAP/C5TBp4Fo
	J4eUNlerRcxr35Y8u+h+4nNw2rewqHNsLlVyH1Gp8mrzhOUn0cvNQ35BJmXAg9uftEtK68zIIXRLj
	hQEnAd0TgTQyIoY+Tgga3Z5WyGg4ghBac7xmeYH7NgnzhPILIii4EXRz+9ZBcYKcRonxRGdtmarr7
	hCrqZa6vmZlP/UoaWZ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4lW-008puv-Sp; Thu, 12 Aug 2021 07:04:35 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4k5-008pVd-4w
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:03:06 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so13821871pjs.0
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yYJmC8dtsCMeStVeTrbrdJoVJLOoeMSEJTUV9zFrKTI=;
 b=bYpRUzFYs+fioMuKgkWQ57yUY3aNC85Mk8o8E0LWuxPA+K9RHqwEmBzlLchBzMeVVg
 y2EkXM4+z8qI68TsNw/njTuxtJUqeyvGgJ8R0y3GO0mUSLr2GYDnfP7mxYvE5ryA3hdC
 0uIdTSGcCpMKiILDPD0mGsekiowcx9+MUHSgvaNNqR+CflZibgZQf9HSm8F7nJvu1D3T
 VzLc0csbl3eURdrLdtkpmZvBp79yk4uWJW+WEGNtPiRfp+1xfh7Clrw1zskhAQyLFTQn
 4LXsU+JTw/5XUZKS3w7GUAdM5n4WTdPjICmoXUZ3l2DKfeDj+sexiGRCP3ooXlufVWbJ
 XwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yYJmC8dtsCMeStVeTrbrdJoVJLOoeMSEJTUV9zFrKTI=;
 b=S1rpZMJK0mIdBx4IQipCz1In0zOOAW+mM9OaKtnjc2aBeXGcj86KgCK/kIpSUbrDNL
 TzWhdAKQdfnJJm2TyrepcI2Lx6Pamp42NDtuIfV13CpIyiGvp0u5Cbdw0Go2rnxaJ7UF
 XkoIWfi/PfvGkvLU8JAPWWXeLVVEOSacuHOHC8B6rsPvP7I4wHpoQr3VNQC3aNja00Oy
 YWIrrbdzCIgORKDto2F39bPNc5jFl1L/yCkjQmiktZAccmSejRCBC/bDdlOyrCO9FnaC
 yHkiExtwPYKIWmN/xaonfMO0zBAsvCykVXfiapVj5g1DYAu+OvfSZ1r6RASxKQmkyaqE
 9z1Q==
X-Gm-Message-State: AOAM530lmjcAO9jiYxZiPWToQB/RPgxg+MVAu3SmF0X4gFKNx6RatmiJ
 5rPOOEH7DmHdJc9zT3n1NNs=
X-Google-Smtp-Source: ABdhPJwYRDfF4odgyO0KEl0aWNeU6jbHlYmEt84uDn71ejKp5egEdtHLLizvabmME6bzE+SVcTpCzg==
X-Received: by 2002:a62:ee16:0:b029:2fe:ffcf:775a with SMTP id
 e22-20020a62ee160000b02902feffcf775amr2636417pfi.59.1628751784144; 
 Thu, 12 Aug 2021 00:03:04 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:03:03 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 05/15] mtd: spi-nor: macronix: Add support for
 mx66uw2g345gx0
Date: Thu, 12 Aug 2021 15:01:25 +0000
Message-Id: <20210812150135.4005-6-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000305_233334_D8B2A23F 
X-CRM114-Status: GOOD (  11.66  )
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

Add support for mx66uw2g345gx0 spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id 
c2943c
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
mx66uw2g345gx0
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx66uw2g345gx0
zynq> hexdump mx66uw2g345gx0
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 7fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 7987 0001 1284 e200 04cc 4667
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
0000130 4514 8098 0643 001f dc21 ffff          
000013c

 drivers/mtd/spi-nor/macronix.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 85780e9da3bf..28cff9843781 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -187,6 +187,11 @@ static const struct flash_info macronix_parts[] = {
 			       SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
 			       SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
 		.fixups = &octaflash_fixups },
+	{ "mx66uw2g345gx0", INFO(0xc2943c, 0, 64 * 1024, 4096,
+				 SECT_4K | SPI_NOR_PARSE_SFDP |
+				 SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
+				 SPI_NOR_OCTAL_DTR_PP | SPI_NOR_4B_OPCODES)
+		.fixups = &octaflash_fixups },
 };
 
 static void macronix_default_init(struct spi_nor *nor)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
