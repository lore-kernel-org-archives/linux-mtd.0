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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95102C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:11:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43BB760EE2
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43BB760EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EjgWeiDQnu6y8ST63E9rE5BwjUXgXB9DW9gIczB/iw=; b=NMhYrvt4vfTNPL
	7nx7yjRf2ERW8CsL63j41dS7AjLGfdca/A4MO5HnKxFp20TCmCPZ2XJbWQWpzbCfbcrh1ClXEYKO+
	l650fCfa8RBsjUDGBMteTDMJmm6uBGo64ghbWVYrp/kxjZLVFSTJzCvtoNGkk21gY+6dbhpT5tUyW
	dXGusjsJ6Dvxbm8Td81opfk4+B6KMVep15IwzEbSYGuYY+jNDL92F6rmttGXcKhhg3Y9taF0PLSkj
	8BIeyzZZlQmlBKRZEduTghOSGCtyq2a8NhB/bqbYjZEwsFEV7R5MG98z0boLi0VlTF6JOutYptHLI
	KWqzZTtnQyo/OpxqnCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4rD-008rIU-N2; Thu, 12 Aug 2021 07:10:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4kK-008pZ1-0p
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:03:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d1so6102271pll.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vt5YQvgMyhu6k4grL+0mv+h5JEEQS1aI/U3FzTGO3ik=;
 b=ZIWykiSseBgvX6i+Ep60PQJPE33oVNurr3PYFQFXJPyz3c2+rMMmKQDu9Mz5tAb26q
 CDM+TrJYYFNS5ZAIPv2pJb+pRUT1cxUrsP3VIfUAbbmFwljLr/aWwha7rtxfLCREd5ro
 R1KhVv7Udxpwy+aEjxo/OVACBLera1g4MHPPHLyro7FyuPeO+R29u6DB40bBE6fnQ0om
 yS3afBEjAGSAGstyrByWg5Bl99I/55h4mrxCVxcO3cyOvkB/qTFWpkOAvcbdbVI4TXtK
 iz8l0+10mTZOOvf6H8PhW8KVCgNwHXBef86eYTSA4tO+yI7/mhzcjOZcMop3SVLWUxzw
 mPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vt5YQvgMyhu6k4grL+0mv+h5JEEQS1aI/U3FzTGO3ik=;
 b=J344DLH/N/7SlqDiftL/HTrSolnFHYBMwAAbebUljzOIp0LnoC7T705M7Dq90SyViK
 FW55XHvEqc0eV0/bfsD7iomg2MSApqxHhjwqCoR+m2lIIxnzPdrc1EMgwovzjqavHcEV
 NkSQg+z4SHwf2eG5omgFJA2QYwlpgdy6juTHsLGnnk5kUK0C8pGOvkPMhyA0rN5g+L+e
 TVLkFrcG8MkYslcy9m5lIjukJnZogSyPxU6RggPqSsTJs75NLc/KytUCr1bSReee5QWB
 WthsBTt4jhVFvKEs/eOxAbZmA0quviSeeaAuJ9lu0I9bxKXWgIKxp6aNmiDa3lEvsCW4
 508g==
X-Gm-Message-State: AOAM533royhdG7GiTkjknkctanQNGVkJu8+ADiLPnkPBpnk/7IxwCefq
 y3gJ1WpwFIWTNrtdNZHt2Qc=
X-Google-Smtp-Source: ABdhPJzs/C7zgEotrTDE+HHjqz+fS8Mum3ohaUkErO1t8sjw+O988NYQs4EmN58hwfZDYuBRTVl/Zg==
X-Received: by 2002:a17:902:7c87:b029:12c:8f2d:4238 with SMTP id
 y7-20020a1709027c87b029012c8f2d4238mr2557870pll.50.1628751798963; 
 Thu, 12 Aug 2021 00:03:18 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:03:18 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 10/15] mtd: spi-nor: macronix: Add support for mx25um25645g
Date: Thu, 12 Aug 2021 15:01:30 +0000
Message-Id: <20210812150135.4005-11-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000320_137928_B591C157 
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

Add support for mx25um25645g spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28039
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
mx25um25645g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25um25645g
zynq> hexdump mx25um25645g 
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 0fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 7987 0001 1284 d200 02cc 3867
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
index e305fc256424..758b736ec580 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -212,6 +212,11 @@ static const struct flash_info macronix_parts[] = {
 			       SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
 			       SPI_NOR_4B_OPCODES)
 		.fixups = &octaflash_fixups },
+	{ "mx25um25645g", INFO(0xc28039, 0, 8 * 1024, 4096,
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
