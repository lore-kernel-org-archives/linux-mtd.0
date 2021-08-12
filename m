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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D873C4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:20:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE13603E7
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FE13603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atpSGe0+15O5HQ6iOHi3xbQXLU48PSr+0SdcdjIriWY=; b=H7MgPF3tVq3MFI
	EAI95cpADSEVbts1vFHM+13fdbecJKm1BtooNYzvV2AYeUI4MiPKxvTP1ccyPc9yr/fcImp90glrp
	EkeejG75f/LEMF6T1k39PEQCtLFiuxpymTRuoesY4IEGwTlZ0NH911/JFaQSJtB4BQsyCgxDFQeWa
	MTad7nrLL11lAAdPRL+covHnCuDZo8T+sOHqkYf8kSfD23LEzzaL2doxKqAmHL1u//iusknmkSuTg
	LrcEVRU1ajnQp8ie5n8HbMHgl+Sy0QGg12r9maOc5UiTt30hR0I3yzv+rjTKf3KN+cQmNVZe8YWvq
	Y8eJ+r5+n+kbHcRKxXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE50X-008ss0-9L; Thu, 12 Aug 2021 07:20:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4kZ-008pd0-QW
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:03:37 +0000
Received: by mail-pl1-x634.google.com with SMTP id a20so6131819plm.0
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BDhaCgK4u8WaPVmkpJ3XJ46iIGCANtlHhQFxxStGgKE=;
 b=hwnRP6nogiQ4cA9x4/ENGOG2UFmAuhsBOL9jG41H7JlTAXteSw5N7pKwo6oGq38L/y
 gAQTloo/w8Gcfrf1c58rKPkxFBp3t1azflu17FV5iUszFxpecHJrg5or4/7Hyx9BfgZq
 OrLvpwynzd5iS5MhRa3ML2cOxsA8OcRYIhVVlCAX++1U+NtvjfEtcB7AacZD65wV8Xiv
 NkPIMHk68HSpDl5jRax+s1SLmzIyNDo72sn5HZeGvPGs8eXYwSrEeFXttL2ht1clKYKw
 MPc9nhCcp2QQLhL/lof1s2mfxfWnKn6ZK4nzvSrGcwF4yI/3mMwrgjUbSPoGFXHnvAuu
 rpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BDhaCgK4u8WaPVmkpJ3XJ46iIGCANtlHhQFxxStGgKE=;
 b=TzclWEGT7joMCpT3yL0OQSeZnKgnLbub6iEtuYhfcflxxQjWVFDNTCuFN8E+cdg0/P
 iBA90HAhO/xQUKKGvLnANYaGRTw4DreHp03eHKprQxUtf3dGWd3Xpo/9CW1yOFH5Cq0f
 7RVeNF5a3PkopLun74pGg2kl8atmxwD+IYWvVLvL+bOhT1p9VPGAf4q4Y5PTUaEUPmr1
 zrtSozLpUGdXLM6PvpMS5wyC1NqPCzcgkUQm61X80Ylhnr0NjpEVfc0bj9YANaIG1io3
 QrEkCy7uxoOs3ejy0xE7DtAIOxnHWQHTF/y52+YJfwSEydpJwRexTWfbDi3V/iEVxf3i
 VlBA==
X-Gm-Message-State: AOAM533x2QIaVJFGbvdb2QdggYlGx2lF4Wy96FbN1bgutu6ruivAhsIh
 k6rDUxiTXO/du13bvSB55yU=
X-Google-Smtp-Source: ABdhPJxmHAoN2Vjz/ZSaJJq1YIxW2EZIT0G3Ts1uasbAmg9+QAwNxYMql2Mvf4bOcXU1ClT76woPHA==
X-Received: by 2002:a65:51c9:: with SMTP id i9mr2587009pgq.102.1628751815440; 
 Thu, 12 Aug 2021 00:03:35 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:03:35 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 15/15] mtd: spi-nor: macronix: Add support for mx25uw6345g
Date: Thu, 12 Aug 2021 15:01:35 +0000
Message-Id: <20210812150135.4005-16-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000335_908122_F70C6567 
X-CRM114-Status: GOOD (  11.34  )
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

Add support for mx25uw6345g spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c28437
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
mx25uw6345g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25uw6345g
zynq> hexdump mx25uw6345g 
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 ffff ffff ffff ffff
0000040 20e5 ff8a ffff 03ff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 798b 0001 128f c400 04cc 4667
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
index 01537b5af132..05dc3210a556 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -237,6 +237,11 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
 			      SPI_NOR_4B_OPCODES)
 		.fixups = &octaflash_fixups },
+	{ "mx25uw6345g", INFO(0xc28437, 0, 2 * 1024, 4096,
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
