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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D137AC4338F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 910EA60EB2
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Aug 2021 07:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 910EA60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLpsIw/CPHfps5Lw9QaNs0Fd+yQmpNfckAlm4M/YQKY=; b=BywOyIo5qU4WI6
	GKOeiCD2cJgJKWKxBzlgBql6TmshUijTjnvU8WmaZM10tZfoYgFeVvy7nF/ou3VZrM9grAm4jlONN
	tXMe8rRlk/JmtX66Bl8yvuSqAjxZ+lFcolYz7VJsVBRqMFNVoZlLrCDBV7xerTbiXIUa3pacjiOf0
	uchGPo8Lu8cm3zSHHB2cPFTOkpka3cJECbnM0cs7lrz2WwKE5J+wzmJKcYoYQuck/mOcO7eL7fzE+
	6YqsEiFthYnEVYASL7229FKS1F+pq4AMFWg+1zsmy32/BJ40eQmWiXTZxq4fO2YRbI0cvoNunEfk2
	82mQLrWJUOGTA61vQjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE4oV-008qj3-Mo; Thu, 12 Aug 2021 07:07:39 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE4kE-008pXj-C5
 for linux-mtd@lists.infradead.org; Thu, 12 Aug 2021 07:03:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id j1so7836427pjv.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Aug 2021 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=B+Snt4HahB7/QZnIyHPlWcBlbpB9TITn3ewoOh/jV6E=;
 b=dnSXu50AkWax+NB5SkiNG0Qt4bX/KVsUg2vqTQVaWTmnGi2BcX3px2uH62P+GOHvRd
 36WwKPsR1IIpWv+kVnPdHdiVoyyn5AmauR2na4xY6ypnlOq5OEIzkcUuMMRBtQzUd5wB
 BkMa+smgu9HKV/OyhNt/YVxPKg8tuNPGuo6/s+HN4hlPEIAkNcIzfc4CgPsl/WicxqAQ
 LJthnIUzEgijHA+KKtzMiu5Qdjmm381ird2jlATzMyl7MhGlMRzQt9yhx7VTuv27vIHe
 54rKHT1ifY77Ip/QrtH3SRtWye21fkR+LSMfL7LBTeu0DLNLipyq4NdNzUkGriWskCpK
 Gspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=B+Snt4HahB7/QZnIyHPlWcBlbpB9TITn3ewoOh/jV6E=;
 b=obFsuLwEFQms7ira4lyxhaRR8cpP9aWvSjDoXWeGHR15F6/Z17QJVu9fz8aeOeojmB
 FPDcK+/rCa1uwJ0ppnyzqas4l8KQ0U1t97KT+vd+AM84nv0R22Qpzog5b/ycT/7gRAfa
 aB/Sf2k6Qpjl+juarpAndv6rSkkXIixg8lhyXvDq9WzFbxRbtpBSQy7NmXo29p35k+eW
 tn8pRI6h9oqgO6NIcI/Qe4BrE4krUsyAM8xdbFQYKC3IaLTncw+iH33YVpQ8Pb9cXgwp
 MNWwu3wcM/84XuGVATkvfrcb5vyqStbCyKsINuca9Ny0OOQpQwcZHo62DsL7hB7ctcHt
 XOeA==
X-Gm-Message-State: AOAM532gUl5tK6iM+5pYYfj6z1RIL6x8OVImQogGz4//7FguKA/QNLBB
 DRorX/X33qPLfQC4Q7gqAJ4=
X-Google-Smtp-Source: ABdhPJwxs0KQVPzy68bQYRKFi67N+i7Qkwm8XKdiklSHUQwc/RxcYB9pj+jnl4AC4pQFItWOOxgjdA==
X-Received: by 2002:aa7:80d9:0:b029:2ed:49fa:6dc5 with SMTP id
 a25-20020aa780d90000b02902ed49fa6dc5mr2745493pfn.3.1628751793319; 
 Thu, 12 Aug 2021 00:03:13 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.gmail.com with ESMTPSA id o127sm1946962pfb.48.2021.08.12.00.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 00:03:12 -0700 (PDT)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 vigneshr@ti.com, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v6 08/15] mtd: spi-nor: macronix: Add support for mx25uw51245g
Date: Thu, 12 Aug 2021 15:01:28 +0000
Message-Id: <20210812150135.4005-9-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
References: <20210812150135.4005-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_000314_448750_09C8D22F 
X-CRM114-Status: GOOD (  11.61  )
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

Add support for mx25uw51245g spi-nor chips.

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2813a
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
macronix
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
mx25uw51245g
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/sfdp > mx25uw51245g
zynq> hexdump mx25uw51245g
0000000 4653 5044 0108 fd04 0700 1401 0040 ff00
0000010 0187 1c01 0090 ff00 000a 0801 0100 ff00
0000020 0005 0501 0120 ff00 0084 0201 0134 ff00
0000030 0000 0000 0000 0000 0000 0000 0000 0000
0000040 20e5 ff8a ffff 1fff ff00 ff00 ff00 ff00
0000050 ffee ffff ffff ff00 ffff ff00 200c d810
0000060 ff00 ff00 6987 0001 1282 e200 0277 3867
0000070 b030 b030 bdf4 5cd5 0000 ff00 1010 2000
0000080 0000 0000 0000 217c 0048 0000 0000 8888
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
0000130 3510 8098 0643 000f dc21 ffff          
000013c

 drivers/mtd/spi-nor/macronix.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 0f257b8b0bec..22d508fb98aa 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -202,6 +202,11 @@ static const struct flash_info macronix_parts[] = {
 			      SPI_NOR_OCTAL_DTR_READ | SPI_NOR_OCTAL_DTR_PP |
 			      SPI_NOR_4B_OPCODES)
 		.fixups = &octaflash_fixups },
+	{ "mx25uw51245g", INFO(0xc2813a, 0, 16 * 1024, 4096,
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
